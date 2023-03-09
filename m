Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C779F6B20B0
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 10:53:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paCxO-0008Fw-Qp; Thu, 09 Mar 2023 04:53:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1paCxM-0008FH-DU
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 04:53:04 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1paCxK-0003Hn-2z
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 04:53:04 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 r19-20020a05600c459300b003eb3e2a5e7bso845377wmo.0
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 01:53:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678355580;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YBI8sgeM4WA0plSHEgCZ6EmJyAUFAzJWqPjPQpDW/mQ=;
 b=gET4HjWq8sjXlNz5ziBwfrrqT1EbJmW7XFHNIC6xLJg3poH35rDr7WeFoFfJlx61pF
 rNm+JmUncp7iTH26u/aSNqznWzwWlePfcnGoHHSdbABLtdP6kMYfMN+S5tMWw5da4pns
 kXH56PWtN2zoEc5XOKsvUovrAUZgVW6qSV+TUc8d1I0y3ZzCCUg1lhtJX2qNQuM72UZ8
 idAZureKRCXd2uVgO718QnxAJ3+vfblPyacuNadbI1Z6ubkmOWEQ39/tBFgRoVvt1Epc
 gc7BgWoUIJEhIJLxU5xNtrkyGkM7vpcUiJldk09bizyFw1xc0Amv+HFjtfmdc/SGDjss
 1jkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678355580;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YBI8sgeM4WA0plSHEgCZ6EmJyAUFAzJWqPjPQpDW/mQ=;
 b=hOMRzsE/kM2l0BlGsBjvVqASFHd1QijQSTOYpZudP2yYzEvH3+tGriXMQDWuswMyKy
 4BYKM1QeN4unozIdpVftHks+wt5I2SAtBBQeX26GkbF6TRaD3jJV/jCwHB2KML/6p1L7
 SxGSDKlRIKWwzmIofniwKp3bikIw6SDlbCOKWIXyAuJu3Uk9lWjQNXpAZ6EtZA8XMMlG
 h256oPq07dKo3hDNoo0tEPny+uZ7CBR7jurAiKYqGDMctuBhmwC+YmGOqFaOZfppEiM6
 A4m+I2GFd6Tu1LFanAM58neKARMKbLKCw0DuoHgkrmMz4Gl8To4IkUmaCvTTuGpuGjvy
 yPQw==
X-Gm-Message-State: AO0yUKUDdvHcRrHWVPinbM5lr5iQxzLe3XhsthyNlEBLukonJbI0P6tQ
 dZCSOvTEhfDkglD8xWoNOxlZwQ==
X-Google-Smtp-Source: AK7set9321nyxRkm9sI3iZLtQYTN6j1pOdvQ+7hYFcdjyh/2Vlkd/qTdpOPSERArqgfzm/vLRx9NMg==
X-Received: by 2002:a05:600c:198e:b0:3e2:1ef0:f585 with SMTP id
 t14-20020a05600c198e00b003e21ef0f585mr18504194wmq.2.1678355580625; 
 Thu, 09 Mar 2023 01:53:00 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 h18-20020a05600c351200b003dc42d48defsm2202206wmq.6.2023.03.09.01.52.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Mar 2023 01:53:00 -0800 (PST)
Message-ID: <0fb23f6a-7fc4-42bb-61c5-8a0667e4b02e@linaro.org>
Date: Thu, 9 Mar 2023 10:52:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v2 17/25] target/ppc: Avoid tcg_const_* in vsx-impl.c.inc
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 qemu-ppc@nongnu.org
References: <20230307183503.2512684-1-richard.henderson@linaro.org>
 <20230307183503.2512684-18-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230307183503.2512684-18-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
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

On 7/3/23 19:34, Richard Henderson wrote:
> All remaining uses are strictly read-only.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> Cc: Daniel Henrique Barboza <danielhb413@gmail.com>
> Cc: Cédric Le Goater <clg@kaod.org>
> Cc: David Gibson <david@gibson.dropbear.id.au>
> Cc: Greg Kurz <groug@kaod.org>
> Cc: qemu-ppc@nongnu.org
> ---
>   target/ppc/translate/vsx-impl.c.inc | 28 ++++++++++++++--------------
>   1 file changed, 14 insertions(+), 14 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


