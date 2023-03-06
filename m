Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AE976AC44B
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 16:03:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZCLt-00049V-83; Mon, 06 Mar 2023 10:02:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZCLk-0003m5-DY
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 10:02:09 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZCLi-0003as-Pu
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 10:02:04 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 l7-20020a05600c1d0700b003eb5e6d906bso5363860wms.5
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 07:02:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678114922;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TrHfJ9xm9yKvmeoI1ItBdAApvnWF94r7m+svFZjZ1OU=;
 b=Ud3q0WhCG5JQJTCggjbCHJCzQM2JRo2XpFn7Gqqpk1xxc7jznfj0aw7JyZz+kZm1uV
 eoZv071PxcFJE/Ow5LooWhb1cAJwK9Qb+QsOl+ZnmtnGkRD2ICITvtUAGYquouklizGK
 g5J4dTkjsiFsDDWOSirErW779V2W9AuQBbcAI5a5wx+kPks5nW53wtTvS5JoW9c5h3s7
 eSuKzV+As8QVVSWRoAtQf3VsUBwYDLvByMLppPQrWdsnoune2Guwe4Zd3xDkoFAEQLwi
 PvEZX7EbXHmUnla6UQJCUcFiNYDsTiCe7ceLA5OCNhjj6bn3T/I2QeGwYtUCPRHRFzGK
 EFOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678114922;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TrHfJ9xm9yKvmeoI1ItBdAApvnWF94r7m+svFZjZ1OU=;
 b=BRXUZtqqDGY6RNV7QNYLKBNaMMdOILJAJGcLie/T9g0MQybzRmhVzenHIsC8skT8gi
 lsc/u+hgBvFkJ8e2dpvCnB4LvGVQZmRBNjjQ2sBWx3ks7NBLRa+m+Q/9ODa2QDQB9nr3
 w3dNA4+DOhN37gKx7npYh1frdTFsQ5AdtQe8rM1jcnHMsTfDVyf1hHeS+eFyc/uIdSrl
 WSqa3hBQSQieuSHLGbnUO8cwYwFZDoVlFutBB/1q71w5FgeDw3IhUM6RixE4WflVulrf
 dZP1QiWpSXchkQbikXd90Ll1dFmfAcgtdnOn3NngH4gQMVwO3e3gMP5L35aqJY5hjCOk
 0jeA==
X-Gm-Message-State: AO0yUKVzcE6ZFI/bDh1c0zx1DYLQBlE5HoecrNrHwCMFumVc4Rcza9wk
 pizMbXQBN9CpMrFCrMVbQIgn6w==
X-Google-Smtp-Source: AK7set+Wwbf9sZXaEKQ2h7WE+6VO+BYUO/6iKc+TmVy5cdtyCIFgNUY8i3jUaQQ3ABqECFbjx6w7Qw==
X-Received: by 2002:a05:600c:4593:b0:3dc:4313:fd1e with SMTP id
 r19-20020a05600c459300b003dc4313fd1emr8788068wmo.34.1678114921653; 
 Mon, 06 Mar 2023 07:02:01 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 o33-20020a05600c512100b003e209186c07sm16365863wms.19.2023.03.06.07.02.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 07:02:01 -0800 (PST)
Message-ID: <f8647ca9-1fc1-f45b-5f85-dc58bde9500c@linaro.org>
Date: Mon, 6 Mar 2023 16:01:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 64/70] target/xtensa: Avoid tcg_const_i32 in translate_l32r
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
References: <20230227054233.390271-1-richard.henderson@linaro.org>
 <20230227054233.390271-65-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230227054233.390271-65-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
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

On 27/2/23 06:42, Richard Henderson wrote:
> Use addi on the addition side and tcg_constant_i32 on the other.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/xtensa/translate.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



