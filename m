Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ACEA510E4B
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 03:50:45 +0200 (CEST)
Received: from localhost ([::1]:49718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njWpI-00074v-BD
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 21:50:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njWoH-0006Or-EM
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 21:49:41 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:42836)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njWoF-0008UE-QH
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 21:49:41 -0400
Received: by mail-pg1-x530.google.com with SMTP id bg9so306571pgb.9
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 18:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=kkeFvaVemLxbqkHwjGYlF+QnVKQJjUG/3QnEaKmtGiw=;
 b=EgkcINkQP50yKloE3xRbpmXOFFwPO6qUndQjaVqI8tNOA5Yj9kiH741GxBUO0mRgZA
 +gJQ5zxfpWbtpM8IEduzkHzoq88f/XQbiJFrYps6XVEQkH02o9L2dT4GMLpu1nOVoVSe
 zeMPtkd5QF/udj6iGS2oYt74Wn8NWasqvLr4GaOqsp6rhz4fRm0kbYATnLjh9kHvJUWc
 ofdN9h3FZJbWxhUtMNeKII09Nn7uU0MGpgHed5f3dDaUoRnREJRXSjxQujDm9+dqfMBP
 brpU3yVa1b/4X7c1OnAey3+k+mvBT4LuRCIUUXfprdUTz/NPkjJL937hI2XYO6ZZVJmN
 /+Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=kkeFvaVemLxbqkHwjGYlF+QnVKQJjUG/3QnEaKmtGiw=;
 b=TnxjpFZXDXRzXrgNRJi9gwU1eL+2dEpnqG7Knt3qxGPaRDZmkAHzNhWKlgXQkqyKP1
 eMUrQUBzINUtoSCe7BS5F9UvBwec0GDggjgo+ZrVQf2qHjQSss/iE62BVgtYlQGIaR9k
 lg1Rnf2yBGr0d2+1TSK5Lqr0gw9oz/079oN72oro6+i+egIrzjjRqzJKAwYUrtajAJ/Z
 9dyFJBTQqz9nBCwEKUDhnPRAgU2q/IjFv/CPpINjA3m76chWS9K4OfixJRowkKCU+ypW
 2egRAvi3oUHGHdNlxXy4zESdtS8Ge9JVmE0L3eq4Dim1Yc/7DRkeFlOKXqGxFZaKwWVS
 r2xQ==
X-Gm-Message-State: AOAM5309bepUVmaEWToHPE+/4SGgBr52fKxmsoQqfiyYJiWmqD2onwLL
 D26RZSiYrVoIFuqzh8Y1S+JvZQ==
X-Google-Smtp-Source: ABdhPJyRkzp+5rE5HH4SJg9o1He/MuJVXp32BoQIZIHs34ploIL8egWCzbYSG/DesmLn3Bh7yjN8dA==
X-Received: by 2002:a65:6942:0:b0:378:9365:5963 with SMTP id
 w2-20020a656942000000b0037893655963mr21660229pgq.142.1651024178434; 
 Tue, 26 Apr 2022 18:49:38 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 w129-20020a628287000000b0050d4246fbedsm8227594pfd.187.2022.04.26.18.49.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Apr 2022 18:49:37 -0700 (PDT)
Message-ID: <aa14b042-68b1-8d6d-689c-c949a85ef311@linaro.org>
Date: Tue, 26 Apr 2022 18:49:36 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 31/43] hw/loongarch: Add LoongArch ipi interrupt
 support(IPI)
Content-Language: en-US
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
References: <20220425091027.2877892-1-yangxiaojuan@loongson.cn>
 <20220425091027.2877892-32-yangxiaojuan@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220425091027.2877892-32-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
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
Cc: mark.cave-ayland@ilande.co.uk, gaosong@loongson.cn
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/25/22 02:10, Xiaojuan Yang wrote:
> This patch realize the IPI interrupt controller.
> 
> Signed-off-by: Xiaojuan Yang<yangxiaojuan@loongson.cn>
> Signed-off-by: Song Gao<gaosong@loongson.cn>
> ---
>   MAINTAINERS                     |   2 +
>   hw/intc/Kconfig                 |   3 +
>   hw/intc/loongarch_ipi.c         | 166 ++++++++++++++++++++++++++++++++
>   hw/intc/meson.build             |   1 +
>   hw/intc/trace-events            |   4 +
>   hw/loongarch/Kconfig            |   1 +
>   include/hw/intc/loongarch_ipi.h |  50 ++++++++++
>   include/hw/loongarch/virt.h     |   2 +
>   8 files changed, 229 insertions(+)
>   create mode 100644 hw/intc/loongarch_ipi.c
>   create mode 100644 include/hw/intc/loongarch_ipi.h

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

