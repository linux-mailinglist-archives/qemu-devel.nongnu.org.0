Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCC9C589929
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 10:17:36 +0200 (CEST)
Received: from localhost ([::1]:37786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJW2x-00005L-FL
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 04:17:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oJVsN-0006Ne-Bg
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 04:06:43 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:41866)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oJVsK-0000yu-Sy
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 04:06:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HptuR0i4QspGd+TOPMA3/b0GkUEODlDN0c+jP9/WANA=; b=V0fnUroXey5BzXr2iJ19oQU1Iw
 DpMNUGVgzhoO9VFXmSn0aqN2MXAnUHK5IMSXxUgGShPbb/JEVbLPCow47ElRUZIyemIcenF9yphh2
 zUVQqDnV+peKTdnJsN8qNm3qNx8JqWERGMctOs5G/ExqL1zHO6JyXHUvC7+elJ35wgAkKzxYZBXrG
 KwTgg/IGK0fbUD9FvLkZdGwLngManCtxuKsGTl30VQPuToh5TKwHLJh3Ww/D8zsWzSDuUySrgrTib
 paGsxFOcE6pMEoIVvncj1UIPlKKBm569xdbHoHoYcDr22QQyhJH62v43CgOyWvbJbVmfM/ODi0lCn
 DjkUfdtOfk7Ta3AnbGAbHe9WNW/BE0nqvRPmU/ySL8gBstc9BpVkD6qTxtMsn9LsFeCNHcqzGVnw7
 c9gbePRi6IgmEnxL2WPLlKWQ7GXGyOWVuQBgWLPwjqHJdL2kSHYyoRXPPZF4IakaLmH73jMnnIW1o
 d1c0ldb732YOb0EcfY1dCKO1bijkDxK4y8j7ENyjmMoHNYvUQeze+RsZCRU3aqqXVNqpUQECUdxKR
 7BIxEU1rMpU6DRalLurjD7D98Sg1dR1QKwIctZrqtC1NoEelcoA1eR+kkz7vrVG9Te7pvShxoIial
 omEKerhvx7r8BO7CMkhWounbsJSaw7t/FmbM00ujw=;
Received: from [2a00:23c4:8ba6:5100:d563:eb67:74b1:7b0]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oJVqq-0006at-Sj; Thu, 04 Aug 2022 09:05:09 +0100
Message-ID: <1051ad7c-cadf-4202-588e-ead4f2db8172@ilande.co.uk>
Date: Thu, 4 Aug 2022 09:06:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To: John Millikin <john@john-millikin.com>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>
References: <20220726034206.515097-1-john@john-millikin.com>
 <Yue0EG3h5SSpuzjJ@john-millikin.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <Yue0EG3h5SSpuzjJ@john-millikin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba6:5100:d563:eb67:74b1:7b0
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH] scsi-disk: support setting CD-ROM block size via device
 options.
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01/08/2022 12:08, John Millikin wrote:

> Gentle ping -- this is my first time sending a patch for QEMU and it
> hasn't shown up in the qemu-devel mailing list web UI yet, so I can't
> tell whether the mail is being sent/received successfully.
> 
> On Tue, Jul 26, 2022 at 12:42:06PM +0900, John Millikin wrote:
>> SunOS expects CD-ROM devices to have a block size of 512, and will
>> fail to mount or install using QEMU's default block size of 2048.
>>
>> When initializing the SCSI device, allow the `physical_block_device'
>> block device option to override the default block size.
>>
>> Signed-off-by: John Millikin <john@john-millikin.com>
>> ---
>>   hw/scsi/scsi-disk.c | 7 ++++++-
>>   1 file changed, 6 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/scsi/scsi-disk.c b/hw/scsi/scsi-disk.c
>> index f5cdb9ad4b..acdf8dc05c 100644
>> --- a/hw/scsi/scsi-disk.c
>> +++ b/hw/scsi/scsi-disk.c
>> @@ -2533,6 +2533,7 @@ static void scsi_cd_realize(SCSIDevice *dev, Error **errp)
>>       SCSIDiskState *s = DO_UPCAST(SCSIDiskState, qdev, dev);
>>       AioContext *ctx;
>>       int ret;
>> +    uint32_t blocksize = 2048;
>>   
>>       if (!dev->conf.blk) {
>>           /* Anonymous BlockBackend for an empty drive. As we put it into
>> @@ -2542,9 +2543,13 @@ static void scsi_cd_realize(SCSIDevice *dev, Error **errp)
>>           assert(ret == 0);
>>       }
>>   
>> +    if (dev->conf.physical_block_size != 0) {
>> +        blocksize = dev->conf.physical_block_size;
>> +    }
>> +
>>       ctx = blk_get_aio_context(dev->conf.blk);
>>       aio_context_acquire(ctx);
>> -    s->qdev.blocksize = 2048;
>> +    s->qdev.blocksize = blocksize;
>>       s->qdev.type = TYPE_ROM;
>>       s->features |= 1 << SCSI_DISK_F_REMOVABLE;
>>       if (!s->product) {
>> -- 
>> 2.25.1

Hi John,

I saw this reply but didn't see the original patch - were you subscribed to the list 
before you first sent it? If not, it may be that it got caught in a moderation queue 
somewhere.

The CC email addresses look right, but do bear in mind that people are busy as the 
7.1 release is just around the corner and so may not get to your patch right away.

The reason your patch caught my eye is that I've been having a similar discussion on 
Gitlab at https://gitlab.com/qemu-project/qemu/-/issues/1127. Could you check your 
git send-email configuration and then try and resend your patch to see if it appears 
on the list?


ATB,

Mark.

