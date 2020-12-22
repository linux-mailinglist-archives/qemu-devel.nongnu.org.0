Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5047E2E108F
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Dec 2020 00:13:40 +0100 (CET)
Received: from localhost ([::1]:58410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krqqY-0002Hd-Vg
	for lists+qemu-devel@lfdr.de; Tue, 22 Dec 2020 18:13:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1krqpI-0001eZ-DZ; Tue, 22 Dec 2020 18:12:20 -0500
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a]:33707)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>)
 id 1krqpE-0004es-R3; Tue, 22 Dec 2020 18:12:19 -0500
Received: by mail-oi1-x22a.google.com with SMTP id d203so16515782oia.0;
 Tue, 22 Dec 2020 15:12:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:autocrypt:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=veBa+TDl2yXZGaoi8k1UEOkJUwAajYGjecBCRVwCCcY=;
 b=CJ/hgun2/CZhVlKdcoutfrG3rUkoNCfhVEWoFtDigziNybs5i3gR/Y6XU0aP9Dx2GB
 mlFB1m1KrOmk3RNkZ7Z/1nDEzRA8R6i4NkUciDmzjM91ht0PCqB9jYvwF1Bg8JUaAwMF
 MLnELI5VJx0WNSTWK6uloEn7OKkxDguoyXrB5yCAQigPx4pPTtHGt+fQC+ffRxCPN5ap
 e4jsy47Rq0k/2EiIFFovCfxMbsCI57XgxExzhKgTxZNqLQMpgaN7SmBft2AGejaJfWNQ
 JRVYR5jmf7ZygNttdtONMaxVz93Nmk1mTshkQsl0dYWDTwCx3i2lxlBdm9hE+i6JSNk2
 SwEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=veBa+TDl2yXZGaoi8k1UEOkJUwAajYGjecBCRVwCCcY=;
 b=X/ygswihgvUFIJjxozQhpfxlMxOA0qYkip6hZKwxnxUe6Z+YpNN/voWWILlUdqoabQ
 NMPUuQKxDL+LQkDACwWcDziN+8qj30/bLVPq9pib6CQWsZ6ibds5wppNUuMyKBClJsGk
 uu7j44+ZrZe9QsqyT3RijWGR8D8a0iHAqp8CEG9roYaps1qGwqtreLTV8kE3jBS9Wt+o
 NGI3GnYsXb82ScSMOoiX1Wz1ZcR0ptW5sZqEnaY5jU6w1VRNOtfCUZfsKcu3Bn7cQGIP
 b6/HHgG+qpHUMfD7uR3DcrDPy3joilA9n45fA7qyYRVFS45Ffw2LES+WtagI7Zl6UgZX
 Guxg==
X-Gm-Message-State: AOAM532dlsKhlVrmH7PpcyUN8xhGGsqSxQ3MWo705AWedNi0VnUNxzIR
 9EGPoRNvTumHKtQZhIZf9gs=
X-Google-Smtp-Source: ABdhPJymmJaOZYQBWJitRS9TToWrfLDAJIBR8eidXw2/6AvHassMTdGOythxhZWg3e9skaXfyeuyVg==
X-Received: by 2002:aca:3151:: with SMTP id x78mr15825810oix.39.1608678735261; 
 Tue, 22 Dec 2020 15:12:15 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 p4sm4592198oib.24.2020.12.22.15.12.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Dec 2020 15:12:14 -0800 (PST)
Subject: Re: Problems with irq mapping in qemu v5.2
To: BALATON Zoltan <balaton@eik.bme.hu>
References: <3f0f8fc6-6148-a76e-1088-b7882b0bbcaf@roeck-us.net>
 <93a88d8e-89d0-96d4-15bc-47edfc68b5d8@eik.bme.hu>
 <5fb9653-ac95-ecfb-229e-848bdebd839c@eik.bme.hu>
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <79a9ae8f-28cf-2bb2-4f27-de2ba92d9bb0@roeck-us.net>
Date: Tue, 22 Dec 2020 15:12:12 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <5fb9653-ac95-ecfb-229e-848bdebd839c@eik.bme.hu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22a;
 envelope-from=groeck7@gmail.com; helo=mail-oi1-x22a.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-2.521,
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-ppc@nongnu.org, QEMU Developers <qemu-devel@nongnu.org>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/22/20 2:23 PM, BALATON Zoltan wrote:
> On Tue, 22 Dec 2020, BALATON Zoltan via wrote:
>> Hello,
>>
>> On Tue, 22 Dec 2020, Guenter Roeck wrote:
>>> Hi,
>>>
>>> commit 459ca8bfa41 ("pci: Assert irqnum is between 0 and bus->nirqs in
>>> pci_bus_change_irq_level") added sanity checks to the interrupt number passed
>>> to pci_bus_change_irq_level(). That makes sense, given that bus->irq_count
>>> is indexed and sized by the number of interrupts.
>>>
>>> However, as it turns out, the interrupt number passed to this function
>>> is the _mapped_ interrupt number. The result in assertion failures for various
>>> emulations.
>>>
>>> Examples (I don't know if there are others):
>>>
>>> - ppc4xx_pci_map_irq() maps the interrupt number to "slot - 1". Obviously
>>>  that isn't a good thing to do for slot 0, and indeed results in an
>>>  assertion as soon as slot 0 is initialized (presumably that is the root
>>>  bridge). Changing the mapping to "slot" doesn't help because valid slots
>>>  are 0..4, and only four interrupts are allocated.
>>
>> Is that with sam460ex? This ppc4xx_pci_map_irq appears in ppc4xx-host-bridge and hw/ppc/ppc440_pcix.c (which is used by sam460ex) has a ppc4xx-host-bridge. Other user of it may be the bamboo 440 board where this host bridge appears too. I did not see asserts with sam460ex but I've only tested it with AmigaOS which may use it in an odd way not tripping the check.
> 
> I've just remembered that for sam460ex we had this commit: 484ab3dffadc (sam460ex: Fix PCI interrupts with multiple devices) that changed that mapping for that machine so I guess you got the exception with the bamboo board then. I'm not sure though that similar fix is applicable fot that or even that this fix is correct for sam460ex but appears to work so far.
> 
Yes, it is for bamboo. I think I'll just keep the mapping I came up with;
that seems to work for me.

Thanks,
Guenter

