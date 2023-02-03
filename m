Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 343CD68A034
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 18:26:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNzoU-0002y3-SE; Fri, 03 Feb 2023 12:25:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pNzoQ-0002sb-Ro
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 12:25:23 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pNzoN-0005wp-0K
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 12:25:20 -0500
Received: by mail-wr1-x436.google.com with SMTP id q5so5333304wrv.0
 for <qemu-devel@nongnu.org>; Fri, 03 Feb 2023 09:25:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8tntFME1/Hp0v2W9N2VM8PlNfa5iknvK9mNeF/RndXY=;
 b=lhzKD2bAF5gbM9oZIIOWb9dz244KudK0SEeSxJDasXrBhmGigF4sQNRSugABvczhOC
 yGod9oXRoFJOU+OIQkOVO4VNgo+b1NpX0HmWX+QNmiWbNK/MEQ3V2uJ0eu0IZs8e0Xdo
 +E0+iTDaWBWQFHYhOjAmduuMjS8hmEnnyyboSIiQU4ijygCVj4QMPa5U5gOFu1lMomZq
 BdPPTHerfAPbY62FjY2rTh2OqE53xK/FA3EHMzkVmTR0OPayM2kgTK2KzBjBAB2uIukg
 ItD9tBlXNJFLWOBePGodzc71OEwpp7zGooL7Xmbi/rehkFpK1UWjQ+7GmQ8c5qMLQ7Hr
 T9pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8tntFME1/Hp0v2W9N2VM8PlNfa5iknvK9mNeF/RndXY=;
 b=Dkw6QCGquu412QeXDn4N639YWmUg80XplY4pp3KpWwCvd/SeHC8uAxDGBvMjbqp+IE
 T22lezQY4YgTtdwToqXOX/TuCOE5MPFoMWh70CpibONjxYr3l+K5O5QQ3/kly8HxZeIw
 86rNT7axZH+p6cBtJmrNtcY0wifm7jpbZypb3mKrB2ODNV8kxsTho6LsPs8+DZhP/fsN
 Y1+VUwKqaHwbJt/4f1I+SVDdtuSOxTUA9dAZy+tAtRgp4K2kXI267vBMOHu/uzrchIX/
 UcxuT49sgVEJTdL3OT4sBhdZFvGEA5Uc2HnyzoYbnn3RT/lhX6EdBZzbCIcgG2LNAEfd
 M5vw==
X-Gm-Message-State: AO0yUKV7V2T5CMWoA/9Iv/wBDFvp3h9/OL5bgs7LDOEIvA+x70I5NM2J
 eSJmfjmDgtlP+E+Mnq/BNnGfV+1TKw3nGMSV
X-Google-Smtp-Source: AK7set9jZGl1A9ch/Ghz2/9/gLdQW3PETolv22r49k5U3+YwX8TcMu4wKHX9rvHKI8AzYlv+caJP2g==
X-Received: by 2002:a5d:508a:0:b0:2bf:c58b:9cd2 with SMTP id
 a10-20020a5d508a000000b002bfc58b9cd2mr9141674wrt.65.1675445116970; 
 Fri, 03 Feb 2023 09:25:16 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 r10-20020adfdc8a000000b00289bdda07b7sm2469807wrj.92.2023.02.03.09.25.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Feb 2023 09:25:16 -0800 (PST)
Message-ID: <d38221c1-cc89-7161-3713-2b314a253b56@linaro.org>
Date: Fri, 3 Feb 2023 18:25:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH] tcg/aarch64: Fix patching of LDR in
 tb_target_set_jmp_target
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: Zenghui Yu <yuzenghui@huawei.com>
References: <20230203171858.3279252-1-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230203171858.3279252-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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

On 3/2/23 18:18, Richard Henderson wrote:
> 'offset' should be bits [23:5] of LDR instruction, rather than [4:0].
> 
> Fixes: d59d83a1c388 ("tcg/aarch64: Reorg goto_tb implementation")
> Reported-by: Zenghui Yu <yuzenghui@huawei.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/aarch64/tcg-target.c.inc | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Is it worth Cc'ing qemu-stable@ ?


