Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A732564B776
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 15:36:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p56Ml-0000jm-8R; Tue, 13 Dec 2022 09:34:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <patatetom@gmail.com>)
 id 1p50np-0001J2-Lh
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 03:38:17 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <patatetom@gmail.com>)
 id 1p50nn-00062s-4b
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 03:38:17 -0500
Received: by mail-ej1-x62f.google.com with SMTP id b2so34722611eja.7
 for <qemu-devel@nongnu.org>; Tue, 13 Dec 2022 00:38:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=UeNhXhYbVA6nNHvbv6eus4rvW0W8qirnaVsrXUMbQxE=;
 b=RHIAUeYuzT4NEWjfaxK97C5EkzPaQH8B9cNBUXdYcOLhvRA3yj3KrDZuB2tzoZRupT
 U2Vu2+XDnrO3Z0aLBA9SH7vF4KELzqd/ZD4IO+44WgYQs/7egiXiXUwqL0C2xbv/xCps
 fyNgLAqpBOO2Ahgml06khoJgSZwKEAEiyWQEyv7uHDtB66/liz1APhzkWx8vz8Ohsq7x
 v5vrqrQnR4+GnYQNxLaIpLCOlzCnX2t9Qz4oFdzXb/tADmN5tZth08T+3KKi3d1Bdj9y
 1tvRuFt1Ncu8eqs/7EuPclXZKLjAXvCt1suhIwMUeR8/wwEDknPom0S1RDy0q3cWtnPE
 Wwcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UeNhXhYbVA6nNHvbv6eus4rvW0W8qirnaVsrXUMbQxE=;
 b=HFey4VYRrdMJUlM5w6w8ugTl/jZHs36XFTn4PJNVJzGZHiwCevO6IhqvNWkdYDAy0Z
 hJywnHrlb6EZWKHUiz6PPH2ggnOT3Heo6f7TCqDxbBX+OWMU9QVV/5/S9nd3yss6utEX
 23jd2/XsRyE1ur6/3oZlbAqAXetzLksAm3AEg/TVnZLci42HtBAOCHmK+V2PXXTz4UGt
 NMjWEK2UyVywpHIgp7pfG3tEFvc+0RJZR9tB9M2+1lUyJ03pMk8G8MWsL1fFkSJCvllh
 LbuXOD9MvzsCgCcJiby6oAkMzNSKDs5k2mH/O9+77kNU8/dfp8WK3Yrg8JLZv0is90Uv
 erOw==
X-Gm-Message-State: ANoB5plqa06k93rFZCPTsZN762VVIyO1Lt2aJBJXSwxuFwyfbkUwKv1f
 CRvkRom8T/pklN8rpiDe0lQnxPX6rmlornvhVddkBM2tYM2CmQ==
X-Google-Smtp-Source: AA0mqf5J/6PaqWzXg5osdpr4TjtiMekG6Hv7QnJF5shbiTzejckaW+WRBxYDjbDxEEO8UOIf6AYPb1kDF5/SqzZCk+A=
X-Received: by 2002:a17:906:24cf:b0:7c1:71ba:9759 with SMTP id
 f15-20020a17090624cf00b007c171ba9759mr482548ejb.770.1670920692324; Tue, 13
 Dec 2022 00:38:12 -0800 (PST)
MIME-Version: 1.0
From: Pascal <patatetom@gmail.com>
Date: Tue, 13 Dec 2022 09:37:03 +0100
Message-ID: <CAGhAaddGqO30KL0TbeR2kFUypABfQXSFj7SmpeRfXjVfEX7hMQ@mail.gmail.com>
Subject: -display sdl
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000505e7505efb18adb"
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=patatetom@gmail.com; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 13 Dec 2022 09:34:40 -0500
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

--000000000000505e7505efb18adb
Content-Type: text/plain; charset="UTF-8"

hi,

the "5" key of my keyboard doesn't work in my guest machine (ArchLinux)
when I start qemu with the "-display sdl" option (I realized it when I
wanted to enter the network address 192.168.1.254).
the "5" key is OK if I switch to a terminal opened in the host machine.
I did not test the whole keyboard to see if other keys were affected.

still with this same option, it also happens that the SDL window (eg. guest
display) is not/no longer refreshed after the host screen is put to sleep.

no problem with the same virtual machine if this option is not used.

qemu 7.1.0 is running under ArchLinux up to date.

I am available if you need further information, regards, lacsaP.

--000000000000505e7505efb18adb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>hi,</div><div><br></div><div>the &quot;<span style=3D=
"font-family:monospace">5</span>&quot; key of my keyboard doesn&#39;t work =
in my guest machine (ArchLinux) when I start qemu with the &quot;<span styl=
e=3D"font-family:monospace">-display sdl</span>&quot; option (I realized it=
 when I wanted to enter the network address 192.168.1.254).</div><div>the &=
quot;<span style=3D"font-family:monospace">5</span>&quot; key is OK if I sw=
itch to a terminal opened in the host machine.<br>I did not test the whole =
keyboard to see if other keys were affected.</div><div><br></div><div>still=
 with this same option, it also happens that the SDL window (eg. guest disp=
lay) is not/no longer refreshed after the host screen is put to sleep.</div=
><div><br></div><div>no problem with the same virtual machine if this optio=
n is not used.</div><div><br></div><div>qemu 7.1.0 is running under ArchLin=
ux up to date.<br></div><div><br></div>I am available if you need further i=
nformation, regards, lacsaP.<br></div>

--000000000000505e7505efb18adb--

