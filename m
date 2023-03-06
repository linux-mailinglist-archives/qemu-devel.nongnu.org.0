Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5CE86AD2F2
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 00:43:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZKTU-0006Qb-GD; Mon, 06 Mar 2023 18:42:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZKTR-0006Q7-WA
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 18:42:34 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZKTQ-0007Qp-9A
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 18:42:33 -0500
Received: by mail-wm1-x32d.google.com with SMTP id k37so6797170wms.0
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 15:42:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678146150;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Pcr2TDQixdDkVyCnljuwppVqEZdavGl1dEjCJp4zzz4=;
 b=giE0wkucW84Th5wWaz2sCgMshT1LQcplyR+sGh5omdjAtYj6LrzLpS3gtRI6vsAUqd
 qW6ohIVVmOTxdiS88dbqc5IXeGbWfrklBUgSvMYim005ioLUQsDy8bshB9ndpd3pp5h2
 JiX22jdTu8Y6bJcaAHo3oUDXaxqh/JEHjCTEF2+fy5CpZcfodxDf+KcsVwOSRPvgl26q
 RKuFUQU4sIF9ZGE0tGUeVQMFtzr3c4VPg5fP8k1PXLf03kFdC6+kJ1ehd70eqfD5WTuy
 wJQLxpSNWakEKorb4mjMnqtwKhcq6eKVZbmRseUzExOdWXBibop7FDB6YVQ+KwFgZMJc
 xxuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678146150;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Pcr2TDQixdDkVyCnljuwppVqEZdavGl1dEjCJp4zzz4=;
 b=UKflZAALPESluP+HVlKojzrdqOYi5bweSPrHMI3z4X7k8DoYX103NH1AhF6lHkUpRl
 McqDBSviJJALdSljbylu6pKdUBSeep4SEJgJq/qNDGAzFj7Ho400u75/X8NSEH+KI35T
 RfoucRrzzVBIkvS/dNF3/aQVVB1bp2C6gEH7mMtDAilEjaKlSvnG4u6f2uIlJAYFPAYt
 9HufXJ1pkGiy6GPJwZ/J33NHWKNcZmEyjqmrg0wiHjQzeW24qeqTADwEK6GzsBydUdza
 wbT6CNkIOZJV8NfX+1BX/6Hu4uJITw+yZ8WyaE2FS+Ja81/krN3rcThOLfuz4UjcyGlA
 7t/w==
X-Gm-Message-State: AO0yUKWrmeugJN6ZIEdTYA7C8uhEgQkDbuBMozK4hQMUyav+HRGrCh62
 ZGLZS04rmZ4UBw1vXAcx/4C0gA==
X-Google-Smtp-Source: AK7set+5TCBViKST4b+6SOxSa7LXqsqoUhaeg/SDN4xohsxOB8OOeY5BM0NTmjQXJIBMzNycrvmElw==
X-Received: by 2002:a05:600c:19d2:b0:3eb:37ce:4c38 with SMTP id
 u18-20020a05600c19d200b003eb37ce4c38mr11090984wmq.3.1678146150265; 
 Mon, 06 Mar 2023 15:42:30 -0800 (PST)
Received: from [192.168.1.115] (138.red-88-29-178.dynamicip.rima-tde.net.
 [88.29.178.138]) by smtp.gmail.com with ESMTPSA id
 k7-20020a05600c080700b003e21ba8684dsm11518913wmp.26.2023.03.06.15.42.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 15:42:29 -0800 (PST)
Message-ID: <5ea77e0f-57dc-96a7-c30b-0fdf84dbd23c@linaro.org>
Date: Tue, 7 Mar 2023 00:42:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH] target/hexagon/idef-parser: Elide mov in gen_pred_assign
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: Taylor Simpson <tsimpson@quicinc.com>
References: <20230306225724.2105263-1-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230306225724.2105263-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
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

On 6/3/23 23:57, Richard Henderson wrote:
> Merge mov with andi.
> 
> Suggested-by: Taylor Simpson <tsimpson@quicinc.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/hexagon/idef-parser/parser-helpers.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


