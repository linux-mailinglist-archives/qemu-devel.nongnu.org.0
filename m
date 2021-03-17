Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D916C33F14E
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 14:39:19 +0100 (CET)
Received: from localhost ([::1]:42596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMWOM-0006It-VX
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 09:39:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lMWNJ-0005od-A6
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 09:38:13 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:43745)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lMWNG-00054l-Hw
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 09:38:13 -0400
Received: by mail-ed1-x536.google.com with SMTP id e7so2279493edu.10
 for <qemu-devel@nongnu.org>; Wed, 17 Mar 2021 06:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=UJPlHFCtzQsZYU65N0OK5xflydwSsRETQd0ZHqkq+Ak=;
 b=guS5FmJ97MJmiBrxc6r0M+n18DD8jb+ae5SFzYUOc4r7wDTtrxKqwOA5v0ooTcwaRH
 I7WdihjqEakqxR8+XM49gOkItHexHkZrI60P72zhFVfaBcd3TBg5JemfXG6dYtTZK1UO
 PP6CCebMvOX5k85tMScpAJfQDIU6fi4fwQUILIGHV1osgtIdsYiNwtjhUmSHtawiKZxd
 1oWLvS5UiNUhnNZ/pzLi0BJmdbws9St4min76jqcZsu5WpP62BfPXr07ycax4cjlBNdn
 3TvL/3oj5cygTyv7FVTFTPlt/hGKznxRyyBsG7zKyA/xhhXRxHh7BQE0EAPn3Z7z3/4x
 0rbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=UJPlHFCtzQsZYU65N0OK5xflydwSsRETQd0ZHqkq+Ak=;
 b=Bj0TVOxZIk+jcAiQiaVEs6Ew6cqorlpTKkorxSWIYCqYimYX+67KNOvNDKKCKqPkn+
 jpnTEYH/clDZ20wN60bzwP/0/dsa6SC2uAy7IV01nyoCSBJrXEc6VpjUkr51rS55Ouf/
 iA3e4NsTthc6PwOJp6SqWKmihxSLZfwK5ZaEXie9yVOJ2oUg8SIE5Nnj9dYh1rLE0Qkj
 rCrQUdigkA5dZiTLBLpWW89EG27xoCrglrRltg7hBGT32c32MAKjcPsQjoBnHvaS1vK5
 Cu3Xk4Si2PevfSyUYPwsJQloJ8BggBG4aYEY8jwhKfFr3BBlVnzgbxvFFEcK8rEYfvTu
 h3nA==
X-Gm-Message-State: AOAM5319veKGvOMrFRY2v/EKYSfYQA2lJybIMH1DMMPrx+ybFKjQCx8R
 IHN6YvI8zIrRAGHzApFteKgZZLp98G2/T3n+0/1UGg==
X-Google-Smtp-Source: ABdhPJw4WE9kTsIjOwitOF4D4u9xC4IloLIi7tRz29OgtTk3A9saX2NIfimByY4wfzswEKhH1QidMxKWhhEywNbyprA=
X-Received: by 2002:aa7:c804:: with SMTP id a4mr41432903edt.251.1615988288839; 
 Wed, 17 Mar 2021 06:38:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210315233527.2988483-1-philmd@redhat.com>
In-Reply-To: <20210315233527.2988483-1-philmd@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 17 Mar 2021 13:37:45 +0000
Message-ID: <CAFEAcA-p+=NGEyydhboCON+qoNcRYFp86N+7KYyDA3cMZJwsFA@mail.gmail.com>
Subject: Re: [PULL 00/11] pflash patches for 2021-03-16
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Qemu-block <qemu-block@nongnu.org>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 15 Mar 2021 at 23:37, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> The following changes since commit 2615a5e433aeb812c300d3a48e1a88e1303e23=
39:
>
>   Merge remote-tracking branch 'remotes/stefanha-gitlab/tags/block-pull-r=
equest' into staging (2021-03-15 19:23:00 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/philmd/qemu.git tags/pflash-20210316
>
> for you to fetch changes up to 3b6a1da064ac6ce5256f1f6f16870ea79c2422d0:
>
>   hw/block/pflash_cfi: Replace DPRINTF with trace events (2021-03-16 00:2=
8:33 +0100)
>
> ----------------------------------------------------------------
> Parallel NOR Flash patches queue
>
> - Code movement to ease maintainability
> - Tracing improvements
> ----------------------------------------------------------------

Fails to build on 32-bit and OSX due to format string issues:

In file included from trace/trace-hw_block.c:5:
/Users/pm215/src/qemu-for-merges/hw/block/trace-events:36:38: error:
format specifies type 'unsigned long' but the argument has type
'uint64_t' (aka 'unsigned long long') [-Werror,-Wformat]
                     , name, offset, len);
                                     ^~~
/Users/pm215/src/qemu-for-merges/hw/block/trace-events:33:121: error:
format specifies type 'unsigned long' but the argument has type
'uint64_t' (aka 'unsigned long long') [-Werror,-Wformat]
            qemu_log("pflash_write_block_erase " "%s: block erase
offset:0x%" PRIx64 " bytes:0x%lx" "\n", name, offset, len);

                        ~~~                      ^~~

                        %llx


thanks
-- PMM

