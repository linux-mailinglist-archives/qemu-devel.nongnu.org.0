Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F16B66C5F31
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Mar 2023 06:50:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfDpR-00015f-Nd; Thu, 23 Mar 2023 01:49:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <batmanustc@gmail.com>)
 id 1pfDpK-00015V-NE
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 01:49:32 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <batmanustc@gmail.com>)
 id 1pfDpI-0004S7-DB
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 01:49:30 -0400
Received: by mail-pl1-x634.google.com with SMTP id c18so21331209ple.11
 for <qemu-devel@nongnu.org>; Wed, 22 Mar 2023 22:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679550565;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=T7TN4zKLGBegtUBzC1mqyqjEZgsaCUOBfhsMVSPiBaI=;
 b=jXTnAz6OOavFHS4TncGqN/N1VMNePTJSthGswM2RBdETV5Yq+JPZR9EgCW/T/d+QBt
 s0CRgnhIbQL+e1ZQSXJ2PyCcuNbjPufrb/jR17CXcHJhZLBoHs8cmyIpPMoFZtWgoUxo
 aVplW/8tVMFObMonlJe8qJHLH5re9+NdCuCCWHS7D3pSoGCuK7/9HR+orvYZmRCktnPn
 mW4OPYXQdj17Oa9WqfrrnVTASjMuxE7w8RH1tQlPdQffgU2WXAM6Cxzc57f2+fo2E/Yt
 zpLV20vcZSlikRH/Xj9hNohr0PA+NkyBz8yu5mtAWNTUItRcoQSIcx24b/B4Z9WxDpwX
 jjPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679550565;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=T7TN4zKLGBegtUBzC1mqyqjEZgsaCUOBfhsMVSPiBaI=;
 b=EMsEOLc4O7cSd5DorgtPG8dITtX6jiEX4RvvM4G5ErlLAzHmg6vBcJI/BqB+JBvfI1
 fGtItEXDupp1TNeuBqKCNteiJZWXnPfYr/Zk+Okb/VjjjM86vLgXMEYBPHydvafXU5ZH
 gIZGtyn9x6y+pxB9auKqBU8O01Vw/pPN0UYTjwmMGHI/8tsk3TkgsNQyPTlp8mWcX14Q
 22Dki4pS4mdyg4MXl38dm8eK7nYv7uZ6G9o82HPD7sW89vrrHQNc7V+8x296+y4MI196
 ItxLhxUb9e3k3oADWhYp/mmen0y31uU7v7VDCzuYySZnG8HLbXoPQbxnaY1TLlvm3vAm
 /UhA==
X-Gm-Message-State: AO0yUKXYyibOT3+L+6KAxTgyxzdIXNf/xpgnZxcpFN2OArDnNwn3Q52y
 vIDJymFM2F+r7hXxtIbuB2Fy8LVw3JN2OOfj0dVAVG4oCfiD0w==
X-Google-Smtp-Source: AK7set8hc5iiv1oJPW6ycz04ly7VDKzhNwedBrH2eAZ2T+uUlQcnScnS0hZFlBGMF5VEgHwawXjVFQ9KAzSR6/y/FZ0=
X-Received: by 2002:a17:90a:b286:b0:23d:19cf:f9d4 with SMTP id
 c6-20020a17090ab28600b0023d19cff9d4mr2028940pjr.6.1679550565184; Wed, 22 Mar
 2023 22:49:25 -0700 (PDT)
MIME-Version: 1.0
References: <CAOE=1Z26OKgDB1=9M0rSjT50GbNi2BR7gbQ_5EbAoMRNGgP9og@mail.gmail.com>
In-Reply-To: <CAOE=1Z26OKgDB1=9M0rSjT50GbNi2BR7gbQ_5EbAoMRNGgP9og@mail.gmail.com>
From: Simon Jones <batmanustc@gmail.com>
Date: Thu, 23 Mar 2023 05:49:13 +0000
Message-ID: <CAOE=1Z0wfg1iZHcJ5XnNEdp_-Wor09mzacOq7uLH=6TiFhQyrw@mail.gmail.com>
Subject: Re: [BUG][KVM_SET_USER_MEMORY_REGION] KVM_SET_USER_MEMORY_REGION
 failed
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000d1f8c305f78ad691"
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=batmanustc@gmail.com; helo=mail-pl1-x634.google.com
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

--000000000000d1f8c305f78ad691
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This is happened in ubuntu22.04.

QEMU is install by apt like this:
apt install -y qemu qemu-kvm qemu-system

and QEMU version is 6.2.0

----
Simon Jones


Simon Jones <batmanustc@gmail.com> =E4=BA=8E2023=E5=B9=B43=E6=9C=8821=E6=97=
=A5=E5=91=A8=E4=BA=8C 08:40=E5=86=99=E9=81=93=EF=BC=9A

>
>
> Hi all,
>
> I start a VM in openstack, and openstack use libvirt to start qemu VM, bu=
t
> now log show this ERROR.
> Is there any one know this?
>
> The ERROR log from /var/log/libvirt/qemu/instance-0000000e.log
> ```
> 2023-03-14T10:09:17.674114Z qemu-system-x86_64:
> kvm_set_user_memory_region: KVM_SET_USER_MEMORY_REGION failed, slot=3D4,
> start=3D0xfffffffffe000000, size=3D0x2000: Invalid argument
> kvm_set_phys_mem: error registering slot: Invalid argument
> 2023-03-14 10:09:18.198+0000: shutting down, reason=3Dcrashed
> ```
>
> The xml file
> ```
> root@c1c2:~# cat /etc/libvirt/qemu/instance-0000000e.xml
> <!--
> WARNING: THIS IS AN AUTO-GENERATED FILE. CHANGES TO IT ARE LIKELY TO BE
> OVERWRITTEN AND LOST. Changes to this xml configuration should be made
> using:
>   virsh edit instance-0000000e
> or other application using the libvirt API.
> -->
>
> <domain type=3D'kvm'>
>   <name>instance-0000000e</name>
>   <uuid>ff91d2dc-69a1-43ef-abde-c9e4e9a0305b</uuid>
>   <metadata>
>     <nova:instance xmlns:nova=3D"http://openstack.org/xmlns/libvirt/nova/=
1.1
> ">
>       <nova:package version=3D"25.1.0"/>
>       <nova:name>provider-instance</nova:name>
>       <nova:creationTime>2023-03-14 10:09:13</nova:creationTime>
>       <nova:flavor name=3D"cirros-os-dpu-test-1">
>         <nova:memory>64</nova:memory>
>         <nova:disk>1</nova:disk>
>         <nova:swap>0</nova:swap>
>         <nova:ephemeral>0</nova:ephemeral>
>         <nova:vcpus>1</nova:vcpus>
>       </nova:flavor>
>       <nova:owner>
>         <nova:user
> uuid=3D"ff627ad39ed94479b9c5033bc462cf78">admin</nova:user>
>         <nova:project
> uuid=3D"512866f9994f4ad8916d8539a7cdeec9">admin</nova:project>
>       </nova:owner>
>       <nova:root type=3D"image" uuid=3D"9e58cb69-316a-4093-9f23-c1d1bd8ed=
ffe"/>
>       <nova:ports>
>         <nova:port uuid=3D"77c1dc00-af39-4463-bea0-12808f4bc340">
>           <nova:ip type=3D"fixed" address=3D"172.1.1.43" ipVersion=3D"4"/=
>
>         </nova:port>
>       </nova:ports>
>     </nova:instance>
>   </metadata>
>   <memory unit=3D'KiB'>65536</memory>
>   <currentMemory unit=3D'KiB'>65536</currentMemory>
>   <vcpu placement=3D'static'>1</vcpu>
>   <sysinfo type=3D'smbios'>
>     <system>
>       <entry name=3D'manufacturer'>OpenStack Foundation</entry>
>       <entry name=3D'product'>OpenStack Nova</entry>
>       <entry name=3D'version'>25.1.0</entry>
>       <entry name=3D'serial'>ff91d2dc-69a1-43ef-abde-c9e4e9a0305b</entry>
>       <entry name=3D'uuid'>ff91d2dc-69a1-43ef-abde-c9e4e9a0305b</entry>
>       <entry name=3D'family'>Virtual Machine</entry>
>     </system>
>   </sysinfo>
>   <os>
>     <type arch=3D'x86_64' machine=3D'pc-i440fx-6.2'>hvm</type>
>     <boot dev=3D'hd'/>
>     <smbios mode=3D'sysinfo'/>
>   </os>
>   <features>
>     <acpi/>
>     <apic/>
>     <vmcoreinfo state=3D'on'/>
>   </features>
>   <cpu mode=3D'host-model' check=3D'partial'>
>     <topology sockets=3D'1' dies=3D'1' cores=3D'1' threads=3D'1'/>
>   </cpu>
>   <clock offset=3D'utc'>
>     <timer name=3D'pit' tickpolicy=3D'delay'/>
>     <timer name=3D'rtc' tickpolicy=3D'catchup'/>
>     <timer name=3D'hpet' present=3D'no'/>
>   </clock>
>   <on_poweroff>destroy</on_poweroff>
>   <on_reboot>restart</on_reboot>
>   <on_crash>destroy</on_crash>
>   <devices>
>     <emulator>/usr/bin/qemu-system-x86_64</emulator>
>     <disk type=3D'file' device=3D'disk'>
>       <driver name=3D'qemu' type=3D'qcow2' cache=3D'none'/>
>       <source
> file=3D'/var/lib/nova/instances/ff91d2dc-69a1-43ef-abde-c9e4e9a0305b/disk=
'/>
>       <target dev=3D'vda' bus=3D'virtio'/>
>       <address type=3D'pci' domain=3D'0x0000' bus=3D'0x00' slot=3D'0x03'
> function=3D'0x0'/>
>     </disk>
>     <controller type=3D'usb' index=3D'0' model=3D'piix3-uhci'>
>       <address type=3D'pci' domain=3D'0x0000' bus=3D'0x00' slot=3D'0x01'
> function=3D'0x2'/>
>     </controller>
>     <controller type=3D'pci' index=3D'0' model=3D'pci-root'/>
>     <interface type=3D'hostdev' managed=3D'yes'>
>       <mac address=3D'fa:16:3e:aa:d9:23'/>
>       <source>
>         <address type=3D'pci' domain=3D'0x0000' bus=3D'0x01' slot=3D'0x00=
'
> function=3D'0x5'/>
>       </source>
>       <address type=3D'pci' domain=3D'0x0000' bus=3D'0x00' slot=3D'0x04'
> function=3D'0x0'/>
>     </interface>
>     <serial type=3D'pty'>
>       <log
> file=3D'/var/lib/nova/instances/ff91d2dc-69a1-43ef-abde-c9e4e9a0305b/cons=
ole.log'
> append=3D'off'/>
>       <target type=3D'isa-serial' port=3D'0'>
>         <model name=3D'isa-serial'/>
>       </target>
>     </serial>
>     <console type=3D'pty'>
>       <log
> file=3D'/var/lib/nova/instances/ff91d2dc-69a1-43ef-abde-c9e4e9a0305b/cons=
ole.log'
> append=3D'off'/>
>       <target type=3D'serial' port=3D'0'/>
>     </console>
>     <input type=3D'tablet' bus=3D'usb'>
>       <address type=3D'usb' bus=3D'0' port=3D'1'/>
>     </input>
>     <input type=3D'mouse' bus=3D'ps2'/>
>     <input type=3D'keyboard' bus=3D'ps2'/>
>     <graphics type=3D'vnc' port=3D'-1' autoport=3D'yes' listen=3D'0.0.0.0=
'>
>       <listen type=3D'address' address=3D'0.0.0.0'/>
>     </graphics>
>     <audio id=3D'1' type=3D'none'/>
>     <video>
>       <model type=3D'virtio' heads=3D'1' primary=3D'yes'/>
>       <address type=3D'pci' domain=3D'0x0000' bus=3D'0x00' slot=3D'0x02'
> function=3D'0x0'/>
>     </video>
>     <hostdev mode=3D'subsystem' type=3D'pci' managed=3D'yes'>
>       <source>
>         <address domain=3D'0x0000' bus=3D'0x01' slot=3D'0x00' function=3D=
'0x6'/>
>       </source>
>       <address type=3D'pci' domain=3D'0x0000' bus=3D'0x00' slot=3D'0x05'
> function=3D'0x0'/>
>     </hostdev>
>     <memballoon model=3D'virtio'>
>       <stats period=3D'10'/>
>       <address type=3D'pci' domain=3D'0x0000' bus=3D'0x00' slot=3D'0x06'
> function=3D'0x0'/>
>     </memballoon>
>     <rng model=3D'virtio'>
>       <backend model=3D'random'>/dev/urandom</backend>
>       <address type=3D'pci' domain=3D'0x0000' bus=3D'0x00' slot=3D'0x07'
> function=3D'0x0'/>
>     </rng>
>   </devices>
> </domain>
> ```
>
>
> ----
> Simon Jones
>

--000000000000d1f8c305f78ad691
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>This is happened in ubuntu22.04.</div><div><br></div>=
<div>QEMU is install by apt like this:</div><div>apt install -y qemu qemu-k=
vm qemu-system</div><div><br></div><div>and QEMU version is 6.2.0<br></div>=
<div><br></div><div><div dir=3D"ltr" class=3D"gmail_signature" data-smartma=
il=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr"><div>----</di=
v>Simon Jones</div></div></div></div></div><br></div><br><div class=3D"gmai=
l_quote"><div dir=3D"ltr" class=3D"gmail_attr">Simon Jones &lt;<a href=3D"m=
ailto:batmanustc@gmail.com">batmanustc@gmail.com</a>&gt; =E4=BA=8E2023=E5=
=B9=B43=E6=9C=8821=E6=97=A5=E5=91=A8=E4=BA=8C 08:40=E5=86=99=E9=81=93=EF=BC=
=9A<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"=
ltr"><div><br><br>Hi all,<br><br>I start a VM in openstack, and openstack u=
se libvirt to start qemu VM, but now log show this ERROR.<br>Is there any o=
ne know this?<br><br>The ERROR log from /var/log/libvirt/qemu/instance-0000=
000e.log<br>```<br>2023-03-14T10:09:17.674114Z qemu-system-x86_64: kvm_set_=
user_memory_region: KVM_SET_USER_MEMORY_REGION failed, slot=3D4, start=3D0x=
fffffffffe000000, size=3D0x2000: Invalid argument<br>kvm_set_phys_mem: erro=
r registering slot: Invalid argument<br>2023-03-14 10:09:18.198+0000: shutt=
ing down, reason=3Dcrashed<br>```<br><br>The xml file<br>```<br>root@c1c2:~=
# cat /etc/libvirt/qemu/instance-0000000e.xml<br>&lt;!--<br>WARNING: THIS I=
S AN AUTO-GENERATED FILE. CHANGES TO IT ARE LIKELY TO BE<br>OVERWRITTEN AND=
 LOST. Changes to this xml configuration should be made using:<br>=C2=A0 vi=
rsh edit instance-0000000e<br>or other application using the libvirt API.<b=
r>--&gt;<br><br>&lt;domain type=3D&#39;kvm&#39;&gt;<br>=C2=A0 &lt;name&gt;i=
nstance-0000000e&lt;/name&gt;<br>=C2=A0 &lt;uuid&gt;ff91d2dc-69a1-43ef-abde=
-c9e4e9a0305b&lt;/uuid&gt;<br>=C2=A0 &lt;metadata&gt;<br>=C2=A0 =C2=A0 &lt;=
nova:instance xmlns:nova=3D&quot;<a href=3D"http://openstack.org/xmlns/libv=
irt/nova/1.1" target=3D"_blank">http://openstack.org/xmlns/libvirt/nova/1.1=
</a>&quot;&gt;<br>=C2=A0 =C2=A0 =C2=A0 &lt;nova:package version=3D&quot;25.=
1.0&quot;/&gt;<br>=C2=A0 =C2=A0 =C2=A0 &lt;nova:name&gt;provider-instance&l=
t;/nova:name&gt;<br>=C2=A0 =C2=A0 =C2=A0 &lt;nova:creationTime&gt;2023-03-1=
4 10:09:13&lt;/nova:creationTime&gt;<br>=C2=A0 =C2=A0 =C2=A0 &lt;nova:flavo=
r name=3D&quot;cirros-os-dpu-test-1&quot;&gt;<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &lt;nova:memory&gt;64&lt;/nova:memory&gt;<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &lt;nova:disk&gt;1&lt;/nova:disk&gt;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt=
;nova:swap&gt;0&lt;/nova:swap&gt;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;nova:e=
phemeral&gt;0&lt;/nova:ephemeral&gt;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;nov=
a:vcpus&gt;1&lt;/nova:vcpus&gt;<br>=C2=A0 =C2=A0 =C2=A0 &lt;/nova:flavor&gt=
;<br>=C2=A0 =C2=A0 =C2=A0 &lt;nova:owner&gt;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 &lt;nova:user uuid=3D&quot;ff627ad39ed94479b9c5033bc462cf78&quot;&gt;admin=
&lt;/nova:user&gt;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;nova:project uuid=3D&=
quot;512866f9994f4ad8916d8539a7cdeec9&quot;&gt;admin&lt;/nova:project&gt;<b=
r>=C2=A0 =C2=A0 =C2=A0 &lt;/nova:owner&gt;<br>=C2=A0 =C2=A0 =C2=A0 &lt;nova=
:root type=3D&quot;image&quot; uuid=3D&quot;9e58cb69-316a-4093-9f23-c1d1bd8=
edffe&quot;/&gt;<br>=C2=A0 =C2=A0 =C2=A0 &lt;nova:ports&gt;<br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &lt;nova:port uuid=3D&quot;77c1dc00-af39-4463-bea0-12808f=
4bc340&quot;&gt;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;nova:ip type=3D&=
quot;fixed&quot; address=3D&quot;172.1.1.43&quot; ipVersion=3D&quot;4&quot;=
/&gt;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;/nova:port&gt;<br>=C2=A0 =C2=A0 =
=C2=A0 &lt;/nova:ports&gt;<br>=C2=A0 =C2=A0 &lt;/nova:instance&gt;<br>=C2=
=A0 &lt;/metadata&gt;<br>=C2=A0 &lt;memory unit=3D&#39;KiB&#39;&gt;65536&lt=
;/memory&gt;<br>=C2=A0 &lt;currentMemory unit=3D&#39;KiB&#39;&gt;65536&lt;/=
currentMemory&gt;<br>=C2=A0 &lt;vcpu placement=3D&#39;static&#39;&gt;1&lt;/=
vcpu&gt;<br>=C2=A0 &lt;sysinfo type=3D&#39;smbios&#39;&gt;<br>=C2=A0 =C2=A0=
 &lt;system&gt;<br>=C2=A0 =C2=A0 =C2=A0 &lt;entry name=3D&#39;manufacturer&=
#39;&gt;OpenStack Foundation&lt;/entry&gt;<br>=C2=A0 =C2=A0 =C2=A0 &lt;entr=
y name=3D&#39;product&#39;&gt;OpenStack Nova&lt;/entry&gt;<br>=C2=A0 =C2=A0=
 =C2=A0 &lt;entry name=3D&#39;version&#39;&gt;25.1.0&lt;/entry&gt;<br>=C2=
=A0 =C2=A0 =C2=A0 &lt;entry name=3D&#39;serial&#39;&gt;ff91d2dc-69a1-43ef-a=
bde-c9e4e9a0305b&lt;/entry&gt;<br>=C2=A0 =C2=A0 =C2=A0 &lt;entry name=3D&#3=
9;uuid&#39;&gt;ff91d2dc-69a1-43ef-abde-c9e4e9a0305b&lt;/entry&gt;<br>=C2=A0=
 =C2=A0 =C2=A0 &lt;entry name=3D&#39;family&#39;&gt;Virtual Machine&lt;/ent=
ry&gt;<br>=C2=A0 =C2=A0 &lt;/system&gt;<br>=C2=A0 &lt;/sysinfo&gt;<br>=C2=
=A0 &lt;os&gt;<br>=C2=A0 =C2=A0 &lt;type arch=3D&#39;x86_64&#39; machine=3D=
&#39;pc-i440fx-6.2&#39;&gt;hvm&lt;/type&gt;<br>=C2=A0 =C2=A0 &lt;boot dev=
=3D&#39;hd&#39;/&gt;<br>=C2=A0 =C2=A0 &lt;smbios mode=3D&#39;sysinfo&#39;/&=
gt;<br>=C2=A0 &lt;/os&gt;<br>=C2=A0 &lt;features&gt;<br>=C2=A0 =C2=A0 &lt;a=
cpi/&gt;<br>=C2=A0 =C2=A0 &lt;apic/&gt;<br>=C2=A0 =C2=A0 &lt;vmcoreinfo sta=
te=3D&#39;on&#39;/&gt;<br>=C2=A0 &lt;/features&gt;<br>=C2=A0 &lt;cpu mode=
=3D&#39;host-model&#39; check=3D&#39;partial&#39;&gt;<br>=C2=A0 =C2=A0 &lt;=
topology sockets=3D&#39;1&#39; dies=3D&#39;1&#39; cores=3D&#39;1&#39; threa=
ds=3D&#39;1&#39;/&gt;<br>=C2=A0 &lt;/cpu&gt;<br>=C2=A0 &lt;clock offset=3D&=
#39;utc&#39;&gt;<br>=C2=A0 =C2=A0 &lt;timer name=3D&#39;pit&#39; tickpolicy=
=3D&#39;delay&#39;/&gt;<br>=C2=A0 =C2=A0 &lt;timer name=3D&#39;rtc&#39; tic=
kpolicy=3D&#39;catchup&#39;/&gt;<br>=C2=A0 =C2=A0 &lt;timer name=3D&#39;hpe=
t&#39; present=3D&#39;no&#39;/&gt;<br>=C2=A0 &lt;/clock&gt;<br>=C2=A0 &lt;o=
n_poweroff&gt;destroy&lt;/on_poweroff&gt;<br>=C2=A0 &lt;on_reboot&gt;restar=
t&lt;/on_reboot&gt;<br>=C2=A0 &lt;on_crash&gt;destroy&lt;/on_crash&gt;<br>=
=C2=A0 &lt;devices&gt;<br>=C2=A0 =C2=A0 &lt;emulator&gt;/usr/bin/qemu-syste=
m-x86_64&lt;/emulator&gt;<br>=C2=A0 =C2=A0 &lt;disk type=3D&#39;file&#39; d=
evice=3D&#39;disk&#39;&gt;<br>=C2=A0 =C2=A0 =C2=A0 &lt;driver name=3D&#39;q=
emu&#39; type=3D&#39;qcow2&#39; cache=3D&#39;none&#39;/&gt;<br>=C2=A0 =C2=
=A0 =C2=A0 &lt;source file=3D&#39;/var/lib/nova/instances/ff91d2dc-69a1-43e=
f-abde-c9e4e9a0305b/disk&#39;/&gt;<br>=C2=A0 =C2=A0 =C2=A0 &lt;target dev=
=3D&#39;vda&#39; bus=3D&#39;virtio&#39;/&gt;<br>=C2=A0 =C2=A0 =C2=A0 &lt;ad=
dress type=3D&#39;pci&#39; domain=3D&#39;0x0000&#39; bus=3D&#39;0x00&#39; s=
lot=3D&#39;0x03&#39; function=3D&#39;0x0&#39;/&gt;<br>=C2=A0 =C2=A0 &lt;/di=
sk&gt;<br>=C2=A0 =C2=A0 &lt;controller type=3D&#39;usb&#39; index=3D&#39;0&=
#39; model=3D&#39;piix3-uhci&#39;&gt;<br>=C2=A0 =C2=A0 =C2=A0 &lt;address t=
ype=3D&#39;pci&#39; domain=3D&#39;0x0000&#39; bus=3D&#39;0x00&#39; slot=3D&=
#39;0x01&#39; function=3D&#39;0x2&#39;/&gt;<br>=C2=A0 =C2=A0 &lt;/controlle=
r&gt;<br>=C2=A0 =C2=A0 &lt;controller type=3D&#39;pci&#39; index=3D&#39;0&#=
39; model=3D&#39;pci-root&#39;/&gt;<br>=C2=A0 =C2=A0 &lt;interface type=3D&=
#39;hostdev&#39; managed=3D&#39;yes&#39;&gt;<br>=C2=A0 =C2=A0 =C2=A0 &lt;ma=
c address=3D&#39;fa:16:3e:aa:d9:23&#39;/&gt;<br>=C2=A0 =C2=A0 =C2=A0 &lt;so=
urce&gt;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;address type=3D&#39;pci&#39; do=
main=3D&#39;0x0000&#39; bus=3D&#39;0x01&#39; slot=3D&#39;0x00&#39; function=
=3D&#39;0x5&#39;/&gt;<br>=C2=A0 =C2=A0 =C2=A0 &lt;/source&gt;<br>=C2=A0 =C2=
=A0 =C2=A0 &lt;address type=3D&#39;pci&#39; domain=3D&#39;0x0000&#39; bus=
=3D&#39;0x00&#39; slot=3D&#39;0x04&#39; function=3D&#39;0x0&#39;/&gt;<br>=
=C2=A0 =C2=A0 &lt;/interface&gt;<br>=C2=A0 =C2=A0 &lt;serial type=3D&#39;pt=
y&#39;&gt;<br>=C2=A0 =C2=A0 =C2=A0 &lt;log file=3D&#39;/var/lib/nova/instan=
ces/ff91d2dc-69a1-43ef-abde-c9e4e9a0305b/console.log&#39; append=3D&#39;off=
&#39;/&gt;<br>=C2=A0 =C2=A0 =C2=A0 &lt;target type=3D&#39;isa-serial&#39; p=
ort=3D&#39;0&#39;&gt;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;model name=3D&#39;=
isa-serial&#39;/&gt;<br>=C2=A0 =C2=A0 =C2=A0 &lt;/target&gt;<br>=C2=A0 =C2=
=A0 &lt;/serial&gt;<br>=C2=A0 =C2=A0 &lt;console type=3D&#39;pty&#39;&gt;<b=
r>=C2=A0 =C2=A0 =C2=A0 &lt;log file=3D&#39;/var/lib/nova/instances/ff91d2dc=
-69a1-43ef-abde-c9e4e9a0305b/console.log&#39; append=3D&#39;off&#39;/&gt;<b=
r>=C2=A0 =C2=A0 =C2=A0 &lt;target type=3D&#39;serial&#39; port=3D&#39;0&#39=
;/&gt;<br>=C2=A0 =C2=A0 &lt;/console&gt;<br>=C2=A0 =C2=A0 &lt;input type=3D=
&#39;tablet&#39; bus=3D&#39;usb&#39;&gt;<br>=C2=A0 =C2=A0 =C2=A0 &lt;addres=
s type=3D&#39;usb&#39; bus=3D&#39;0&#39; port=3D&#39;1&#39;/&gt;<br>=C2=A0 =
=C2=A0 &lt;/input&gt;<br>=C2=A0 =C2=A0 &lt;input type=3D&#39;mouse&#39; bus=
=3D&#39;ps2&#39;/&gt;<br>=C2=A0 =C2=A0 &lt;input type=3D&#39;keyboard&#39; =
bus=3D&#39;ps2&#39;/&gt;<br>=C2=A0 =C2=A0 &lt;graphics type=3D&#39;vnc&#39;=
 port=3D&#39;-1&#39; autoport=3D&#39;yes&#39; listen=3D&#39;0.0.0.0&#39;&gt=
;<br>=C2=A0 =C2=A0 =C2=A0 &lt;listen type=3D&#39;address&#39; address=3D&#3=
9;0.0.0.0&#39;/&gt;<br>=C2=A0 =C2=A0 &lt;/graphics&gt;<br>=C2=A0 =C2=A0 &lt=
;audio id=3D&#39;1&#39; type=3D&#39;none&#39;/&gt;<br>=C2=A0 =C2=A0 &lt;vid=
eo&gt;<br>=C2=A0 =C2=A0 =C2=A0 &lt;model type=3D&#39;virtio&#39; heads=3D&#=
39;1&#39; primary=3D&#39;yes&#39;/&gt;<br>=C2=A0 =C2=A0 =C2=A0 &lt;address =
type=3D&#39;pci&#39; domain=3D&#39;0x0000&#39; bus=3D&#39;0x00&#39; slot=3D=
&#39;0x02&#39; function=3D&#39;0x0&#39;/&gt;<br>=C2=A0 =C2=A0 &lt;/video&gt=
;<br>=C2=A0 =C2=A0 &lt;hostdev mode=3D&#39;subsystem&#39; type=3D&#39;pci&#=
39; managed=3D&#39;yes&#39;&gt;<br>=C2=A0 =C2=A0 =C2=A0 &lt;source&gt;<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;address domain=3D&#39;0x0000&#39; bus=3D&#3=
9;0x01&#39; slot=3D&#39;0x00&#39; function=3D&#39;0x6&#39;/&gt;<br>=C2=A0 =
=C2=A0 =C2=A0 &lt;/source&gt;<br>=C2=A0 =C2=A0 =C2=A0 &lt;address type=3D&#=
39;pci&#39; domain=3D&#39;0x0000&#39; bus=3D&#39;0x00&#39; slot=3D&#39;0x05=
&#39; function=3D&#39;0x0&#39;/&gt;<br>=C2=A0 =C2=A0 &lt;/hostdev&gt;<br>=
=C2=A0 =C2=A0 &lt;memballoon model=3D&#39;virtio&#39;&gt;<br>=C2=A0 =C2=A0 =
=C2=A0 &lt;stats period=3D&#39;10&#39;/&gt;<br>=C2=A0 =C2=A0 =C2=A0 &lt;add=
ress type=3D&#39;pci&#39; domain=3D&#39;0x0000&#39; bus=3D&#39;0x00&#39; sl=
ot=3D&#39;0x06&#39; function=3D&#39;0x0&#39;/&gt;<br>=C2=A0 =C2=A0 &lt;/mem=
balloon&gt;<br>=C2=A0 =C2=A0 &lt;rng model=3D&#39;virtio&#39;&gt;<br>=C2=A0=
 =C2=A0 =C2=A0 &lt;backend model=3D&#39;random&#39;&gt;/dev/urandom&lt;/bac=
kend&gt;<br>=C2=A0 =C2=A0 =C2=A0 &lt;address type=3D&#39;pci&#39; domain=3D=
&#39;0x0000&#39; bus=3D&#39;0x00&#39; slot=3D&#39;0x07&#39; function=3D&#39=
;0x0&#39;/&gt;<br>=C2=A0 =C2=A0 &lt;/rng&gt;<br>=C2=A0 &lt;/devices&gt;<br>=
&lt;/domain&gt;<br>```<br></div><div><br></div><div><br></div><div><div dir=
=3D"ltr"><div dir=3D"ltr"><div><div dir=3D"ltr"><div>----</div>Simon Jones<=
/div></div></div></div></div></div>
</blockquote></div>

--000000000000d1f8c305f78ad691--

