Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D1D33D34D2
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 08:48:36 +0200 (CEST)
Received: from localhost ([::1]:42828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6oz5-0005gl-DB
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 02:48:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m6oxp-0004pe-9E
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 02:47:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m6oxm-0008DW-Gb
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 02:47:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627022833;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e1gJ4+YXznxbwGvs28MJaI1kwCn4PlahF1W48mqye3w=;
 b=DqQCi6Z0hGbktdjCx/yf4YsVHKvgaopoKnvwn1/WnpUw+qM4cLjuSKWFhBevbUC8QwsYJ6
 uvageel3iocn6oH+FHvmFv/02IjwPsKAnoyoWZJ0sunmn5bu7Lu0jFZfFgrymiS+riG5jv
 QilG2f7kZ0atg+UQv6NOxfL6EVNTQcM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-494-Ca-lefzuNCSCO7Ke-KRaWA-1; Fri, 23 Jul 2021 02:47:11 -0400
X-MC-Unique: Ca-lefzuNCSCO7Ke-KRaWA-1
Received: by mail-wr1-f72.google.com with SMTP id
 l14-20020a5d560e0000b029013e2b4ee624so642985wrv.1
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 23:47:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=e1gJ4+YXznxbwGvs28MJaI1kwCn4PlahF1W48mqye3w=;
 b=D3HT1kV7yVS4tCrBhv/qXEGos6N+y2fIpToMhbr/xD8xfeSKCyE+Ew19Y6Ajg+IeuV
 hETMHq+ZLCbcwiXv/00pG99J/yL58OVq59TGBzO1RrBBN1I5gJvn/d/WqStMSZ36wDX6
 CDQYLCnwpgKcLjHupUQnbfxe4506yGDAu5pEd9koERUQcLd5CpLuC5tBWQJOfi94RwQn
 Hkytkx2M2PP0WoMLOp24EgDbsWKBlfcsaXCTISur6JhcFa9Mnh+s9MI6v5szKunwoWcB
 HC3Jtr+qSSWIDPMuFR92os6YGP3qRKQU6ufZLj7wZhivxEntqlFTWGhug9fNWFfhnUMv
 j/Lg==
X-Gm-Message-State: AOAM5333azDChaTsaUzoIxdIJV0r+CvZgMAvmaEfwfUoPcmv2fl41hLo
 o3YBJRSzao1sHOeDSyxlWGr8Ro94aEM3JFJISTjHnFNVTDPb5ROU/jlw6xeDg2tyJhUWW2nZBcT
 Tt7oPCeNELDi9wCI=
X-Received: by 2002:a1c:c91a:: with SMTP id f26mr2942949wmb.162.1627022830744; 
 Thu, 22 Jul 2021 23:47:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyDBMWJMzaDR+ZaX4NngBAWeaYYHe3XAilYbiWrITA+ALOXnqbRTdEkoyAMJEe2XsdAeZ6fhA==
X-Received: by 2002:a1c:c91a:: with SMTP id f26mr2942935wmb.162.1627022830563; 
 Thu, 22 Jul 2021 23:47:10 -0700 (PDT)
Received: from [192.168.1.36] (122.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id n18sm30771075wrt.89.2021.07.22.23.47.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Jul 2021 23:47:10 -0700 (PDT)
Subject: Re: [PATCH 1/2] qxl: remove assert in qxl_pre_save.
To: Gerd Hoffmann <kraxel@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20210721093347.338536-1-kraxel@redhat.com>
 <20210721093347.338536-2-kraxel@redhat.com> <YPmEZnBuCMwXq98p@work-vm>
 <20210723063233.ktjex5knfgz77pbq@sirius.home.kraxel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <13c8a40f-a879-a981-12f0-36a5289b39b1@redhat.com>
Date: Fri, 23 Jul 2021 08:47:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210723063233.ktjex5knfgz77pbq@sirius.home.kraxel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.203, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/23/21 8:32 AM, Gerd Hoffmann wrote:
> On Thu, Jul 22, 2021 at 03:44:54PM +0100, Dr. David Alan Gilbert wrote:
>> * Gerd Hoffmann (kraxel@redhat.com) wrote:
>>> Since commit 551dbd0846d2 ("migration: check pre_save return in
>>> vmstate_save_state") the pre_save hook can fail.  So lets finally
>>> use that to drop the guest-triggerable assert in qxl_pre_save().
>>>
>>> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
>>> ---
>>>  hw/display/qxl.c | 4 +++-
>>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/hw/display/qxl.c b/hw/display/qxl.c
>>> index 84f99088e0a0..3867b94fe236 100644
>>> --- a/hw/display/qxl.c
>>> +++ b/hw/display/qxl.c
>>> @@ -2283,7 +2283,9 @@ static int qxl_pre_save(void *opaque)
>>>      } else {
>>>          d->last_release_offset = (uint8_t *)d->last_release - ram_start;
>>>      }
>>> -    assert(d->last_release_offset < d->vga.vram_size);
>>> +    if (d->last_release_offset < d->vga.vram_size) {
>>> +        return 1;
>>
>> It would be great if there was an error_report or something there
>> so that we get some idea of what happened.
> 
> Hmm.  Strictly speaking qemu_log_mask(LOG_GUEST_ERROR, "..."); would be
> the correct approach here, but I guess that wouldn't help much for
> trouble-shooting as the message would only show up with "-d
> guest_errors".  So better make that error_report("...") ?

It depends who is interested in such errors. Does management app care?


