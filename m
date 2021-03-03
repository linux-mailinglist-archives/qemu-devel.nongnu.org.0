Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D684332B933
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 17:25:54 +0100 (CET)
Received: from localhost ([::1]:45928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHUJt-0002lc-VQ
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 11:25:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lHUIO-0001uz-8q
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 11:24:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:26911)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lHUIL-0000rT-QW
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 11:24:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614788656;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YZ6Bb9hAWZ7ogeqSM24/cty+wt2G4PUwHb3Dkm36eJ0=;
 b=U8W0dB+mqCTjVi9VVSCS3C9UshHZzcA6bD2EZL1a+iqsoRs+d7VvczHkSlhAkFRMtxfMF2
 XzMgsyXyQI0BvgoQYn+/8rDridi1MxWZ5fQ7pOESnkrPt2Gw7uEgIGMXqOu3fXjjE0Hguv
 E0IVmEgCraWHyjQZ0kw6b0h4pJM32GA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-548-s9FGvuD3OiO_KWkstfFmBg-1; Wed, 03 Mar 2021 11:24:12 -0500
X-MC-Unique: s9FGvuD3OiO_KWkstfFmBg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D9B229126F;
 Wed,  3 Mar 2021 16:24:09 +0000 (UTC)
Received: from MiWiFi-RA69-srv (unknown [10.40.208.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AAEC05D736;
 Wed,  3 Mar 2021 16:24:01 +0000 (UTC)
Date: Wed, 3 Mar 2021 17:23:59 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Nick <1917565@bugs.launchpad.net>
Subject: Re: [Bug 1917565] Re: Windows 10 fails with "Boot device inaccessible"
Message-ID: <20210303172359.6e2fe7a4@MiWiFi-RA69-srv>
In-Reply-To: <161474825243.14335.6768256697579382540.launchpad@wampee.canonical.com>
References: <161474788220.8516.15014999465847517073.malonedeb@gac.canonical.com>
 <161474825243.14335.6768256697579382540.launchpad@wampee.canonical.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Vitaly Cheptsov <cheptsov@ispras.ru>,
 Thomas Lamprecht <t.lamprecht@proxmox.com>, qemu-devel@nongnu.org,
 mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 03 Mar 2021 05:10:51 -0000
Nick <1917565@bugs.launchpad.net> wrote:



Is it happening to preexisting guest images only or to clean install as wel=
l?



> ** Description changed:
>=20
>   The issue is happening on all versions I tried after the following
> - commit.
> + commit. I can also remove this individual from master and it starts to
> + work.
>  =20
>   git diff af1b80ae56c9495999e8ccf7b70ef894378de642~ af1b80ae56c9495999e8=
ccf7b70ef894378de642
>   diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
>   index b7bcbbbb2a..7a5a8b3521 100644
>   --- a/hw/i386/acpi-build.c
>   +++ b/hw/i386/acpi-build.c
>   @@ -1497,7 +1497,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker=
,
> -          dev =3D aml_device("PCI0");
> -          aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0A03")));
> -          aml_append(dev, aml_name_decl("_ADR", aml_int(0)));
> + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0dev =3D aml_devic=
e("PCI0");
> + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0aml_append(dev, a=
ml_name_decl("_HID", aml_eisaid("PNP0A03")));
> + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0aml_append(dev, a=
ml_name_decl("_ADR", aml_int(0)));
>   -        aml_append(dev, aml_name_decl("_UID", aml_int(1)));
>   +        aml_append(dev, aml_name_decl("_UID", aml_int(0)));
> -          aml_append(sb_scope, dev);
> -          aml_append(dsdt, sb_scope);
> - =20
> + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0aml_append(sb_sco=
pe, dev);
> + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0aml_append(dsdt, =
sb_scope);
> +=20
>   @@ -1512,7 +1512,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker=
,
> -          aml_append(dev, aml_name_decl("_HID", aml_eisaid("PNP0A08")));
> -          aml_append(dev, aml_name_decl("_CID", aml_eisaid("PNP0A03")));
> -          aml_append(dev, aml_name_decl("_ADR", aml_int(0)));
> + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0aml_append(dev, a=
ml_name_decl("_HID", aml_eisaid("PNP0A08")));
> + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0aml_append(dev, a=
ml_name_decl("_CID", aml_eisaid("PNP0A03")));
> + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0aml_append(dev, a=
ml_name_decl("_ADR", aml_int(0)));
>   -        aml_append(dev, aml_name_decl("_UID", aml_int(1)));
>   +        aml_append(dev, aml_name_decl("_UID", aml_int(0)));
> -          aml_append(dev, build_q35_osc_method());
> -          aml_append(sb_scope, dev);
> -          aml_append(dsdt, sb_scope);
> + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0aml_append(dev, b=
uild_q35_osc_method());
> + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0aml_append(sb_sco=
pe, dev);
> + =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0aml_append(dsdt, =
sb_scope);
>  =20
>   The virtual machine start command:
>   x86_64-softmmu/qemu-system-x86_64 -name guest=3Dwin10-dev,debug-threads=
=3Don -blockdev '{"driver":"file","filename":"/usr/share/OVMF/OVMF_CODE.fd"=
,"node-name":"libvirt-pflash0-storage","auto-read-only":true,"discard":"unm=
ap"}' -blockdev '{"node-name":"libvirt-pflash0-format","read-only":true,"dr=
iver":"raw","file":"libvirt-pflash0-storage"}' -blockdev '{"driver":"file",=
"filename":"/var/lib/libvirt/qemu/nvram/win10-dev_VARS.fd","node-name":"lib=
virt-pflash1-storage","auto-read-only":true,"discard":"unmap"}' -blockdev '=
{"node-name":"libvirt-pflash1-format","read-only":false,"driver":"raw","fil=
e":"libvirt-pflash1-storage"}' -machine pc-q35-4.2,accel=3Dkvm,usb=3Doff,vm=
port=3Doff,dump-guest-core=3Doff,pflash0=3Dlibvirt-pflash0-format,pflash1=
=3Dlibvirt-pflash1-format -cpu Skylake-Client-IBRS,ss=3Don,vmx=3Don,pdcm=3D=
on,hypervisor=3Don,tsc-adjust=3Don,clflushopt=3Don,umip=3Don,md-clear=3Don,=
stibp=3Don,arch-capabilities=3Don,ssbd=3Don,xsaves=3Don,pdpe1gb=3Don,ibpb=
=3Don,amd-ssbd=3Don,skip-l1dfl-vmentry=3Don,pschange-mc-no=3Don,hv-time,hv-=
relaxed,hv-vapic,hv-spinlocks=3D0x1fff -m 6144 -overcommit mem-lock=3Doff -=
smp 4,sockets=3D4,cores=3D1,threads=3D1 -uuid 5646e540-5022-4ace-8d6a-d7c4b=
61a6d3d -no-user-config -nodefaults -rtc base=3Dlocaltime,driftfix=3Dslew -=
global kvm-pit.lost_tick_policy=3Ddelay -no-hpet -global ICH9-LPC.disable_s=
3=3D1 -global ICH9-LPC.disable_s4=3D1 -boot strict=3Don -device pcie-root-p=
ort,port=3D0x10,chassis=3D1,id=3Dpci.1,bus=3Dpcie.0,multifunction=3Don,addr=
=3D0x2 -device pcie-root-port,port=3D0x11,chassis=3D2,id=3Dpci.2,bus=3Dpcie=
.0,addr=3D0x2.0x1 -device pcie-root-port,port=3D0x12,chassis=3D3,id=3Dpci.3=
,bus=3Dpcie.0,addr=3D0x2.0x2 -device pcie-root-port,port=3D0x13,chassis=3D4=
,id=3Dpci.4,bus=3Dpcie.0,addr=3D0x2.0x3 -device pcie-root-port,port=3D0x14,=
chassis=3D5,id=3Dpci.5,bus=3Dpcie.0,addr=3D0x2.0x4 -device qemu-xhci,p2=3D1=
5,p3=3D15,id=3Dusb,bus=3Dpci.2,addr=3D0x0 -device virtio-serial-pci,id=3Dvi=
rtio-serial0,bus=3Dpci.3,addr=3D0x0 -blockdev '{"driver":"host_device","fil=
ename":"/dev/disk/by-id/scsi-1SanDisk_Extreme_SSD_20072F404043","aio":"nati=
ve","node-name":"libvirt-2-storage","cache":{"direct":true,"no-flush":false=
},"auto-read-only":true,"discard":"unmap"}' -blockdev '{"node-name":"libvir=
t-2-format","read-only":false,"cache":{"direct":true,"no-flush":false},"dri=
ver":"raw","file":"libvirt-2-storage"}' -device ide-hd,bus=3Dide.0,drive=3D=
libvirt-2-format,id=3Dsata0-0-0,bootindex=3D1,write-cache=3Don -device ide-=
cd,bus=3Dide.1,id=3Dsata0-0-1 -netdev user,id=3Dhostnet0 -device e1000e,net=
dev=3Dhostnet0,id=3Dnet0,mac=3D52:54:00:10:5b:55,bus=3Dpci.1,addr=3D0x0 -ch=
ardev pty,id=3Dcharserial0 -device isa-serial,chardev=3Dcharserial0,id=3Dse=
rial0 -chardev spicevmc,id=3Dcharchannel0,name=3Dvdagent -device virtserial=
port,bus=3Dvirtio-serial0.0,nr=3D1,chardev=3Dcharchannel0,id=3Dchannel0,nam=
e=3Dcom.redhat.spice.0 -device usb-tablet,id=3Dinput0,bus=3Dusb.0,port=3D1 =
-spice port=3D5900,addr=3D127.0.0.1,disable-ticketing=3Don,image-compressio=
n=3Doff,seamless-migration=3Don -device qxl-vga,id=3Dvideo0,ram_size=3D6710=
8864,vram_size=3D67108864,vram64_size_mb=3D0,vgamem_mb=3D16,max_outputs=3D1=
,bus=3Dpcie.0,addr=3D0x1 -device ich9-intel-hda,id=3Dsound0,bus=3Dpcie.0,ad=
dr=3D0x1b -device hda-duplex,id=3Dsound0-codec0,bus=3Dsound0.0,cad=3D0 -cha=
rdev spicevmc,id=3Dcharredir0,name=3Dusbredir -device usb-redir,chardev=3Dc=
harredir0,id=3Dredir0,bus=3Dusb.0,port=3D2 -chardev spicevmc,id=3Dcharredir=
1,name=3Dusbredir -device usb-redir,chardev=3Dcharredir1,id=3Dredir1,bus=3D=
usb.0,port=3D3 -device virtio-balloon-pci,id=3Dballoon0,bus=3Dpci.4,addr=3D=
0x0 -msg timestamp=3Don -D ./log.txt -monitor stdio -d
>=20
> ** Description changed:
>=20
>   The issue is happening on all versions I tried after the following
> - commit. I can also remove this individual from master and it starts to
> - work.
> + commit. I can also remove this individual change from master and it
> + starts to work.
>  =20
>   git diff af1b80ae56c9495999e8ccf7b70ef894378de642~ af1b80ae56c9495999e8=
ccf7b70ef894378de642
>   diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
>   index b7bcbbbb2a..7a5a8b3521 100644
>   --- a/hw/i386/acpi-build.c
>   +++ b/hw/i386/acpi-build.c
>   @@ -1497,7 +1497,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker=
,
>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0dev =3D aml_devic=
e("PCI0");
>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0aml_append(dev, a=
ml_name_decl("_HID", aml_eisaid("PNP0A03")));
>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0aml_append(dev, a=
ml_name_decl("_ADR", aml_int(0)));
>   -        aml_append(dev, aml_name_decl("_UID", aml_int(1)));
>   +        aml_append(dev, aml_name_decl("_UID", aml_int(0)));
>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0aml_append(sb_sco=
pe, dev);
>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0aml_append(dsdt, =
sb_scope);
>  =20
>   @@ -1512,7 +1512,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker=
,
>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0aml_append(dev, a=
ml_name_decl("_HID", aml_eisaid("PNP0A08")));
>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0aml_append(dev, a=
ml_name_decl("_CID", aml_eisaid("PNP0A03")));
>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0aml_append(dev, a=
ml_name_decl("_ADR", aml_int(0)));
>   -        aml_append(dev, aml_name_decl("_UID", aml_int(1)));
>   +        aml_append(dev, aml_name_decl("_UID", aml_int(0)));
>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0aml_append(dev, b=
uild_q35_osc_method());
>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0aml_append(sb_sco=
pe, dev);
>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0aml_append(dsdt, =
sb_scope);
>  =20
>   The virtual machine start command:
>   x86_64-softmmu/qemu-system-x86_64 -name guest=3Dwin10-dev,debug-threads=
=3Don -blockdev '{"driver":"file","filename":"/usr/share/OVMF/OVMF_CODE.fd"=
,"node-name":"libvirt-pflash0-storage","auto-read-only":true,"discard":"unm=
ap"}' -blockdev '{"node-name":"libvirt-pflash0-format","read-only":true,"dr=
iver":"raw","file":"libvirt-pflash0-storage"}' -blockdev '{"driver":"file",=
"filename":"/var/lib/libvirt/qemu/nvram/win10-dev_VARS.fd","node-name":"lib=
virt-pflash1-storage","auto-read-only":true,"discard":"unmap"}' -blockdev '=
{"node-name":"libvirt-pflash1-format","read-only":false,"driver":"raw","fil=
e":"libvirt-pflash1-storage"}' -machine pc-q35-4.2,accel=3Dkvm,usb=3Doff,vm=
port=3Doff,dump-guest-core=3Doff,pflash0=3Dlibvirt-pflash0-format,pflash1=
=3Dlibvirt-pflash1-format -cpu Skylake-Client-IBRS,ss=3Don,vmx=3Don,pdcm=3D=
on,hypervisor=3Don,tsc-adjust=3Don,clflushopt=3Don,umip=3Don,md-clear=3Don,=
stibp=3Don,arch-capabilities=3Don,ssbd=3Don,xsaves=3Don,pdpe1gb=3Don,ibpb=
=3Don,amd-ssbd=3Don,skip-l1dfl-vmentry=3Don,pschange-mc-no=3Don,hv-time,hv-=
relaxed,hv-vapic,hv-spinlocks=3D0x1fff -m 6144 -overcommit mem-lock=3Doff -=
smp 4,sockets=3D4,cores=3D1,threads=3D1 -uuid 5646e540-5022-4ace-8d6a-d7c4b=
61a6d3d -no-user-config -nodefaults -rtc base=3Dlocaltime,driftfix=3Dslew -=
global kvm-pit.lost_tick_policy=3Ddelay -no-hpet -global ICH9-LPC.disable_s=
3=3D1 -global ICH9-LPC.disable_s4=3D1 -boot strict=3Don -device pcie-root-p=
ort,port=3D0x10,chassis=3D1,id=3Dpci.1,bus=3Dpcie.0,multifunction=3Don,addr=
=3D0x2 -device pcie-root-port,port=3D0x11,chassis=3D2,id=3Dpci.2,bus=3Dpcie=
.0,addr=3D0x2.0x1 -device pcie-root-port,port=3D0x12,chassis=3D3,id=3Dpci.3=
,bus=3Dpcie.0,addr=3D0x2.0x2 -device pcie-root-port,port=3D0x13,chassis=3D4=
,id=3Dpci.4,bus=3Dpcie.0,addr=3D0x2.0x3 -device pcie-root-port,port=3D0x14,=
chassis=3D5,id=3Dpci.5,bus=3Dpcie.0,addr=3D0x2.0x4 -device qemu-xhci,p2=3D1=
5,p3=3D15,id=3Dusb,bus=3Dpci.2,addr=3D0x0 -device virtio-serial-pci,id=3Dvi=
rtio-serial0,bus=3Dpci.3,addr=3D0x0 -blockdev '{"driver":"host_device","fil=
ename":"/dev/disk/by-id/scsi-1SanDisk_Extreme_SSD_20072F404043","aio":"nati=
ve","node-name":"libvirt-2-storage","cache":{"direct":true,"no-flush":false=
},"auto-read-only":true,"discard":"unmap"}' -blockdev '{"node-name":"libvir=
t-2-format","read-only":false,"cache":{"direct":true,"no-flush":false},"dri=
ver":"raw","file":"libvirt-2-storage"}' -device ide-hd,bus=3Dide.0,drive=3D=
libvirt-2-format,id=3Dsata0-0-0,bootindex=3D1,write-cache=3Don -device ide-=
cd,bus=3Dide.1,id=3Dsata0-0-1 -netdev user,id=3Dhostnet0 -device e1000e,net=
dev=3Dhostnet0,id=3Dnet0,mac=3D52:54:00:10:5b:55,bus=3Dpci.1,addr=3D0x0 -ch=
ardev pty,id=3Dcharserial0 -device isa-serial,chardev=3Dcharserial0,id=3Dse=
rial0 -chardev spicevmc,id=3Dcharchannel0,name=3Dvdagent -device virtserial=
port,bus=3Dvirtio-serial0.0,nr=3D1,chardev=3Dcharchannel0,id=3Dchannel0,nam=
e=3Dcom.redhat.spice.0 -device usb-tablet,id=3Dinput0,bus=3Dusb.0,port=3D1 =
-spice port=3D5900,addr=3D127.0.0.1,disable-ticketing=3Don,image-compressio=
n=3Doff,seamless-migration=3Don -device qxl-vga,id=3Dvideo0,ram_size=3D6710=
8864,vram_size=3D67108864,vram64_size_mb=3D0,vgamem_mb=3D16,max_outputs=3D1=
,bus=3Dpcie.0,addr=3D0x1 -device ich9-intel-hda,id=3Dsound0,bus=3Dpcie.0,ad=
dr=3D0x1b -device hda-duplex,id=3Dsound0-codec0,bus=3Dsound0.0,cad=3D0 -cha=
rdev spicevmc,id=3Dcharredir0,name=3Dusbredir -device usb-redir,chardev=3Dc=
harredir0,id=3Dredir0,bus=3Dusb.0,port=3D2 -chardev spicevmc,id=3Dcharredir=
1,name=3Dusbredir -device usb-redir,chardev=3Dcharredir1,id=3Dredir1,bus=3D=
usb.0,port=3D3 -device virtio-balloon-pci,id=3Dballoon0,bus=3Dpci.4,addr=3D=
0x0 -msg timestamp=3Don -D ./log.txt -monitor stdio -d
>=20


