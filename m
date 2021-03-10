Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B06BD3343DF
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 17:56:44 +0100 (CET)
Received: from localhost ([::1]:51676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK28Z-0005wx-NW
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 11:56:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lK1xT-0004xz-Em
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 11:45:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:22103)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lK1xE-0001OU-1F
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 11:45:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615394693;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ssUB4LnlKafY2Hi0GzG++/8DsVMnIR/0MqSJeDcwb+M=;
 b=eRRwOSdHQU+Kao3KmycAe8fLUaCkiRyNvtmioQiuuoC4jNNoIo24JGXwNvibnESXkQUk4b
 IdSMFeoiJSUm/S2M0279vu3qkBRkf6VauHbxTEcLVvnoIOuvZzn54dMnM9Biix9SV/Wk5o
 6uKHssVs1qD/FICksYFpih+AwNdIAMQ=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-228-8np_hNGrPtCb8MgyK2TS5Q-1; Wed, 10 Mar 2021 11:44:48 -0500
X-MC-Unique: 8np_hNGrPtCb8MgyK2TS5Q-1
Received: by mail-ej1-f69.google.com with SMTP id h14so7507203ejg.7
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 08:44:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ssUB4LnlKafY2Hi0GzG++/8DsVMnIR/0MqSJeDcwb+M=;
 b=XELGQGrMS94GOqY20ToueCdLpuxlbYNhPLWQQGlHXQJlqKp8U/m4bkJXFaC/9RLC2g
 0cCkl2Q3eDMKdhgyNo14iSoDleZ+54Jf++kfh/PO8t6cbACtAT8P/AA+oa91g20b3mjP
 NRYR+EJuuwIEwy5EIWJQJrCS99fvk1KoiLFuLHIiZC5JgbrmlH4NU9vKSJsb9PC1px2d
 YRbwTxgpoBLiJkJQe3aeawWUVckphGgBvEkzIWyzcz8rQzEmRJKCMdAGGD9fg7FWvkva
 v+n+mgZLwZkl5/Nhewy9Lm7P4OKMVFTqRYHnIzGCqsnUJ+ft4Sva9ntsLGK/3ZOBnpCE
 tG9g==
X-Gm-Message-State: AOAM531UWAVE6bapzSjyEv9Snox/1g4uFjrCOZGKP0u6P4581nT2NILC
 LpycDv98bDR1XI03bjQCks8fe1xMjgBEhxhfdNEACtM5YYmKIQY+FDFgJUqDV2ebC82PurWM9Nb
 Gg0aZHsowLUcdMp8=
X-Received: by 2002:a17:907:9e6:: with SMTP id
 ce6mr4470192ejc.207.1615394687305; 
 Wed, 10 Mar 2021 08:44:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxnfc959OqQiaE+PjGiRNRZ6IGTJL93vzaBWJMKnrh9EUoJYVoZ4tLs80760PzND5scql8nlw==
X-Received: by 2002:a17:907:9e6:: with SMTP id
 ce6mr4470174ejc.207.1615394687085; 
 Wed, 10 Mar 2021 08:44:47 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id x21sm10880561eds.53.2021.03.10.08.44.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Mar 2021 08:44:46 -0800 (PST)
Subject: Re: [PATCH 7/9] hw/block/pflash_cfi02: Factor out DeviceReset method
To: Bin Meng <bmeng.cn@gmail.com>
References: <20210309235028.912078-1-philmd@redhat.com>
 <20210309235028.912078-8-philmd@redhat.com>
 <CAEUhbmXrFygOQ_7HnapLYsyUeRc7sXt9z03fQngAhom0qwkh9w@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <1f4c8594-efa1-a969-c058-be20ef1dae71@redhat.com>
Date: Wed, 10 Mar 2021 17:44:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CAEUhbmXrFygOQ_7HnapLYsyUeRc7sXt9z03fQngAhom0qwkh9w@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Stephen Checkoway <stephen.checkoway@oberlin.edu>,
 Qemu-block <qemu-block@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Max Reitz <mreitz@redhat.com>, David Edmondson <david.edmondson@oracle.com>,
 Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/10/21 9:48 AM, Bin Meng wrote:
> On Wed, Mar 10, 2021 at 7:55 AM Philippe Mathieu-Daudé
> <philmd@redhat.com> wrote:
>>
>> There is multiple places doing a device reset. Factor that
>> out in a common method which matches the DeviceReset prototype,
>> so we can also remove the reset code from the DeviceRealize()
>> handler. Explicit the device is set in "read array" mode on
>> reset.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>  hw/block/pflash_cfi02.c | 16 +++++++++++-----
>>  1 file changed, 11 insertions(+), 5 deletions(-)
>>
>> diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
>> index 2ba77a0171b..484b056b898 100644
>> --- a/hw/block/pflash_cfi02.c
>> +++ b/hw/block/pflash_cfi02.c
>> @@ -193,6 +193,14 @@ static void pflash_mode_read_array(PFlashCFI02 *pfl)
>>      memory_region_rom_device_set_romd(&pfl->orig_mem, true);
>>  }
>>
>> +static void pflash_cfi02_reset(DeviceState *dev)
>> +{
>> +    PFlashCFI02 *pfl = PFLASH_CFI02(dev);
>> +
>> +    trace_pflash_reset();
>> +    pflash_mode_read_array(pfl);
>> +}
>> +
>>  static size_t pflash_regions_count(PFlashCFI02 *pfl)
>>  {
>>      return pfl->cfi_table[0x2c];
>> @@ -330,8 +338,7 @@ static uint64_t pflash_read(void *opaque, hwaddr offset, unsigned int width)
>>      default:
>>          /* This should never happen : reset state & treat it as a read*/
>>          DPRINTF("%s: unknown command state: %x\n", __func__, pfl->cmd);
>> -        pfl->wcycle = 0;
>> -        pfl->cmd = 0;
>> +        pflash_cfi02_reset(DEVICE(pfl));
>>          /* fall through to the read code */
>>      case 0x80: /* Erase (unlock) */
>>          /* We accept reads during second unlock sequence... */
>> @@ -710,10 +717,8 @@ static void pflash_write(void *opaque, hwaddr offset, uint64_t value,
>>
>>      /* Reset flash */
>>   reset_flash:
>> -    trace_pflash_reset();
>>      pfl->bypass = 0;
>> -    pfl->wcycle = 0;
>> -    pfl->cmd = 0;
>> +    pflash_cfi02_reset(DEVICE(pfl));
> 
> The old codes did not set pfl->rom_mode to true, but the new codes
> pflash_cfi02_reset() do. Is this correct?

Hmmm let's be precautious indeed. I'll better split this change.


