Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 434CB492EC1
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 20:53:50 +0100 (CET)
Received: from localhost ([::1]:57912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9uY8-0001ff-KP
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 14:53:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n9uOF-0007Qs-QG
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 14:43:35 -0500
Received: from [2a00:1450:4864:20::331] (port=42519
 helo=mail-wm1-x331.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n9uOE-0002iA-20
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 14:43:35 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 ay4-20020a05600c1e0400b0034a81a94607so797032wmb.1
 for <qemu-devel@nongnu.org>; Tue, 18 Jan 2022 11:43:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=d9VqfaYuSpjP69ST1cNrYpQdIOnpWztQ8DzRRGgMg9w=;
 b=rVFx8UYBbM47VHFudTPKMHGpjkTtOjqDeTCME0S0bZM0pLXpfvwZraY1b86LDiDO18
 m1COS7Pp8DrOFWyhVZmrbAs0XjsFVIaA+WXU/20+rUldwSx9GGuu+nADuNDvCXiTgT0w
 j4X4lGOCb4bfsDg29dQYlyk2w7BBTbMY1NwJYjQFGrV8/5dKC8Ax1fdIZ9GqKSyu+lDD
 bTB8CLvmtHDJLq/p25PPJYdHJ2iHFAg2rrsLzfwZHpQRqGteMx2QXtSlhw4zyLMdvHTA
 sVkOS9FGIvLYhevZ5l3XuinWO38uTZffFJ+Se/bAFywSQkJoQHxPJm3tqxpKrAvAMJdP
 LxnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=d9VqfaYuSpjP69ST1cNrYpQdIOnpWztQ8DzRRGgMg9w=;
 b=TTmGHO00tiXCHNd6fS1rms8gdWIavPX1qqVfvikgpAEmY9QtZVzcSZJKBod0X1Owkc
 w7nscJ8JJKuSM4okP3HlPLFJ5cTlJaS9Bwbponpq2f0Dcern4G2pJjYcVbT3MBNxddEI
 gVDze4bP5f3nifVZxdB6YOGAfngfuYhSYwJnwNvMn7ynb5nyrBanOLOMuOTAC6AXLNJs
 mULlLcn9cqUoXNlcw5vpIldRqzEA8GLGg4Y8CbptH+bimhHjxQxUKussiLr3NiZOQlwR
 p8VtyvDbE2x8fBWJBiAwuYO3LmmRs2uFhm0+3SSZSkPXgNjVr8HjNAQI8E0AahWMro+E
 aPNw==
X-Gm-Message-State: AOAM5313pqfkqB1BWDnCz2u0kOEt+ZdpwkntRW1cOlpkS3j2guUyrClh
 dyknM5HTwQLjXHla35OowSloZlI5KHiC2JMXtx2gZQ==
X-Google-Smtp-Source: ABdhPJz/GdqHnRFgcKUQotDi6fNy1ytak8A1BasOxhmg18j7mtL/p0H4vl4k6yF1squSzW0I0sZqDSvKxYwwVbZDlBI=
X-Received: by 2002:a5d:6848:: with SMTP id o8mr26015250wrw.2.1642535012726;
 Tue, 18 Jan 2022 11:43:32 -0800 (PST)
MIME-Version: 1.0
References: <20220118120229.196337-1-f4bug@amsat.org>
In-Reply-To: <20220118120229.196337-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 18 Jan 2022 19:43:21 +0000
Message-ID: <CAFEAcA8sY5vN3eqyYVP5tUGjLS=M6K1na8AapfjB2Pfr9r-W9Q@mail.gmail.com>
Subject: Re: [PULL 00/19] Memory API patches for 2022-01-18
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::331
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 18 Jan 2022 at 12:18, Philippe Mathieu-Daud=C3=A9 via
<qemu-devel@nongnu.org> wrote:
>
> The following changes since commit 6621441db50d5bae7e34dbd04bf3c57a27a71b=
32:
>
>   Merge remote-tracking branch 'remotes/mcayland/tags/qemu-openbios-20220=
115' into staging (2022-01-16 20:12:23 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/philmd/qemu.git tags/memory-api-20220118
>
> for you to fetch changes up to 9d696cd50442327fd71ec7309e7b0c6fee693b1d:
>
>   docs/devel: add some clarifying text for aliases (2022-01-18 12:56:29 +=
0100)
>
> ----------------------------------------------------------------
> Memory API patches
>
> - Directly dispatch MemoryRegion alias accesses
> - Remove duplicated Address Space information in 'info mtree'
> - Cleanups around memory_region_is_mapped()
> - Fix incorrect calls of log_global_start/stop()
> - Use dma_addr_t type definition when relevant
> - Let dma_buf_read() / dma_buf_write() propagate MemTxResult
> - Clarify MemoryRegion aliases documentation
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.0
for any user-visible changes.

-- PMM

