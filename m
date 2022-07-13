Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A273E573AE8
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jul 2022 18:12:25 +0200 (CEST)
Received: from localhost ([::1]:53692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBeyO-0004eL-Af
	for lists+qemu-devel@lfdr.de; Wed, 13 Jul 2022 12:12:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oBerJ-0004E2-79
 for qemu-devel@nongnu.org; Wed, 13 Jul 2022 12:05:05 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:36376)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oBerG-000531-KW
 for qemu-devel@nongnu.org; Wed, 13 Jul 2022 12:05:03 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 z12-20020a17090a7b8c00b001ef84000b8bso4427741pjc.1
 for <qemu-devel@nongnu.org>; Wed, 13 Jul 2022 09:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=tsAh4hPqcj65fHGMafnOTPf4cFwveyr3ugsRmx4Jc1g=;
 b=HMZqDWFcITSjNT3EGurIKjnCeNFvk3YdqakasR7jSeE5FlY5NKLn8Yo3z+ebvZBhS6
 ykZBE7Hq28E1EW9RXZnMV7X6116dpy+HRwrlm9RqimtDT48uE3yyx3Kn0KMVNx5K6V3q
 hKLFKgwYRfw6m6zRqAOytYNaiJhwtLmT3td6Rnb0hHTfcPH0wmuqU31vRLzmKSzImd8u
 TWOX5ZMoYo5dclwG9wdmRGeSF7sYTzKJYPwDgHidrZ0f21D2nN5Uj7PFsIdHUJlf5f8G
 qzCi6gbj8YMvFEtMX3+pITJcTWBaXomN3uVc1RbqlRrpAjpnVpN9fZzFLVRE2LoFl415
 fFEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=tsAh4hPqcj65fHGMafnOTPf4cFwveyr3ugsRmx4Jc1g=;
 b=SwhjR/7VI+s8BvLjihuTDmo/PWAO0EkC+dYuaC5cmM/krIW6IK7NzgLMtiH4hf7m/h
 EJJ0FpcNYGf0tTXTmAsN4gfsm0CkQdOigrbPRAd+tKxNt/IW7jqkL6X4QL9DOg+nMOFI
 5YbGDMcvDNr5v+n5gmMiZtlwWVTdj5DwJO+xUbo3JNPdKh/s89VZZLoqcycS3DVsDFiG
 ToyaKEq2K5AQNAXytWE53MA7QE8Tf/SwqCqb4qB+KAN8nsoks5XxXNY54ALRKHoQmwsz
 kjhHfRhu4eX+fC5gt/Y9LLk08HdB2GqCmQNft1NJLUuzdMnT6DmKF1WM51uSOQwqSqNl
 poeA==
X-Gm-Message-State: AJIora9lqqApsswk9E6HFSYwrZzXppFnaKxCKPpUB2Z6ol1DUvpG++eX
 I4aXQ4mmoC3LxMfSWwwx287O4w==
X-Google-Smtp-Source: AGRyM1sL6HBAzX3as5HZ4iEqwOB/9tcX4wfhnuExHI/ATq6xooSm3ckMSMOV6zsmTgrZtOJMHvWrvQ==
X-Received: by 2002:a17:902:b216:b0:16a:854:e641 with SMTP id
 t22-20020a170902b21600b0016a0854e641mr3745223plr.154.1657728301109; 
 Wed, 13 Jul 2022 09:05:01 -0700 (PDT)
Received: from [192.168.138.227] ([202.124.167.115])
 by smtp.gmail.com with ESMTPSA id
 y6-20020a17090322c600b0016bf10203fbsm9046235plg.12.2022.07.13.09.04.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Jul 2022 09:05:00 -0700 (PDT)
Message-ID: <90f769d9-7296-95a5-63cb-2597cbf6b9bd@linaro.org>
Date: Wed, 13 Jul 2022 21:34:54 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 4/5] target/loongarch/tlb_helper: Fix coverity integer
 overflow error
Content-Language: en-US
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
Cc: gaosong@loongson.cn, maobibo@loongson.cn, mark.cave-ayland@ilande.co.uk,
 mst@redhat.com, imammedo@redhat.com, ani@anisinha.ca, f4bug@amsat.org,
 peter.maydell@linaro.org
References: <20220713095036.705102-1-yangxiaojuan@loongson.cn>
 <20220713095036.705102-5-yangxiaojuan@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220713095036.705102-5-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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

On 7/13/22 15:20, Xiaojuan Yang wrote:
> Replace '1 << shift' with 'MAKE_64BIT_MASK(shift, 1)' to fix
> unintentional integer overflow errors in tlb_helper file.
> 
> Fix coverity CID: 1489759 1489762
> 
> Signed-off-by: Xiaojuan Yang<yangxiaojuan@loongson.cn>
> ---
>   target/loongarch/tlb_helper.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

