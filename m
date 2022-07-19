Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 180005793FE
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 09:19:52 +0200 (CEST)
Received: from localhost ([::1]:57200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDhWJ-0002Qj-28
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 03:19:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oDhMJ-0003Cw-9a
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 03:09:31 -0400
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b]:34687)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oDhMH-0003cS-MH
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 03:09:30 -0400
Received: by mail-il1-x12b.google.com with SMTP id w9so3694522ilg.1
 for <qemu-devel@nongnu.org>; Tue, 19 Jul 2022 00:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=hKS6eNAnRbxQ8xADWF2bkgkpQSJ1Fome0A/Kzf5fx/M=;
 b=m0so+tgPFV7iWsPqzv8se99dSI642Q3F+R6snPg/RbaqY7eUXToMjy/uJXjpF9F34A
 7YJtWDm3O7wfsf/ogiJqDxwvRt/rWLXyYmoVKea/5JM0VOrqoj0xB+jDQFViSjjwPA+f
 XBIqLfUvOr3V/9CzOwLI/003qN4fo5NGdpEjVZ0dDXgMofup/ty9Zi0h8bSyCi56or7+
 NXnphH7aDpgFDerwCOlYeOXy0IqD8/EMhgUMqKgKlVG7cuW3aiMhalT7WBWH9g4ri5ce
 jh8ZI1PFLWSVNcnyM5osoBlkK1MPB7tRIPzBMWioAOcU79fe0J+v4vn9awhjtBsFaph5
 yedQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=hKS6eNAnRbxQ8xADWF2bkgkpQSJ1Fome0A/Kzf5fx/M=;
 b=bykzQjhLHzarGI6msQz31ie91XyJyAUfhQy2xd7mTgGCTxcxHXdwinjFesfpCg7DRV
 KPFIifRigRg9t+3Lm1xwF+86vS62k4uswwqObw4AR/O65/5FoF/kJuG9EnYxnldkoYrQ
 GHf12vJOsWpkuPdjhM9UKvhGGsVhmhBz/IXYac1PGPJ1mWEWJwYyvlrdO/VQAp+ogjXo
 dWsvddNnJqNbC7Tud2OCov95XZoksh7UFk6L9Q+Wn1YYVcH5RYSI+S7g/YpH1Z0dWr2V
 akyO+CPeWcA6j7V0A21b8ELVqRvDWm4PNZKquQruyfhsDhYykUPcwU8lCwxzWs9GW16m
 gVpw==
X-Gm-Message-State: AJIora/KbLGBsR6+QQgoNMI48LgXa+Q0s7gJHhMbk4AWR2NuAiQk5DTb
 EsKRl/i8ILCocylVrbTK2dUg2g==
X-Google-Smtp-Source: AGRyM1uEZHxR1Q3v2/u6cgkYomgzfpYaH12ZFL+45kWoZGzyzpShN1ogEsOIXLI3Ekm/Sz3zmm3+3w==
X-Received: by 2002:a05:6e02:20e3:b0:2dc:f04c:f9db with SMTP id
 q3-20020a056e0220e300b002dcf04cf9dbmr3466970ilv.169.1658214568098; 
 Tue, 19 Jul 2022 00:09:28 -0700 (PDT)
Received: from [192.168.113.227] ([172.58.139.163])
 by smtp.gmail.com with ESMTPSA id
 u10-20020a92da8a000000b002dce2eb888dsm2556083iln.42.2022.07.19.00.09.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Jul 2022 00:09:27 -0700 (PDT)
Message-ID: <4f5dc576-9b6a-1f61-39b8-fc59206cfd82@linaro.org>
Date: Tue, 19 Jul 2022 12:39:18 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 2/8] fpu/softfloat: Add LoongArch specialization for
 pickNaNMulAdd
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org, f4bug@amsat.org, peter.maydell@linaro.org,
 yangxiaojuan@loongson.cn
References: <20220716085426.3098060-1-gaosong@loongson.cn>
 <20220716085426.3098060-3-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220716085426.3098060-3-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::12b;
 envelope-from=richard.henderson@linaro.org; helo=mail-il1-x12b.google.com
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

On 7/16/22 14:24, Song Gao wrote:
> LoongArch system follows IEEE754-2008 specificationa. The (inf,zero,nan)
> case sets InvalidOp and returns the input value 'c', and Prefer sNaN
> over qNaN, in the c, a, b order.
> 
> Signed-off-by: Song Gao <gaosong@loongson.cn>

Yep, matches paragraph 3 of 3.1.1.3. Non-numerical Result of Instructions.

You need another patch for pickNaN, just above here.  You can add TARGET_LOONGARCH64 to 
the first #if block, with ARM, MIPS and HPPA.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

