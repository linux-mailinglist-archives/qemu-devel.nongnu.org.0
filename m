Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA906358414
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 15:03:26 +0200 (CEST)
Received: from localhost ([::1]:45396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUUJh-0003lC-5m
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 09:03:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lUUHN-0002fX-Fb
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 09:01:01 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:40483)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lUUHL-00062Z-6g
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 09:01:01 -0400
Received: by mail-ej1-x630.google.com with SMTP id n2so2883408ejy.7
 for <qemu-devel@nongnu.org>; Thu, 08 Apr 2021 06:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=NTk+P+OAsqrXTEd8LhBfft1fujtDHhJBJR0zUoXCWoU=;
 b=TSfJZVVgqRc+gpUeRnIsEABdPt0lxqjVNdydbKqBeUkPUHN5no7WWsEJQVDGZJdAMw
 tHR1/jJIZx2055SnPwpg9nnZuD9/30EhCkVnwtDVU+U5ivNRv+SEGL180b3k5yav+6RB
 yR8r896paL6lpDXgynhrzctBca2OYYFqRnX544cwtLHtgZa5UXdYys6vus1FsffOZ/jE
 SYZLJjtph6y+S0NnapouiOCZ5B7JQFrDGrr0+rQ7eo2SLMm2UZOhTt3FioBPl1/O2ScO
 pyTZJXeEDPtek8DaDNbl87as2BXyfhBw0dPkr6tp/6rJaNuqNThfEVnzW/Q9pmXlunTP
 kJ/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=NTk+P+OAsqrXTEd8LhBfft1fujtDHhJBJR0zUoXCWoU=;
 b=h20aQFE2KMmUcQ+kiQfqPu7CQuwLclnfdVJnit2+V4TJOZfoPJ9+PFifJqaGiSSBii
 Ho2GED6jl6MGWn1h3r7vxSknsISc2TKJ4Rfnr/F/xlx8xIMI2bhXVBAY5jiYDGBn63Ce
 nExxOGx/CEzINWiUFgwShw78Kyep0oXjaGkkte9GsfxcfEY9kpuH+IyZhG4cvl4vUU8Q
 RXjPyYm8sqqh7LOIpVlZsJAdGt+k/W6ZoPH9dFQ188ujj7pPVkapU9gxqKaQgn4v3WL1
 tk5bR7pYuhaOadfIhxajUJEvLda48smTkxKo0hlcG6GDvHVWKnIqJXSYKb1WnAXel6Kg
 cVfg==
X-Gm-Message-State: AOAM532OYtCmTYGDjUsXzCysDz8bUKXj6/zaaYlEGvwKOjHZcte4eowp
 UClUdB6EdeZS2iqdaTFcNBpI0dLmibK5PsFg++5CjQ==
X-Google-Smtp-Source: ABdhPJw9BcrVNJSpxZlY1sQVobLDAiaMz5wsaD+gqZl9lUf4aKPdlrYgRdfCv/ZC7nI8CZj2YQyNKWtymjQIXBjp3+M=
X-Received: by 2002:a17:907:629e:: with SMTP id
 nd30mr10226625ejc.407.1617886856959; 
 Thu, 08 Apr 2021 06:00:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210406150041.28753-1-alex.bennee@linaro.org>
 <CAFEAcA9c24M3NA8LzbDEUU==Y51LwRH5nR9bopiFNwQTwoE7cg@mail.gmail.com>
 <87czv6uhtr.fsf@linaro.org>
 <CAFEAcA_6AEcUkpZY3d602OXybnH1iVM+8pQuktUWkScd02W4Kw@mail.gmail.com>
 <87a6qauebg.fsf@linaro.org>
In-Reply-To: <87a6qauebg.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 8 Apr 2021 13:00:16 +0000
Message-ID: <CAFEAcA8eG=jaiT-XntEMEcAjooLP3TNdxYKFtpe9tSQ0rsZ9Fg@mail.gmail.com>
Subject: Re: [PULL 00/11] rc2 fixes (check-tcg, gitlab, gdbstub)
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 7 Apr 2021 at 19:42, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > On Wed, 7 Apr 2021 at 18:26, Alex Benn=C3=A9e <alex.bennee@linaro.org> =
wrote:
> >>
> >>
> >> Peter Maydell <peter.maydell@linaro.org> writes:
> >>
> >> > On Tue, 6 Apr 2021 at 16:00, Alex Benn=C3=A9e <alex.bennee@linaro.or=
g> wrote:
> >> >>
> >> >> The following changes since commit 109918d24a3bb9ed3d05beb34ea4ac6b=
e443c138:
> >> >>
> >> >>   Merge remote-tracking branch 'remotes/nvme/tags/nvme-fixes-for-6.=
0-pull-request' into staging (2021-04-05 22:15:38 +0100)
> >> >>
> >> >> are available in the Git repository at:
> >> >>
> >> >>   https://github.com/stsquad/qemu.git tags/pull-6.0-rc2-fixes-06042=
1-1
> >> >>
> >> >> for you to fetch changes up to a2e5bbf0c407a572d9b687adaecf9995f66b=
4cd9:
> >> >>
> >> >>   gitlab-ci.yml: Test the dtrace backend in one of the jobs (2021-0=
4-06 15:04:50 +0100)
> >> >>
> >> >> ----------------------------------------------------------------
> >> >> Testing updates:
> >> >>
> >> >>   - fix x86_64 cross compilers
> >> >>   - don't use registry for non-x86 containers
> >> >>   - add valid host types for given cross compile containers
> >> >>   - clean up i386 code16 test with explicit -no-pie
> >> >>   - relax sha1.py gdbstub test
> >> >>   - add more gdbstub documentation
> >> >>   - remove annoying warning on gitlab
> >> >>   - test dtrace backend in gitlab
> >> >>
> >> >> ----------------------------------------------------------------
> >> >
> >> > The merge for this failed in gitlab CI with a weird state:
> >> >
> >> > https://gitlab.com/qemu-project/qemu/-/pipelines/282228325
> >> >
> >> >  * marked "failed"
> >> >  * but has a "cancel" button
> >> >  * has no "retry" button
> >> >  * has an "error" tag whose hover-over text reads "Pipeline job acti=
vity
> >> >    limit exceeded!"
> >> >
> >> > Not being sure whether this is gitlab CI being flaky again or a prob=
lem
> >> > with something in the pullreq, I've not applied it for rc2; we can
> >> > figure out what happened and maybe try again for rc3.
> >>
> >> I think it's GitLab going nuts because:
> >>
> >>   https://gitlab.com/stsquad/qemu/-/pipelines/282304522 is all green
> >>   https://gitlab.com/stsquad/qemu/-/pipelines/282619235 is a dumpster =
fire
> >>
> >> And they are both the same commit (pull-6.0-rc2-fixes-070421-2)
> >
> > Should I retry a merge of this pullreq (which is -1), or are you going =
to
> > submit a new one ?
>
> I think either is good, the -2 tag was simply a re-base and has at least
> one clean run before everything went weird.

Yep, it seemed happier on a second run so I've merged this (using the -1
tag; -2 isn't a signed tag).


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

