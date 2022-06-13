Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4DD8549E40
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jun 2022 22:00:45 +0200 (CEST)
Received: from localhost ([::1]:58700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0qEu-0001IL-RP
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 16:00:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o0q7g-0008Je-9P
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 15:53:17 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:42765)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o0q7e-0005Uh-C1
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 15:53:15 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 o33-20020a17090a0a2400b001ea806e48c6so6995888pjo.1
 for <qemu-devel@nongnu.org>; Mon, 13 Jun 2022 12:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=6fxpsGfgZBY45h/q+apCu73bbt+Dgri+hDrJh8DWiX8=;
 b=tOrxPgi3nlXw5qdi364gH0Oct7nBhoC5MWizElw0piZRpSWXe5hc69qhykKX1a9gAI
 ap2Ez7IQYYpiFKG9DvDsWRe7FvN8ijn1Mgd+mHBHdiNkW3l+nWwCHgu0JfsFX4m2ztKb
 +wUlNG7aPWsvA2/1AAGuC+C+aChSgwpXXH8vPbFVubg7uQ3vDA0icZr5kJdSTrs2MpvB
 PbyEEETFW8+CpzKv3NhyU8SZluMT98hOjjgaY2EYClYptp6mYfu3OevtiEnhO8TjL3hH
 bumFEVe1z5V0IYqEfS7DM3S52TwYWkplW+PTkXJukHAqnBnlj6mfBYZFJ+peBXdvKOb8
 KCvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6fxpsGfgZBY45h/q+apCu73bbt+Dgri+hDrJh8DWiX8=;
 b=UHNlgGIxel5fbK4ltJVPonqWui3ef8rXBcCpAz46N2oPPjR/Gbzv/LbipMb3RvMTuA
 4TCvaXfykxMjRF7CdWBE1YM+rA1jWoJcqIYywH6LKWg24zjNaY3ha1Y5D1Hg2wSARwtU
 l+2+gj3vVRnQoi5hZkCvAExzLVVOCr0JXtq20JaInXOLTDfyLusXBGq+CpS0pRrmyJQB
 ncipnA3YaLZOuDOCkzZFFESO6q/JBRexPS0opCAL+euobVkTyYw8nj64KaHwUEbj45QV
 cTHWAxnTjsvCp8BHqvT8RjgRC5Xlk2ddDfsLku3Vhspk+XxG+a8obyeH50CSF0lFuaw4
 TucQ==
X-Gm-Message-State: AJIora8Zz0POqkgaO06ffxs2kLlViHsNsQMt4O3FA9F/MEnWB6qgpx/w
 HIuhPWaBH3CTBvzDEn8YAfEzyQ==
X-Google-Smtp-Source: AGRyM1vy7or7D4xHGSpPjl/Zcsxzl/e66nWb0hGfnSzMd2jtRtVz9uu6h99jjoZIGtgv96NFOCUptg==
X-Received: by 2002:a17:90b:1d08:b0:1e3:2a4f:6935 with SMTP id
 on8-20020a17090b1d0800b001e32a4f6935mr406635pjb.174.1655149992504; 
 Mon, 13 Jun 2022 12:53:12 -0700 (PDT)
Received: from [172.21.2.253] ([50.208.55.229])
 by smtp.gmail.com with ESMTPSA id
 w1-20020a62c701000000b0050dc762814asm5759772pfg.36.2022.06.13.12.53.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jun 2022 12:53:12 -0700 (PDT)
Message-ID: <2d92ee55-0204-64f9-63d0-23a9f40b0490@linaro.org>
Date: Mon, 13 Jun 2022 12:53:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 09/11] bsd-user: Implement dup and dup2
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
Cc: jrtc27@FreeBSD.org, def@FreeBSD.org, arrowd@freebsd.org,
 Kyle Evans <kevans@freebsd.org>, Stacey Son <sson@FreeBSD.org>
References: <20220612204851.19914-1-imp@bsdimp.com>
 <20220612204851.19914-10-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220612204851.19914-10-imp@bsdimp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 6/12/22 13:48, Warner Losh wrote:
> Signed-off-by: Stacey Son <sson@FreeBSD.org>
> Signed-off-by: Warner Losh <imp@bsdimp.com>
> ---
>   bsd-user/bsd-file.h           | 14 ++++++++++++++
>   bsd-user/freebsd/os-syscall.c |  8 ++++++++
>   2 files changed, 22 insertions(+)
> 
> diff --git a/bsd-user/bsd-file.h b/bsd-user/bsd-file.h
> index 500d6ba78b9..73263ba482f 100644
> --- a/bsd-user/bsd-file.h
> +++ b/bsd-user/bsd-file.h
> @@ -491,4 +491,18 @@ static abi_long do_bsd___getcwd(abi_long arg1, abi_long arg2)
>       return get_errno(ret);
>   }
>   
> +/* dup(2) */
> +static abi_long do_bsd_dup(abi_long arg1)
> +{
> +
> +    return get_errno(dup(arg1));
> +}
> +
> +/* dup2(2) */
> +static abi_long do_bsd_dup2(abi_long arg1, abi_long arg2)
> +{
> +
> +    return get_errno(dup2(arg1, arg2));
> +}

Extra lines.  Is this some setting in your editor?  Otherwise,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

