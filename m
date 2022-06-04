Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6720F53D705
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Jun 2022 15:27:15 +0200 (CEST)
Received: from localhost ([::1]:37318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nxToA-0005J1-ID
	for lists+qemu-devel@lfdr.de; Sat, 04 Jun 2022 09:27:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nxTmb-0004YC-PE
 for qemu-devel@nongnu.org; Sat, 04 Jun 2022 09:25:37 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:53983)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nxTma-0003r1-Ai
 for qemu-devel@nongnu.org; Sat, 04 Jun 2022 09:25:37 -0400
Received: by mail-pj1-x1031.google.com with SMTP id a10so9335052pju.3
 for <qemu-devel@nongnu.org>; Sat, 04 Jun 2022 06:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=B1sqSJAOhC0a36l8LDDLZWguA1FbCDmXRkALLxWapO4=;
 b=JsARKqvleWaT3Ch0jrKDslpttyEfqb7NiknNn9JDKefRgMJaPEfRqdFbeHiRZM03EL
 A8V9G9fc4ZLpSu31c10y5XiWsodp0Ww8oUxK44/TwCikB09aL10iUjZZv7W+C9fz2wvx
 VprdDfELiUmXJUnLDZTYSqfxswkUeHU7hEOG5dHzh8wO56XjwLxtA8BKpLMTfSzcHC/s
 +giunOqGR9lA/SJlgbbDP/4C80LT+GH+qXrWJAWoJafFFQ7hcjtgTx3H1y8plMzP5KTs
 fGCbDOqpY5azRqcJQvW23aPo3VrU9sHBT1qj5IySZmG6brsW1U+KaBi1NLiRTzaRoUgf
 7Jsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=B1sqSJAOhC0a36l8LDDLZWguA1FbCDmXRkALLxWapO4=;
 b=hXNGpJ9Wchvs3HlzyVkuRgzRDOeVXPOpykR449eSWXZpr8CsQ+5niXwojJVd9JVIrC
 ozzHjOr04fTYVQhrIbXA6KjXtwoYQm2PTl7bTcJ635VaMIieEWbeGI6rR4lWtRUs8ddN
 YhvZnU1yxdjytj20UzorVxdepiFQRbPH7FXO4LQqScd4Vl9UcpXfEvmGBJEXoLASVsTG
 V7FutDGa5sa9VQ1hlvle0G6kT1IiGxGVIxUzSyPrj80vyKoPxPxdUangCWpINYfSyQEV
 dFm4kwJavCS4Zdj8u3PMf68ee1LzN4JHpDQ7zg93hvnrFC2m5+rYD+B5z+ztDbwRMQhG
 0hYQ==
X-Gm-Message-State: AOAM531ZZEwnVlD+2GUQE+/aAYe/wUtpUMdLEbE0pkN2/JJLzjws7WBM
 wnY3dm/0yUuq/Ijxk0FVzBw=
X-Google-Smtp-Source: ABdhPJz/CfAaSUKrIult1a3rV8s+lpOJC/6hmzLYB/u6oiMnrXJI+2lSA0INO3fjosJWMzodIYPP3Q==
X-Received: by 2002:a17:90b:1e42:b0:1e6:8093:3fb6 with SMTP id
 pi2-20020a17090b1e4200b001e680933fb6mr15578576pjb.166.1654349134714; 
 Sat, 04 Jun 2022 06:25:34 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 ji20-20020a170903325400b0015e8d4eb2d1sm2999444plb.283.2022.06.04.06.25.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 04 Jun 2022 06:25:34 -0700 (PDT)
Message-ID: <31e6fb69-2b9a-ce15-bdf7-35758aef8665@amsat.org>
Date: Sat, 4 Jun 2022 15:25:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.1
Subject: Re: [PATCH] microvm: turn off io reservations for pcie root ports
Content-Language: en-US
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Sergio Lopez <slp@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>
References: <20220603085920.604323-1-kraxel@redhat.com>
In-Reply-To: <20220603085920.604323-1-kraxel@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 3/6/22 10:59, Gerd Hoffmann wrote:
> The pcie host bridge has no io window on microvm,
> so io reservations will not work.
> 
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>   hw/i386/microvm.c | 6 ++++++
>   1 file changed, 6 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

