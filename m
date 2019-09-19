Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E2A6B8011
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Sep 2019 19:35:42 +0200 (CEST)
Received: from localhost ([::1]:47046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iB0LF-0004sM-1S
	for lists+qemu-devel@lfdr.de; Thu, 19 Sep 2019 13:35:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50104)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iB074-0008Ns-Mw
 for qemu-devel@nongnu.org; Thu, 19 Sep 2019 13:21:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iB00j-00075u-3s
 for qemu-devel@nongnu.org; Thu, 19 Sep 2019 13:14:31 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:45120)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iB00i-00075a-TN
 for qemu-devel@nongnu.org; Thu, 19 Sep 2019 13:14:29 -0400
Received: by mail-ot1-x343.google.com with SMTP id 41so3726932oti.12
 for <qemu-devel@nongnu.org>; Thu, 19 Sep 2019 10:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=C7U+Ar7WX+/s1+tZT3Oqehz+ER6Xaapmj57+Z6B/wNk=;
 b=jDzE03QzZ4KSHCVv0gBDW+kTvi66gOOsHbqSqShDZUt2z5tRUX1a5PGBgSUGo7azCF
 T5GSfv1swuRj4uFraCHfXedNCVzbLkI63nh5ZJWhndOv2K1wSdU+MXSPovgbd+E5/rob
 HxisIquUbx+QNv21pLrwGuUvaNZPTQrkSvBkucupH19DNuXLiuGK7p/IYkCYLvExuUm1
 aobQfE6RXI8Iuudz73V8ZMHdxTGO+C1F5o+JxdIH2hiJiKrtplI7FgBQy9WkDCbKjUbE
 CjA++r5KODX/7BuMS0ez6uj6clyu0HYVXDZi7DpZ4/gUttJhfmKLglR76P+mIevxx0Fc
 riqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=C7U+Ar7WX+/s1+tZT3Oqehz+ER6Xaapmj57+Z6B/wNk=;
 b=OQ09BlOcYmrWiLhxHual68dtfbpFVM7C46qk6lRnTgBVku4kJ0b7rrjYZZTkwhZeH5
 mauAN80mJdEAGI+PcBiRpnaXw9X/qH5fALYp65nGqM2vzb46aeZIdf8L+wI7SXj25GqZ
 VjydiUR1PFCpyH/fGXU1LxnTd8YDFYfI407gsX86rzSLgo4E4NPM3jGqcLsOR2Ozgz9g
 /Fwp7jUChTp057BJFsgTS+fmwZoY3/0ZR6AWLtPFrjcBw/hQMFGRYg9zJPECBu0seE05
 48wD6nEmUZUVqJDzGo0gQs3wq9wdz7ZHq/bpuDIHIH6G1uCaFySUmLRUSr6fxT5Y34+F
 FMAw==
X-Gm-Message-State: APjAAAWf3H1YWKksoDe5PouCbI62JHs9ytcVspoN3zEuUJ3w1Ch3DpZ/
 UrkyRjRnBnp3fuKCJS2siNo2J7BtQzX3KtKhRvoJtw==
X-Google-Smtp-Source: APXvYqyqcqMz0pXY33Lq2ajVUibUhDshvafW388h+CaFAplrrSUqWA+Z+Yjtx55pV1/O30KlojHYZd38hPShNf8T2o8=
X-Received: by 2002:a9d:4615:: with SMTP id y21mr602247ote.97.1568913267802;
 Thu, 19 Sep 2019 10:14:27 -0700 (PDT)
MIME-Version: 1.0
References: <20190919155957.12618-1-peter.maydell@linaro.org>
 <87muf0yzvf.fsf@linaro.org>
In-Reply-To: <87muf0yzvf.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Sep 2019 18:14:16 +0100
Message-ID: <CAFEAcA-eLvH2PfZjK_kxykQJT75y6CNzmZzxZg4SNZrekbvNHQ@mail.gmail.com>
Subject: Re: [PATCH] Makefile: Fix in-tree builds when Sphinx is available
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
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

On Thu, 19 Sep 2019 at 18:12, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > In commit 27a296fce9821e we switched the qemu-ga manpage over to
> > being built from Sphinx.  The makefile rules for this were correct
> > for an out-of-tree build, but break for in-tree builds if Sphinx is
> > present and we're trying to build the documentation.
> >
> > Specifically, because Sphinx refuses to build output files into
> > the same directory as its sources, for an in-tree build we tell
> > it to build into a subdirectory docs/built, and set up a makefile
> > variable MANUAL_BUILDDIR indicating where the docs are going.
> > The makefile rule telling Make how to build qemu-ga.8 correctly
> > used this variable, but the lines adding qemu-ga.8 to the list
> > of DOCS to be built and the 'make install' rune did not. The
> > effect was that for an in-tree build we told Make to build
> > 'docs/interop/qemu-ga.8' but did not provide a specific rule for
> > doing so, which caused Make to fall back to the old rules.make
> > rule for building any "%.8" file. Make tried to invoke texi2pod
> > with a bogus command line, resulting in the error:
> >
> >   GEN     docs/interop/qemu-ga.8
> > No filename or title
> > make: *** [rules.mak:394: docs/interop/qemu-ga.8]
> >
> > Fix this by using $(MANUAL_BUILDDIR) when constructing the
> > list of DOCS files we want to build and also in the source
> > file name we install for 'make install'.
> >
> > (Among other things, this broke the Shippable CI builds.)
> >
> > Reported-by: Eric Blake <eblake@redhat.com>
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>
> heh I'd manually rebuilt the patch from your last email. I guess you can
> apply this one directly though and I'll clean-up when I rebase for the PR=
.

Yeah; I plan to apply it directly once it's accumulated some
tested-by/reviewed-by tags.

thanks
-- PMM

