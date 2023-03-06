Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB0106AC2DB
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 15:17:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZBdk-0006wA-3n; Mon, 06 Mar 2023 09:16:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZBdi-0006uG-09
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 09:16:34 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZBdg-0001Kf-DM
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 09:16:33 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 m25-20020a7bcb99000000b003e7842b75f2so5275778wmi.3
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 06:16:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678112190;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JhuEQ3p/0JOhSZuNJ9191rf4J1UXNZ0JvQASlmYbeYE=;
 b=ceYAdKfrKRBJIeI09+5wHtOQYeVHJB8c6gngUe707dS5GP4pRfSwb936/z7zwzplyx
 WGdMcpWA/ush4tYmwCyU8iZijhIFP0zcehG3uculDLVAAPV83o971XokAbnASx8u8hjq
 xOmGZM2u57mUtDDtLn7t17CbOrWdMUcIvMNL45hFSSAFJ+U7w3Yf4JB/DrGkGLnaqMtn
 zz8dMEMUSrzGr5HbHJeuUBkatFxMhd0DQLy9yQJW2Tin4F1+Y044FuO5I80YeoHsc/fZ
 LRv3+OqG3gmwKDySFEtlliOQOjC6nzSn8JSywvAhkMiA/I3lqDbO18xoK9Eh+Nazzeze
 /HCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678112190;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JhuEQ3p/0JOhSZuNJ9191rf4J1UXNZ0JvQASlmYbeYE=;
 b=5T5yIVbmn2vDUmihmRyFQdvKTlSDLvYWIbNM3XN8rMoHGM7G4DbLoAKVW7+7TsNYNZ
 3xGcHJd6ysY66W3Lrl3MDeBmRqXxsLdmaNnvboezBvtQ1YALFxIEkAW1fTKypjbRAwVP
 b9yT5MLTZqHyWG4FHD884tLEI4FoRf5fT2RtEGrkXQ92YXLiIKE8QHiqfRvMgZZ683c1
 E00AwdV7daZx44PrrSTZoMSFvIDCxwkX47hWrSm6XuTpvtq+gRRl7lsSSIgdsZtkILq3
 P30MViGS7ZoyYuhIJVew64LYzdSbia5fJXtZjIRRyKKZ9fjuv+oxYb/M5YAEfde63ruo
 nVvg==
X-Gm-Message-State: AO0yUKUYooSZHh85C/2h9Y73FJYhNC/fa+XnzrzJuS1y43NhJMAgABDJ
 z2XGZo35yoPeaZkpR0QaFx02pA==
X-Google-Smtp-Source: AK7set/+9TIALIeMis4nNZNGK+8wSR7ZbYDW+f5oL0agyuuUpIf/OLr2NxiK8tAj5qh0F+ndCJ2JKg==
X-Received: by 2002:a05:600c:524d:b0:3eb:38a2:2bbc with SMTP id
 fc13-20020a05600c524d00b003eb38a22bbcmr8983900wmb.7.1678112190555; 
 Mon, 06 Mar 2023 06:16:30 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 w34-20020a05600c09a200b003e21f959453sm10303150wmp.32.2023.03.06.06.16.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 06:16:30 -0800 (PST)
Message-ID: <ca40823c-e766-ea05-6a28-71a267b3d7dd@linaro.org>
Date: Mon, 6 Mar 2023 15:16:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 35/70] target/ppc: Avoid tcg_const_i64 in
 do_vector_shift_quad
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
References: <20230227054233.390271-1-richard.henderson@linaro.org>
 <20230227054233.390271-36-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230227054233.390271-36-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
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

On 27/2/23 06:41, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/ppc/translate/vmx-impl.c.inc | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



