Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D2FB6A972D
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 13:22:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY4PG-0007h4-Cx; Fri, 03 Mar 2023 07:21:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pY4PD-0007fv-Nk
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 07:20:59 -0500
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pY4PB-0007A6-96
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 07:20:59 -0500
Received: by mail-pf1-x42a.google.com with SMTP id c4so1451540pfl.0
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 04:20:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677846055;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Vi14a4GHC/3FMMXxejIM2uaZ3YtMhaDDVhpO89nDews=;
 b=qX40O0Xos+EyYqkWQGrV/cI6gFbKkaDjX+1FUAwwbul7ZXhpQNgo1IP3GpKbb1fDZh
 P19GnuliLa54bADGzcZQStQXxP+TGLO6v4U7+zoP0D8K5NQDuviVZTezwkXLOP8dzPhC
 UbFkbZPiR6quujHXK4eaMFIdcX4dJ1AYJ8ByWP8rnWD5lqeW5h15d5b+UetWDWvdWa8L
 LL0xA2LOom4zNr1BI3M9KvbYwrRsLIpQ5OxUH64njrXcl0uhblBvBeLkCSeaFbL5gAzy
 WkL1c1leWu3nBc5jrGWCnDnZiRAbcQEFqEbse7g+X7iAo+Ddzr201w6Uj7qB9DUUVidK
 QlUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677846055;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Vi14a4GHC/3FMMXxejIM2uaZ3YtMhaDDVhpO89nDews=;
 b=k105bHp0ZsUByTOYlhaasQIQ+IP0iT3TQCJyQgfGfHCMObF4khU2X0TctkZEyKYsSV
 +ojfF9E5g6FX+/KOP7xTnthVzlyGYEOiP9B5+PZoREkSipOxYEhI4GGcUV9+zrq/yuUW
 SQPcJ+CF7oYS1NQPABX76RXHEbuIs4CmBGwg+m3zkgEYMXRyZ/K0kDzzzXKzw+zcA6fp
 wA7uOipN5avf+24qGBX/GsvoAFtE7e/GTVWCXoCRSaUHNq6gAOKJWKFST3251b6g79O6
 vlbbKSOlg9tLOZRPPs7M8KOTPD/pUhJzSvRvdAY4yxXhVtPwD3QcHvjaACRkOybFP4sF
 +CGA==
X-Gm-Message-State: AO0yUKU9/sPS/IEuUGKdDKeKrzOGX1guv0orzvgQz+Orh2hdarvDct+Z
 YwPez6/Uh/4iTVvUnLvOz6ZDISLW2Hgj/Yv+TCJs9g==
X-Google-Smtp-Source: AK7set9eZkfYvdCvyP1Xi7GMKWKfvpq+cRodnlWGhz72luAptL8+XCZ2GnWfTBhEqTvfwzQmrXYmrTXlXZWCR0YF9uc=
X-Received: by 2002:a63:5508:0:b0:502:fd71:d58c with SMTP id
 j8-20020a635508000000b00502fd71d58cmr466425pgb.9.1677846055343; Fri, 03 Mar
 2023 04:20:55 -0800 (PST)
MIME-Version: 1.0
References: <20230303083740.12817-1-palmer@rivosinc.com>
In-Reply-To: <20230303083740.12817-1-palmer@rivosinc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2023 12:20:44 +0000
Message-ID: <CAFEAcA-ZrqJnZHHNdtqS-dy0zGHbNWiGmagX=cO+5Q3u94M8JA@mail.gmail.com>
Subject: Re: [PULL 00/59] Fifth RISC-V PR for QEMU 8.0
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Fri, 3 Mar 2023 at 08:41, Palmer Dabbelt <palmer@rivosinc.com> wrote:
>
> merged tag 'buildsys-qom-qdev-ui-20230227'
> The following changes since commit 627634031092e1514f363fd8659a579398de0f0e:
>
>   Merge tag 'buildsys-qom-qdev-ui-20230227' of https://github.com/philmd/qemu into staging (2023-02-28 15:09:18 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/palmer-dabbelt/qemu.git tags/pull-riscv-to-apply-20230303
>
> for you to fetch changes up to 37151032989ecf6e7ce8b65bc7bcb400d0318b2c:
>
>   Merge patch series "target/riscv: some vector_helper.c cleanups" (2023-03-01 18:09:48 -0800)
>
> ----------------------------------------------------------------
> Fifth RISC-V PR for QEMU 8.0
>
> * Experimantal support for writable misa.
> * Support for Svadu extension.
> * Support for the Zicond extension.
> * Fixes to gdbstub, CSR accesses, dependencies between the various
>   floating-point exceptions, and XTheadMemPair.
> * Many cleanups.
>
> ----------------------------------------------------------------
> There's a lot of cleanups here, a handful of which ended up stepping on
> each other and were necessary for various features.  I tried to keep
> each individual patch set intact, but that led to some merge conflicts
> and a bit of a clunky history -- I'm not sure what the right answer is
> there, happy to re-spin this to be more linear if that's problem for
> folks.

It looks like in this case you got lucky, but in general I don't
recommend including merge commits in your pull requests, rather
than fixing up patches by rebasing them. If I find that a
pull request has merge conflicts when I try to merge it, I'm
going to kick it back to you to rebase, and then you need to
rebase and fix up the commits in it anyway...

thanks
-- PMM

