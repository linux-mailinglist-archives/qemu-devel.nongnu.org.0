Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2453F4975E5
	for <lists+qemu-devel@lfdr.de>; Sun, 23 Jan 2022 23:07:03 +0100 (CET)
Received: from localhost ([::1]:52348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nBl0n-0007sd-VP
	for lists+qemu-devel@lfdr.de; Sun, 23 Jan 2022 17:07:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nBkyr-0006GG-U2; Sun, 23 Jan 2022 17:05:02 -0500
Received: from [2a00:1450:4864:20::333] (port=34359
 helo=mail-wm1-x333.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nBkyq-0006IK-DV; Sun, 23 Jan 2022 17:05:01 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 bg19-20020a05600c3c9300b0034565e837b6so10761153wmb.1; 
 Sun, 23 Jan 2022 14:04:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=u+9a+qoPgaFH43blLPcea8uonm+E2/Hllm8gAUyGlT8=;
 b=S+Qo1nGPRVX3YPETVdVK43kLTbiZ01okuwRPDQRmRf3qA1MEm0lGcu9u1hvhMPDTm7
 YJzIhujigsvQpZ4c5RHg+eQJXNPtPYDErg/voMmSpdEYQ4xz8xncoVsVgseboeubG2lx
 Ee9rzynEprBx1cJHHNP9iP3vgh7OxNK0bloYhUgsFyOpzINqkuv6hYkZnLkWHhlJaZ/U
 +koTnbyl6zTt5P4iBe+iYXFp2csBlY8I7ExnjTgLIMoRnGEfKAsG5rD+ofdMH9E9/Laj
 8ncBUx568/m2Mfmnlg1YJ2GaIBi5EQw/2WCSa5uPYK5gb9jwocrti/dcBEqVSt5oo4Eh
 1xXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=u+9a+qoPgaFH43blLPcea8uonm+E2/Hllm8gAUyGlT8=;
 b=t+nnX+p9G4DbC3RuWXpJ6h7puQcZsd+HPP9WxA/8q4pBDACyymX5VAUIbunwxR33FB
 ibRqgKkHCOLgBrc98E7/NP/9aotq/6up47qA7Vxt+7xDu/s7sJ/MvO5t76RxJ5f46MJ6
 5aipcU0vnb0f6abnbgVVq75YCQ0VmRSC+05oaTCBduTYtcmfLvhTi5EwTj7Kk9oVJlIx
 XNr40P0uL0S1XSI1ZfcyzgQk6AttQO2ZZ7x4ProVJ+XajJ891uDoqrQSUsjtU+x+7Z7o
 f2QtLDDMtsnzF4aaFYgAHlXv2PMGETXcqXGQQeK+XoiU8ZMks1TpCF8xNLDYOvPQKY3b
 qrGQ==
X-Gm-Message-State: AOAM533aJHODn1DoDkvWgJPMQWuuTsiPjKOe9aGOIrHnY3yF8Ofpj3vx
 luwIxo/iuE10KgYtJ5Dyfu4=
X-Google-Smtp-Source: ABdhPJwdbRMVg1VllnbD3Z+oT6UdTEeEjgBzwpGi/5F0m+0c66mlmgTbBHzH4SBO03gUtvjq382CPQ==
X-Received: by 2002:a05:600c:3485:: with SMTP id
 a5mr9459393wmq.13.1642975498718; 
 Sun, 23 Jan 2022 14:04:58 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id j4sm14122658wrq.81.2022.01.23.14.04.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 Jan 2022 14:04:58 -0800 (PST)
Message-ID: <c8c805cb-2f5c-c5d3-ebeb-5debdbf97c3c@amsat.org>
Date: Sun, 23 Jan 2022 23:04:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.0
Subject: Re: [PATCH 10/14] hw/intc/arm_gicv3_its: Provide read accessor for
 translation_ops
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20220122182444.724087-1-peter.maydell@linaro.org>
 <20220122182444.724087-11-peter.maydell@linaro.org>
In-Reply-To: <20220122182444.724087-11-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::333
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 22/1/22 19:24, Peter Maydell wrote:
> The MemoryRegionOps gicv3_its_translation_ops currently provides only
> a .write_with_attrs function, because the only register in this
> region is the write-only GITS_TRANSLATER.  However, if you don't
> provide a read function and the guest tries reading from this memory
> region, QEMU will crash because
> memory_region_read_with_attrs_accessor() calls a NULL pointer.
> 
> Add a read function which always returns 0, to cover both bogus
> attempts to read GITS_TRANSLATER and also reads from the rest of the
> region, which is documented to be reserved, RES0.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/intc/arm_gicv3_its.c | 13 +++++++++++++
>   1 file changed, 13 insertions(+)

> +static MemTxResult gicv3_its_translation_read(void *opaque, hwaddr offset,
> +                                              uint64_t *data, unsigned size,
> +                                              MemTxAttrs attrs)
> +{
> +    /*
> +     * GITS_TRANSLATER is write-only, and all other addresses
> +     * in the interrupt translation space frame are RES0.
> +     */
> +    *data = 0;

Maybe log GUEST_ERROR?

Otherwise,
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> +    return MEMTX_OK;
> +}

