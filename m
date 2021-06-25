Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D91933B3B6D
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 06:14:31 +0200 (CEST)
Received: from localhost ([::1]:37736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwdEc-00052G-EO
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 00:14:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.j.zak@gmail.com>)
 id 1lwdDH-0004MK-91
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 00:13:07 -0400
Received: from mail-vk1-xa2d.google.com ([2607:f8b0:4864:20::a2d]:43972)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.j.zak@gmail.com>)
 id 1lwdDF-0007tu-1D
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 00:13:06 -0400
Received: by mail-vk1-xa2d.google.com with SMTP id k16so1807469vke.10
 for <qemu-devel@nongnu.org>; Thu, 24 Jun 2021 21:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=RM1+WtlycBhBzgvm6nT696H6+pmB3e+BjEuXv1Xp9t4=;
 b=SGIoa/MMA49a1l09sCrLcFGNYQJMiSxHVTh5HCxeNfuXZCFFri4BdzPkc4kZ5MqagE
 r5e6GGVOzI+8BVfClCslRu8PTweu5eVeskez+8pbL81BXQ1drB3jRD4DDD/Wcu5cwuc/
 w/Cs0xrduseWoJ0KscFH1QKwBwMT7rCp8xUsFDcz7Ns4lZygtkkt9cXed8kYI2cHiAqA
 V97Vg9SM0Ppi4aAd6vBtUPJLGux9yMB3jzmf1Ah0kT5EVYabUGHVwJolyl1D45HjLfzh
 eh3vvZkCEkBIJ26Ik3XxVMXMwByohfWkE+mwm55gQ9z5EHowrJfol8Pk4NA5LYWnz5J+
 ULGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=RM1+WtlycBhBzgvm6nT696H6+pmB3e+BjEuXv1Xp9t4=;
 b=ErV+MCzOVHPVnLrQg5u7ZuoDL8Cbgb5oPligSd89UWH7wz/kk0/sdz5ObukJXhNefK
 vBI/rJfnMpX3Ai2Lab5FoSVSZ8D71zgeNtUxQYPESfLBlJjPp1/QtWNQy3GTXFl8YxkD
 K3bn6NThks1KGt36Om5Bu3m1tVGry2LwRAkqGhlitf/8NujZlvHviMxu1q5YspZLYA6u
 ncO8op/jUNXqp/DGIioEBnoCDoyG6jkIvX9QlM+AMz1o/85nRMyYS01chGKo/Lgk1Gf0
 QLpyWOtgl2+57uc815X24+WC9MtqlHzcRMd6IJee/mrtb2aJjSXFUExptV5Lm5NSqTXD
 mR9g==
X-Gm-Message-State: AOAM531jyHpoB8Pwly04wxtwadpL0nQoxGBM5Qgfp1IIVtUs2klLXuPa
 MAqJKxA7TfRy17sbOClGrEmjEeVqgjvHDWHLk5MBOewq
X-Google-Smtp-Source: ABdhPJxvLPW+dKTE1a+a0eEQuZ3s9dqZwyxlYxbYOrr3IvJGLkqwJN/ZuWFZyt1UeOikBtaw3YJr/EYXkq2y40qulgI=
X-Received: by 2002:a05:6122:a1e:: with SMTP id 30mr6109578vkn.3.1624594383454; 
 Thu, 24 Jun 2021 21:13:03 -0700 (PDT)
MIME-Version: 1.0
From: Richard Zak <richard.j.zak@gmail.com>
Date: Fri, 25 Jun 2021 00:12:52 -0400
Message-ID: <CAOakUfODNr9UCpbNyzavk3n8ycD5fNFU0VBv87fVWLhrw5O2Ow@mail.gmail.com>
Subject: Qemu on Haiku
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="00000000000021473c05c58f5b1f"
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2d;
 envelope-from=richard.j.zak@gmail.com; helo=mail-vk1-xa2d.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) BAYES_40=-0.001, DKIM_SIGNED=0.1,
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

--00000000000021473c05c58f5b1f
Content-Type: text/plain; charset="UTF-8"

Hello there! I noticed the message which appears when building qemu on
Haiku. I'd hate for Haiku to lose qemu, so I would like to help!

What is needed in terms of a build system for continuous integration? I'm
not familiar with CI systems, other than simply knowing what they do.

-- 
Regards,

Richard J. Zak
Professional Genius
PGP Key: https://keybase.io/rjzak/key.asc

--00000000000021473c05c58f5b1f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello there! I noticed the message which appears when buil=
ding qemu on Haiku. I&#39;d hate for Haiku to lose qemu, so I would like to=
 help!<br clear=3D"all"><div><br></div><div>What is needed in terms of a bu=
ild system for continuous integration? I&#39;m not familiar with CI systems=
, other than simply knowing what they do.</div><div><br>-- <br><div dir=3D"=
ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=
=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div>Regards,<br><br>R=
ichard J. Zak<br>Professional Genius</div><div>PGP Key:=C2=A0<a href=3D"htt=
ps://keybase.io/rjzak/key.asc" target=3D"_blank">https://keybase.io/rjzak/k=
ey.asc</a></div></div></div></div></div></div></div></div></div>

--00000000000021473c05c58f5b1f--

