Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA8A916A59E
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Feb 2020 12:58:50 +0100 (CET)
Received: from localhost ([::1]:35354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j6CNt-0002HJ-Vp
	for lists+qemu-devel@lfdr.de; Mon, 24 Feb 2020 06:58:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55984)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <priyamvad.agnisys@gmail.com>) id 1j6CN4-0001mf-UM
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 06:57:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <priyamvad.agnisys@gmail.com>) id 1j6CN4-0006qi-2H
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 06:57:58 -0500
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244]:41114)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <priyamvad.agnisys@gmail.com>)
 id 1j6CN3-0006q2-Qd
 for qemu-devel@nongnu.org; Mon, 24 Feb 2020 06:57:58 -0500
Received: by mail-lj1-x244.google.com with SMTP id h23so9770313ljc.8
 for <qemu-devel@nongnu.org>; Mon, 24 Feb 2020 03:57:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=GaMBGWE5WiGvMsRFxIm39CRRKn8mR+GV+cenWMwT9bY=;
 b=U/M1QgVk4jjF9TYs03C5ausIop3iEgJjjp7P5XegAvAFMvK5TMhI8kelSekzdmL6k0
 mlM3gjsO8mmWIHFzT+/LPsHgH4Bp2lIrqL1wvYR9bGTzQ1zwibDN7NhUz4vPctmj6XnO
 tJlxNmS523ftzRcmtwDZat2HZnrkKs92tnk1LW8HC3iSxYjeSB2F11uXrn+i7KiBzxni
 qGG3KTUv2bRdqwdfxzz5Z1rLAHf8ejeZc/gcD603Sal22b+mVL1kRWyLiFEXRdcTD4kE
 c+BNUYxsurPiDG5Ezsuql22C5m4xT+rWT8j1YvWrjsuhOyVwbfaw9epgDov8ZImLdVUp
 VWlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=GaMBGWE5WiGvMsRFxIm39CRRKn8mR+GV+cenWMwT9bY=;
 b=CZFcA84g13howt7Z3ncBHPBWtrQGxf/W8SeQI15nbKaL6FmFEIuuZK8dY1T0hn1dy7
 dZxKTXJVcSu0ryLYzHFyNWut6pTyJH6o+unSb9+it14oKDnTusE4rCo/mmm15esV2hIV
 wsIMbVySKwdF3IqFk5d68D5cI8EOQnn8MPJzp4pSKZn1GHm4CL/QhoI/TTVOMX2uNSbI
 88ZtLC6AH3LHmiv8YC2B9CMx1KIUzLszFoU6bEkwIKr7AIzapgYDF0J8PggLzDndFeQa
 py7YMNUV8tNRsvFdXATRxAZ8Otk+dl7Kj54iZLVP1cq4t9p0P6BAzpTYGeHf/6jFsw+1
 d+MA==
X-Gm-Message-State: APjAAAU7rjA3B8u4MCYmMAleRNq2gC4+z9depwbh16o3RbJ9gPUxkQL2
 GBZDe1Smsz0yW1+2Kl2UW0qZ/rD9mjmc/6Y6DYc4Exu0
X-Google-Smtp-Source: APXvYqw//GLmsrrr50Q/A08lXuzgoUIYnn6Z0yxgqAb9YP5YgyU9qj9SY1pEjwrqmykG/qKF899syv76uPq+Eh7W1mA=
X-Received: by 2002:a2e:809a:: with SMTP id i26mr30795183ljg.108.1582545475357; 
 Mon, 24 Feb 2020 03:57:55 -0800 (PST)
MIME-Version: 1.0
From: Priyamvad Acharya <priyamvad.agnisys@gmail.com>
Date: Mon, 24 Feb 2020 17:27:44 +0530
Message-ID: <CAPV47zf2Bz1xNTcD_1M=hf7tyVnCYh8yLagN=r8ocgrz2GT2Hw@mail.gmail.com>
Subject: New Hardware model emulation
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000e64e11059f5114a1"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::244
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000e64e11059f5114a1
Content-Type: text/plain; charset="UTF-8"

Hello Qemu development community members,

I have created a virtual device in Qemu.
Now I want to run Qemu with the virtual device,so how to do it ?

Thanks,
Priyamvad Acharya

--000000000000e64e11059f5114a1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello Qemu development community members,</div><div><=
br></div><div>I have created a virtual device in Qemu.</div><div>Now I want=
 to run Qemu with the virtual device,so how to do it ?</div><div><br></div>=
<div>Thanks,</div><div>Priyamvad Acharya<br></div><div><br></div></div>

--000000000000e64e11059f5114a1--

