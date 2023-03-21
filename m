Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AE086C2CB6
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Mar 2023 09:41:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peXY5-0002b1-B2; Tue, 21 Mar 2023 04:40:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <batmanustc@gmail.com>)
 id 1peXY3-0002ab-8x
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 04:40:51 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <batmanustc@gmail.com>)
 id 1peXY1-0000oH-3t
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 04:40:51 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 p3-20020a17090a74c300b0023f69bc7a68so10693140pjl.4
 for <qemu-devel@nongnu.org>; Tue, 21 Mar 2023 01:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679388047;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=nVA2X1R5NHUFBhIFiJsXVMAjmx3AHqae3chBSYA0qlg=;
 b=CJUHRFXGt7tlQjrzyq2d0+Z+nZijwCo3bl055soG0gWWNsGI313+dStTDZHcbiToAq
 LK+tUCrdvhcqEpYNaFQyiXzBZPXHkrR45xmL+LDf5Li/70E4e6HWK2aDf4d7A/Kzuye+
 Z0+qSySKBwuEk5eEmcQxALmQXeh/Ixlf6Ufq/lJWB3jPce/cXjbvSpi3jckc3Hp+EfV9
 bIwYhhf183G3tgafsatMQ+1vSo093u2HhVufXNr5+2gT5dUgbmM87zPBAvTwrMro98tQ
 FGmUCEPf9d9XyCeBstPdUdFqbgZMYys9LnhMzDV0CprEbXUruin1G6az1ugViFo4PMqZ
 nyKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679388047;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nVA2X1R5NHUFBhIFiJsXVMAjmx3AHqae3chBSYA0qlg=;
 b=hPfTbW9zrB4TdWF3SJtDIqDsdymibJxDgd3oXfrFFv1iQvQIGvgCjXUjeh7ZU1iC3R
 ZH/w72mZII1SmQrwo3a2kuEEnBysrk45KnzytHEoUSDeQlAyT+JvCzybUk0Ok4y6Une6
 GrdxGCiCcnT2dRLZYB+cIGV5rVgQKioi0zq9iHyWJqjlqqswbdsPJBavHgw5M39jwxTI
 2vJLFwgyv4+let1J9PeRkJnMAq31HyFRr7KV44S2n/XUvclBKaKtu8BSvCnDt7jfgvMp
 H/i0f8BXvnehXyt9DRL4ZqBQOSTPaiGxJoNyp4zlpwz6KM+scNm5ulXiGgQ2HYWeytFY
 VKMw==
X-Gm-Message-State: AO0yUKVnGn+Wh/ztmiu3RTlA6TmLjw/h9e7vsGSrHqJmHV0t39fLM24C
 x77IMiZFWhkfB9S0FTUCqK5rjk3+ItwE795UvIPY6q8R0zhInA==
X-Google-Smtp-Source: AK7set/BcXaMho6ndfCGpxJ+7nrAKrltYjUZgofecZompfQ5ApxvYlFA8J2Eb3YfPhGU0DiUpz4h+15kg1abBe3M90A=
X-Received: by 2002:a17:90a:d78f:b0:23f:76a1:61fb with SMTP id
 z15-20020a17090ad78f00b0023f76a161fbmr423444pju.6.1679388046731; Tue, 21 Mar
 2023 01:40:46 -0700 (PDT)
MIME-Version: 1.0
From: Simon Jones <batmanustc@gmail.com>
Date: Tue, 21 Mar 2023 08:40:34 +0000
Message-ID: <CAOE=1Z26OKgDB1=9M0rSjT50GbNi2BR7gbQ_5EbAoMRNGgP9og@mail.gmail.com>
Subject: [BUG][KVM_SET_USER_MEMORY_REGION] KVM_SET_USER_MEMORY_REGION failed
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000f72d1f05f764ff6f"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=batmanustc@gmail.com; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--000000000000f72d1f05f764ff6f
Content-Type: text/plain; charset="UTF-8"

Hi all,

I start a VM in openstack, and openstack use libvirt to start qemu VM, but
now log show this ERROR.
Is there any one know this?

The ERROR log from /var/log/libvirt/qemu/instance-0000000e.log
```
2023-03-14T10:09:17.674114Z qemu-system-x86_64: kvm_set_user_memory_region:
KVM_SET_USER_MEMORY_REGION failed, slot=4, start=0xfffffffffe000000,
size=0x2000: Invalid argument
kvm_set_phys_mem: error registering slot: Invalid argument
2023-03-14 10:09:18.198+0000: shutting down, reason=crashed
```

The xml file
```
root@c1c2:~# cat /etc/libvirt/qemu/instance-0000000e.xml
<!--
WARNING: THIS IS AN AUTO-GENERATED FILE. CHANGES TO IT ARE LIKELY TO BE
OVERWRITTEN AND LOST. Changes to this xml configuration should be made
using:
  virsh edit instance-0000000e
or other application using the libvirt API.
-->

<domain type='kvm'>
  <name>instance-0000000e</name>
  <uuid>ff91d2dc-69a1-43ef-abde-c9e4e9a0305b</uuid>
  <metadata>
    <nova:instance xmlns:nova="http://openstack.org/xmlns/libvirt/nova/1.1">
      <nova:package version="25.1.0"/>
      <nova:name>provider-instance</nova:name>
      <nova:creationTime>2023-03-14 10:09:13</nova:creationTime>
      <nova:flavor name="cirros-os-dpu-test-1">
        <nova:memory>64</nova:memory>
        <nova:disk>1</nova:disk>
        <nova:swap>0</nova:swap>
        <nova:ephemeral>0</nova:ephemeral>
        <nova:vcpus>1</nova:vcpus>
      </nova:flavor>
      <nova:owner>
        <nova:user uuid="ff627ad39ed94479b9c5033bc462cf78">admin</nova:user>
        <nova:project
uuid="512866f9994f4ad8916d8539a7cdeec9">admin</nova:project>
      </nova:owner>
      <nova:root type="image" uuid="9e58cb69-316a-4093-9f23-c1d1bd8edffe"/>
      <nova:ports>
        <nova:port uuid="77c1dc00-af39-4463-bea0-12808f4bc340">
          <nova:ip type="fixed" address="172.1.1.43" ipVersion="4"/>
        </nova:port>
      </nova:ports>
    </nova:instance>
  </metadata>
  <memory unit='KiB'>65536</memory>
  <currentMemory unit='KiB'>65536</currentMemory>
  <vcpu placement='static'>1</vcpu>
  <sysinfo type='smbios'>
    <system>
      <entry name='manufacturer'>OpenStack Foundation</entry>
      <entry name='product'>OpenStack Nova</entry>
      <entry name='version'>25.1.0</entry>
      <entry name='serial'>ff91d2dc-69a1-43ef-abde-c9e4e9a0305b</entry>
      <entry name='uuid'>ff91d2dc-69a1-43ef-abde-c9e4e9a0305b</entry>
      <entry name='family'>Virtual Machine</entry>
    </system>
  </sysinfo>
  <os>
    <type arch='x86_64' machine='pc-i440fx-6.2'>hvm</type>
    <boot dev='hd'/>
    <smbios mode='sysinfo'/>
  </os>
  <features>
    <acpi/>
    <apic/>
    <vmcoreinfo state='on'/>
  </features>
  <cpu mode='host-model' check='partial'>
    <topology sockets='1' dies='1' cores='1' threads='1'/>
  </cpu>
  <clock offset='utc'>
    <timer name='pit' tickpolicy='delay'/>
    <timer name='rtc' tickpolicy='catchup'/>
    <timer name='hpet' present='no'/>
  </clock>
  <on_poweroff>destroy</on_poweroff>
  <on_reboot>restart</on_reboot>
  <on_crash>destroy</on_crash>
  <devices>
    <emulator>/usr/bin/qemu-system-x86_64</emulator>
    <disk type='file' device='disk'>
      <driver name='qemu' type='qcow2' cache='none'/>
      <source
file='/var/lib/nova/instances/ff91d2dc-69a1-43ef-abde-c9e4e9a0305b/disk'/>
      <target dev='vda' bus='virtio'/>
      <address type='pci' domain='0x0000' bus='0x00' slot='0x03'
function='0x0'/>
    </disk>
    <controller type='usb' index='0' model='piix3-uhci'>
      <address type='pci' domain='0x0000' bus='0x00' slot='0x01'
function='0x2'/>
    </controller>
    <controller type='pci' index='0' model='pci-root'/>
    <interface type='hostdev' managed='yes'>
      <mac address='fa:16:3e:aa:d9:23'/>
      <source>
        <address type='pci' domain='0x0000' bus='0x01' slot='0x00'
function='0x5'/>
      </source>
      <address type='pci' domain='0x0000' bus='0x00' slot='0x04'
function='0x0'/>
    </interface>
    <serial type='pty'>
      <log
file='/var/lib/nova/instances/ff91d2dc-69a1-43ef-abde-c9e4e9a0305b/console.log'
append='off'/>
      <target type='isa-serial' port='0'>
        <model name='isa-serial'/>
      </target>
    </serial>
    <console type='pty'>
      <log
file='/var/lib/nova/instances/ff91d2dc-69a1-43ef-abde-c9e4e9a0305b/console.log'
append='off'/>
      <target type='serial' port='0'/>
    </console>
    <input type='tablet' bus='usb'>
      <address type='usb' bus='0' port='1'/>
    </input>
    <input type='mouse' bus='ps2'/>
    <input type='keyboard' bus='ps2'/>
    <graphics type='vnc' port='-1' autoport='yes' listen='0.0.0.0'>
      <listen type='address' address='0.0.0.0'/>
    </graphics>
    <audio id='1' type='none'/>
    <video>
      <model type='virtio' heads='1' primary='yes'/>
      <address type='pci' domain='0x0000' bus='0x00' slot='0x02'
function='0x0'/>
    </video>
    <hostdev mode='subsystem' type='pci' managed='yes'>
      <source>
        <address domain='0x0000' bus='0x01' slot='0x00' function='0x6'/>
      </source>
      <address type='pci' domain='0x0000' bus='0x00' slot='0x05'
function='0x0'/>
    </hostdev>
    <memballoon model='virtio'>
      <stats period='10'/>
      <address type='pci' domain='0x0000' bus='0x00' slot='0x06'
function='0x0'/>
    </memballoon>
    <rng model='virtio'>
      <backend model='random'>/dev/urandom</backend>
      <address type='pci' domain='0x0000' bus='0x00' slot='0x07'
function='0x0'/>
    </rng>
  </devices>
</domain>
```


----
Simon Jones

--000000000000f72d1f05f764ff6f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><br><br>Hi all,<br><br>I start a VM in openstack, and=
 openstack use libvirt to start qemu VM, but now log show this ERROR.<br>Is=
 there any one know this?<br><br>The ERROR log from /var/log/libvirt/qemu/i=
nstance-0000000e.log<br>```<br>2023-03-14T10:09:17.674114Z qemu-system-x86_=
64: kvm_set_user_memory_region: KVM_SET_USER_MEMORY_REGION failed, slot=3D4=
, start=3D0xfffffffffe000000, size=3D0x2000: Invalid argument<br>kvm_set_ph=
ys_mem: error registering slot: Invalid argument<br>2023-03-14 10:09:18.198=
+0000: shutting down, reason=3Dcrashed<br>```<br><br>The xml file<br>```<br=
>root@c1c2:~# cat /etc/libvirt/qemu/instance-0000000e.xml<br>&lt;!--<br>WAR=
NING: THIS IS AN AUTO-GENERATED FILE. CHANGES TO IT ARE LIKELY TO BE<br>OVE=
RWRITTEN AND LOST. Changes to this xml configuration should be made using:<=
br>=C2=A0 virsh edit instance-0000000e<br>or other application using the li=
bvirt API.<br>--&gt;<br><br>&lt;domain type=3D&#39;kvm&#39;&gt;<br>=C2=A0 &=
lt;name&gt;instance-0000000e&lt;/name&gt;<br>=C2=A0 &lt;uuid&gt;ff91d2dc-69=
a1-43ef-abde-c9e4e9a0305b&lt;/uuid&gt;<br>=C2=A0 &lt;metadata&gt;<br>=C2=A0=
 =C2=A0 &lt;nova:instance xmlns:nova=3D&quot;<a href=3D"http://openstack.or=
g/xmlns/libvirt/nova/1.1">http://openstack.org/xmlns/libvirt/nova/1.1</a>&q=
uot;&gt;<br>=C2=A0 =C2=A0 =C2=A0 &lt;nova:package version=3D&quot;25.1.0&qu=
ot;/&gt;<br>=C2=A0 =C2=A0 =C2=A0 &lt;nova:name&gt;provider-instance&lt;/nov=
a:name&gt;<br>=C2=A0 =C2=A0 =C2=A0 &lt;nova:creationTime&gt;2023-03-14 10:0=
9:13&lt;/nova:creationTime&gt;<br>=C2=A0 =C2=A0 =C2=A0 &lt;nova:flavor name=
=3D&quot;cirros-os-dpu-test-1&quot;&gt;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;=
nova:memory&gt;64&lt;/nova:memory&gt;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;no=
va:disk&gt;1&lt;/nova:disk&gt;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;nova:swap=
&gt;0&lt;/nova:swap&gt;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;nova:ephemeral&g=
t;0&lt;/nova:ephemeral&gt;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;nova:vcpus&gt=
;1&lt;/nova:vcpus&gt;<br>=C2=A0 =C2=A0 =C2=A0 &lt;/nova:flavor&gt;<br>=C2=
=A0 =C2=A0 =C2=A0 &lt;nova:owner&gt;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;nov=
a:user uuid=3D&quot;ff627ad39ed94479b9c5033bc462cf78&quot;&gt;admin&lt;/nov=
a:user&gt;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;nova:project uuid=3D&quot;512=
866f9994f4ad8916d8539a7cdeec9&quot;&gt;admin&lt;/nova:project&gt;<br>=C2=A0=
 =C2=A0 =C2=A0 &lt;/nova:owner&gt;<br>=C2=A0 =C2=A0 =C2=A0 &lt;nova:root ty=
pe=3D&quot;image&quot; uuid=3D&quot;9e58cb69-316a-4093-9f23-c1d1bd8edffe&qu=
ot;/&gt;<br>=C2=A0 =C2=A0 =C2=A0 &lt;nova:ports&gt;<br>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 &lt;nova:port uuid=3D&quot;77c1dc00-af39-4463-bea0-12808f4bc340&quo=
t;&gt;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;nova:ip type=3D&quot;fixed=
&quot; address=3D&quot;172.1.1.43&quot; ipVersion=3D&quot;4&quot;/&gt;<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;/nova:port&gt;<br>=C2=A0 =C2=A0 =C2=A0 &lt;=
/nova:ports&gt;<br>=C2=A0 =C2=A0 &lt;/nova:instance&gt;<br>=C2=A0 &lt;/meta=
data&gt;<br>=C2=A0 &lt;memory unit=3D&#39;KiB&#39;&gt;65536&lt;/memory&gt;<=
br>=C2=A0 &lt;currentMemory unit=3D&#39;KiB&#39;&gt;65536&lt;/currentMemory=
&gt;<br>=C2=A0 &lt;vcpu placement=3D&#39;static&#39;&gt;1&lt;/vcpu&gt;<br>=
=C2=A0 &lt;sysinfo type=3D&#39;smbios&#39;&gt;<br>=C2=A0 =C2=A0 &lt;system&=
gt;<br>=C2=A0 =C2=A0 =C2=A0 &lt;entry name=3D&#39;manufacturer&#39;&gt;Open=
Stack Foundation&lt;/entry&gt;<br>=C2=A0 =C2=A0 =C2=A0 &lt;entry name=3D&#3=
9;product&#39;&gt;OpenStack Nova&lt;/entry&gt;<br>=C2=A0 =C2=A0 =C2=A0 &lt;=
entry name=3D&#39;version&#39;&gt;25.1.0&lt;/entry&gt;<br>=C2=A0 =C2=A0 =C2=
=A0 &lt;entry name=3D&#39;serial&#39;&gt;ff91d2dc-69a1-43ef-abde-c9e4e9a030=
5b&lt;/entry&gt;<br>=C2=A0 =C2=A0 =C2=A0 &lt;entry name=3D&#39;uuid&#39;&gt=
;ff91d2dc-69a1-43ef-abde-c9e4e9a0305b&lt;/entry&gt;<br>=C2=A0 =C2=A0 =C2=A0=
 &lt;entry name=3D&#39;family&#39;&gt;Virtual Machine&lt;/entry&gt;<br>=C2=
=A0 =C2=A0 &lt;/system&gt;<br>=C2=A0 &lt;/sysinfo&gt;<br>=C2=A0 &lt;os&gt;<=
br>=C2=A0 =C2=A0 &lt;type arch=3D&#39;x86_64&#39; machine=3D&#39;pc-i440fx-=
6.2&#39;&gt;hvm&lt;/type&gt;<br>=C2=A0 =C2=A0 &lt;boot dev=3D&#39;hd&#39;/&=
gt;<br>=C2=A0 =C2=A0 &lt;smbios mode=3D&#39;sysinfo&#39;/&gt;<br>=C2=A0 &lt=
;/os&gt;<br>=C2=A0 &lt;features&gt;<br>=C2=A0 =C2=A0 &lt;acpi/&gt;<br>=C2=
=A0 =C2=A0 &lt;apic/&gt;<br>=C2=A0 =C2=A0 &lt;vmcoreinfo state=3D&#39;on&#3=
9;/&gt;<br>=C2=A0 &lt;/features&gt;<br>=C2=A0 &lt;cpu mode=3D&#39;host-mode=
l&#39; check=3D&#39;partial&#39;&gt;<br>=C2=A0 =C2=A0 &lt;topology sockets=
=3D&#39;1&#39; dies=3D&#39;1&#39; cores=3D&#39;1&#39; threads=3D&#39;1&#39;=
/&gt;<br>=C2=A0 &lt;/cpu&gt;<br>=C2=A0 &lt;clock offset=3D&#39;utc&#39;&gt;=
<br>=C2=A0 =C2=A0 &lt;timer name=3D&#39;pit&#39; tickpolicy=3D&#39;delay&#3=
9;/&gt;<br>=C2=A0 =C2=A0 &lt;timer name=3D&#39;rtc&#39; tickpolicy=3D&#39;c=
atchup&#39;/&gt;<br>=C2=A0 =C2=A0 &lt;timer name=3D&#39;hpet&#39; present=
=3D&#39;no&#39;/&gt;<br>=C2=A0 &lt;/clock&gt;<br>=C2=A0 &lt;on_poweroff&gt;=
destroy&lt;/on_poweroff&gt;<br>=C2=A0 &lt;on_reboot&gt;restart&lt;/on_reboo=
t&gt;<br>=C2=A0 &lt;on_crash&gt;destroy&lt;/on_crash&gt;<br>=C2=A0 &lt;devi=
ces&gt;<br>=C2=A0 =C2=A0 &lt;emulator&gt;/usr/bin/qemu-system-x86_64&lt;/em=
ulator&gt;<br>=C2=A0 =C2=A0 &lt;disk type=3D&#39;file&#39; device=3D&#39;di=
sk&#39;&gt;<br>=C2=A0 =C2=A0 =C2=A0 &lt;driver name=3D&#39;qemu&#39; type=
=3D&#39;qcow2&#39; cache=3D&#39;none&#39;/&gt;<br>=C2=A0 =C2=A0 =C2=A0 &lt;=
source file=3D&#39;/var/lib/nova/instances/ff91d2dc-69a1-43ef-abde-c9e4e9a0=
305b/disk&#39;/&gt;<br>=C2=A0 =C2=A0 =C2=A0 &lt;target dev=3D&#39;vda&#39; =
bus=3D&#39;virtio&#39;/&gt;<br>=C2=A0 =C2=A0 =C2=A0 &lt;address type=3D&#39=
;pci&#39; domain=3D&#39;0x0000&#39; bus=3D&#39;0x00&#39; slot=3D&#39;0x03&#=
39; function=3D&#39;0x0&#39;/&gt;<br>=C2=A0 =C2=A0 &lt;/disk&gt;<br>=C2=A0 =
=C2=A0 &lt;controller type=3D&#39;usb&#39; index=3D&#39;0&#39; model=3D&#39=
;piix3-uhci&#39;&gt;<br>=C2=A0 =C2=A0 =C2=A0 &lt;address type=3D&#39;pci&#3=
9; domain=3D&#39;0x0000&#39; bus=3D&#39;0x00&#39; slot=3D&#39;0x01&#39; fun=
ction=3D&#39;0x2&#39;/&gt;<br>=C2=A0 =C2=A0 &lt;/controller&gt;<br>=C2=A0 =
=C2=A0 &lt;controller type=3D&#39;pci&#39; index=3D&#39;0&#39; model=3D&#39=
;pci-root&#39;/&gt;<br>=C2=A0 =C2=A0 &lt;interface type=3D&#39;hostdev&#39;=
 managed=3D&#39;yes&#39;&gt;<br>=C2=A0 =C2=A0 =C2=A0 &lt;mac address=3D&#39=
;fa:16:3e:aa:d9:23&#39;/&gt;<br>=C2=A0 =C2=A0 =C2=A0 &lt;source&gt;<br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 &lt;address type=3D&#39;pci&#39; domain=3D&#39;0x0=
000&#39; bus=3D&#39;0x01&#39; slot=3D&#39;0x00&#39; function=3D&#39;0x5&#39=
;/&gt;<br>=C2=A0 =C2=A0 =C2=A0 &lt;/source&gt;<br>=C2=A0 =C2=A0 =C2=A0 &lt;=
address type=3D&#39;pci&#39; domain=3D&#39;0x0000&#39; bus=3D&#39;0x00&#39;=
 slot=3D&#39;0x04&#39; function=3D&#39;0x0&#39;/&gt;<br>=C2=A0 =C2=A0 &lt;/=
interface&gt;<br>=C2=A0 =C2=A0 &lt;serial type=3D&#39;pty&#39;&gt;<br>=C2=
=A0 =C2=A0 =C2=A0 &lt;log file=3D&#39;/var/lib/nova/instances/ff91d2dc-69a1=
-43ef-abde-c9e4e9a0305b/console.log&#39; append=3D&#39;off&#39;/&gt;<br>=C2=
=A0 =C2=A0 =C2=A0 &lt;target type=3D&#39;isa-serial&#39; port=3D&#39;0&#39;=
&gt;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;model name=3D&#39;isa-serial&#39;/&=
gt;<br>=C2=A0 =C2=A0 =C2=A0 &lt;/target&gt;<br>=C2=A0 =C2=A0 &lt;/serial&gt=
;<br>=C2=A0 =C2=A0 &lt;console type=3D&#39;pty&#39;&gt;<br>=C2=A0 =C2=A0 =
=C2=A0 &lt;log file=3D&#39;/var/lib/nova/instances/ff91d2dc-69a1-43ef-abde-=
c9e4e9a0305b/console.log&#39; append=3D&#39;off&#39;/&gt;<br>=C2=A0 =C2=A0 =
=C2=A0 &lt;target type=3D&#39;serial&#39; port=3D&#39;0&#39;/&gt;<br>=C2=A0=
 =C2=A0 &lt;/console&gt;<br>=C2=A0 =C2=A0 &lt;input type=3D&#39;tablet&#39;=
 bus=3D&#39;usb&#39;&gt;<br>=C2=A0 =C2=A0 =C2=A0 &lt;address type=3D&#39;us=
b&#39; bus=3D&#39;0&#39; port=3D&#39;1&#39;/&gt;<br>=C2=A0 =C2=A0 &lt;/inpu=
t&gt;<br>=C2=A0 =C2=A0 &lt;input type=3D&#39;mouse&#39; bus=3D&#39;ps2&#39;=
/&gt;<br>=C2=A0 =C2=A0 &lt;input type=3D&#39;keyboard&#39; bus=3D&#39;ps2&#=
39;/&gt;<br>=C2=A0 =C2=A0 &lt;graphics type=3D&#39;vnc&#39; port=3D&#39;-1&=
#39; autoport=3D&#39;yes&#39; listen=3D&#39;0.0.0.0&#39;&gt;<br>=C2=A0 =C2=
=A0 =C2=A0 &lt;listen type=3D&#39;address&#39; address=3D&#39;0.0.0.0&#39;/=
&gt;<br>=C2=A0 =C2=A0 &lt;/graphics&gt;<br>=C2=A0 =C2=A0 &lt;audio id=3D&#3=
9;1&#39; type=3D&#39;none&#39;/&gt;<br>=C2=A0 =C2=A0 &lt;video&gt;<br>=C2=
=A0 =C2=A0 =C2=A0 &lt;model type=3D&#39;virtio&#39; heads=3D&#39;1&#39; pri=
mary=3D&#39;yes&#39;/&gt;<br>=C2=A0 =C2=A0 =C2=A0 &lt;address type=3D&#39;p=
ci&#39; domain=3D&#39;0x0000&#39; bus=3D&#39;0x00&#39; slot=3D&#39;0x02&#39=
; function=3D&#39;0x0&#39;/&gt;<br>=C2=A0 =C2=A0 &lt;/video&gt;<br>=C2=A0 =
=C2=A0 &lt;hostdev mode=3D&#39;subsystem&#39; type=3D&#39;pci&#39; managed=
=3D&#39;yes&#39;&gt;<br>=C2=A0 =C2=A0 =C2=A0 &lt;source&gt;<br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &lt;address domain=3D&#39;0x0000&#39; bus=3D&#39;0x01&#39=
; slot=3D&#39;0x00&#39; function=3D&#39;0x6&#39;/&gt;<br>=C2=A0 =C2=A0 =C2=
=A0 &lt;/source&gt;<br>=C2=A0 =C2=A0 =C2=A0 &lt;address type=3D&#39;pci&#39=
; domain=3D&#39;0x0000&#39; bus=3D&#39;0x00&#39; slot=3D&#39;0x05&#39; func=
tion=3D&#39;0x0&#39;/&gt;<br>=C2=A0 =C2=A0 &lt;/hostdev&gt;<br>=C2=A0 =C2=
=A0 &lt;memballoon model=3D&#39;virtio&#39;&gt;<br>=C2=A0 =C2=A0 =C2=A0 &lt=
;stats period=3D&#39;10&#39;/&gt;<br>=C2=A0 =C2=A0 =C2=A0 &lt;address type=
=3D&#39;pci&#39; domain=3D&#39;0x0000&#39; bus=3D&#39;0x00&#39; slot=3D&#39=
;0x06&#39; function=3D&#39;0x0&#39;/&gt;<br>=C2=A0 =C2=A0 &lt;/memballoon&g=
t;<br>=C2=A0 =C2=A0 &lt;rng model=3D&#39;virtio&#39;&gt;<br>=C2=A0 =C2=A0 =
=C2=A0 &lt;backend model=3D&#39;random&#39;&gt;/dev/urandom&lt;/backend&gt;=
<br>=C2=A0 =C2=A0 =C2=A0 &lt;address type=3D&#39;pci&#39; domain=3D&#39;0x0=
000&#39; bus=3D&#39;0x00&#39; slot=3D&#39;0x07&#39; function=3D&#39;0x0&#39=
;/&gt;<br>=C2=A0 =C2=A0 &lt;/rng&gt;<br>=C2=A0 &lt;/devices&gt;<br>&lt;/dom=
ain&gt;<br>```<br></div><div><br></div><div><br></div><div><div dir=3D"ltr"=
 class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"l=
tr"><div><div dir=3D"ltr"><div>----</div>Simon Jones</div></div></div></div=
></div></div>

--000000000000f72d1f05f764ff6f--

