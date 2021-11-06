Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 712EE446D65
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Nov 2021 11:19:38 +0100 (CET)
Received: from localhost ([::1]:44442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mjInR-0002VG-1n
	for lists+qemu-devel@lfdr.de; Sat, 06 Nov 2021 06:19:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nirajsorathiya101@gmail.com>)
 id 1mjImN-0001qf-Bh
 for qemu-devel@nongnu.org; Sat, 06 Nov 2021 06:18:31 -0400
Received: from mail-ua1-x92f.google.com ([2607:f8b0:4864:20::92f]:42908)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nirajsorathiya101@gmail.com>)
 id 1mjImL-0000vx-0F
 for qemu-devel@nongnu.org; Sat, 06 Nov 2021 06:18:31 -0400
Received: by mail-ua1-x92f.google.com with SMTP id t13so6460000uad.9
 for <qemu-devel@nongnu.org>; Sat, 06 Nov 2021 03:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=ycbnL6xB0e9MfvIPaQNg8dB6+ufVcTybaFp8jaoo9b8=;
 b=T6zAEmuz1L8ZhepRIN4fdYKKV0kgPHjyzqKPsyjaJgQiV5FsIo4GWVhHISCfzIFLSE
 L5PzWWEXQ2E9QORzffZR7F/gkpqEbNl3ori+AINhpjQWSwo976PnhwpwxiTtTVofinpJ
 GQk7jGxQWpTm7KnSUgPKyvRs9o7h05N9Yf7l2nmV4sZI1cVbOkQtwF7/R/h9znoq7WZ+
 u2QH11DdyIv7MIa5MaDibtiTY7wjMdAFLLSGbREXS2RDUcLgvps4GsIVv3YZt6ZP2Q0R
 BIhsiguL9bGwCIDe7SH1oLDM+mt4oCKYdjRDNFvN9G++XCUi8ffnp8Q6XvrwzsYyP3JV
 uZLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=ycbnL6xB0e9MfvIPaQNg8dB6+ufVcTybaFp8jaoo9b8=;
 b=I1FqUGRZFSovlBq98HGly0m4os/g6+f89UxQVfa3e9tunlj+qe9I7EMhcvBkkEs4Or
 Ru69BHqhdFNk5VD65S6w2cetYT7Cw5kQgkrKyTaUyhcgNHF8EVvl/7ZpcTUqNuJ2bPB6
 fMvLKvHXGInYzaJhEcq4Rn3HTiYN8ymcq28jgiYjFoy56a/UYh4XgEZlfWt9nw+jIZez
 0zbC0dFDBiqXfVMnEDrE5OP4T7IwhYXt0bjgXZBKAvlYpt5ngtgUJybH7U6PdIyX4ikH
 JiiY9SbSJM7/IDhJsu1hgXvkpQIcm9VLd58SvmNkelE6mghes3zVEdNAZy9J2r7ek1DF
 RD/g==
X-Gm-Message-State: AOAM5307nr6LP0YJhTC9APMXJC75LD6NE/0P9iDlkEoUbUaC6K1yKwEu
 WtaRiOWfZ1e7yGR+8qQfxf57OUqpD/nJ+jkuJi1JUiefSSQ=
X-Google-Smtp-Source: ABdhPJyHPTqqJD5rfDleT0Vm8s6NSbsR9CaVa4iGkIX2xKu6vN2vcvSxbicj8Wh0dN7pWnKXZr2Fh+TLRGkG2+aTLr8=
X-Received: by 2002:a05:6102:3912:: with SMTP id
 e18mr61079935vsu.36.1636193906912; 
 Sat, 06 Nov 2021 03:18:26 -0700 (PDT)
MIME-Version: 1.0
From: Niraj Sorathiya <nirajsorathiya101@gmail.com>
Date: Sat, 6 Nov 2021 11:17:57 +0100
Message-ID: <CAFT0Dp1FKeLFNbKSXtgjt9FHF3awu+4ic32cAXQrrmd7Dstwbw@mail.gmail.com>
Subject: Emulation of solo key
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000009af0a605d01c145e"
Received-SPF: pass client-ip=2607:f8b0:4864:20::92f;
 envelope-from=nirajsorathiya101@gmail.com; helo=mail-ua1-x92f.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000009af0a605d01c145e
Content-Type: text/plain; charset="UTF-8"

Hello Team,

I really need your suggestions on how I should proceed to build a Solo key
emulator ?  Since I am new to QEMU  , I would like to know how I should do
planing before getting into technical of QEMU

Please find all information about solo key below:

Docs: https://docs.solokeys.io/solo/building/
Firmware: https://github.com/solokeys/solo/
Hardware: https://github.com/solokeys/solo-hw


-- 


Best Regards,
Niraj

--0000000000009af0a605d01c145e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello Team,<div><br><div>I really need your suggestions on=
 how I should proceed to build a Solo=C2=A0key emulator ?=C2=A0 Since I am =
new to QEMU=C2=A0 , I would like to know how I should do planing before get=
ting into technical of QEMU</div><div><br></div><div>Please find all inform=
ation about solo key below:</div><div><br></div><div>Docs: <a href=3D"https=
://docs.solokeys.io/solo/building/">https://docs.solokeys.io/solo/building/=
</a><br>Firmware: <a href=3D"https://github.com/solokeys/solo/">https://git=
hub.com/solokeys/solo/</a><br>Hardware: <a href=3D"https://github.com/solok=
eys/solo-hw">https://github.com/solokeys/solo-hw</a></div><div><br></div><d=
iv><br>-- <br><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"=
gmail_signature"><div dir=3D"ltr"><br><div><br></div><div>Best Regards,</di=
v><div>Niraj=C2=A0<br></div><div><br></div></div></div></div></div></div>

--0000000000009af0a605d01c145e--

