Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFFBD5EFE39
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 21:57:45 +0200 (CEST)
Received: from localhost ([::1]:33544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odzfE-0000RX-EI
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 15:57:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hpoussin@reactos.org>)
 id 1odzbX-0005NN-Gx; Thu, 29 Sep 2022 15:53:55 -0400
Received: from iserv.reactos.org ([2a01:4f8:1c17:5ae1::1]:47686)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hpoussin@reactos.org>)
 id 1odzbV-0003U2-7Z; Thu, 29 Sep 2022 15:53:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=reactos.org
 ; s=25047;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CjdR/eLdlxbXpUHcHZl6XG6nkl9V/ICd3Uq9XrAuFvY=; b=rENcPWVKbPQMB5npyLe1LdZvOK
 N+VL25g5BUW9i3+EMfKKKeKoPhr5C2cjPn5+KfFiAeimcakJaGibhU7BJctrQd+V3EYHFddVwF7oY
 yAn0Hofk8pjpojbOfYTRAur7BlqkCwzSp81B7Ytd0bBZE91vA8SDQcXWCVJV2YvoYWDg=;
Received: by iserv.reactos.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <hpoussin@reactos.org>)
 id 1odzbQ-0001uQ-LW; Thu, 29 Sep 2022 19:53:48 +0000
Message-ID: <c61944a2-1b1c-bec1-0253-3335b05d3b43@reactos.org>
Date: Thu, 29 Sep 2022 21:53:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 1/2] vvfat: allow some writes to bootsector
Content-Language: en-US
To: Kevin Wolf <kwolf@redhat.com>
Cc: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org
References: <20220903162302.3176003-1-hpoussin@reactos.org>
 <20220903162302.3176003-2-hpoussin@reactos.org> <YzWnWMRKhdzxkdT1@redhat.com>
From: =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>
In-Reply-To: <YzWnWMRKhdzxkdT1@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a01:4f8:1c17:5ae1::1;
 envelope-from=hpoussin@reactos.org; helo=iserv.reactos.org
X-Spam_score_int: -61
X-Spam_score: -6.2
X-Spam_bar: ------
X-Spam_report: (-6.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-4.099,
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

Le 29/09/2022 à 16:10, Kevin Wolf a écrit :
> Am 03.09.2022 um 18:23 hat Hervé Poussineau geschrieben:
>> 'reserved1' field in bootsector is used to mark volume dirty, or need to verify.
>> Allow writes to bootsector which only changes the 'reserved1' field.
>>
>> This fixes I/O errors on Windows guests.
>>
>> Resolves: https://bugs.launchpad.net/qemu/+bug/1889421
>> Signed-off-by: Hervé Poussineau <hpoussin@reactos.org>
>> ---
>>   block/vvfat.c | 18 +++++++++++++++++-
>>   1 file changed, 17 insertions(+), 1 deletion(-)
>>
>> diff --git a/block/vvfat.c b/block/vvfat.c
>> index d6dd919683d..35057a51c67 100644
>> --- a/block/vvfat.c
>> +++ b/block/vvfat.c
>> @@ -2993,11 +2993,27 @@ DLOG(checkpoint());
>>   
>>       vvfat_close_current_file(s);
>>   
>> +    if (sector_num == s->offset_to_bootsector && nb_sectors == 1) {
>> +        /*
>> +         * Write on bootsector. Allow only changing the reserved1 field,
>> +         * used to mark volume dirtiness
>> +         */
>> +        const unsigned char *initial = s->first_sectors
>> +                                       + s->offset_to_bootsector * 0x200;
>> +        for (i = 0; i < 0x200; i++) {
>> +            if (i != offsetof(bootsector_t, u.fat16.reserved1) &&
> 
> I think you need to check the FAT version (s->fat_type) before accessing
> u.fat16. For FAT32, the "reserved" field is at a different offset (but
> seems to have the same meaning).

I didn't do this, because only fat16 part of bootsector is ever used.
In init_directories(), only fat16 part is initialized, with the comment:
	/* LATER TODO: if FAT32, this is wrong */
I wanted to be consistent between init_directories() and the check.

> 
>> +                initial[i] != buf[i]) {
>> +                fprintf(stderr, "Tried to write to protected bootsector\n");
>> +                return -1;
>> +            }
>> +        }
>> +        return 0;
>> +    }
> 
> Should we update s->first_sectors with the new value so that the guest
> would actually read back what it wrote instead of having the change
> disappear magically?

Windows guests don't seem to care if the written value disappears. They only want the write to succeed.

> 
>>       /*
>>        * Some sanity checks:
>>        * - do not allow writing to the boot sector
>>        */
>> -
>>       if (sector_num < s->offset_to_fat)
>>           return -1;
> 
> Kevin
> 


