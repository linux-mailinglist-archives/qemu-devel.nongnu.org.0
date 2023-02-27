Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 843F26A4146
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 12:58:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWc9O-00007B-N7; Mon, 27 Feb 2023 06:58:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pWc9F-00006m-UP
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 06:58:31 -0500
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pWc9E-0001Wx-4M
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 06:58:29 -0500
Received: by mail-pg1-x52e.google.com with SMTP id h31so3371789pgl.6
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 03:58:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rDNmIZIHtYv4UMmSdU20SKIB99BoJCQgFZygUF45ecw=;
 b=ZNPaSuKJaX77YHCy/L5FSPARmB3zPgxva+fEk5PBoxLPZD6qlyhcimIWBwJeFGKHQy
 gS+LaxamrCJI+9izbl+6trdNeulNzlBq0EyFtwQwcQby3Erl41nq0q1kO+KdDGu5PbZw
 1hRR14P+TqQfNIJttBOD9MXa+BkcLQJwHPjbU6KDmXPgzQ3Xj+xbE5wywUUkazj93rA2
 UW0xTQO9MIeOPuO5Pb2d0XCBo2oSKsV3/oRYhSa1ydKvpwKXkMXnnbk2dlGzRLUYF7kq
 e1sufq6VuUZWXaLMc5k1jk6ZF8eRS/MRG+pJJsi7R5sZ4BtnumMnzilnVF0k+88wZzi7
 8NpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rDNmIZIHtYv4UMmSdU20SKIB99BoJCQgFZygUF45ecw=;
 b=WPoVONjmS7Gooh70LSZ/+I7WNntVb52jJKqmyaY4dy92BEPgAEkUO/67Iculs1N29V
 xjUotFI8Vx7CbAHLBCe0N29KwpLJCQAGOpP6NORIijDXzjFOuJ/dUq/DZt9PANp7aD+J
 UzrCSRyfKEKwQacDk5BiUDtEFUtF4XtMa7JpZqOqGGQ2buAsIwpB1V6I4FfzWHlEKyO9
 SQbniO8Icdw1dsseZJcGhqAzQCdDCbbeP+ZNa66p3NfzndoB+IzDnJaXxpq8JT/YAG4t
 jMPMxRdCmDIO7nnuO+SqvIA6/UrL99eRIndgq6EbCZFHZ4H9/U06al7gMZG0uZt7nyYB
 3BTg==
X-Gm-Message-State: AO0yUKW8WhxZD/uteW137IVKpa0GrkU6gFwlAwt5U84K6I8PFxyhoypW
 dCv5C4Y8GhMZslCfDJw0KPmvAim4OmwSpe1Y7XDu7Q==
X-Google-Smtp-Source: AK7set/57Oftp8LXpSOBM6D1VbwdYKFXhHdDuCZwK+K/eDkJOrcFieyp/6amqmx1LQvNgHfCEBxlux0D0lf/U7kuuho=
X-Received: by 2002:a63:8c55:0:b0:502:f5c8:a00c with SMTP id
 q21-20020a638c55000000b00502f5c8a00cmr4451393pgn.9.1677499106619; Mon, 27 Feb
 2023 03:58:26 -0800 (PST)
MIME-Version: 1.0
References: <20230223155720.310593-1-alex.bennee@linaro.org>
In-Reply-To: <20230223155720.310593-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 27 Feb 2023 11:58:15 +0000
Message-ID: <CAFEAcA_Up9_180Xb+_2ybuVPfknP7=WTmTAGcZEk5_iP0YH5rw@mail.gmail.com>
Subject: Re: [PULL 00/13] testing updates (gitlab, cirrus, docker, avocado,
 windows)
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52e.google.com
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

On Thu, 23 Feb 2023 at 15:57, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> The following changes since commit 79b677d658d3d35e1e776826ac4abb28cdce69=
b8:
>
>   Merge tag 'net-pull-request' of https://github.com/jasowang/qemu into s=
taging (2023-02-21 11:28:31 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/stsquad/qemu.git tags/pull-testing-next-230223-1
>
> for you to fetch changes up to e9969376f01180d7bcbee25ae8333983da7eda2c:
>
>   cirrus.yml: Improve the windows_msys2_task (2023-02-23 15:48:23 +0000)
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

This hangs when I try to merge it, and eventually times out:

Switched to branch 'master'
Your branch is up-to-date with 'origin/master'.
Already up-to-date.
Switched to branch 'staging'
fetching from remote https://gitlab.com/stsquad/qemu.git
tags/pull-testing-next-230223-1
remote: Enumerating objects: 108, done.
remote: Counting objects: 100% (108/108), done.
remote: Compressing objects: 100% (50/50), done.
remote: Total 108 (delta 59), reused 93 (delta 57), pack-reused 0
Receiving objects: 100% (108/108), 100.58 KiB | 7.74 MiB/s, done.
Resolving deltas: 100% (59/59), completed with 23 local objects.
From https://gitlab.com/stsquad/qemu
 * tag                       pull-testing-next-230223-1 -> FETCH_HEAD
Fetching submodule tests/fp/berkeley-testfloat-3

fatal: unable to connect to github.com:
github.com[0: 140.82.121.3]: errno=3DConnection timed out


I don't understand why anything is trying to fetch from github
in the first place: the URL for the testfloat-3 submodule
is a gitlab one..

-- PMM

