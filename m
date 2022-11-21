Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D926563227C
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Nov 2022 13:42:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ox66h-0003rk-FT; Mon, 21 Nov 2022 07:41:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ox66T-0003ra-FY
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 07:40:49 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ox66R-0002Nh-BS
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 07:40:48 -0500
Received: by mail-wr1-x431.google.com with SMTP id b12so5863534wrn.2
 for <qemu-devel@nongnu.org>; Mon, 21 Nov 2022 04:40:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hin93URd/R/tk65Sv1IyvHFPmWuLFlfqzK8Mzcnnyzg=;
 b=wOXMvrFh3KtxAJVjAhs1qnKUjGNIwCSipBytqJQY9+jzovRnNRaGv5U4Hvh06NDoRc
 p9b5pt24UgZmCefmfr8xGioagROoL9DGjWXf944lZcKzB1XbIPLD4IlRmO2KwdbDhGNU
 75z1aQGESPhpByETC2O62kxm6UyfqYjCI84tpp463etGpwBdykkBW8K2mfMrupKGxSMY
 r0+wDwOjncKm6yuN7LI07N8lDEHx8JWDVFq/4WobmKP2kaz0t1SM/GfiZZ38P1iZIIyH
 5NBTgw9XFycHzXhgBvFtanh1usRfj1qJWSPkuaGnU++kes2vF7K9N1lG6gOfF3/y7F8D
 LzFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hin93URd/R/tk65Sv1IyvHFPmWuLFlfqzK8Mzcnnyzg=;
 b=kH9HgeyTqHiBnbjj+0fjAIrUSLY2y4ft9zO7QZpr8OoTTvcN1yKhr25kLrAOiytlAY
 GlwftUwMAOTb+dQ4BIff2pAsbsemLZdWTBwcmA38Ec34aFWzo0iILWwTUEkzgOsm6cpm
 nrI51J6MQ61RnHMYwEG8mc7mAoe5TiY594e6kh+k3yl8sLSroAX2SFcCBRUG2LejPCsL
 YyFA1OBkB6hiGwb34pENhKqCEOXPBVGnx/ArXnOKjqU2fEdmMBMl562OPCsR5+Xbmg3y
 +UhczZ+hefDuvcdgVZVqzGoqChqp+/pMqY2+kD6D7os8QpEog2ZXf+c/uQ7obGwKjVTD
 zFGQ==
X-Gm-Message-State: ANoB5pm2J0hIEmeFcrSiEFTrJYCmRCcUClIkfwse/4Rb/tSf6rFGOuJ2
 P3FdNU+DSECZBt/aVRFmurxrZQ==
X-Google-Smtp-Source: AA0mqf6kINuFUwE86BeyzCzPKkwxxa+87GtddOCBR9oCcqMoErcnKP62CNni74eayhCn68H7Kj5nCg==
X-Received: by 2002:a05:6000:1107:b0:241:7e9f:8afd with SMTP id
 z7-20020a056000110700b002417e9f8afdmr10423235wrw.228.1669034445503; 
 Mon, 21 Nov 2022 04:40:45 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 n3-20020a05600c4f8300b003d01b84e9b2sm4626481wmq.27.2022.11.21.04.40.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Nov 2022 04:40:44 -0800 (PST)
Message-ID: <29decb5e-1346-56b6-8689-07db8556b755@linaro.org>
Date: Mon, 21 Nov 2022 13:40:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH for-8.0 09/29] tcg/tci: Use cpu_{ld,st}_mmu
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20221118094754.242910-1-richard.henderson@linaro.org>
 <20221118094754.242910-10-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221118094754.242910-10-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 18/11/22 10:47, Richard Henderson wrote:
> Unify the softmmu and the user-only paths by using the
> official memory interface.  Avoid double logging of memory
> operations to plugins by relying on the ones within the
> cpu_*_mmu functions.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/tcg-op.c |   9 +++-
>   tcg/tci.c    | 127 ++++++++-------------------------------------------
>   2 files changed, 26 insertions(+), 110 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


