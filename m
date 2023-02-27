Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD6746A4DFE
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 23:28:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWlxZ-0003e3-Ux; Mon, 27 Feb 2023 17:27:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWlxY-0003da-54
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 17:27:04 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWlxW-000106-6M
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 17:27:03 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 o11-20020a05600c4fcb00b003eb33ea29a8so4245251wmq.1
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 14:27:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7hq+HFx03QlIW4KD7hRQcBLGm4gUZMIZffYVvdK5VzY=;
 b=eVPQ8P+0QAYDfjKwgGkx4Q+53eKEJOOopibuhDkysTvj7wuwZgVCa+s6UU2TV22jOl
 b/qV1qfqXq6I+sb1Ozn9QK7KEFaUaDDVEmkIppyvGaAJ2n48A2Mh4JqAz23k4elFVTAc
 fCq081E0v6tq21QoAETYOwAEIA1JIDuaBqsX0Y+DwC73ThHR7DOIRxVDpKTCdnBLn2iA
 aWYBhcs7rybC7ar4BBRv9wOiUq8kWaJ9uhNeKAqP8JRj7FbIPHQt1S5Kafa2X4xiXku1
 mLMCUqZD9/PBBKXzx6pG+ofBhB7PZq0TPYviq+wPRMjejgbfeHH52UzLEdr99qyxsNFc
 XRpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7hq+HFx03QlIW4KD7hRQcBLGm4gUZMIZffYVvdK5VzY=;
 b=gDnTywQSrgI9uevzTvr0dITwug26zJtQP3o5X2itCIz9BA+7c2D3mGSN50TtpfbROm
 7yybknTTejiguAdpja41Sk4S2QQJQQFcJ3fgAoFNw03+e6IyjgvfaBLvO+NbNRJtY7Cy
 h+Df4xD7ckHuan+rluYjXYnzf4IjIOluu137wM4SPNsWuQHFNJ+GmDjf0WOX7uivpX4g
 TKO6b3E9QhF23HZBoyr3e1fs6PrmS/fV9XAOAI5hTlpCTo5y8PomizLCbQUAFvDj2NY3
 GXqw9vYGg6OlABLqRSaxirTwo4JWhoTcBfX0+Jv24cctCdevZis7qlzpN7Pb4bNF2kkv
 kUBA==
X-Gm-Message-State: AO0yUKVwvfgenmRwoLdvdEe+C8qgeFk9c97lJ2Om9ZB8HcFAAjzxcshz
 6CPBtTqMoE13qgPD3A9TouQi1Q==
X-Google-Smtp-Source: AK7set8f0iOQl9wPP6J6vhkDV79sNZHWLlRrehDsOgi+dAFDK4hXGTS82nxzTR5lmL0DW0iFr/GzdQ==
X-Received: by 2002:a05:600c:331c:b0:3ea:bc27:6a64 with SMTP id
 q28-20020a05600c331c00b003eabc276a64mr521840wmp.10.1677536820252; 
 Mon, 27 Feb 2023 14:27:00 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 v20-20020a1cf714000000b003db03725e86sm10359308wmh.8.2023.02.27.14.26.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Feb 2023 14:26:59 -0800 (PST)
Message-ID: <a67b93d8-d19e-dcf1-271d-e798a670f219@linaro.org>
Date: Mon, 27 Feb 2023 23:26:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v2 06.5/18] hw/ide/piix: Allow using PIIX3-IDE as
 standalone PCI function
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
To: John Snow <jsnow@redhat.com>, hpoussin@reactos.org,
 Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, hreitz@redhat.com,
 kwolf@redhat.com, mst@redhat.com, qemu-block@nongnu.org,
 richard.henderson@linaro.org, eduardo@habkost.net,
 "reviewer:Incompatible changes" <libvir-list@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, pbonzini@redhat.com
References: <20230215161641.32663-1-philmd@linaro.org>
 <20230220080044.4646-1-philmd@linaro.org>
 <20230220091008.tgg2pqockjsttbsm@sirius.home.kraxel.org>
 <f6e24ede-2d91-5258-18e0-bf9ecf3afc18@linaro.org>
In-Reply-To: <f6e24ede-2d91-5258-18e0-bf9ecf3afc18@linaro.org>
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
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 20/2/23 10:52, Philippe Mathieu-Daudé wrote:
> On 20/2/23 10:10, Gerd Hoffmann wrote:
>> On Mon, Feb 20, 2023 at 09:00:44AM +0100, Philippe Mathieu-Daudé wrote:
>>> In order to allow Frankenstein uses such plugging a PIIX3
>>> IDE function on a ICH9 chipset (which already exposes AHCI
>>> ports...) as:
>>>
>>>    $ qemu-system-x86_64 -M q35 -device piix3-ide
>>>
>>> add a kludge to automatically wires the IDE IRQs on an ISA
>>> bus exposed by a PCI-to-ISA bridge (usually function #0).
>>> Restrict this kludge to the PIIX3.
>>
>> Well.  On physical hardware you have a config switch in the bios
>> setup which turns off sata and enables ide instead (i.e. the
>> chipset implements both and can be configured to expose the one
>> or the other).
>>
>> If we want support ide for q35 we should IMHO do something simliar
>> instead of making piix-ide user-pluggable.  We already have -machine
>> q35,sata={on,off}.  We could extend that somehow, by adding
>> ide={on,off}, or by using storage={sata,ide,off} instead.
>>
>> This has been discussed now and then in the past and the usual
>> conclusion was that there is little reason to implement that given
>> that you can just use the 'pc' machine type.  For guests that old
>> that they can't handle sata storage this is usually the better fit
>> anyway ...
> 
> I think we might not using the same words, but agree on the goal :)
> 
> Since this has been discussed in the past, I suppose some users
> want this config available. Why are they using this convoluted
> config? Could it be due to lack of good documentation?
> 
> Do we really need a storage={sata,ide,off} flag? I don't see its
> value. Help cloud users to have a sane config?
> 
> (old) boards exist with both IDE/SATA and we might want to emulate
> some of them, but IMO such boards should be well modeled (Either
> in C or later in declarative language) but not automagically created
> from CLI.
> 
> IOW:
> 
> - using PIIX on Q35 (or any machine exposing a PCI bus) is
>    acceptable, but the chipset should be instantiated as a whole.
>    So to be clear I'm not against "-M q35 -device piix3", we should
>    keep that working.
> 
> - we shouldn't try to maintain such Frankenstein corner cases which
>    force us to add complex hacks, hard to remove, which limit us
>    in implementing new features and cost us a lot of maintenance /
>    testing time.
> 
> So I propose we deprecate this config so we can keep going forward.
> 
> (More generally I'd like to not allow instantiating part of chipset).

So there is a design problem here.

- ICH expose ISA bridge (fn0) with ISA IRQs.
- internal ICH SATA fn wires the IRQs 14/15

if we plug a cripple piix3-ide function which lookup for fn0 (ISA
bridge) to wire its IRQs 14/15, we end up having 2 devices able
to raise/lower IRQs while in the BQL iothread.
IOW, one device raise an IRQ, while the other lower the same IRQ...
thus the 1st device IRQ is acked from HW and missed from guest SW.

Daniel tested such config (2 drives used concurrently, one on IDE
and one on SATA) and reported "lost interrupt" from dmesg.

I haven't investigated using a SplitIrq object, but this doesn't
match real hw.

If user want to suffer from poor quality, we should find a different
(valid) config to add IDE drives to Q35 machine. Or maybe it is
a documentation problem, and we should redirect the users to the
best config.

Ref about similar problems:
https://lore.kernel.org/qemu-devel/b8d457d1-40b1-adb5-a2ac-98070f62ac1e@eik.bme.hu/
https://lore.kernel.org/qemu-devel/Y%2FSu8eB2nIO0INOX@redhat.com/

PD: For the remote-pci it is different because it is based on
PCIe which serializes MSIX IRQs, so no way to overwrite one.

