Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11C6D504956
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Apr 2022 21:38:31 +0200 (CEST)
Received: from localhost ([::1]:54480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngAj8-0006yq-7u
	for lists+qemu-devel@lfdr.de; Sun, 17 Apr 2022 15:38:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng9wf-0000oZ-2b
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 14:48:26 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:41888)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng9wd-0004b7-H0
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 14:48:24 -0400
Received: by mail-pg1-x52c.google.com with SMTP id t13so15119879pgn.8
 for <qemu-devel@nongnu.org>; Sun, 17 Apr 2022 11:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=h/HInot6Nc94k7HDTw61d6zMguKoO+KQoFIOqJKNiB4=;
 b=hh3qYZiCYOsZNb6Ng5rUSMr83Ae9mAFP4EC+ZnYeY2FL5tf1KKr+9WVZRBkNIX9pUU
 9HbXCAyUX+vUQ0Q9CY0A4igC+fc56Z/GjhN8yvR7CrdW4lhPS5g2RiA8+GNxnrFnSZ2T
 txhi87ZW8Fmev8PyTf6kHBhfFgvP0MQbNz+aV06dUHd1rILAUlXJ6kOtgym1sEZZ/swg
 sG3i3gfHIkx2dfE8CpPjsjJ5TpQuOlAjsayZ3hZkPtyggCPPyNR9qzncT5nGdDlkzMVS
 cun3L0LjDj3Q62YmzzTBYBWJTTXRJXijacetIIu9epxbc+oVyvPwwqAmAOhinGA3RCRI
 Ph4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=h/HInot6Nc94k7HDTw61d6zMguKoO+KQoFIOqJKNiB4=;
 b=sXpHU2fx8KXjb3OzvFtuuDEua3Ac24A9vGgN7s6cbCSAzQyQYJUU7FWr15mwQFdHcD
 4E/sdm0RLFDsCH8c7gh46c6Ceaf7BDd4bBdA+Y3osC3MTriHLAukRg5e/Vukhkhzkd1G
 G5kESc2+yUKeipAW84DxgCZktBgg1xgywYZ95M5sQfCDHy+AW26eYfmUKKsXQb3eDL8K
 wgxX2b+jLRUtclMxrVRgq4Pr/ScwDzDV9Afs0RGlHKx0PWS2vekoYN6jc9AHuGhfZk43
 M2qki801vdNOVvbHhhkF79/VR5QnrXdQoR3zXzx245gZ8psvUNtHm4tfkJRqt4DzWI/8
 V8KQ==
X-Gm-Message-State: AOAM5317XBFVnHb51AkughpeZ3NYuDEy6fQtToaiiw7fxbst+bjHSYhj
 zAAbxPZjAwIGgEN3gTAovvGg1g==
X-Google-Smtp-Source: ABdhPJye3wioO6YjgCxkkx4ebjWGt1ZdMrQWMgNBLPygji5Zp1IQTYnyvyMKLJ8yLVjsWOyPRCkZRw==
X-Received: by 2002:a63:4642:0:b0:398:b6b9:5f45 with SMTP id
 v2-20020a634642000000b00398b6b95f45mr7385116pgk.518.1650221302015; 
 Sun, 17 Apr 2022 11:48:22 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 b5-20020a056a0002c500b0050600032179sm9416413pft.130.2022.04.17.11.48.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 17 Apr 2022 11:48:21 -0700 (PDT)
Message-ID: <c4c9f7b5-0b0b-9734-aa5b-6f72c8c76820@linaro.org>
Date: Sun, 17 Apr 2022 11:48:19 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v1 29/43] target/loongarch: Add timer related instructions
 support.
Content-Language: en-US
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
References: <20220415094058.3584233-1-yangxiaojuan@loongson.cn>
 <20220415094058.3584233-30-yangxiaojuan@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220415094058.3584233-30-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
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
Cc: mark.cave-ayland@ilande.co.uk, gaosong@loongson.cn
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/15/22 02:40, Xiaojuan Yang wrote:
> +uint64_t helper_rdtime_d(CPULoongArchState *env)
> +{
> +    LoongArchCPU *cpu = LOONGARCH_CPU(env_cpu(env));
> +
> +    if ((env->CSR_MISC >> 7) & 0x1) {
> +        do_raise_exception(env, EXCCODE_IPE, GETPC());

This isn't correct -- you need to extract bit 4 + plv.  It would be better to add CSR_MISC 
fields to cpu-csr.h rather than hard-code a constant.  If you treat them as the 4-bit 
fields that they are,

FIELD(CSR_MISC, VA32, 0, 4)
FIELD(CSR_MISC, DRDTL, 4, 4)
etc

then here,

     plv = FIELD_EX64(env->CSR_CRMD, CSR_CRMD, PLV);
     if (extract64(env->CSR_MISC, R_CSR_MISC_DRDTL_SHIFT + plv, 1))


r~

