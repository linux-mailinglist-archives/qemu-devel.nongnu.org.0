Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF496442FE9
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 15:10:27 +0100 (CET)
Received: from localhost ([::1]:53662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhuUd-0005QH-20
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 10:10:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mhuCg-0007xP-Pd
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 09:51:56 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:35536)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mhuCd-0008KA-8r
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 09:51:54 -0400
Received: by mail-wr1-x436.google.com with SMTP id i5so25791528wrb.2
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 06:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=tblwEChxTZXPMKr9UODxtkGw612B65qCaOami697rEE=;
 b=fQvvZLRIxR+HWoUU5W3oPM0TBBaJ7x2iArF2zMoydcbMQ4v31cy3LQnwYOlCajHw+C
 nqhS99iL1HIBBTG9plUMbjKWTn88UKe5Bl4BYE5YgnlOruiixFJQqSD/KMvmUJFETAlu
 TMCMIoLUg+hsHssFy42GRRKIOLgLwkJ225Z2tc+LSFcMxodA0j5zrY8xv24ZorUa02fo
 gOqceDr30C6+gbS/gyEmIZI1c+zXalnEmbe0FAl+bxO2CLtHphXLU6NSOsO4bCjhAAJn
 SMhyh7mpMpUpDLsqmCG/HRIXMAls4NjOwhHFap8JdDRLK359iSiLbyh8ZTLmkR1ZE/TI
 qFwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=tblwEChxTZXPMKr9UODxtkGw612B65qCaOami697rEE=;
 b=A8Ivg0l+4+oSHXJejYcj8kjBNKmdZPUhaHKRY2UY6G4WUwW+ixyOZNJ1sw5jjD8qKM
 cR2oiuhcAauFsxO3Qm3OgTBXDZMCYBAPueB48pEBA0uVvTzX6JbDxrZ7mXxmdULi4X17
 prpojn1EszDzBEP3hVwTCT/GQV6iL7SUFqMFl7X+AnsMah3tFBkQACrW2dtVI3KXqTIW
 v18mCggC4zo4Y96Na+uXmDy9hqW03KBEhuz+1itXCd/A6Mtck1B1hqcLfl6gcJ8gh3sT
 LgsUJPtOmbQLdCXhWKomWkhELOZBEKMMl2w61GOhw6hkDQ8338vJxT1fQgfIJ7ZRNnqi
 OC1w==
X-Gm-Message-State: AOAM530HoODoQXt2C8S2TnyrnFW4KiDufhizzV5KycoCenKggyimkIrJ
 pNF1inCncash7y1nTQfopIU=
X-Google-Smtp-Source: ABdhPJwo76baLb5jVPtfBcAuAAEs7CSCQNF0OP8LPvJC6dQVxgvrnSVcDz9Nxi1QYYnrUpZcExl9Dg==
X-Received: by 2002:a05:6000:1563:: with SMTP id
 3mr47468380wrz.152.1635861108886; 
 Tue, 02 Nov 2021 06:51:48 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id z15sm6113242wrr.65.2021.11.02.06.51.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Nov 2021 06:51:48 -0700 (PDT)
Message-ID: <0c942aba-8798-6ce4-4f48-bc7c00d22b3a@amsat.org>
Date: Tue, 2 Nov 2021 14:51:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 0/4] hw/usb/vt82c686-uhci-pci: Use ISA instead of PCI
 interrupts
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, Gerd Hoffmann <kraxel@redhat.com>
References: <cover.1635161629.git.balaton@eik.bme.hu>
 <6f955022-ba0c-5dbf-05bd-cb73d910a40f@amsat.org>
 <a1dbf134-d273-85cb-a956-7c2be89f3fa@eik.bme.hu>
 <20211102123616.f7gmfdtbznjtbgcl@sirius.home.kraxel.org>
 <c78a4ac3-ed70-6c87-9c86-439eaafcbf98@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <c78a4ac3-ed70-6c87-9c86-439eaafcbf98@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-2.549,
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
Cc: Huacai Chen <chenhuacai@kernel.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/2/21 13:42, BALATON Zoltan wrote:
> On Tue, 2 Nov 2021, Gerd Hoffmann wrote:
>> On Tue, Nov 02, 2021 at 11:53:18AM +0100, BALATON Zoltan wrote:
>>> Hello,
>>>
>>> On Mon, 25 Oct 2021, Philippe Mathieu-Daudé wrote:
>>>> On 10/25/21 13:33, BALATON Zoltan wrote:
>>>>> This is the same as posted before just omitting the two patches that
>>>>> are optimisations by caching the func0 and avoiding QOM casts which
>>>>> could not be measured to have an effect but these reamaining patches
>>>>> are still needed to fix USB interrupts on pegasos2
>>>>>
>>>>> Gerd, could you please take them?
>>>>>
>>>>> Regards,
>>>>>
>>>>> BALATON Zoltan (4):
>>>>>   usb/uhci: Misc clean up
>>>>>   usb/uhci: Disallow user creating a vt82c686-uhci-pci device
>>>>>   usb/uhci: Replace pci_set_irq with qemu_set_irq
>>>>>   hw/usb/vt82c686-uhci-pci: Use ISA instead of PCI interrupts
>>>>
>>>> Thanks, series applied to mips-next tree.
>>>
>>> According to https://wiki.qemu.org/Planning/6.2 freeze starts today
>>> and I
>>> haven't yet seen a pull request with this series. Is it still to come?
>>
>> Oh, damn, was busy with edk2 stuff and didn't notice the freeze is
>> *that* close already.  Going over pending bits now and prepare a pull
>> req ...
> 
> I think this series is taken care of by Philippe already so if you have
> other bits to go over that's fine, maybe you don't have to worry about
> this one. Was just asking to make sure this won't miss the release.

Yes, I just flushed the MIPS patch queue.

