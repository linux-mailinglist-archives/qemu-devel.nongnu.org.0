Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BDA564FF04
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Dec 2022 14:41:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6tuA-0004eE-Lp; Sun, 18 Dec 2022 08:40:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6tu6-0004dv-HE
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 08:40:34 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6tu4-0006H8-Ss
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 08:40:34 -0500
Received: by mail-ej1-x62b.google.com with SMTP id x22so16023919ejs.11
 for <qemu-devel@nongnu.org>; Sun, 18 Dec 2022 05:40:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7czVO1ng/iMU01uCvCxRiKzbWFJySoS3IrbI77URhE0=;
 b=x2NirvKzkC0fyZEBvT0mC3r8uTzZ9fxHv54RnauSUfm2qSStawnpIjfahoe4VPeMwB
 baDmGIWrp2zYN4rxfCpfD+d3g79CEHfVg4LyCbeEgVUAQ648dddWUwrzE/fft5jK/VD6
 Wenhx5MuSLRYf49HJVRxk+QM9iQb0HnNMI/MmKfWGECbbU6ZeKJqja3y+oeHMRc2waau
 JqNyme6w+0mU0DQqeWewomOp3RDbOoZokhDp013uL6+hTC+SE46M15RE/coMPv3CXT22
 9BR82bExXJ7AJwprRd3YiHc40GuMke/oQ3yD6U9as6RqM4JcDzHxerSfM1UHtueFlMOT
 ZI9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7czVO1ng/iMU01uCvCxRiKzbWFJySoS3IrbI77URhE0=;
 b=LKRdUd7x2pHDO+LcKkD9D8OyefTr1fXpomfP8HGlgeDGwu6LUriA/ApeDTxtK5kh1V
 C8DUCZ/eFujiR+W7gAgGTHacIgy8fhmNTS22KnNjwbBHdieAZMIru813nMaRNAowdw6Y
 t43A4YSIdipxzjITcgGAjcIOGxEMGJS8NjssaoDdQbzzi/KGXSFqh8GEOV91tl9iZ/2c
 RhOr+DIPKl/qitFq7efRJvH2GT9rP76imdDi6xEK/6Fv5TEN1I1B7XtxHv2tc9GPj2to
 +Jp5kTc7O69NU61Y/U0a9Cljl7TaxT23ZcAElxwJ8UxU6031NAqrmoF/NFz7vbyuPyAl
 vs6A==
X-Gm-Message-State: ANoB5pnbDff/ZJTy7lukIwwz7UK/I+GMViPXO8+5gF395wmgvlE1C8hc
 wc1QsagmRsVB0RcYjVPI77Zdkw==
X-Google-Smtp-Source: AA0mqf45+DlfKmsOmk9j2j6RzgiC9qxjaTdjfmxNxO2V6twv4UqXoLYZ0g3t0Iy0VVvWFqCtHKlSow==
X-Received: by 2002:a17:906:1356:b0:7c0:f216:cc14 with SMTP id
 x22-20020a170906135600b007c0f216cc14mr34285683ejb.11.1671370831091; 
 Sun, 18 Dec 2022 05:40:31 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 ia11-20020a170907a06b00b007ae32daf4b9sm3151694ejc.106.2022.12.18.05.40.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Dec 2022 05:40:30 -0800 (PST)
Message-ID: <14f8c737-a324-5b0b-6749-26b00e4c3c4f@linaro.org>
Date: Sun, 18 Dec 2022 14:40:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH] util: remove support for hex numbers with a scaling suffix
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20221218000649.686882-3-pbonzini@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221218000649.686882-3-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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

On 18/12/22 01:06, Paolo Bonzini wrote:
> This was deprecated in 6.0 and can now be removed.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   docs/about/deprecated.rst       |  8 --------
>   docs/about/removed-features.rst |  8 ++++++++
>   tests/unit/test-cutils.c        |  8 ++++++++
>   util/cutils.c                   | 14 +++-----------
>   4 files changed, 19 insertions(+), 19 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


