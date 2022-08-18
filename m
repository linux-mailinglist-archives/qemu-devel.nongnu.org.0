Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8794598333
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Aug 2022 14:38:51 +0200 (CEST)
Received: from localhost ([::1]:44872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOenS-0006BT-9J
	for lists+qemu-devel@lfdr.de; Thu, 18 Aug 2022 08:38:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oOekL-0003BV-L5
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 08:35:37 -0400
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132]:44864)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oOekI-0005lk-M0
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 08:35:35 -0400
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-33387bf0c4aso36601417b3.11
 for <qemu-devel@nongnu.org>; Thu, 18 Aug 2022 05:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :mime-version:from:to:cc;
 bh=jzWvgd3Lf0nILx2X77nHtRpdgT2EeyumA8r8Hv32FS4=;
 b=FCLGeglGlYMZaKCew0aH4apDm6r+sh08GlLKysvkl8Li8xCcZ8rxaKLAljMKybw/D7
 9kqCY91ix3LtDFBGCHk9NLLI8CCRHnx7uMyexTyR4cOzaiIyUxFQl9MkIGzkalQ7DzrN
 390eWFV/RmQ0sxGZZ+4ADEln3WPCzuACTxAgUc8XUa06d8BKaHNJ5n9bBmsf3kylinHN
 arPp4Yht0VMQQMg7e1sERwZ54tOgdWpwdgQn6qnOszZBBrJ+08GiITV40cVzPeJdJmgg
 9gA2g7OsBOF+Nnt+/fcHhTyLGVmmxuqxw6GADbObh5nEZ6HdJOC2rKqq6cPxcreHvlew
 KPGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc;
 bh=jzWvgd3Lf0nILx2X77nHtRpdgT2EeyumA8r8Hv32FS4=;
 b=jL6lbj7Ud3M1QrBDBt8rW/fX4EgeRg14/kCW8S9fZpIcfx1xnrfDjd+WBbhSoEpFul
 WLaEnEM78uKV8kE9RNFBRiP9Q0sNTfHoegz7tbh//XVhmNsRssRq5EtzRmVcUf7RmiQ2
 Y5v4l/QI8SQLkk4qjhfilSTdvIRnCdgK9arjBTneaXpqR10INlzW1b6GCrRkrX210dAF
 9pen2UuWeJEz+zxd4OVplvfPdJD7kVZdmv/Tvd8J/uKh2gyno+8MnpSiELswMCJ+WJXT
 dhaAz9SmTt+n3fhni8AbcNMiHhgmG32AN47QSYqaxioSdKZJmyLVZHVfdx1lduBdxETq
 rVkw==
X-Gm-Message-State: ACgBeo1gCtBvvNB02xufRR5B4o3qFb59dv9ml0ne1KsNAWXkJWMZUYfg
 /LU/SJ1fHVSYpPPAE1OgcLnNDD6ZPVO66kU4C/o8wa3hQb7ihONG
X-Google-Smtp-Source: AA6agR6Bgwp+2Nh34DUFj+khI4fAs0dgTro6Ad4voLUj+SU5gAhFETnFi8ukAjjtr63oF2yQHJe3t/jgGtXR4VcpAik=
X-Received: by 2002:a0d:dfce:0:b0:333:df91:2483 with SMTP id
 i197-20020a0ddfce000000b00333df912483mr2679570ywe.296.1660826133136; Thu, 18
 Aug 2022 05:35:33 -0700 (PDT)
MIME-Version: 1.0
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Thu, 18 Aug 2022 08:35:21 -0400
Message-ID: <CAJSP0QV2v96TP=v-dQoj3tSYEYsf8CUjKWUq1Tuy34LguM5j6A@mail.gmail.com>
Subject: Making GSoC Org highlight video for QEMU
To: qemu-devel <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=stefanha@gmail.com; helo=mail-yw1-x1132.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Hi,
Google Summer of Code organizations are encouraged to create 2-3
minute videos that present their organization. Organizations with
videos will stand out and may be more successful in attracting
applicants.

I want to give this a try for QEMU. If you want to be involved either
as the video presenter or in making the slides, please let me know and
we can work together.

Guidelines from Google:
"Your 2 - 3 minute presentation should include information such as:
- An introduction to your org (what your org does and why that work is
important)
- What type of projects does your org generally have available for
GSoC contributors?
- What type of GSoC projects have been completed in the past?

You may also want to quickly highlight a couple of past projects or
mention some cool things your former GSoC students/contributors have
done (become core committers, joined your org=E2=80=99s board, become mento=
rs
in GSoC, etc.).

What type of contributor are you looking for?

If your org has a very complex codebase then you may want to briefly
mention something like =E2=80=98Our org has a more complex codebase so folk=
s
with solid understanding of XX are often able to jump into the
projects more easily.=E2=80=99 On the other hand, if your org has a ton of
onboarding docs and is a good org for folks very new to software
development then you can mention that.

- 1 - 2  slides for org info or highlights
- 1 slide with your org=E2=80=99s resources (ex: official site, chat channe=
ls
to reach your org, etc.)"

Stefan

