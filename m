Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70D89643DC4
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Dec 2022 08:45:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2SdZ-0007KD-Bv; Tue, 06 Dec 2022 02:45:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p2SdR-0007JN-I0
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 02:45:01 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p2SdO-0007ac-Ru
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 02:45:00 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 k22-20020a05600c1c9600b003d1ee3a6289so487778wms.2
 for <qemu-devel@nongnu.org>; Mon, 05 Dec 2022 23:44:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gEUdqhM9p06Fz7g1DC2vah0yMHou+wkO5PRuaj5Sw8M=;
 b=tw7WauX15wChW6DhRbMozQf93O8PqUJ5wk788aYYzKpmh+SPKYlw02g7Fs+j73e/tF
 GilKCPQjjk+TeGSXYpVwfdU/pMgWAwBuwcMowg4OCXeCLLyVIMPEKLzHYiyxcqSBgQBE
 TAmjyV1MdXmk5P40YTGnsWHm3vVGWVuvHyhApR/S/uKfHG4LcfyT+8GeV/YKBgmdIu/J
 JNeH7+wd26WnzW98gjziX2bP4gc2MRBUN75unrqNc2UEI00B+wblKBhCDVfRbhxABOQu
 ih+AlqkR7LsWMTUNYjEOZDuWA2YWeCM8O80MZjnkknrcq1U7gGzECiL9p+JYaJAEs/Vz
 aj6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gEUdqhM9p06Fz7g1DC2vah0yMHou+wkO5PRuaj5Sw8M=;
 b=QwOQjIBjG2dfFJ6rtvpswWM5ScNz448KoiDQKodK8ydiM4PPFsiQp0dWsKJz9qIyfh
 stz7bCuyd8KzVoELFF6KlIeWbEm9dGG4purfIEPtuVvJnLd/CqyCoGpA3uUVvcsi9TOZ
 ZWe4oO4dS2TGYKBvYmXbW9wL5UuFW2WZ3UE+V1DEUwvHFIl5XlBXXenTOgQK9ejEe32z
 AD+gmeohR3Odx39JmoFAmdDv7t3bKgc2pHfeai58LoSytt3uEd1cteyRb4FkUwnMb8TZ
 GcZMw+IUNctVRET71S6X0TS44kiXBQvdXClVo5zUjlw8vk1vIW/sOk5EfcjUYDIHkuA5
 uwYQ==
X-Gm-Message-State: ANoB5pn7UzpEusl71XudVkz1F7mZNC/vgV7LZQeuQilUClFrrCBI5F1V
 y+LWtLETI2Ej9Nk/JcmswxiLeg==
X-Google-Smtp-Source: AA0mqf4Oiyd92I+eEPrOHjUrtKJSIrc1LhXDxiV/CmiX0uOkjhd+hXycDep3dakvZUGVSsNYfEFMZA==
X-Received: by 2002:a05:600c:5572:b0:3d0:a619:c445 with SMTP id
 ja18-20020a05600c557200b003d0a619c445mr8280000wmb.17.1670312696786; 
 Mon, 05 Dec 2022 23:44:56 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 r17-20020a05600c425100b003cf774c31a0sm21737220wmm.16.2022.12.05.23.44.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Dec 2022 23:44:56 -0800 (PST)
Message-ID: <9909a5ae-02c4-19b6-d930-ad773a1b524c@linaro.org>
Date: Tue, 6 Dec 2022 08:44:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH 18/22] tcg/sparc64: Remove USE_REG_TB
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: r@hev.cc
References: <20221206041715.314209-1-richard.henderson@linaro.org>
 <20221206041715.314209-19-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221206041715.314209-19-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.265,
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

On 6/12/22 05:17, Richard Henderson wrote:
> This is always true for sparc64, so this is dead since 3a5f6805c7ca.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/sparc64/tcg-target.c.inc | 57 ++++++++++++++----------------------
>   1 file changed, 22 insertions(+), 35 deletions(-)

> @@ -1897,7 +1884,7 @@ void tb_target_set_jmp_target(const TranslationBlock *tb, int n,
>       tcg_debug_assert(tb_disp == (int32_t)tb_disp);
>       tcg_debug_assert(br_disp == (int32_t)br_disp);
>   
> -    if (!USE_REG_TB) {
> +    if (0) {
>           qatomic_set((uint32_t *)jmp_rw,
>   		    deposit32(CALL, 0, 30, br_disp >> 2));
>           flush_idcache_range(jmp_rx, jmp_rw, 4);

Why remove in the next patch and not here?

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


