Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41CCD357459
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 20:29:24 +0200 (CEST)
Received: from localhost ([::1]:47626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUCvb-0003DF-38
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 14:29:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lUCuG-0002mX-TV
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 14:28:00 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:38804)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lUCuE-0001XH-VB
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 14:28:00 -0400
Received: by mail-ej1-x62c.google.com with SMTP id r12so29279763ejr.5
 for <qemu-devel@nongnu.org>; Wed, 07 Apr 2021 11:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=V+wydxSYl3zObSAGK5JaMp1SRs/+8b5rTd7m7kpAtys=;
 b=BACtH3Kx3ksmm3MpoX5HTABjG0SIy237Kh2OaeuRmHSo8cJ+ath6hsSfuxZhpj0n1w
 fHUYYu8sg6bticUxT3B+kYxAfUVqEdKlFhYtamL1EUeu4lRYbafBn58xQD2L49NLh6NW
 nw9gRkxUHCA2qZVmrobxoTY1fc5qPtmwCRAELgJD73GZFi0RZ8hFJ0YahoIaAGELeEk0
 5wUlMUsxJ1eaQDyykzU9kdBDkuWhieNmkgyOATmIXjFwATsD+wfhGxL+iaXcmCBz2cyg
 xiE0GggDo9Uj3Uv405xrhuQ0J5RQemXCMUe6z0IDI8nQIUo022hEH0rNQRMGREQNfAfJ
 eesQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=V+wydxSYl3zObSAGK5JaMp1SRs/+8b5rTd7m7kpAtys=;
 b=EOtsxKGoBqNM+dJMJXUfmINR+T//4o+wvFfNbwFKKk2ZUyiYoSnU2JXITm5bd/Y9nm
 iyBNucuPf0Pwxa2kCECP8qSEwWZxaX/XZ+RlnK4cwyTrkwrvOHaf5azB7zkYtkEo0XQT
 9BQdzAbmt/Qu9GsoRm+8fNzxZZs2BH4XwlkLNhzdN82OlRLgi7XrIKFZvqcDNAlccJ2E
 vyusczda+ianuoYmp243xddoNwYt+Mto5zyet+a+nANpqkilUi17HNgggJH9o0KpXYku
 h66jLzXO1+sflSzH6wwk7miMdiqOlvQxVrdhf1nHZjocv0wfFER9Bdk4QvNIK4bjMLn8
 jzvg==
X-Gm-Message-State: AOAM530KVRekR7dTznMe/cyASXxc1imbLgesT/cE9e7ZBrgKwLjEb8Wk
 qcf7g7cRwKX2RoQVX6gLCBDsduRbB1oSidXMbwEcpQ==
X-Google-Smtp-Source: ABdhPJyFOn1W+ETuyvvMaYh6SdTfhGkffvDfU3+GSB5/dTyeDWpP+1bRR7zuC1q3I9mncrUiwZko9enSRVluOwNpl7U=
X-Received: by 2002:a17:906:bd2:: with SMTP id
 y18mr5316078ejg.482.1617820076971; 
 Wed, 07 Apr 2021 11:27:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210406150041.28753-1-alex.bennee@linaro.org>
 <CAFEAcA9c24M3NA8LzbDEUU==Y51LwRH5nR9bopiFNwQTwoE7cg@mail.gmail.com>
 <87czv6uhtr.fsf@linaro.org>
In-Reply-To: <87czv6uhtr.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 7 Apr 2021 18:27:17 +0000
Message-ID: <CAFEAcA_6AEcUkpZY3d602OXybnH1iVM+8pQuktUWkScd02W4Kw@mail.gmail.com>
Subject: Re: [PULL 00/11] rc2 fixes (check-tcg, gitlab, gdbstub)
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
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

On Wed, 7 Apr 2021 at 18:26, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > On Tue, 6 Apr 2021 at 16:00, Alex Benn=C3=A9e <alex.bennee@linaro.org> =
wrote:
> >>
> >> The following changes since commit 109918d24a3bb9ed3d05beb34ea4ac6be44=
3c138:
> >>
> >>   Merge remote-tracking branch 'remotes/nvme/tags/nvme-fixes-for-6.0-p=
ull-request' into staging (2021-04-05 22:15:38 +0100)
> >>
> >> are available in the Git repository at:
> >>
> >>   https://github.com/stsquad/qemu.git tags/pull-6.0-rc2-fixes-060421-1
> >>
> >> for you to fetch changes up to a2e5bbf0c407a572d9b687adaecf9995f66b4cd=
9:
> >>
> >>   gitlab-ci.yml: Test the dtrace backend in one of the jobs (2021-04-0=
6 15:04:50 +0100)
> >>
> >> ----------------------------------------------------------------
> >> Testing updates:
> >>
> >>   - fix x86_64 cross compilers
> >>   - don't use registry for non-x86 containers
> >>   - add valid host types for given cross compile containers
> >>   - clean up i386 code16 test with explicit -no-pie
> >>   - relax sha1.py gdbstub test
> >>   - add more gdbstub documentation
> >>   - remove annoying warning on gitlab
> >>   - test dtrace backend in gitlab
> >>
> >> ----------------------------------------------------------------
> >
> > The merge for this failed in gitlab CI with a weird state:
> >
> > https://gitlab.com/qemu-project/qemu/-/pipelines/282228325
> >
> >  * marked "failed"
> >  * but has a "cancel" button
> >  * has no "retry" button
> >  * has an "error" tag whose hover-over text reads "Pipeline job activit=
y
> >    limit exceeded!"
> >
> > Not being sure whether this is gitlab CI being flaky again or a problem
> > with something in the pullreq, I've not applied it for rc2; we can
> > figure out what happened and maybe try again for rc3.
>
> I think it's GitLab going nuts because:
>
>   https://gitlab.com/stsquad/qemu/-/pipelines/282304522 is all green
>   https://gitlab.com/stsquad/qemu/-/pipelines/282619235 is a dumpster fir=
e
>
> And they are both the same commit (pull-6.0-rc2-fixes-070421-2)

Should I retry a merge of this pullreq (which is -1), or are you going to
submit a new one ?

thanks
-- PMM

