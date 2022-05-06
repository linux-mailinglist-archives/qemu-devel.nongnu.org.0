Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4647451D00D
	for <lists+qemu-devel@lfdr.de>; Fri,  6 May 2022 06:21:14 +0200 (CEST)
Received: from localhost ([::1]:40288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmpSr-0000Lq-D9
	for lists+qemu-devel@lfdr.de; Fri, 06 May 2022 00:21:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nmpRX-0007zK-Qh
 for qemu-devel@nongnu.org; Fri, 06 May 2022 00:19:51 -0400
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231]:37494)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nmpRS-0007YF-Lr
 for qemu-devel@nongnu.org; Fri, 06 May 2022 00:19:51 -0400
Received: by mail-oi1-x231.google.com with SMTP id r1so6419607oie.4
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 21:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=h3Jy6e317gtqmCnGBNjPkfDs0us0qgqJnh1aOUYYv/s=;
 b=e91g1U8umJ6oIg7c7724Oy1yRZ5XiucGB8IEzDgqYhWzhqe9aaAk1U7deGOR+VDcPy
 WGG+pdwhT6BiMTgIFVwldbGL3w9ZDJhH0SXJbdP1AU8DroEf+73cwjfuWB9/7srs64g6
 VslqGvJPSJWyaaZSfwtqHe0x8NomNdm/7DTdiFj52bhR/2rTe9QW4NpTa6qbYnTQ9SqL
 +6Gmsw3kCCxdGX5LCnbBz4+o4FuWxrTenxncoZ7/zTDbtskqcJxRwxpGGPrpeSdUtcrY
 eP+3VRir6JFXZ4xOGDR7+35gTaRTsmdfi8V76RsaxrZDHR1KGlMrr3Gjgs8fvXLCMvXX
 UsKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=h3Jy6e317gtqmCnGBNjPkfDs0us0qgqJnh1aOUYYv/s=;
 b=SIuIacLKxrXzD07Aqh9StHfbqACIL+KONkYeFeiqbmTbuklmEm7hPjl0Euag2vzzwW
 SQHDsKe6S/eFP1M5Hs14jd3Cs7OaylwOnFtEWM2TnZNo3HYt7OJkmoaexqNi+5h+qkbA
 NB0uD4COmKbWCfrVGdO1W7m9LuBPHf9Xe0TwXsUtZ5nQOs6OvjaTWP8EtOTHH9nqbpR4
 x+GOtjStR37giaWAPHqsbYLZGkHlIu5oYZHe8bcQaa3ztNNch6aS0NJ8ZjAvenYfeD79
 7k95bvOvP/BnOt/rNQDjgd78WQ53cMwy7BVJ37u/bIaH0q4eMZJWjhrz6yHO/YfjWv/A
 kmaQ==
X-Gm-Message-State: AOAM533mG6qq+/ltpq2Juf6EceDTNMeiP52ys9TgodMOMXOKP5fcatTC
 VXfYqRzP1HATBj16BXM4neDIfw==
X-Google-Smtp-Source: ABdhPJy3aq/Aygoe626wyXbW2SJ2a4AX6Yo/hXqdpusouGV7YWQ9HTyXJsbCsdiQZSHGPiam1fa8lg==
X-Received: by 2002:a05:6808:238d:b0:324:fa65:e8b1 with SMTP id
 bp13-20020a056808238d00b00324fa65e8b1mr675306oib.203.1651810785564; 
 Thu, 05 May 2022 21:19:45 -0700 (PDT)
Received: from [172.0.0.47] (c-98-200-150-82.hsd1.tx.comcast.net.
 [98.200.150.82]) by smtp.gmail.com with ESMTPSA id
 n4-20020a056870240400b000eba4901e57sm1150447oap.17.2022.05.05.21.19.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 May 2022 21:19:44 -0700 (PDT)
Message-ID: <81f1ffa8-5cbe-433e-f2fb-f8ba9404707f@linaro.org>
Date: Thu, 5 May 2022 23:19:42 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 26/50] lasi: move initialisation of iar and rtc to new
 lasi_reset() function
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, deller@gmx.de,
 qemu-devel@nongnu.org
References: <20220504092600.10048-1-mark.cave-ayland@ilande.co.uk>
 <20220504092600.10048-27-mark.cave-ayland@ilande.co.uk>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220504092600.10048-27-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::231;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x231.google.com
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

On 5/4/22 04:25, Mark Cave-Ayland wrote:
> Signed-off-by: Mark Cave-Ayland<mark.cave-ayland@ilande.co.uk>
> Acked-by: Helge Deller<deller@gmx.de>
> ---
>   hw/hppa/lasi.c | 18 ++++++++++++------
>   1 file changed, 12 insertions(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r!

