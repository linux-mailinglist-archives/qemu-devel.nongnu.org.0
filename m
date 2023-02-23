Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03E1A6A12D3
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 23:29:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVK5T-0008Ob-PN; Thu, 23 Feb 2023 17:29:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVK5P-0008OP-8W
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 17:29:12 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVK5N-0001Nr-Md
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 17:29:11 -0500
Received: by mail-wm1-x335.google.com with SMTP id p26so10168827wmc.4
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 14:29:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xGYxwGO7s+vHrsaQAmO/0RQDkx9a/YtmqhHcN+6xj8Y=;
 b=dtxrwXioOxCATJTwhQh064Mmeu3MkDw4cnKUbMYacOg2USKbzLM7cl/IsTPi4OSDrf
 r32KrpZUMltKtZCrQ4yhirCzdcCXcyWzzBdzJnc5sjW4mAknEoDYBJpQBBZj53wX9oSQ
 d3f2dWgtER9tVEZbiS/MV15jW2/a7KguJB4UdCg9WzI7btUeiAyV1o5mGXh+GHIbuBOT
 /8zyuv6DDEEpdwKTdRY18/FpZq8P7tUuu2ZqeKKJDaAN2oNaaO19PBWBiHqZfifceCob
 oIN6j+hzZdUmuEWVWS0diYWxYLn3AjILtV4Ue6OdxzmSiEoiIo4hCDszpYMGbzd5fWtA
 3AOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xGYxwGO7s+vHrsaQAmO/0RQDkx9a/YtmqhHcN+6xj8Y=;
 b=IdIXwTxpCRt3K5bE/yG17vGMoWAViKnKtC6d/SEmAPUkedCzLOtRQ8PwOQYIITSmz6
 BhdAMl5zqgAwXcFvrMUr/hQytukRziysrlr4IJNA5jLxKau06F1Wp6MvM62IHHy+bkDr
 hXMqaqOyzWe2bdBWgpzI9GDvIPbbOHu+GVgRGYAgddoP41CN/pp6EbGCv0vCMe0BBNMJ
 VtskL0yCUi5IObDut8CQiKa2ocYpi0KDI96iv8COdTCiz+wBknGtffRZ+n0dm0r7g6EL
 YyjPtg0jXXyEx1aEh3LDkAiZYJJTnVtgNG+ym3rzHnDCwdXRsSvOfy1H2UsbA0lTrs9J
 epGQ==
X-Gm-Message-State: AO0yUKXJsZqGrLs8VezHYcITq08MQlWGroXRSZHU9Iiucajlsupv84BS
 QInhutw6PYByluR6d3V7pVKcYQ==
X-Google-Smtp-Source: AK7set9IRhFIyiFsIPpep+YLGNyQlDFhSwzi+WJt9q/W14RW0sXDtKeX46oISohg+wYQJo137rOWIg==
X-Received: by 2002:a05:600c:6015:b0:3ea:f883:4f5 with SMTP id
 az21-20020a05600c601500b003eaf88304f5mr457152wmb.17.1677191347753; 
 Thu, 23 Feb 2023 14:29:07 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 u9-20020a05600c210900b003e2243cfe15sm613564wml.39.2023.02.23.14.29.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Feb 2023 14:29:07 -0800 (PST)
Message-ID: <08510beb-e6a7-30af-e8c5-1fe23500ed81@linaro.org>
Date: Thu, 23 Feb 2023 23:29:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v3 1/5] dump: Include missing "cpu.h" header for
 tswap32/tswap64() declarations
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Anton Johansson <anjo@rev.ng>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Janosch Frank <frankja@linux.ibm.com>, Steffen Eiden <seiden@linux.ibm.com>
References: <20221216215519.5522-1-philmd@linaro.org>
 <20221216215519.5522-2-philmd@linaro.org>
 <039803d2-24aa-e22f-a154-7ca07e781852@linaro.org>
 <1562d9eb-abfd-ed25-e169-404a619df47c@linaro.org>
 <4727f0a2-680b-cff4-16ad-f7904f1cd086@linaro.org>
 <c6cb2c08-65c1-5cde-f67e-9e073e01e222@linaro.org>
 <38e32f1f-b268-6dba-a684-1987962fc136@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <38e32f1f-b268-6dba-a684-1987962fc136@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
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

On 23/2/23 22:43, Richard Henderson wrote:
> On 2/23/23 11:19, Philippe Mathieu-Daudé wrote:
>> This file uses tswap() 4 times in the same function: get_note_sizes(),
>> so I could extract it to a dump-target.c unit.
>> I have no clue what that file is for, but this particularity is odd.
> 
> All uses of tswap in that file are wrong, and should be using 
> cpu_to_dumpN, which correctly tests the endianness of the output.

Yes! Thank you :)


