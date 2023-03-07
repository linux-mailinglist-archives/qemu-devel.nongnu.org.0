Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C99E6AD32A
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 01:08:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZKs5-0000ht-Oi; Mon, 06 Mar 2023 19:08:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZKs3-0000go-BK
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 19:07:59 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZKs1-0003AQ-Ol
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 19:07:59 -0500
Received: by mail-wr1-x42f.google.com with SMTP id l1so10508503wry.12
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 16:07:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678147675;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=olxyY6TeY0afP9/nd0aNiC52BjH3+WJeqTkksI0OYY0=;
 b=TdRxaVpVJ3aQ/fZuJhNsFEsgNiHrORGMSyA3qJ3lY6XtODJPGPkJdN1GW3pZ4tJuqK
 1ndIF8uC3nd4Awp/8mTHOXUN3ocwO2clzoj1SeZdwBvOHyftWET+tXPVM5jlmAIDPcxV
 82Kz5gxroMQS1MWUVEcGAkGuPDq/WOZqUPa2KYj1cAl/lvKK5d1woVLu+z/HW6H0bgVX
 J63mrtzBTR1HGdk7sb7ehm/SMfQKMd6OAR95SPhGNxrqVxw58BcIXdbBnPnRve9YSfFT
 Miy2S07acyv7/dqWhS0Mt1XEE2y7Q5HqkIADdHzqTXGYq+zQDfk93fhYPAbPZI8XUg0Z
 1Ztw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678147675;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=olxyY6TeY0afP9/nd0aNiC52BjH3+WJeqTkksI0OYY0=;
 b=5WLRGYyp3YUeMryn5XUqiZLaZdSI3h4OGwVo2vDF1+UgxQ1aYPgojsriFIVBObo+3k
 2Y/e0tGlu/S8sOexFsVO8/0SA5MmrSUHwRNgtwndXllE2/WgFEVhWx9GdUiWJjq9SSaV
 RmBq66cwyTwLu/k0LC9rQkzhPiJvF6oj97Ks6ZS6L51f2heIVyltu3sdgCbWMlNfSKUd
 P81chP88XVYulEnarE64zxGkDdqy1YQLwaTIZxjxspKtkArrcSkrm+ab1gF0Ro1PGEDg
 gFa0F+Irg7byBE+W0nJfxomGVysQ+hGEVtmh6b28w4cT1kuuCOxIBkuLGpmIld4Yyl1C
 l+FQ==
X-Gm-Message-State: AO0yUKXI4UBhQYC22DMhqw4F3QX3118MIXTb1mc2koVAEPKuP3uYtjgL
 Op7cWKlyHZ8imXDqBcgnH5ZbfQ==
X-Google-Smtp-Source: AK7set9N7a6JIoBUcTEN474BFhi9tehkcoaFxrheRDSU6MY9rfwVQMl4mVd3FhCIm1iymN3Lu7lBMw==
X-Received: by 2002:a5d:4ec2:0:b0:2c5:483f:1580 with SMTP id
 s2-20020a5d4ec2000000b002c5483f1580mr12537010wrv.12.1678147675711; 
 Mon, 06 Mar 2023 16:07:55 -0800 (PST)
Received: from [192.168.1.115] (138.red-88-29-178.dynamicip.rima-tde.net.
 [88.29.178.138]) by smtp.gmail.com with ESMTPSA id
 h18-20020a5d4312000000b002c7107ce17fsm11217631wrq.3.2023.03.06.16.07.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 16:07:55 -0800 (PST)
Message-ID: <89ff5c91-13a8-a9d8-cafd-3fc388a580be@linaro.org>
Date: Tue, 7 Mar 2023 01:07:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 62/70] target/xtensa: Tidy translate_bb
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
References: <20230227054233.390271-1-richard.henderson@linaro.org>
 <20230227054233.390271-63-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230227054233.390271-63-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
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

On 27/2/23 06:42, Richard Henderson wrote:
> Replace ifdefs with C, tcg_const_i32 with tcg_constant_i32.
> We only need a single temporary for this.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/xtensa/translate.c | 18 +++++++-----------
>   1 file changed, 7 insertions(+), 11 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


