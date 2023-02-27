Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BC3F6A4DC7
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 23:14:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWljq-0000Lc-RF; Mon, 27 Feb 2023 17:12:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWljo-0000Kf-Al
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 17:12:52 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWljm-0005qs-IR
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 17:12:52 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 m25-20020a7bcb99000000b003e7842b75f2so4729425wmi.3
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 14:12:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Odyhjnzs2sV7zYoVsOSsBvSJHczEQn/12Sp8ML18cD0=;
 b=XMXNfKCAjIQNux28IVQevlGz8bd7O50dArNe7jclTRzKqieGQMJqk/WMGmTB8AWHto
 Y3LDv5HYnrWbVN1cgN/gWDmFRQSxRO6oeq7rrUrLlExRCUkqIurisazjHzz/Rxo+tmQH
 WQEk7EaDsTPDq9f+2g1g6ks6xKFLqvO3HEcNpSxE+U6uycmgoY0b2ok90Dv9V5qwD2Ol
 swRB73q56PzzEivs+qbfxkDjq4arrlut2ErdTWLQ57GHGet80vNnJVpEiMzldW3+Jdx+
 R5KpMMWnxr4dOJXRpalOznArYYMHYhWQRZGT+g6LSnVzHBCNURxJmFsumxy6HSiBkT3W
 F5HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Odyhjnzs2sV7zYoVsOSsBvSJHczEQn/12Sp8ML18cD0=;
 b=2GPGGLsYjkY/VPpPzxjzQppxbHvaqVC1t4ruTkBdcZxa48zTpNRl7/TxxawdF5KvAc
 hFwDp16T6XW8XL4e5yLUuDBg0zsMRRNL0otf0D5+6vvsXMP4XHFs+iNEUSWAgDRvS2Rl
 ycClYiPHSY2JaJFB6PsyQ83uBS1p1lm1qfhaCEXKk/RBzVJReAZv91iQy7Fay6rkIbxi
 3PRI76Mm4u8Cw8quxPUJVqsEllK7GFdQ1L47sAdeo3MDRYdGMJfMFXyEWCBiWyBZ0qZ5
 xqjFeOPYW1V5ya7bM1UOYGvHeuau0V9PdL+Or/Hm70SNrOGcKaNY5Iwa1HUhw8Ex52Uu
 t/8A==
X-Gm-Message-State: AO0yUKVphwmqwNeUenMnBrMGCoiSje0nFmUiAZQyifD04oyS06DAyqSi
 y38/pyfv/zwKZypWnSwwYMExAg==
X-Google-Smtp-Source: AK7set8IY5F+GSLrhB9wyo9kSVEjz6l8XxpCRL93ZQvyomsY37teeX5hEHXaNeDmNm7TNJOXOMG5Ew==
X-Received: by 2002:a05:600c:998:b0:3dc:1687:9ba2 with SMTP id
 w24-20020a05600c099800b003dc16879ba2mr424188wmp.35.1677535968726; 
 Mon, 27 Feb 2023 14:12:48 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 bh22-20020a05600c3d1600b003e01493b136sm13956810wmb.43.2023.02.27.14.12.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Feb 2023 14:12:48 -0800 (PST)
Message-ID: <b4b60712-a94c-69f4-2de0-b9b5e08970fc@linaro.org>
Date: Mon, 27 Feb 2023 23:12:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v4 0/7] Pegasos2 fixes and audio output support
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, Huacai Chen <chenhuacai@kernel.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-ppc@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>
References: <20230227125732.20941-1-shentey@gmail.com>
 <b86db1dd-b9ca-a774-963c-4f9404c9af5c@eik.bme.hu>
 <CAG4p6K74Rm2FaErjvSyVCgcMQ2Qz0pkh2dg6yPeXU5BmwYp3RQ@mail.gmail.com>
 <56e3575f-2cac-2138-23d1-78d8ff1388b5@eik.bme.hu>
 <CAG4p6K7Yd6SWBCC1_-fJJ1rLqCuRqwi=dOmypum7kiUZ4SoH=g@mail.gmail.com>
 <2952e466-98e1-cf16-b8c2-fdc49d0ebf48@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <2952e466-98e1-cf16-b8c2-fdc49d0ebf48@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.089,
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

On 27/2/23 18:47, BALATON Zoltan wrote:
> On Mon, 27 Feb 2023, Bernhard Beschow wrote:
>> Unfortunately my patches had changes merged in. This now makes it hard to
>> show what really changed (spoiler: nothing that affects behavior).
>>
>> As you probably noticed in the "resend" version of this iteration I split
>> off a patch introducing the priq properties. It belongs to the sub series
>> of the Pegasos2 IRQ fixes which appear unnecessary to me, so I don't want
>> to show up in `git blame` as the author of any of these changes. I
>> attributed it to you because this was really your change which I'm not 
>> even
>> sure is legal.
>>
>> Let's avoid such complications by keeping our series separate.
> 
> Let's cool down a bit. Philippe took some of the sm501 patches in his 
> giant pull request (and a lot of your patches too) now so I'll wait 
> until that lands and hope to get some review for the remaining patches 
> too. Once that pull req is merged I'll rebase the remaining patches and 
> resubmit the series also adding changes for reasonable review comments I 
> get by then.

I'm sorry it took me so long, I was expecting these patches to be picked
up by other maintainers but everybody is very busy. I know you'll need
to rebase and it might be painful. But I did that believing it is the
best I could give to the project with my current capacity. Also I don't
want to overlap (too much) into other (sub)maintained areas.
If you are stuck with a rebase, I can try to help.
We'll get to the end of PIIX, if this isn't this release, it will be
the next one. I've been waiting for these cleanups since 4 years
already, before Hervé Poussineau pushed toward that direction during
3 years. We always hit problems due to PC world inheritance which,
as a production system, can not regress.

Also I don't want to compete with you guys, I'd really love to work
together as team, but I have other responsibilities and sometime I
can't spend the time I'd like here.

What blocks the PIIX changes is the "q35/ich9/-device piix3" broken
config. I'll explain elsewhere why it is broken. The problem is I
don't know how to suggest alternative.

Bernhard sometimes it is easier to share visions in a 30min call,
rather than on a such thread. If you want I'm open for one.


