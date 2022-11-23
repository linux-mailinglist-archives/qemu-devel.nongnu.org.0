Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 517AC6350AC
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Nov 2022 07:51:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxja5-0005Uo-1b; Wed, 23 Nov 2022 01:50:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>)
 id 1oxja3-0005Uc-80; Wed, 23 Nov 2022 01:49:59 -0500
Received: from mail.weilnetz.de ([37.120.169.71]
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>)
 id 1oxja1-0002dj-1S; Wed, 23 Nov 2022 01:49:58 -0500
Received: from [192.168.178.59] (p5b151d14.dip0.t-ipconnect.de [91.21.29.20])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTPSA id 237B1DA0D81;
 Wed, 23 Nov 2022 07:49:54 +0100 (CET)
Message-ID: <06a55dd7-4d98-8c6c-c9aa-b1f4222829d8@weilnetz.de>
Date: Wed, 23 Nov 2022 07:49:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
To: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
Cc: Stefan Hajnoczi <stefanha@gmail.com>, Laurent Vivier <laurent@vivier.eu>, 
 Kevin Wolf <kwolf@redhat.com>
References: <20221105102448.436469-1-sw@weilnetz.de>
 <20221105102448.436469-4-sw@weilnetz.de>
 <4a950024-4758-b328-5968-656d0e72b043@weilnetz.de>
 <cf752a2d-edb7-4b04-0b21-6e2f38112d6d@weilnetz.de>
Subject: Re: [PATCH for-7.2 v2 3/4] libvhost-user: Fix two more format strings
In-Reply-To: <cf752a2d-edb7-4b04-0b21-6e2f38112d6d@weilnetz.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=37.120.169.71; envelope-from=sw@weilnetz.de;
 helo=mail.v2201612906741603.powersrv.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Reply-to:  Stefan Weil <sw@weilnetz.de>
From:  Stefan Weil via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Am 23.11.22 um 07:35 schrieb Stefan Weil:
> Am 15.11.22 um 08:25 schrieb Stefan Weil:
>> Am 05.11.22 um 11:24 schrieb Stefan Weil:
>>
>>> This fix is required for 32 bit host. The bug was detected by CI
>>> for arm-linux, but is also relevant for i386-linux.
>>>
>>> Reported-by: Stefan Hajnoczi <stefanha@gmail.com>
>>> Signed-off-by: Stefan Weil <sw@weilnetz.de>
>>> ---
>>>   subprojects/libvhost-user/libvhost-user.c | 3 ++-
>>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/subprojects/libvhost-user/libvhost-user.c 
>>> b/subprojects/libvhost-user/libvhost-user.c
>>> index d67953a1c3..80f9952e71 100644
>>> --- a/subprojects/libvhost-user/libvhost-user.c
>>> +++ b/subprojects/libvhost-user/libvhost-user.c
>>> @@ -651,7 +651,8 @@ generate_faults(VuDev *dev) {
>>>           if (ioctl(dev->postcopy_ufd, UFFDIO_REGISTER, &reg_struct)) {
>>>               vu_panic(dev, "%s: Failed to userfault region %d "
>>> -                          "@%" PRIx64 " + size:%zx offset: %zx: 
>>> (ufd=%d)%s\n",
>>> +                          "@%" PRIx64 " + size:%" PRIx64 " offset: 
>>> %" PRIx64
>>> +                          ": (ufd=%d)%s\n",
>>>                        __func__, i,
>>>                        dev_region->mmap_addr,
>>>                        dev_region->size, dev_region->mmap_offset,
>>
>>
>> There is still no review for this patch.
>>
>> I added "for-7.2" to the subject here in my answer. How can we get all 
>> 4 patches of this series into the new release?
>>
>> Stefan
> 
> Ping? Those bug fixes are still missing in -rc2.
> 
> Stefan

Hello Michael,

I just noticed that MAINTAINERS has no entry for the files in 
subprojects/libvhost-user, so I did not cc you in my previous e-mails. 
Should that directory be added to the "vhost" section"?

Stefan

