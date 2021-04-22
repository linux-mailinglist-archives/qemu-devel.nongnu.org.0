Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 606CC368817
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 22:35:38 +0200 (CEST)
Received: from localhost ([::1]:47776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZg2y-0004F3-Qh
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 16:35:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raidsmainacc@gmail.com>)
 id 1lZfYm-00027J-5l
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 16:04:24 -0400
Received: from mail-vs1-xe29.google.com ([2607:f8b0:4864:20::e29]:40564)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <raidsmainacc@gmail.com>)
 id 1lZfYk-0001SW-BO
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 16:04:23 -0400
Received: by mail-vs1-xe29.google.com with SMTP id o192so7579462vsd.7
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 13:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=UChckgE6Dla2wf4IsBhdkia1CrTPAeUzR4wJ7j67XPs=;
 b=iwMGSA56YLBo+U6Q1jTDs16lhB680YVQQE8pdj0vmiOABOcck8b7ZztV2feOOedUq8
 BqGMmdUMymIbwV/F3p9K71n6aFSRPgJTuP1e+VJWxvmK2E5/QdfvHwJ1nqI6WdiuZLJ4
 /T5YzjQwrZNBBnoAMwi34p8DL5GieLtyvpMGXaUoPsCjoTj5cCKsJgVJGxOJJwsk4TNI
 9H9FH14jplXaDoKVrC0LAOH3WdPQlbwRzPyLCvQOqEVLJ6D3SS5l69K9NXGdCQYjgZQC
 JCijDXyLwgrtcO1uQumr11UnvAGx9F4tGWd2Sz4X6aMfltXpt3NywyiLNSpEAzkih1V3
 p4Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=UChckgE6Dla2wf4IsBhdkia1CrTPAeUzR4wJ7j67XPs=;
 b=hyaDOiLztsqgFNlv0+alloXt1eX0HO+sZvuB2N15Ng5iiYZfCcOSBft8MlExzinjaQ
 gcPdiTHciP8OamXY38iSwXNdVJNjkD8e+s16rYPtvEx9Y3t8dwYtds6IYASpCgEOIxWp
 mGF9rxETusgMsLB7KhNpiQHzaMzOLLFFocVC1Wt+JHdZO63/Nxp83dDc2/PgNmPxQ5E5
 wE6woCrPgWSjSdsC8EM7TOvHnC4gCFlDNlVFzA84+uY0iNSYSS67eItBWI+9rhdESPfL
 UEyX6EM0JrZqP5KZ6aaBG9zztxQlHiDf8/rVFKHvaW1s5tyrgKM2Osk8uQRoE2ib7uB0
 1rLQ==
X-Gm-Message-State: AOAM532/4r8wLyOPHfz6W1zPVaTUFAFOidLZAWH241U8ymKomsNieC/3
 Ap90A8nl1r64xqBmeXBsk2NkzuIjE4J7a6G3eMahZEguCCi1Bg==
X-Google-Smtp-Source: ABdhPJxJ+qz/WK19q1i77WKmIDRB1SHNGm6bO2Sko0YR0sINiArgmrjc7dIXJRzv9ifA3SjpkdE+JOvGHMCe1mg9d3I=
X-Received: by 2002:a67:22c7:: with SMTP id i190mr580998vsi.60.1619121858690; 
 Thu, 22 Apr 2021 13:04:18 -0700 (PDT)
MIME-Version: 1.0
From: VoidCC <raidsmainacc@gmail.com>
Date: Thu, 22 Apr 2021 22:04:13 +0200
Message-ID: <CABZ9ZfUNmxTPxOBh0SCvaxBFRHKkTfmwAQjqFin=20CwMK64_g@mail.gmail.com>
Subject: qemu/kvm tianocore restart stuck
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000004263e205c0952f98"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e29;
 envelope-from=raidsmainacc@gmail.com; helo=mail-vs1-xe29.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 22 Apr 2021 16:34:27 -0400
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
Cc: Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000004263e205c0952f98
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

I'm hitting a hard wall with qemu and efi.
I'm running multiple windows server 2019 vms which usually reboot on
updates.

The issue is, efi breaks on reboot.
It randomly(race condition?, does not occur consistently) ends up in a
blackscreen: no bootloader, no efi screen and the only way to get out of
that state is to destroy the vm.
moving the host mouse cursor above the console in virt-manager results in a
flashing mouse cursor.
there are no physical devices attached and there is currently no virtio
attachment in use (os has virtio drivers installed)


Machine is Q35 with tianocore/ovmf efi.
I managed to reproduce the same behaviour on rhel 8.3 as well as
voidlinux (kernel 5.11)

gdb output of qemu is showing nothing worrisome, else ive compiled ovmf
manually for debug output.
libvirt logs don't show any issues.

root =C2=B7 Slexy.org Pastebin <https://slexy.org/view/s2w8CdNBx5>

--0000000000004263e205c0952f98
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr">Hello,<div><br></div><di=
v>I&#39;m hitting a hard wall with qemu and efi.</div><div>I&#39;m running =
multiple windows server 2019 vms which usually reboot on updates.<br><br>Th=
e issue is, efi breaks on reboot.<br>It randomly(race condition?, does not=
=C2=A0occur consistently) ends up in a blackscreen: no bootloader, no efi s=
creen and the only way to get out of that state is to destroy the vm.</div>=
<div>moving the host mouse cursor above the console in virt-manager results=
 in a flashing mouse cursor.<br>there are no physical devices attached and =
there is currently no virtio attachment in use (os has virtio drivers insta=
lled)</div><div><br></div><div><br></div><div>Machine is Q35 with tianocore=
/ovmf efi.<br>I managed to reproduce the same behaviour on rhel 8.3=C2=A0as=
 well as voidlinux=C2=A0(kernel 5.11)<br><br>gdb output of qemu is showing =
nothing worrisome, else ive=C2=A0compiled ovmf manually for debug output.</=
div><div>libvirt logs don&#39;t=C2=A0show any issues.</div><div><br></div><=
div><a href=3D"https://slexy.org/view/s2w8CdNBx5">root =C2=B7 Slexy.org Pas=
tebin</a><br></div><div><br></div><div><br></div><div><br></div></div></div=
></div>

--0000000000004263e205c0952f98--

