Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 567C6412735
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 22:13:15 +0200 (CEST)
Received: from localhost ([::1]:51002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSPf7-00022C-O7
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 16:13:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mSPeA-0001LQ-TO
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 16:12:14 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:40127)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mSPe9-0002g5-2A
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 16:12:14 -0400
Received: from [192.168.100.1] ([82.64.211.94]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MJEpp-1m9MI51lpz-00Kfgn; Mon, 20 Sep 2021 22:12:10 +0200
Subject: Re: [PATCH v4 17/20] nubus-bridge: make slot_available_mask a qdev
 property
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
References: <20210917075057.20924-1-mark.cave-ayland@ilande.co.uk>
 <20210917075057.20924-18-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <2fa5aa17-00dc-99ae-de29-d61515eafd2d@vivier.eu>
Date: Mon, 20 Sep 2021 22:12:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210917075057.20924-18-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Nr9rlShicyeleomSvKQ+6vn1c5NlQS91KdHcVlkUmRDxi/AAKZU
 mxPO4mu3TpQRlUTwfAPBRf19QBVqgbjeQKiZL9pVVW/ZlY7CxqLmJEYckQ/IT1vWF2hRXLo
 ttXbzgruPWNKu75BNPh39KvjPoCtY5l5UFOupvAuUazt20eLlGtIl4nmso981eaBkCtXl2N
 ESjwPzDFS9v7y7ooVyDtw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:+6PJBaoKEUQ=:YNGaHScSuC/vPNmFWm3hCU
 o5ChBCG23xAGVt1jMCIqnZEZa2/drOpeCwFOraoUZX8skWs/e9D2oVEZXWaSDe6KpLJdVPXhM
 SMWtnLsFQ7bVrc3rJLYzhaSCYr3hicnz6uTfM327NCqHNfijhtj03ya4b9No590Ge40KqJnJ1
 5Tf61d5VOxzBLaQAMShyGWvEryZM3/KUbEThJEBT0dy96cZfDVqXtgNIy4O+GhMeKaPqpZnBn
 G9pu6hIkvsMnxw31ek0issHAM0AzHcvvypqAyOjXqaks1PUYkLjVQYbQS1uWBJhK7gP79f4q1
 6GBoeTI3E2K4ZPrC+Jqt57WB7tp4IzDAEEUDCP1HPj/fyuhxwEJVYoDFg4J0d+xP7uWRHPWmx
 OVqo/wyWpYn+YOSAVhga/ZDW7GlHaxdG0cLxRkihrAbRpNQFuQQa30wGUa3KK3EXXDoRqIVuo
 GAf2YV5SkX6Hdf85eewtsuAByq+mYYao7bMODGp51VpFG7lfYwv1G4QsD4lCifqLV+UZadmqL
 4tnvKCdthbz/UfiphnXBfvQjjHiMhFpqklRarA68R6ImoIN4a25o4Kp4sb4FKEh9LrB2+UhBf
 pU/yBk2cyGt5P+wLZ3SDHD5D79fCyFREZ9h2FR1L+B5z3rQYVguCdVwz4wJCyoIc85FjFm7sl
 iRKAOnAruqhe+yJP3rGC40Vi6rdSrYfiN/b5He/MJIoNz7PaIAdn1RG99akOPrAsOtc7ae7rU
 TAMpv/tIny8eDUO5ShcLO7qV+LgUGMKbrh+Kjg==
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Le 17/09/2021 à 09:50, Mark Cave-Ayland a écrit :
> This is to allow Macintosh machines to further specify which slots are available
> since the number of addressable slots may not match the number of physical slots
> present in the machine.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/nubus/nubus-bridge.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/hw/nubus/nubus-bridge.c b/hw/nubus/nubus-bridge.c
> index 1adda7f5a6..2c7c4ee121 100644
> --- a/hw/nubus/nubus-bridge.c
> +++ b/hw/nubus/nubus-bridge.c
> @@ -21,11 +21,18 @@ static void nubus_bridge_init(Object *obj)
>      qbus_create_inplace(bus, sizeof(s->bus), TYPE_NUBUS_BUS, DEVICE(s), NULL);
>  }
>  
> +static Property nubus_bridge_properties[] = {
> +    DEFINE_PROP_UINT32("slot-available-mask", NubusBridge,
> +                       bus.slot_available_mask, 0xffff),

So you can remove the "nubus->slot_available_mask = MAKE_64BIT_MASK(0, 16);" in nubus_init()?

> +    DEFINE_PROP_END_OF_LIST()
> +};
> +
>  static void nubus_bridge_class_init(ObjectClass *klass, void *data)
>  {
>      DeviceClass *dc = DEVICE_CLASS(klass);
>  
>      dc->fw_name = "nubus";
> +    device_class_set_props(dc, nubus_bridge_properties);
>  }
>  
>  static const TypeInfo nubus_bridge_info = {
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

