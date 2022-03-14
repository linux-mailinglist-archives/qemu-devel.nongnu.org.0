Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FC534D8987
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 17:41:46 +0100 (CET)
Received: from localhost ([::1]:48592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTnlR-0007hF-A1
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 12:41:45 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@ya.ru>)
 id 1nTnkV-0006nE-Bd; Mon, 14 Mar 2022 12:40:47 -0400
Received: from forward500o.mail.yandex.net ([37.140.190.195]:53292)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@ya.ru>)
 id 1nTnkS-0007vx-7P; Mon, 14 Mar 2022 12:40:46 -0400
Received: from myt5-17da64a172c0.qloud-c.yandex.net
 (myt5-17da64a172c0.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:1bad:0:640:17da:64a1])
 by forward500o.mail.yandex.net (Yandex) with ESMTP id B937394144B;
 Mon, 14 Mar 2022 19:40:35 +0300 (MSK)
Received: from myt6-9bdf92ffd111.qloud-c.yandex.net
 (myt6-9bdf92ffd111.qloud-c.yandex.net [2a02:6b8:c12:468a:0:640:9bdf:92ff])
 by myt5-17da64a172c0.qloud-c.yandex.net (mxback/Yandex) with ESMTP id
 zBziJlVRkR-eZea5P54; Mon, 14 Mar 2022 19:40:35 +0300
X-Yandex-Fwd: 2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ya.ru; s=mail;
 t=1647276035; bh=DCQ7AQOeeRBwBU8AB0vhBX36CbdGAuwA+4ZpCkiBQmg=;
 h=In-Reply-To:From:Subject:Cc:References:Date:Message-ID:To;
 b=aZXz0VVtea09UsntjtqavHMByPOclK/JQ+0kazok1fqG3ErqnDmELI+Nh83DVjEv8
 1Lo6cPO/3CeCeqL7/x84SJjzYr9ZNB2nzZMTvx19ISIoTVA0jeYnQWB95nxNzsCpJH
 mYW275dtuOZA9jGJecvTtggs09xG56stgpDVQd3U=
Authentication-Results: myt5-17da64a172c0.qloud-c.yandex.net;
 dkim=pass header.i=@ya.ru
Received: by myt6-9bdf92ffd111.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA
 id w9S6202AMH-eZJOPLYp; Mon, 14 Mar 2022 19:40:35 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Message-ID: <0a3177b3-abf7-d926-0808-1675d4b8d8ed@ya.ru>
Date: Mon, 14 Mar 2022 19:40:34 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] MAINTAINERS: change Vladimir's email address
Content-Language: en-US
From: Vladimir Sementsov-Ogievskiy <v.sementsov-og@ya.ru>
To: Eric Blake <eblake@redhat.com>
References: <20220314110415.222496-1-v.sementsov-og@ya.ru>
 <20220314144715.piqpqta6chosvpcc@redhat.com>
 <126e0c8a-c9d5-384b-f857-e26bfcd9fbf3@ya.ru>
In-Reply-To: <126e0c8a-c9d5-384b-f857-e26bfcd9fbf3@ya.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=37.140.190.195; envelope-from=v.sementsov-og@ya.ru;
 helo=forward500o.mail.yandex.net
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

14.03.2022 18:16, Vladimir Sementsov-Ogievskiy wrote:
> 14.03.2022 17:47, Eric Blake wrote:
>> On Mon, Mar 14, 2022 at 02:04:15PM +0300, Vladimir Sementsov-Ogievskiy wrote:
>>> Old vsementsov@virtuozzo.com is not accessible anymore.
>>>
>>> Signed-off-by: Vladimir Sementsov-Ogievskiy <v.sementsov-og@ya.ru>
>>> ---
>>>
>>> Hi all!
>>>
>>> That's my new address: v.sementsov-og@ya.ru , the old one is not
>>> available anymore.
>>
>> I am not envious of your situation when observing the geopolitical
>> forces at work that are likely behind this sudden change of email
>> address.  Best wishes to you and your collegues through these trying
>> times, in dealing with the ripple effects of sanctions for the actions
>> of others.
>>
>>>
>>> I've also subscribed this new address for qemu-devel mailing list, but
>>> not yet get any message from it :(
>>
>> I can queue this through my NBD tree,
> 
> Good for me, thanks!
> 
> Also, look at
> [PATCH v2] block/nbd.c: Fixed IO request coroutine not being wakeup when kill NBD server
> 
> Still, I think, let's wait a bit to be sure that everything works with my new address. For example, I've waited ~3 hours until my message get into mailing list. And I still don't see any email from qemu-devel in my inbox (I've subscribed at https://lists.nongnu.org/mailman/listinfo/qemu-devel ), probably pre-moderation process is not yet done. Will see how fast this my answer appear in mailing list archives..

OK, I found confirmation email in spam folder, and now it works well)

> 
>> but I will first wait to see if
>> you can at least acknowledge this response (so that I feel more
>> comfortable adding my Reviewed-by).
>>
>>>
>>> The patch is also available as pgp-signed tag at:
>>>
>>>    https://src.openvz.org/scm/~vsementsov/qemu.git tags/change-address
>>>
>>>
>>>   MAINTAINERS | 12 ++++++------
>>>   1 file changed, 6 insertions(+), 6 deletions(-)
>>
>>
> 
> 


-- 
Best regards,
Vladimir

