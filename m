Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74E3C3BE184
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 05:25:24 +0200 (CEST)
Received: from localhost ([::1]:33322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0yBf-0002B1-10
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 23:25:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.j.zak@gmail.com>)
 id 1m0yAe-0001W0-GN
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 23:24:20 -0400
Received: from mail-ua1-x930.google.com ([2607:f8b0:4864:20::930]:35537)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.j.zak@gmail.com>)
 id 1m0yAZ-0007MI-MQ
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 23:24:20 -0400
Received: by mail-ua1-x930.google.com with SMTP id n61so293245uan.2
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 20:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=c3ezb7OIpT6qxN7jI/yd8jZx0huWlYDeI1IDo12MK+E=;
 b=sWejyOSwqrZEmZ8HGeCg4F3S2c+iSOiL5QKxzmpVckCTZyNTCKfvylpS2Zyaie4Pvl
 +gf++gkRJk/J1mruGOdcKvMKJPCrEEAOlrYyQdEaqBhUXmt4Tj1rDgpTCdx0Blil+ACV
 ub6eSAyo+8oc9tqNXrWXEWfBkkV9cJqEtgNwXMMHzGyZjbAabco9jtxui5LSbS7HZayd
 ryX2faEDJcg2kr3DmBT+NBhpwJJUMGAOCmQlCeenW8lmpcBr1azc8hA+NmTe9AOXWY39
 jPoBCzd8DoK3PozbomAnqTsuV7FD6iQG9y2iymIaZpuot5NCqvnds1+L9jwZlmDI1eKC
 HaLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=c3ezb7OIpT6qxN7jI/yd8jZx0huWlYDeI1IDo12MK+E=;
 b=mfO1qeGcKvAOJAKXeADy8lnNs5Mq1a/hM44bjLRlc4JScHETVn9d5IEjWM21nTLjGW
 QtypstoL0QC/w4GI8ozLgWl1M0u5+i6rd4uHgTyZ+xh+B54axRFxH67UjM3fRg12HzZv
 kl2XRA3AKP4Uj30APfzd3NgIwbx0eKIMHa4CueizyeTa17w2aG/pJw1JMOr0q47ugTPo
 W60VNb61JYJNBCDR+6yDeCTl+DMrzTvC25OXNIXwL1K2GqP6xFfCgJE42/YUV6fRnAf4
 52IoBEgiBR7Jhbz0BEqlgieBPtn17iXhrGv3ySp4adFKQVo/TXXQ0++2yPpOAfz36ciK
 NM4A==
X-Gm-Message-State: AOAM530A0PS/21xA/f5zBRD5ArWqN6cssFiWIfJOonfpZ0lXC4NMgoO/
 B/UQ+o5zwGKBGNfeD8WlZkTrohxRXmTdulGqWwI9ru2q
X-Google-Smtp-Source: ABdhPJz46Hx/V7x1CG176T4Yz2IYmyADwCbc9hhrkQTr2maZVDnlauQ1aou1LmQufHtsbN+qEQZuWMulbRiBnDyyJD0=
X-Received: by 2002:ab0:5962:: with SMTP id o31mr19541005uad.89.1625628253918; 
 Tue, 06 Jul 2021 20:24:13 -0700 (PDT)
MIME-Version: 1.0
From: Richard Zak <richard.j.zak@gmail.com>
Date: Tue, 6 Jul 2021 23:24:03 -0400
Message-ID: <CAOakUfMKduLQe=juj-sZzVSkD-bSi48-k7SNiKkDKE-fTaiQ+A@mail.gmail.com>
Subject: pipe2 & configure script
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="0000000000009c9afe05c6801283"
Received-SPF: pass client-ip=2607:f8b0:4864:20::930;
 envelope-from=richard.j.zak@gmail.com; helo=mail-ua1-x930.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000009c9afe05c6801283
Content-Type: text/plain; charset="UTF-8"

What conditions are required for "#define CONFIG_PIPE2" to be set in
build/config-host.h? It prevents building for Haiku as pipe2() doesn't
exist. I didn't see anything in the configure script regarding pipe2. I
also updated my code to the latest in the repository and this issue just
popped up.

-- 
Regards,

Richard J. Zak
Professional Genius
PGP Key: https://keybase.io/rjzak/key.asc

--0000000000009c9afe05c6801283
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>What conditions are required for &quot;#define CONFIG=
_PIPE2&quot; to be set in build/config-host.h? It prevents building for Hai=
ku as pipe2() doesn&#39;t exist. I didn&#39;t see anything in the configure=
 script regarding pipe2. I also updated my code to the latest in the reposi=
tory and this issue just popped up.</div><div><br>-- <br><div dir=3D"ltr" c=
lass=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr=
"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div>Regards,<br><br>Richard =
J. Zak<br>Professional Genius</div><div>PGP Key:=C2=A0<a href=3D"https://ke=
ybase.io/rjzak/key.asc" target=3D"_blank">https://keybase.io/rjzak/key.asc<=
/a></div></div></div></div></div></div></div></div></div>

--0000000000009c9afe05c6801283--

