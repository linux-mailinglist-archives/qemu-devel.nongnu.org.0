Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 611454B7E76
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 04:22:22 +0100 (CET)
Received: from localhost ([::1]:38262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKAtZ-0006JT-8l
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 22:22:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nKArf-000543-21
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 22:20:23 -0500
Received: from [2607:f8b0:4864:20::32d] (port=35818
 helo=mail-ot1-x32d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nKArd-0000Fl-4f
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 22:20:22 -0500
Received: by mail-ot1-x32d.google.com with SMTP id
 e19-20020a05683013d300b005acfb3d602aso220737otq.2
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 19:20:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=tynXVh+uaZPsFERZOYD/01X6B6FlXz8z0OSigHVNDzw=;
 b=XL0bnIO86jLj4lvbye9+Uj9UpH8NKUq22XGohXlHvJ+5/+KhyQzwe97R9b/7JwZXqO
 UF/ND/i0ek5WekiyWPEk7stxHEqf4HS6e9nfa4KKZMXquuKsgVOiXUOUYfMqBfKutvXd
 Rr//SkSuGQ2fjJRBcuXsPwsqYMNwdpaBmQwKHAcSp3qN4193eg7SLpHU9BjCL1x1kYyb
 fJmss48EpBiCyL3mMBisbJpOw0/Dieo6CPoCrgNJ1bR2VlcLE6ce1HofWNwBSVrnn9X+
 cjNaX0Qgsi4Yn0669XZHWhNAiO6lJQRfLuoOq3EsY2E2y/RQSASxPWlFF0q3gZGhNBck
 q18Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=tynXVh+uaZPsFERZOYD/01X6B6FlXz8z0OSigHVNDzw=;
 b=32qG+F7pNY0cZlWdZmYDgXS/e+1x2Io13f6X5qfZKn3zgV8k8RoE9HJfxkckxDPQv/
 k7CcsqmlIj4U+OJFK0QuQvhv9fqEzgPi8tLfJl27ZJE3X0cgOQO3QduiXXEVXViNXzg4
 Im9E63hNg9S4M9aWOOKaPC6c2diK+EZ6T5jIbhnf426OuLjASU1IN6KzNPk22FAQ4pG8
 mGUQ+y+EsNHeknz5dOikvaBx3/H0Q/OLLRIkF9F8ffmF77q743PPy9Y3PG4DmZD0kaAx
 SR9CcFacsJyjUsoamMWb19vyeYjX9wmJEUorv0EX5w3GoaL67FkfqBBlVZuaq0PuXMnO
 zSuQ==
X-Gm-Message-State: AOAM533gCqXCYeBbV9MNestGN+1EVUuvsIffAjgV+I3iX8UatuqNx52s
 k8HANYHml89bKMKoCmJeMZtUv6/VakkRdJ3sCcc=
X-Google-Smtp-Source: ABdhPJwGAywdP1GejFqdlnK/S2lgXXTAKhLZhDDEi4FFl6wV32+S9GKtcPVJH1nZti1F2VBB3U/7fYjCB9TOYK+OQsY=
X-Received: by 2002:a9d:6f8c:0:b0:5ac:4ce8:b34d with SMTP id
 h12-20020a9d6f8c000000b005ac4ce8b34dmr222927otq.235.1644981619827; Tue, 15
 Feb 2022 19:20:19 -0800 (PST)
MIME-Version: 1.0
References: CAMVc7JXZFcpiM2vHFMRQ_yWWH0eA8L-Z9h=E4dJETQJnYOj7_w@mail.gmail.com
 <20220216022900.8DE3E1770A1@mail-01.amsat.org>
In-Reply-To: <20220216022900.8DE3E1770A1@mail-01.amsat.org>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
Date: Wed, 16 Feb 2022 12:20:08 +0900
Message-ID: <CAMVc7JUy5NeEN0q=4zfZvn_rppgqn9wicV1z=TsLuHKS3RY3Sw@mail.gmail.com>
Subject: Fwd: Undelivered Mail Returned to Sender
To: postmaster@amsat.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::32d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::32d;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-ot1-x32d.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.904, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Roman Bolshakov <r.bolshakov@yadro.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 qemu Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi postmaster@amsat.org,

Apparently your system is rejected by Gmail. Could you fix the problem?

Thanks,
Akihiko Odaki

---------- Forwarded message ---------
From: Mail Delivery System <MAILER-DAEMON@mail-01.amsat.org>
Date: Wed, Feb 16, 2022 at 11:29 AM
Subject: Undelivered Mail Returned to Sender
To: <akihiko.odaki@gmail.com>


This is the mail system at host mail-01.amsat.org.

I'm sorry to have to inform you that your message could not
be delivered to one or more recipients. It's attached below.

For further assistance, please send mail to postmaster.

If you do so, please include this problem report. You can
delete your own text from the attached returned message.

                   The mail system

<philippe.mathieu.daude@gmail.com> (expanded from <f4bug@amsat.org>): host
    gmail-smtp-in.l.google.com[64.233.177.26] said: 550-5.7.1 [172.105.152.=
211
    12] Our system has detected that this message is 550-5.7.1 likely
    unsolicited mail. To reduce the amount of spam sent to Gmail, 550-5.7.1
    this message has been blocked. Please visit 550-5.7.1
    https://support.google.com/mail/?p=3DUnsolicitedMessageError 550 5.7.1 =
 for
    more information. m141si25626293ybm.519 - gsmtp (in reply to end of DAT=
A
    command)



---------- Forwarded message ----------
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: "Philippe Mathieu-Daud=C3=A9" <f4bug@amsat.org>
Cc: qemu Developers <qemu-devel@nongnu.org>, Roman Bolshakov
<r.bolshakov@yadro.com>, Christian Schoenebeck
<qemu_oss@crudebyte.com>
Bcc:
Date: Wed, 16 Feb 2022 11:28:46 +0900
Subject: Re: [RFC PATCH 0/4] buildsys: More fixes to use GCC on macOS
On Tue, Feb 15, 2022 at 10:25 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg> wrote:
>
> On 15/2/22 14:06, Akihiko Odaki wrote:
> > On Tue, Feb 15, 2022 at 9:06 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsa=
t.org> wrote:
> >>
> >> Few fixes to be able to use GCC extensions which are not
> >> available on Clang.
> >>
> >> Philippe Mathieu-Daud=C3=A9 (4):
> >>    osdep: Avoid using Clang-specific __builtin_available()
> >>    osdep: Un-inline qemu_thread_jit_execute/write
> >>    audio: Rename coreaudio extension to use Objective-C compiler
> >>    ui/cocoa: Ignore 'initializer overrides' warnings
> >>
> >>   audio/{coreaudio.c =3D> coreaudio.m} |  0
> >>   audio/meson.build                  |  2 +-
> >>   include/qemu/osdep.h               | 21 ++-------------------
> >>   ui/cocoa.m                         |  5 +++++
> >>   util/osdep.c                       | 20 ++++++++++++++++++++
> >>   5 files changed, 28 insertions(+), 20 deletions(-)
> >>   rename audio/{coreaudio.c =3D> coreaudio.m} (100%)
> >>
> >> --
> >> 2.34.1
> >>
> >
> > Compiler portability is always nice to have. Making QEMU on macOS
> > compatible with GCC is good, but I don't think that would justify
> > abandoning compatibility with Clang.
>
> I am certainly not abandoning compatibility with Clang. What gives
> you this impression?

I read the description as it says it allows to introduce GCC
extensions which breaks builds with Clang.

