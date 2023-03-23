Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54AD66C629A
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Mar 2023 10:03:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfGqH-0006AL-VB; Thu, 23 Mar 2023 05:02:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <batmanustc@gmail.com>)
 id 1pfGqF-00066M-FO
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 05:02:39 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <batmanustc@gmail.com>)
 id 1pfGq8-0006qQ-Bh
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 05:02:37 -0400
Received: by mail-pl1-x633.google.com with SMTP id k2so21686079pll.8
 for <qemu-devel@nongnu.org>; Thu, 23 Mar 2023 02:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679562150;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CNoDaLZyRzSJdkYpetrtUuTTmKFTkW38YWvatrTpE5s=;
 b=fg0Gun6mTPreymAtBa/dPr2yUwpJpEfrQQv0xxtfdIQ5Ygvnyhuo8EzQr2Y4SGbKIt
 f1tuSgnH9qwH1tny2jsDCkVgM2SJiS7Aks/A540bypuKds6Ol8kYdN8k9ANQ+ak7dXvk
 IPe96nlj3HbuhqFNZn6Ft+8CwHf5qN0lQ04Tfh8TMRxwME9qc7lZZjxvG5h/xpl9pZw7
 DydBLnEJ0lOgXUX4JhQdmq1sBRsHleWPO3mj2WL08kZK4JiGFptHnqTdBs1lejhGkDAr
 OAUpW4YAkmzybjr51vzgLqKL7cqh0N3571jRXGhbyCES8/mcmciFHrttkJWvDu+Ib63B
 kajw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679562150;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CNoDaLZyRzSJdkYpetrtUuTTmKFTkW38YWvatrTpE5s=;
 b=CTw3E+FOVwMRziLMnp8Bij2q5DsY5rYy/MCM14vVpXytGzklrqF8LNtgosO8KuP2zU
 cl5CxILpY57/lBdG+KNKtbGCzmJ1dmwUd7XU24vaB0QshzbVHfFByURuQIiAuRZu4Kld
 n0FN9PsbDPOGctsKTc/5tZXw3miLvHhn9fUKYYC/fbwB/+vxsRiJ/DJclc7nLha/QK8Y
 Umst27w0jB47kjxBejz4qHISGuLK/0wkXov+gxCn+/Ou7Zf1onrPx/1b0BJk9ELKnR/D
 8Tu62qyH1BqSs88xSlw3jyujUzy0Oy5O7xyaP0qGimgfMpSFbf4AExjkz/fKuCFawpM2
 a1kQ==
X-Gm-Message-State: AO0yUKWwregmOr5bk3M91sAJviv+akkoQuMiCar2WvUGLAhhjGVILwnT
 WWYGrjzKPs8Me0qbKFdxrZYOK5VxwUkogWqdMPDOZ27Jyq0dOA==
X-Google-Smtp-Source: AK7set/CvlV9dtEbYTgbV5E8L86KFFLHPDrgfBjykv1D/EVl7TWGB+YVItKyqalslplgHJCEIsBT4YE+0O7rbs24k2Y=
X-Received: by 2002:a17:90a:b286:b0:23d:19cf:f9d4 with SMTP id
 c6-20020a17090ab28600b0023d19cff9d4mr2168548pjr.6.1679562149338; Thu, 23 Mar
 2023 02:02:29 -0700 (PDT)
MIME-Version: 1.0
References: <CAOE=1Z26OKgDB1=9M0rSjT50GbNi2BR7gbQ_5EbAoMRNGgP9og@mail.gmail.com>
 <CAOE=1Z0wfg1iZHcJ5XnNEdp_-Wor09mzacOq7uLH=6TiFhQyrw@mail.gmail.com>
In-Reply-To: <CAOE=1Z0wfg1iZHcJ5XnNEdp_-Wor09mzacOq7uLH=6TiFhQyrw@mail.gmail.com>
From: Simon Jones <batmanustc@gmail.com>
Date: Thu, 23 Mar 2023 08:59:30 +0000
Message-ID: <CAOE=1Z0o=M5SOE=tb8g5Y53ZzLEy5H24mGv-p9et=UKGbNq0ig@mail.gmail.com>
Subject: Re: [BUG][KVM_SET_USER_MEMORY_REGION] KVM_SET_USER_MEMORY_REGION
 failed
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="0000000000004a235605f78d895c"
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=batmanustc@gmail.com; helo=mail-pl1-x633.google.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, NORMAL_HTTP_TO_IP=0.001, NUMERIC_HTTP_ADDR=1.242,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 WEIRD_PORT=0.001 autolearn=ham autolearn_force=no
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

--0000000000004a235605f78d895c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This is full ERROR log

2023-03-23 08:00:52.362+0000: starting up libvirt version: 8.0.0, package:
1ubuntu7.4 (Christian Ehrhardt <christian.ehrhardt@canonical.com> Tue, 22
Nov 2022 15:59:28 +0100), qemu version: 6.2.0Debian 1:6.2+dfsg-2ubuntu6.6,
kernel: 5.19.0-35-generic, hostname: c1c2
LC_ALL=3DC \
PATH=3D/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/snap/b=
in
\
HOME=3D/var/lib/libvirt/qemu/domain-4-instance-0000000e \
XDG_DATA_HOME=3D/var/lib/libvirt/qemu/domain-4-instance-0000000e/.local/sha=
re
\
XDG_CACHE_HOME=3D/var/lib/libvirt/qemu/domain-4-instance-0000000e/.cache \
XDG_CONFIG_HOME=3D/var/lib/libvirt/qemu/domain-4-instance-0000000e/.config =
\
/usr/bin/qemu-system-x86_64 \
-name guest=3Dinstance-0000000e,debug-threads=3Don \
-S \
-object
'{"qom-type":"secret","id":"masterKey0","format":"raw","file":"/var/lib/lib=
virt/qemu/domain-4-instance-0000000e/master-key.aes"}'
\
-machine pc-i440fx-6.2,usb=3Doff,dump-guest-core=3Doff,memory-backend=3Dpc.=
ram \
-accel kvm \
-cpu
Cooperlake,ss=3Don,vmx=3Don,pdcm=3Don,hypervisor=3Don,tsc-adjust=3Don,sha-n=
i=3Don,umip=3Don,waitpkg=3Don,gfni=3Don,vaes=3Don,vpclmulqdq=3Don,rdpid=3Do=
n,movdiri=3Don,movdir64b=3Don,fsrm=3Don,md-clear=3Don,avx-vnni=3Don,xsaves=
=3Don,ibpb=3Don,ibrs=3Don,amd-stibp=3Don,amd-ssbd=3Don,hle=3Doff,rtm=3Doff,=
avx512f=3Doff,avx512dq=3Doff,avx512cd=3Doff,avx512bw=3Doff,avx512vl=3Doff,a=
vx512vnni=3Doff,avx512-bf16=3Doff,taa-no=3Doff
\
-m 64 \
-object '{"qom-type":"memory-backend-ram","id":"pc.ram","size":67108864}' \
-overcommit mem-lock=3Doff \
-smp 1,sockets=3D1,dies=3D1,cores=3D1,threads=3D1 \
-uuid ff91d2dc-69a1-43ef-abde-c9e4e9a0305b \
-smbios 'type=3D1,manufacturer=3DOpenStack Foundation,product=3DOpenStack
Nova,version=3D25.1.0,serial=3Dff91d2dc-69a1-43ef-abde-c9e4e9a0305b,uuid=3D=
ff91d2dc-69a1-43ef-abde-c9e4e9a0305b,family=3DVirtual
Machine' \
-no-user-config \
-nodefaults \
-chardev socket,id=3Dcharmonitor,fd=3D33,server=3Don,wait=3Doff \
-mon chardev=3Dcharmonitor,id=3Dmonitor,mode=3Dcontrol \
-rtc base=3Dutc,driftfix=3Dslew \
-global kvm-pit.lost_tick_policy=3Ddelay \
-no-hpet \
-no-shutdown \
-boot strict=3Don \
-device piix3-usb-uhci,id=3Dusb,bus=3Dpci.0,addr=3D0x1.0x2 \
-blockdev
'{"driver":"file","filename":"/var/lib/nova/instances/_base/8b58db82a488248=
e7c5e769599954adaa47a5314","node-name":"libvirt-2-storage","cache":{"direct=
":true,"no-flush":false},"auto-read-only":true,"discard":"unmap"}'
\
-blockdev
'{"node-name":"libvirt-2-format","read-only":true,"cache":{"direct":true,"n=
o-flush":false},"driver":"raw","file":"libvirt-2-storage"}'
\
-blockdev
'{"driver":"file","filename":"/var/lib/nova/instances/ff91d2dc-69a1-43ef-ab=
de-c9e4e9a0305b/disk","node-name":"libvirt-1-storage","cache":{"direct":tru=
e,"no-flush":false},"auto-read-only":true,"discard":"unmap"}'
\
-blockdev
'{"node-name":"libvirt-1-format","read-only":false,"cache":{"direct":true,"=
no-flush":false},"driver":"qcow2","file":"libvirt-1-storage","backing":"lib=
virt-2-format"}'
\
-device
virtio-blk-pci,bus=3Dpci.0,addr=3D0x3,drive=3Dlibvirt-1-format,id=3Dvirtio-=
disk0,bootindex=3D1,write-cache=3Don
\
-add-fd set=3D1,fd=3D34 \
-chardev pty,id=3Dcharserial0,logfile=3D/dev/fdset/1,logappend=3Don \
-device isa-serial,chardev=3Dcharserial0,id=3Dserial0 \
-device usb-tablet,id=3Dinput0,bus=3Dusb.0,port=3D1 \
-audiodev '{"id":"audio1","driver":"none"}' \
-vnc 0.0.0.0:0,audiodev=3Daudio1 \
-device virtio-vga,id=3Dvideo0,max_outputs=3D1,bus=3Dpci.0,addr=3D0x2 \
-device vfio-pci,host=3D0000:01:00.5,id=3Dhostdev0,bus=3Dpci.0,addr=3D0x4 \
-device vfio-pci,host=3D0000:01:00.6,id=3Dhostdev1,bus=3Dpci.0,addr=3D0x5 \
-device virtio-balloon-pci,id=3Dballoon0,bus=3Dpci.0,addr=3D0x6 \
-object
'{"qom-type":"rng-random","id":"objrng0","filename":"/dev/urandom"}' \
-device virtio-rng-pci,rng=3Dobjrng0,id=3Drng0,bus=3Dpci.0,addr=3D0x7 \
-device vmcoreinfo \
-sandbox
on,obsolete=3Ddeny,elevateprivileges=3Ddeny,spawn=3Ddeny,resourcecontrol=3D=
deny \
-msg timestamp=3Don
char device redirected to /dev/pts/3 (label charserial0)
2023-03-23T08:00:53.728550Z qemu-system-x86_64: kvm_set_user_memory_region:
KVM_SET_USER_MEMORY_REGION failed, slot=3D4, start=3D0xfffffffffe000000,
size=3D0x2000: Invalid argument
kvm_set_phys_mem: error registering slot: Invalid argument
2023-03-23 08:00:54.201+0000: shutting down, reason=3Dcrashed
2023-03-23 08:54:43.468+0000: starting up libvirt version: 8.0.0, package:
1ubuntu7.4 (Christian Ehrhardt <christian.ehrhardt@canonical.com> Tue, 22
Nov 2022 15:59:28 +0100), qemu version: 6.2.0Debian 1:6.2+dfsg-2ubuntu6.6,
kernel: 5.19.0-35-generic, hostname: c1c2
LC_ALL=3DC \
PATH=3D/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/snap/b=
in
\
HOME=3D/var/lib/libvirt/qemu/domain-5-instance-0000000e \
XDG_DATA_HOME=3D/var/lib/libvirt/qemu/domain-5-instance-0000000e/.local/sha=
re
\
XDG_CACHE_HOME=3D/var/lib/libvirt/qemu/domain-5-instance-0000000e/.cache \
XDG_CONFIG_HOME=3D/var/lib/libvirt/qemu/domain-5-instance-0000000e/.config =
\
/usr/bin/qemu-system-x86_64 \
-name guest=3Dinstance-0000000e,debug-threads=3Don \
-S \
-object
'{"qom-type":"secret","id":"masterKey0","format":"raw","file":"/var/lib/lib=
virt/qemu/domain-5-instance-0000000e/master-key.aes"}'
\
-machine pc-i440fx-6.2,usb=3Doff,dump-guest-core=3Doff,memory-backend=3Dpc.=
ram \
-accel kvm \
-cpu
Cooperlake,ss=3Don,vmx=3Don,pdcm=3Don,hypervisor=3Don,tsc-adjust=3Don,sha-n=
i=3Don,umip=3Don,waitpkg=3Don,gfni=3Don,vaes=3Don,vpclmulqdq=3Don,rdpid=3Do=
n,movdiri=3Don,movdir64b=3Don,fsrm=3Don,md-clear=3Don,avx-vnni=3Don,xsaves=
=3Don,ibpb=3Don,ibrs=3Don,amd-stibp=3Don,amd-ssbd=3Don,hle=3Doff,rtm=3Doff,=
avx512f=3Doff,avx512dq=3Doff,avx512cd=3Doff,avx512bw=3Doff,avx512vl=3Doff,a=
vx512vnni=3Doff,avx512-bf16=3Doff,taa-no=3Doff
\
-m 64 \
-object '{"qom-type":"memory-backend-ram","id":"pc.ram","size":67108864}' \
-overcommit mem-lock=3Doff \
-smp 1,sockets=3D1,dies=3D1,cores=3D1,threads=3D1 \
-uuid ff91d2dc-69a1-43ef-abde-c9e4e9a0305b \
-smbios 'type=3D1,manufacturer=3DOpenStack Foundation,product=3DOpenStack
Nova,version=3D25.1.0,serial=3Dff91d2dc-69a1-43ef-abde-c9e4e9a0305b,uuid=3D=
ff91d2dc-69a1-43ef-abde-c9e4e9a0305b,family=3DVirtual
Machine' \
-no-user-config \
-nodefaults \
-chardev socket,id=3Dcharmonitor,fd=3D33,server=3Don,wait=3Doff \
-mon chardev=3Dcharmonitor,id=3Dmonitor,mode=3Dcontrol \
-rtc base=3Dutc,driftfix=3Dslew \
-global kvm-pit.lost_tick_policy=3Ddelay \
-no-hpet \
-no-shutdown \
-boot strict=3Don \
-device piix3-usb-uhci,id=3Dusb,bus=3Dpci.0,addr=3D0x1.0x2 \
-blockdev
'{"driver":"file","filename":"/var/lib/nova/instances/_base/8b58db82a488248=
e7c5e769599954adaa47a5314","node-name":"libvirt-2-storage","cache":{"direct=
":true,"no-flush":false},"auto-read-only":true,"discard":"unmap"}'
\
-blockdev
'{"node-name":"libvirt-2-format","read-only":true,"cache":{"direct":true,"n=
o-flush":false},"driver":"raw","file":"libvirt-2-storage"}'
\
-blockdev
'{"driver":"file","filename":"/var/lib/nova/instances/ff91d2dc-69a1-43ef-ab=
de-c9e4e9a0305b/disk","node-name":"libvirt-1-storage","cache":{"direct":tru=
e,"no-flush":false},"auto-read-only":true,"discard":"unmap"}'
\
-blockdev
'{"node-name":"libvirt-1-format","read-only":false,"cache":{"direct":true,"=
no-flush":false},"driver":"qcow2","file":"libvirt-1-storage","backing":"lib=
virt-2-format"}'
\
-device
virtio-blk-pci,bus=3Dpci.0,addr=3D0x3,drive=3Dlibvirt-1-format,id=3Dvirtio-=
disk0,bootindex=3D1,write-cache=3Don
\
-add-fd set=3D1,fd=3D34 \
-chardev pty,id=3Dcharserial0,logfile=3D/dev/fdset/1,logappend=3Don \
-device isa-serial,chardev=3Dcharserial0,id=3Dserial0 \
-device usb-tablet,id=3Dinput0,bus=3Dusb.0,port=3D1 \
-audiodev '{"id":"audio1","driver":"none"}' \
-vnc 0.0.0.0:0,audiodev=3Daudio1 \
-device virtio-vga,id=3Dvideo0,max_outputs=3D1,bus=3Dpci.0,addr=3D0x2 \
-device vfio-pci,host=3D0000:01:00.5,id=3Dhostdev0,bus=3Dpci.0,addr=3D0x4 \
-device vfio-pci,host=3D0000:01:00.6,id=3Dhostdev1,bus=3Dpci.0,addr=3D0x5 \
-device virtio-balloon-pci,id=3Dballoon0,bus=3Dpci.0,addr=3D0x6 \
-object
'{"qom-type":"rng-random","id":"objrng0","filename":"/dev/urandom"}' \
-device virtio-rng-pci,rng=3Dobjrng0,id=3Drng0,bus=3Dpci.0,addr=3D0x7 \
-device vmcoreinfo \
-sandbox
on,obsolete=3Ddeny,elevateprivileges=3Ddeny,spawn=3Ddeny,resourcecontrol=3D=
deny \
-msg timestamp=3Don
char device redirected to /dev/pts/3 (label charserial0)
2023-03-23T08:54:44.755039Z qemu-system-x86_64: kvm_set_user_memory_region:
KVM_SET_USER_MEMORY_REGION failed, slot=3D4, start=3D0xfffffffffe000000,
size=3D0x2000: Invalid argument
kvm_set_phys_mem: error registering slot: Invalid argument
2023-03-23 08:54:45.230+0000: shutting down, reason=3Dcrashed
----
Simon Jones


Simon Jones <batmanustc@gmail.com> =E4=BA=8E2023=E5=B9=B43=E6=9C=8823=E6=97=
=A5=E5=91=A8=E5=9B=9B 05:49=E5=86=99=E9=81=93=EF=BC=9A

> This is happened in ubuntu22.04.
>
> QEMU is install by apt like this:
> apt install -y qemu qemu-kvm qemu-system
>
> and QEMU version is 6.2.0
>
> ----
> Simon Jones
>
>
> Simon Jones <batmanustc@gmail.com> =E4=BA=8E2023=E5=B9=B43=E6=9C=8821=E6=
=97=A5=E5=91=A8=E4=BA=8C 08:40=E5=86=99=E9=81=93=EF=BC=9A
>
>>
>>
>> Hi all,
>>
>> I start a VM in openstack, and openstack use libvirt to start qemu VM,
>> but now log show this ERROR.
>> Is there any one know this?
>>
>> The ERROR log from /var/log/libvirt/qemu/instance-0000000e.log
>> ```
>> 2023-03-14T10:09:17.674114Z qemu-system-x86_64:
>> kvm_set_user_memory_region: KVM_SET_USER_MEMORY_REGION failed, slot=3D4,
>> start=3D0xfffffffffe000000, size=3D0x2000: Invalid argument
>> kvm_set_phys_mem: error registering slot: Invalid argument
>> 2023-03-14 10:09:18.198+0000: shutting down, reason=3Dcrashed
>> ```
>>
>> The xml file
>> ```
>> root@c1c2:~# cat /etc/libvirt/qemu/instance-0000000e.xml
>> <!--
>> WARNING: THIS IS AN AUTO-GENERATED FILE. CHANGES TO IT ARE LIKELY TO BE
>> OVERWRITTEN AND LOST. Changes to this xml configuration should be made
>> using:
>>   virsh edit instance-0000000e
>> or other application using the libvirt API.
>> -->
>>
>> <domain type=3D'kvm'>
>>   <name>instance-0000000e</name>
>>   <uuid>ff91d2dc-69a1-43ef-abde-c9e4e9a0305b</uuid>
>>   <metadata>
>>     <nova:instance xmlns:nova=3D"
>> http://openstack.org/xmlns/libvirt/nova/1.1">
>>       <nova:package version=3D"25.1.0"/>
>>       <nova:name>provider-instance</nova:name>
>>       <nova:creationTime>2023-03-14 10:09:13</nova:creationTime>
>>       <nova:flavor name=3D"cirros-os-dpu-test-1">
>>         <nova:memory>64</nova:memory>
>>         <nova:disk>1</nova:disk>
>>         <nova:swap>0</nova:swap>
>>         <nova:ephemeral>0</nova:ephemeral>
>>         <nova:vcpus>1</nova:vcpus>
>>       </nova:flavor>
>>       <nova:owner>
>>         <nova:user
>> uuid=3D"ff627ad39ed94479b9c5033bc462cf78">admin</nova:user>
>>         <nova:project
>> uuid=3D"512866f9994f4ad8916d8539a7cdeec9">admin</nova:project>
>>       </nova:owner>
>>       <nova:root type=3D"image"
>> uuid=3D"9e58cb69-316a-4093-9f23-c1d1bd8edffe"/>
>>       <nova:ports>
>>         <nova:port uuid=3D"77c1dc00-af39-4463-bea0-12808f4bc340">
>>           <nova:ip type=3D"fixed" address=3D"172.1.1.43" ipVersion=3D"4"=
/>
>>         </nova:port>
>>       </nova:ports>
>>     </nova:instance>
>>   </metadata>
>>   <memory unit=3D'KiB'>65536</memory>
>>   <currentMemory unit=3D'KiB'>65536</currentMemory>
>>   <vcpu placement=3D'static'>1</vcpu>
>>   <sysinfo type=3D'smbios'>
>>     <system>
>>       <entry name=3D'manufacturer'>OpenStack Foundation</entry>
>>       <entry name=3D'product'>OpenStack Nova</entry>
>>       <entry name=3D'version'>25.1.0</entry>
>>       <entry name=3D'serial'>ff91d2dc-69a1-43ef-abde-c9e4e9a0305b</entry=
>
>>       <entry name=3D'uuid'>ff91d2dc-69a1-43ef-abde-c9e4e9a0305b</entry>
>>       <entry name=3D'family'>Virtual Machine</entry>
>>     </system>
>>   </sysinfo>
>>   <os>
>>     <type arch=3D'x86_64' machine=3D'pc-i440fx-6.2'>hvm</type>
>>     <boot dev=3D'hd'/>
>>     <smbios mode=3D'sysinfo'/>
>>   </os>
>>   <features>
>>     <acpi/>
>>     <apic/>
>>     <vmcoreinfo state=3D'on'/>
>>   </features>
>>   <cpu mode=3D'host-model' check=3D'partial'>
>>     <topology sockets=3D'1' dies=3D'1' cores=3D'1' threads=3D'1'/>
>>   </cpu>
>>   <clock offset=3D'utc'>
>>     <timer name=3D'pit' tickpolicy=3D'delay'/>
>>     <timer name=3D'rtc' tickpolicy=3D'catchup'/>
>>     <timer name=3D'hpet' present=3D'no'/>
>>   </clock>
>>   <on_poweroff>destroy</on_poweroff>
>>   <on_reboot>restart</on_reboot>
>>   <on_crash>destroy</on_crash>
>>   <devices>
>>     <emulator>/usr/bin/qemu-system-x86_64</emulator>
>>     <disk type=3D'file' device=3D'disk'>
>>       <driver name=3D'qemu' type=3D'qcow2' cache=3D'none'/>
>>       <source
>> file=3D'/var/lib/nova/instances/ff91d2dc-69a1-43ef-abde-c9e4e9a0305b/dis=
k'/>
>>       <target dev=3D'vda' bus=3D'virtio'/>
>>       <address type=3D'pci' domain=3D'0x0000' bus=3D'0x00' slot=3D'0x03'
>> function=3D'0x0'/>
>>     </disk>
>>     <controller type=3D'usb' index=3D'0' model=3D'piix3-uhci'>
>>       <address type=3D'pci' domain=3D'0x0000' bus=3D'0x00' slot=3D'0x01'
>> function=3D'0x2'/>
>>     </controller>
>>     <controller type=3D'pci' index=3D'0' model=3D'pci-root'/>
>>     <interface type=3D'hostdev' managed=3D'yes'>
>>       <mac address=3D'fa:16:3e:aa:d9:23'/>
>>       <source>
>>         <address type=3D'pci' domain=3D'0x0000' bus=3D'0x01' slot=3D'0x0=
0'
>> function=3D'0x5'/>
>>       </source>
>>       <address type=3D'pci' domain=3D'0x0000' bus=3D'0x00' slot=3D'0x04'
>> function=3D'0x0'/>
>>     </interface>
>>     <serial type=3D'pty'>
>>       <log
>> file=3D'/var/lib/nova/instances/ff91d2dc-69a1-43ef-abde-c9e4e9a0305b/con=
sole.log'
>> append=3D'off'/>
>>       <target type=3D'isa-serial' port=3D'0'>
>>         <model name=3D'isa-serial'/>
>>       </target>
>>     </serial>
>>     <console type=3D'pty'>
>>       <log
>> file=3D'/var/lib/nova/instances/ff91d2dc-69a1-43ef-abde-c9e4e9a0305b/con=
sole.log'
>> append=3D'off'/>
>>       <target type=3D'serial' port=3D'0'/>
>>     </console>
>>     <input type=3D'tablet' bus=3D'usb'>
>>       <address type=3D'usb' bus=3D'0' port=3D'1'/>
>>     </input>
>>     <input type=3D'mouse' bus=3D'ps2'/>
>>     <input type=3D'keyboard' bus=3D'ps2'/>
>>     <graphics type=3D'vnc' port=3D'-1' autoport=3D'yes' listen=3D'0.0.0.=
0'>
>>       <listen type=3D'address' address=3D'0.0.0.0'/>
>>     </graphics>
>>     <audio id=3D'1' type=3D'none'/>
>>     <video>
>>       <model type=3D'virtio' heads=3D'1' primary=3D'yes'/>
>>       <address type=3D'pci' domain=3D'0x0000' bus=3D'0x00' slot=3D'0x02'
>> function=3D'0x0'/>
>>     </video>
>>     <hostdev mode=3D'subsystem' type=3D'pci' managed=3D'yes'>
>>       <source>
>>         <address domain=3D'0x0000' bus=3D'0x01' slot=3D'0x00' function=
=3D'0x6'/>
>>       </source>
>>       <address type=3D'pci' domain=3D'0x0000' bus=3D'0x00' slot=3D'0x05'
>> function=3D'0x0'/>
>>     </hostdev>
>>     <memballoon model=3D'virtio'>
>>       <stats period=3D'10'/>
>>       <address type=3D'pci' domain=3D'0x0000' bus=3D'0x00' slot=3D'0x06'
>> function=3D'0x0'/>
>>     </memballoon>
>>     <rng model=3D'virtio'>
>>       <backend model=3D'random'>/dev/urandom</backend>
>>       <address type=3D'pci' domain=3D'0x0000' bus=3D'0x00' slot=3D'0x07'
>> function=3D'0x0'/>
>>     </rng>
>>   </devices>
>> </domain>
>> ```
>>
>>
>> ----
>> Simon Jones
>>
>

--0000000000004a235605f78d895c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>This is full ERROR log</div><div><br></div><div>2023-=
03-23 08:00:52.362+0000: starting up libvirt version: 8.0.0, package: 1ubun=
tu7.4 (Christian Ehrhardt &lt;<a href=3D"mailto:christian.ehrhardt@canonica=
l.com">christian.ehrhardt@canonical.com</a>&gt; Tue, 22 Nov 2022 15:59:28 +=
0100), qemu version: 6.2.0Debian 1:6.2+dfsg-2ubuntu6.6, kernel: 5.19.0-35-g=
eneric, hostname: c1c2<br>LC_ALL=3DC \<br>PATH=3D/usr/local/sbin:/usr/local=
/bin:/usr/sbin:/usr/bin:/sbin:/bin:/snap/bin \<br>HOME=3D/var/lib/libvirt/q=
emu/domain-4-instance-0000000e \<br>XDG_DATA_HOME=3D/var/lib/libvirt/qemu/d=
omain-4-instance-0000000e/.local/share \<br>XDG_CACHE_HOME=3D/var/lib/libvi=
rt/qemu/domain-4-instance-0000000e/.cache \<br>XDG_CONFIG_HOME=3D/var/lib/l=
ibvirt/qemu/domain-4-instance-0000000e/.config \<br>/usr/bin/qemu-system-x8=
6_64 \<br>-name guest=3Dinstance-0000000e,debug-threads=3Don \<br>-S \<br>-=
object &#39;{&quot;qom-type&quot;:&quot;secret&quot;,&quot;id&quot;:&quot;m=
asterKey0&quot;,&quot;format&quot;:&quot;raw&quot;,&quot;file&quot;:&quot;/=
var/lib/libvirt/qemu/domain-4-instance-0000000e/master-key.aes&quot;}&#39; =
\<br>-machine pc-i440fx-6.2,usb=3Doff,dump-guest-core=3Doff,memory-backend=
=3Dpc.ram \<br>-accel kvm \<br>-cpu Cooperlake,ss=3Don,vmx=3Don,pdcm=3Don,h=
ypervisor=3Don,tsc-adjust=3Don,sha-ni=3Don,umip=3Don,waitpkg=3Don,gfni=3Don=
,vaes=3Don,vpclmulqdq=3Don,rdpid=3Don,movdiri=3Don,movdir64b=3Don,fsrm=3Don=
,md-clear=3Don,avx-vnni=3Don,xsaves=3Don,ibpb=3Don,ibrs=3Don,amd-stibp=3Don=
,amd-ssbd=3Don,hle=3Doff,rtm=3Doff,avx512f=3Doff,avx512dq=3Doff,avx512cd=3D=
off,avx512bw=3Doff,avx512vl=3Doff,avx512vnni=3Doff,avx512-bf16=3Doff,taa-no=
=3Doff \<br>-m 64 \<br>-object &#39;{&quot;qom-type&quot;:&quot;memory-back=
end-ram&quot;,&quot;id&quot;:&quot;pc.ram&quot;,&quot;size&quot;:67108864}&=
#39; \<br>-overcommit mem-lock=3Doff \<br>-smp 1,sockets=3D1,dies=3D1,cores=
=3D1,threads=3D1 \<br>-uuid ff91d2dc-69a1-43ef-abde-c9e4e9a0305b \<br>-smbi=
os &#39;type=3D1,manufacturer=3DOpenStack Foundation,product=3DOpenStack No=
va,version=3D25.1.0,serial=3Dff91d2dc-69a1-43ef-abde-c9e4e9a0305b,uuid=3Dff=
91d2dc-69a1-43ef-abde-c9e4e9a0305b,family=3DVirtual Machine&#39; \<br>-no-u=
ser-config \<br>-nodefaults \<br>-chardev socket,id=3Dcharmonitor,fd=3D33,s=
erver=3Don,wait=3Doff \<br>-mon chardev=3Dcharmonitor,id=3Dmonitor,mode=3Dc=
ontrol \<br>-rtc base=3Dutc,driftfix=3Dslew \<br>-global kvm-pit.lost_tick_=
policy=3Ddelay \<br>-no-hpet \<br>-no-shutdown \<br>-boot strict=3Don \<br>=
-device piix3-usb-uhci,id=3Dusb,bus=3Dpci.0,addr=3D0x1.0x2 \<br>-blockdev &=
#39;{&quot;driver&quot;:&quot;file&quot;,&quot;filename&quot;:&quot;/var/li=
b/nova/instances/_base/8b58db82a488248e7c5e769599954adaa47a5314&quot;,&quot=
;node-name&quot;:&quot;libvirt-2-storage&quot;,&quot;cache&quot;:{&quot;dir=
ect&quot;:true,&quot;no-flush&quot;:false},&quot;auto-read-only&quot;:true,=
&quot;discard&quot;:&quot;unmap&quot;}&#39; \<br>-blockdev &#39;{&quot;node=
-name&quot;:&quot;libvirt-2-format&quot;,&quot;read-only&quot;:true,&quot;c=
ache&quot;:{&quot;direct&quot;:true,&quot;no-flush&quot;:false},&quot;drive=
r&quot;:&quot;raw&quot;,&quot;file&quot;:&quot;libvirt-2-storage&quot;}&#39=
; \<br>-blockdev &#39;{&quot;driver&quot;:&quot;file&quot;,&quot;filename&q=
uot;:&quot;/var/lib/nova/instances/ff91d2dc-69a1-43ef-abde-c9e4e9a0305b/dis=
k&quot;,&quot;node-name&quot;:&quot;libvirt-1-storage&quot;,&quot;cache&quo=
t;:{&quot;direct&quot;:true,&quot;no-flush&quot;:false},&quot;auto-read-onl=
y&quot;:true,&quot;discard&quot;:&quot;unmap&quot;}&#39; \<br>-blockdev &#3=
9;{&quot;node-name&quot;:&quot;libvirt-1-format&quot;,&quot;read-only&quot;=
:false,&quot;cache&quot;:{&quot;direct&quot;:true,&quot;no-flush&quot;:fals=
e},&quot;driver&quot;:&quot;qcow2&quot;,&quot;file&quot;:&quot;libvirt-1-st=
orage&quot;,&quot;backing&quot;:&quot;libvirt-2-format&quot;}&#39; \<br>-de=
vice virtio-blk-pci,bus=3Dpci.0,addr=3D0x3,drive=3Dlibvirt-1-format,id=3Dvi=
rtio-disk0,bootindex=3D1,write-cache=3Don \<br>-add-fd set=3D1,fd=3D34 \<br=
>-chardev pty,id=3Dcharserial0,logfile=3D/dev/fdset/1,logappend=3Don \<br>-=
device isa-serial,chardev=3Dcharserial0,id=3Dserial0 \<br>-device usb-table=
t,id=3Dinput0,bus=3Dusb.0,port=3D1 \<br>-audiodev &#39;{&quot;id&quot;:&quo=
t;audio1&quot;,&quot;driver&quot;:&quot;none&quot;}&#39; \<br>-vnc <a href=
=3D"http://0.0.0.0:0">0.0.0.0:0</a>,audiodev=3Daudio1 \<br>-device virtio-v=
ga,id=3Dvideo0,max_outputs=3D1,bus=3Dpci.0,addr=3D0x2 \<br>-device vfio-pci=
,host=3D0000:01:00.5,id=3Dhostdev0,bus=3Dpci.0,addr=3D0x4 \<br>-device vfio=
-pci,host=3D0000:01:00.6,id=3Dhostdev1,bus=3Dpci.0,addr=3D0x5 \<br>-device =
virtio-balloon-pci,id=3Dballoon0,bus=3Dpci.0,addr=3D0x6 \<br>-object &#39;{=
&quot;qom-type&quot;:&quot;rng-random&quot;,&quot;id&quot;:&quot;objrng0&qu=
ot;,&quot;filename&quot;:&quot;/dev/urandom&quot;}&#39; \<br>-device virtio=
-rng-pci,rng=3Dobjrng0,id=3Drng0,bus=3Dpci.0,addr=3D0x7 \<br>-device vmcore=
info \<br>-sandbox on,obsolete=3Ddeny,elevateprivileges=3Ddeny,spawn=3Ddeny=
,resourcecontrol=3Ddeny \<br>-msg timestamp=3Don<br>char device redirected =
to /dev/pts/3 (label charserial0)<br>2023-03-23T08:00:53.728550Z qemu-syste=
m-x86_64: kvm_set_user_memory_region: KVM_SET_USER_MEMORY_REGION failed, sl=
ot=3D4, start=3D0xfffffffffe000000, size=3D0x2000: Invalid argument<br>kvm_=
set_phys_mem: error registering slot: Invalid argument<br>2023-03-23 08:00:=
54.201+0000: shutting down, reason=3Dcrashed<br>2023-03-23 08:54:43.468+000=
0: starting up libvirt version: 8.0.0, package: 1ubuntu7.4 (Christian Ehrha=
rdt &lt;<a href=3D"mailto:christian.ehrhardt@canonical.com">christian.ehrha=
rdt@canonical.com</a>&gt; Tue, 22 Nov 2022 15:59:28 +0100), qemu version: 6=
.2.0Debian 1:6.2+dfsg-2ubuntu6.6, kernel: 5.19.0-35-generic, hostname: c1c2=
<br>LC_ALL=3DC \<br>PATH=3D/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bi=
n:/sbin:/bin:/snap/bin \<br>HOME=3D/var/lib/libvirt/qemu/domain-5-instance-=
0000000e \<br>XDG_DATA_HOME=3D/var/lib/libvirt/qemu/domain-5-instance-00000=
00e/.local/share \<br>XDG_CACHE_HOME=3D/var/lib/libvirt/qemu/domain-5-insta=
nce-0000000e/.cache \<br>XDG_CONFIG_HOME=3D/var/lib/libvirt/qemu/domain-5-i=
nstance-0000000e/.config \<br>/usr/bin/qemu-system-x86_64 \<br>-name guest=
=3Dinstance-0000000e,debug-threads=3Don \<br>-S \<br>-object &#39;{&quot;qo=
m-type&quot;:&quot;secret&quot;,&quot;id&quot;:&quot;masterKey0&quot;,&quot=
;format&quot;:&quot;raw&quot;,&quot;file&quot;:&quot;/var/lib/libvirt/qemu/=
domain-5-instance-0000000e/master-key.aes&quot;}&#39; \<br>-machine pc-i440=
fx-6.2,usb=3Doff,dump-guest-core=3Doff,memory-backend=3Dpc.ram \<br>-accel =
kvm \<br>-cpu Cooperlake,ss=3Don,vmx=3Don,pdcm=3Don,hypervisor=3Don,tsc-adj=
ust=3Don,sha-ni=3Don,umip=3Don,waitpkg=3Don,gfni=3Don,vaes=3Don,vpclmulqdq=
=3Don,rdpid=3Don,movdiri=3Don,movdir64b=3Don,fsrm=3Don,md-clear=3Don,avx-vn=
ni=3Don,xsaves=3Don,ibpb=3Don,ibrs=3Don,amd-stibp=3Don,amd-ssbd=3Don,hle=3D=
off,rtm=3Doff,avx512f=3Doff,avx512dq=3Doff,avx512cd=3Doff,avx512bw=3Doff,av=
x512vl=3Doff,avx512vnni=3Doff,avx512-bf16=3Doff,taa-no=3Doff \<br>-m 64 \<b=
r>-object &#39;{&quot;qom-type&quot;:&quot;memory-backend-ram&quot;,&quot;i=
d&quot;:&quot;pc.ram&quot;,&quot;size&quot;:67108864}&#39; \<br>-overcommit=
 mem-lock=3Doff \<br>-smp 1,sockets=3D1,dies=3D1,cores=3D1,threads=3D1 \<br=
>-uuid ff91d2dc-69a1-43ef-abde-c9e4e9a0305b \<br>-smbios &#39;type=3D1,manu=
facturer=3DOpenStack Foundation,product=3DOpenStack Nova,version=3D25.1.0,s=
erial=3Dff91d2dc-69a1-43ef-abde-c9e4e9a0305b,uuid=3Dff91d2dc-69a1-43ef-abde=
-c9e4e9a0305b,family=3DVirtual Machine&#39; \<br>-no-user-config \<br>-node=
faults \<br>-chardev socket,id=3Dcharmonitor,fd=3D33,server=3Don,wait=3Doff=
 \<br>-mon chardev=3Dcharmonitor,id=3Dmonitor,mode=3Dcontrol \<br>-rtc base=
=3Dutc,driftfix=3Dslew \<br>-global kvm-pit.lost_tick_policy=3Ddelay \<br>-=
no-hpet \<br>-no-shutdown \<br>-boot strict=3Don \<br>-device piix3-usb-uhc=
i,id=3Dusb,bus=3Dpci.0,addr=3D0x1.0x2 \<br>-blockdev &#39;{&quot;driver&quo=
t;:&quot;file&quot;,&quot;filename&quot;:&quot;/var/lib/nova/instances/_bas=
e/8b58db82a488248e7c5e769599954adaa47a5314&quot;,&quot;node-name&quot;:&quo=
t;libvirt-2-storage&quot;,&quot;cache&quot;:{&quot;direct&quot;:true,&quot;=
no-flush&quot;:false},&quot;auto-read-only&quot;:true,&quot;discard&quot;:&=
quot;unmap&quot;}&#39; \<br>-blockdev &#39;{&quot;node-name&quot;:&quot;lib=
virt-2-format&quot;,&quot;read-only&quot;:true,&quot;cache&quot;:{&quot;dir=
ect&quot;:true,&quot;no-flush&quot;:false},&quot;driver&quot;:&quot;raw&quo=
t;,&quot;file&quot;:&quot;libvirt-2-storage&quot;}&#39; \<br>-blockdev &#39=
;{&quot;driver&quot;:&quot;file&quot;,&quot;filename&quot;:&quot;/var/lib/n=
ova/instances/ff91d2dc-69a1-43ef-abde-c9e4e9a0305b/disk&quot;,&quot;node-na=
me&quot;:&quot;libvirt-1-storage&quot;,&quot;cache&quot;:{&quot;direct&quot=
;:true,&quot;no-flush&quot;:false},&quot;auto-read-only&quot;:true,&quot;di=
scard&quot;:&quot;unmap&quot;}&#39; \<br>-blockdev &#39;{&quot;node-name&qu=
ot;:&quot;libvirt-1-format&quot;,&quot;read-only&quot;:false,&quot;cache&qu=
ot;:{&quot;direct&quot;:true,&quot;no-flush&quot;:false},&quot;driver&quot;=
:&quot;qcow2&quot;,&quot;file&quot;:&quot;libvirt-1-storage&quot;,&quot;bac=
king&quot;:&quot;libvirt-2-format&quot;}&#39; \<br>-device virtio-blk-pci,b=
us=3Dpci.0,addr=3D0x3,drive=3Dlibvirt-1-format,id=3Dvirtio-disk0,bootindex=
=3D1,write-cache=3Don \<br>-add-fd set=3D1,fd=3D34 \<br>-chardev pty,id=3Dc=
harserial0,logfile=3D/dev/fdset/1,logappend=3Don \<br>-device isa-serial,ch=
ardev=3Dcharserial0,id=3Dserial0 \<br>-device usb-tablet,id=3Dinput0,bus=3D=
usb.0,port=3D1 \<br>-audiodev &#39;{&quot;id&quot;:&quot;audio1&quot;,&quot=
;driver&quot;:&quot;none&quot;}&#39; \<br>-vnc <a href=3D"http://0.0.0.0:0"=
>0.0.0.0:0</a>,audiodev=3Daudio1 \<br>-device virtio-vga,id=3Dvideo0,max_ou=
tputs=3D1,bus=3Dpci.0,addr=3D0x2 \<br>-device vfio-pci,host=3D0000:01:00.5,=
id=3Dhostdev0,bus=3Dpci.0,addr=3D0x4 \<br>-device vfio-pci,host=3D0000:01:0=
0.6,id=3Dhostdev1,bus=3Dpci.0,addr=3D0x5 \<br>-device virtio-balloon-pci,id=
=3Dballoon0,bus=3Dpci.0,addr=3D0x6 \<br>-object &#39;{&quot;qom-type&quot;:=
&quot;rng-random&quot;,&quot;id&quot;:&quot;objrng0&quot;,&quot;filename&qu=
ot;:&quot;/dev/urandom&quot;}&#39; \<br>-device virtio-rng-pci,rng=3Dobjrng=
0,id=3Drng0,bus=3Dpci.0,addr=3D0x7 \<br>-device vmcoreinfo \<br>-sandbox on=
,obsolete=3Ddeny,elevateprivileges=3Ddeny,spawn=3Ddeny,resourcecontrol=3Dde=
ny \<br>-msg timestamp=3Don<br>char device redirected to /dev/pts/3 (label =
charserial0)<br>2023-03-23T08:54:44.755039Z qemu-system-x86_64: kvm_set_use=
r_memory_region: KVM_SET_USER_MEMORY_REGION failed, slot=3D4, start=3D0xfff=
ffffffe000000, size=3D0x2000: Invalid argument<br>kvm_set_phys_mem: error r=
egistering slot: Invalid argument<br>2023-03-23 08:54:45.230+0000: shutting=
 down, reason=3Dcrashed<br></div><div><div><div dir=3D"ltr" class=3D"gmail_=
signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div><div di=
r=3D"ltr"><div>----</div>Simon Jones</div></div></div></div></div><br></div=
></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr"=
>Simon Jones &lt;<a href=3D"mailto:batmanustc@gmail.com">batmanustc@gmail.c=
om</a>&gt; =E4=BA=8E2023=E5=B9=B43=E6=9C=8823=E6=97=A5=E5=91=A8=E5=9B=9B 05=
:49=E5=86=99=E9=81=93=EF=BC=9A<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex"><div dir=3D"ltr"><div>This is happened in ubuntu22.04.</div>=
<div><br></div><div>QEMU is install by apt like this:</div><div>apt install=
 -y qemu qemu-kvm qemu-system</div><div><br></div><div>and QEMU version is =
6.2.0<br></div><div><br></div><div><div dir=3D"ltr"><div dir=3D"ltr"><div><=
div dir=3D"ltr"><div>----</div>Simon Jones</div></div></div></div></div><br=
></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr"=
>Simon Jones &lt;<a href=3D"mailto:batmanustc@gmail.com" target=3D"_blank">=
batmanustc@gmail.com</a>&gt; =E4=BA=8E2023=E5=B9=B43=E6=9C=8821=E6=97=A5=E5=
=91=A8=E4=BA=8C 08:40=E5=86=99=E9=81=93=EF=BC=9A<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div><br><br>Hi all,<br><=
br>I start a VM in openstack, and openstack use libvirt to start qemu VM, b=
ut now log show this ERROR.<br>Is there any one know this?<br><br>The ERROR=
 log from /var/log/libvirt/qemu/instance-0000000e.log<br>```<br>2023-03-14T=
10:09:17.674114Z qemu-system-x86_64: kvm_set_user_memory_region: KVM_SET_US=
ER_MEMORY_REGION failed, slot=3D4, start=3D0xfffffffffe000000, size=3D0x200=
0: Invalid argument<br>kvm_set_phys_mem: error registering slot: Invalid ar=
gument<br>2023-03-14 10:09:18.198+0000: shutting down, reason=3Dcrashed<br>=
```<br><br>The xml file<br>```<br>root@c1c2:~# cat /etc/libvirt/qemu/instan=
ce-0000000e.xml<br>&lt;!--<br>WARNING: THIS IS AN AUTO-GENERATED FILE. CHAN=
GES TO IT ARE LIKELY TO BE<br>OVERWRITTEN AND LOST. Changes to this xml con=
figuration should be made using:<br>=C2=A0 virsh edit instance-0000000e<br>=
or other application using the libvirt API.<br>--&gt;<br><br>&lt;domain typ=
e=3D&#39;kvm&#39;&gt;<br>=C2=A0 &lt;name&gt;instance-0000000e&lt;/name&gt;<=
br>=C2=A0 &lt;uuid&gt;ff91d2dc-69a1-43ef-abde-c9e4e9a0305b&lt;/uuid&gt;<br>=
=C2=A0 &lt;metadata&gt;<br>=C2=A0 =C2=A0 &lt;nova:instance xmlns:nova=3D&qu=
ot;<a href=3D"http://openstack.org/xmlns/libvirt/nova/1.1" target=3D"_blank=
">http://openstack.org/xmlns/libvirt/nova/1.1</a>&quot;&gt;<br>=C2=A0 =C2=
=A0 =C2=A0 &lt;nova:package version=3D&quot;25.1.0&quot;/&gt;<br>=C2=A0 =C2=
=A0 =C2=A0 &lt;nova:name&gt;provider-instance&lt;/nova:name&gt;<br>=C2=A0 =
=C2=A0 =C2=A0 &lt;nova:creationTime&gt;2023-03-14 10:09:13&lt;/nova:creatio=
nTime&gt;<br>=C2=A0 =C2=A0 =C2=A0 &lt;nova:flavor name=3D&quot;cirros-os-dp=
u-test-1&quot;&gt;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;nova:memory&gt;64&lt;=
/nova:memory&gt;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;nova:disk&gt;1&lt;/nova=
:disk&gt;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;nova:swap&gt;0&lt;/nova:swap&g=
t;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;nova:ephemeral&gt;0&lt;/nova:ephemera=
l&gt;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;nova:vcpus&gt;1&lt;/nova:vcpus&gt;=
<br>=C2=A0 =C2=A0 =C2=A0 &lt;/nova:flavor&gt;<br>=C2=A0 =C2=A0 =C2=A0 &lt;n=
ova:owner&gt;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;nova:user uuid=3D&quot;ff6=
27ad39ed94479b9c5033bc462cf78&quot;&gt;admin&lt;/nova:user&gt;<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 &lt;nova:project uuid=3D&quot;512866f9994f4ad8916d8539=
a7cdeec9&quot;&gt;admin&lt;/nova:project&gt;<br>=C2=A0 =C2=A0 =C2=A0 &lt;/n=
ova:owner&gt;<br>=C2=A0 =C2=A0 =C2=A0 &lt;nova:root type=3D&quot;image&quot=
; uuid=3D&quot;9e58cb69-316a-4093-9f23-c1d1bd8edffe&quot;/&gt;<br>=C2=A0 =
=C2=A0 =C2=A0 &lt;nova:ports&gt;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;nova:po=
rt uuid=3D&quot;77c1dc00-af39-4463-bea0-12808f4bc340&quot;&gt;<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;nova:ip type=3D&quot;fixed&quot; address=3D=
&quot;172.1.1.43&quot; ipVersion=3D&quot;4&quot;/&gt;<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &lt;/nova:port&gt;<br>=C2=A0 =C2=A0 =C2=A0 &lt;/nova:ports&gt;<b=
r>=C2=A0 =C2=A0 &lt;/nova:instance&gt;<br>=C2=A0 &lt;/metadata&gt;<br>=C2=
=A0 &lt;memory unit=3D&#39;KiB&#39;&gt;65536&lt;/memory&gt;<br>=C2=A0 &lt;c=
urrentMemory unit=3D&#39;KiB&#39;&gt;65536&lt;/currentMemory&gt;<br>=C2=A0 =
&lt;vcpu placement=3D&#39;static&#39;&gt;1&lt;/vcpu&gt;<br>=C2=A0 &lt;sysin=
fo type=3D&#39;smbios&#39;&gt;<br>=C2=A0 =C2=A0 &lt;system&gt;<br>=C2=A0 =
=C2=A0 =C2=A0 &lt;entry name=3D&#39;manufacturer&#39;&gt;OpenStack Foundati=
on&lt;/entry&gt;<br>=C2=A0 =C2=A0 =C2=A0 &lt;entry name=3D&#39;product&#39;=
&gt;OpenStack Nova&lt;/entry&gt;<br>=C2=A0 =C2=A0 =C2=A0 &lt;entry name=3D&=
#39;version&#39;&gt;25.1.0&lt;/entry&gt;<br>=C2=A0 =C2=A0 =C2=A0 &lt;entry =
name=3D&#39;serial&#39;&gt;ff91d2dc-69a1-43ef-abde-c9e4e9a0305b&lt;/entry&g=
t;<br>=C2=A0 =C2=A0 =C2=A0 &lt;entry name=3D&#39;uuid&#39;&gt;ff91d2dc-69a1=
-43ef-abde-c9e4e9a0305b&lt;/entry&gt;<br>=C2=A0 =C2=A0 =C2=A0 &lt;entry nam=
e=3D&#39;family&#39;&gt;Virtual Machine&lt;/entry&gt;<br>=C2=A0 =C2=A0 &lt;=
/system&gt;<br>=C2=A0 &lt;/sysinfo&gt;<br>=C2=A0 &lt;os&gt;<br>=C2=A0 =C2=
=A0 &lt;type arch=3D&#39;x86_64&#39; machine=3D&#39;pc-i440fx-6.2&#39;&gt;h=
vm&lt;/type&gt;<br>=C2=A0 =C2=A0 &lt;boot dev=3D&#39;hd&#39;/&gt;<br>=C2=A0=
 =C2=A0 &lt;smbios mode=3D&#39;sysinfo&#39;/&gt;<br>=C2=A0 &lt;/os&gt;<br>=
=C2=A0 &lt;features&gt;<br>=C2=A0 =C2=A0 &lt;acpi/&gt;<br>=C2=A0 =C2=A0 &lt=
;apic/&gt;<br>=C2=A0 =C2=A0 &lt;vmcoreinfo state=3D&#39;on&#39;/&gt;<br>=C2=
=A0 &lt;/features&gt;<br>=C2=A0 &lt;cpu mode=3D&#39;host-model&#39; check=
=3D&#39;partial&#39;&gt;<br>=C2=A0 =C2=A0 &lt;topology sockets=3D&#39;1&#39=
; dies=3D&#39;1&#39; cores=3D&#39;1&#39; threads=3D&#39;1&#39;/&gt;<br>=C2=
=A0 &lt;/cpu&gt;<br>=C2=A0 &lt;clock offset=3D&#39;utc&#39;&gt;<br>=C2=A0 =
=C2=A0 &lt;timer name=3D&#39;pit&#39; tickpolicy=3D&#39;delay&#39;/&gt;<br>=
=C2=A0 =C2=A0 &lt;timer name=3D&#39;rtc&#39; tickpolicy=3D&#39;catchup&#39;=
/&gt;<br>=C2=A0 =C2=A0 &lt;timer name=3D&#39;hpet&#39; present=3D&#39;no&#3=
9;/&gt;<br>=C2=A0 &lt;/clock&gt;<br>=C2=A0 &lt;on_poweroff&gt;destroy&lt;/o=
n_poweroff&gt;<br>=C2=A0 &lt;on_reboot&gt;restart&lt;/on_reboot&gt;<br>=C2=
=A0 &lt;on_crash&gt;destroy&lt;/on_crash&gt;<br>=C2=A0 &lt;devices&gt;<br>=
=C2=A0 =C2=A0 &lt;emulator&gt;/usr/bin/qemu-system-x86_64&lt;/emulator&gt;<=
br>=C2=A0 =C2=A0 &lt;disk type=3D&#39;file&#39; device=3D&#39;disk&#39;&gt;=
<br>=C2=A0 =C2=A0 =C2=A0 &lt;driver name=3D&#39;qemu&#39; type=3D&#39;qcow2=
&#39; cache=3D&#39;none&#39;/&gt;<br>=C2=A0 =C2=A0 =C2=A0 &lt;source file=
=3D&#39;/var/lib/nova/instances/ff91d2dc-69a1-43ef-abde-c9e4e9a0305b/disk&#=
39;/&gt;<br>=C2=A0 =C2=A0 =C2=A0 &lt;target dev=3D&#39;vda&#39; bus=3D&#39;=
virtio&#39;/&gt;<br>=C2=A0 =C2=A0 =C2=A0 &lt;address type=3D&#39;pci&#39; d=
omain=3D&#39;0x0000&#39; bus=3D&#39;0x00&#39; slot=3D&#39;0x03&#39; functio=
n=3D&#39;0x0&#39;/&gt;<br>=C2=A0 =C2=A0 &lt;/disk&gt;<br>=C2=A0 =C2=A0 &lt;=
controller type=3D&#39;usb&#39; index=3D&#39;0&#39; model=3D&#39;piix3-uhci=
&#39;&gt;<br>=C2=A0 =C2=A0 =C2=A0 &lt;address type=3D&#39;pci&#39; domain=
=3D&#39;0x0000&#39; bus=3D&#39;0x00&#39; slot=3D&#39;0x01&#39; function=3D&=
#39;0x2&#39;/&gt;<br>=C2=A0 =C2=A0 &lt;/controller&gt;<br>=C2=A0 =C2=A0 &lt=
;controller type=3D&#39;pci&#39; index=3D&#39;0&#39; model=3D&#39;pci-root&=
#39;/&gt;<br>=C2=A0 =C2=A0 &lt;interface type=3D&#39;hostdev&#39; managed=
=3D&#39;yes&#39;&gt;<br>=C2=A0 =C2=A0 =C2=A0 &lt;mac address=3D&#39;fa:16:3=
e:aa:d9:23&#39;/&gt;<br>=C2=A0 =C2=A0 =C2=A0 &lt;source&gt;<br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &lt;address type=3D&#39;pci&#39; domain=3D&#39;0x0000&#39=
; bus=3D&#39;0x01&#39; slot=3D&#39;0x00&#39; function=3D&#39;0x5&#39;/&gt;<=
br>=C2=A0 =C2=A0 =C2=A0 &lt;/source&gt;<br>=C2=A0 =C2=A0 =C2=A0 &lt;address=
 type=3D&#39;pci&#39; domain=3D&#39;0x0000&#39; bus=3D&#39;0x00&#39; slot=
=3D&#39;0x04&#39; function=3D&#39;0x0&#39;/&gt;<br>=C2=A0 =C2=A0 &lt;/inter=
face&gt;<br>=C2=A0 =C2=A0 &lt;serial type=3D&#39;pty&#39;&gt;<br>=C2=A0 =C2=
=A0 =C2=A0 &lt;log file=3D&#39;/var/lib/nova/instances/ff91d2dc-69a1-43ef-a=
bde-c9e4e9a0305b/console.log&#39; append=3D&#39;off&#39;/&gt;<br>=C2=A0 =C2=
=A0 =C2=A0 &lt;target type=3D&#39;isa-serial&#39; port=3D&#39;0&#39;&gt;<br=
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;model name=3D&#39;isa-serial&#39;/&gt;<br>=
=C2=A0 =C2=A0 =C2=A0 &lt;/target&gt;<br>=C2=A0 =C2=A0 &lt;/serial&gt;<br>=
=C2=A0 =C2=A0 &lt;console type=3D&#39;pty&#39;&gt;<br>=C2=A0 =C2=A0 =C2=A0 =
&lt;log file=3D&#39;/var/lib/nova/instances/ff91d2dc-69a1-43ef-abde-c9e4e9a=
0305b/console.log&#39; append=3D&#39;off&#39;/&gt;<br>=C2=A0 =C2=A0 =C2=A0 =
&lt;target type=3D&#39;serial&#39; port=3D&#39;0&#39;/&gt;<br>=C2=A0 =C2=A0=
 &lt;/console&gt;<br>=C2=A0 =C2=A0 &lt;input type=3D&#39;tablet&#39; bus=3D=
&#39;usb&#39;&gt;<br>=C2=A0 =C2=A0 =C2=A0 &lt;address type=3D&#39;usb&#39; =
bus=3D&#39;0&#39; port=3D&#39;1&#39;/&gt;<br>=C2=A0 =C2=A0 &lt;/input&gt;<b=
r>=C2=A0 =C2=A0 &lt;input type=3D&#39;mouse&#39; bus=3D&#39;ps2&#39;/&gt;<b=
r>=C2=A0 =C2=A0 &lt;input type=3D&#39;keyboard&#39; bus=3D&#39;ps2&#39;/&gt=
;<br>=C2=A0 =C2=A0 &lt;graphics type=3D&#39;vnc&#39; port=3D&#39;-1&#39; au=
toport=3D&#39;yes&#39; listen=3D&#39;0.0.0.0&#39;&gt;<br>=C2=A0 =C2=A0 =C2=
=A0 &lt;listen type=3D&#39;address&#39; address=3D&#39;0.0.0.0&#39;/&gt;<br=
>=C2=A0 =C2=A0 &lt;/graphics&gt;<br>=C2=A0 =C2=A0 &lt;audio id=3D&#39;1&#39=
; type=3D&#39;none&#39;/&gt;<br>=C2=A0 =C2=A0 &lt;video&gt;<br>=C2=A0 =C2=
=A0 =C2=A0 &lt;model type=3D&#39;virtio&#39; heads=3D&#39;1&#39; primary=3D=
&#39;yes&#39;/&gt;<br>=C2=A0 =C2=A0 =C2=A0 &lt;address type=3D&#39;pci&#39;=
 domain=3D&#39;0x0000&#39; bus=3D&#39;0x00&#39; slot=3D&#39;0x02&#39; funct=
ion=3D&#39;0x0&#39;/&gt;<br>=C2=A0 =C2=A0 &lt;/video&gt;<br>=C2=A0 =C2=A0 &=
lt;hostdev mode=3D&#39;subsystem&#39; type=3D&#39;pci&#39; managed=3D&#39;y=
es&#39;&gt;<br>=C2=A0 =C2=A0 =C2=A0 &lt;source&gt;<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 &lt;address domain=3D&#39;0x0000&#39; bus=3D&#39;0x01&#39; slot=3D&#=
39;0x00&#39; function=3D&#39;0x6&#39;/&gt;<br>=C2=A0 =C2=A0 =C2=A0 &lt;/sou=
rce&gt;<br>=C2=A0 =C2=A0 =C2=A0 &lt;address type=3D&#39;pci&#39; domain=3D&=
#39;0x0000&#39; bus=3D&#39;0x00&#39; slot=3D&#39;0x05&#39; function=3D&#39;=
0x0&#39;/&gt;<br>=C2=A0 =C2=A0 &lt;/hostdev&gt;<br>=C2=A0 =C2=A0 &lt;membal=
loon model=3D&#39;virtio&#39;&gt;<br>=C2=A0 =C2=A0 =C2=A0 &lt;stats period=
=3D&#39;10&#39;/&gt;<br>=C2=A0 =C2=A0 =C2=A0 &lt;address type=3D&#39;pci&#3=
9; domain=3D&#39;0x0000&#39; bus=3D&#39;0x00&#39; slot=3D&#39;0x06&#39; fun=
ction=3D&#39;0x0&#39;/&gt;<br>=C2=A0 =C2=A0 &lt;/memballoon&gt;<br>=C2=A0 =
=C2=A0 &lt;rng model=3D&#39;virtio&#39;&gt;<br>=C2=A0 =C2=A0 =C2=A0 &lt;bac=
kend model=3D&#39;random&#39;&gt;/dev/urandom&lt;/backend&gt;<br>=C2=A0 =C2=
=A0 =C2=A0 &lt;address type=3D&#39;pci&#39; domain=3D&#39;0x0000&#39; bus=
=3D&#39;0x00&#39; slot=3D&#39;0x07&#39; function=3D&#39;0x0&#39;/&gt;<br>=
=C2=A0 =C2=A0 &lt;/rng&gt;<br>=C2=A0 &lt;/devices&gt;<br>&lt;/domain&gt;<br=
>```<br></div><div><br></div><div><br></div><div><div dir=3D"ltr"><div dir=
=3D"ltr"><div><div dir=3D"ltr"><div>----</div>Simon Jones</div></div></div>=
</div></div></div>
</blockquote></div>
</blockquote></div>

--0000000000004a235605f78d895c--

