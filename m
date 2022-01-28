Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F07C649EF31
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 01:24:53 +0100 (CET)
Received: from localhost ([::1]:43512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDF4O-0002jB-MC
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 19:24:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nDF3A-0001na-QS
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 19:23:36 -0500
Received: from [2607:f8b0:4864:20::535] (port=33298
 helo=mail-pg1-x535.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nDF39-0000y0-7N
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 19:23:36 -0500
Received: by mail-pg1-x535.google.com with SMTP id 133so3834057pgb.0
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 16:23:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=C99+ekTc2ipgBM6O7viaFddYMz+dvpwOInod9Bx8RvM=;
 b=uDIWq0DCPCgkNmgY6vRlnJE6iOwffau6Gwemef2ZPP30LXSBqMSpvVeGVz725NwLss
 /PYhCp631okHRznMlUjkOndg6UXvbgokyHKcVhVslGM6OBCLhm74KEZs+xY7lYqtbxdk
 cZjFM8KGmjIRSIyAIuQtnc1YRIW/avPWTP+45YAq/bWHTsFytACs2zBfV6n/LKBE0gsq
 AtkiCe8M4OFUJh9yo1U9IA4mSfzFMUPMxnSBokNezNMbXj6sgkvMiqfJ9/x1fMgZ92/l
 Z7i2RcQafvLnP9JvnchgXRjgqHzejYeylBLxhSTarUf571YEKbSNEVhVF9v066J6u+vv
 9q4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=C99+ekTc2ipgBM6O7viaFddYMz+dvpwOInod9Bx8RvM=;
 b=i038hqV0K3U/Aaw/026SK24ryq0tvC+v7/fr2a4jBu94y2+BxUUyos4fmJ/Le82aI9
 1oUXes107uyGhl8XtMKQ360yYk2Jq2oKVXwMgW5Rv+ZOZOb2ccD83c3mUTBWLoC+5taM
 4ulwrSGdckrLgimPnKx+17y2gk7i7W093QLkRPXF8ToQa8DnM+4+HvibMHkEzfHXl376
 FLph7MyJ2ueJ1QX9cymTXRsSiMMg6nc7o2Ng+IDtuh/pFw+47MglBH4F8P8llDxwNNNP
 9/zzneKK/PjSLHaOFBCYgdo5tvGPcW53gECTibHnTOT5ILl0m6Sxvqp1422r2LJrhQzo
 LUMA==
X-Gm-Message-State: AOAM5322Q/VUg0pINzJob+QCYgH9J0Waza0JN3U2Dz/3JHbyQ2ArNEyF
 Lrs2C5CeUn1see+Ihx93dZ/aVw==
X-Google-Smtp-Source: ABdhPJwSzwtka9mHHrEdvbCYEcNFIf0onx6oR08y3fUQPOPdi0pBZO6g6WJUOK00fD38mzgpWHZbig==
X-Received: by 2002:a05:6a00:16c1:: with SMTP id
 l1mr5697114pfc.52.1643329413653; 
 Thu, 27 Jan 2022 16:23:33 -0800 (PST)
Received: from [192.168.15.44] (alanje.lnk.telstra.net. [120.151.179.201])
 by smtp.gmail.com with ESMTPSA id 16sm3872351pfl.99.2022.01.27.16.23.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Jan 2022 16:23:33 -0800 (PST)
Message-ID: <e49aaa62-5c98-c930-c6d3-eaaf0f7d492e@linaro.org>
Date: Fri, 28 Jan 2022 11:23:28 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] target/arm: Use correct entrypoint for SVC taken from Hyp
 to Hyp
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220117131953.3936137-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220117131953.3936137-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::535
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/18/22 00:19, Peter Maydell wrote:
> The exception caused by an SVC instruction may be taken to AArch32
> Hyp mode for two reasons:
>   * HCR.TGE indicates that exceptions from EL0 should trap to EL2
>   * we were already in Hyp mode
> 
> The entrypoint in the vector table to be used differs in these two
> cases: for an exception routed to Hyp mode from EL0, we enter at the
> common 0x14 "hyp trap" entrypoint.  For SVC from Hyp mode to Hyp
> mode, we enter at the 0x08 (svc/hvc trap) entrypoint.
> In the v8A Arm ARM pseudocode this is done in AArch32.TakeSVCException.
> 
> QEMU incorrectly routed both of these exceptions to the 0x14
> entrypoint.  Correct the entrypoint for SVC from Hyp to Hyp by making
> use of the existing logic which handles "normal entrypoint for
> Hyp-to-Hyp, otherwise 0x14" for traps like UNDEF and data/prefetch
> aborts (reproduced here since it's outside the visible context
> in the diff for this commit):
> 
>      if (arm_current_el(env) != 2 && addr < 0x14) {
>          addr = 0x14;
>      }
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

