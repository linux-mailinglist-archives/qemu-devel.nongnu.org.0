Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A73F381703
	for <lists+qemu-devel@lfdr.de>; Sat, 15 May 2021 10:50:41 +0200 (CEST)
Received: from localhost ([::1]:41844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhq0O-00030p-CW
	for lists+qemu-devel@lfdr.de; Sat, 15 May 2021 04:50:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lhpzO-0001yQ-4t
 for qemu-devel@nongnu.org; Sat, 15 May 2021 04:49:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37368)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lhpzK-0001kI-JH
 for qemu-devel@nongnu.org; Sat, 15 May 2021 04:49:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621068572;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C76OJELKvyQCyLOcSIk4HGfYriaJpYoLR8BduHI9GqQ=;
 b=U443cMnS44iaWCi77Yre/nuP03mRGUvJM14Qor36J7U7sj8AeNPWG8+uEYxluYYLOYdxCo
 tgEAWqBClipnPJjveecEYnCv3pKgnXNgLWbGbPL6b9xQMgLRA4iq3ySHWBNw6s06cinZZN
 O9Ahq58o+PxTzlSH+jo5V4fccHRFkI4=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-557-f8sSAV7EPC2chgy9uRU8Ug-1; Sat, 15 May 2021 04:49:28 -0400
X-MC-Unique: f8sSAV7EPC2chgy9uRU8Ug-1
Received: by mail-wr1-f69.google.com with SMTP id
 36-20020adf91a70000b029010ec34b3f27so920376wri.10
 for <qemu-devel@nongnu.org>; Sat, 15 May 2021 01:49:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=C76OJELKvyQCyLOcSIk4HGfYriaJpYoLR8BduHI9GqQ=;
 b=IHjNL3cgzApY1aEgQTNjff1qW3FaGaRltaqD2SVBQkTwgOBLjDj6B6LT1Leb5LnBRc
 S8DRz2i2z8fSTDq2il5nH1FLpY6wfoyCKOX4wilSpA+Wa/GTndKk448g271s8ozwNiJB
 cR8bv05+3wxfArfuDrRouxv2ey/n28Z8R1pm9/EERyW3V12H+7wbEwt5iTWoW3L11XKZ
 Lz6Hb6MdtAJBVSr6o8c10e17VKzsWpKHelbdvMHAnySzC08XE+2TO5HujA68JQr/3Dt+
 8oRjHu0ZuiKxAFlA7Q2vGqYfLR8tyhhvfXsxJ8rY5WrwuY237FEGszBmKHulokq9myfw
 gQew==
X-Gm-Message-State: AOAM533R6+wjAlvxhncqY5Wws4pM7OR3tLXWFYoi+Sdzc0Pmesb4D3e9
 HClgYIPtu3AbyzOwPp9DvPCSluECPeiv8gi4EMv9ZutNe8H01v7gAkh33xhXSyzo+ztRuOTr38C
 z1IB+gL4mx8jMmCE=
X-Received: by 2002:adf:cd01:: with SMTP id w1mr63345202wrm.425.1621068567069; 
 Sat, 15 May 2021 01:49:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzJ2OmRhM3ufhuYLQ30FCYjfHRQzyNv1+BZGG7A7PQhdxwDMbp75A6zoV/HnbAct29AtE9R1g==
X-Received: by 2002:adf:cd01:: with SMTP id w1mr63345178wrm.425.1621068566817; 
 Sat, 15 May 2021 01:49:26 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id k9sm6472214wmk.5.2021.05.15.01.49.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 15 May 2021 01:49:26 -0700 (PDT)
Subject: Re: [PATCH] fdc: check drive block device before usage
 (CVE-2021-20196)
To: John Snow <jsnow@redhat.com>, Thomas Huth <thuth@redhat.com>,
 P J P <ppandit@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Qemu-block <qemu-block@nongnu.org>
References: <20210123100345.642933-1-ppandit@redhat.com>
 <6881ef3c-99a1-1f5f-cca5-0850ec2bd6cf@redhat.com>
 <89fb8d54-707a-9965-75e2-665d4cb07d63@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <bea5cec1-eb1b-3eab-8e71-4af7ae1078ff@redhat.com>
Date: Sat, 15 May 2021 10:49:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <89fb8d54-707a-9965-75e2-665d4cb07d63@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Prasad J Pandit <pjp@fedoraproject.org>, Gaoning Pan <pgn@zju.edu.cn>,
 qemu-stable@nongnu.org, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/14/21 9:26 PM, John Snow wrote:
> On 5/14/21 3:23 PM, Thomas Huth wrote:
>> On 23/01/2021 11.03, P J P wrote:
>>> From: Prasad J Pandit <pjp@fedoraproject.org>
>>>
>>> While processing ioport command in 'fdctrl_write_dor', device
>>> controller may select a drive which is not initialised with a
>>> block device. This may result in a NULL pointer dereference.
>>> Add checks to avoid it.
>>>
>>> Fixes: CVE-2021-20196
>>> Reported-by: Gaoning Pan <pgn@zju.edu.cn>
>>> Buglink: https://bugs.launchpad.net/qemu/+bug/1912780
>>> Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
>>> ---
>>>   hw/block/fdc.c | 11 +++++++++--
>>>   1 file changed, 9 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/hw/block/fdc.c b/hw/block/fdc.c
>>> index 3636874432..13a9470d19 100644
>>> --- a/hw/block/fdc.c
>>> +++ b/hw/block/fdc.c
>>> @@ -1429,7 +1429,9 @@ static void fdctrl_write_dor(FDCtrl *fdctrl,
>>> uint32_t value)
>>>           }
>>>       }
>>>       /* Selected drive */
>>> -    fdctrl->cur_drv = value & FD_DOR_SELMASK;
>>> +    if (fdctrl->drives[value & FD_DOR_SELMASK].blk) {
>>> +        fdctrl->cur_drv = value & FD_DOR_SELMASK;
>>> +    }
>>>       fdctrl->dor = value;
>>>   }
>>> @@ -1894,6 +1896,10 @@ static uint32_t fdctrl_read_data(FDCtrl *fdctrl)
>>>       uint32_t pos;
>>>       cur_drv = get_cur_drv(fdctrl);
>>> +    if (!cur_drv->blk) {
>>> +        FLOPPY_DPRINTF("No drive connected\n");
>>> +        return 0;
>>> +    }
>>>       fdctrl->dsr &= ~FD_DSR_PWRDOWN;
>>>       if (!(fdctrl->msr & FD_MSR_RQM) || !(fdctrl->msr & FD_MSR_DIO)) {
>>>           FLOPPY_DPRINTF("error: controller not ready for reading\n");
>>> @@ -2420,7 +2426,8 @@ static void fdctrl_write_data(FDCtrl *fdctrl,
>>> uint32_t value)
>>>           if (pos == FD_SECTOR_LEN - 1 ||
>>>               fdctrl->data_pos == fdctrl->data_len) {
>>>               cur_drv = get_cur_drv(fdctrl);
>>> -            if (blk_pwrite(cur_drv->blk, fd_offset(cur_drv),
>>> fdctrl->fifo,
>>> +            if (cur_drv->blk == NULL
>>> +                || blk_pwrite(cur_drv->blk, fd_offset(cur_drv),
>>> fdctrl->fifo,
>>>                              BDRV_SECTOR_SIZE, 0) < 0) {
>>>                   FLOPPY_DPRINTF("error writing sector %d\n",
>>>                                  fd_sector(cur_drv));
>>>
>>
>> Ping again!
>>
>> Could anybody review / pick this up?

This patch misses the qtest companion with the reproducer
provided by Alexander.

> Yep. Not forgotten, despite appearances. Clearing my Python review
> backlog, then onto FDC/IDE.

Yeah \o/

> 
> In the meantime, anything anyone else happens to feel comfortable
> staging won't upset me any. I don't insist they go through my tree right
> now.


