Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29405F341E
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Nov 2019 17:06:51 +0100 (CET)
Received: from localhost ([::1]:44794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iSkJ8-00053l-40
	for lists+qemu-devel@lfdr.de; Thu, 07 Nov 2019 11:06:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37340)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iSkH8-0003PU-KN
 for qemu-devel@nongnu.org; Thu, 07 Nov 2019 11:04:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iSkH3-0007I5-FH
 for qemu-devel@nongnu.org; Thu, 07 Nov 2019 11:04:46 -0500
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332]:38029)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iSkH3-0007Hd-96
 for qemu-devel@nongnu.org; Thu, 07 Nov 2019 11:04:41 -0500
Received: by mail-ot1-x332.google.com with SMTP id v24so2464147otp.5
 for <qemu-devel@nongnu.org>; Thu, 07 Nov 2019 08:04:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GxykdJLbj65fZi+60kLxF2O1OUk7yhBSnknlBC1ey7Y=;
 b=KH/mxqsBXvqkmo6e6N7M2yI/dJAKpyD/dUpkmSO37CR5lqR9SoxQ603Bj2HQglQ6vi
 xRs1A+O+bXROSBMq40wTiHS5GX70F/ywg8Caz/dagYjTYzGYi0Z70upwtjjp6EtjI1rU
 85nICWZap1UMpZphK6FoamQsXYn+DWFhm7pwK92HVchsL9nfz0dniOdgcNonC1fn1pwR
 vFqFaqN1ZMoIOhGT6Zo5JM65z46s+8oC2U8k57Eas96d8CPNlWblhcVcHwmWZkb66XyV
 qCpMmKvtre76aQwBSMPCQH39qdZxqhiCBXJyDYD5op3dRgRGjiIePbxtRUTMHampu45p
 aMvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GxykdJLbj65fZi+60kLxF2O1OUk7yhBSnknlBC1ey7Y=;
 b=Dh12eFg7fjmZaanLWkG0rl0GM1nl0fsw5vyJU7xrbAAp6LSkH8bfUjTl5v/UrpJwNk
 9kWyiQagEl+ON6iE08v3cwwgIYUovRI65bmHhofeSWdccexzeQS3AAjC4p110m0PKnTq
 MfpfyoxsRG9Kogh4nhb/8l91Ay+mAOuBnRS+rp1XF4oGbiX6ameUqUbTGFbQkFNq4qah
 t0a9U1zht0Ju05+7cb4EfszL3rBJxBb8/Im/PWfspbabAcQ5dAQkhsbhghQNA5kRxwor
 B8P5Q6frEl9g27DDr+vSbsn1sG9B/ajDW2jE8uPVMhoBJQwsyWl/GtaHP8TtDO9CjtO7
 gQYw==
X-Gm-Message-State: APjAAAXynbyJJe7pVl0IPrIzFqrdbL/23MV2Jj5wGH1/3yY6blQf9MAC
 W1wUxrXwvtuK2UwHraPYSr3oyVfGaPIiA+ydTRzOuQ==
X-Google-Smtp-Source: APXvYqzVPzHJlzFt9C0PL/R/pb0VMQkYBQHs1/fjhuzSfawl57ALrRK3uRlegkbewARc6sK/45c0Aba+3/DVne2YIV4=
X-Received: by 2002:a9d:12d2:: with SMTP id g76mr3843852otg.232.1573142679424; 
 Thu, 07 Nov 2019 08:04:39 -0800 (PST)
MIME-Version: 1.0
References: <20191106161928.GA353373@stefanha-x1.localdomain>
 <CAJSP0QURDvW1Loj=KLWD6icNoXDo3W-u6Dm4_dVX+r0iwxE8BQ@mail.gmail.com>
In-Reply-To: <CAJSP0QURDvW1Loj=KLWD6icNoXDo3W-u6Dm4_dVX+r0iwxE8BQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 7 Nov 2019 16:04:28 +0000
Message-ID: <CAFEAcA-SUmCYnsuDoCY+JHhnGurSTZ3w2vykDwWHgA6zLa-RNg@mail.gmail.com>
Subject: Re: QEMU HTML documentation now on qemu.org
To: Stefan Hajnoczi <stefanha@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::332
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, John Snow <jsnow@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 7 Nov 2019 at 09:29, Stefan Hajnoczi <stefanha@gmail.com> wrote:
>
> On Wed, Nov 6, 2019 at 5:21 PM Stefan Hajnoczi <stefanha@redhat.com> wrote:
> > Hi,
> > You can now access the latest QEMU HTML documentation built from
> > qemu.git/master nightly at:
> >
> >   https://wiki.qemu.org/docs/qemu-doc.html
> >   https://wiki.qemu.org/docs/qemu-qmp-ref.html
> >   https://wiki.qemu.org/docs/qemu-ga-ref.html
> >   ...as well as interop/ and specs/
> >
> > Feel free to link to the documentation from the QEMU website and/or
> > wiki!
> >
> > The container image that builds the docs is here:
> >
> >   https://github.com/stefanha/qemu-docs
> >
> > It is hosted on QEMU's Rackspace cloud account.
>
> I forgot to add Markus.
>
> I hope this helps the QEMU documentation effort.  I currently do not
> have plans to work on this further.  You are welcome to send pull
> requests to the qemu-docs container image repo or just ask me and I'll
> make changes.

Yep, it's definitely helpful.

One simple thing we could perhaps add is a hand-written
"top level" page which just has links to the various
documentation URLs you list above. (Possibly this should
be done in-tree so the in-tree docs also have a top
level landing page.)

thanks
-- PMM

