Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C99A529F34
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 12:18:40 +0200 (CEST)
Received: from localhost ([::1]:50946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nquHn-0007Z4-C1
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 06:18:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liu.jaloo@gmail.com>)
 id 1nquE0-0005DI-Ft
 for qemu-devel@nongnu.org; Tue, 17 May 2022 06:14:44 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:33491)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <liu.jaloo@gmail.com>)
 id 1nquDw-0003cj-Tm
 for qemu-devel@nongnu.org; Tue, 17 May 2022 06:14:44 -0400
Received: by mail-pg1-x535.google.com with SMTP id r71so16187147pgr.0
 for <qemu-devel@nongnu.org>; Tue, 17 May 2022 03:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=grBWLR/AfLxJwf9yZ7j2OpMqZUZ8MX8k2tVdHrepmFk=;
 b=hmo7lPABLs9BL4I6gPXwtMzaZ09ko7+Jigl1r8y3QlTkKejegKDGeKX14h3cCGvZ67
 L30c3el2bWHrpeVBGyKzJz8ISuJszgSCdGUwDycIHR7Wgj6ImgBGyVBE+ubDDNchrmpE
 ze7Vge9xUYHJkx619ctijlEUz/p2kqwCBhMKQyh5BtwFvKZnZJFP9No43KaDBASM0XD4
 nRoN5ZGVuyCejVClLKaFKNuq8/XzvRWjZM1SmDs8m3AyQCV4mQryB+iHsCxqTo5XT4qW
 2FHgs4pTEpQKSTp6AckCPtAvLG9pY2JimCR0AVg8D+IUgdIOOdGQV/g1TBlehgu12Saf
 xG8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=grBWLR/AfLxJwf9yZ7j2OpMqZUZ8MX8k2tVdHrepmFk=;
 b=0yaG1vKwI8x7xvRk2kk44JGjKE0JTv/mbVoz4yRWy1ud08HgTnKp8puvoBl86zhEBa
 GL3V/NGDhKk6yFwWTrL4OaM4dFC644fd98vXZt6VjM2FLx261CEeGhv+6le9M5Fz06vN
 gkVUUAD5DGxD+ohwyBsd4kej7DeijJsActQfY2KAkpMVYjr6LMXMt/wgUfsgAjIJCjkK
 rD8UMn9GIBymiDCU8WnCixDqVWUmfHTcmGyYnVZcJEXn/q2wUz3VniRAA17nAHkPJS7n
 jlI3ajNSB4ToeTULFROBfU429rMd8sW+uhl79QRfvJWDyyP9D53KnB1I5fo41jUbFlCh
 wUMQ==
X-Gm-Message-State: AOAM53244FCxVgmvpi5e/3d72jQSewMXSQLqeCYzKL1z59jRB1qARCrC
 5Zma/On4vjr69ag+D/kdqWGtV83U7NvhyB4iL+EMEDkPTb2q
X-Google-Smtp-Source: ABdhPJwIAfErcLML6Odb6YyPfQYy4oyJYr2Y53HDwzAqXjOzN8vfzDkRxkh9HIxvMygdQRb87PLYbNvGvNwblR09kDU=
X-Received: by 2002:a63:f156:0:b0:3ab:ada6:b463 with SMTP id
 o22-20020a63f156000000b003abada6b463mr18566780pgk.462.1652782475109; Tue, 17
 May 2022 03:14:35 -0700 (PDT)
MIME-Version: 1.0
From: Liu Jaloo <liu.jaloo@gmail.com>
Date: Tue, 17 May 2022 18:14:24 +0800
Message-ID: <CAOYM0N09rSSr11vzOqBWLqZj96gxjdxxQYhi_qqzSYOkympCYw@mail.gmail.com>
Subject: why arm bootloader is big endian?
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="00000000000051f89105df326834"
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=liu.jaloo@gmail.com; helo=mail-pg1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

--00000000000051f89105df326834
Content-Type: text/plain; charset="UTF-8"

from hw/arm/boot.c

static const ARMInsnFixup bootloader[] = {
    { 0xe28fe004 }, /* add     lr, pc, #4 */
     ...
}

$ rasm2 -a arm -d -e 0xe28fe004
add lr, pc, 4

$ rasm2 --help
-e           Use big endian instead of little endian

why arm bootloader defalut is big endian?

--00000000000051f89105df326834
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>from hw/arm/boot.c</div><div><br></div><div>static co=
nst ARMInsnFixup bootloader[] =3D {<br>=C2=A0 =C2=A0 { 0xe28fe004 }, /* add=
 =C2=A0 =C2=A0 lr, pc, #4 */</div><div>=C2=A0=C2=A0=C2=A0=C2=A0 ...<br></di=
v><div>}</div><div><br></div><div>$ rasm2 -a arm -d -e 0xe28fe004<br>add lr=
, pc, 4</div><div><br></div><div>$ rasm2 --help</div><div>-e =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 Use big endian instead of little endian</div><div><br>=
</div><div>why arm bootloader defalut is big endian?<br></div><div><br></di=
v></div>

--00000000000051f89105df326834--

