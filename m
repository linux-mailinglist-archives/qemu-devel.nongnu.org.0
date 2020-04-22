Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 651E51B4D4E
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Apr 2020 21:26:40 +0200 (CEST)
Received: from localhost ([::1]:56486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jRL14-0006t7-Uq
	for lists+qemu-devel@lfdr.de; Wed, 22 Apr 2020 15:26:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43764)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <flukshun@gmail.com>) id 1jRL0F-0006I5-TU
 for qemu-devel@nongnu.org; Wed, 22 Apr 2020 15:25:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <flukshun@gmail.com>) id 1jRL0E-0000ZA-SI
 for qemu-devel@nongnu.org; Wed, 22 Apr 2020 15:25:47 -0400
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:34421)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <flukshun@gmail.com>)
 id 1jRL0E-0000X2-Dr
 for qemu-devel@nongnu.org; Wed, 22 Apr 2020 15:25:46 -0400
Received: by mail-oi1-x243.google.com with SMTP id x10so2934806oie.1
 for <qemu-devel@nongnu.org>; Wed, 22 Apr 2020 12:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:mime-version:content-transfer-encoding:from:cc:user-agent:to
 :message-id:subject:date;
 bh=QwliDRsNM3kcd24puxo9+LIape20e14aYRgfN3S95PM=;
 b=i7TSBVtRWx9bCaCq0JXiZJiO0/NfyMkUcv4slaYHuV72SzOD5ltDk5ot36SLbssBMp
 3TGNOmeSprUjTsz0/46huibicYyBJVurQ+SV5kmeZoCg89hCg8tkBTg+780w+XiKnnk6
 Zzc5OdLh80j9+rCYo21EvkpHwpBbwtlhWYHdXMYeGXjYLsU4P5KoBKfDr56bO8coAbjl
 FUb7z5fxY8krx12Pcg4XMBPmCkHD7aJHhHqgDoSNVFwyNh9xfee622Sa9jRSlMsD2Lfo
 /z+u1KGTmBLi/aWRtTT2VbwdY/JCbYogEAvwc6D6xcQmBVdTod1UwyIsXt1inbI2scfq
 8vLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:mime-version:content-transfer-encoding
 :from:cc:user-agent:to:message-id:subject:date;
 bh=QwliDRsNM3kcd24puxo9+LIape20e14aYRgfN3S95PM=;
 b=IjqllaZvW2xzMUpF/TCWRit5RukCaHrptZwfPAZM4bA7qfectgtRK/Z38PKMeBe+M0
 w9mmkl1kdmwmR5Rw49Wj1BUDDbogaVgl6WeWTTb3OLJjhAAgay60AdTBgulL4i3dYMcg
 x66u+gXJ/X75qRqWWARq9WGoHFa4o68s0jmOYxN5Xrys4NtZDfxQ/A2pDl+4i29pZutD
 GvUcaiekfBkp51GaRQ9z94IKC/PJa3gIboNnNjHo8Xo+fhDsc8ggurchdvVxSVhuK4vp
 rSkDt9KgQ3Hk1Xo6U+QYQCVVLhJ9yFL5OCDDgJuyetUOiy2w9QImAh4k/P/fGxJeaZVY
 l0yw==
X-Gm-Message-State: AGi0PubD61pXkfjiEwcVpdYC6kF63WoDmAjWJxT4vYwhlq2RTPiiCK09
 r6XkkxdMraq7bPy2FiWLW+w=
X-Google-Smtp-Source: APiQypIJp3b4vadDFommjcWw1dVLe1c9bDmcW/jjG9ZuTe1MSiHisn31L7Dg2P7nAszImCuiQ/krrQ==
X-Received: by 2002:aca:5806:: with SMTP id m6mr402042oib.178.1587583544636;
 Wed, 22 Apr 2020 12:25:44 -0700 (PDT)
Received: from localhost (76-251-165-188.lightspeed.austtx.sbcglobal.net.
 [76.251.165.188])
 by smtp.gmail.com with ESMTPSA id t20sm6426ott.51.2020.04.22.12.25.43
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 22 Apr 2020 12:25:43 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
From: Michael Roth <mdroth@linux.vnet.ibm.com>
User-Agent: alot/0.7
To: qemu-devel@nongnu.org
Message-ID: <158758353153.20966.4008307834954324722@sif>
Subject: [ANNOUNCE] QEMU 5.0.0-rc4 is now available
Date: Wed, 22 Apr 2020 14:25:31 -0500
Received-SPF: pass client-ip=2607:f8b0:4864:20::243;
 envelope-from=flukshun@gmail.com; helo=mail-oi1-x243.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::243
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

On behalf of the QEMU Team, I'd like to announce the availability of the
fifth release candidate for the QEMU 5.0 release.  This release is meant
for testing purposes and should not be used in a production environment.

  http://download.qemu-project.org/qemu-5.0.0-rc4.tar.xz
  http://download.qemu-project.org/qemu-5.0.0-rc4.tar.xz.sig

A note from the maintainer:

  rc4 contains a couple of fixes for potential security issues, together
  with a handful of other late-breaking bugfixes that are included since
  we needed to roll an rc4 anyway. The plan is to make the final release
  of 5.0 with no further changes on Tuesday 28th April.

You can help improve the quality of the QEMU 5.0 release by testing this
release and reporting bugs on Launchpad:

  https://bugs.launchpad.net/qemu/

The release plan, as well a documented known issues for release
candidates, are available at:

  http://wiki.qemu.org/Planning/5.0

Please add entries to the ChangeLog for the 5.0 release below:

  http://wiki.qemu.org/ChangeLog/5.0

Thank you to everyone involved!

Changes since rc3:

ee573f5326: Update version for v5.0.0-rc4 release (Peter Maydell)
e73c444347: target/arm: Fix ID_MMFR4 value on AArch64 'max' CPU (Peter Mayd=
ell)
7769c23774: slirp: update to fix CVE-2020-1983 (Marc-Andr=C3=A9 Lureau)
3119154db0: target/ppc: Fix TCG temporary leaks in gen_slbia() (Philippe Ma=
thieu-Daud=C3=A9)
ff0507c239: block/iscsi:fix heap-buffer-overflow in iscsi_aio_ioctl_cb (Che=
n Qun)
5ed195065c: target/ppc: Fix mtmsr(d) L=3D1 variant that loses interrupts (N=
icholas Piggin)
211a7784b9: target/ppc: Fix wrong interpretation of the disposition flag. (=
Ganesh Goudar)
5da5f47e6c: linux-user/ppc: Fix padding in mcontext_t for ppc64 (Richard He=
nderson)
386d386568: linux-user/syscall.c: add target-to-host mapping for epoll_crea=
te1() (Sergei Trofimovich)


