Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0110A105B56
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Nov 2019 21:49:21 +0100 (CET)
Received: from localhost ([::1]:45794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iXtOB-0002sn-Az
	for lists+qemu-devel@lfdr.de; Thu, 21 Nov 2019 15:49:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44854)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.m.mail@gmail.com>) id 1iXtKK-0000ym-TD
 for qemu-devel@nongnu.org; Thu, 21 Nov 2019 15:45:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.m.mail@gmail.com>) id 1iXtKD-0002Sl-DN
 for qemu-devel@nongnu.org; Thu, 21 Nov 2019 15:45:20 -0500
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:35027)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <aleksandar.m.mail@gmail.com>)
 id 1iXtKB-0002Rz-Ff
 for qemu-devel@nongnu.org; Thu, 21 Nov 2019 15:45:12 -0500
Received: by mail-oi1-x243.google.com with SMTP id n16so4514542oig.2
 for <qemu-devel@nongnu.org>; Thu, 21 Nov 2019 12:45:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=YFON6CobwIWZ0d9atdIo/MU5YkhLE/yK6KX0bdCbC7I=;
 b=kFkI3ytyvQhl+uO7QIBOpONpWEirphyhXXjMLocmXAvbvoB1B8Og2b/00lx9IAMkn9
 VC3z5Bj/gLU/nmCbjaw96zr5zf9fPWeJtpGPervWYkxW4O25gPg4Bz2z9QuEtUPwMjK4
 dSG89MlRaxRutcB1wb/ewfVKq3fT9nn2Y1pgTCCqd5boovEkhqq1kWgx/1Hax14eMk3C
 KqpZBvFkQJPS1YhjBbyBlq3WpbtHvUaj7IZPa0aVb51BvHwBG6n4joklu/rbGnSNm2cU
 jVB8CJuSdl077RAhN8NmVZ+dfyICpnq6UAqrMY0VWqQYd/r5c4kGYcq2cqfbiKiTXI+b
 b6AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=YFON6CobwIWZ0d9atdIo/MU5YkhLE/yK6KX0bdCbC7I=;
 b=Fk1QqbKgrg9qn4ACcBEBWDdNfgmX0AJFsfsOn2W1w2Mxk9kGdoMVk+C+CPkcF19eQK
 PBfGwPvOKKdH8253w8RkfgX1L4duYkM9WtRTKwoVc64r9oYts3XjnvqlE7jbUs+36EJZ
 0FcVNEaRfoGKq96qY8mVbSOKBjdKHXYTPBKy+mNvssVC4/N15wALa2oEJOm2ItYQYACG
 NeNNJJxO7gEJO44HDlt44wNZxiGZGuy/yQ7XAL3wiLKuhPY4qdSzlU9lhKxBJ1bWxG6F
 MVrZuwY63+5YQt0M7Hzpl1IIp6dGRCu27Yu+5u950N+3wGTw8NUs2HvkR0kybNTHZNB5
 T6ig==
X-Gm-Message-State: APjAAAVpMZL7oSwTJoS5yQlcV6o7OfIyiLwPWzetFs/r9R7D2qNyo3c2
 DS0Yri2R499A1INlafnGfXFWeRfsw5ChfO+94xY=
X-Google-Smtp-Source: APXvYqzNpvxyshxd3y1DGR/3Z60CG8tEk9JgVn4FU1umJwtcinNa44emclgsB453IZCUPpbAg3M7sUiA9nKmhgN5GVI=
X-Received: by 2002:aca:d17:: with SMTP id 23mr9493187oin.136.1574369110581;
 Thu, 21 Nov 2019 12:45:10 -0800 (PST)
MIME-Version: 1.0
References: <1574121497-2433-1-git-send-email-tsimpson@quicinc.com>
 <CAL1e-=gFBMPj938nrPYjvkOPuMQZTEP9OFiitwLLjekgCxRaKA@mail.gmail.com>
 <BYAPR02MB48868819DDB0818111D4E972DE4E0@BYAPR02MB4886.namprd02.prod.outlook.com>
In-Reply-To: <BYAPR02MB48868819DDB0818111D4E972DE4E0@BYAPR02MB4886.namprd02.prod.outlook.com>
From: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Date: Thu, 21 Nov 2019 21:44:59 +0100
Message-ID: <CAL1e-=gMvf-gx0WJ+xH0e8J84_JOkaACGA93B2XehuCAgiEyeQ@mail.gmail.com>
Subject: Re: [PATCH] Add minimal Hexagon target - First in a series of patches
 - linux-user changes + linux-user/hexagon + skeleton of
 target/hexagon -
 Files in target/hexagon/imported are from another project and therefore do
 not conform to qemu coding standards
To: Taylor Simpson <tsimpson@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::243
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
Cc: Riku Voipio <riku.voipio@iki.fi>, Laurent Vivier <laurent@vivier.eu>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Nov 21, 2019 at 8:52 PM Taylor Simpson <tsimpson@quicinc.com> wrote=
:
>
> They are imported from the existing Hexagon simulator.  Please understand=
 that this patch is the first in a series.  Later patches will contain more=
 elaborate contents in that directory.  The reason I don't want to reformat=
 them is to stay in sync with the other simulator in the future.  When the =
other team makes changes to the code (either to fix bugs or add features), =
it will be easier to identify the changes and bring them into qemu.
>
> Taylor
>

Taylor,

Please understand that this patch can't remain a single patch. It
can't remain even a set of 2 or 3 patches as others suggested. A patch
is a logically connected unit of code whose typical size is less than
200 lines. There are lots of such logical units in this single path
that you sent, and you should not have sent it in its present form,
even if you wanted just comments to it. You should have submitted a
series rather than a single patch. And you should have said this is v1
of my series that I will expand later on. Guidelines for submissions
are here:

https://wiki.qemu.org/Contribute/SubmitAPatch

As far as "imported" files, frankly, I dislike the fact that you are
willing to sacrifice our coding style guidelines in favor to your
convenience. But, more than this, I also find very problematic that
you practically create a dependency between QEMU and another
simulator. QEMU implementation should rely on specifications, and only
on specifications, and certainly should not depend on another
simulator. Currently, in QEMU, there are some cases of imported
disassemblers or similar relatively unimportant tools, but those
imports change very rarely, and are modified to comply to QEMU coding
style. I am not aware on dependency of QEMU on another simulator in
the form you want to do for Hexagon. My strong impression is that you
will create more problems than benefits with such dependency, both for
you and for QEMU in general.

Once a CPU or any other device is specified though documentation,
these specs don't change. Consequently, their emulation does not
change too, in functional sense. The fact that you anticipate changes
in these files imported from another simulator, leaves me with a
(possibly wrong) perception that neither Hexagon internal simulator
nor QEMU implementation you are trying to integrate are complete. If
that is not true, can you explain what exactly you expect to be
changing in imported files?

Yours,
Aleksandar


> -----Original Message-----
> From: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
> Sent: Thursday, November 21, 2019 1:20 PM
> To: Taylor Simpson <tsimpson@quicinc.com>
> Cc: Laurent Vivier <laurent@vivier.eu>; Riku Voipio <riku.voipio@iki.fi>;=
 QEMU Developers <qemu-devel@nongnu.org>
> Subject: Re: [PATCH] Add minimal Hexagon target - First in a series of pa=
tches - linux-user changes + linux-user/hexagon + skeleton of target/hexago=
n - Files in target/hexagon/imported are from another project and therefore=
 do not conform to qemu coding standards
>
>
> >  create mode 100644 target/hexagon/imported/global_types.h
> >  create mode 100644 target/hexagon/imported/iss_ver_registers.h
> >  create mode 100644 target/hexagon/imported/max.h  create mode 100644
> > target/hexagon/imported/regs.h
>
> Taylor, if I understood you well, these files don't confirm to QEMU codin=
g standard, because they are imported. But, from where? And what is the rea=
son they need to be imported (and not created independently by you or someb=
ody else, but within QEMU code style guidelines) ?
> Their content looks fairly simple to me.
>
> Thanks,
> Aleksandar

