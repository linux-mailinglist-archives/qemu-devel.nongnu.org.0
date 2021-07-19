Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 502A73CEF90
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 01:07:41 +0200 (CEST)
Received: from localhost ([::1]:41504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5cMO-0004VW-Dy
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 19:07:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m5cKx-00037s-3Q; Mon, 19 Jul 2021 19:06:11 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:45051)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m5cKv-0000uv-Fq; Mon, 19 Jul 2021 19:06:10 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 f10-20020a05600c4e8ab029023e8d74d693so916885wmq.3; 
 Mon, 19 Jul 2021 16:06:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1K1aT2xzeWWXq/tRXX2ZkYyvB7rrQYwbV3XokZvlDyA=;
 b=rT7yKx2fJ+Z4C4tPqM5aFGVRNqX9rPHZ7vGPV8aeBXEMtuHltfP4ZF1Byz2+Q6v+CH
 2SOEHcVQ9Xp7QovzSt+ktvwWS36qOn/i3ranhrS814RX7lm2sYBUhDbtKc7cDbX+dLLV
 38Nq+Po83ViaffQuNkDgSmssyTDdZo7kWpEtKfuNV4eR0pxbc8XNofz5sOSaxbvP6e1Z
 vowtveZ6lwALNraiQYgJC5EIe2Z4wJCUhPnsgpzI0BICK75fQXdbVqloezw9T2G7ss4w
 gYSh54gABFXOvN23ZOZ27R0IjJv4SDtZm9UiFhmpJgSgN/Plu+FaiT+jyUW2Z3D5iidz
 oOew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1K1aT2xzeWWXq/tRXX2ZkYyvB7rrQYwbV3XokZvlDyA=;
 b=ZZn4qUfUVnnqVKPFPX7rR3a8UsfMchLi3dAYB32NOE+QlO6ibJFc0AL4xc3b6joeIC
 iW1NER7imrkiKMJoaNvFxbOsj0nvk33A/EI7A7Kd3upVC/YHQF4mQKB0Cc35HjVfjvxP
 0n5Sw8DHipraKHDcdDEF8us+XWmAJT5pNe2lG1eJzBR1uyiL3OdnILoTX7/IxZCltcb9
 UyunajZztGmnM0Uxe08rwi311btd6oyZR1THxiDhb1ennEeW7z+84hLHzfgMuwOeUI6E
 Gp/LlSBNeDIv1DGA0Bho+gxgTrZqD426VrH4Sjel1UsZ8AtgFUZdrGXJYFappk6Ou45k
 pkWw==
X-Gm-Message-State: AOAM530ISOYqnEPnNFiuXfPwgzLezeBB8dr2pvUxm9s7yxn/9ihk5f+p
 W7eGYLh0jdwsxy5mdDYJA8OMg0Nlf/3gAA==
X-Google-Smtp-Source: ABdhPJy2G2N3VJfgwCPX5OTXknbgXhOT3EQrviEfJaancDr8QmNYxGLYVNchp2SnZvQX9icWkR5qiQ==
X-Received: by 2002:a1c:7515:: with SMTP id o21mr34997975wmc.65.1626735966089; 
 Mon, 19 Jul 2021 16:06:06 -0700 (PDT)
Received: from [192.168.43.238] (126.red-95-127-153.staticip.rima-tde.net.
 [95.127.153.126])
 by smtp.gmail.com with ESMTPSA id a7sm11242695wru.67.2021.07.19.16.06.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Jul 2021 16:06:05 -0700 (PDT)
Subject: Re: [PATCH v2 2/3] hw: aspeed_gpio: Simplify 1.8V defines
To: Joel Stanley <joel@jms.id.au>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>
References: <20210713065854.134634-1-joel@jms.id.au>
 <20210713065854.134634-3-joel@jms.id.au>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <81459728-4b5e-70a4-70de-2c626cce3e22@amsat.org>
Date: Tue, 20 Jul 2021 00:05:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210713065854.134634-3-joel@jms.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Rashmica Gupta <rashmica.g@gmail.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/13/21 8:58 AM, Joel Stanley wrote:
> There's no need to define the registers relative to the 0x800 offset
> where the controller is mapped, as the device is instantiated as it's
> own model at the correct memory address.
> 
> Simplify the defines and remove the offset to save future confusion.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  hw/gpio/aspeed_gpio.c | 73 +++++++++++++++++++++----------------------
>  1 file changed, 36 insertions(+), 37 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

