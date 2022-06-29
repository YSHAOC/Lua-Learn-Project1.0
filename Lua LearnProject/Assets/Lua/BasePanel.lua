--�����������
Object:subClass("BasePanel")

BasePanel.panelObj = nil
--�൱��ģ��һ���ֵ� ��Ϊ �ؼ��� ֵΪ�ؼ�����
BasePanel.controls = {}
--�¼�������ʶ
BasePanel.isInitEvent = false

function BasePanel:Init(name)
    if self.panelObj == nil then
        --������ʵ��������ķ���
        self.panelObj = ABMgr:LoadRes("ui", name, typeof(GameObject))  ---------------����UIԤ����
        self.panelObj.transform:SetParent(Canvas, false) --------------------------���ø�����λ�ã�

        
        --GetComponentsInChildren
        --�ҵ�����UI�ؼ� ������
        print(self.panelObj)
        local allControls = self.panelObj:GetComponentsInChildren(typeof(UIBehaviour)) -----------�õ������пؼ�
        --�������һЩ����������˵û��UI�ؼ� 
        --Ϊ�˱��� �Ҹ������ÿؼ� ���Ƕ�һ������ ƴ���ʱ �ؼ�����һ�����淶��
        --Button btn����
        --Toggle tog����
        --Image img����
        --ScrollRect sv����
        for i = 0, allControls.Length-1 do  ---------------------------------����õ������пؼ� ��һ�������ʽ���浽һ��Ԫ����
            local controlName = allControls[i].name   --��������֣������������GameObject)
            --�������ֵĹ��� ȥ�ҿؼ� ���������������� �Ŵ�����
            if string.find(controlName, "btn") ~= nil or 
               string.find(controlName, "tog") ~= nil or 
               string.find(controlName, "img") ~= nil or 
               string.find(controlName, "sv") ~= nil or
               string.find(controlName, "txt") ~= nil then
                --Ϊ���������ڵõ�ʱ�� �ܹ� ȷ���õĿؼ����� ����������Ҫ�洢����
                --���÷��� Type �õ� �ؼ������� 
                local typeName = allControls[i]:GetType().Name  --����󶨵Ŀؼ�������
                --�������һ�������� ���ڶ��UI�ؼ� ���ָ��ǵ����� 
                --���ᱻ�浽һ�������� �൱�����б��������ʽ
                --���մ洢��ʽ 
                --{ btnRole���ؼ��������� = { Image���ؼ������ͣ� = ������ؼ���, Button ���ؼ������ͣ�= ������ؼ��� },
                --  togItem���ؼ��������� = { Toggle = �ؼ�}  }
                if self.controls[controlName] ~= nil then
                    --ͨ���Զ�����������ʽ ȥ��һ���µ� ����Ա������
                    self.controls[controlName][typeName] = allControls[i]
                else
                    self.controls[controlName] = {[typeName] = allControls[i]}
                end
            end
        end
    end
end

--�õ��ؼ� ���� �ؼ�������������� �� �ؼ��������ַ������� Button Image Toggle
function BasePanel:GetControl(name, typeName)
    if self.controls[name] ~= nil then
        local sameNameControls = self.controls[name]
        if sameNameControls[typeName] ~= nil then
            return sameNameControls[typeName]
        end
    end
    return nil
end

function BasePanel:ShowMe(name)
    self:Init(name)
    self.panelObj:SetActive(true)
end

function BasePanel:HideMe()
    self.panelObj:SetActive(false)
end
