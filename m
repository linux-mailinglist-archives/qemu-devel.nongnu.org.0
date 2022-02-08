Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D1A34AE556
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 00:14:02 +0100 (CET)
Received: from localhost ([::1]:38906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHZgO-0000ql-Sx
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 18:14:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nHZXh-0002iV-BN
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 18:05:13 -0500
Received: from [2607:f8b0:4864:20::42d] (port=37507
 helo=mail-pf1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nHZXd-0001dU-Nr
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 18:04:59 -0500
Received: by mail-pf1-x42d.google.com with SMTP id y5so1061612pfe.4
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 15:04:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=+2QaVtLaCvjDJz8xXv39D0/S4x1Ctj2wlvwxH6U6HF0=;
 b=LcfWoj6v1+/3dxorzbLcCqiFhot4wPHhzM1GF7gwJ8T/zOqMcpfbWW0rzV3B6m1Iiq
 wP9p436vfe6GihJedxTYmnUfvZQ3ai4pl+nJXEZRWJ9W0HNR+hr6AzHVBqFuLuju+QSk
 hYRNwCYHcBOMqnwYp5zoxq9CsMjLipKpl1PaRgCttPKP8glw5XkYFzdpi9iJqjfKW273
 yfLMIZcpvXEBAz+0XYpSvsdAnWXA8rqNhojUuPVthURYfTvGIHv00XlImKtz/bP18Iv7
 oPLHkRePNoiqX0EISGw2Ew0YLqAHaDXBZpQZGECicXKw1RqXJAYSi2p5PBR4BVE2QM/k
 NSEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=+2QaVtLaCvjDJz8xXv39D0/S4x1Ctj2wlvwxH6U6HF0=;
 b=709MH+/NROLvqvzVOTe1b0FsvlOHmxX9ZKuH/u4oGo+TGtqiPn9GPWUAOHtf4szOOh
 ebDl/U4Tt8O+DhY9IcjpNb6p8wU8PJo8AT7GxiOpFiFT+zl0e04ans1R6UdOL2y1EyiK
 sygtQSf0vVKytIEAZ0xoRQUxCAhrzAmVAGo9+n8j/sdeZP6e9XIAS/WsgeRkNkTv1Ds4
 cL1TCpux0sbkteA0dfOKMn56V7jp5QuLJKV0yR58sd8Qr7efsb4POQUqM/5sEZQACXHu
 4PTIltifQam/GrpXtuYh9Hz8JGxXXYD4b2uFQbuX36iK+uh4a58voZz9ODl7iIAB9i3s
 RD7w==
X-Gm-Message-State: AOAM5329ux8UM/CR/jclvDPvyEoeTJxrF3cIn1XsAwILa5CtsGqtGYRY
 Viz1FVq+/R/ZeWpAkntj7ziOzQ==
X-Google-Smtp-Source: ABdhPJwIvBEDAvTCQfNFF+hT3iBI78681OB39cxc03VZbWQTTv/J0REh5wjJLoHgk9wNRo2tUEMYCg==
X-Received: by 2002:a05:6a00:1914:: with SMTP id
 y20mr6321760pfi.41.1644361496184; 
 Tue, 08 Feb 2022 15:04:56 -0800 (PST)
Received: from [192.168.1.118] (121-45-127-8.tpgi.com.au. [121.45.127.8])
 by smtp.gmail.com with ESMTPSA id q2sm17870592pfj.94.2022.02.08.15.04.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Feb 2022 15:04:55 -0800 (PST)
Message-ID: <b27d1921-7533-ed1a-0182-8aeb5bf2a126@linaro.org>
Date: Wed, 9 Feb 2022 10:04:51 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 4/5] include: Move qemu_[id]cache_* declarations to new
 qemu/cacheinfo.h
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20220208200856.3558249-1-peter.maydell@linaro.org>
 <20220208200856.3558249-5-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220208200856.3558249-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/9/22 07:08, Peter Maydell wrote:
> The qemu_icache_linesize, qemu_icache_linesize_log,
> qemu_dcache_linesize, and qemu_dcache_linesize_log variables are not
> used in many files.  Move them out of osdep.h to a new
> qemu/cacheinfo.h, and document them.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   include/qemu/cacheinfo.h  | 21 +++++++++++++++++++++
>   include/qemu/osdep.h      |  5 -----
>   accel/tcg/translate-all.c |  1 +
>   plugins/loader.c          |  1 +
>   tcg/region.c              |  1 +
>   tcg/tcg.c                 |  1 +
>   util/atomic64.c           |  1 +
>   util/cacheflush.c         |  1 +
>   util/cacheinfo.c          |  1 +
>   9 files changed, 28 insertions(+), 5 deletions(-)
>   create mode 100644 include/qemu/cacheinfo.h

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

