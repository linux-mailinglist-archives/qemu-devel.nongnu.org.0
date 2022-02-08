Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F23444AE54F
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 00:11:57 +0100 (CET)
Received: from localhost ([::1]:34556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHZeP-00063q-47
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 18:11:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nHZZ5-0003Cx-JG
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 18:06:27 -0500
Received: from [2607:f8b0:4864:20::631] (port=46892
 helo=mail-pl1-x631.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nHZYr-00023J-8U
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 18:06:23 -0500
Received: by mail-pl1-x631.google.com with SMTP id t9so598858plg.13
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 15:06:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=lCE93XlaS0eTILJZd+1h8rKrNe0jHMwX36c58r8slr8=;
 b=u6KDgwup+dCM0vn9xZYmini7kdxq4YrGRLUJX9v9lcZxVk0x/UmqhyicOE0c/33eAk
 FkNL/z/T9CHvXFfzBr3wgK04NHSVIbj1/Q0vusE7GVBsfyTSbBhYal3TH6mbxzJrWEnw
 z3JGxRk8mwWjF8ehF79Ks6dE8e5yqakggd2DfxF2Y1zH72Xb2McNBkXaVpdc5R3JOxvh
 ZXhED34UsytvFJWv9+sJDnFS8OZXRq2ZUKth0SMhZD0S6l6TvW3RmaDp/2XSn7MrvM2U
 s6X7xO37lKyC44exGwyhwjAcHugtT0CXtq/IUUBLEF/WEqT6Vy7gJh7qPo//DhJWW2jT
 +Mcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=lCE93XlaS0eTILJZd+1h8rKrNe0jHMwX36c58r8slr8=;
 b=fAGjw3BMX2M0EHijUr5JaTnghmAJDMHyIJprbAtsuMkiVHREX0un3g6I29O9e6QRzO
 1t74Rdq73/P86uh4hQygf35Qa+4E9fJOXUd6+EQpVrzyx27Xx44epxUBfoSybG7ZzXNE
 /TA9hO7di5E/V70tuaqX+pdpBvs4hj2Vx1iDsJAz4DUrE76wbQdzOY+Sd4zHs5rvjJFn
 kCGjD8tACAtS8M2t5ENPNIiev3iMcgeSstUCzXIweDS5VDd1JSmWJkDlPosVJo/p94Sm
 O6byDzl5vlCe5BMYdksYeEL9Ly5RuTGetKDCLPgHhBoI6k1RNsWhSrzlTOID4oyBvsWX
 yc8A==
X-Gm-Message-State: AOAM532u/46gNSroth2jliwfCIRLE9Y/IhAtSOKkk9jsIjkZt7I9pCLn
 kD+q6EkoZDUaT1+49TEJfx4hgQ==
X-Google-Smtp-Source: ABdhPJw2dswXjVG4UVFpsTi+GvbmPHtowKx9EI3SX7KBZjjYBLydrpNGpeVVPT4DsKMX/1Ysh3ZGhQ==
X-Received: by 2002:a17:90b:4a86:: with SMTP id
 lp6mr280141pjb.152.1644361571674; 
 Tue, 08 Feb 2022 15:06:11 -0800 (PST)
Received: from [192.168.1.118] (121-45-127-8.tpgi.com.au. [121.45.127.8])
 by smtp.gmail.com with ESMTPSA id 132sm4377719pfw.21.2022.02.08.15.06.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Feb 2022 15:06:11 -0800 (PST)
Message-ID: <a04d2aa5-26c1-58cb-3438-03cbcb9b1759@linaro.org>
Date: Wed, 9 Feb 2022 10:06:07 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 5/5] include: Move hardware version declarations to new
 qemu/hw-version.h
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20220208200856.3558249-1-peter.maydell@linaro.org>
 <20220208200856.3558249-6-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220208200856.3558249-6-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::631
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
> The "hardware version" machinery (qemu_set_hw_version(),
> qemu_hw_version(), and the QEMU_HW_VERSION define) is used by fewer
> than 10 files.  Move it out from osdep.h into a new
> qemu/hw-version.h.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   include/qemu/hw-version.h | 27 +++++++++++++++++++++++++++
>   include/qemu/osdep.h      | 16 ----------------
>   hw/arm/nseries.c          |  1 +
>   hw/ide/core.c             |  1 +
>   hw/scsi/megasas.c         |  1 +
>   hw/scsi/scsi-bus.c        |  1 +
>   hw/scsi/scsi-disk.c       |  1 +
>   softmmu/vl.c              |  1 +
>   target/i386/cpu.c         |  1 +
>   target/s390x/cpu_models.c |  1 +
>   util/osdep.c              |  1 +
>   11 files changed, 36 insertions(+), 16 deletions(-)
>   create mode 100644 include/qemu/hw-version.h

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

