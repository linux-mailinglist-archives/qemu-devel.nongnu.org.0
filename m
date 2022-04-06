Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B264F6012
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Apr 2022 15:39:20 +0200 (CEST)
Received: from localhost ([::1]:49578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nc5sU-00015q-UZ
	for lists+qemu-devel@lfdr.de; Wed, 06 Apr 2022 09:39:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nc5rA-0000Ba-Kt
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 09:37:56 -0400
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832]:44998)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nc5r6-0000Kh-96
 for qemu-devel@nongnu.org; Wed, 06 Apr 2022 09:37:56 -0400
Received: by mail-qt1-x832.google.com with SMTP id 10so4185563qtz.11
 for <qemu-devel@nongnu.org>; Wed, 06 Apr 2022 06:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=8jzSQ4vxrYlxCxwZk3zGR2uLgkq8J+1oFDzmDBJnjxs=;
 b=sQ11Dibeh4wfB0UxwB4XG5+xNMrgOVUMAKQMMGadD2NkgbNrGQRKX9e3Y2IjZ1vz83
 GN+z0fk8DJK+P2VB/9u84EUPfD4bbAtaOzTTXk1iZSxtb1WI/8AyLILDJ3l5ahe7gbmG
 84lLrT6KkdUJwC+qU9EqFPO48vjDCRVFv/pG50/vjsVPIbQOBZABq00CYL3FJ+aaDF9c
 p5rCP/ep8WdmA12wv8fMmJmWKpyrT6cgPgQYm14TeoCLZ2X+TuYbR5rjM66Y0SVFGk9P
 8TX6TMtf+vIxjZg9PZ91Xz44nYCDcR8LZaZkoVCV9rhs3udHxPuvAw6xcEUKvMzYcnN2
 3vaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=8jzSQ4vxrYlxCxwZk3zGR2uLgkq8J+1oFDzmDBJnjxs=;
 b=sba9SkTUsKe/X5lnKIHzubp2n5P9E4h3aG8Eh1HKVe0STOfGh6VASg7DRsZeUMu6xj
 QXsytqTrKNyZOXFUlG2+0OZKZDS/0rJKGv6mpRM8pmD1c78iNoDHj45wiuM4s8ahn8J2
 BtTS7q1CHnhhBG+Vxm64vTzP40cSR8157kVr99UVuMgxETlg+054P2RhTdWdFLzKSCAK
 +oVTO7l2w6yzXk4fOsSvvGT/n70/G24eplQHWpFL8GP4p3xuA2pg26opcc6QfBEHJJ9r
 ybXZMlqhNspcA7Togppncf0Q07QYn8XHaGo8wD0NTeFgAtXsrlIf518YHgoGSFpOD7Sf
 l0/A==
X-Gm-Message-State: AOAM531yZ3/w2c0K6ZZzGLH1eBZuCgCLspfps22lyNqzSAnW8q8aKzV+
 Gn0msJBxq4u3y0fv3EuTpuDphg==
X-Google-Smtp-Source: ABdhPJzjKYhO/sF37qnqqnB2W7BNFbSa1OJKPAQYSMHMDA9nQ83S6c6h+zdt+14JEtTA+NcDCdccAA==
X-Received: by 2002:a37:40d:0:b0:699:f26d:6cac with SMTP id
 13-20020a37040d000000b00699f26d6cacmr994061qke.152.1649252269921; 
 Wed, 06 Apr 2022 06:37:49 -0700 (PDT)
Received: from [10.10.117.62] (fixed-187-188-190-73.totalplay.net.
 [187.188.190.73]) by smtp.gmail.com with ESMTPSA id
 az17-20020a05620a171100b00680af0db559sm10215050qkb.127.2022.04.06.06.37.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Apr 2022 06:37:49 -0700 (PDT)
Message-ID: <2799d1ad-4689-7d63-3fe1-2d7d3f2a3b44@linaro.org>
Date: Wed, 6 Apr 2022 08:37:46 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH for-7.1 01/18] hw/arm/exynos4210: Use TYPE_OR_IRQ instead
 of custom OR-gate device
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220404154658.565020-1-peter.maydell@linaro.org>
 <20220404154658.565020-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220404154658.565020-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::832;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x832.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Zongyuan Li <zongyuan.li@smartx.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/4/22 10:46, Peter Maydell wrote:
> The Exynos4210 SoC device currently uses a custom device
> "exynos4210.irq_gate" to model the OR gate that feeds each CPU's IRQ
> line.  We have a standard TYPE_OR_IRQ device for this now, so use
> that instead.
> 
> (This is a migration compatibility break, but that is OK for this
> machine type.)
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   include/hw/arm/exynos4210.h |  1 +
>   hw/arm/exynos4210.c         | 31 ++++++++++++++++---------------
>   2 files changed, 17 insertions(+), 15 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

