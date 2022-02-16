Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E81DD4B7D79
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 03:30:49 +0100 (CET)
Received: from localhost ([::1]:47518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKA5g-0006aX-II
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 21:30:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nKA3x-0005sm-W8
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 21:29:02 -0500
Received: from [2607:f8b0:4864:20::335] (port=39718
 helo=mail-ot1-x335.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nKA3w-0006jo-Ip
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 21:29:01 -0500
Received: by mail-ot1-x335.google.com with SMTP id
 r18-20020a05683001d200b005ac516aa180so592024ota.6
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 18:29:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Pr/73cazkwVW9MiUci7b4tSB6qYeiOsHE8ByPcIyOWo=;
 b=p/2v7N8ZdPLuEtVuOND+jsLEp34UigrSNQJFeevJYYBMrqpjSyM2U1VS+W25KNaxw6
 rU938obaVTZSNLTjG2KwgfB+JNT75Yc6x2S5/Ex+UDnef/fqiz9DJlNsC58woxpPgTqq
 rZ6S4/c6PIRYVJsy/0vrj1l4YipyCWVRhgLfrtV2NgsKccxKMK9tz4G9LCc1qiozS3jJ
 5DNHh/g92zW+bkJEZ2DaZGTXZ/fFXgJUdYwGq5A9rdd+UG8AV+I6aJjcJDFTiR99hpaw
 HflC6BnoYqi7lkJr1v9Q8/YOKoJeLqVtCDxdud1zCI7ve67VYkJ4B6WFGQGcil6LVE5/
 b5ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Pr/73cazkwVW9MiUci7b4tSB6qYeiOsHE8ByPcIyOWo=;
 b=1tOTJ/8Ofd6+Z1+sFyWlMa0ur+NPQhV5kMh3JFERmcRb1+tXhGDh2UZk4pQmemvRKv
 dk4Iqn7n2rXuBB/1a3ubhsragotzPuUdgnO+bdgX3zqzdC9IicOzlriGjWA1MhLBA7sL
 QBArjbUdBgqOKDwUxof1cACYP4uuqlcfHCVeXPtBZfKd+0XcZ16c7PNgpN4BTVBv4vxN
 88SwVTwvb/OCc0KVOIe9JvJn+CXS9h2Uk2jtGLtvot0i/y+7vYgEstfFaZG5bq36Vd1t
 J99UhtdknSlew8UdoW/IkxzimmqRyl5QXDMJFofiaU8s2j0PoxMYPY9NIiN05yZEArN7
 bYAg==
X-Gm-Message-State: AOAM532HK8KRvn7G97VW4FB6mvt2CUiKUCf9TbUGSmf8dwoYzT+mBw9+
 vyRm3IGYnowwBaDh/mhW+mHX0+hUF04Bvygng5Q=
X-Google-Smtp-Source: ABdhPJz/cy827bEAWy6VKDRkbaTIG4qigK/o6S5vtiyB5boLhu+DFjuLZP6bHj4oGMZHINFcu9eFZXkf7Nl+nFniM2Y=
X-Received: by 2002:a9d:6f8c:0:b0:5ac:4ce8:b34d with SMTP id
 h12-20020a9d6f8c000000b005ac4ce8b34dmr178064otq.235.1644978538720; Tue, 15
 Feb 2022 18:28:58 -0800 (PST)
MIME-Version: 1.0
References: <20220215120625.64711-1-f4bug@amsat.org>
 <CAMVc7JU3sd+h4A2R2-hScyLBJyo9Zb8SzLFapMsRdSwJ3KX_xw@mail.gmail.com>
 <f223128e-b6df-5f48-5478-d57f54bfcda0@amsat.org>
In-Reply-To: <f223128e-b6df-5f48-5478-d57f54bfcda0@amsat.org>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
Date: Wed, 16 Feb 2022 11:28:46 +0900
Message-ID: <CAMVc7JXZFcpiM2vHFMRQ_yWWH0eA8L-Z9h=E4dJETQJnYOj7_w@mail.gmail.com>
Subject: Re: [RFC PATCH 0/4] buildsys: More fixes to use GCC on macOS
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::335
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::335;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-ot1-x335.google.com
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
 qemu Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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

