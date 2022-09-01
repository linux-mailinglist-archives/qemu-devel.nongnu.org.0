Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 174CF5A9296
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 10:59:59 +0200 (CEST)
Received: from localhost ([::1]:56810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTg3K-0001NE-52
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 04:59:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oTfNI-0002xZ-E9
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 04:16:32 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:45000)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oTfNG-0007Vg-GZ
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 04:16:32 -0400
Received: by mail-wr1-x433.google.com with SMTP id c7so14601096wrp.11
 for <qemu-devel@nongnu.org>; Thu, 01 Sep 2022 01:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=2IOMsQcEZNbtJsWIAb8pDc8MSk1LKdmIf39w5DMt74E=;
 b=nTOtPjGkWlsaEGyfmeHI9h/hlzcPi/i6daP6OXEns4OmgKrnpsHF6IFMG8Vqf9fbnK
 xliSYiSPB30FFpsmcX6He9b3LMQ3a6GOlwTZ14mU8fiEdpURowkKEBF85Ugd8ua2May5
 WxIeLombGtD9hqFx2GjEWBbBkWJRTvOEwS+DB2L2NNmIVlTlcjeLWuLnB2U8rz+3322U
 8osSQLIZPD+WDkWQjH+7evxrpkyJInuT4fqI0rmLIOdGUi4gEwdcivy8cIp4D3g6ljWh
 0saVM39VRdkm6Hj0SOcnvFuAwlo7F41pOLhODkzA/Wlr0rYH0z922mseqH3C/uaqesGG
 iUfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=2IOMsQcEZNbtJsWIAb8pDc8MSk1LKdmIf39w5DMt74E=;
 b=urVHbWKutCwl1CVVJzXlHQIf8b9Bi1LHzDLxRwiTwwMvSh86NEYugf3aawYvuRVOLh
 Z25qKIa/GDOMHyAtFABcFbYODdB1ncU3qIJxxGy6Wtjfi2H+Ka9k+LMotRfZyz+D5O/n
 R8Qbrqf58dHDxdMyVCfTttvOUVl7i7tJr/GKXtJU2DK00P27AgxxxSHkHkawt8iH2eqD
 o6EDQ1W7cVHjWHhuswhvWRK0ywHQJcAYmCZrrhXRikh/+uX8ETvseA7FcmqDOPlI71Q+
 OiTFGwtDUz2JyM9+GJq1qdlHezkzlXT0EzbxBaeJnxEfQybFdJx1bMI02MZngx71mq2p
 jyBw==
X-Gm-Message-State: ACgBeo3munU56y7eXQencxvejXxgfX8RWymPll1ApMvpidicjCV8N0Km
 v+M1WXo+OFYCoGV771/ChCnsplob85Rg4r4t
X-Google-Smtp-Source: AA6agR4wHdMbJDY/teyVGGcIJIFR37gL6OJ3gksnoCksr1UGksdgU46YaENL3S7jfV4QuO0+9ahFXQ==
X-Received: by 2002:a05:6000:1861:b0:220:68e0:ac7e with SMTP id
 d1-20020a056000186100b0022068e0ac7emr14809069wri.376.1662020188780; 
 Thu, 01 Sep 2022 01:16:28 -0700 (PDT)
Received: from [192.168.45.227] ([87.192.221.83])
 by smtp.gmail.com with ESMTPSA id
 u14-20020adfdd4e000000b0021f131de6aesm14005904wrm.34.2022.09.01.01.16.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Sep 2022 01:16:27 -0700 (PDT)
Message-ID: <2dda03c4-3125-7164-02a3-b9b5894c0c0c@linaro.org>
Date: Thu, 1 Sep 2022 09:16:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 15/23] i386: Destructive vector helpers for AVX
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: paul@nowt.org
References: <20220901074842.57424-1-pbonzini@redhat.com>
 <20220901074842.57424-16-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220901074842.57424-16-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x433.google.com
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

On 9/1/22 08:48, Paolo Bonzini wrote:
> From: Paul Brook<paul@nowt.org>
> 
> These helpers need to take special care to avoid overwriting source values
> before the wole result has been calculated.  Currently they use a dummy
> Reg typed variable to store the result then assign the whole register.
> This will cause 128 bit operations to corrupt the upper half of the register,
> so replace it with explicit temporaries and element assignments.
> 
> Signed-off-by: Paul Brook<paul@nowt.org>
> Message-Id:<20220424220204.2493824-14-paul@nowt.org>
> Signed-off-by: Paolo Bonzini<pbonzini@redhat.com>
> ---
>   target/i386/ops_sse.h | 556 ++++++++++++++++++++----------------------
>   1 file changed, 262 insertions(+), 294 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

