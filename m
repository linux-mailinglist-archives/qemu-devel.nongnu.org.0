Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3812C3240E6
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 16:42:14 +0100 (CET)
Received: from localhost ([::1]:60068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEwIn-0002WT-7I
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 10:42:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lEwGt-0001Oh-LM
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 10:40:16 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:39313)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lEwGo-0003PA-Uo
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 10:40:15 -0500
Received: by mail-pl1-x62b.google.com with SMTP id k22so1410044pll.6
 for <qemu-devel@nongnu.org>; Wed, 24 Feb 2021 07:40:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=J4bnZAdQftAfJ26kYuwrdE5S9W5LqUVn/hzhaghzMEE=;
 b=OdTt3CLD6l9vA7Z7QMsmtBad7pSOewcp+AfYeG26qly+ZB5p2vJ2iIUJudjWZ4OSHw
 6NckfSYZ7Cb/8XKsQEURanEWWij4Ce1THd372KFgwRaKCbVwvc+6vpse3fmIr3ZngnQr
 F0m9MlF7nB5o9hcDAL8CBIzW3UkDJzmrgN7QuUefHgpuCZgbjc8fk/0U6R9YLBN4UepV
 XMzUFwTxEiVUOWru2aFWOw2V+g4eWp5D8XlGPH1MiA+vRk7P8QWrPYB5PePsAoMxTyeG
 ZGFb2WQs7EgZvq855FL70ISmk8WnPExbpN8daKw0C6Rxe4BuAwLund3XCRwDXW+fikFc
 JiEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=J4bnZAdQftAfJ26kYuwrdE5S9W5LqUVn/hzhaghzMEE=;
 b=lB5fQY7mqnttaAPX3tIPL+6T8f1kFEOH4Ury0nH1ShJI+mHvDhzcYKw0hDqbiIpJAO
 zivt0mcIk2vmQPRrVdPevaN6gPIyGU3QJqPpCS5uHHwQyqDJ9GTOL8P+E4KFc0sql+y3
 QTef0gUrleM/YEfkZMMwyorrjR1WImCHlWvaWSifWa2uq9jdWZGuFdYxxOCSYFvErCC7
 9hE31FJdlgJBJXoM74U+eZakjBKucLcR5yYgMRAagT7rlvC+349KWcsEadCpz9Or0IsA
 u0ndsNceZxvrPJLeCJwHNrjvPmKBSLjCwJ5t4nNhDXsJITdtW5zVYz53yxWbygSN3OnE
 7CZQ==
X-Gm-Message-State: AOAM530RN+me4ChQEYUCDt2UFh3LGQb173RzIwij6ir4EpTzeRVBeUS/
 JXgExzEbdeAun9uz2MPyET0PHg==
X-Google-Smtp-Source: ABdhPJxAc2ipL86i2fpsbAFV3W9cqC5Y6ArEymdQg2XVFQONPNrCg/0JG2pluvwuBF4GnvOR36idNA==
X-Received: by 2002:a17:90a:c84:: with SMTP id
 v4mr5222336pja.228.1614181208770; 
 Wed, 24 Feb 2021 07:40:08 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id 8sm3175300pjl.55.2021.02.24.07.40.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Feb 2021 07:40:08 -0800 (PST)
Subject: Re: [PATCH v4 0/8] hw/sh4: Kconfig cleanups
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210222141514.2646278-1-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a8f2c5e0-8546-4d94-21a8-6416f4c68718@linaro.org>
Date: Wed, 24 Feb 2021 07:40:05 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210222141514.2646278-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, qemu-block@nongnu.org,
 Magnus Damm <magnus.damm@gmail.com>, Max Reitz <mreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/22/21 6:15 AM, Philippe Mathieu-Daudé wrote:
> Philippe Mathieu-Daudé (8):
>   hw/sh4: Add missing license
>   hw/sh4: Add missing Kconfig dependency on SH7750 for the R2D board
>   hw/intc: Introduce SH_INTC Kconfig entry
>   hw/char: Introduce SH_SCI Kconfig entry
>   hw/timer: Introduce SH_TIMER Kconfig entry
>   hw/block: Introduce TC58128 eeprom Kconfig entry
>   hw/pci-host: Introduce SH_PCI Kconfig entry
>   hw/sh4: Remove now unused CONFIG_SH4 from Kconfig

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

