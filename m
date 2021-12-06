Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EFB8469497
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Dec 2021 11:58:58 +0100 (CET)
Received: from localhost ([::1]:45976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muBhx-0005MY-Cw
	for lists+qemu-devel@lfdr.de; Mon, 06 Dec 2021 05:58:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1muBP1-00043Y-Ly
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 05:39:23 -0500
Received: from [2a00:1450:4864:20::330] (port=55876
 helo=mail-wm1-x330.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1muBOz-00023j-V5
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 05:39:23 -0500
Received: by mail-wm1-x330.google.com with SMTP id p18so7721014wmq.5
 for <qemu-devel@nongnu.org>; Mon, 06 Dec 2021 02:39:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Bv3ehfZVBHfq9XY8RZSiQM/c/B/sWu45Mc61Iwzg2F4=;
 b=Ir4wyixyhSmrZNZM10uBtjLiAqmWyzuzfzYIfrOy3N83jl9Bi5DH1sRZCdvenSXqTq
 tALcgsmMdjnSFZP2qr7WA4wyvEDmohUskf/8nDhNIp5x9VGkF/mjWceaTq/qYUo/7u/u
 JKlBLNVML+0Jga1gnepTYmG3KkEmixrBQdENVuJne95MaRfRQ6K5GetavTmbFagBHH7p
 PXC0QwUzXjm009qUoRy8IVueyyYLnGQUeW0+jprCniBtufA8cu7MDlbKOgLjouKzxpV6
 hJ1FJlCAFJM7dfigBWsh8HQsenIBsnT4NXUCla93oSovFVh5CiCQJw+p5/tf4M+Laf6d
 +wzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Bv3ehfZVBHfq9XY8RZSiQM/c/B/sWu45Mc61Iwzg2F4=;
 b=qWGI+WLYT6GQE7awY4har5EMXvKAcP09gErXWh2aKwkB1vh6CxVoBR13C5bFru+L9q
 LkrbceKBK2FkbNscBLJeg7cZ+nMZJYieV/sMHLxcmjyzceF66GqOSsY7NI3W7PuN2FkN
 NuVHUQzpPnPOzr7lW+LXkXWOMvCb2wFrF9rH9zr4kLVc+4xxfg3+37en79INtIKYXTEx
 NbhAuGJ3Qov4WgV8CJVGCDaulZJeErhY/SWMy8eldL50gD2VR177Is8LtKJM7dEkHHBc
 bhw4bNBkIOU38S7rtqtsulK+bTX/fV9WuH/o/A6eA4NijEU7FlcpgNGQ3fqp3xM0ei0X
 eBbQ==
X-Gm-Message-State: AOAM532UoPWcDd4kheKI0lnfb/ehHFll+5olqnXRf40QHUlHqtUc4QUY
 im8lZqcpS5i7Lx2P9Ou1Nlo=
X-Google-Smtp-Source: ABdhPJxQ4gm9A5IJ3MW+PyGL5b4iQ4wlLAKL0gKmOnfDnYDraEN1MNGeSyIbl4PoZUtFXf54AUZc3w==
X-Received: by 2002:a7b:ce01:: with SMTP id m1mr38691800wmc.187.1638787160648; 
 Mon, 06 Dec 2021 02:39:20 -0800 (PST)
Received: from [192.168.1.36] (82.red-83-50-95.dynamicip.rima-tde.net.
 [83.50.95.82])
 by smtp.gmail.com with ESMTPSA id r17sm11987588wmq.11.2021.12.06.02.39.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Dec 2021 02:39:20 -0800 (PST)
Message-ID: <83d0c416-7e89-9e8e-cb10-85ccb631c296@amsat.org>
Date: Mon, 6 Dec 2021 11:39:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v13 02/26] target/loongarch: Add core definition
Content-Language: en-US
To: gaosong <gaosong@loongson.cn>
References: <1638610165-15036-1-git-send-email-gaosong@loongson.cn>
 <1638610165-15036-3-git-send-email-gaosong@loongson.cn>
 <9700d154-7185-b71f-4ab3-9c89f3021f7c@amsat.org>
 <1bf1604e-2e65-b302-068b-3ca59a510f0b@loongson.cn>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <1bf1604e-2e65-b302-068b-3ca59a510f0b@loongson.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::330
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-2.076,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Xiaojuan Yang <yangxiaojuan@loongson.cn>, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/6/21 02:22, gaosong wrote:
> HI,
> On 2021/12/5 上午1:26, Philippe Mathieu-Daudé wrote:
>>> +
>>> +    env->fcsr0_mask = 0x1f1f031f;
>> Is this for all CPUs or only the 3A5000?
>>
> Yes,     env->fcsr0_mask = FCSR0_M1 | FCSR0_M2 | FCSR0_M3 = 0x1f1f031f;

Let's use "env->fcsr0_mask = FCSR0_M1 | FCSR0_M2 | FCSR0_M3;" then :)

With review comment addressed:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

