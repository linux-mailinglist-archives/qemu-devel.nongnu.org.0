Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B8550327C
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Apr 2022 04:53:41 +0200 (CEST)
Received: from localhost ([::1]:54140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nfYZA-0006ww-Uy
	for lists+qemu-devel@lfdr.de; Fri, 15 Apr 2022 22:53:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nfYWk-0004NH-1Z
 for qemu-devel@nongnu.org; Fri, 15 Apr 2022 22:51:10 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:40610)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nfYWi-0003V7-Bd
 for qemu-devel@nongnu.org; Fri, 15 Apr 2022 22:51:09 -0400
Received: by mail-pl1-x62c.google.com with SMTP id t12so8365592pll.7
 for <qemu-devel@nongnu.org>; Fri, 15 Apr 2022 19:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=OcSW40ivplWynaPtysiaX5v+rRRaY+4JHspclU179IQ=;
 b=cCiEbW+JTk1XC3JypG/Y7YCa7QAJYkqlwfJZsdtRywdC2lZh39rBu0zD43yJSPgZwn
 PIgw+C0ZACYJ1GVRGr9R261D63dsDm3+fTU8LMb7aoxnxYtnrD9oEKNicMG27snPu+5t
 mNEzzR8c7CYDjkG4SmUSZq9sJdkKSvXuwl5t8KqYaplA3bw09MTMVAlD1KLwMwLyo/jY
 giKHogS1t+lJJdhUyx3ezp7QsTgwyC/44qjsqyzCtzpOZD/dR7JKjzmAX27qirLkcuPx
 /NhVI/QKOgzqdJHIksGHJc4uTDP7PpTLQNZBtdmhnXMPQBItRfly9cB/vc4grk4gPAX6
 gvRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=OcSW40ivplWynaPtysiaX5v+rRRaY+4JHspclU179IQ=;
 b=PaeIubDA5usVov7aUR/IlNPPmS3dlW/u9W5MJGhCZJPd+dbO0BpOCRcMLRwo9XVmab
 LvSTFLljwhrsmw8kvrhDxVwIHJfgbugAij/3VTrHSXzEhyh2jrO2RuGDE8IuzABjQPjZ
 iYXGoMuyHmGv+xVMBb3VfeCxIF9u7TRQcADBT/pQ0NT42ek3D7I7fJ1O36+NeLM6Kk8P
 N8c30wsiPiCL8cwLvgnVgaqGQXz7KtTNo4juGpv5VI6+qyz+iHEyHTo+STBWbJ/mTd/K
 xHUYHagYmHF/OCgVjFNpcbDhQFuKzkgcZxmGy2R7vrf9NQXW+igi54lPJy/4q7+v7HcH
 KaGQ==
X-Gm-Message-State: AOAM532S4Qsotl46zBSwwGISAVGhQxhEk/oeDxXuk1JgTPK4GYkRJ/QU
 KNJMZ99Vy733KcCyUMpva1ieNA==
X-Google-Smtp-Source: ABdhPJxiUZzRBHLi8iruQNkyFJgnV8lRTCM0IcGnrr/B+nEfrjeHtsNjuQWDO4DRGpfVs+okeIJyaQ==
X-Received: by 2002:a17:902:edd1:b0:158:8318:b51e with SMTP id
 q17-20020a170902edd100b001588318b51emr1852573plk.89.1650077467019; 
 Fri, 15 Apr 2022 19:51:07 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 c25-20020a62e819000000b0050a442a510bsm2928546pfi.31.2022.04.15.19.51.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Apr 2022 19:51:06 -0700 (PDT)
Message-ID: <ce7d328a-276e-9dac-9784-9142b760902d@linaro.org>
Date: Fri, 15 Apr 2022 19:51:04 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v10 07/14] target/riscv: rvk: add support for zkne/zknd
 extension in RV64
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
References: <20220416023549.28463-1-liweiwei@iscas.ac.cn>
 <20220416023549.28463-8-liweiwei@iscas.ac.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220416023549.28463-8-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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
Cc: wangjunqiang@iscas.ac.cn, lazyparser@gmail.com, luruibo2000@163.com,
 lustrew@foxmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/15/22 19:35, Weiwei Li wrote:
> +target_ulong HELPER(aes64esm)(target_ulong rs1, target_ulong rs2)
> +{
> +    return aes64_operation(rs1, rs2, true, true);
> +}
> +
> +target_ulong HELPER(aes64es)(target_ulong rs1, target_ulong rs2)
> +{
> +    return aes64_operation(rs1, rs2, true, false);
> +}
> +
> +target_ulong HELPER(aes64ds)(target_ulong rs1, target_ulong rs2)
> +{
> +    return aes64_operation(rs1, rs2, false, false);
> +}
> +
> +target_ulong HELPER(aes64dsm)(target_ulong rs1, target_ulong rs2)
> +{
> +    return aes64_operation(rs1, rs2, false, true);
> +}

Missing REQUIRE_64BIT tests.


r~

