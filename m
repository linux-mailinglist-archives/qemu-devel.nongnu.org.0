Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C327443964A
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Oct 2021 14:26:56 +0200 (CEST)
Received: from localhost ([::1]:42600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mez43-0001wK-RX
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 08:26:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mez0G-0008DQ-V7
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 08:23:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58855)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mez0E-0003Dn-HV
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 08:23:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635164577;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dnWGek/OTKv8qjVhDP2JBoYyDXb0X8qYK2WogjGEBlY=;
 b=LvXt34K1Tm0gdN+iOZUIeUEsufHa5KBLZUSIBiAH9Ugkgo3EXC4+fuHVr6j+F88jzGKO1j
 gV8Xz7w2mpsKRB7E4wJjsc2C0TO7V0GS2ez4P/s7yuhFkHPbo2jNeSHAn86uKIbp9gTu2v
 bhLaxlLgb50/rPN0xMov4W6Y3VdlPQM=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-449-nQ01XctSOVmN7gYGgV9EHA-1; Mon, 25 Oct 2021 08:22:56 -0400
X-MC-Unique: nQ01XctSOVmN7gYGgV9EHA-1
Received: by mail-ed1-f71.google.com with SMTP id
 x13-20020a05640226cd00b003dd4720703bso3755077edd.8
 for <qemu-devel@nongnu.org>; Mon, 25 Oct 2021 05:22:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dnWGek/OTKv8qjVhDP2JBoYyDXb0X8qYK2WogjGEBlY=;
 b=Eh4mwvCKCooOs89mXShVD2Cc1F7DdyN9KbVcmHmshwTJTckkLFUWvt3lw/DjToOrYF
 OvylhHAkFXshG/k28fDrDfOfQyKImjjBfhSN2t3RIkTOb9t64Adq2Gop5UxKOugAB0ee
 3TlKYIWueIbIC3TlPM3Xa/N/mL64liCeU+1JZi3bL4Do0AluCFvqsMCFrIJJ2AxQC35O
 6oY3rKHbYxLgXQs/vrwpJlY2+rbSAfwDidOg4TFpeaLHq8eZlmrVsina90o/+KQXsJwl
 zxSJTkQKmZq6/Y1aCaF8kX+mi1Vdqso2rL/5nOu8iwfC5YiXp+szRsFAyenLRaJrgLQS
 br7A==
X-Gm-Message-State: AOAM531tzsmDVJA9DeCwEI2mXh5S6RwaBJiWG0F9B0YoGsAaPWPngRTn
 7Vjgv28/16eLkQ9UJi0v0XjvkwBo4jeZTMo4/JTL+3SOsdQ5oWcgpkbk40siqqGvcCqmPBISBpw
 BqDzYwCf9mIQZKr0=
X-Received: by 2002:a50:bf4d:: with SMTP id g13mr26450539edk.195.1635164575396; 
 Mon, 25 Oct 2021 05:22:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxgJkmP913Gkf/YpCKo1fFeaU4TOI1FLSmx024ZnkDQMwjN+NBwAQG79RZUHJpOcwN7G28f+w==
X-Received: by 2002:a50:bf4d:: with SMTP id g13mr26450525edk.195.1635164575252; 
 Mon, 25 Oct 2021 05:22:55 -0700 (PDT)
Received: from localhost.localdomain ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id
 m5sm3455891ejc.62.2021.10.25.05.22.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Oct 2021 05:22:54 -0700 (PDT)
Subject: Re: [PATCH v4 02/25] include/block/block: split header into I/O and
 global state API
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-block@nongnu.org
References: <20211025101735.2060852-1-eesposit@redhat.com>
 <20211025101735.2060852-3-eesposit@redhat.com>
 <8bd4dc02-d6bb-7138-f3fc-81c1f83b0a71@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-ID: <5420f20b-7157-22f5-e0db-87af68d95302@redhat.com>
Date: Mon, 25 Oct 2021 14:22:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <8bd4dc02-d6bb-7138-f3fc-81c1f83b0a71@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.846, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Eric Blake <eblake@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


>>
>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
>> ---
>>   block.c                            |   3 +
>>   block/meson.build                  |   7 +-
>>   include/block/block-common.h       | 389 +++++++++++++
> 
> Can this patch be split in 3?
> 
> (first)
> 
>>   include/block/block-global-state.h | 286 ++++++++++
> 
> (second)
> 
>>   include/block/block-io.h           | 306 ++++++++++
> 
> (third)

I think it is a good idea especially for future patches, since it 
improves readability. For this series I think it has already been fully 
reviewed, so it won't matter too much. But I will follow this logic for 
the upcoming job patches, thanks.

> 
>>   include/block/block.h              | 878 +----------------------------
>>   6 files changed, 1012 insertions(+), 857 deletions(-)
>>   create mode 100644 include/block/block-common.h
>>   create mode 100644 include/block/block-global-state.h
>>   create mode 100644 include/block/block-io.h
> 
> Also consider enabling scripts/git.orderfile to ease patch review.
> 

Done, thanks for pointing it out.

Emanuele


