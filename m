Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E13A36D9A3
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 16:35:40 +0200 (CEST)
Received: from localhost ([::1]:42200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lblHu-0003yX-U8
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 10:35:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <konrad@adacore.com>)
 id 1lblGb-0003Tx-0t
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 10:34:17 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:41551)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <konrad@adacore.com>)
 id 1lblGZ-0004zm-4y
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 10:34:16 -0400
Received: by mail-wr1-x42c.google.com with SMTP id d11so5471105wrw.8
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 07:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=adacore-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=eBECi/HU7Jao6KRVgVGTbBBKtonIsfxHXY5ads+cw2I=;
 b=lKv0v241FKswt7X+sNlcy/r6ZiS1q24E2obG8WqM3mDIptjuEjU118WJs7C3zzn5OZ
 OKiEWW7+J6w5geJi8/PVnFEpK5Z58zDOCN6fjeworKV8p437SPSYbVSFnMrVSrwYIZC2
 bA3tikToHj0UiLNIO5Qrvz9Xie52d8ybc8vm+fpdz4sks4kq7mdkr797EuHP3KprtUQl
 hS30fTuC7WCyUn5ZbAnA0lYvLFsWvt4T1CXc4MB9WcEgy8Bcxjm4JyO3ytu6KIYdECpY
 9ILd9RR5KL2ZPrOn9Ihgf5EzNPoyYrbDdMvIO9G8IXhW7i4M9s5nxAoSffbuWemUUcQk
 Y2Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=eBECi/HU7Jao6KRVgVGTbBBKtonIsfxHXY5ads+cw2I=;
 b=qromzCEcat3iyoKqFzp+0jJ8mmkb+iJr5ti9fSuQwXkoXeHm4/rr233b9fCDDLHpaB
 Z/vLnAQ0Pg/m6rQjsdmDJYw6Eum62avWLcGLkcfwijZAt5A7tcpDDiQKVmr0I/uB67WZ
 T72WskwlHRSYLEOIY86uoypiHbagNQyAbYaVQcY3J00vfvKrXTFKfjK70QLaEifhedb5
 aEw9wjAmBN/k+A1otzZZF/bVErywakN8+ms4bJo2Rkh7NlML4KwkMlaIj5+4tDRv7cXz
 hzqlovbx99Hc3Go5p3s/QGR32ExTcAIv9j/7vj0ezP97+6NY+nB66SiUAGQ37urfFUCF
 G6Dw==
X-Gm-Message-State: AOAM532cQQqtJCi76GvcvpUKNs71y0BTvisYVDbq8cIVK59kC8fYZPpj
 qcDEJNU84ib7CgiBd/NRwnCl8A==
X-Google-Smtp-Source: ABdhPJzzo69hawUo0TvvMUDGbfIcDZ58o9GY5O+99S0oil9M4PbpEoiC/uuxwvYqk7CI9Podk8XiHA==
X-Received: by 2002:a5d:6d0f:: with SMTP id e15mr37604823wrq.302.1619620453424; 
 Wed, 28 Apr 2021 07:34:13 -0700 (PDT)
Received: from localhost.localdomain
 (lfbn-tou-1-1482-80.w90-89.abo.wanadoo.fr. [90.89.5.80])
 by smtp.gmail.com with ESMTPSA id l12sm208078wrq.36.2021.04.28.07.34.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Apr 2021 07:34:12 -0700 (PDT)
Subject: Re: [PATCH v2 2/4] hw/sparc64: Remove unused "hw/char/serial.h" header
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210428141655.387430-1-f4bug@amsat.org>
 <20210428141655.387430-3-f4bug@amsat.org>
From: Fred Konrad <konrad@adacore.com>
Message-ID: <aa9aafaf-13b0-60a8-3445-22d0ee43a4e4@adacore.com>
Date: Wed, 28 Apr 2021 16:34:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210428141655.387430-3-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=konrad@adacore.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Richard Henderson <richard.henderson@linaro.org>,
 Fabien Chouteau <chouteau@adacore.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



Le 4/28/21 à 4:16 PM, Philippe Mathieu-Daudé a écrit :
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Reviewed-by: KONRAD Frederic <frederic.konrad@adacore.com>

> ---
>   hw/sparc64/sparc64.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/hw/sparc64/sparc64.c b/hw/sparc64/sparc64.c
> index e3f9219a101..cc0b9bd30d3 100644
> --- a/hw/sparc64/sparc64.c
> +++ b/hw/sparc64/sparc64.c
> @@ -26,7 +26,6 @@
>   #include "qemu/osdep.h"
>   #include "cpu.h"
>   #include "hw/boards.h"
> -#include "hw/char/serial.h"
>   #include "hw/sparc/sparc64.h"
>   #include "qemu/timer.h"
>   #include "sysemu/reset.h"
> 

