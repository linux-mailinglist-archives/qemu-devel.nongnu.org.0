Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0221443CED2
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 18:38:39 +0200 (CEST)
Received: from localhost ([::1]:55716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mflwj-0006V5-Vw
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 12:38:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mflJW-00086T-KV
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 11:58:06 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:35541)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mflJV-0006i3-2O
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 11:58:06 -0400
Received: by mail-wr1-x432.google.com with SMTP id g7so3902444wrb.2
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 08:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=gCBFfxqMp+vafDkPWTxLvqPAae/0rwUoc+4Rufu2SWk=;
 b=W1aSD/WCrtnxFBLaiiHufuBCBED6lvFzMgsjLkqFogiCB7KG7dWDrjtwa+Yh7jPYMd
 oyR6bWu4wcA8sWwiHQsd8hn8byK653O2OK6Si5IwdGS7vbNoS7Jm2yLJ39G8/ti50151
 r0MouSq0Ej1GywMWS/btwwpCn7w4zX72OX1KenA4bHZVfz8UKD2Rf3rPiwBV7gOb37lJ
 XVyLaN6kR68n3hHC0X/XNh0WmNZvmbopyN08RjNMPEbXQNfOQIItCbjNmA2oHYyNV7cs
 DoF6ODkR9XJpATzoLUpnwXdLHY/vsGIyQaCihSG5GFBtesle5XMtTJdUWACA+Ex1A4oB
 jWXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=gCBFfxqMp+vafDkPWTxLvqPAae/0rwUoc+4Rufu2SWk=;
 b=7cyykYwlVkId+gp9UNxsjU5hE15sGJtu602C9olAPd//CMw8VoBuEQ9KH6uHsLPnGP
 3bPAr18ZmxW5RwX93oU+jdD8OZaqUp3sJVwhMZBsyhFCeKuhcQ59sqYXb3M+mJ+t7S15
 RbQNc251kTPo/GXSl/170tI/DbVdKrxBQIMUXXDoXIVbvoNdqvifSoj+WTSxrcq9k3fa
 7E+0VvWL38PFv8iP5ZpIEIzHhsQ+gmx1djSsLEPOcBKg8GiPkeV55EVwaOIrdUO40LEs
 t+UWVTWc0LbRJ56ftsVWlZKJ0WxAqGqKfY7ZCtorZ472JVZQYvFaR0YSutXXG0NnaWjD
 4Tew==
X-Gm-Message-State: AOAM533tl0LhRPybLm+FI2F/5FfbTUJ8krc1ARIrEFKAfAslAv5oewRO
 JLGdHm9G8kvfdU2RNOMcEJ0=
X-Google-Smtp-Source: ABdhPJxCpIrcDPsD/rSHSyPPIMre3FQXpf2S/YX6xAlhZkJJjTAM42izT/IwpHEZTe5A9cpX1+pBVg==
X-Received: by 2002:adf:fe0b:: with SMTP id n11mr42405215wrr.371.1635350283367; 
 Wed, 27 Oct 2021 08:58:03 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id a26sm139543wmm.46.2021.10.27.08.58.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Oct 2021 08:58:02 -0700 (PDT)
Message-ID: <baccd69d-43bd-0f85-5242-a7a9cfe4e328@amsat.org>
Date: Wed, 27 Oct 2021 17:58:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 10/11] hw/intc/sh_intc: Clean up iomem region
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org
References: <cover.1635342377.git.balaton@eik.bme.hu>
 <c1ab09d39b30c1cb9290bcc95626814249dc4505.1635342377.git.balaton@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <c1ab09d39b30c1cb9290bcc95626814249dc4505.1635342377.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-2.847,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/27/21 15:46, BALATON Zoltan wrote:
> Fix the size of the iomem region and rename it to "intc" from
> "interrupt-controller" which makes the info mtree output less wide as
> it is already too wide because of all the aliases. Also drop the
> format macro which was only used twice in close proximity so we can
> just use the literal string instead without a macro definition.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>  hw/intc/sh_intc.c | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)

> -    memory_region_init_io(&desc->iomem, NULL, &sh_intc_ops, desc,
> -                          "interrupt-controller", 0x100000000ULL);
> +    memory_region_init_io(&desc->iomem, NULL, &sh_intc_ops, desc, "intc", 4);

Why the region size change from 4GB -> 4B? Did you mean '4 * GiB'?

