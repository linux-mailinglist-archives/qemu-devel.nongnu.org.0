Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7239B62A99
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Jul 2019 22:52:02 +0200 (CEST)
Received: from localhost ([::1]:44660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hkacD-0004Xn-MV
	for lists+qemu-devel@lfdr.de; Mon, 08 Jul 2019 16:52:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55959)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <marcandre.lureau@gmail.com>) id 1hkab0-0003dv-88
 for qemu-devel@nongnu.org; Mon, 08 Jul 2019 16:50:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcandre.lureau@gmail.com>) id 1hkaaz-00070B-7H
 for qemu-devel@nongnu.org; Mon, 08 Jul 2019 16:50:46 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:42645)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <marcandre.lureau@gmail.com>)
 id 1hkaaz-0006yY-10
 for qemu-devel@nongnu.org; Mon, 08 Jul 2019 16:50:45 -0400
Received: by mail-wr1-x442.google.com with SMTP id a10so17500762wrp.9
 for <qemu-devel@nongnu.org>; Mon, 08 Jul 2019 13:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=8pUp+EN8OKyEOt0IR3UHz+DFxJDwX3bUYNujyhvPFGg=;
 b=rNzqCJqHUQ9tq0tGWhnq9dbaIcu/Qq/zv/idc0nWFpZtcbtIIABjG9ggpQHrQtGPeS
 gvL2AB5G3JF3aG6qZqZxsXenTAgcmbMD1GPaoL8I1nNxoWzXc+Mzq0TzvJNXhsznC/dS
 aQtW7eMmJ3RcD2ZBUFErWPCP1T+W8dbtZ9i9/MpY7xsNYb3l+wqsGmY8I7oIagZQbpoM
 5zlIUawqWxbuTdNBpnER/NMXX7VY9Ph7AHHHRWZWwBCfA1p40bNHx2lsI+Ooa5+NqMdL
 pkMBE4IwbygjzydtLSZ+S2virR21HgD22GywN6imwnRYLPBkfuNJdQX0164ZFDfEy3oq
 bmUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=8pUp+EN8OKyEOt0IR3UHz+DFxJDwX3bUYNujyhvPFGg=;
 b=L4O5BMyQSUoYbJPBp0eziNFEOC8nXTpPWexrQ7KQeYBDPZ+sDnocpQh3p1AwP6X/K+
 eA7x3N9lNzt6cnsslRzTEgpctYBSh8e3mcHbRFL8VoJQsjNCtZc8UTtcHkOCt+CP0/jp
 OX+PstZKaXFrpNugSN7J1zyfjD/bYK63XvezbROOhz3LMQzibJD9FVIoJpO+r1pR4r8c
 k5zd+S6kSJob8+/HEJAGtoSAh9YMPXq40EwZkuhuLG2b7SDaJCDN42mXI+VVWxMmclqt
 A6UoNYUot5d/S3gl9EG5HX8ukekGP9KUGRwaah+9bmAiLtsK6gdyxtMKxcs64rM6/aRo
 RrYQ==
X-Gm-Message-State: APjAAAWtcV8BHPHhpCSo67Y2gCB5gtpRoZXivwse+LEwoUXXnQwukC8R
 01tjEkFFiKualUlssLjKVVl5vxykAoGA7jEwfKk=
X-Google-Smtp-Source: APXvYqz9dDbG0Jve+aii1X3Fxo5561U0pP+dqSc3V7OauWnwCM7GmE0WfO5KWZOuW7KC/8WzjCa0eLAmsxEtng0Hhgo=
X-Received: by 2002:a5d:55cc:: with SMTP id i12mr21162375wrw.201.1562619041724; 
 Mon, 08 Jul 2019 13:50:41 -0700 (PDT)
MIME-Version: 1.0
References: <20190107122304.22997-1-marcandre.lureau@redhat.com>
 <CAFEAcA_AFvdzWP7a9hE9qeqAp22swiP7MKBTO9yWJUoW4JnRjA@mail.gmail.com>
In-Reply-To: <CAFEAcA_AFvdzWP7a9hE9qeqAp22swiP7MKBTO9yWJUoW4JnRjA@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 9 Jul 2019 00:50:29 +0400
Message-ID: <CAJ+F1CKRG2DjSkw-eZ8H-QkDRS1GfGBDxv5w=Ri8=D700HCW5A@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::442
Subject: Re: [Qemu-devel] [PULL v2 00/28] Machine props patches
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi

On Mon, Jul 8, 2019 at 8:40 PM Peter Maydell <peter.maydell@linaro.org> wro=
te:
>
> On Mon, 7 Jan 2019 at 12:23, Marc-Andr=C3=A9 Lureau
> <marcandre.lureau@redhat.com> wrote:
> > ----------------------------------------------------------------
> > Generalize machine compatibility properties
> >
> > During "[PATCH v2 05/10] qom/globals: generalize
> > object_property_set_globals()" review, Eduardo suggested to rework the
> > GlobalProperty handling, so that -global is limited to QDev only and
> > we avoid mixing the machine compats and the user-provided -global
> > properties (instead of generalizing -global to various object kinds,
> > like I proposed in v2).
> >
> > "qdev: do not mix compat props with global props" patch decouples a
> > bit user-provided -global from machine compat properties. This allows
> > to get rid of "user_provided" and "errp" fields in following patches.
> >
> > A new compat property "x-use-canonical-path-for-ramblock-id" is added
> > to hostmem for legacy canonical path names, set to true for -file and
> > -memfd with qemu < 4.0.
> >
> > (this series was initially titled "[PATCH v2 00/10] hostmem: use
> > object "id" for memory region name with >=3D 3.1", but its focus is mor=
e
> > in refactoring the global and compatilibity properties handling now)
>
> Hi; I've just noticed that this refactoring that removed all the
> HW_COMPAT and PC_COMPAT macros left a couple of references to
> them behind in documentation/comments:
>
> $ git grep HW_COMPAT
> docs/devel/migration.rst:   b) Add an entry to the ``HW_COMPAT_`` for
> the previous version that sets
> hw/i386/pc_piix.c: * HW_COMPAT_*, PC_COMPAT_*, or * pc_*_machine_options(=
).
>
> Could you write a patch which updates these bits of documentation
> to refer to the new scheme, please?

Ok, patch sent. (it is trivial, as I didn't see any need to change the
documentation further)

thanks

--=20
Marc-Andr=C3=A9 Lureau

