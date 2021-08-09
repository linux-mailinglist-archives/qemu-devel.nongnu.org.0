Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F16F73E418D
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 10:28:22 +0200 (CEST)
Received: from localhost ([::1]:53570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mD0dy-0003MS-1q
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 04:28:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mD0cy-0002X1-39
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 04:27:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43097)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mD0cw-0003LK-PE
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 04:27:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628497637;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jfDID35EIXJ3a3KKJlLXmA9iPbY5wgLmoCdkrNDHUp0=;
 b=cPhqBlR4as8uKYFBbcgoUXkdWj9T10K6mO8rdpGUeRrqLcNLyz8xHm39o0AxGnNUbXKDNK
 nnWaiLzBIzktq58uPCmOUTjxb2rtOm4139XtLTkirUwaYOXEeHRnsO17ZveoG7a9upFL1O
 0Du+cAnFkG1AACWdz9lbce5fYFELOO0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-550-tHmDOKq4NrmYYYFc56FqtA-1; Mon, 09 Aug 2021 04:27:16 -0400
X-MC-Unique: tHmDOKq4NrmYYYFc56FqtA-1
Received: by mail-wm1-f71.google.com with SMTP id
 k5-20020a7bc3050000b02901e081f69d80so3800253wmj.8
 for <qemu-devel@nongnu.org>; Mon, 09 Aug 2021 01:27:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jfDID35EIXJ3a3KKJlLXmA9iPbY5wgLmoCdkrNDHUp0=;
 b=UoV5m8kKT8mBa4bO1f2TzeXUQ/hcaWFQ7RMF/b/kAtEqQQJ0fjfSBMGBS4GzFEknIH
 Sm4Isnq28Siy+Raze1smg5ddZhBOrBchfYPDL1r6U5vWIflYFskNqF6vJ1Iz3WLWzg0l
 TiXXFYtWfpl20PiDqF/t8+FgunMUGZBuWH/CDu1aBUGZB84k2E6lOw1NWwCkk9nxsPwg
 UvEa5GM1do4Hy6qWfi9WM4rgaHuGHXCg57TyHplWI/cHwtkqnF5Lq0Gv4FuNmlVYFMs9
 2/tYFFeLpFPimmlkdvYOIDkllND/XP23M6bOCTECqBfWaTd125DwiTIQHvF9fooJjWUS
 b4vw==
X-Gm-Message-State: AOAM533ZdvujQPepjh0d/WhvPvDHFZcfLhoegPw5v2pnvDCTe8kATWXP
 UGpOCcIdrVldfctw0GUOLbmewbAw6OzInRYAK45zc9dlvOU0L4X3fdtrwMeaaQbTr4qw9Q2mWC0
 efPZJLfMd8j0jIGp6HpPmnSwlLPJ/vZu6iXg9LUkaj3MHxU0J3UjkH+C3D+XeJWP6v+s=
X-Received: by 2002:a1c:7c10:: with SMTP id x16mr15473649wmc.41.1628497635111; 
 Mon, 09 Aug 2021 01:27:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzL/1VGhY9vNFEh+RCqDTJJQOjB1YDnuPCrvMCBxcyw1x4z7u8JIQuTybPP6Mgy0J79YTzYwA==
X-Received: by 2002:a1c:7c10:: with SMTP id x16mr15473616wmc.41.1628497634870; 
 Mon, 09 Aug 2021 01:27:14 -0700 (PDT)
Received: from localhost.localdomain ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id
 n10sm1435137wmq.3.2021.08.09.01.27.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Aug 2021 01:27:14 -0700 (PDT)
Subject: Re: [PATCH v8 08/16] qemu-iotests: add gdbserver option to script
 tests too
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
References: <20210705065711.127119-1-eesposit@redhat.com>
 <20210705065711.127119-9-eesposit@redhat.com>
 <647d146b-96dc-48f0-054b-97fc6fb181a4@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-ID: <c38a3a49-9317-04ee-2b6a-99c12a2890a7@redhat.com>
Date: Mon, 9 Aug 2021 10:27:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <647d146b-96dc-48f0-054b-97fc6fb181a4@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.707,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


>> diff --git a/tests/qemu-iotests/common.qemu 
>> b/tests/qemu-iotests/common.qemu
>> index 0fc52d20d7..cbca757b49 100644
>> --- a/tests/qemu-iotests/common.qemu
>> +++ b/tests/qemu-iotests/common.qemu
>> @@ -85,7 +85,12 @@ _timed_wait_for()
>>       timeout=yes
>>       QEMU_STATUS[$h]=0
>> -    while IFS= read -t ${QEMU_COMM_TIMEOUT} resp <&${QEMU_OUT[$h]}
>> +    read_timeout="-t ${QEMU_COMM_TIMEOUT}"
>> +    if [ ! -z ${GDB_OPTIONS} ]; then
> 
> Shouldn’t we quote "${GDB_OPTIONS}" so that `test` won’t interpret it as 
> its own parameters (if something in there starts with `--`, which I 
> don’t think is the intended usage for $GDB_OPTIONS, but, well...)?
> 
> (Also, `! -z` is the same as `-n`, but I suppose choosing between the 
> two can be a matter of style.)
> 

>> +
>> +        GDB=""
>> +        if [ ! -z ${GDB_OPTIONS} ]; then
> 
> Here, too.  (Sorry for not noticing in v3 already...)

Sorry, I forgot to reply to this email. I agree, I will put quotes and 
change `! -z` in `-n`.

I will send v9 because after all this time this serie has some minor 
conflicts with current QEMU version.

Hopefully this will be the last one :)

Thank you,
Emanuele


