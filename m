Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC648300478
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 14:47:20 +0100 (CET)
Received: from localhost ([::1]:60842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2wmW-0005Dq-0Q
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 08:47:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l2wku-0004fh-6A
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 08:45:40 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:46032)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l2wks-0003QR-EZ
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 08:45:39 -0500
Received: by mail-ed1-x52a.google.com with SMTP id f1so6565295edr.12
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 05:45:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=424fcOvjzBQ/hXvku47KMrQ0ZZjMmZ3Vr2C3rYmxkgA=;
 b=HV65DEVMEKn2DdybAojpHNyR9ToVFZfSQXH/839T9ip5bibtuJx65HUJdKngcIQhDe
 yp9FpwCmCn57CMJ0IvssONZWMvkIFn5a/PrLr1nbTB5brtgtlklycxsncj/8dW20pJRN
 FoN1295kV55/rZuqpU55Jp8RwwlIwMutAeEubVto2MIceUTUvuyY5sSyHujaeBSiM6p5
 P5WmaPW7vzqvxb95ov8ocJbsBDd5uKtdx8jEuktre7Fq8da+VDkuqAVIkCiyhWbmCSe4
 wgkdbPy83oMNZ/XwS8U33RAbpmDO2cYyTm55rSIaRvIrrQSDSVfxbRy4V7ML9WbPoGYN
 HZBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:from:to:cc:references:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=424fcOvjzBQ/hXvku47KMrQ0ZZjMmZ3Vr2C3rYmxkgA=;
 b=J3QAGhS+TXmfFaFcgSSZklaxLxzM6mOHjJgAT4/WXllej4F0JM+cMaXnXNgfnXCRcZ
 NIMbzknBgVBU/i6537ep0wNPyVG7tM2zrlDb2B/0Lq7XwOtu1shRq74Td9IuG9EIn+7A
 I50DqP0BD/G/P9lvWil8Kdy/JrgwP9B6HVWMw/peoWujJX6N+sNOELi94+mtPkp/U0hz
 O4dptzsKG1KaXPJM4Kpdr04hoJDfdaIZq0tvpXdZFKt00bWgAQnNNjhRZpmqS6CYmLwL
 /TW4JEtKiqBPy/nVK/oWL08fmJf0BKeDL2TJkYF296e99/DFT+tsMBHa7ACrwiVDTF8G
 sP1Q==
X-Gm-Message-State: AOAM533hIMGqFYSJSj2o/uAuXAqvBTxnoN18FcL9gHXr6An1SWFnJYTq
 9Gup2Anda6+UpBqEJozQ2Q0=
X-Google-Smtp-Source: ABdhPJxCvnEwo3n9oK4gddMUiDP9DYFZ/pQImpB1cOXBVbG83ToDYErSsjAxm2xw11rLGHo9z93Cdw==
X-Received: by 2002:aa7:cdc7:: with SMTP id h7mr3328267edw.353.1611323136778; 
 Fri, 22 Jan 2021 05:45:36 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id h12sm5106785edb.16.2021.01.22.05.45.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Jan 2021 05:45:35 -0800 (PST)
Subject: Re: [PATCH] hw/mips: loongson3: Drop 'struct MemmapEntry'
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: Bin Meng <bmeng.cn@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Huacai Chen <chenhuacai@kernel.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-devel@nongnu.org
References: <20210122122404.11970-1-bmeng.cn@gmail.com>
 <3ebc284a-71d0-2a0a-84e2-462c4b7b9b7f@amsat.org>
Message-ID: <3b12e549-748e-9cfd-b7b8-e4a85564dffd@amsat.org>
Date: Fri, 22 Jan 2021 14:45:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <3ebc284a-71d0-2a0a-84e2-462c4b7b9b7f@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.221,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Bin Meng <bin.meng@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/22/21 2:37 PM, Philippe Mathieu-Daudé wrote:
> On 1/22/21 1:24 PM, Bin Meng wrote:
>> From: Bin Meng <bin.meng@windriver.com>
>>
>> There is already a MemMapEntry type defined in hwaddr.h. Let's drop
>> the loongson3 defined `struct MemmapEntry` and use the existing one.
> 
> Not really... based on 0e324626306:
> 
> $ git grep MemmapEntry origin/master -- include
> $

OK I understood, you replaced MemmapEntry by MemMapEntry which
is written slightly differently.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Thanks!

