Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 500EE6A7238
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 18:40:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXQQI-0007rm-SG; Wed, 01 Mar 2023 12:39:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pXQQG-0007rb-Tz
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 12:39:24 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pXQQF-0006cV-7Z
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 12:39:24 -0500
Received: by mail-pj1-x102f.google.com with SMTP id
 q31-20020a17090a17a200b0023750b69614so13713602pja.5
 for <qemu-devel@nongnu.org>; Wed, 01 Mar 2023 09:39:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677692361;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=60eKnjX/1QrkJBBU5LjoqTvX58ofLfaneqSq91dWYGI=;
 b=BXke6EIgyKVDOyySXg/C2FYIEuHPm14eRBkMdu0pkB7D0SJ9aDpTY7kTBIs26AAnB1
 ZZeYp2865ffgunWyKtXWG1wW3tPBjJ1tO2e/g3b6ovoQSpxDJhuP6aVvw1U+9ynP68nB
 0UzEWmVKzqnYU9HxCQ5LIPdlahCd9smKFWbP96QjTyGxwJY2sYYCcapZZmtzCgoh19If
 zVlgNZPlnTIcTop+vNtknloX3uzitxo9pTmI/mvEJTIM9tm0YkEo3V0ZdvtnfWoz76C3
 d+AiwXklpds0sqtaoETKXrsxa2IqukFvI3pknhS4UHvYLxOw8qErYqQOmjxayxyFYax+
 IX0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677692361;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=60eKnjX/1QrkJBBU5LjoqTvX58ofLfaneqSq91dWYGI=;
 b=IJojKYy8BDNboPxzFfIZv/6gBvV3UcqLwshjRqtkwyROK/qArLX4ZEELMLg+NPJ7TI
 m5d5YU6ZV7EwkYZKFI2yyb1has/bs1rAo4a0R569dD0hOy2WvF3GU5AGoj//ngS1TEtt
 E8ss8V1ZfgYXGx2KXZ4kR//c7HedAWr1ndECpTofYschtNeTEmmiJbygs/IWxfUF4hVm
 zStGg0ZfYf2VfJz2fnzt/w3+eqNEMP+zo/vIvieWEmnXaQSMvai4PptBst3QQMn0aNie
 S0+kvyPE6aNoCl8wqWB7K9t34Ek+FEMinR3aGOqvSiVyIjR4bdfQAhcMi2za62r97uCd
 fF+g==
X-Gm-Message-State: AO0yUKV5/YV/xp/zEQ1bavrhywFTSyvQoqEWRF3tW85HRDArkxR/qhmn
 bPXAKGnfPwbu4wTK7iXxGJUOcXfAyUIb5g5G2Hj99Q==
X-Google-Smtp-Source: AK7set8DsOsmRffFWEhtSDrMneggQuaOX9kSoLGtE9lm1lBnEJl0vT/E6weDWYZUh2+MIBYB4mwu4zS9ymW575xlUp0=
X-Received: by 2002:a17:903:2490:b0:19b:8cbb:30fe with SMTP id
 p16-20020a170903249000b0019b8cbb30femr2596340plw.13.1677692361117; Wed, 01
 Mar 2023 09:39:21 -0800 (PST)
MIME-Version: 1.0
References: <20230301151604.1948813-1-alex.bennee@linaro.org>
In-Reply-To: <20230301151604.1948813-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 1 Mar 2023 17:39:09 +0000
Message-ID: <CAFEAcA_ok_VSAWk2uqhTs5sF2y3C_JmBNkb8HUGMX6ZX-xdVoA@mail.gmail.com>
Subject: Re: [PULL v2 00/24] testing updates (gitlab, cirrus, docker, avocado,
 windows)
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102f.google.com
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

On Wed, 1 Mar 2023 at 15:16, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
> The following changes since commit 627634031092e1514f363fd8659a579398de0f=
0e:
>
>   Merge tag 'buildsys-qom-qdev-ui-20230227' of https://github.com/philmd/=
qemu into staging (2023-02-28 15:09:18 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/stsquad/qemu.git tags/pull-testing-next-010323-1
>
> for you to fetch changes up to c0c8687ef0fd990db8db1655a8a6c5a5e35dd4bb:
>
>   tests/avocado: disable BootLinuxPPC64 test in CI (2023-03-01 12:51:01 +=
0000)
>
> ----------------------------------------------------------------
> testing updates:
>
>   - ensure socat available for tests
>   - skip socat tests for MacOS
>   - properly clean up fifos after use
>   - make fp-test less chatty
>   - store test artefacts on Cirrus
>   - control custom runners with QEMU_CI knobs
>   - disable benchmark runs under tsan build
>   - update ubuntu 2004 to 2204
>   - skip nios2 kernel replay test
>   - add tuxrun baselines to avocado
>   - binary build of tricore tools
>   - export test results on cross builds
>   - improve windows builds
>   - ensure we properly print TAP headers
>   - migrate away from docker.py for building containers
>   - be more efficient in our handling of build artefacts between stages
>   - enable ztsd in containers so we can run tux_baselines
>   - disable heavyweight PPC64 Boot Linux test in CI

This still won't merge:

e104462:jammy:qemu-for-merges$ apply-pullreq
https://gitlab.com/stsquad/qemu.git tags/pull-testing-next-010323-1
Switched to branch 'master'
Your branch is up-to-date with 'origin/master'.
Already up-to-date.
Switched to branch 'staging'
fetching from remote https://gitlab.com/stsquad/qemu.git
tags/pull-testing-next-010323-1
remote: Enumerating objects: 288, done.
remote: Counting objects: 100% (288/288), done.
remote: Compressing objects: 100% (135/135), done.
remote: Total 221 (delta 182), reused 114 (delta 84), pack-reused 0
Receiving objects: 100% (221/221), 43.20 KiB | 3.08 MiB/s, done.
Resolving deltas: 100% (182/182), completed with 57 local objects.
From https://gitlab.com/stsquad/qemu
 * tag                       pull-testing-next-010323-1 -> FETCH_HEAD
Fetching submodule tests/fp/berkeley-testfloat-3
fatal: unable to connect to github.com:
github.com[0: 140.82.121.3]: errno=3DConnection timed out

fatal: unable to connect to github.com:
github.com[0: 140.82.114.4]: errno=3DConnection timed out

Errors during submodule fetch:
        tests/fp/berkeley-testfloat-3
        tests/fp/berkeley-testfloat-3

(The script is doing 'git fetch  https://gitlab.com/stsquad/qemu.git
tags/pull-testing-next-010323-1')

thanks
-- PMM

