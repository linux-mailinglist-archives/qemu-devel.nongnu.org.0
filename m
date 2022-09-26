Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD2D25EA679
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 14:48:00 +0200 (CEST)
Received: from localhost ([::1]:55574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocnWi-0001qq-0C
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 08:48:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1ocnTF-0007GI-Cn; Mon, 26 Sep 2022 08:44:25 -0400
Received: from forwardcorp1j.mail.yandex.net ([2a02:6b8:0:1619::183]:57018)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1ocnTB-0005gA-I1; Mon, 26 Sep 2022 08:44:24 -0400
Received: from sas1-7470331623bb.qloud-c.yandex.net
 (sas1-7470331623bb.qloud-c.yandex.net
 [IPv6:2a02:6b8:c08:bd1e:0:640:7470:3316])
 by forwardcorp1j.mail.yandex.net (Yandex) with ESMTP id 46A062E1BE2;
 Mon, 26 Sep 2022 15:44:10 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b683::1:39] (unknown
 [2a02:6b8:b081:b683::1:39])
 by sas1-7470331623bb.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 mo9Sk3CNEX-i9PCvq2V; Mon, 26 Sep 2022 15:44:09 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1664196249; bh=wOzHnk9PRS17iTHuilZjLD+NmGpn255DrF/IJ+xxwyE=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=DjRpPbtaEoCHLGry4PA4KtbCOG8OREgw3tyDdhuxhi+8RLtQCt5AhSpwhANM5WDTB
 6jG4R1UaZL7JuCdbANWnbMw50lYqxayl5z1/vBe0lxb7zZDZpt2xJQ72W5j1uYzKD1
 i04cpCvgMr9Cj+S7t+rFFh+MGbjCne4p/rZklX5Y=
Authentication-Results: sas1-7470331623bb.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <50b3e1ee-8bba-ae28-ca0e-4cb489a65ad5@yandex-team.ru>
Date: Mon, 26 Sep 2022 15:44:08 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] qemu-nbd: set timeout to qemu-nbd socket
Content-Language: en-US
To: "Denis V. Lunev" <den@virtuozzo.com>, luzhipeng <luzhipeng@cestc.cn>,
 qemu-devel <qemu-devel@nongnu.org>
Cc: Eric Blake <eblake@redhat.com>, qemu-block@nongnu.org
References: <20220925135308.481-1-luzhipeng@cestc.cn>
 <2718426c-dd89-5b50-29c4-63f0d6c9b25f@yandex-team.ru>
 <02a2279b-fcb2-c90d-7598-af029ea8261a@virtuozzo.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <02a2279b-fcb2-c90d-7598-af029ea8261a@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a02:6b8:0:1619::183;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1j.mail.yandex.net
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.319,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/26/22 14:34, Denis V. Lunev wrote:
> On 9/26/22 12:05, Vladimir Sementsov-Ogievskiy wrote:
>> [+ Den]
>>
>> On 9/25/22 16:53, luzhipeng wrote:
>>> From: lu zhipeng <luzhipeng@cestc.cn>
>>>
>>> Prevent the NBD socket stuck all the time, So
>>> set timeout.
>>>
>>> Signed-off-by: lu zhipeng <luzhipeng@cestc.cn>
>>> ---
>>>   nbd/client.c | 8 ++++++++
>>>   1 file changed, 8 insertions(+)
>>>
>>> diff --git a/nbd/client.c b/nbd/client.c
>>> index 30d5383cb1..89dde53a0f 100644
>>> --- a/nbd/client.c
>>> +++ b/nbd/client.c
>>> @@ -24,6 +24,8 @@
>>>   #include "nbd-internal.h"
>>>   #include "qemu/cutils.h"
>>>   +#define NBD_DEFAULT_TIMEOUT 30
>>> +
>>>   /* Definitions for opaque data types */
>>>     static QTAILQ_HEAD(, NBDExport) exports = QTAILQ_HEAD_INITIALIZER(exports);
>>> @@ -1301,6 +1303,12 @@ int nbd_init(int fd, QIOChannelSocket *sioc, NBDExportInfo *info,
>>>           }
>>>       }
>>>   +    if (ioctl(fd, NBD_SET_TIMEOUT, NBD_DEFAULT_TIMEOUT) < 0) {
>>> +        int serrno = errno;
>>> +        error_setg(errp, "Failed setting timeout");
>>> +        return -serrno;
>>> +    }
>>> +
>>>       trace_nbd_init_finish();
>>>         return 0;
>>
>>
>> Personally, I don't see a problem in enabling timeout by default.. But probably we need a new option instead?
>>
>>
> I believe that this should be the same story as we have had with
> KEEPALIVE. This should be set as an option and downstream
> will change its default when necessary.
> 

It's also interesting, how NBD_SET_TIMEOUT would interfere with keep-alive options set on the socket. Isn't existing keep-alive option already enough, do we need both timeouts?

(and yes, if we need both ways for different cases, we definitely should keep a possibility for the user to enable only one timeout, so now I agree, that we need an option for this new feature)


-- 
Best regards,
Vladimir

