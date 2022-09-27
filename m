Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E65A5EBA95
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 08:26:09 +0200 (CEST)
Received: from localhost ([::1]:55302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od42i-0001WG-Gi
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 02:26:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luzhipeng@cestc.cn>)
 id 1od3tr-0004TQ-FM; Tue, 27 Sep 2022 02:17:02 -0400
Received: from [106.39.185.57] (port=59814 helo=smtp.cecloud.com)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <luzhipeng@cestc.cn>)
 id 1od3to-0007n6-79; Tue, 27 Sep 2022 02:16:59 -0400
Received: from localhost (localhost [127.0.0.1])
 by smtp.cecloud.com (Postfix) with ESMTP id B93E7FC0209;
 Tue, 27 Sep 2022 14:16:49 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ANTISPAM-LEVEL: 2
X-SKE-CHECKED: 1
X-ABS-CHECKED: 1
Received: from [10.32.181.78] (unknown [111.48.58.10])
 by smtp.cecloud.com (postfix) whith ESMTP id
 P51407T281470966559088S1664259408439500_; 
 Tue, 27 Sep 2022 14:16:49 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <9b5cb38db96bf1619e69e062358a7def>
X-RL-SENDER: luzhipeng@cestc.cn
X-SENDER: luzhipeng@cestc.cn
X-LOGIN-NAME: luzhipeng@cestc.cn
X-FST-TO: vsementsov@yandex-team.ru
X-RCPT-COUNT: 5
X-SENDER-IP: 111.48.58.10
X-ATTACHMENT-NUM: 0
X-System-Flag: 0
Message-ID: <1ba82bba-5dd4-c678-664c-256be4ffb751@cestc.cn>
Date: Tue, 27 Sep 2022 14:16:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [PATCH] qemu-nbd: set timeout to qemu-nbd socket
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 "Denis V. Lunev" <den@virtuozzo.com>, qemu-devel <qemu-devel@nongnu.org>
Cc: Eric Blake <eblake@redhat.com>, qemu-block@nongnu.org
References: <20220925135308.481-1-luzhipeng@cestc.cn>
 <2718426c-dd89-5b50-29c4-63f0d6c9b25f@yandex-team.ru>
 <02a2279b-fcb2-c90d-7598-af029ea8261a@virtuozzo.com>
 <50b3e1ee-8bba-ae28-ca0e-4cb489a65ad5@yandex-team.ru>
From: luzhipeng <luzhipeng@cestc.cn>
In-Reply-To: <50b3e1ee-8bba-ae28-ca0e-4cb489a65ad5@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 106.39.185.57 (failed)
Received-SPF: pass client-ip=106.39.185.57; envelope-from=luzhipeng@cestc.cn;
 helo=smtp.cecloud.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.319,
 RCVD_IN_SBL_CSS=3.335, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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



在 2022/9/26 20:44, Vladimir Sementsov-Ogievskiy 写道:
> On 9/26/22 14:34, Denis V. Lunev wrote:
>> On 9/26/22 12:05, Vladimir Sementsov-Ogievskiy wrote:
>>> [+ Den]
>>>
>>> On 9/25/22 16:53, luzhipeng wrote:
>>>> From: lu zhipeng <luzhipeng@cestc.cn>
>>>>
>>>> Prevent the NBD socket stuck all the time, So
>>>> set timeout.
>>>>
>>>> Signed-off-by: lu zhipeng <luzhipeng@cestc.cn>
>>>> ---
>>>>   nbd/client.c | 8 ++++++++
>>>>   1 file changed, 8 insertions(+)
>>>>
>>>> diff --git a/nbd/client.c b/nbd/client.c
>>>> index 30d5383cb1..89dde53a0f 100644
>>>> --- a/nbd/client.c
>>>> +++ b/nbd/client.c
>>>> @@ -24,6 +24,8 @@
>>>>   #include "nbd-internal.h"
>>>>   #include "qemu/cutils.h"
>>>>   +#define NBD_DEFAULT_TIMEOUT 30
>>>> +
>>>>   /* Definitions for opaque data types */
>>>>     static QTAILQ_HEAD(, NBDExport) exports = 
>>>> QTAILQ_HEAD_INITIALIZER(exports);
>>>> @@ -1301,6 +1303,12 @@ int nbd_init(int fd, QIOChannelSocket *sioc, 
>>>> NBDExportInfo *info,
>>>>           }
>>>>       }
>>>>   +    if (ioctl(fd, NBD_SET_TIMEOUT, NBD_DEFAULT_TIMEOUT) < 0) {
>>>> +        int serrno = errno;
>>>> +        error_setg(errp, "Failed setting timeout");
>>>> +        return -serrno;
>>>> +    }
>>>> +
>>>>       trace_nbd_init_finish();
>>>>         return 0;
>>>
>>>
>>> Personally, I don't see a problem in enabling timeout by default.. 
>>> But probably we need a new option instead?
>>>
>>>
>> I believe that this should be the same story as we have had with
>> KEEPALIVE. This should be set as an option and downstream
>> will change its default when necessary.
>>
> 
> It's also interesting, how NBD_SET_TIMEOUT would interfere with 
> keep-alive options set on the socket. Isn't existing keep-alive option 
> already enough, do we need both timeouts?
> 
> (and yes, if we need both ways for different cases, we definitely should 
> keep a possibility for the user to enable only one timeout, so now I 
> agree, that we need an option for this new feature)

Keep alive is only valid for tcp, but not for unix sockets



