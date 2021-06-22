Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48EC43B0F15
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 22:59:06 +0200 (CEST)
Received: from localhost ([::1]:36868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvnU9-0002of-CY
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 16:59:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lvnT1-0001ya-VC
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 16:57:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32434)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lvnSz-0002x7-41
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 16:57:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624395472;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kRhHpppX+ZvaCyD9ngjL3rMNqUBK2fqyHLLgcvr8Z6Q=;
 b=EIGGAZUQBRVgW7+8f6uimklRgvdk7fSr6MVqur6lPyB1A2OQJAPsjzOcM2y8AL3j+n5zG2
 HZ33MmMjDB+hn/euMAehF23Kj/huwjdLxI04tk+PpqcDWUUHPjpF15msfhpN9vmnHHc3ep
 osZcLxWhEhgglTmi22AZVinmpjyFdaI=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-464---85rRN2MD2pzMQBpXbXIw-1; Tue, 22 Jun 2021 16:57:51 -0400
X-MC-Unique: --85rRN2MD2pzMQBpXbXIw-1
Received: by mail-ed1-f71.google.com with SMTP id
 z20-20020a05640240d4b0290394d69cb3c7so185853edb.19
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 13:57:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kRhHpppX+ZvaCyD9ngjL3rMNqUBK2fqyHLLgcvr8Z6Q=;
 b=DIw+WIE+X4GocDqEmDFoNIxnTu3mktpD041a4uqAGdZpTG+OVztftks+eOeUu2N3JN
 NlcB8E5dauH7mwawTM1v+Q8KoTjThfcAzksqR8ZCBfdWuoErXkCKPNtZFXhGWuU4l4WR
 EsQHiEQzEdqmw/LtMACTB4jOAEiDMA89kukEUSPOPmuSCk+0oFZB5TtZDlfC7yGY+b6e
 opgkW0CJlJ3fqgnJpYqolqkIgfb0yJaTl2I7G1IdIdQa9Q5H2o65a1Wn8pA2EAqRe07q
 Bl3hmf2Ux6VLnbVzLjyrJig2KckNmG0mkuNl3hYfycmVpNGQhRdMN0F8gPhdBtbiRV+Q
 KNRw==
X-Gm-Message-State: AOAM530IPzm03p8tkOV8SstODAadDMcs0K7XSGbcZbWbFxhCgx2pgOv+
 r8pjTRPFZyTph1OBUKAAgPIKlbW7Tcucs+Nc3B/bAKPRpmz2ffhvGCNC9w9kj0yKv8gBOUhaleD
 fqu1xQE+E+pyPWfU/JE/Gdu/+tEimQLfeg6+1p+exztC9e3zRQEh+9lSHLnzLfjcdwKA=
X-Received: by 2002:a05:6402:1103:: with SMTP id
 u3mr7721685edv.342.1624395469500; 
 Tue, 22 Jun 2021 13:57:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyIVwv/dK66WeV4dvNLxcCCm3qSzJFHu0GF3pK7DgLdwVSKUMbGEvrlGALd7uuMAoVVpoDFmA==
X-Received: by 2002:a05:6402:1103:: with SMTP id
 u3mr7721651edv.342.1624395469175; 
 Tue, 22 Jun 2021 13:57:49 -0700 (PDT)
Received: from localhost.localdomain ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id
 t18sm7930895eds.86.2021.06.22.13.57.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Jun 2021 13:57:48 -0700 (PDT)
Subject: Re: [PATCH v4 6/6] block-copy: atomic .cancelled and .finished fields
 in BlockCopyCallState
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org
References: <20210614073350.17048-1-eesposit@redhat.com>
 <20210614073350.17048-7-eesposit@redhat.com>
 <fcb8849c-bedf-aacc-3831-0239d89af2d6@virtuozzo.com>
 <c06306f6-e154-ec58-44cc-33d48d8ccdff@redhat.com>
 <28d4cd1c-2495-b30d-3c9f-2d8d0d3e897b@virtuozzo.com>
 <c8b4e9b9-15a6-3ae4-cb8f-5289a221dcbe@redhat.com>
 <5e019d88-3551-4a08-6a67-e0699dd4f72e@virtuozzo.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-ID: <eda9c1b4-2cb4-bb1e-f5ca-40394ca6046c@redhat.com>
Date: Tue, 22 Jun 2021 22:57:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <5e019d88-3551-4a08-6a67-e0699dd4f72e@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.223,
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
Cc: Kevin Wolf <kwolf@redhat.com>, John Snow <jsnow@redhat.com>,
 qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 22/06/2021 12:39, Vladimir Sementsov-Ogievskiy wrote:
> 22.06.2021 13:20, Paolo Bonzini wrote:
>> On 22/06/21 11:36, Vladimir Sementsov-Ogievskiy wrote:
>>>> It does.  If it returns true, you still want the load of finished to 
>>>> happen before the reads that follow.
>>>
>>> Hmm.. The worst case if we use just qatomic_read is that assertion 
>>> will not crash when it actually should. That doesn't break the logic. 
>>> But that's not good anyway.
>>>
>>> OK, I agree, let's keep it.
>>
>> You can also have a finished job, but get a stale value for 
>> error_is_read or ret.  The issue is not in getting the stale value per 
>> se, but in block_copy_call_status's caller not expecting it.
>>
>> (I understand you agree, but I guess it can be interesting to learn 
>> about this too).
>>
> 
> Hmm. So, do you mean that we can read ret and error_is_read ONLY after 
> explicitly doing load_acquire(finished) and checking that it's true?
> 
> That means that we must do it not in assertion (to not be compiled out):
> 
> bool finished = load_acquire()
> 
> assert(finished);
> 
> ... read reat and error_is_read ...
> 
> 

If I understand correctly, this was what I was trying to say before: 
maybe it's better that we make sure that @finished is set before reading 
@ret and @error_is_read. And because assert can be disabled, we can do 
like you wrote above.

Anyways, let's wait Paolo's answer for this. Once this is ready, I will 
send v5.

Emanuele


