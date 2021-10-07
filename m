Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B6F242524C
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 13:53:00 +0200 (CEST)
Received: from localhost ([::1]:37108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYRxL-0005Go-DT
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 07:52:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mYRw9-0004RH-Ta
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 07:51:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57952)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mYRw8-0007Of-AP
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 07:51:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633607503;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=21gdA/9ALXR1z+5TlFrM/UBRaF3NbyiPtGj78/4NIe0=;
 b=P+0GVbLHj7W7m3QCbAkqBAkPudumPlzAcHwpr4dMJFWxibL8V5I7kl2WDY3FnW1XDPtaVr
 IkeI0qpgmDWApoKP0R2bui1M0rsLfprkBHDZiaAPpWHCq9fVJo26M2M+u3oO6bmfnqzjC0
 EqKwHtIW2iUeJpAV91HKXVydAw5yT00=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-377-R5wMGUdFMDKvpX2qmcksqg-1; Thu, 07 Oct 2021 07:51:36 -0400
X-MC-Unique: R5wMGUdFMDKvpX2qmcksqg-1
Received: by mail-ed1-f72.google.com with SMTP id
 i7-20020a50d747000000b003db0225d219so5710115edj.0
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 04:51:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=21gdA/9ALXR1z+5TlFrM/UBRaF3NbyiPtGj78/4NIe0=;
 b=0hGApy3CtqpTYYwAXg73Pq4/LpzrcpGN/xIidTAzfObESiDZ8Q3zxmOZsb+BXDLk2r
 Xh2RKMp33Z4KbKqXiLBE3FHDZmAVlWBn36NQgaxq7quXW+BRKUAOrNz3Nu6moxam9gVX
 ryQiocgh9yw3UaVcP/82bgUrPT7erPZnU/v2CsvQrU7krRCVFgIpEuOxv0IQwzdbTir/
 Z6fc+m4h/KvE3+VrTazlMN44jerwFPg5qi6PeMlSwzVSL5OFrq/QG6mKBzrhDz8Zv3S1
 4rUM3FUmziNFK8U5cMXzl8z1fp57Ez7BUZvl/c2kqZs2wK6zHcdbEeGS56jkyANT4lW1
 oQmg==
X-Gm-Message-State: AOAM531asZFycdtux8yNvEQf2D/RfaeR6s8qZjy93WtJ0lOIqP4PJDq0
 JYmp4ZzJFz6P0UMCk2ubSVzn1Ht+Var2iQGQNlU9+1+FUfKz6Y4FTtrhGIceu+vDqoN4jfTW5xX
 KNk/SMDjQkKanAzA=
X-Received: by 2002:a17:906:b183:: with SMTP id
 w3mr4908392ejy.394.1633607495438; 
 Thu, 07 Oct 2021 04:51:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJydI2wW0o6m07v/MINx2v+qI6W7Tu7vHw4jQk01CdNl2UhXZAax63+8R3kkDgyl/x0+XBP/9Q==
X-Received: by 2002:a17:906:b183:: with SMTP id
 w3mr4908362ejy.394.1633607495263; 
 Thu, 07 Oct 2021 04:51:35 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id x16sm5542955ejj.8.2021.10.07.04.51.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Oct 2021 04:51:34 -0700 (PDT)
Message-ID: <b3e5840b-0508-ac20-5dbf-32c5c1a29b28@redhat.com>
Date: Thu, 7 Oct 2021 13:51:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [RFC PATCH v2 04/25] include/block/block: split header into I/O
 and global state API
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
References: <20211005143215.29500-1-eesposit@redhat.com>
 <20211005143215.29500-5-eesposit@redhat.com>
 <YV6+8+NiBO8uG/GC@stefanha-x1.localdomain>
 <76bbb291-d9bf-ad5e-a4a7-93ee80c281ca@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <76bbb291-d9bf-ad5e-a4a7-93ee80c281ca@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.964, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, Eric Blake <eblake@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07/10/21 12:54, Emanuele Giuseppe Esposito wrote:
>>
>>> +int bdrv_block_status(BlockDriverState *bs, int64_t offset,
>>> +                      int64_t bytes, int64_t *pnum, int64_t *map,
>>> +                      BlockDriverState **file);
>>
>> This function just called bdrv_block_status_above(), which is in the I/O
>> API. I think it's safe to move this to the I/O API or else
>> bdrv_block_status_above() shouldn't be there :).
>>
> 
> It *seems* that while bdrv_block_status_above() is an I/O, probably 
> running in some coroutine (from here its internal qemu_in_coroutine 
> check), bdrv_block_status might be called from the main loop (or 
> alternatively the function is never invoked in the tests, so the 
> assertion never triggered).
> 
> Maybe bdrv_block_status_above is one of the few functions that are both 
> I/O and Main loop? I put it in I/O as it can't have the assertion.

No, they are both I/O.  Callers of bdrv_block_status are hw/nvme and 
qemu-img.c; while the latter can be either (it does not have iothreads), 
hw/nvme is definitely I/O.

Paolo


