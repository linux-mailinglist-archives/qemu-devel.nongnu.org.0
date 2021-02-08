Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E8CC313FF6
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 21:10:03 +0100 (CET)
Received: from localhost ([::1]:39424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9CrB-0004r8-IB
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 15:10:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l96uz-0004SZ-9W
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 08:49:35 -0500
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:38324)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l96ui-0007lO-Md
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 08:49:29 -0500
Received: by mail-ed1-x52b.google.com with SMTP id s11so18150902edd.5
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 05:49:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FqCpWRCKFTIjIvrnhk2aqBk60y7WA/3PAmrs3DYY24U=;
 b=N9TtvdWDEDjLP8c0ZY0rQ5AdJ3m+JcptSPhHUx5sqZTCYnst4tjRgMlyDFTudK/YKz
 WJOF59RBXqUo640cM/G5pY9k+/PBctBJIFKEBK6SEMDmNzzdHHxmpz1Zax8Ld+SR0km9
 p2F/x4KjJuJKwsIlqrtAXiZpa0zRbLJuV3+3W+eD6hBooaBfc41SrQC/jgEcvqxthpXB
 3dHtRc491nuH8aolbH+41k7pRff4cW7wIBg13fGeLnqjx+1TqOBBqAqRZTA6Teke833n
 rB7/imOFoDj9Hxbk0daFH7+Q3IlUZt09DT5t6iGRfw0ar2xS75EhDWaFyGi8pYYH6ZHm
 dBfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FqCpWRCKFTIjIvrnhk2aqBk60y7WA/3PAmrs3DYY24U=;
 b=JlQvbRGhrKlhfZtJ6Sp41zoXswrvGhNy8QhXYC1GRIvfwlfYEZGJthSU6dd+36JF4o
 zURAZb2ttfKSQew42jOzn/pA+CoNF9GrwSX5VEQdfOS9GAfWODqJ3yAEKVC2MxMIEXek
 itxQVs+cRfpfKq48+rRMTspHkg6998PEm6z93m2oHUVWO+ZpbWdP86MbCgAFhooC3FqT
 qfRNbLnGlAsWYav+IVmf7hO4ux2sWft1D2r58/VPx83nVms9sIk6YvvSa54B1SX74fen
 wGXCfGH4BUmVRIL5pc9AtcPdoj2RRSFuYjuOlCVseOsFqJ+DZOSMaTwvDu/WkbzbQEEQ
 5doQ==
X-Gm-Message-State: AOAM532TWH2be1hPNhlIzdZsp+26C7U24DIzCMULzifnsWJCtiCuecba
 HYzmNHBUyOLGDGYcvNskNnv0WYjSGgTd2iFRN/GK7A==
X-Google-Smtp-Source: ABdhPJwuPxokBxnLQxe2HyXShFSLhqIQwuZNTsUs5v7RSdXXLojKGa7VbaZCpSYf7EbxfAu5hYDUf454FDMf5OswCOo=
X-Received: by 2002:a05:6402:5107:: with SMTP id
 m7mr17125673edd.52.1612792143545; 
 Mon, 08 Feb 2021 05:49:03 -0800 (PST)
MIME-Version: 1.0
References: <20210203190010.759771-1-richard.henderson@linaro.org>
 <20210203190010.759771-16-richard.henderson@linaro.org>
In-Reply-To: <20210203190010.759771-16-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Feb 2021 13:48:52 +0000
Message-ID: <CAFEAcA8+oaMWc=poXvvcve8iUKfsg4vNSM9cStPFYWAQa-2KBA@mail.gmail.com>
Subject: Re: [PATCH v5 15/31] exec: Rename guest_{addr,
 range}_valid to *_untagged
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52b.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 3 Feb 2021 at 19:00, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The places that use these are better off using untagged
> addresses, so do not provide a tagged versions.  Rename
> to make it clear about the address type.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/exec/cpu_ldst.h |  4 ++--
>  linux-user/qemu.h       |  4 ++--
>  accel/tcg/user-exec.c   |  9 ++++++---
>  linux-user/mmap.c       | 12 ++++++------
>  linux-user/syscall.c    |  2 +-
>  5 files changed, 17 insertions(+), 14 deletions(-)
>

> @@ -211,13 +212,15 @@ static int probe_access_internal(CPUArchState *env, target_ulong addr,
>          g_assert_not_reached();
>      }
>
> -    if (!guest_addr_valid(addr) || page_check_range(addr, 1, flags) < 0) {
> +    addr = cpu_untagged_addr(env_cpu(env), addr_tagged);

This change isn't part of a simple function-rename and should
presumably be in a different patch?

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

