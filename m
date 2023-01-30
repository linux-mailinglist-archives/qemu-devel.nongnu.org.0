Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5418680CE6
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 13:06:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMSuv-0002h6-89; Mon, 30 Jan 2023 07:05:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1pMSub-0002bg-5X
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 07:05:31 -0500
Received: from smtp-relay-services-0.canonical.com ([185.125.188.250])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <noreply@launchpad.net>)
 id 1pMSuY-0007Jt-0N
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 07:05:24 -0500
Received: from scripts-1.lp.internal (scripts.lp.internal [10.131.66.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp-relay-services-0.canonical.com (Postfix) with ESMTPSA id DF10A41417
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 12:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=launchpad.net;
 s=20210803; t=1675080312;
 bh=ek6RT3U5lZZx6lu3UQt7PT1j9wFPYnKnVhe7p0sPHGk=;
 h=MIME-Version:Content-Type:Date:From:To:Reply-To:References:
 Message-Id:Subject;
 b=Qq5MjME2y2zYuY5UAVjVi2RBDERs1N2fKB6CMrPp7dakxAUyHJumU6v2+gvkSXL/8
 d1nW3H80Ccqt1+UVMc9J4ds1A4fZuH7PTXCKl1L4C0MdjNvrsdNf2pYLl/a4roLvvu
 iUk+nnNm9r4XD4AgR8JvcI6jvlCIjkiesm5sonYHamxLH6ItxPHZyLc6sNwofT69YN
 XrvrN/0YxNrmh3gyH+hnadXR/UfqiHWlcQKoQuCgOm4mB9ifwUJh47xubTUKRWZJLP
 DOOrAWo20cHLmFKXUQMnSqfNf5Zl87x1uFDTAG3d0EKrEYmcGV+J+PIZ21xTqmr8kr
 p2pKeQmcaZorA==
Received: from
 juju-4112d9-prod-launchpad-manual-servers-36.openstack.prodstack5.lan
 (localhost [127.0.0.1])
 by scripts-1.lp.internal (Postfix) with ESMTP id CDE0B3F32A
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 12:05:12 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 30 Jan 2023 11:55:45 -0000
From: Qiang Liu <1882123@bugs.launchpad.net>
To: qemu-devel@nongnu.org
X-Launchpad-Notification-Type: bug
X-Launchpad-Bug: product=qemu; status=Expired; importance=Undecided;
 assignee=None; 
X-Launchpad-Bug-Tags: arm armhf debian regression
X-Launchpad-Bug-Information-Type: Public
X-Launchpad-Bug-Private: no
X-Launchpad-Bug-Security-Vulnerability: no
X-Launchpad-Bug-Commenters: cyruscyliu joveler pmaydell th-huth
X-Launchpad-Bug-Reporter: Hajin Jang (joveler)
X-Launchpad-Bug-Modifier: Qiang Liu (cyruscyliu)
References: <159129432300.4081.5698403082350753204.malonedeb@soybean.canonical.com>
Message-Id: <CAAKa2j=a6Se_aUAUnkg822gtEC9UhbQZ2Dq9+NLX8u8NotkpcA@mail.gmail.com>
Subject: [Bug 1882123] Re: ARM cpu emulation regression on QEMU 4.2.0
X-Launchpad-Message-Rationale: Subscriber (QEMU) @qemu-devel-ml
X-Launchpad-Message-For: qemu-devel-ml
Precedence: bulk
X-Generated-By: Launchpad (canonical.com);
 Revision="20dbca4abd50eb567cd11c349e7e914443a145a1"; Instance="production"
X-Launchpad-Hash: cd6d98418b938e2ebd528f8fab9fa8cf84b7a56f
Received-SPF: pass client-ip=185.125.188.250;
 envelope-from=noreply@launchpad.net; helo=smtp-relay-services-0.canonical.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Bug 1882123 <1882123@bugs.launchpad.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi all,

I'm sure this patch will prevent the assertion failure due to the
inconsistent ep and pid (UBS_TOKEN_SETUP) (
https://lists.gnu.org/archive/html/qemu-devel/2021-06/msg07179.html).

For UHCI (https://gitlab.com/qemu-project/qemu/-/issues/119) and OHCI (
https://gitlab.com/qemu-project/qemu/-/issues/303), this patch may be
right.

For EHCI, I found another way to trigger this assertion even with my patch
because ehci_get_pid() returns 0 if qtd->token.QTD_TOKEN_PID is not
valid[0]. In this case, the patch cannot capture it because pid is zero[2].
This case is specific to EHCI as far as I know. It seems we want to drop
the operation if ehci_get_pid() returns 0.

```static int ehci_get_pid(EHCIqtd *qtd)
{
    switch (get_field(qtd->token, QTD_TOKEN_PID)) {
    case 0:
        return USB_TOKEN_OUT;
    case 1:
        return USB_TOKEN_IN;
    case 2:
        return USB_TOKEN_SETUP;
    default:
        fprintf(stderr, "bad token\n"); //
---------------------------------------------> [0]
        return 0;
    }
}

static int ehci_execute(EHCIPacket *p, const char *action)
{
    p->pid =3D ehci_get_pid(&p->qtd); //
--------------------------------------------> [1]
    p->queue->last_pid =3D p->pid;
    endp =3D get_field(p->queue->qh.epchar, QH_EPCHAR_EP);
    ep =3D usb_ep_get(p->queue->dev, p->pid/*=3D0*/, endp); //
-----------------------> [2]
```

A qtest sequence is like
```
writel 0x1011b000 0x10124000
writel 0x10124004 0x358cbd80
writel 0x10124018 0x9e4bba36
writel 0x10124014 0x10139000
writel 0xfebd5020 0x1c4a5135
writel 0x10139008 0x3d5c4b84
clock_step 0xb17b0
writel 0xfebd5064 0x5f919911
clock_step 0xa9229
writel 0xfebd5064 0x5431e207
writel 0xfebd5038 0x1b2034b5
writel 0x1b2034a0 0x10100000
writel 0x10100000 0x10109000
writel 0x10109000 0x1011b000
clock_step 0xa9229
```

Best,
Qiang


** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #119
   https://gitlab.com/qemu-project/qemu/-/issues/119

** Bug watch added: gitlab.com/qemu-project/qemu/-/issues #303
   https://gitlab.com/qemu-project/qemu/-/issues/303

--=20
You received this bug notification because you are a member of qemu-
devel-ml, which is subscribed to QEMU.
https://bugs.launchpad.net/bugs/1882123

Title:
  ARM cpu emulation regression on QEMU 4.2.0

Status in QEMU:
  Expired

Bug description:
  [*] Summary

  Latest QEMU has an ARM CPU emulation regression.
  Regression is reproducible by building any C# project with .NET Core SDK =
3.1.300 on Debian 10 armhf guest OS.

  Releases affected: QEMU 4.2.0, 5.0.0
  Releases not affected: QEMU 4.1.0, QEMU 4.1.1

  [*] Detail

  .NET Core SDK 3.1 fails to run on Debian 10 emulated by qemu-system-
  arm.

  I occasionally test my C# projects on the virtual armhf/arm64 system
  emulated by QEMU. MSBuild, a build engine of the .NET Core SDK,
  crashes on QEMU 4.2.0 or later. The crash only happens when MSBuild
  tries to do any JIT compiling (dotnet build / dotnet test).

  I attached the MSBuild crash logs. MSBuild always crashes with
  SEHException, which means it tried to call C binary from .NET binary.

  I think the ARM CPU emulation regression happened between QEMU 4.1.1 ~
  4.2.0. The issue affects QEMU 4.2.0 and 5.0.0. QEMU 4.1.0, 4.1.1, and
  real Raspberry Pi 2 are not affected by this issue, and .NET Core SDK
  works completely fine.

  [*] Environment

  [Host OS]
  Distribution: Linux Mint 19.3 amd64
  CPU: AMD Ryzen 5 3600
  Kernel: Ubuntu 5.3.0-51-generic

  [QEMU Guest OS]
  Distribution: Debian 10 Buster armhf
  Kernel: Debian 4.19.0-9-armmp-lpae
  .NET Core SDK: 3.1.300

  [Raspberry Pi 2]
  Distribution: Raspberry Pi OS Buster armhf
  Kernel: 4.19.118-v7+

  [Tested C# Projects]
  This is a list of C# projects I have tested on QEMU and RPI2.
  - https://github.com/ied206/Joveler.DynLoader
  - https://github.com/ied206/Joveler.Compression
  - https://github.com/ied206/ManagedWimLib

  [QEMU Launch Arguments]
  qemu-system-arm \
  =C2=A0=C2=A0=C2=A0=C2=A0-smp 3 -M virt -m 4096 \
  =C2=A0=C2=A0=C2=A0=C2=A0-kernel vmlinuz-4.19.0-9-armmp-lpae \
  =C2=A0=C2=A0=C2=A0=C2=A0-initrd initrd.img-4.19.0-9-armmp-lpae \
  =C2=A0=C2=A0=C2=A0=C2=A0-append "root=3D/dev/vda2" \
  =C2=A0=C2=A0=C2=A0=C2=A0-drive if=3Dnone,file=3Ddebian_arm.qcow2,format=
=3Dqcow2,id=3Dhd \
  =C2=A0=C2=A0=C2=A0=C2=A0-device virtio-blk-device,drive=3Dhd \
  =C2=A0=C2=A0=C2=A0=C2=A0-netdev user,id=3Dmynet,hostfwd=3Dtcp::<PORT>-:22=
 \
  =C2=A0=C2=A0=C2=A0=C2=A0-device virtio-net-device,netdev=3Dmynet \
  =C2=A0=C2=A0=C2=A0=C2=A0-device virtio-rng-device

  [QEMU Configure Arguments]
  ./configure --enable-spice --enable-gtk --enable-vnc-jpeg --enable-vnc-pn=
g --enable-avx2 --enable-libusb --enable-opengl --enable-virglrenderer --en=
able-kvm --enable-system --enable-modules --audio-drv-list=3Dpa

To manage notifications about this bug go to:
https://bugs.launchpad.net/qemu/+bug/1882123/+subscriptions


