Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2D23434A6A
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 13:44:01 +0200 (CEST)
Received: from localhost ([::1]:48494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdA0m-0007IO-W9
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 07:44:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaduo19920301@gmail.com>)
 id 1md9vf-0004nI-5n
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 07:38:45 -0400
Received: from mail-vk1-xa30.google.com ([2607:f8b0:4864:20::a30]:34688)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jiaduo19920301@gmail.com>)
 id 1md9vd-0000S1-RZ
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 07:38:42 -0400
Received: by mail-vk1-xa30.google.com with SMTP id bc10so4958228vkb.1
 for <qemu-devel@nongnu.org>; Wed, 20 Oct 2021 04:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=nn2UYYDdpck2Ee6IHX96LGoZfuB2XaFlAtc3SglVIfU=;
 b=X1QjsM75bHh2hiqyVJpZ+GjPExwmK8fsFfbumHEUTIt5kQcSNkUI2KXORi5SDeG0pP
 womePe9ok8GDfsaX1l5P2oiA5pvSEav2+BGRgM+zLqhslpvFCWkYJidRmYIh5sgFtiWr
 oUCXZdieEKvcvc0q4Kjj/iBctEEN2zQ9qcH93GAX0i1Ex4ulJjiYCAJAWE9wBZ4dGYS2
 Sch4UiV7M1bhCn4T67f/ffwQFVl1AJkpp8+kpkhWKrxnLmzqtR7auv/MLZ4MjrYwMRBx
 b6opZ73xBbVA6+8TTvXk6cS6C/pR+8xA1LUb1+HlTBSD8y6EwTQ2oy3h8Jp7fsSVISK4
 k6qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=nn2UYYDdpck2Ee6IHX96LGoZfuB2XaFlAtc3SglVIfU=;
 b=iiXfS8vw8GCIb9J4C3+XTdp6X4hFPGhzOm3MAk3Z5eJ5rgKOMoBqIkIw7Z3bUH4ky6
 6Vl8AWw3XQ7w+ESm1xJB2GDeVG6rhRGglAthypl1TNJfMvBGPQv8u8SlPe/dYwL/YiEW
 8AtrsxjFTEXucrfYuiGHU/8sQgl1W1nW/AYM4SBucMLCwkhKBWsw2dxbA04syzFr69b+
 p/oJ0zSjE5EIGwWgL4zrIPhRrlJ8xh0kYfmP6GWficPVlkjyuYvXhXYPN8o8L3aTnTZM
 aFAAs1ZnyBkHpHDXDwlzJ25EfYxN4mWXaoOUmyX+n+liRmcwr92wt4kUV/Bk2Ht+Fmta
 VYmQ==
X-Gm-Message-State: AOAM530RkqoMqRRd0KXW/RduaWD2txHSVwBKZ625TSMGmyvWEtuyaKgR
 SWHQ3XLIqoK1wBhubc9U0x69Txd2BuQCSQ8qovhZNZ01Te0=
X-Google-Smtp-Source: ABdhPJxO+pZnePphW0KYG6Raxc8cJQHpwEhJB/YcUmGr0n8oSs3Mf4tOif0IZXAIDsInJubzp7KfyieYLTGWgW0jXoM=
X-Received: by 2002:a05:6122:17a4:: with SMTP id
 o36mr38173976vkf.0.1634729919161; 
 Wed, 20 Oct 2021 04:38:39 -0700 (PDT)
MIME-Version: 1.0
From: Duo jia <jiaduo19920301@gmail.com>
Date: Wed, 20 Oct 2021 19:38:27 +0800
Message-ID: <CALUzjTbVKxsVBf9uzYhg_vVK-wq=qBJ9qni2tcvdT5y+w1uxBg@mail.gmail.com>
Subject: =?UTF-8?Q?How_does_QMEU_connect_USB_devices_in_GUEST_to_HOST?=
 =?UTF-8?Q?=EF=BC=9F?=
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="00000000000022aa0005cec738c7"
Received-SPF: pass client-ip=2607:f8b0:4864:20::a30;
 envelope-from=jiaduo19920301@gmail.com; helo=mail-vk1-xa30.google.com
X-Spam_score_int: 1
X-Spam_score: 0.1
X-Spam_bar: /
X-Spam_report: (0.1 / 5.0 requ) BAYES_40=-0.001, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

--00000000000022aa0005cec738c7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I simulate an MCU firmware.
This firmware uses USB peripherals and is a function of a USB flash drive.
QEMU can well support the operation of instructions, but I don't know how
to extend the function of a USB so that the USB flash drive can be
connected to the host.

I have checked some qemu documents, all of which are connected to the guest
by the usb device in the HOST.

Can you help me?

thank you=EF=BC=81

--00000000000022aa0005cec738c7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I simulate an MCU firmware.<br>This firmware uses USB peri=
pherals and is a function of a USB flash drive. QEMU can well support the o=
peration of instructions, but I don&#39;t know how to extend the function o=
f a USB so that the USB flash drive can be connected to the host.<br><br>I =
have checked some qemu documents, all of which are connected to the guest b=
y the usb device in the HOST.<br><br>Can you help me?<br><div><br></div><di=
v>thank you=EF=BC=81</div></div>

--00000000000022aa0005cec738c7--

