Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 632CC673527
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 11:10:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIRr4-0005yp-4B; Thu, 19 Jan 2023 05:09:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIRr1-0005rI-7y
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 05:09:07 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIRqz-0005iy-3P
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 05:09:06 -0500
Received: by mail-wm1-x32b.google.com with SMTP id q8so1069892wmo.5
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 02:09:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Viiv7AaMElQTUf205+qO7fH38DfKp0/NNmgM9N4gbKI=;
 b=y6TKjdNwQ9Qdffr6xs3pbEdL96t0+McUtxi6GLV893BnyvC75pflw6NT+aZOVW4LJg
 OA/71+5vmvGLKUp2HTjusH3UofCxuT1mM8EYw26xg3miT1UsfYQnpQzlYlT7rKwz7OdG
 uCnIW6/ExwuK6ugv5xLYrdZg9VL/IhtYV7qTyH2b8/xYzRFXIel6+Y0fLYQYfJ8P+Bms
 LBAUTUbviYFFJQjtVmu+nf0PkniaOoVyOavzbqKe4LPKJmLHaw1GxvNt1T1XPn4jOel0
 Tf94LhWbuFfXm4obnppKLRXeHp3Wmel/ZN63Q8UuDiVCPw+hfl7r7TXvN+CuCBcPtth4
 OD9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Viiv7AaMElQTUf205+qO7fH38DfKp0/NNmgM9N4gbKI=;
 b=Aw78CDtqivKFFDebSQsj6UVPdo2jzUpd6/0PX2g8IABOsVO7psbjJ4je6HyY61r40S
 dcL1VI/i1jS+clVcalmXZyYhwzOvMWpWSp9dLHpcq0ASF7QscoXcsdXrqZ8Phebgn10g
 T9X7Kvm4PVoSzEvrrfHquQE/XALBKKYB2sALNnXWHNdE8a5ZYQjfr/1Z+7kbkrdCGxa8
 7MzrAkiTFHoGxp8ZCvjCeyKmZryeFMQFbnILYmAwVeVF4AjI8FJvhWiZLFz/QCgbOsvY
 kYMEVz8vGA0ubSoeSN6Uv6y144fngTLRg6A1fQxKYNjP7Ty06rMT+RYtQywY8svOJHK5
 RG0g==
X-Gm-Message-State: AFqh2kqbZ+OAiECrCesFhFU7of4ktb+NEyk71aSMrf01RyIUJ7c4ume4
 iOE79Qq9SNHCCuZD9SDgQwKJYg==
X-Google-Smtp-Source: AMrXdXtu65svVNxFI+zcKj1UY7hMZjvAybb5UJIYDD3DA6/PBEzqVRWszskRO1lSEMreN6L+nxFQqw==
X-Received: by 2002:a7b:cc07:0:b0:3da:fcb7:39e5 with SMTP id
 f7-20020a7bcc07000000b003dafcb739e5mr9367006wmh.23.1674122943188; 
 Thu, 19 Jan 2023 02:09:03 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 bd24-20020a05600c1f1800b003db122d5ac2sm4519699wmb.15.2023.01.19.02.09.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jan 2023 02:09:02 -0800 (PST)
Message-ID: <7616852a-a051-fc00-e799-dbaf7b843b28@linaro.org>
Date: Thu, 19 Jan 2023 11:09:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 3/5] target/avr: fix avr features processing
Content-Language: en-US
To: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>, qemu-devel@nongnu.org
Cc: mrolnik@gmail.com, richard.henderson@linaro.org
References: <167412016297.3110454.15240516964339531097.stgit@pasha-ThinkPad-X280>
 <167412017939.3110454.772171621078654245.stgit@pasha-ThinkPad-X280>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <167412017939.3110454.772171621078654245.stgit@pasha-ThinkPad-X280>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.089,
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

On 19/1/23 10:22, Pavel Dovgalyuk wrote:
> Bit vector for features has 64 bits. This patch fixes bit shifts in
> avr_feature and set_avr_feature functions to be 64-bit too.
> 
> Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
> Reviewed-by: Michael Rolnik <mrolnik@gmail.com>
> ---
>   target/avr/cpu.h |    4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/target/avr/cpu.h b/target/avr/cpu.h
> index 7c3895b65e..280edc495b 100644
> --- a/target/avr/cpu.h
> +++ b/target/avr/cpu.h
> @@ -166,12 +166,12 @@ vaddr avr_cpu_gdb_adjust_breakpoint(CPUState *cpu, vaddr addr);
>   
>   static inline int avr_feature(CPUAVRState *env, AVRFeature feature)
>   {
> -    return (env->features & (1U << feature)) != 0;
> +    return (env->features & (1ULL << feature)) != 0;
>   }
>   
>   static inline void set_avr_feature(CPUAVRState *env, int feature)
>   {
> -    env->features |= (1U << feature);
> +    env->features |= (1ULL << feature);
>   }

Consider using extract64() or BIT_ULL(). Regardless:

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


