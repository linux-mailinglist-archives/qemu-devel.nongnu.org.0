Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD4DB3C3B86
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Jul 2021 12:33:59 +0200 (CEST)
Received: from localhost ([::1]:52844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2Wmc-0005CU-SO
	for lists+qemu-devel@lfdr.de; Sun, 11 Jul 2021 06:33:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m2Wln-0004XW-OF
 for qemu-devel@nongnu.org; Sun, 11 Jul 2021 06:33:07 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:46622)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m2Wlm-0001jo-8D
 for qemu-devel@nongnu.org; Sun, 11 Jul 2021 06:33:07 -0400
Received: by mail-wr1-x431.google.com with SMTP id d12so19455947wre.13
 for <qemu-devel@nongnu.org>; Sun, 11 Jul 2021 03:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=l8yVMd8p8m11HK6h/7ngWZdAO4IGq5z7Sc5Ev7D8ecE=;
 b=UpurAXYZRXPp69L7rsbqEbfjIfsDNGLeC0fH5u5qnIc7ChrXJNwzxRlMT3p0C+lGr1
 NlbK+iXG0+PgXCjt2iWYeBXBq2tlbXigVOZblO0FPnyPzU9O35dCH73HkL1jV6dKIvWq
 PY26noo79wvuE7E1WWepZk3eeOuHsEamwYh4nppskvVTuWg9AID2riHTdfFsgDnnB8nT
 +I661Iat5HCT+fKRIe9hFrQAo0FwtCd7KCEjwI+5y6XHKRjZubBs1yyILQAV3//GUUk9
 HMZa2bNTYGDQRQZAoet4WygDCqFjOhN4r6zEsUzKoNchterh2g3lln5rTthSQNp0xRy3
 kC1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=l8yVMd8p8m11HK6h/7ngWZdAO4IGq5z7Sc5Ev7D8ecE=;
 b=HanpeAya/FXdodX/UfaxGFSviKcPOuLi85cq/5a10JxfBKNh9LzwriGqFgFk2r0M1O
 U93utLDNodM6uocv3sUG3oyOXyJ7ho2VD3tTUE3V5uvZd7lWkOofHJUSoBTDjbsGP2pS
 Uvr9Mfxmi4dtZd+C+ZMQ5CQoZ7XnmdV2bPoh3QMYQ1MYSywmjYZfFBk2n20kJNseoNDn
 If5/NqqZa+OvB3UdygN5XDFkdr65FXgBf3goOCG0kRwMt86acVMEGEpQ+lf8aA92x4tp
 HzMn773m1jU6N5k8u9kMqIx4Zh4xz9hSdqQo5aNYYvReIdDhUVCc2gMAumNje/6/zGmh
 IZLg==
X-Gm-Message-State: AOAM530bm0bi7eBtG099JRo6LDgkEMcHv/pnEQkCbmLHCBcFlnRsamxR
 A03zzk8r8oKUfTm6K8jycU8=
X-Google-Smtp-Source: ABdhPJx3Jy9yYjU6DZ5/c7z3QnJWy3mBsRlR5kXN6OMpjiV4NKcUu77AmKrwNX67AQfGSYyXnzRWxw==
X-Received: by 2002:a5d:4a0b:: with SMTP id m11mr1557403wrq.210.1625999584341; 
 Sun, 11 Jul 2021 03:33:04 -0700 (PDT)
Received: from [172.19.58.38] (static-189-95-145-212.ipcom.comunitel.net.
 [212.145.95.189])
 by smtp.gmail.com with ESMTPSA id w9sm9573123wmc.19.2021.07.11.03.33.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 11 Jul 2021 03:33:03 -0700 (PDT)
Subject: Re: [PATCH v3 0/8] dp8393x: fixes and improvements
To: Finn Thain <fthain@linux-m68k.org>
References: <20210710174954.2577195-1-f4bug@amsat.org>
 <d4266ef3-693a-c00-117-96987fd16117@linux-m68k.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <8a8ff514-8931-b6ba-f82b-163f79bdb7a6@amsat.org>
Date: Sun, 11 Jul 2021 12:33:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <d4266ef3-693a-c00-117-96987fd16117@linux-m68k.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.001, NICE_REPLY_A=-0.001,
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
Cc: =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/11/21 4:08 AM, Finn Thain wrote:
> On Sat, 10 Jul 2021, Philippe Mathieu-Daudé wrote:
> 
>>
>> The last 2 patches are included for Mark, but I don't plan to merge
>>
>> them without Finn's Ack, and apparently they require more work.
>>
> 
> 
> I tested the patch series both with and without the last 2 patches. Both 
> builds worked fine with my NetBSD/arc, Linux/mipsel and Linux/m68k guests.
> 
> Tested-by: Finn Thain <fthain@linux-m68k.org>

Thank you very much :)

> I have no objection to patch 8/8 ("dp8393x: don't force 32-bit register 
> access"). I asked Mark to explain why it was a bug fix (since it didn't 
> change QEMU behaviour in my tests) but when I looked into it I found that 
> he is quite right, the patch does fix a theoretical bug.

OK.

> My only objection to patch 7/8 ("dp8393x: Rewrite dp8393x_get() / 
> dp8393x_put()") was that it could be churn.
> 
> If I'm right that the big_endian flag should go away, commit b1600ff195 
> ("hw/mips/jazz: specify correct endian for dp8393x device") has already 
> taken mainline in the wrong direction and amounts to churn.

We might figure out with a BE guest image, the remove the endian flag.
I don't think the patch is worth removing, because it simplifies and
we'll only have to fix the endianess in 2 places, dp8393x_get/put. I
prefer to restrict the address space accesses there.

> I have the same reservations about patch 6/8 ("dp8393x: Store CRC using 
> device configured endianess"). Perhaps that should be NOTFORMERGE too 
> (even though it too a theoretical bug fix).

OK, dropped.

> Is there a good way to avoid using big_endian for storing the CRC and the 
> other DMA operations?

Could be, but I'd rather see this fixed generically in the MemoryRegion
API, not in this particular device model.

> BTW, if you see "sn0: receive buffers exhausted" occasionally logged by 
> the NetBSD 9.2 kernel, accompanied by packet loss, it's not a regression 
> in QEMU. I first observed it last year when stress testing dp8393x with 
> NetBSD 5.1. I believe this to be an old NetBSD sn driver bug because Linux 
> is unaffected.
> 

