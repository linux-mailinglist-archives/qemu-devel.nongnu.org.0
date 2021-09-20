Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B39EF4128A8
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 00:08:16 +0200 (CEST)
Received: from localhost ([::1]:32944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSRSR-0006g6-OM
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 18:08:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mSR5v-0002lQ-5J
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 17:44:59 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:57789)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mSR5s-0001MN-0Z
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 17:44:57 -0400
Received: from [192.168.100.1] ([82.142.21.142]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MAwPf-1mYnxU2URt-00BMVM; Mon, 20 Sep 2021 23:44:53 +0200
Subject: Re: [PATCH v4 09/20] macfb: don't register declaration ROM
From: Laurent Vivier <laurent@vivier.eu>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
References: <20210917075057.20924-1-mark.cave-ayland@ilande.co.uk>
 <20210917075057.20924-10-mark.cave-ayland@ilande.co.uk>
 <a65fbc89-681c-22b5-87d4-31d37de15559@vivier.eu>
Message-ID: <da82daeb-7226-46ff-5c0e-4025b24ba3d0@vivier.eu>
Date: Mon, 20 Sep 2021 23:44:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <a65fbc89-681c-22b5-87d4-31d37de15559@vivier.eu>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:DdxtcTNw00LaI95BemGuypGrHRXDCH7Gp8H9KL/nsYNCz4wpCUN
 ZrRPrJIboY53R+phmWjeHONpgZkRMxQmGvnjO0wGIYsVcNxq+3iM2MhxwcfJvsUd4617YIw
 eTKc6/e/AjDMaYsU0CHvTuH9n4izkUxXBBHtw8/6b0w4n2TCXftsnY/632RJe6X6ekH252K
 2Y5AP40UB8EQZvM1ondHg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:hiSAK5le/gM=:34xCLP0RcADMJagUY6rOkj
 eoa2Dno9AZygR08HCVR8g69v2ojSNXkHbVGSKvhtR9x1nUN0NG3Fw0fRoYDBu3Fg8PgyLlBVb
 MK8BvNrY2nzXt8QP1kKCoe15RvKeY6BtCitnrIRP8v2oLHAGjyKAUHR90gSHjsbolMVhYwVQZ
 shxPQ2sifSSILhsGFkA/R4LyR68YtXjku9+WcNJp0wC6g79ljJZfxyrA+DRg00w4JqufbpV3g
 i58iXboIE6gyEozPIQ9P+jikvyDxZGJdMzDcqD6b3+9BMHIRZw/iSb1Y9kEUuDpCfRzQ+V+oy
 mnKcLgo8ejz+7D9tfToN2mZZ2rRC/bUd10mCTysJwufjT84RwKQjCcvh9XnYwFQaMyGH/z2PL
 xsYPZagAdkZASIrMRJOzbwRxUE4cO6a+7N9cAKLpsUvh/+iuES3vOuyfy4ThSem+4dDG49h8A
 IY9y+brZMwlpuG+3DEodYfv00U60q144CqVl0T0SLdvlqZJnuiPh/YbBWiaIAoGpeEZsYCFkl
 o7NNACfIclUDpTFqwo5Fa3KULVVnzlnYCIohyxOCJOVNQDpvQXWjRqi1DMpMkD1FoqkubWMKF
 78ahLLiJbVW0eAaDoxnd29fZ8zKqCtax0+EVIW5mMwheFaXiApoGqdRLJ034vDZUpyzVZafI1
 Nt6c2F0z7rsm4Ib2er15CTCxq3B8afMf//8vevvZ+Uh5uQXc1Yu/spRYMLwal8hUj5Y7TpS9W
 7vUHCkKOXH1ijNnZVIP0RDEeGJsUdX1qyAVlVQ==
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 20/09/2021 à 22:01, Laurent Vivier a écrit :
> Le 17/09/2021 à 09:50, Mark Cave-Ayland a écrit :
>> The macfb device is an on-board framebuffer and so is initialised by the
>> system declaration ROM included within the MacOS toolbox ROM.
>>
>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
>> ---
>>  hw/display/macfb.c | 6 ------
>>  1 file changed, 6 deletions(-)
>>
>> diff --git a/hw/display/macfb.c b/hw/display/macfb.c
>> index d8183b9bbd..76808b69cc 100644
>> --- a/hw/display/macfb.c
>> +++ b/hw/display/macfb.c
>> @@ -383,10 +383,6 @@ static void macfb_sysbus_realize(DeviceState *dev, Error **errp)
>>      sysbus_init_mmio(SYS_BUS_DEVICE(s), &ms->mem_vram);
>>  }
>>  
>> -const uint8_t macfb_rom[] = {
>> -    255, 0, 0, 0,
>> -};
>> -
>>  static void macfb_nubus_realize(DeviceState *dev, Error **errp)
>>  {
>>      NubusDevice *nd = NUBUS_DEVICE(dev);
>> @@ -399,8 +395,6 @@ static void macfb_nubus_realize(DeviceState *dev, Error **errp)
>>      macfb_common_realize(dev, ms, errp);
>>      memory_region_add_subregion(&nd->slot_mem, DAFB_BASE, &ms->mem_ctrl);
>>      memory_region_add_subregion(&nd->slot_mem, VIDEO_BASE, &ms->mem_vram);
>> -
>> -    nubus_register_rom(nd, macfb_rom, sizeof(macfb_rom), 1, 9, 0xf);
>>  }
>>  
>>  static void macfb_sysbus_reset(DeviceState *d)
>>
> 
> Will macfb continue to work with "-kernel" and without providing any MacOS ROM?

My Quadra doesn't seem to report any ROM on boot, so it must be fine

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

