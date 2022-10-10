Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8EB25F9C76
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 12:12:11 +0200 (CEST)
Received: from localhost ([::1]:59538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohplZ-00023V-ML
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 06:12:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <michael@walle.cc>)
 id 1ohpYe-0007u9-5P; Mon, 10 Oct 2022 05:58:48 -0400
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1]:54938 helo=mail.3ffe.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <michael@walle.cc>)
 id 1ohpYb-0008Mm-UI; Mon, 10 Oct 2022 05:58:47 -0400
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.3ffe.de (Postfix) with ESMTPSA id 6454734;
 Mon, 10 Oct 2022 11:58:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2022082101; t=1665395920;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=doS3uktci//JWItlP3nDbv/Su8fLrA6PflNpZRthBjI=;
 b=quIS+gphPUAgsFpVW0Y4tw9icS9JMGt9rfqvxX9ipjcummvSiV7F6RTA/mY0CaMw1BuENc
 UrsxayrbPJdLdrHfKkj8cDLGyu7z5XZia28byRVkMhCgfqUo9XzsB2DZMd9NwIOvhF9Vw4
 hKqr8aMuwNIXiv+yBUz9VKr7ROPct28bCuK+b8XeIYeXJHwIerN23HSMiX2R5xtWY6ZW0u
 LNogG2/OMf3A1oNCWxvj8kVpsuz38bVPqFye7Kq7UkpsqaFiR3Ts1EGMGXM11qCvtZNMb5
 boBnNYUZ1IYf4ohk9pAtayp9YVY0tn4e7xsnzCupVus3j3TGqhh0KGKFAVe6Hw==
MIME-Version: 1.0
Date: Mon, 10 Oct 2022 11:58:40 +0200
From: Michael Walle <michael@walle.cc>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: Francisco Iglesias <frasse.iglesias@gmail.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, qemu-block@nongnu.org, Peter Maydell
 <peter.maydell@linaro.org>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery
 <andrew@aj.id.au>, Alistair Francis <alistair@alistair23.me>, Iris Chen
 <irischenlj@fb.com>
Subject: Re: [PATCH v3 4/8] m25p80: Add the mx25l25635f SFPD table
In-Reply-To: <6726971b-b862-2959-5e7e-c059be2bb07d@kaod.org>
References: <20220722063602.128144-1-clg@kaod.org>
 <20220722063602.128144-5-clg@kaod.org> <20221007144431.GE20384@fralle-msi>
 <6726971b-b862-2959-5e7e-c059be2bb07d@kaod.org>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <d6d2575b520fedb47a5fa7c1031c4ff7@walle.cc>
X-Sender: michael@walle.cc
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a01:4f8:c0c:9d57::1;
 envelope-from=michael@walle.cc; helo=mail.3ffe.de
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 2022-10-10 08:23, schrieb Cédric Le Goater:
> On 10/7/22 16:44, Francisco Iglesias wrote:

>>> --- a/hw/block/m25p80.c
>>> +++ b/hw/block/m25p80.c
>>> @@ -234,6 +234,8 @@ static const FlashPartInfo known_devices[] = {
>>>       { INFO("mx25l12855e", 0xc22618,      0,  64 << 10, 256, 0) },
>>>       { INFO6("mx25l25635e", 0xc22019,     0xc22019,  64 << 10, 512, 
>>> 0),
>>>         .sfdp_read = m25p80_sfdp_mx25l25635e },
>>> +    { INFO6("mx25l25635f", 0xc22019,     0xc22019,  64 << 10, 512, 
>>> 0),
>> 
>> I think I'm not seeing the extended id part in the datasheet I've 
>> found so
>> might be that you can switch to just INFO and _ext_id 0 above
> 
> This was added by commit 6bbe036f32dc ("m25p80: Return the JEDEC ID 
> twice for
> mx25l25635e") to fix a real breakage on HW.

 From my experience, the ID has a particular length, at least three bytes
and if you read past that length for some (all?) devices the id bytes 
just
get repeated. I.e. the counter in the device will just wrap to offset 0
again. If you want to emulate the hardware correctly, you would have to
take that into consideration.
But I don't think it's worth it, OTOH there seems to be some broken
software which rely on that (undefined?) behavior.

-michael

