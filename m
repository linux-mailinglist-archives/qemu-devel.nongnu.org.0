Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED4946AD30A
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 00:52:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZKch-0001EH-GZ; Mon, 06 Mar 2023 18:52:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZKcf-0001Ct-Jq
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 18:52:05 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZKcd-0000b1-60
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 18:52:05 -0500
Received: by mail-wr1-x430.google.com with SMTP id bx12so10498923wrb.11
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 15:52:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678146721;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Ri0swZy8TWMBEHxIghErk16g0IdpnryrsBu51JMMGN8=;
 b=pUAfWhl/ACk14M4SdLfkVS2C/l98BKAQHbMpis8Y36ZCzjKqpGLaw3tzAIBtEhp24z
 30W2bAVYsXJfK7wm5E+nrp/Un38iC0n+YQmwBM8IM+qHXemPwK0Wz5AWVbFtak08H8CG
 uf6O/iqSYNqdkxBemQ27uXRnkkcK4KGwit8Yz5+ZALSstvZIbgncGIwfo/IihSkOCL6x
 oybzKlyfsEUj3b0PMXJNt3YYDOnB3K/kwIgmbXlSRHnhBD/29xThN9sLmWdk/hESRhBM
 JnJkagO8pHmWJMZuGp/A9rNEtc3/375f70MhdT8xXYiwSyv/W+NPQbLOBlzfL2GaLPpI
 IcYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678146721;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ri0swZy8TWMBEHxIghErk16g0IdpnryrsBu51JMMGN8=;
 b=Cd6fOJOUhxgN+cjsMf37M6RgRWGkG1+lRK70ahmuv54Gca9uHzEvOPBqdIWbzdAMSX
 flna4ncVHYi4ON/CsZ5pmZQlxMDcm/nqJh5QQyXq/aArXOvbThgk093gTGdMdW/JfMhK
 0Aq7frcKSt3Ky0QVxnr+Y5cfaEWRyyh7cR17VIVmGghiLOL6o44OO2KgXO1x6EQ/V8kD
 Y4VDf8GKbB51MMR6tBi36N+ECz85WErzuRRy+znuUZyj7gCPotP3ndg1txNL+8E86/A5
 67B9XsgtzzZdG6rq8aEImqjPwkmhP5QVfPotmluJ4Y+c5Cux0By8/7zxcBoWIy9ddmmy
 PcYw==
X-Gm-Message-State: AO0yUKUxIneFPDuU16XvGT49VzwX0ah1Ndd6i4ZouYsaVJVqQvhgQLO7
 e5VWO5hPooMmuEBCYew3+e2ZmQ==
X-Google-Smtp-Source: AK7set8mtMHno2iIxM4nluQZywpNyiC7RemIvSV770k1W9HlD3TW6gupY3n8K3+UF724HQNYLbLJ3Q==
X-Received: by 2002:adf:f191:0:b0:2c7:d6e:7e6e with SMTP id
 h17-20020adff191000000b002c70d6e7e6emr8437006wro.24.1678146721331; 
 Mon, 06 Mar 2023 15:52:01 -0800 (PST)
Received: from [192.168.1.115] (138.red-88-29-178.dynamicip.rima-tde.net.
 [88.29.178.138]) by smtp.gmail.com with ESMTPSA id
 s25-20020a05600c319900b003db03725e86sm11355189wmp.8.2023.03.06.15.51.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 15:52:00 -0800 (PST)
Message-ID: <cb137615-5923-837b-c190-f76c1056dad6@linaro.org>
Date: Tue, 7 Mar 2023 00:51:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 21/70] target/hppa: Avoid use of tcg_const_i32 throughout
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
References: <20230227054233.390271-1-richard.henderson@linaro.org>
 <20230227054233.390271-22-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230227054233.390271-22-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
> All uses were read-write, so replace with a new
> allocation and initialization.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/hppa/translate.c | 21 +++++++++++----------
>   1 file changed, 11 insertions(+), 10 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


