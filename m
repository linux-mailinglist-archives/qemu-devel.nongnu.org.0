Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44240431659
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 12:43:19 +0200 (CEST)
Received: from localhost ([::1]:39238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcQ6v-0003eB-KE
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 06:43:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mcQ57-0002LS-1Q; Mon, 18 Oct 2021 06:41:25 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:37686)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mcQ51-0007BG-M1; Mon, 18 Oct 2021 06:41:20 -0400
Received: by mail-wr1-x432.google.com with SMTP id e12so40494366wra.4;
 Mon, 18 Oct 2021 03:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=TiVpv0div0VNswq0G8HhWdZY6YVKfHnCCqKPnpzmiEg=;
 b=j+NDdGHqDRFo/gWDgXXz3WSRtv8kQuA0SixrK3FbSImhX0C4tyYz8/AFiylfPzQt2z
 J5KH9R2DsQZco6OlXxuSiLmaeGD/inUjKwAMEDg+4jLVE4WEN4n1EAguEeLeYFZtr8r9
 CzVQiHvwjBRKkJVKtUkYeu5jhizgAl9T1vPdN7SE9oNDum6yCej6YJUqDFcReRYG/Mo6
 BbcPtbC3Ow8WyskWGf7Wu8rAiWVQ4w2cmuNnnF9dEkBf5xu6MihJpXjyqs+meLo+hEFs
 bMuKazbdZiG2qdM6UhQav0ZYzgr0tbKawQGtJ/IW1BduAgQwHVHkCAMC88aNYLtqG47v
 663Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=TiVpv0div0VNswq0G8HhWdZY6YVKfHnCCqKPnpzmiEg=;
 b=5eooVw6eVEygF+o16nm5YNJxiRFTXyziy3mOZh7CeOSXCKTUrWkzZjycleVLtkjdkJ
 POLklPYmXozjek3LNauZG7gshsE4befBRMJEbFiJEMhNLzpCdE6o05Ypqtot9ajCLR71
 P6mWgnImKAxYb45dlEtw3QSXe9xAt9cQkTdHxua5Te7d74dVv59GDThpAXuxvqOjxgkN
 6sl9WlWzw/Q4JboQvEYbDpVAAGIMzMHKMIwmZsbf+QVs/QajeQRzIqW1mcIKqv+Q8Ci9
 9JvL5LARJpbr2WEqjarYs0ruuJikb1JZ/fDeLpZPjnu6gNmo0XR1sctgH1E4hdZjwkSI
 UQ1w==
X-Gm-Message-State: AOAM531vWqJR5jeRSCUv0qZnCNYIEOgyv2Mt4f0uj6VreyX+0qegoTMy
 t0aAoCimmKzOim84mCIntew=
X-Google-Smtp-Source: ABdhPJwyCTgS0srHQdbqooIu22TKCqdPomSD4rcjWuuy+9cr5B31FRt1dHQOGVnLmJVae4Q8hPEgcg==
X-Received: by 2002:a5d:59a9:: with SMTP id p9mr35686048wrr.386.1634553677948; 
 Mon, 18 Oct 2021 03:41:17 -0700 (PDT)
Received: from [192.168.1.36] (213.red-81-36-146.dynamicip.rima-tde.net.
 [81.36.146.213])
 by smtp.gmail.com with ESMTPSA id h8sm13896575wrm.27.2021.10.18.03.41.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Oct 2021 03:41:17 -0700 (PDT)
Message-ID: <659b3726-6e1e-b1eb-e6e8-45bb9c1ba156@amsat.org>
Date: Mon, 18 Oct 2021 12:41:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 1/2] hw/misc/bcm2835_property: Fix framebuffer with recent
 RPi kernels
Content-Language: en-US
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, qemu-devel@nongnu.org, 
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <5283e2811498034cc2de77f10eb16b9cd67a0698.camel@kernel.crashing.org>
 <0615f4a3-fba0-bb59-2405-4e1a080f8166@amsat.org>
 <4bab811367b2c1e813061d6f1048bbf9b4a2a606.camel@kernel.crashing.org>
 <353c1b30-7621-54c5-5294-ebf1d8b3f8b8@amsat.org>
 <a55f82099075eeaaa544f6f7fc7575b90d051caa.camel@kernel.crashing.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <a55f82099075eeaaa544f6f7fc7575b90d051caa.camel@kernel.crashing.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/18/21 12:27, Benjamin Herrenschmidt wrote:
> On Mon, 2021-10-18 at 11:47 +0200, Philippe Mathieu-Daudé wrote:
>>
>>> I've just checked the rpi-5.15.y branch and it's the same.
>>
>> Indeed. I stopped testing recent kernels because they use too many
>> features QEMU don't implement.
>>
>> Our model should generate the DTB blob of devices implemented, instead
>> of giving false expectations to the guest by passing an unmodified dtb.
>>
>> This is on my TODO, I might give it a try next WE.
> 
> Indeed. That said, we do implement the fb, so we probably want that
> fix. The fix for the virtual gpios is probably unnecessary however if
> we do what you want.
> 
> That being said, with those two fixes, I can boot the latest 5.10 I get
> from raspbian.

Great. This test should pass with your 5.10 kernel then:

https://lore.kernel.org/qemu-devel/20200215192216.4899-9-f4bug@amsat.org/

Do you mind providing the equivalent 'deb_url' / 'deb_hash' you
used, so I can adapt this test to cover a Raspbian 5.10 kernel
in our CI?

