Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD4C93EEE8E
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Aug 2021 16:32:18 +0200 (CEST)
Received: from localhost ([::1]:55654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mG08X-0007sI-UK
	for lists+qemu-devel@lfdr.de; Tue, 17 Aug 2021 10:32:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kennethadammiller@gmail.com>)
 id 1mG07b-00077U-Nu
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 10:31:19 -0400
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330]:37424)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kennethadammiller@gmail.com>)
 id 1mG07Z-0007fI-VR
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 10:31:19 -0400
Received: by mail-ot1-x330.google.com with SMTP id
 n1-20020a9d1e810000b0290514da4485e4so22363648otn.4
 for <qemu-devel@nongnu.org>; Tue, 17 Aug 2021 07:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=9H4IMm0ClGbq7pMDIo723Vd1hqFTSPVM2bNV7va/wP8=;
 b=cOAddsLbtAfs8ISaPs82an249Dfl/kiJRg4q1aQKVzvXxhAecX1l5RU0KgkCnvftlM
 itgIuo/nRluSpI1Fr6cNG2mQ+ekdU5Gkjvbz4JVnKGa7CAWUW7I7d5FQDiBwy/2PdxzR
 J/DlrIdFgDinRcvYFzQSUAaBu07So3H6ps6OBjeThLJzC6zDT2mcojTM6kdHT9aWe3KR
 ZWWfLHsaRUy2Qte4LN3MZUfY+0DnYDi989bN3tfaKL9tOd5BfSlSk2jvKV2HYRn67EPJ
 6THt6f11uFp0rrz0UWW/dAFyGDIMWny7wPcEdOq9emxRp/Yxjzv5D8N7kCtEYsV49qxA
 VNBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=9H4IMm0ClGbq7pMDIo723Vd1hqFTSPVM2bNV7va/wP8=;
 b=Ta7O0gS9dWzrqum3VsNbItGODlZchY4Ik4phDBSydAYKK2f0P59hPM4unkIBoY/B1N
 u7GQCzYzKBRILACzsjsBBUy/KK4uObyZuwqyNcNIrkPsmcxw2xEzKSgDJn8G0XG3HqT1
 02zVfqziC2pYukEeSV1SGWvW0HCNz7Sj38+140TNpnRpl43cZPGNK64auzn/zNBEuzjA
 mbgEUo3qo5uYkf9YSOGiFESpBmJnH2UPHny4Ao+C3weWKNZ81mz3IkxZx5hEZvZaa1NB
 RaVNhypxETBVozoNIIKfYPurSYMqqcA/vo3ybOj1r9+HXGwBnm7GgqH3E+DzfNJyQc7C
 s4YQ==
X-Gm-Message-State: AOAM531U66Po/UqG7FPQiHmQW1214liG8mgkkBvyiSQujiYQykkskA0/
 ocb1TSQvAXyhr7HQuBccqFEVqKI10PgO3XjLu/wh/okfuO8=
X-Google-Smtp-Source: ABdhPJw6v00+fYZmBM4geoiffOQM4VtmCBvMVwBhNF4tf8QR7NWs1LOShCC2Ht+W8AE3BsmfTxYBqavychqL4m6iGM8=
X-Received: by 2002:a9d:eed:: with SMTP id 100mr2901031otj.50.1629210675928;
 Tue, 17 Aug 2021 07:31:15 -0700 (PDT)
MIME-Version: 1.0
From: Kenneth Adam Miller <kennethadammiller@gmail.com>
Date: Tue, 17 Aug 2021 10:31:05 -0400
Message-ID: <CAK7rcp9HQ+uoPqu5vwCD8sCca99N5bV+aqD9Oea=VpTVT7Mb+A@mail.gmail.com>
Subject: Bootloading within QEMU?
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="0000000000009a64d405c9c22b43"
Received-SPF: pass client-ip=2607:f8b0:4864:20::330;
 envelope-from=kennethadammiller@gmail.com; helo=mail-ot1-x330.google.com
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

--0000000000009a64d405c9c22b43
Content-Type: text/plain; charset="UTF-8"

Hello,

I am trying to discover how to schedule QEMU to begin actual emulation as
currently my target correctly starts QEMU but only shows the shell, and not
even boot loading occurs within QEMU. I'm trying to learn from example, and
so will focus my questions only on X86. I can see the MachineClass and
MachineState types, and I have tried to follow QEMU with the debugger and
found where QEMU calls qemu_init and qemu_main_loop under
qemu/softmmu/main.c, and even tried to follow through from init to main
loop to see where it would begin booting, but I cannot see where the
bootloader is scheduled or specified or started from within the target
occurs.

It's difficult because the surrounding QEMU APIs that each target must use
isn't documented at all. There's a little bit of abstract documentation
that can be generated, same as what is publicly found. Reading that only
does so much good because there isn't much of a guide as to how to program
the surrounding QEMU libraries.

--0000000000009a64d405c9c22b43
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,<br><br>I am trying to discover how to schedule QEMU=
 to begin actual emulation as currently my target correctly starts QEMU but=
 only shows the shell, and not even boot loading occurs within QEMU. I&#39;=
m trying to learn from example, and so will focus my questions only on X86.=
 I can see the MachineClass and MachineState types, and I have tried to fol=
low QEMU with the debugger and found where QEMU calls qemu_init and qemu_ma=
in_loop under qemu/softmmu/main.c, and even tried to follow through from in=
it to main loop to see where it would begin booting, but I cannot see where=
 the bootloader is scheduled or specified or started from within the target=
 occurs.<br><br>It&#39;s difficult because the surrounding QEMU APIs that e=
ach target must use isn&#39;t documented at all. There&#39;s a little bit o=
f abstract documentation that can be generated, same as what is publicly fo=
und. Reading that only does so much good because there isn&#39;t much of a =
guide as to how to program the surrounding QEMU libraries.<br></div>

--0000000000009a64d405c9c22b43--

