Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94CC46A742A
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 20:20:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXRyx-0007pu-V1; Wed, 01 Mar 2023 14:19:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pXRyv-0007pj-OR
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 14:19:17 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pXRyt-0007xu-PF
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 14:19:17 -0500
Received: by mail-pl1-x636.google.com with SMTP id h8so11803532plf.10
 for <qemu-devel@nongnu.org>; Wed, 01 Mar 2023 11:19:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677698354;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V4YOPSozVN8gezMJ/w5PXWx/Dv3QctbGrQjIUwOCOUU=;
 b=m2ntT7LEpfRexHTMJbZ4517FpeV2NBO8dITGJoAxU4yuXl3p7ueHESabaceLStgKiL
 KG1ZCerQ9jt/JGDRuZdeA/rznFGyMJRkmGtg7ZRdHKAV/5k/uqWmT1+YIQAWJ+hisysD
 8CC2/XOwdV0M/N1mT1NX9K0w5JgenKPKV1NUXLf3jFLvMxC4Et5OmKFa68OXQAL7cKW1
 mVbLw4ebQQVlRKnWSv6rgTVoZOW1CAnebXDXRNxWT06J0yyOFHnwAMSv+No7KRQ3yGMo
 oSZ8SeOzKjfArFYvnoVa4wp2hj5tzBca3oOaYBXZJ0g8ht+C2J+jq76cQlqrEo8iZSfI
 Hhyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677698354;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=V4YOPSozVN8gezMJ/w5PXWx/Dv3QctbGrQjIUwOCOUU=;
 b=zx1rfYwwzFbVKYt2XxcV0bYRmZlGyuhL+PttSB9R6WgW1THhfjprxVr1eK1s3ejCbi
 ekcP9XqAdQHPmlymi63sO0nJ5CNdRH4B077xFXuJ4J9dsMKnawV4pyVrlVwoGSFUhOS5
 b7nIsCY55WPFCbIFb66O8AwN7Haq/NkOp1Tjz8scgd92euQR4tPDagJMRd+kVGYODd44
 v7if789ta96OB3xToaao9f/RAZbk+X4z5SlwF/rK6eUkvdMB4GAGQ/UHg5kvN2xVO1Mz
 BNtnMdxtC2JZks5Jlwc37F9t5KJgTbh/gQQfzoiNjnmDUWpqRJup9tNSZ/kUL74fKB8A
 BH5g==
X-Gm-Message-State: AO0yUKWJ8ypE45ZJBWMsGyXjGGI6CaaGk7A6XnzzOhU/xEZPBy5FaYWU
 I+1zCP7FDnD/mQmkNbUKSoxNlyfwP4edBFVNyG6Okw==
X-Google-Smtp-Source: AK7set+vW7fsrzhFnIMABhLZ6Wbzy3EgTzT/FzM6HX5Rgu2E1DActaOEwNpxdaHuLjPGGuazzLjIeY2UFvsEnhhPAFE=
X-Received: by 2002:a17:903:25ca:b0:19a:98ea:5ef1 with SMTP id
 jc10-20020a17090325ca00b0019a98ea5ef1mr2678851plb.13.1677698354285; Wed, 01
 Mar 2023 11:19:14 -0800 (PST)
MIME-Version: 1.0
References: <20230301151604.1948813-1-alex.bennee@linaro.org>
 <CAFEAcA_ok_VSAWk2uqhTs5sF2y3C_JmBNkb8HUGMX6ZX-xdVoA@mail.gmail.com>
 <87356ocp56.fsf@linaro.org>
In-Reply-To: <87356ocp56.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 1 Mar 2023 19:19:02 +0000
Message-ID: <CAFEAcA9X9nQ-6iYqGV9fWWmzDU_SE1ADed6xToOoDmMbvEBkuA@mail.gmail.com>
Subject: Re: [PULL v2 00/24] testing updates (gitlab, cirrus, docker, avocado,
 windows)
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, 1 Mar 2023 at 18:17, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > On Wed, 1 Mar 2023 at 15:16, Alex Benn=C3=A9e <alex.bennee@linaro.org> =
wrote:
> >>
> >> The following changes since commit 627634031092e1514f363fd8659a579398d=
e0f0e:
> >>
> >>   Merge tag 'buildsys-qom-qdev-ui-20230227' of
> >> https://github.com/philmd/qemu into staging (2023-02-28 15:09:18
> >> +0000)
> >>
> >> are available in the Git repository at:
> >>
> >>   https://gitlab.com/stsquad/qemu.git tags/pull-testing-next-010323-1
> >>
> >> for you to fetch changes up to c0c8687ef0fd990db8db1655a8a6c5a5e35dd4b=
b:
> >>
> >>   tests/avocado: disable BootLinuxPPC64 test in CI (2023-03-01 12:51:0=
1 +0000)
> >>
> >> ----------------------------------------------------------------
> >> testing updates:
> >>
> >>   - ensure socat available for tests
> >>   - skip socat tests for MacOS
> >>   - properly clean up fifos after use
> >>   - make fp-test less chatty
> >>   - store test artefacts on Cirrus
> >>   - control custom runners with QEMU_CI knobs
> >>   - disable benchmark runs under tsan build
> >>   - update ubuntu 2004 to 2204
> >>   - skip nios2 kernel replay test
> >>   - add tuxrun baselines to avocado
> >>   - binary build of tricore tools
> >>   - export test results on cross builds
> >>   - improve windows builds
> >>   - ensure we properly print TAP headers
> >>   - migrate away from docker.py for building containers
> >>   - be more efficient in our handling of build artefacts between stage=
s
> >>   - enable ztsd in containers so we can run tux_baselines
> >>   - disable heavyweight PPC64 Boot Linux test in CI
> >
> > This still won't merge:
> >
> > e104462:jammy:qemu-for-merges$ apply-pullreq
> > https://gitlab.com/stsquad/qemu.git tags/pull-testing-next-010323-1
> > Switched to branch 'master'
> > Your branch is up-to-date with 'origin/master'.
> > Already up-to-date.
> > Switched to branch 'staging'
> > fetching from remote https://gitlab.com/stsquad/qemu.git
> > tags/pull-testing-next-010323-1
> > remote: Enumerating objects: 288, done.
> > remote: Counting objects: 100% (288/288), done.
> > remote: Compressing objects: 100% (135/135), done.
> > remote: Total 221 (delta 182), reused 114 (delta 84), pack-reused 0
> > Receiving objects: 100% (221/221), 43.20 KiB | 3.08 MiB/s, done.
> > Resolving deltas: 100% (182/182), completed with 57 local objects.
> > From https://gitlab.com/stsquad/qemu
> >  * tag                       pull-testing-next-010323-1 -> FETCH_HEAD
> > Fetching submodule tests/fp/berkeley-testfloat-3
> > fatal: unable to connect to github.com:
> > github.com[0: 140.82.121.3]: errno=3DConnection timed out
> >
> > fatal: unable to connect to github.com:
> > github.com[0: 140.82.114.4]: errno=3DConnection timed out
> >
> > Errors during submodule fetch:
> >         tests/fp/berkeley-testfloat-3
> >         tests/fp/berkeley-testfloat-3
>
> You'll need to do a fresh checkout or manually fix up the .git/ metadata

What metadata? I don't understand what's going on here...
The .gitmodules I have points at gitlab URLs for the
softfloat and testfloat stuff.

-- PMM

