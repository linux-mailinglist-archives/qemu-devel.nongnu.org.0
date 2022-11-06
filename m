Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A1E361E51C
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Nov 2022 18:53:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orjoq-0004dz-WE; Sun, 06 Nov 2022 12:52:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1orjoh-0004YO-Kb
 for qemu-devel@nongnu.org; Sun, 06 Nov 2022 12:52:20 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1orjof-0002H8-Kf
 for qemu-devel@nongnu.org; Sun, 06 Nov 2022 12:52:19 -0500
Received: by mail-wr1-x42a.google.com with SMTP id w14so13275393wru.8
 for <qemu-devel@nongnu.org>; Sun, 06 Nov 2022 09:52:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VupFBkioVC6XY6vST0axQKITtD5iIyIbH+V3PZYtTJI=;
 b=GTjsiQQFkV7INvN1tpBFORsXRsOvLexqzmIv1lvU3mqvML3YpSB53b8SugBz33V9WQ
 L4zb/+JLk4wgwA6B0d6KTFE+pqwu53ENSXxKpHdLFJYsVftmYKqZBXhYixoecgbrlePn
 d5kSngVC0F56qGElHDgnLg5T9C94SG//Fkx53PFqLdCyZTHf/gxIQL93JFpUVbqI9cL1
 ABs9x8HMTarC6k13aJbpu5AYbrEdBLaQZ6pJd4FLho+qCAAdPlVtDgE9MQWE2xeeCV1I
 WozoaVHt2zBmlad7CzAu6HmCGilLrVjUx3RO7MyFiAPv5KPceq/0NzukrHIz+T6MeIZ+
 qMRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VupFBkioVC6XY6vST0axQKITtD5iIyIbH+V3PZYtTJI=;
 b=1YpQcKWqdEeOtuUU7eg1L6F/Yu+UDov+g7xZGsDzwZVa0K+rmhJtSCDqOh9Us846yt
 R08NNgENwDEzUU+u8uX7pBzo7vcQWgV1BieSk5nE9QInQdKIMy0oFgmDmCFAH8JK/rxN
 jjzpRjbV4FGEsblLiqyo8h/fxi9ifnfOhTW8Xa9/qGqor+9i2j4wHLwCpsdPqNilE0ot
 Wf9vFyuRHi0nyZAiE4bgwpmntBhJHC03Vpb3gaMi5S7Q48eQc9hl0LwUTTneD0EMgWz7
 7PLr3efKaviQA3wJgrWYNNWKfvXVqgT2r+41aMFo4OqBUB9QxboXIAAm0V2PlDkLk9Nc
 qXLg==
X-Gm-Message-State: ACrzQf2kKZSxTTEloKw2AB/J0U5NYz8+A5ibati7uY1XlI4EKlpJ1gkv
 FYEfZ/elbhjUMXLFZIBtVc4VQw==
X-Google-Smtp-Source: AMsMyM68MQBOFEzsGn73NaU6LE8yH0pn5/54fQZDbyE45uyHIFCKvWzpenwZy3RsI7P1U4cYMRfu2A==
X-Received: by 2002:adf:e19e:0:b0:22e:64de:39fa with SMTP id
 az30-20020adfe19e000000b0022e64de39famr27824795wrb.369.1667757135838; 
 Sun, 06 Nov 2022 09:52:15 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 o34-20020a05600c512200b003cf894dbc4fsm6185371wms.25.2022.11.06.09.52.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 06 Nov 2022 09:52:15 -0800 (PST)
Message-ID: <c0e21adc-e006-720b-ddba-edf6a66387f2@linaro.org>
Date: Sun, 6 Nov 2022 18:52:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [RESEND PATCH 3/6] disas/nanomips: Split out read_u16
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: sw@weilnetz.de
References: <20221106023735.5277-1-richard.henderson@linaro.org>
 <20221106023735.5277-4-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221106023735.5277-4-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
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

On 6/11/22 03:37, Richard Henderson wrote:
> Split out a helper function for reading a uint16_t
> with the correct endianness.

Eh I was thinking about that when reviewing the previous patch :)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   disas/nanomips.c | 48 +++++++++++++++++++-----------------------------
>   1 file changed, 19 insertions(+), 29 deletions(-)


