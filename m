Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35C6168B847
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 10:10:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOxUw-0000AG-85; Mon, 06 Feb 2023 04:09:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pOxUu-00009v-2F; Mon, 06 Feb 2023 04:09:12 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pOxUs-0005WK-HF; Mon, 06 Feb 2023 04:09:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1/k7xY9o/iXXb705p1uZOM47g34ZOFhrckFZPem2mro=; b=cZysk+daDdWggLLCt7MZQcToxt
 xm6ccy0I/B0AbOjcSbsFDLyCMDYl/HSBwR/zNw4+COSj+KkivgYkIjOjhegaKZhx3GJp+If9jwjOy
 tt7eQYFE4vv+Qheq1u8dfJ/bNR48KMCZoJkkHx65txVLgtG0XjzhWmst5y4PPBWLuVlJKIG5VXY8p
 2mLe3jAKgQ9A9LFShT15tDfKxSxcVZDRfMzFqI6YRgOjJI86WRkx4y2oyBYK79y+Tg6nF1IlU4MQQ
 IMWJpcS0KVRb576jJjDZnD8B7tyg6kxHV3MGKDzwEc+jIsirka1VDum/aQoiIzOIR1hQaSahV8NOO
 ipH+d2LZLmHKpTIuOGrNWvshpgUPOHVCtG9KhB/NK/OvB6voc10Th3MVi9AuU+L+JSLzblzW4wbGT
 ycaH/HZTAA2DrfvCOxl6+5FMAramrNYKuPT9Wor5MI2ZYl+JXSLl6j3YzLsTiTT8xAJxSun/nnWDf
 wMQCnu3ulp34chvaF2cugGoVvAtU6Dmhp6mZyXwpc7tC/JRkKZFh/RwfC5Xw38f0GhpLfV+O4IZ7n
 F8VLNupevCoSm2bK8aaGuk1kyJb8bZ8q/Zgh9NMsPgblCPpvZljYMgAZaEaW6h9uUPz8auzwKwyO1
 AqesAp79GbTNNxUox9O3sPiqjr/azfqDXWBy0vjDc=;
Received: from host86-130-37-175.range86-130.btcentralplus.com
 ([86.130.37.175] helo=[10.8.0.6])
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pOxUL-000BEf-BD; Mon, 06 Feb 2023 09:08:37 +0000
Message-ID: <728f00c4-e227-06ac-ffc8-1b306e9dc671@ilande.co.uk>
Date: Mon, 6 Feb 2023 09:09:01 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: BALATON Zoltan <balaton@eik.bme.hu>, qemu-ppc@nongnu.org,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20230203211623.50930-1-philmd@linaro.org>
 <0b763708-6a54-b789-1bbf-56c1c7ce708b@kaod.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <0b763708-6a54-b789-1bbf-56c1c7ce708b@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.130.37.175
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 0/5] hw/ppc: Set QDev properties using QDev API (part 2/3)
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.149,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 06/02/2023 08:00, Cédric Le Goater wrote:

> On 2/3/23 22:16, Philippe Mathieu-Daudé wrote:
>> part 1 [*] cover:
>> -- 
>> QEMU provides the QOM API for core objects.
>> Devices are modelled on top of QOM as QDev objects.
>>
>> There is no point in using the lower level QOM API with
>> QDev; it makes the code more complex and harder to review.
>>
>> I first converted all the calls using errp=&error_abort or
>> &errp=NULL, then noticed the other uses weren't really
>> consistent.
> 
> 6/8 years ago, we converted models to QOM, supposedly because the qdev
> interface was legacy and QOM was the new way. That's not true anymore ?

That is a good question, and something that we really should decide first before 
going ahead with these changes. My understanding is that architectures with newer 
machines (particularly ARM and PPC) use QOM APIs directly, however more recently 
Markus did some improvements to qdev which largely eliminated the gap between the 
two. Hence why these days the two are mostly interchangeable: the main difference is 
that qdev has a notion of a parent which can be useful during device modelling.

> That said, I am ok with changes, even for the best practices. I would
> like to know how to keep track. Do we have a model skeleton/reference ?

Agreed. I've added Peter on CC as I know he has had some thoughts on QOM vs. qdev, 
but certainly as a reviewer it would be great to know which way we should be heading 
in the future.


ATB,

Mark.

