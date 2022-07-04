Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E14D564CEA
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 07:20:44 +0200 (CEST)
Received: from localhost ([::1]:35768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8EVn-00013q-54
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 01:20:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8EQD-0005qc-Iw
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 01:14:57 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:33579)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8EQB-00015W-QT
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 01:14:57 -0400
Received: by mail-pl1-x635.google.com with SMTP id n10so7652430plp.0
 for <qemu-devel@nongnu.org>; Sun, 03 Jul 2022 22:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Z9F9b+7imCc5BC7XC8hO3c2q6qUGr/XSbwhxHTzqmjI=;
 b=oec9Hq5LhZTInzDwYjxWwmAxIBpklnI3bc/UMNfloo9Qs6GZSpeo9t0ffxXgV/+q0I
 tL2BIQWTtxXT4CPERwJJayecfFAVEEDahCbFAnyKVuHQynO08sX8dg6Hlm4ttLc28+uZ
 UmOIBMo/ie85H3Y+Yp3DbV5CZGd2pQxUIZ1EpwaBuWhs7AEnunoegV1vZQtBvOsVGu6q
 xAg9rCu6Eeure4fgx92cVlOjS4bLioe7HrazuF4P3SRai1VpbDUgodDeie5qjwak84M5
 9poveCu5jdCMw54GqaMDZVMwKQD/pKniAnLeUFBa3IIHWALt6Xzo4bqytiuIUIIZNrxA
 kDrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Z9F9b+7imCc5BC7XC8hO3c2q6qUGr/XSbwhxHTzqmjI=;
 b=tr9pOtpY00NRZ7zTd+AICt1moLkt7I2yKDLjkl32OrsnGpj6sYUpjZVM9DcOjfv2wu
 K+P86VeuB1mxJzuu3dMPQrPSF76WwlEtuwUPYOfqIzwvLepODjzLPpriKg/WfuK8VBot
 krHG9p09irK6Zinn+jBJrmxAzmr4GWk9gXscaPTnBJ4+zx10G8vVINpaNg0J8usm4wW3
 VvVxagr5QqRjoX9IKDDgceJwJ9Dab6eYEI+VTGcRS2DePFp2b6AUpgN7pF9dKQUkqMAf
 SgUKM+4jStsfTxGzvbivvec4ECN8A6h76zY1NRtEJh5GWBPqqxmMOmchNZeyTfPhhUKJ
 NBjA==
X-Gm-Message-State: AJIora9+rToj/j5U+KJT2r8a9lWQQsdzDsIbf6pWlAyl6Rm8YaUiA7E/
 bS0ml9QEIBPJGPwRBKM54VBkLg==
X-Google-Smtp-Source: AGRyM1svjzIzPoW8TGqEmXZ3GhN2OLAt3OuT4fk0+s4M/Og0Q/jo1iG3ogCJ9nJIdQV775TCcYNxag==
X-Received: by 2002:a17:902:e38c:b0:16b:e5f2:aeed with SMTP id
 g12-20020a170902e38c00b0016be5f2aeedmr1960915ple.67.1656911694446; 
 Sun, 03 Jul 2022 22:14:54 -0700 (PDT)
Received: from [192.168.138.227] ([122.255.60.245])
 by smtp.gmail.com with ESMTPSA id
 b2-20020a170902a9c200b0015ee985999dsm20017700plr.97.2022.07.03.22.14.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Jul 2022 22:14:53 -0700 (PDT)
Message-ID: <b87f9897-fe1c-2f64-5177-ad6824786e7b@linaro.org>
Date: Mon, 4 Jul 2022 10:44:47 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 05/11] hw/rtc/ls7a_rtc: Fix rtc enable and disable function
Content-Language: en-US
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
Cc: gaosong@loongson.cn, maobibo@loongson.cn, mark.cave-ayland@ilande.co.uk,
 mst@redhat.com, imammedo@redhat.com, ani@anisinha.ca, f4bug@amsat.org,
 peter.maydell@linaro.org
References: <20220701093407.2150607-1-yangxiaojuan@loongson.cn>
 <20220701093407.2150607-6-yangxiaojuan@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220701093407.2150607-6-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
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

On 7/1/22 15:04, Xiaojuan Yang wrote:
> Fix ls7a rtc enable and disable function. When rtc disabled, it do
> not support to read or write, but the real time is still continue,
> so we need not neither save the time nor update the rtc offset.
> 
> Signed-off-by: Xiaojuan Yang<yangxiaojuan@loongson.cn>
> ---
>   hw/rtc/ls7a_rtc.c | 60 ++++++-----------------------------------------
>   1 file changed, 7 insertions(+), 53 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

