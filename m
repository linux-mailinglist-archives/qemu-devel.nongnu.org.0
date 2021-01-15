Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E03B2F7FDE
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 16:42:40 +0100 (CET)
Received: from localhost ([::1]:56206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0RFH-0003Qj-J8
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 10:42:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l0R4l-0006Ga-Pf
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 10:31:47 -0500
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:36158)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l0R4j-0001PA-OY
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 10:31:47 -0500
Received: by mail-ej1-x631.google.com with SMTP id l9so8133972ejx.3
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 07:31:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=BhRij+EoyIN8UTYptS59mU3NLJWdZ0DssPP3KymxnbM=;
 b=h/I9pV6PjvwoX+sGzJc/JvwQ4rR9dHxo8BbFgeE2XyG/3mYYNzHWv3tmY3EptC8jO/
 g0+ZLXxJhvmGq5rgJ07pQmWKF5FFVc/an1qSOdysWVB6j31aJ+8ujdSywyN+5e/QQZmQ
 mZuA87Dyd/y0Ui+C1SAPjcvdw9o+t1cNKXislGw3AFiO9Pmk1+/967v+b/KNUpfG+Lhh
 RiE+FbTcPuajeZO93j17Hoh0ww8mUHKtadik/IQ7zlq78BlfXRJHLBse/5yew/3GK/Np
 X1itLKVlKHZRKjj30vnbQeCvVm/WSUJUo/IZcWK7i/q4YMzCW5tPzp5Frez7dZLZwQ7X
 XrMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=BhRij+EoyIN8UTYptS59mU3NLJWdZ0DssPP3KymxnbM=;
 b=A7k0AtZc7bn0BCAdaxXgB56iavxXZnAq9N6I1DgI/TgbatNpuByginsEe/+O5NCZDb
 uxl9pGug2rjCAQaYz4LjCIeJlQUc6skEF94ahtereOBeSkEwW6um1tj6AIYmMr7n4Lfb
 JlK8QhrwyKwXFGeZ4jXKen7jk/Ej2BJzJhKpbf1FzWmryR6lyZ9DR8ovOXj82gMs/RYd
 0eKraiJbMkrKFzhe2dLOOgnhmpJWbXDOq+HNg+D80D4YKIocmXfE7sR9wr37qxnrrGn1
 7cvOcf8RZRzOcohJhwbThKllAWzELLV6hLFj6pbK0m+fsM931cjkDegc62RbsTprukTh
 aBDw==
X-Gm-Message-State: AOAM531ZeyVwS2n3FCN5dKdvf7yG5dwkfn/FlPaD1VHQJkHKFtB1ljKH
 4lTKGUSWtwJDIw/gJTIiC0kqCKhRbBctZtcWFopo7A==
X-Google-Smtp-Source: ABdhPJyiA4LZIE06F5WqteXWfz6Lb7ztsbQUMSugp5CE+nBbXDnaIk0R/aHpVAk4EtGG12dax590Q1Yaswc0b2dko7U=
X-Received: by 2002:a17:906:195a:: with SMTP id
 b26mr9023964eje.4.1610724704268; 
 Fri, 15 Jan 2021 07:31:44 -0800 (PST)
MIME-Version: 1.0
References: <20210115130828.23968-1-alex.bennee@linaro.org>
In-Reply-To: <20210115130828.23968-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 15 Jan 2021 15:31:33 +0000
Message-ID: <CAFEAcA9HzF_-HyGZDxLN+2-Ay1rtijqOOh9WJPFS+yyDKLERPg@mail.gmail.com>
Subject: Re: [PULL 00/30] testing, gdbstub and semihosting
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x631.google.com
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

On Fri, 15 Jan 2021 at 13:08, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> The following changes since commit 7c79721606be11b5bc556449e5bcbc331ef686=
7d:
>
>   Merge remote-tracking branch 'remotes/rth-gitlab/tags/pull-tcg-20210113=
' into staging (2021-01-14 09:54:29 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/stsquad/qemu.git tags/pull-testing-and-misc-150121-1
>
> for you to fetch changes up to be846761ca8b5a7e2e7b7108c8c156126b799824:
>
>   semihosting: Implement SYS_ISERROR (2021-01-15 11:12:34 +0000)
>
> ----------------------------------------------------------------
> Testing, gdbstub and semihosting patches:
>
>   - clean-ups to docker images
>   - drop duplicate jobs from shippable
>   - prettier tag generation (+gtags)
>   - generate browsable source tree
>   - more Travis->GitLab migrations
>   - fix checkpatch to deal with commits
>   - gate gdbstub tests on 8.3.1, expand tests
>   - support Xfer:auxv:read gdb packet
>   - better gdbstub cleanup
>   - use GDB's SVE register layout
>   - make arm-compat-semihosting common
>   - add riscv semihosting support
>   - add HEAPINFO, ELAPSED, TICKFREQ, TMPNAM and ISERROR to semihosting

Fails to build, netbsd:

../src/gdbstub.c: In function 'handle_query_xfer_auxv':
../src/gdbstub.c:2258:26: error: 'struct image_info' has no member
named 'saved_auxv'
     saved_auxv =3D ts->info->saved_auxv;
                          ^~
../src/gdbstub.c:2259:24: error: 'struct image_info' has no member
named 'auxv_len'
     auxv_len =3D ts->info->auxv_len;
                        ^~

thanks
-- PMM

