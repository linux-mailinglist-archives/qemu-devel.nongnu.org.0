Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE596AC46D
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 16:09:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZCSR-0000pk-Hm; Mon, 06 Mar 2023 10:08:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZCSP-0000nu-2C
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 10:08:57 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZCSN-0004hB-2s
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 10:08:56 -0500
Received: by mail-wr1-x432.google.com with SMTP id l25so9176968wrb.3
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 07:08:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678115333;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NjfFXgRBu2mFU/p8wC8b/Tz6qqP/Z/aF+roBFRxHKpc=;
 b=lYZecB/TCNAmO4XeEvAZGWBge/fE6Wjpe6tEg35igN4c4rJ6Bx/m3Gb6EdJQDU68pA
 xQsHm5h5160AonENwjHPFobESvaYaWT+uaQccM1Hd/B3H+INs12RmL9EHm9tsX6cc9Ky
 0Lk9P7cmayaZV7uLYlybtadX1TqaNQeTv3Qy3kA1em5zMFjZ0/i2ScChBMfqg41Xb21+
 1LJaUTpOCDqv84RbTCAeHGeIbMDooYFX/UlkHhY2NJjlJnfPCyay6KFOeJ469eO2ZnMo
 B/fprfw8aqBXl+rcjIUShJ1rJhC8jXCyVxHiTGvnDKGJeVe1YVaVs9ovqaK7w/P6/Q42
 9Xmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678115333;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NjfFXgRBu2mFU/p8wC8b/Tz6qqP/Z/aF+roBFRxHKpc=;
 b=poGjrJQWWt9opNSs/QDDTiDsu3corbraX1RRQhUnKC8upKo7d35dBlfgyzVJ+P8Hhj
 caWnBRfZ7XGeyNtY2sFS3iCzH0nEEQMSQ/maeIn6VusNG8NPcUPElmPyAVCCE/+gYbll
 MsU7ZLYoObfkvIxo7D94wSBTT5gi08QLBwHK4viqUgHSjoDeUMWxGi+a1LmE2RWSpz3f
 KOC9huiek4wBpP4rKvtdCWgHNeW9HJIPPSqL+ysSxXK0BKrt7/I7a9SbbB65Ulk+i1A9
 dESsQy4V1DC8RznAdQDhqL6+/tF6ZHdBL3yg4qCmKoWTryhdaB1ljIIBxyqldU6ooS61
 J8qA==
X-Gm-Message-State: AO0yUKWIFMpbUmmeMOKxVEr1mneik1WOqgZE1lhc0L8UqKIOTQyL7hA3
 rPTnc4EoMCfMDcMEFqHPCT0obw==
X-Google-Smtp-Source: AK7set/7yu/ae7ayZS9pWEsoPhGB+P0rghncAnSIO3akOJqA6TUk1arGpBN0AS3lvsK9DJnTPGlsNA==
X-Received: by 2002:adf:efca:0:b0:2ce:34c8:44c with SMTP id
 i10-20020adfefca000000b002ce34c8044cmr6637846wrp.19.1678115333400; 
 Mon, 06 Mar 2023 07:08:53 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 r11-20020a5d494b000000b002c54c9bd71fsm9782018wrs.93.2023.03.06.07.08.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 07:08:52 -0800 (PST)
Message-ID: <3e3c97bc-973f-b0dc-a84b-39390adf26ad@linaro.org>
Date: Mon, 6 Mar 2023 16:08:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 34/70] target/ppc: Split out gen_vx_vmul10
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
References: <20230227054233.390271-1-richard.henderson@linaro.org>
 <20230227054233.390271-35-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230227054233.390271-35-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
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
> Move the body out of this large macro.
> Use tcg_constant_i64.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/ppc/translate/vmx-impl.c.inc | 95 +++++++++++++++--------------
>   1 file changed, 49 insertions(+), 46 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


