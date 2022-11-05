Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E896B61D905
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Nov 2022 10:17:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orFH1-0008P5-TP; Sat, 05 Nov 2022 05:15:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>)
 id 1orFGv-0008Jw-QG; Sat, 05 Nov 2022 05:15:26 -0400
Received: from mail.weilnetz.de ([37.120.169.71]
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>)
 id 1orFGt-0000D9-LM; Sat, 05 Nov 2022 05:15:25 -0400
Received: from [192.168.44.88] (unknown [185.238.219.80])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTPSA id 41C0BDA043F;
 Sat,  5 Nov 2022 10:15:16 +0100 (CET)
Message-ID: <e229eabb-e1b8-6a28-63ac-a5bdf466dc08@weilnetz.de>
Date: Sat, 5 Nov 2022 10:15:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
To: Laurent Vivier <laurent@vivier.eu>, Stefan Hajnoczi <stefanha@gmail.com>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20221103161727.4116147-1-laurent@vivier.eu>
 <20221103161727.4116147-5-laurent@vivier.eu>
 <ba853014-e45e-7fab-fc40-fc11487c51cd@vivier.eu>
Subject: Re: [PULL 04/10] libvhost-user: Fix wrong type of argument to
 formatting function (reported by LGTM)
In-Reply-To: <ba853014-e45e-7fab-fc40-fc11487c51cd@vivier.eu>
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Reply-to:  Stefan Weil <sw@weilnetz.de>
From:  Stefan Weil via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Am 04.11.22 um 17:16 schrieb Laurent Vivier:

> Hi Stefan,
>
> Le 03/11/2022 à 17:17, Laurent Vivier a écrit :
>> From: Stefan Weil <sw@weilnetz.de>
>>
>> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> Signed-off-by: Stefan Weil <sw@weilnetz.de>
>> Message-Id: <20220422070144.1043697-2-sw@weilnetz.de>
>> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
>> ---
>>   subprojects/libvhost-user/libvhost-user.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/subprojects/libvhost-user/libvhost-user.c 
>> b/subprojects/libvhost-user/libvhost-user.c
>> index ffed4729a3dc..d9a6e3e5560f 100644
>> --- a/subprojects/libvhost-user/libvhost-user.c
>> +++ b/subprojects/libvhost-user/libvhost-user.c
>> @@ -651,7 +651,7 @@ generate_faults(VuDev *dev) {
>>             if (ioctl(dev->postcopy_ufd, UFFDIO_REGISTER, 
>> &reg_struct)) {
>>               vu_panic(dev, "%s: Failed to userfault region %d "
>> -                          "@%p + size:%zx offset: %zx: (ufd=%d)%s\n",
>> +                          "@%" PRIx64 " + size:%zx offset: %zx: 
>> (ufd=%d)%s\n",
>>                        __func__, i,
>>                        dev_region->mmap_addr,
>>                        dev_region->size, dev_region->mmap_offset,
>
> They all need PRIx64:
>
> typedef struct VuDevRegion {
>     /* Guest Physical address. */
>     uint64_t gpa;
>     /* Memory region size. */
>     uint64_t size;
>     /* QEMU virtual address (userspace). */
>     uint64_t qva;
>     /* Starting offset in our mmaped space. */
>     uint64_t mmap_offset;
>     /* Start address of mmaped space. */
>     uint64_t mmap_addr;
> } VuDevRegion;
>
> Could you fix your patch?


The patch fixes one error ("%p"). The two "%zx" are old errors which I 
did not notice because they are only relevant for platforms with 
sizeof(void *) != sizeof(uint64_t), and 32 bit Windows builds don't 
compile libvhost-user. So we need an additional patch which fixes the 
"%zx" before patch 06/10 which adds the format attribute is applied.

Stefan, I suggest to merge the trivial branch without patch 06/10. That 
should fix the build failure and fixes at least some of the format 
errors. Then a patch which fixes the remaining format errors can be 
applied later together with the omitted patch 06/10.

Regards,

Stefan


