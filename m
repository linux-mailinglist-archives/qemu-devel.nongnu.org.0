Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C0F3290B18
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Oct 2020 20:06:38 +0200 (CEST)
Received: from localhost ([::1]:49870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kTU7f-00006Y-3L
	for lists+qemu-devel@lfdr.de; Fri, 16 Oct 2020 14:06:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qkrwngud825@gmail.com>)
 id 1kTU5Z-000857-Ee
 for qemu-devel@nongnu.org; Fri, 16 Oct 2020 14:04:25 -0400
Received: from mail-vk1-xa2c.google.com ([2607:f8b0:4864:20::a2c]:33981)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <qkrwngud825@gmail.com>)
 id 1kTU5X-0005e3-EE
 for qemu-devel@nongnu.org; Fri, 16 Oct 2020 14:04:25 -0400
Received: by mail-vk1-xa2c.google.com with SMTP id l23so849122vkm.1
 for <qemu-devel@nongnu.org>; Fri, 16 Oct 2020 11:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=TKNMkNQYD5YnUlHeNOn6D71oHuVuWz5gNV4wr6TlkcQ=;
 b=VBi/XqYx4yBAT9GGZAzS4ZLyMEaYoLP4IuffC16cW9+Xo8HXbKfN/4jfoegc2qGZnx
 CzM9sA8r4Uu4E+iRbXSSg07ReCKwgKl8wo2DZnPK/SKxvcpQDAvx7KprdOcDqxq0/yED
 Mnb6Fy7OwNEdTDwWvWp8eT3FpBYSc+haejI0XS/l/ZIxKnfA++c8MDLNWojdZ24gEVK5
 I9OVlFPX5ZbC5O+gdM5XsJy5yS7cDkQL296I5yjiMw7QgGUa7PpsQvslmPLHiApWFzIL
 Vk7ISgk7mgUeZGQv98VNJE/n2/D7hYfZBmTOTzltQvVFYNdCYFPhIQVv3G2j60QhPupI
 5foQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=TKNMkNQYD5YnUlHeNOn6D71oHuVuWz5gNV4wr6TlkcQ=;
 b=owmxh0wTHaNXkCO67xeeIYalCoGkvm1G9OqbI3Gk7fvtRM7H4650aYUIbj51Rk63xO
 dZIN4eJ2A/haEAI43w0g8LBFfxA4IWLkFnUIljd5tttkcY9IWmAkrOz8P+DYk9JctcB3
 KGWNrvpOlQaHvT/6C5BEYbOiof/ZZO0QfXMHWdREc/Be4aljQsSO0l5V2YZfaXO3HfOs
 X0pi9WHBPjxXi8LTeZrsAOY27P3mcm2sBrcMPx7P+zY3ThwQ66sRzZ4asuqUHhnHYE1T
 wI7AOK4bGvF0gE+FaJwthixqCtZ90oQFHWxAyXSbokeezMf/nhOZq1NY7R6628Od0cjI
 jCFQ==
X-Gm-Message-State: AOAM5335sRjFoth1tJpq8HibKoibEf93dws2FZbncFUWSnqFEZ31sB6A
 s4qiLM7L9uknGiVAwtqOO8RqMNfbxZWRX903/4M=
X-Google-Smtp-Source: ABdhPJyxmfc10Jf/mWmIWMCOjaf1rTqrOLpefJM2BAVradxnD/By32suMTNaCkHEO5n8QBalC2yBVfkPqmfiFpQ2F2g=
X-Received: by 2002:a1f:2389:: with SMTP id j131mr3493742vkj.18.1602871461704; 
 Fri, 16 Oct 2020 11:04:21 -0700 (PDT)
MIME-Version: 1.0
References: <CAD14+f3G2f4QEK+AQaEjAG4syUOK-9bDagXa8D=RxdFWdoi5fQ@mail.gmail.com>
 <20201001085900.ms5ix2zyoid7v3ra@steredhat>
 <CAD14+f1m8Xk-VC1nyMh-X4BfWJgObb74_nExhO0VO3ezh_G2jA@mail.gmail.com>
 <20201002073457.jzkmefo5c65zlka7@steredhat>
In-Reply-To: <20201002073457.jzkmefo5c65zlka7@steredhat>
From: Ju Hyung Park <qkrwngud825@gmail.com>
Date: Sat, 17 Oct 2020 03:04:10 +0900
Message-ID: <CAD14+f0h4Vp=bsgpByTmaOU-Vbz6nnShDHg=0MSg4WO5ZyO=vA@mail.gmail.com>
Subject: Re: io_uring possibly the culprit for qemu hang (linux-5.4.y)
To: Jens Axboe <axboe@kernel.dk>, Stefano Garzarella <sgarzare@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2c;
 envelope-from=qkrwngud825@gmail.com; helo=mail-vk1-xa2c.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -7
X-Spam_score: -0.8
X-Spam_bar: /
X-Spam_report: (-0.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HK_RANDOM_ENVFROM=0.001,
 HK_RANDOM_FROM=0.999, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: io-uring@vger.kernel.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A small update:

As per Stefano's suggestion, disabling io_uring support from QEMU from
the configuration step did fix the problem and I'm no longer having
hangs.

Looks like it __is__ an io_uring issue :(

Btw, I used liburing fe50048 for linking QEMU.

Thanks.


On Fri, Oct 2, 2020 at 4:35 PM Stefano Garzarella <sgarzare@redhat.com> wro=
te:
>
> Hi Ju,
>
> On Thu, Oct 01, 2020 at 11:30:14PM +0900, Ju Hyung Park wrote:
> > Hi Stefano,
> >
> > On Thu, Oct 1, 2020 at 5:59 PM Stefano Garzarella <sgarzare@redhat.com>=
 wrote:
> > > Please, can you share the qemu command line that you are using?
> > > This can be useful for the analysis.
> >
> > Sure.
>
> Thanks for sharing.
>
> The issue seems related to io_uring and the new io_uring fd monitoring
> implementation available from QEMU 5.0.
>
> I'll try to reproduce.
>
> For now, as a workaround, you can rebuild qemu by disabling io-uring supp=
ort:
>
>   ../configure --disable-linux-io-uring ...
>
>
> Thanks,
> Stefano
>
> >
> > QEMU:
> > /usr/bin/qemu-system-x86_64 -name guest=3Dwin10,debug-threads=3Don -S
> > -object secret,id=3DmasterKey0,format=3Draw,file=3D/var/lib/libvirt/qem=
u/domain-1-win10/master-key.aes
> > -blockdev {"driver":"file","filename":"/usr/share/OVMF/OVMF_CODE.fd","n=
ode-name":"libvirt-pflash0-storage","auto-read-only":true,"discard":"unmap"=
}
> > -blockdev {"node-name":"libvirt-pflash0-format","read-only":true,"drive=
r":"raw","file":"libvirt-pflash0-storage"}
> > -blockdev {"driver":"file","filename":"/var/lib/libvirt/qemu/nvram/win1=
0_VARS.fd","node-name":"libvirt-pflash1-storage","auto-read-only":true,"dis=
card":"unmap"}
> > -blockdev {"node-name":"libvirt-pflash1-format","read-only":false,"driv=
er":"raw","file":"libvirt-pflash1-storage"}
> > -machine pc-q35-5.0,accel=3Dkvm,usb=3Doff,vmport=3Doff,dump-guest-core=
=3Doff,mem-merge=3Doff,pflash0=3Dlibvirt-pflash0-format,pflash1=3Dlibvirt-p=
flash1-format
> > -cpu Skylake-Client-IBRS,ss=3Don,vmx=3Don,hypervisor=3Don,tsc-adjust=3D=
on,clflushopt=3Don,umip=3Don,md-clear=3Don,stibp=3Don,arch-capabilities=3Do=
n,ssbd=3Don,xsaves=3Don,pdpe1gb=3Don,ibpb=3Don,amd-ssbd=3Don,fma=3Doff,avx=
=3Doff,f16c=3Doff,rdrand=3Doff,bmi1=3Doff,hle=3Doff,avx2=3Doff,bmi2=3Doff,r=
tm=3Doff,rdseed=3Doff,adx=3Doff,hv-time,hv-relaxed,hv-vapic,hv-spinlocks=3D=
0x1fff,hv-vpindex,hv-runtime,hv-synic,hv-stimer,hv-reset
> > -m 8192 -mem-prealloc -mem-path /dev/hugepages/libvirt/qemu/1-win10
> > -overcommit mem-lock=3Doff -smp 4,sockets=3D1,dies=3D1,cores=3D2,thread=
s=3D2
> > -uuid 7ccc3031-1dab-4267-b72a-d60065b5ff7f -display none
> > -no-user-config -nodefaults -chardev
> > socket,id=3Dcharmonitor,fd=3D32,server,nowait -mon
> > chardev=3Dcharmonitor,id=3Dmonitor,mode=3Dcontrol -rtc
> > base=3Dlocaltime,driftfix=3Dslew -global kvm-pit.lost_tick_policy=3Ddel=
ay
> > -no-hpet -no-shutdown -global ICH9-LPC.disable_s3=3D1 -global
> > ICH9-LPC.disable_s4=3D1 -boot menu=3Doff,strict=3Don -device
> > pcie-root-port,port=3D0x8,chassis=3D1,id=3Dpci.1,bus=3Dpcie.0,multifunc=
tion=3Don,addr=3D0x1
> > -device pcie-root-port,port=3D0x9,chassis=3D2,id=3Dpci.2,bus=3Dpcie.0,a=
ddr=3D0x1.0x1
> > -device pcie-root-port,port=3D0xa,chassis=3D3,id=3Dpci.3,bus=3Dpcie.0,a=
ddr=3D0x1.0x2
> > -device pcie-root-port,port=3D0xb,chassis=3D4,id=3Dpci.4,bus=3Dpcie.0,a=
ddr=3D0x1.0x3
> > -device pcie-pci-bridge,id=3Dpci.5,bus=3Dpci.2,addr=3D0x0 -device
> > qemu-xhci,id=3Dusb,bus=3Dpci.1,addr=3D0x0 -blockdev
> > {"driver":"host_device","filename":"/dev/disk/by-partuuid/05c3750b-060f=
-4703-95ea-6f5e546bf6e9","node-name":"libvirt-1-storage","cache":{"direct":=
false,"no-flush":true},"auto-read-only":true,"discard":"unmap"}
> > -blockdev {"node-name":"libvirt-1-format","read-only":false,"discard":"=
unmap","detect-zeroes":"unmap","cache":{"direct":false,"no-flush":true},"dr=
iver":"raw","file":"libvirt-1-storage"}
> > -device virtio-blk-pci,scsi=3Doff,bus=3Dpcie.0,addr=3D0xa,drive=3Dlibvi=
rt-1-format,id=3Dvirtio-disk0,bootindex=3D1,write-cache=3Don
> > -netdev tap,fd=3D34,id=3Dhostnet0 -device
> > e1000,netdev=3Dhostnet0,id=3Dnet0,mac=3D52:54:00:c6:bb:bc,bus=3Dpcie.0,=
addr=3D0x3
> > -device ich9-intel-hda,id=3Dsound0,bus=3Dpcie.0,addr=3D0x4 -device
> > hda-duplex,id=3Dsound0-codec0,bus=3Dsound0.0,cad=3D0 -device
> > vfio-pci,host=3D0000:00:02.0,id=3Dhostdev0,bus=3Dpcie.0,addr=3D0x2,romb=
ar=3D0
> > -device virtio-balloon-pci,id=3Dballoon0,bus=3Dpcie.0,addr=3D0x8 -objec=
t
> > rng-random,id=3Dobjrng0,filename=3D/dev/urandom -device
> > virtio-rng-pci,rng=3Dobjrng0,id=3Drng0,bus=3Dpcie.0,addr=3D0x9 -msg
> > timestamp=3Don
> >
> > And I use libvirt 6.3.0 to manage the VM. Here's an xml of my VM.
> >
> > <domain type=3D"kvm">
> >   <name>win10</name>
> >   <uuid>7ccc3031-1dab-4267-b72a-d60065b5ff7f</uuid>
> >   <metadata>
> >     <libosinfo:libosinfo
> > xmlns:libosinfo=3D"http://libosinfo.org/xmlns/libvirt/domain/1.0">
> >       <libosinfo:os id=3D"http://microsoft.com/win/10"/>
> >     </libosinfo:libosinfo>
> >   </metadata>
> >   <memory unit=3D"KiB">8388608</memory>
> >   <currentMemory unit=3D"KiB">8388608</currentMemory>
> >   <memoryBacking>
> >     <hugepages/>
> >     <nosharepages/>
> >   </memoryBacking>
> >   <vcpu placement=3D"static">4</vcpu>
> >   <cputune>
> >     <vcpupin vcpu=3D"0" cpuset=3D"0"/>
> >     <vcpupin vcpu=3D"1" cpuset=3D"2"/>
> >     <vcpupin vcpu=3D"2" cpuset=3D"1"/>
> >     <vcpupin vcpu=3D"3" cpuset=3D"3"/>
> >   </cputune>
> >   <os>
> >     <type arch=3D"x86_64" machine=3D"pc-q35-5.0">hvm</type>
> >     <loader readonly=3D"yes" type=3D"pflash">/usr/share/OVMF/OVMF_CODE.=
fd</loader>
> >     <nvram>/var/lib/libvirt/qemu/nvram/win10_VARS.fd</nvram>
> >     <boot dev=3D"hd"/>
> >     <bootmenu enable=3D"no"/>
> >   </os>
> >   <features>
> >     <acpi/>
> >     <apic/>
> >     <hyperv>
> >       <relaxed state=3D"on"/>
> >       <vapic state=3D"on"/>
> >       <spinlocks state=3D"on" retries=3D"8191"/>
> >       <vpindex state=3D"on"/>
> >       <runtime state=3D"on"/>
> >       <synic state=3D"on"/>
> >       <stimer state=3D"on"/>
> >       <reset state=3D"on"/>
> >     </hyperv>
> >     <vmport state=3D"off"/>
> >   </features>
> >   <cpu mode=3D"host-model" check=3D"partial">
> >     <topology sockets=3D"1" dies=3D"1" cores=3D"2" threads=3D"2"/>
> >   </cpu>
> >   <clock offset=3D"localtime">
> >     <timer name=3D"rtc" tickpolicy=3D"catchup"/>
> >     <timer name=3D"pit" tickpolicy=3D"delay"/>
> >     <timer name=3D"hpet" present=3D"no"/>
> >     <timer name=3D"hypervclock" present=3D"yes"/>
> >   </clock>
> >   <on_poweroff>destroy</on_poweroff>
> >   <on_reboot>restart</on_reboot>
> >   <on_crash>destroy</on_crash>
> >   <pm>
> >     <suspend-to-mem enabled=3D"no"/>
> >     <suspend-to-disk enabled=3D"no"/>
> >   </pm>
> >   <devices>
> >     <emulator>/usr/bin/qemu-system-x86_64</emulator>
> >     <disk type=3D"block" device=3D"disk">
> >       <driver name=3D"qemu" type=3D"raw" cache=3D"unsafe" discard=3D"un=
map"
> > detect_zeroes=3D"unmap"/>
> >       <source dev=3D"/dev/disk/by-partuuid/05c3750b-060f-4703-95ea-6f5e=
546bf6e9"/>
> >       <target dev=3D"vda" bus=3D"virtio"/>
> >       <address type=3D"pci" domain=3D"0x0000" bus=3D"0x00" slot=3D"0x0a=
"
> > function=3D"0x0"/>
> >     </disk>
> >     <controller type=3D"pci" index=3D"0" model=3D"pcie-root"/>
> >     <controller type=3D"pci" index=3D"1" model=3D"pcie-root-port">
> >       <model name=3D"pcie-root-port"/>
> >       <target chassis=3D"1" port=3D"0x8"/>
> >       <address type=3D"pci" domain=3D"0x0000" bus=3D"0x00" slot=3D"0x01=
"
> > function=3D"0x0" multifunction=3D"on"/>
> >     </controller>
> >     <controller type=3D"pci" index=3D"2" model=3D"pcie-root-port">
> >       <model name=3D"pcie-root-port"/>
> >       <target chassis=3D"2" port=3D"0x9"/>
> >       <address type=3D"pci" domain=3D"0x0000" bus=3D"0x00" slot=3D"0x01=
"
> > function=3D"0x1"/>
> >     </controller>
> >     <controller type=3D"pci" index=3D"3" model=3D"pcie-root-port">
> >       <model name=3D"pcie-root-port"/>
> >       <target chassis=3D"3" port=3D"0xa"/>
> >       <address type=3D"pci" domain=3D"0x0000" bus=3D"0x00" slot=3D"0x01=
"
> > function=3D"0x2"/>
> >     </controller>
> >     <controller type=3D"pci" index=3D"4" model=3D"pcie-root-port">
> >       <model name=3D"pcie-root-port"/>
> >       <target chassis=3D"4" port=3D"0xb"/>
> >       <address type=3D"pci" domain=3D"0x0000" bus=3D"0x00" slot=3D"0x01=
"
> > function=3D"0x3"/>
> >     </controller>
> >     <controller type=3D"pci" index=3D"5" model=3D"pcie-to-pci-bridge">
> >       <model name=3D"pcie-pci-bridge"/>
> >       <address type=3D"pci" domain=3D"0x0000" bus=3D"0x02" slot=3D"0x00=
"
> > function=3D"0x0"/>
> >     </controller>
> >     <controller type=3D"usb" index=3D"0" model=3D"qemu-xhci">
> >       <address type=3D"pci" domain=3D"0x0000" bus=3D"0x01" slot=3D"0x00=
"
> > function=3D"0x0"/>
> >     </controller>
> >     <controller type=3D"sata" index=3D"0">
> >       <address type=3D"pci" domain=3D"0x0000" bus=3D"0x00" slot=3D"0x1f=
"
> > function=3D"0x2"/>
> >     </controller>
> >     <interface type=3D"network">
> >       <mac address=3D"52:54:00:c6:bb:bc"/>
> >       <source network=3D"default"/>
> >       <model type=3D"e1000"/>
> >       <address type=3D"pci" domain=3D"0x0000" bus=3D"0x00" slot=3D"0x03=
"
> > function=3D"0x0"/>
> >     </interface>
> >     <input type=3D"mouse" bus=3D"ps2"/>
> >     <input type=3D"keyboard" bus=3D"ps2"/>
> >     <sound model=3D"ich9">
> >       <address type=3D"pci" domain=3D"0x0000" bus=3D"0x00" slot=3D"0x04=
"
> > function=3D"0x0"/>
> >     </sound>
> >     <hostdev mode=3D"subsystem" type=3D"pci" managed=3D"yes">
> >       <source>
> >         <address domain=3D"0x0000" bus=3D"0x00" slot=3D"0x02" function=
=3D"0x0"/>
> >       </source>
> >       <rom bar=3D"off"/>
> >       <address type=3D"pci" domain=3D"0x0000" bus=3D"0x00" slot=3D"0x02=
"
> > function=3D"0x0"/>
> >     </hostdev>
> >     <memballoon model=3D"virtio">
> >       <address type=3D"pci" domain=3D"0x0000" bus=3D"0x00" slot=3D"0x08=
"
> > function=3D"0x0"/>
> >     </memballoon>
> >     <rng model=3D"virtio">
> >       <backend model=3D"random">/dev/urandom</backend>
> >       <address type=3D"pci" domain=3D"0x0000" bus=3D"0x00" slot=3D"0x09=
"
> > function=3D"0x0"/>
> >     </rng>
> >   </devices>
> > </domain>
> >
>

