Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E3A66AC2ED
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 15:18:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZBfG-0001IO-U4; Mon, 06 Mar 2023 09:18:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZBfC-0001Et-Oy
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 09:18:06 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZBfA-0001h3-EI
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 09:18:06 -0500
Received: by mail-wr1-x42d.google.com with SMTP id l1so8934267wry.12
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 06:18:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678112283;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=O9vuSGrgX+yoQzwoRqKUNQvM6R0Y4d2jIW7l9KHayos=;
 b=P7XBvOQLKeOWUVy3aTgbV5xUKie21SrtVB0G7szU+AppCqwDvSSp2HtV0v/Zzb8l27
 UkmIFv0VGQ4b9lKDo9pXK28eQrx4rZ0iiTkl9KHbDuhnScgmQf8feS3Vv7jPHck2vBEJ
 15jHQwL5uacMPz5vXbEHwaYn/G9sjzpELGoR3P+gXifezE0IppUYk3C8EwBGYWuSmivE
 ccMt7NLpjwjqjTCRVG10qkzYASKW3YMH4+c5yIzdJlfMPgaJhw4bHwREQMP6HCVQ8tRg
 6dThWDSAtUrxdvJ3yYSnakiMiNUotv/Xcugi83CXyEAGdYI1vTSA6xB3rTXvqwjgWsgr
 WeHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678112283;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=O9vuSGrgX+yoQzwoRqKUNQvM6R0Y4d2jIW7l9KHayos=;
 b=BY5tWTyHVsVfRUMT/m5xVViiAD+ubiOBz4sp6npuB/YfI9MAOWsGq0I2qo34oURZvU
 W+xH4u9mz7Ms2/ioQZZzr5wVXhkkmiyjmCwN02wjCZvqVLMHLelERewoFI0aVrdRiJBs
 Q+j1WNcrwBWfpR2Hl1bio70sCgsFHGIZBeSAFQVLPTMruk9diSL84Lf99OXgv5DBrRmM
 AWbK/s8DCDZZTBOpffcBQ187HS1xpHf45qGsw0wTiRnDKwtk7kpU7BMpbW/bm2bFgM35
 1Cag0CWKPwGKR1f9UVH3ybO3FTbgGfjzKi5x/qXLeCg/R2DzoViV0OQCrGVhTuXGff0n
 8Tnw==
X-Gm-Message-State: AO0yUKUgCC4J6Wv+uz89ebU7zMbRh3q+kXGrUpFa1PrxEf6BLcNUZnyr
 WLW5Sklg4VUuNkYM04OV+ivxIg==
X-Google-Smtp-Source: AK7set/YPmtRp1uWmBq3+hNToshMrochkalbho74DiaJ6/oPCLXZsYnZqq2BcHeUs3AykzId9AJo2A==
X-Received: by 2002:a5d:664e:0:b0:2c5:3ccf:e99a with SMTP id
 f14-20020a5d664e000000b002c53ccfe99amr6927647wrw.6.1678112282724; 
 Mon, 06 Mar 2023 06:18:02 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 k4-20020adfd844000000b002c57384dfe0sm10135231wrl.113.2023.03.06.06.18.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 06:18:02 -0800 (PST)
Message-ID: <10637298-4d36-709a-6b73-4281f1dcfd28@linaro.org>
Date: Mon, 6 Mar 2023 15:18:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 48/70] target/rx: Avoid tcg_const_i32 when new temp needed
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
References: <20230227054233.390271-1-richard.henderson@linaro.org>
 <20230227054233.390271-49-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230227054233.390271-49-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
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
> These three cases use a constant as first input, and
> then overwrite the temp in the output.  Separate them.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/rx/translate.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


