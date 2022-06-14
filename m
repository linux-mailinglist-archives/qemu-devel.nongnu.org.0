Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 374E154B5F7
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 18:29:50 +0200 (CEST)
Received: from localhost ([::1]:36436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o19QK-0002yk-Om
	for lists+qemu-devel@lfdr.de; Tue, 14 Jun 2022 12:29:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o19Iu-0007HB-ES
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 12:22:08 -0400
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35]:34438)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o19Is-00075s-HO
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 12:22:07 -0400
Received: by mail-qv1-xf35.google.com with SMTP id t6so5469261qvh.1
 for <qemu-devel@nongnu.org>; Tue, 14 Jun 2022 09:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=NhVwwUME8bHPVT3yPaTS4iFFb+ISY+fGXqIxdMt+6S4=;
 b=naAv4fzqGkJ20X+ifhsxNc4lfGoOZOk8vdihEG8YoJ8YDGbgYC6hUZv4V/OKPgywPt
 UP/KdXEPjSv4qXbZ6mSMizAFNnBF5wc5ULHLJzXxkKsAm2yJJBbajhXJ/MY7hxXED8lO
 pYogVTq0HNMwPVa62UbIGiZwfAZLgP3VZrVMcXR05OLfGmc4aIuMjt+3cVsDZrp+5xUM
 KnutDQPyM73rw2kHHy4miW20Zi7WwjOTyfV5SpAiBjRXJzsGD94/HIgsg7JPMUEdBJ52
 0eeJ0O7YeaoSUpSiNu8Mjl4uzUSpD7wM+JIC5dMFWt/NK9jyro4qsD2EO9+zYPucO2xq
 HY4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=NhVwwUME8bHPVT3yPaTS4iFFb+ISY+fGXqIxdMt+6S4=;
 b=kaTCSXIPd7cn043cmc44B/rEXtMfq81tU2jOkTuD2s9MUdz5ngfSWzJFFqfv+P6goS
 Tbf4FLiQ7bwFGCratQR8iMDPxMpW6A0RDcLxebJsrdtq8nDq3WoAaeFRFmx759xIYMmW
 mIPB058NRt+yoEOz+RmU0cZEn/U7DXA+E/AfbhNCDJp0gKHkzBfOrHqXXAn56mtquZfV
 VfzycKH8oBnXplWS5nR/fpVrKfktSbn6xfh4YXutEtM0B5WrgHK9zFl/pZZIe8D36T6H
 ahLUCag3O+OKoyq+B6lvkvHuYAeSaVpGiSF/1oz60e/mjYJ6sRGcHENayKtYTsr2kwHK
 zbmw==
X-Gm-Message-State: AJIora9XDxRMPo8ocGfZ3ZS3oI2RYD+w58ihQmUlywY9DrY/uaBJheAn
 WplhLiAd0TEzPCDSt4gnJsfUQw==
X-Google-Smtp-Source: AGRyM1stoEdsN30mDal/tq4UYdozciEC8VcDSQ7tfVXU3HA72zRQeCLYDoeCqmHYE3tCr+bOlQ1R9g==
X-Received: by 2002:a05:6214:5589:b0:46e:630c:c000 with SMTP id
 mi9-20020a056214558900b0046e630cc000mr41996qvb.91.1655223725417; 
 Tue, 14 Jun 2022 09:22:05 -0700 (PDT)
Received: from ?IPV6:2607:fb90:806a:4827:adb5:6bfe:ffa:b215?
 ([2607:fb90:806a:4827:adb5:6bfe:ffa:b215])
 by smtp.gmail.com with ESMTPSA id
 s12-20020a05620a0bcc00b006a6ae636ce0sm4131035qki.131.2022.06.14.09.22.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jun 2022 09:22:04 -0700 (PDT)
Message-ID: <099e6d5c-a48d-29eb-4a6b-0d1bec37b707@linaro.org>
Date: Tue, 14 Jun 2022 09:21:58 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v16 3/9] linux-user: Add LoongArch elf support
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
Cc: laurent@vivier.eu, Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20220614090536.1103616-1-gaosong@loongson.cn>
 <20220614090536.1103616-4-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220614090536.1103616-4-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f35;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf35.google.com
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

On 6/14/22 02:05, Song Gao wrote:
> +#define ELF_HWCAP get_elf_hwcap()
> +
> +static uint32_t get_elf_hwcap(void)
> +{
> +    return 0;
> +}

This should not be zero.  See cpu_probe_common in the kernel.  At minimum 
HWCAP_LOONGARCH_CRC32 and HWCAP_LOONGARCH_FPU are missing.  I don't know how many of the 
other features are implemented in target/loongarch/.

Missing ELF_PLATFORM, per the kernel's set_elf_platform(cpu, "loongarch").


r~

