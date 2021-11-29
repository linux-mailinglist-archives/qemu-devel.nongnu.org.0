Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9857246158F
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 13:55:16 +0100 (CET)
Received: from localhost ([::1]:60896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrgBf-0000Ap-Ny
	for lists+qemu-devel@lfdr.de; Mon, 29 Nov 2021 07:55:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mrgAE-00072U-EL
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 07:53:47 -0500
Received: from [2a00:1450:4864:20::336] (port=44737
 helo=mail-wm1-x336.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mrgAC-0001KN-83
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 07:53:46 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 p27-20020a05600c1d9b00b0033bf8532855so12327243wms.3
 for <qemu-devel@nongnu.org>; Mon, 29 Nov 2021 04:53:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=SmbUNIZmKMjau9qFPgTjaYlaErbQ0gMzerNK67OlJd8=;
 b=JIdsEz7n8X7J/h/jt4UC8KEpvY6wuMqgz43YUtvymItv8heMOOxXtN4oZWTgKvuNXK
 9HQuKrNWbSjkr5wwpsKV9zOVevyU0RYj/3YHIJNm4IjaIrNyB3yfNamZEF2PAG9pTYn4
 eZ/VYNWajOQ878rcT0oKH7vtFhWQXHV6sPwnM9ta+2U9mgVFHhcw4xfGlbWqmKzn5goq
 TBahAGgBD3iVAlfKA3dLZMjQgc3j2CQZl3II5lhVEf2fh+rTckFALVrMBeDD8IFPAKvD
 2NInYgsTu1Zyqo1xEBK2l5Dyaj6Ny8/s12/Bc1fzUXsuxbWHSWTXU+aTaPAT3VNX0Jt5
 0cFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SmbUNIZmKMjau9qFPgTjaYlaErbQ0gMzerNK67OlJd8=;
 b=Ot4FnEQp8zFUXRfzDT+iQnwDPhtL4IRs9NPyQsptwkW0ANaNtTnblmC1OlPnFCm+un
 kcVgePfwrTklM+RJMZc4HnDW+DEQDJNMtDjL/wdshldzOPct3ZBqx+qIPrzdcqGV8U59
 FybVo7n//g1FjbLZ/3ZVKtvX1TNsooMtX1dSUHCltH6QgODpQ/mQhFPJazNSnZPR9AOj
 WfQ3yQLI966Cx6ZK1ALkoWVqNO4WsLOp0H2KKj98gF2P7NVLwXYtCNB5FF8zmBg+5Dpg
 ctVtcYC+zZFVGodxk5KGKceY4GLhTZxOwrwBvzdtZCELWOWIWHrA9JC/MqQgpXzyRkeT
 VBtg==
X-Gm-Message-State: AOAM531ZsUmTsMT6k9fX3knGmz3SBXR0XttG5whUM+Zi2JWf78E+e8GY
 LP/S7a1dYvbHOrmDo2CEFbmnU9hLSqG8JpsEplE=
X-Google-Smtp-Source: ABdhPJybiS8Fx7B5zkeMdGL83usM9/1leBmI8z4XfGv/9Pdq1+aRlC5ShECE42MyEOTby1Z7dBbVdw==
X-Received: by 2002:a1c:5409:: with SMTP id i9mr35078066wmb.146.1638190422752; 
 Mon, 29 Nov 2021 04:53:42 -0800 (PST)
Received: from [192.168.1.147] (149.164.14.37.dynamic.jazztel.es.
 [37.14.164.149])
 by smtp.gmail.com with ESMTPSA id p62sm14532096wmp.10.2021.11.29.04.53.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Nov 2021 04:53:42 -0800 (PST)
Subject: Re: [PULL 0/5] target-arm queue
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20211129103915.1162989-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <41da8594-7ef0-4be5-efb0-9f541ebc6fd0@linaro.org>
Date: Mon, 29 Nov 2021 13:53:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211129103915.1162989-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::336
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.317,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 11/29/21 11:39 AM, Peter Maydell wrote:
> Hi; this is a collection of mostly GIC related patches for rc3.
> The "Update cached state after LPI state changes" fix is important
> and fixes what would otherwise be a regression since we enable the
> ITS by default in the virt board now. The others are not regressions
> but I think are OK for rc3 as they're fairly self contained (and two
> of them are fixes to new-in-6.2 functionality).
> 
> thanks
> -- PMM
> 
> The following changes since commit dd4b0de45965538f19bb40c7ddaaba384a8c613a:
> 
>    Fix version for v6.2.0-rc2 release (2021-11-26 11:58:54 +0100)
> 
> are available in the Git repository at:
> 
>    https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20211129
> 
> for you to fetch changes up to 90feffad2aafe856ed2af75313b2c1669ba671e9:
> 
>    hw/intc/arm_gicv3: fix handling of LPIs in list registers (2021-11-29 10:10:21 +0000)
> 
> ----------------------------------------------------------------
> target-arm queue:
>   * virt: Diagnose attempts to enable MTE or virt when using HVF accelerator
>   * GICv3 ITS: Allow clearing of ITS CTLR Enabled bit
>   * GICv3: Update cached state after LPI state changes
>   * GICv3: Fix handling of LPIs in list registers
> 
> ----------------------------------------------------------------
> Alexander Graf (1):
>        hw/arm/virt: Extend nested and mte checks to hvf
> 
> Peter Maydell (3):
>        hw/intc/arm_gicv3: Update cached state after LPI state changes
>        hw/intc/arm_gicv3: Add new gicv3_intid_is_special() function
>        hw/intc/arm_gicv3: fix handling of LPIs in list registers
> 
> Shashi Mallela (1):
>        hw/intc: cannot clear GICv3 ITS CTLR[Enabled] bit
> 
>   hw/intc/gicv3_internal.h   | 30 ++++++++++++++++++++++++++++++
>   hw/arm/virt.c              | 15 +++++++++------
>   hw/intc/arm_gicv3.c        |  6 ++++--
>   hw/intc/arm_gicv3_cpuif.c  |  9 ++++-----
>   hw/intc/arm_gicv3_its.c    |  7 ++++---
>   hw/intc/arm_gicv3_redist.c | 14 ++++++++++----
>   6 files changed, 61 insertions(+), 20 deletions(-)

Applied, thanks.


r~


