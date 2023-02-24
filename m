Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D68B6A2057
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 18:15:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVbeL-0001pY-1w; Fri, 24 Feb 2023 12:14:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pVbeK-0001oP-2l; Fri, 24 Feb 2023 12:14:24 -0500
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1pVbeI-0004b7-Ab; Fri, 24 Feb 2023 12:14:23 -0500
Received: by mail-oi1-x233.google.com with SMTP id q15so8453373oiw.11;
 Fri, 24 Feb 2023 09:14:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AGKDTKon04X838CnWPQ7YSFGwIlOP5AurkWy5lPZ0Yw=;
 b=KJWTUxsixzYKGhd5/aV6xDuiZXT9tERrXy1/CU3zYELA+x9eAT/+TJS/p61soiVBBR
 gA3/3qoEiCX/8kWvX6O52mkQIs+rsFJVXqjp1iZBlTgUjmcJlGYkhM7GxyGl0VNZ4Nsx
 0FBhkmmSZRzlpEakj6IzOcg5sIy9YNxvO/nZNM6qOU75PGkOgj0SS/6Xbl0C4cEjDmv/
 rBcAEM3/beJI7BOS7bMFrUREa4ge8zGLjh0yMuY2DGN+gSSmjcrQi+yCStjZ2oB8W1Kh
 2HWLKarZScbV1U7hjEvjJj35uH74oVYmKAMTizRylO8cfqmnLVUvg5wB+KpMjG/tEYEP
 jpXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AGKDTKon04X838CnWPQ7YSFGwIlOP5AurkWy5lPZ0Yw=;
 b=4GpDIjgQuanRaWcvwuVEnDNcqoaEwgpi+rGV/HKPeTY4OWIY5+G5KplrJ+flvXMe9J
 EuVr9/Vi4Yrqzn/OZJ6OqUohdmE2Gjc76de/wGQMnDf+8k/XK/CUNkhaE9NLJGQtgMN0
 GFPRwp1y0Qf2+An+llaxA4XpCp5Jwz+/pBpTm3WjtyzGKxZBuBsom7fDudjhQC1V+aEW
 zqFFGzBts6HxRcHGWGED1bHkHsQVyQC4rW2VjgAEryRIdLdha4bZtRGIflkaMsIwuFm1
 +n3BCJBsCZQKOlfEd8r7DwabzTrotZAdX+XMGu8zpaQps09ou+Qazii1s/hMotey/uAo
 CnQw==
X-Gm-Message-State: AO0yUKX+sIHhOgOOseKJ7iAyLuNFca+NSmGovYc23ZV3vekxwgyhKNYO
 x8a9WJ3sMJdafEIU7ST1bA0=
X-Google-Smtp-Source: AK7set8Nd9rRIccDHjnFa5fxjSxCmetNNGAN4qKMC8hyG5XJkn79ktqEWx3gpOLEMfx71D7Q+aaEjw==
X-Received: by 2002:aca:2218:0:b0:384:87c:7579 with SMTP id
 b24-20020aca2218000000b00384087c7579mr667599oic.42.1677258860519; 
 Fri, 24 Feb 2023 09:14:20 -0800 (PST)
Received: from [192.168.68.107] ([189.110.112.117])
 by smtp.gmail.com with ESMTPSA id
 y1-20020a056808060100b00383b4f8a15dsm4196002oih.33.2023.02.24.09.14.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Feb 2023 09:14:20 -0800 (PST)
Message-ID: <23a7106f-bc25-20c4-d446-b0fff84cc2fb@gmail.com>
Date: Fri, 24 Feb 2023 14:14:16 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 5/5] hw/audio/via-ac97: Basic implementation of audio
 playback
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, Bernhard Beschow <shentey@gmail.com>
Cc: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org, Gerd Hoffmann
 <kraxel@redhat.com>, philmd@linaro.org,
 Peter Maydell <peter.maydell@linaro.org>
References: <cover.1677004414.git.balaton@eik.bme.hu>
 <f84b42b8e811c6a0ddb23139fdfd654c8cc4f09c.1677004415.git.balaton@eik.bme.hu>
 <89f85024-6057-f0a8-3d4a-20eeaeec8878@t-online.de>
 <DF35DA6B-ED6A-43E3-A28E-7936560B6452@gmail.com>
 <62f3e9a1-f360-b525-7d1e-f57ccc8dca9e@eik.bme.hu>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <62f3e9a1-f360-b525-7d1e-f57ccc8dca9e@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::233;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x233.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.094,
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



On 2/24/23 10:05, BALATON Zoltan wrote:
> Just for some motivation, this is what we want to make possible for more people with QEMU 8.0: https://youtu.be/YY9RExl4VDI

That's neat!

> 
> This would need at least my SM502 patches and fixing the IRQ routing in the VT8231 (this test was with my series for that, I'll ask testing Bernhard's version the same way once I get it and rebase my patches on it). AmigaOS can use ES1370 so the via-ac97 patches are not that important now but the other patches would be needed. I hope users won't have to wait until September to try this.

If you're referring to "hw/display/sm501: Implement more 2D raster operations" then it's already
queued in ppc-next. In fact I believe you can re-send it with this series, with my r-b, and whoever
gets to send the PR can send everything at once.

If either Gerd of Phil wants to pick these up I have already acked the pegasos2 changes.

If you want me to get this via qemu-ppc bear in mind that I need to send the PR March 7th
at the latest.


Thanks,


Daniel

> 
> While AmigaOS runs on sam460ex now, that versiion is much slower due to the limited PPC440 that doesn't have AltiVec and also due to some issues on the real platform it has to do more synchronisation which slows it down. The pegasos2 version runs much better and has a better chance to get it to work with KVM on PPC host so this would be a big improvement even if there would be more bugs to fix in upcoming releases but we'll never find those unless people can start using it and report them. More people are interested but less are able to compile and test from git repos and depend on binary distros instead.
> 
> Regards,
> BALATON Zoltan

