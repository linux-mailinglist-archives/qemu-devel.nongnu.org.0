Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4C8E644EB
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Jul 2019 12:07:25 +0200 (CEST)
Received: from localhost ([::1]:59660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hl9VT-0001Ur-6Y
	for lists+qemu-devel@lfdr.de; Wed, 10 Jul 2019 06:07:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34206)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <aleksandar.m.mail@gmail.com>) id 1hl9ST-0000Ka-AC
 for qemu-devel@nongnu.org; Wed, 10 Jul 2019 06:04:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.m.mail@gmail.com>) id 1hl9SP-0006ZG-Hz
 for qemu-devel@nongnu.org; Wed, 10 Jul 2019 06:04:15 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:33713)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <aleksandar.m.mail@gmail.com>)
 id 1hl9SM-0006Tk-V4
 for qemu-devel@nongnu.org; Wed, 10 Jul 2019 06:04:11 -0400
Received: by mail-ot1-x343.google.com with SMTP id q20so1584875otl.0
 for <qemu-devel@nongnu.org>; Wed, 10 Jul 2019 03:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=S1hAAsJpfyr3VE2KVrpolIipA93PaBnStkoxwRfzlqM=;
 b=j0SX1ucOxcse1KlzZOuFBFTHL3I6H4nB/NKYWqdmG7sDCNEcvxu+V4D5phoZYWcPu0
 CPFU3SXCPgGwcQvQiLJJEppfk8jhmeuPJD+ejMiFUpWJGsocU/llNYedLPO8lgB96RQP
 b2WnEj8dxKzYZKP06EORmOG6YVp/W1xNH9GPYiGl7KMuKQm061NwR7R3jnCS1MV3+5B/
 dwHM01Ciw20grrjaZS44M7EWTviigeCwSAe4yMTdc3SLtWcqz1QnEvFaocAKLN0sACmA
 cHD1dkQYb7SWOnnEA/pf/TU+K77TFZAsd3N0fR6QLzHQE+KSkUflAsrRt7C3cEGSk6oI
 rpng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=S1hAAsJpfyr3VE2KVrpolIipA93PaBnStkoxwRfzlqM=;
 b=dXeUjtXRWNZZ9M0L7+YQkSdk5/RoBAzbfriEa3y4DM1GhtQysEWkd556euMJ9EqbqH
 7d72V2uDG2H+aLnV/tDJ0eQd+yyBhX/OJk2K9ocCFGayYthKtw/+hmlzONpRy9wJjjIT
 0pKqUZX2DiGIWDjdjMgCMsKYodc5kY3EwJBadmqy98gMpIbi3NSncmnytxrQUPvz4rfJ
 2jh4iz2T9bwM58gP0Lyl4QRIqgdyCe6poKBp/GeR1EXkVoEwAhf0+5vFTRMG2tVKdkjZ
 THlppULu/7kTLzxGDKIKp0qa3lgS9DUbW9Y5Tp8DlGSZkJh2vFC055cecbLgFJYYdZJo
 JE7g==
X-Gm-Message-State: APjAAAWjMoe2NAbI2pWvHvMQIwDin/5MiDhcGmI4SbxlR2nRRMW1fZGe
 C95stX8UIatcIhf+AmLXR5GFh4YlBtJheug1rvo=
X-Google-Smtp-Source: APXvYqy/rzKly6BMLnR9R8KKyfq/fhmMK2z4Ni24JLPI0JulOaRCufjXtlG6yObI3FHgMBvmBvZ04YGKWUWopQIo6Vw=
X-Received: by 2002:a9d:5cc1:: with SMTP id r1mr23829243oti.341.1562753050086; 
 Wed, 10 Jul 2019 03:04:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:4798:0:0:0:0:0 with HTTP; Wed, 10 Jul 2019 03:04:09
 -0700 (PDT)
Received: by 2002:a9d:4798:0:0:0:0:0 with HTTP; Wed, 10 Jul 2019 03:04:09
 -0700 (PDT)
In-Reply-To: <CAFXwXrn4S-Xtd=3Yv2JaqK1fmkYHHQf6VOcc+VsDxgVr05pPXA@mail.gmail.com>
References: <20190709184823.4135-1-richard.henderson@linaro.org>
 <CAL1e-=i7Paug3G4xFCVRpH=NadNti1oG9y8n7geUJeGDoizc4w@mail.gmail.com>
 <CAFXwXrn4S-Xtd=3Yv2JaqK1fmkYHHQf6VOcc+VsDxgVr05pPXA@mail.gmail.com>
From: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Date: Wed, 10 Jul 2019 12:04:09 +0200
Message-ID: <CAL1e-=gDgBhA2XPT+=-d8Y+9kTav8nOh6O2Xy1q0TugdZ0fc8A@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.23
Subject: Re: [Qemu-devel] [PATCH] tcg/aarch64: Fix output of extract2 opcodes
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Beata Michalska <beata.michalska@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Jul 10, 2019 11:48 AM, "Richard Henderson" <richard.henderson@linaro.org>
wrote:
>
> On Wed, 10 Jul 2019 at 11:22, Aleksandar Markovic
> <aleksandar.m.mail@gmail.com> wrote:
> > On Jul 9, 2019 8:56 PM, "Richard Henderson" <
richard.henderson@linaro.org> wrote:
> > >
> > > The aarch64 argument ordering for the operands is big-endian,
> > > whereas the tcg argument ordering is little-endian.  Use REG0
> > > so that we honor the rZ constraints.
> > >
> > > Fixes: 464c2969d5d
> > > Reported-by: Peter Maydell <peter.maydell@linaro.org>
> > > Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> > > ---
> >
> > The commit message looks more like a list of some random items than
logical explanation of the code change. Improve it.
>
> Vague and non-constructive comments like this are and will continue to
> be ignored.
>

You can continue ignoring any comment that you don't like, as you already
have been doing for long time, but this will certainly not improve your
code, and is contrary to the spirit of open source.

Regards, Aleksandar

> If you want to review a patch, then you're going to have to actually
> read it.  There are two obvious changes in the one line patch.  Each
> sentence describes the reason for each change.  There is no subtle
> complex problem here.
>
> r~
>
> >
> > Regards,
> > Aleksandar
> >
> > >  tcg/aarch64/tcg-target.inc.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/tcg/aarch64/tcg-target.inc.c
b/tcg/aarch64/tcg-target.inc.c
> > > index b0f8106642..0713448bf5 100644
> > > --- a/tcg/aarch64/tcg-target.inc.c
> > > +++ b/tcg/aarch64/tcg-target.inc.c
> > > @@ -2226,7 +2226,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode
opc,
> > >
> > >      case INDEX_op_extract2_i64:
> > >      case INDEX_op_extract2_i32:
> > > -        tcg_out_extr(s, ext, a0, a1, a2, args[3]);
> > > +        tcg_out_extr(s, ext, a0, REG0(2), REG0(1), args[3]);
> > >          break;
> > >
> > >      case INDEX_op_add2_i32:
> > > --
> > > 2.17.1
> > >
> > >
