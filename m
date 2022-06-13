Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82912549E03
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jun 2022 21:47:26 +0200 (CEST)
Received: from localhost ([::1]:34846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0q21-0001hV-3U
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 15:47:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o0pzt-0000rN-GQ
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 15:45:13 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:42571)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o0pzr-0004Oz-HK
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 15:45:13 -0400
Received: by mail-pg1-x52f.google.com with SMTP id d129so6456111pgc.9
 for <qemu-devel@nongnu.org>; Mon, 13 Jun 2022 12:45:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=a1SF1dzLkPOAEITUNcm7ZQHNSNFQZo5Az4ZBl1mzuD4=;
 b=Y+dE9PNBIGBnHGkIOPT3sH5aMzKx1OEBX1dbRAX5GeEj8vqNT3dJD3sjGh3PY3u0O/
 JDRomRhTeQrOB0D6PUnThuhz/FHIiJlmRrf6CKyE8AX3J5rSjAlMZ6o5OnKcNbubBG4R
 jEffR36wPOPwOoHveZtBg4bK/uypi49wPSXPoH6DhZHXKG3fciwChIRFrz0fCP+E+NlL
 UaWJdVU1/Op4oi7tgu7tveDBQtvDh0DxvTTLZwFJ23u9EI7q6NlTSuYvBX5T/f40Gcu5
 0YGxGjz8lCwf4tup45DLzTAooDrFIJCNe/BhNE5aFxTO89V1flLXJ9QR23hTpZhIeSHk
 TwEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=a1SF1dzLkPOAEITUNcm7ZQHNSNFQZo5Az4ZBl1mzuD4=;
 b=bgdiNgATYLNvzAF8k8abPM8q87V/h8GyU7fxa38gvLpghE5QW0gcnXIv66oRyu7Lzv
 QCT0qsJ8+WoX9KjBLGlEs+oUduDgp032NzR8gyHAq0cfRv2bBscWkdkvyKrw+jST9xbz
 Up741UOMPp7SbG8waHuwaZmk6yAYDKUHahmTHLHfbVMUejHyIuHJCcxkX0Ra30cZ9B1l
 0nOwMZg3TxgGa7nB6dIJyaK3CgY2d5o+bmrgpZd0GwXHCOsCzeZIY8CGPnLLLBGIhAIY
 UVSKRSld6sK2g/B/HafPj95NaTah40jRyLw6YCcAuJywstmoeB+tVnIpA+xT703loB36
 HCyQ==
X-Gm-Message-State: AOAM531lV5a3PAPgYVj18Pi8fUWPuu8r2evqfshskf+Z8krzVKOV0JeP
 3RudaTR/5H/5uyT/2EVvzwmpcw==
X-Google-Smtp-Source: ABdhPJwGF+gKv9PbLN2XtM2+R/2RejMxD1X3dyVsqHfjjsckY6FI58fVRBUR4+gJ2HoMKaG09OmJcg==
X-Received: by 2002:a05:6a00:15c6:b0:51c:61bb:a62d with SMTP id
 o6-20020a056a0015c600b0051c61bba62dmr820327pfu.30.1655149509708; 
 Mon, 13 Jun 2022 12:45:09 -0700 (PDT)
Received: from [172.21.2.253] ([50.208.55.229])
 by smtp.gmail.com with ESMTPSA id
 jj1-20020a170903048100b00163247b64bfsm5544650plb.115.2022.06.13.12.45.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jun 2022 12:45:09 -0700 (PDT)
Message-ID: <8ec430f9-d919-8702-a210-37e5590bde27@linaro.org>
Date: Mon, 13 Jun 2022 12:45:06 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 01/11] bsd-user: Implement open, openat and close
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
Cc: jrtc27@FreeBSD.org, def@FreeBSD.org, arrowd@freebsd.org,
 Kyle Evans <kevans@freebsd.org>, Stacey Son <sson@FreeBSD.org>,
 Jung-uk Kim <jkim@FreeBSD.org>
References: <20220612204851.19914-1-imp@bsdimp.com>
 <20220612204851.19914-2-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220612204851.19914-2-imp@bsdimp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
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
> +static inline abi_long do_bsd_close(abi_long arg1)
> +{
> +

Watch the extra linefeed.  Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

