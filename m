Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50C0551D011
	for <lists+qemu-devel@lfdr.de>; Fri,  6 May 2022 06:22:18 +0200 (CEST)
Received: from localhost ([::1]:42506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmpTt-0001oY-F3
	for lists+qemu-devel@lfdr.de; Fri, 06 May 2022 00:22:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nmpSN-0000PN-56
 for qemu-devel@nongnu.org; Fri, 06 May 2022 00:20:43 -0400
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329]:38639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nmpSL-0007n6-JV
 for qemu-devel@nongnu.org; Fri, 06 May 2022 00:20:42 -0400
Received: by mail-ot1-x329.google.com with SMTP id
 88-20020a9d0ee1000000b005d0ae4e126fso4246565otj.5
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 21:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=ps8kuoJ6sZhZ1ENLhtp81XmoJFskv/1/XID2f1Wybu0=;
 b=LQ9fAGfkGNIBeGREuORZUPdItDBjstXtbS5PIHPrtMfqI/PLNVITs/KS/p3Pa0bDQ0
 few0knc7Ge0Jbv3yH/PBfat1X/QNWwwv/7BlCcDhl1ZzHUXNz8f/+BjM9k9TsTPobhgj
 r3tslGo0etC3swfa9LtSTZeQ6hxHZ5UUww956yDubMyj5bAYXaZPiB110IRo5m0CFwDv
 VHeWAa/H6e9S+J4O29GwjikwYbEiSaQnkHGPaWfC8imPzI3Ofn86x+XfxLU+XWBZSIyC
 1CrpARkGISM2U2YvMSCq0lUT+cnzt8qVIr2iZcCstVb3mN0FSnS+0h33Zz/ygX4zb9BY
 xODQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ps8kuoJ6sZhZ1ENLhtp81XmoJFskv/1/XID2f1Wybu0=;
 b=xGnTiz7u228NqI5wVtuHu3VkQY3IL2mg39ttTKuTCr/aEwacDhhSuXjJu4x0ak8E90
 XJruU36GginYufLoeHtQYiL93AWGBQDsWPH6EU+8r9y6PDJeopSJxkf234vMUGbtnSKF
 iENVOYBpxTmiDbrbsKQfRaG/2SWEublRDbBXPca85DFVZtxqTZBRXJ1u+0ZLDid1vJfN
 NRrFr/w05+Ezn0ZqtHUf0SoPSyZ4ZgIcfyYl9TQ8YcKSCOfI79TLLBNE4C+GPPwa+zHe
 ZbRmZyctaP+vX8BPuaRb9pDgXepcIMxEdAzlKmpTncH24OSyn3HYUe9YHEzIvAprmkZQ
 L+MQ==
X-Gm-Message-State: AOAM533PlvHMK5jwKLZRpy+l1mTNwQooxlSuststn7wSNOe3rsUfFiyK
 yNWoLivfyfS5N/yy81E4rznifA==
X-Google-Smtp-Source: ABdhPJywZJ/41nypSSOVSGIKr3a9PdNY9dKMIvSRdht+M+D+wVsSIi0dKZz3JwP+pXwfCgu18DDFQg==
X-Received: by 2002:a9d:66d4:0:b0:606:501a:6bae with SMTP id
 t20-20020a9d66d4000000b00606501a6baemr461584otm.324.1651810840302; 
 Thu, 05 May 2022 21:20:40 -0700 (PDT)
Received: from [172.0.0.47] (c-98-200-150-82.hsd1.tx.comcast.net.
 [98.200.150.82]) by smtp.gmail.com with ESMTPSA id
 i39-20020a056870892700b000e9275a25b8sm1205986oao.32.2022.05.05.21.20.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 May 2022 21:20:39 -0700 (PDT)
Message-ID: <c4035d97-7444-1ba2-7d86-e7d2afa9d018@linaro.org>
Date: Thu, 5 May 2022 23:20:37 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 27/50] lasi: move LASIState and associated QOM
 structures to lasi.h
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, deller@gmx.de,
 qemu-devel@nongnu.org
References: <20220504092600.10048-1-mark.cave-ayland@ilande.co.uk>
 <20220504092600.10048-28-mark.cave-ayland@ilande.co.uk>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220504092600.10048-28-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::329;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x329.google.com
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
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Acked-by: Helge Deller <deller@gmx.de>
> ---
>   hw/hppa/lasi.c | 44 +-------------------------------------
>   hw/hppa/lasi.h | 58 ++++++++++++++++++++++++++++++++++++++++++++++++++
>   2 files changed, 59 insertions(+), 43 deletions(-)
>   create mode 100644 hw/hppa/lasi.h
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

