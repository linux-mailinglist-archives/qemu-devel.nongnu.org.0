Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EC435206A5
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 23:27:38 +0200 (CEST)
Received: from localhost ([::1]:54586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noAul-0006o8-Vo
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 17:27:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1noAsD-0002w4-UI
 for qemu-devel@nongnu.org; Mon, 09 May 2022 17:24:58 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:35789)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1noAsC-0000Ur-GA
 for qemu-devel@nongnu.org; Mon, 09 May 2022 17:24:57 -0400
Received: by mail-pl1-x629.google.com with SMTP id c9so14355575plh.2
 for <qemu-devel@nongnu.org>; Mon, 09 May 2022 14:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=qLah0BhidgIR8KplR7yEqeBZqE7UFVE503Vq78a3ej4=;
 b=zSnjZT0cLUQqQAaxieS2UcqWfeCNEedNDE3UGQadk6MY04bROrpH7Qu1vUYxW4gKeG
 pdOfPz6kUdGg2/Wb/Dqz6cm8LCfWcjfmpgY1xofFgZqOlILBvjUV0d4EM2TgbBWO5wqH
 cs/FaSt5nKgSnN9QUV5ehXvjnr/RkcBzHcpJZsZ61HG0OCd3sQjnJIsRPwbTI9vZxg33
 nlx+Ft45p0o7O++X1JA/4enYsyx9PBG+gY4LY8wz7VM2xd+JXhdXNytqO37AhJ8Li+yr
 DEIwuPGwVaAQsedOevcdYVoVYCiyfnpFdPkK9R8Duv7Zkdg6nKengazGlQnLsD1AIFbP
 bZEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=qLah0BhidgIR8KplR7yEqeBZqE7UFVE503Vq78a3ej4=;
 b=D4vlaRD6bcL9cpvkAKw7PEPZ3c7FfM3STx7QRZRArD4qD93q3UbptoDvGHNQsS7hOI
 WnIDg5zSJ6FGAJjp5BvWi42IDWWvkORs00WfU1RSoV4tO1qa5o0UMxIusrSRTrxJToMI
 /BjCZTwtvGAGuLxKlGiffTyrQntoKGCBeohQNRDgbQ4k06Tne08ez6Me8uD/+LbBapWY
 KZWQHMz2opt1SV4UGkiQwJpydkLaq6sET0E6BKyfW2yvHaSiQLDc6eSbRsPp0GitVBwT
 GqMrZdmrazg48AD3++MYuvKIJPxAyUkQSHbGfZB1Hgc4abRE5J18lSjkUq/ANqFN+JLt
 Z/XA==
X-Gm-Message-State: AOAM532Mj4LCyVMCOoM0lBK8OCFelKKTml1+5U3PxNvO1B5L6fa5SalO
 n3TD3kumXPK5MmCiqG1CTlj2Cg==
X-Google-Smtp-Source: ABdhPJwekwfKHMm91jZK6dB5f3NdvSPhaKKgi2DnGbHYbq9Hwnf0p1ik8+LfiukYf4UZn5Igf7y/qg==
X-Received: by 2002:a17:90b:1b03:b0:1dc:a80b:8004 with SMTP id
 nu3-20020a17090b1b0300b001dca80b8004mr27872193pjb.182.1652131494885; 
 Mon, 09 May 2022 14:24:54 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 r21-20020a170902ea5500b0015e8d4eb285sm312119plg.207.2022.05.09.14.24.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 May 2022 14:24:54 -0700 (PDT)
Message-ID: <995ec3be-1a3f-4f51-35ac-bad866d75e51@linaro.org>
Date: Mon, 9 May 2022 14:24:52 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] target/arm: Implement FEAT_IDST
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220509155457.3560724-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220509155457.3560724-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 5/9/22 10:54, Peter Maydell wrote:
> @@ -841,6 +841,7 @@ static void aarch64_max_initfn(Object *obj)
>       t = FIELD_DP64(t, ID_AA64MMFR2, VARANGE, 1); /* FEAT_LVA */
>       t = FIELD_DP64(t, ID_AA64MMFR2, TTL, 1); /* FEAT_TTL */
>       t = FIELD_DP64(t, ID_AA64MMFR2, BBM, 2); /* FEAT_BBM at level 2 */
> +    t = FIELD_DP64(t, ID_AA64MMFR2, IDS, 1); /* FEAT_IDST */

Ideally this should be sorted before TTL, by bit order.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

