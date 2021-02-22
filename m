Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0692321E0A
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 18:25:12 +0100 (CET)
Received: from localhost ([::1]:38456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEExL-0005Ab-QW
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 12:25:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lEEvZ-00032w-N3; Mon, 22 Feb 2021 12:23:22 -0500
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:43548)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lEEvX-0006G4-Vz; Mon, 22 Feb 2021 12:23:21 -0500
Received: by mail-ed1-x532.google.com with SMTP id d2so22974647edq.10;
 Mon, 22 Feb 2021 09:23:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=X+H6RaqDTEfbbc/klOGzQ2ahJEHfQZJJZWSrwJkvu+E=;
 b=uq08mTJ4HE6daCkwj0ELH8+dF7U26r1rI9k51w12YlJg0jIhUE1OwKzoGFwZNbut/M
 beIW0NYH0XuXhdQXbY2xnFY3St4zuvPbm9HYEgDEOObzsj1ZGS5YFxSlu1Qr7ldeqGdl
 p+PZ2c3QyRhLnQw1aGVeFYISB5nurA8s+v0GTHyW00DVWotAAnp5jxs92mqkdWgHyE1A
 8wgDVWPmSyPYlwtlNsnJTwK4oUPepd0EoJXHBNINYhoPogGM6/JeaQg7GotglWod91Sm
 zP8OAPqymRzEtj0IkmANoOk8/qx3+iH30SHRGGp5XAvXT/nnATXwBsFRGKzlWmADwIkA
 RP8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=X+H6RaqDTEfbbc/klOGzQ2ahJEHfQZJJZWSrwJkvu+E=;
 b=l1WXu2nY9954BosrwbFzeT4cCay0fUN37gPs56/dtABFi0O5isGRkCX00GFco0xkFA
 gXBZ7GSBCHvayclVv0nm9OFhdKjcHsQc7vcvLI/9PTHgJzG1xvabVEpvGauRfWj9n3fB
 VcR1FG08w6/unSySJ73YosOIG0/5nQf6tuWdWc57eKOA1UqG4bfWo3pBpnYS1coDHmal
 BxX6hW3EUYYugClnm154vdnhyaR6b0iCWqZOGlJQDyTDHgAoRo38knVyyYhi8euJnNfr
 m7AtiTcgiArtUo7vUW/tAWi0iQTwVmnAPW0UIBfUpWsm5zMcG3W44p8jc1moXeFIe1wq
 qNtA==
X-Gm-Message-State: AOAM531A6ApCaTIOdL529Ub9mgqZDZy4jC6UNbuGoj5q9ao2fc2hDO4i
 ZAS8EmYcX5RotfbzV9gFGno=
X-Google-Smtp-Source: ABdhPJwXAz8ZOTvAC/VG1kSxgS4eZd/LlyKYrV0zaUVCNeKptK01ZrXsM1bQhtag1ewOlwAPidwdTg==
X-Received: by 2002:a05:6402:1383:: with SMTP id
 b3mr22875489edv.131.1614014597966; 
 Mon, 22 Feb 2021 09:23:17 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id y13sm603431eju.75.2021.02.22.09.23.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Feb 2021 09:23:17 -0800 (PST)
Subject: Re: [PATCH v3 5/6] hw/pci-host: Add emulation of Marvell MV64361 PPC
 system controller
To: BALATON Zoltan <balaton@eik.bme.hu>
References: <cover.1614007326.git.balaton@eik.bme.hu>
 <a18959c44349a5c5845e388a0e43a8bd04472b45.1614007326.git.balaton@eik.bme.hu>
 <6881b4dd-d8dc-4b40-cd1b-5f3755add6d1@amsat.org>
 <fa4f7bbb-3267-14a0-d20-c2a8836b79f4@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <b7f9872d-c346-4ffb-1463-2699dcaf0690@amsat.org>
Date: Mon, 22 Feb 2021 18:23:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <fa4f7bbb-3267-14a0-d20-c2a8836b79f4@eik.bme.hu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x532.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/22/21 6:01 PM, BALATON Zoltan wrote:
> On Mon, 22 Feb 2021, Philippe Mathieu-Daudé wrote:
>> On 2/22/21 4:22 PM, BALATON Zoltan wrote:
>>> The Marvell Discovery II aka. MV64361 is a PowerPC system controller
>>> chip that is used on the pegasos2 PPC board. This adds emulation of it
>>> that models the device enough to boot guests on this board. The
>>> mv643xx.h header with register definitions is taken from Linux 4.15.10
>>> only fixing end of line white space errors and removing not needed
>>> parts, it's otherwise keeps Linux formatting.
>>>
>>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>>> ---
>>>  hw/pci-host/Kconfig           |   3 +
>>>  hw/pci-host/meson.build       |   2 +
>>>  hw/pci-host/mv64361.c         | 966 ++++++++++++++++++++++++++++++++++
>>>  hw/pci-host/mv643xx.h         | 919 ++++++++++++++++++++++++++++++++
>>>  hw/pci-host/trace-events      |   6 +
>>>  include/hw/pci-host/mv64361.h |   8 +
>>>  include/hw/pci/pci_ids.h      |   1 +
>>>  7 files changed, 1905 insertions(+)
>>>  create mode 100644 hw/pci-host/mv64361.c
>>>  create mode 100644 hw/pci-host/mv643xx.h
>>>  create mode 100644 include/hw/pci-host/mv64361.h
>>
>> Is this the datasheet for this controller?
>> ftp://ftp.freecalypso.org/PowerPC/support_ics/mv64360/datasheets/DS_64360_1_2.pdf.zip
>>
>>
>> It seems to have common parts with the GT64120.
> 
> Yes, as noted on https://osdn.net/projects/qmiga/wiki/SubprojectPegasos2
> the GT64120 seems to be an older (and MIPS specific) version of this
> chip that Marvell bought and likely made this PPC version based on that.
> (The whole pegasos2 seems to be like a MIPS board with a PPC CPU even
> down to the firmware which looks quite like PMON just has SmartFirmware
> instead of the commands of PMON. So whoever designed it, might have
> taken inspiration from some MIPS hardware.) However the emulation of
> GT64xxx in QEMU seemed to be not complete and different enough so I
> haven't looked at that when implementing this so I don't know how much
> commonality is there and if that would worth reusing. (If you think
> there could be some reuse then that should be done separate of this
> series, afterwards it's merged.)

Yes, I see your patch is more complete. Fair enough.

