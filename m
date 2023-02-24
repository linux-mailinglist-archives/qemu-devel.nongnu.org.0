Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DADEA6A1C6B
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 13:48:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVXTi-0004cj-N1; Fri, 24 Feb 2023 07:47:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVXTN-0004at-BO
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 07:46:52 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVXTL-0001wf-7T
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 07:46:48 -0500
Received: by mail-pj1-x1031.google.com with SMTP id
 m3-20020a17090ade0300b00229eec90a7fso6462246pjv.0
 for <qemu-devel@nongnu.org>; Fri, 24 Feb 2023 04:46:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=7yh+U/034B/+WtGP3hZkyzu4rqPqAYgmG6oY046oCX8=;
 b=XZY20N4VonsClcTuo23JkNNQrJ/b1ligS/CP5fUY4+Oj0+KEPCblSJYurKfimQp6Ua
 Uzif1NMYDf7NugUkIm1DurYJcF9Skg6IqaQBNKNKvcKN+wuoLhTVyXFQgA0ITRX0i8NX
 FafklVaTGKbV65V8ulmFcz0fo7URlJ0oekukSj2aFJ0yeo5hh3qK6rbkTAdsAIFW5wah
 ajiYJqdhSIYeb9VnUHYHC8GB0ndj6fGKp2ktR68/FVuGB3L+E/dSZ/NZ7s1WrUyJECBp
 6cwTuCQKV+2H1QnuD1dICSrtK8yzQC/Xt8a4zMETsA2RFlA+c5HRXs0wQx5/cKhN1cZy
 r2mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7yh+U/034B/+WtGP3hZkyzu4rqPqAYgmG6oY046oCX8=;
 b=CynmbZRkEHvPwFWpddno0lV7Rz5VJJ8x9l3X0XbYqxmQUjrr7oYivrlYibmCucn8u0
 n/lrfbMdwRxW3TsPQMegRANzcr7ape8OpIutd8p+Briy/n58WTPig2bKhDqy5EMJElO3
 neAaeoJqFsODr29gw+vghk7GPJvAB2f6BFawmu0RDbFJfEAXgD1K8vfMx2raKnCZDSdE
 y6oFll7CL1di+itFEc6kDSNSKKz2pDB6bIGAHcyf1w0pwyZ3L4IK8g/TzS1YDoJn7i1Y
 44o0yMrF8fmMBbmqxZdVYTjzxwY9zApAbgyNOfJ/bgBuOAWyrB7w1wmn674iuL1ENVjx
 MkHA==
X-Gm-Message-State: AO0yUKXNgB9Dt7PwnERreEAGjly0+p4ZrN+0dDkIe7RikHocKiPFyvAu
 a/SBamWmCpKlEO2dlIiGfA7LUJ/Y1xCNiY3iBgbqgQ==
X-Google-Smtp-Source: AK7set+giBSVM6fCkiCLc0jzBc/LrP32qe3eodIvPAzuk2icFWSKLAmhizg2CiCcw0ckbdtJhXyL1Vkk7RAnFWf2Gbs=
X-Received: by 2002:a17:903:2591:b0:19a:8bc7:d814 with SMTP id
 jb17-20020a170903259100b0019a8bc7d814mr2842633plb.13.1677242805262; Fri, 24
 Feb 2023 04:46:45 -0800 (PST)
MIME-Version: 1.0
References: <20230222020023.904232-1-richard.henderson@linaro.org>
In-Reply-To: <20230222020023.904232-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Feb 2023 12:46:34 +0000
Message-ID: <CAFEAcA_=fpkexhW9F9PyMNcVbg5nM_ecOCwH=FvJVq68n7Zm7g@mail.gmail.com>
Subject: Re: [PULL v2 0/8] tcg patch queue
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1031.google.com
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

On Wed, 22 Feb 2023 at 02:00, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The following changes since commit 79b677d658d3d35e1e776826ac4abb28cdce69b8:
>
>   Merge tag 'net-pull-request' of https://github.com/jasowang/qemu into staging (2023-02-21 11:28:31 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20230221
>
> for you to fetch changes up to dbd672c87f19949bb62bfb1fb3a97b9729fd7560:
>
>   sysemu/os-win32: fix setjmp/longjmp on windows-arm64 (2023-02-21 13:45:48 -1000)
>
> ----------------------------------------------------------------
> tcg: Allow first half of insn in ram, and second half in mmio
> linux-user/sparc: SIGILL for unknown trap vectors
> linux-user/microblaze: SIGILL for privileged insns
> linux-user: Fix deadlock while exiting due to signal
> target/microblaze: Add gdbstub xml
> util: Adjust cacheflush for windows-arm64
> include/sysemu/os-win32: Adjust setjmp/longjmp for windows-arm64
>



Applied to target-arm.next, thanks.

-- PMM

