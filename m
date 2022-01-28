Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 680B549F1C0
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 04:21:56 +0100 (CET)
Received: from localhost ([::1]:32920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDHpj-0002AG-HA
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 22:21:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nDHno-0000T3-Qb
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 22:19:59 -0500
Received: from [2607:f8b0:4864:20::1035] (port=37589
 helo=mail-pj1-x1035.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nDHnn-0007XL-Cw
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 22:19:56 -0500
Received: by mail-pj1-x1035.google.com with SMTP id
 s2-20020a17090ad48200b001b501977b23so9760031pju.2
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 19:19:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=nYYGRD4KlQQExaYnv0cSY9JPe/ZoE2+j9NoRYASs6bQ=;
 b=EkG3VfafWznH2pAiANaMEb6/f9jIQwbRcgokZfVKv/bicB1iHLTxYe390AhvpQJ/Wo
 YpwazMYg7hC3eMQvK74tGyQ1/Thc4qVU1tQsUoWakxR/Io4tFnSzihySJ/D3jutpe58/
 mGSroMuhtObPDmAcJoxtBDpRNI94SGd0EMbEhX3ZZ9HbqqrldY9IcXFchA32OC70UOPr
 PIMyYE4J4dVZnJUbcWzVz8JKlXvgd1rXCVHKsJl5cWbpyeGZekfogXwmbA+gspyCaf6j
 Iw/BvMYLVrbgolkyaH86WelSEHSc95TzybQiK1d/5TWe7Jje83oi04WcLDz5ptrY+vtY
 k0xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=nYYGRD4KlQQExaYnv0cSY9JPe/ZoE2+j9NoRYASs6bQ=;
 b=CvEJj063sP8bpwlw5uIPOE15NpYgzmFZvGI289IGbv57zduC3ZQArrjSlZhB26ab+x
 1cRAN7bNjQrS1FnS96zmDJ6j6DQyX+xgj5dgn8NKEsbXAgf+2uRaUNSnedHP4EG6E+Mx
 RlrtKtaddVg7UDoV57ijmLpy9XY+ReYJfadXBrVFpJWdWruFvq4iibzJpcTLn0qcyw8X
 hOtSxv844hTzai6pXgUfDjzilS0rkU6v9te8Ee5fSXgPAigViwSJJ6P8jwXIEEnnVSYR
 g7QauyKfrOLSd1NyLxy6kC/WdbI9xSdcQgT9OqIEB75hu7wimmw6WODx9IUt/ch3YEkD
 3Yyg==
X-Gm-Message-State: AOAM5308hzU4rQ5chnGNgda+Qn/RoV21XQfRbWpCYWUfo4Gje5+bTV6h
 aOhNUa5b7MV+YYAMVlEYbppKE2tcoJ0gDlmF
X-Google-Smtp-Source: ABdhPJy6h/Zcx1U2yXdjT52Pl5xaEeguAKlskM6+jOPD793YnbMi0p8+HSsFDW2t1DZ++B98qAqilg==
X-Received: by 2002:a17:902:aa84:: with SMTP id
 d4mr6684632plr.137.1643339993991; 
 Thu, 27 Jan 2022 19:19:53 -0800 (PST)
Received: from [192.168.15.44] (alanje.lnk.telstra.net. [120.151.179.201])
 by smtp.gmail.com with ESMTPSA id s6sm20802116pgk.44.2022.01.27.19.19.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Jan 2022 19:19:53 -0800 (PST)
Message-ID: <306460d2-5d1a-6e68-0c13-758cb490bea2@linaro.org>
Date: Fri, 28 Jan 2022 14:19:48 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 09/14] hw/intc/arm_gicv3: Set GICR_CTLR.CES if LPIs are
 supported
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220122182444.724087-1-peter.maydell@linaro.org>
 <20220122182444.724087-10-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220122182444.724087-10-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1035
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/23/22 05:24, Peter Maydell wrote:
> The GICR_CTLR.CES bit is a read-only bit which is set to 1 to indicate
> that the GICR_CTLR.EnableLPIs bit can be written to 0 to disable
> LPIs (as opposed to allowing LPIs to be enabled but not subsequently
> disabled). Our implementation permits this, so advertise it
> by setting CES to 1.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/intc/gicv3_internal.h   | 1 +
>   hw/intc/arm_gicv3_common.c | 4 ++++
>   2 files changed, 5 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

