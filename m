Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EACD1662BBC
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 17:53:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEvNV-0001yz-LE; Mon, 09 Jan 2023 11:52:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEvNU-0001yM-9U
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 11:52:04 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEvNS-00036r-Db
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 11:52:03 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 j16-20020a05600c1c1000b003d9ef8c274bso3091036wms.0
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 08:52:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GHzJK9zbynCJo9joOAAMka14WE4lQDYfnAxAL9wCQAk=;
 b=irkSYWu2W3nuo8CmAjRDWJdmV6O7r1of0ehiA4eh5Plj80NB4H5FkD2aBHilAZ7/gy
 Evd/G1VfgrFpxwZy2OiTxSDvm34GdAZ3rjsMFUU4dW3WXwwtUUfY431nz7ldnBEsVYhB
 nld4+ZItnRZZ/TZb0qzHEf95FoL0i15zC0nVhnkkzifbxekXTRj+sT5d36t6RD+ZXUIa
 o7+jRRWmhGDrWIvbcAwu6GjkWKd5gndW6AEJkmqNmyRl77hW83ZU1QJ0W6/YkvbxR0B0
 eZ4Njy7vf2iEIqm7xas87cVWivqSTxM5b/FKKVFkFhnUNF0DrHTQBhRl9VL8W2Whl7vM
 SCiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GHzJK9zbynCJo9joOAAMka14WE4lQDYfnAxAL9wCQAk=;
 b=JuHQmuwIIgWBmc9aA17jG9TAGU6ykY8eknKT93qbamShL2hYIgvy3TkeLOhVMSNQ2H
 EXY2D0C+AI8XAHWtXiQfGV2SG4zfeQfF8HRQweECMMEDzAnXhTB/R977fR6EO1ScG/vM
 Q985NjVBrkVnAZ68hs6SjrT1ZBpRV9koeF3D2lF28N+jfCefzH27X1EFODmVlRVoKJSB
 IbohMGSlaLkVieWZNqwx7gGdhdH3y5J34xEE6fROAnfktCf7CqUkY8Fh3LpRj6Kv6v3x
 /JzhMQley7Kym8xJu0Dc8NuBU4ci2YhPP4rxGFVulMSzQJQb4BvcydVgrb9TP1SPPjAw
 XX/g==
X-Gm-Message-State: AFqh2koIQxnTJGrpBJ9PuuEyYZrZW+QTCG+x35S6Nh5XWcAsNr1Wpfd3
 Fl0qPJCd1i4eTmLAe1ojsX/1tg==
X-Google-Smtp-Source: AMrXdXuK19rm97lni0vhx78s22HHFiyS23QmL+xwGZ42AZXbHbgQ9WsNcdcA1YOrEAEVjjaN+vhGXA==
X-Received: by 2002:a05:600c:34d1:b0:3d7:72e3:f437 with SMTP id
 d17-20020a05600c34d100b003d772e3f437mr47514010wmq.21.1673283120779; 
 Mon, 09 Jan 2023 08:52:00 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 bj27-20020a0560001e1b00b0023659925b2asm9265627wrb.51.2023.01.09.08.51.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Jan 2023 08:52:00 -0800 (PST)
Message-ID: <9274f53e-1cc8-7d49-95d4-a128fcc1f997@linaro.org>
Date: Mon, 9 Jan 2023 17:51:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 1/5] hw/ppc/sam460ex: Remove unreachable code calling
 pflash_cfi01_register()
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Aurelien Jarno <aurelien@aurel32.net>, Jiaxun Yang
 <jiaxun.yang@flygoat.com>, Magnus Damm <magnus.damm@gmail.com>,
 qemu-ppc@nongnu.org, BALATON Zoltan <balaton@eik.bme.hu>
References: <20230109120154.2868-1-philmd@linaro.org>
 <20230109120154.2868-2-philmd@linaro.org>
 <DD08389D-315E-4C44-BD39-020BC54B7337@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <DD08389D-315E-4C44-BD39-020BC54B7337@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
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

On 9/1/23 17:42, Bernhard Beschow wrote:
> Am 9. Januar 2023 12:01:50 UTC schrieb "Philippe Mathieu-Daudé" <philmd@linaro.org>:
>> Since its QOM'ification in commit 368a354f02 ("pflash_cfi0x:
>> QOMified") the pflash_cfi01_register() function does not fail.
>>
>> This call was later converted with a script to use &error_fatal,
>> still unable to fail. Remove the unreachable code.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>> hw/ppc/sam460ex.c | 12 ++++--------
>> 1 file changed, 4 insertions(+), 8 deletions(-)
> 
> It looks like there is more: https://lists.nongnu.org/archive/html/qemu-devel/2022-10/msg02491.html
Doh, my short-term memory scares me :\

