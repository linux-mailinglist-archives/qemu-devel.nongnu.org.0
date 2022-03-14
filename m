Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F184D87ED
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 16:19:34 +0100 (CET)
Received: from localhost ([::1]:57202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTmTs-00086G-Su
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 11:19:32 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@ya.ru>)
 id 1nTmRP-00078K-Ni; Mon, 14 Mar 2022 11:17:00 -0400
Received: from forward501p.mail.yandex.net ([77.88.28.111]:41466)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@ya.ru>)
 id 1nTmRM-0002p3-3p; Mon, 14 Mar 2022 11:16:59 -0400
Received: from iva5-24f2fff9e38d.qloud-c.yandex.net
 (iva5-24f2fff9e38d.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:5ca0:0:640:24f2:fff9])
 by forward501p.mail.yandex.net (Yandex) with ESMTP id 9D0A96212B2E;
 Mon, 14 Mar 2022 18:16:47 +0300 (MSK)
Received: from iva1-dcde80888020.qloud-c.yandex.net
 (iva1-dcde80888020.qloud-c.yandex.net [2a02:6b8:c0c:7695:0:640:dcde:8088])
 by iva5-24f2fff9e38d.qloud-c.yandex.net (mxback/Yandex) with ESMTP id
 z6kb17Fqym-GleeEPgT; Mon, 14 Mar 2022 18:16:47 +0300
X-Yandex-Fwd: 2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ya.ru; s=mail;
 t=1647271007; bh=virY/u9NZIhlctN9U01QOuV0lpmD6ngRiPE55SjYNo0=;
 h=In-Reply-To:From:Subject:Cc:References:Date:Message-ID:To;
 b=QizHihWUdwKfbe6IQmCnEZBk0MXO7UdcUa5ZV9CpELQZK9PE2gokMD3/sTpfpYHBJ
 SLpwlukYmGeCdypuQe1sCAAxw2Mu4hV5Riyn1ZuS45NbayWrRX5Cvl8aEkvAg77E0F
 1MrNr74lTj3/S9w86h9X2X4S6vkryoP6vJ59hBvw=
Authentication-Results: iva5-24f2fff9e38d.qloud-c.yandex.net;
 dkim=pass header.i=@ya.ru
Received: by iva1-dcde80888020.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA
 id 2uxOs8zcWA-GkJChfLD; Mon, 14 Mar 2022 18:16:46 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Message-ID: <126e0c8a-c9d5-384b-f857-e26bfcd9fbf3@ya.ru>
Date: Mon, 14 Mar 2022 18:16:46 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] MAINTAINERS: change Vladimir's email address
Content-Language: en-US
To: Eric Blake <eblake@redhat.com>
References: <20220314110415.222496-1-v.sementsov-og@ya.ru>
 <20220314144715.piqpqta6chosvpcc@redhat.com>
From: Vladimir Sementsov-Ogievskiy <v.sementsov-og@ya.ru>
In-Reply-To: <20220314144715.piqpqta6chosvpcc@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=77.88.28.111; envelope-from=v.sementsov-og@ya.ru;
 helo=forward501p.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

14.03.2022 17:47, Eric Blake wrote:
> On Mon, Mar 14, 2022 at 02:04:15PM +0300, Vladimir Sementsov-Ogievskiy wrote:
>> Old vsementsov@virtuozzo.com is not accessible anymore.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <v.sementsov-og@ya.ru>
>> ---
>>
>> Hi all!
>>
>> That's my new address: v.sementsov-og@ya.ru , the old one is not
>> available anymore.
> 
> I am not envious of your situation when observing the geopolitical
> forces at work that are likely behind this sudden change of email
> address.  Best wishes to you and your collegues through these trying
> times, in dealing with the ripple effects of sanctions for the actions
> of others.
> 
>>
>> I've also subscribed this new address for qemu-devel mailing list, but
>> not yet get any message from it :(
> 
> I can queue this through my NBD tree,

Good for me, thanks!

Also, look at
[PATCH v2] block/nbd.c: Fixed IO request coroutine not being wakeup when kill NBD server

Still, I think, let's wait a bit to be sure that everything works with my new address. For example, I've waited ~3 hours until my message get into mailing list. And I still don't see any email from qemu-devel in my inbox (I've subscribed at https://lists.nongnu.org/mailman/listinfo/qemu-devel ), probably pre-moderation process is not yet done. Will see how fast this my answer appear in mailing list archives..

> but I will first wait to see if
> you can at least acknowledge this response (so that I feel more
> comfortable adding my Reviewed-by).
> 
>>
>> The patch is also available as pgp-signed tag at:
>>
>>    https://src.openvz.org/scm/~vsementsov/qemu.git tags/change-address
>>
>>
>>   MAINTAINERS | 12 ++++++------
>>   1 file changed, 6 insertions(+), 6 deletions(-)
> 
> 


-- 
Best regards,
Vladimir

