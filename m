Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D60C94A3AC0
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Jan 2022 23:38:28 +0100 (CET)
Received: from localhost ([::1]:52686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEIq3-0006oc-MS
	for lists+qemu-devel@lfdr.de; Sun, 30 Jan 2022 17:38:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nEIo0-0004SK-SY; Sun, 30 Jan 2022 17:36:21 -0500
Received: from [2a00:1450:4864:20::432] (port=35377
 helo=mail-wr1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nEInz-00030x-A6; Sun, 30 Jan 2022 17:36:20 -0500
Received: by mail-wr1-x432.google.com with SMTP id e2so21930116wra.2;
 Sun, 30 Jan 2022 14:36:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Q6nW0HPUxgZrqvX+E37hVkIxbkHH6UmHj00EaFCeX2o=;
 b=QiL3QkVw/sHkdsR9AMvQC34qv6nUALDstc2z34y5tLSbd25aB73TF367X0WSk9GBbR
 71kQgyL050kFWlkXCteIeYcHAyIwX0LerGAqVzODSDBgBNXN0v5UB1dlAGRq/QSDWppo
 avWPGVvPEI3iarDufQJSQhaZnkhHHU4nLZQwk0Q3bMnDr081BBKWui0HnHzXOfrKpcUC
 6D3iThabfIuHOynLZN0WlALPRotRwyafobk4Fecw03lS0EMu5PcVd1XfsMgDQAw5cetU
 OkciyEEr5evl8OHt5RmOxfDwZjy8ZK13Y+tC1oyaWjaK8jx3bihroJ0iXzZKpnzccXcI
 tsWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Q6nW0HPUxgZrqvX+E37hVkIxbkHH6UmHj00EaFCeX2o=;
 b=L3bU4e5vpstjzFQFhmw2o+wsSgkmG5/hQiouhBhhQTzmsexJmf55LypRkxRlEoMbxP
 TTMIiz7kFu+X4qiHsYvob3INPOW6Qbb3H7rhaDKtdtwJBrSm6rt1NJyN7aNjzvFNil9L
 YtLVvr0NqctNy2b2IK2qEg9PEHDhaWr2ymgPoL8TEc51ZfJgA9UEwG5Agxq6gHsfkft3
 aH8FnzltGqEnpZUW2iTm59dPl00tSSNeAbdj66f6gj3Cg142BFsI8xz+hnq4Pz6e8X+9
 960mOOQWrCXMPBtldKoXA/nhO3mH6tzrSOTUce4Kv8FH8qaUrAjxhHnUhVGfmyCAKCuO
 2hKA==
X-Gm-Message-State: AOAM532aEA9XV56MXNKPZsCTOgAMtaf2/K5DM4e4Y8buZxOAhgJLHpbg
 nSQx8jGDB6cRYdvlILJUquQ=
X-Google-Smtp-Source: ABdhPJwdmRIYm/+MU8kmaV/d9w+uiVaFczZ8E8eQVAYO4Tc0QagF3a9akztSg7t/91yebh+aHMT/jA==
X-Received: by 2002:a05:6000:1292:: with SMTP id
 f18mr15211621wrx.133.1643582177084; 
 Sun, 30 Jan 2022 14:36:17 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id f13sm10856095wri.44.2022.01.30.14.36.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 30 Jan 2022 14:36:16 -0800 (PST)
Message-ID: <3905e376-552e-d3fa-fcbf-8f16e3e250a6@amsat.org>
Date: Sun, 30 Jan 2022 23:36:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.0
Subject: Re: [PATCH 2/3] pci: Always pass own DeviceState to pci_map_irq_fn's
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Magnus Damm <magnus.damm@gmail.com>, Peter Maydell
 <peter.maydell@linaro.org>, BALATON Zoltan <balaton@eik.bme.hu>,
 "open list:Versatile PB" <qemu-arm@nongnu.org>,
 "open list:sam460ex" <qemu-ppc@nongnu.org>
References: <20220112213629.9126-1-shentey@gmail.com>
 <20220112213629.9126-3-shentey@gmail.com>
In-Reply-To: <20220112213629.9126-3-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::432
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 12/1/22 22:36, Bernhard Beschow wrote:
> Passing own DeviceState rather than just the IRQs allows for resolving
> global variables.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/isa/piix4.c          | 6 +++---
>   hw/pci-host/sh_pci.c    | 6 +++---
>   hw/pci-host/versatile.c | 6 +++---
>   hw/ppc/ppc440_pcix.c    | 6 +++---
>   hw/ppc/ppc4xx_pci.c     | 6 +++---
>   5 files changed, 15 insertions(+), 15 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

