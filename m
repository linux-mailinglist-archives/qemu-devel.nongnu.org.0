Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C2D3A981D
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 12:50:23 +0200 (CEST)
Received: from localhost ([::1]:49230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltT7l-0004bY-Ga
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 06:50:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ltT6t-0003va-Ir
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 06:49:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35284)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ltT6p-0005B8-Lp
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 06:49:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623840561;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PFaKbQBUa23qqK/mwxUnfo4wXQcA/YOHDYljZWz1rM4=;
 b=apE6FC7bgyN9QiFVZNP3KFcdo5tn7LavJTQbVHZOoI5O7HbB8XZxpy0pOM5T2PAtkdg7lM
 DzwoeHnOdwW1+SZLqXpMLAs5eZ8XRjxO8rZhwagtowo6PzXk3LSp0JSn8QcTT5yxtRPhsI
 gWJagtleTjA0CtQrqzjxhbbVwe9vEFY=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-190-j9iRxy2ZN0qSkPTt3s58KQ-1; Wed, 16 Jun 2021 06:49:20 -0400
X-MC-Unique: j9iRxy2ZN0qSkPTt3s58KQ-1
Received: by mail-ej1-f72.google.com with SMTP id
 nd10-20020a170907628ab02903a324b229bfso780599ejc.7
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 03:49:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PFaKbQBUa23qqK/mwxUnfo4wXQcA/YOHDYljZWz1rM4=;
 b=nlgi1jTG3Bx70IQe2SdM0k1hsKcuG8dVV8FlxZjTPapwEYT8QK3b+drZgd0BqXJOTd
 rRHNVByrw4JsW95MtTFDv8m0hqqw3XYNqfRVrCvkxn5RNdnZJ1r6rXFbY+yQG0c7KCta
 JBl5KdL99TfoHJZU2NnMw8gZ+EhcM4t0iI8WteHqjFNALmEj4AmCRxf4VRemnFxzmpio
 aCRHcTC9K+FLRPOCBsr3smGJSajbX9loyWjbpa5XI9MAKlJpLoc/7brQP4jclm6z8Kis
 FTHWGKUodLb7DNdEY4mUjXxb09Xlco7Hl3N/RZq5E0q6zxW4WZDPvluDV1ebvlanAG4Y
 jJJw==
X-Gm-Message-State: AOAM5322vYu1jClWFonvZBeCQljLMyXgUh2zMYuAvV8kk1W6yeIcwR/S
 58gb1Cfcowy623ynfYf1r/e62g9t/Pbl5sqM0rziW/5bJLC5aNHE0R+3QubDvPA5O4tRVu7yjPm
 w+vZ2YPEZDqRYnZmlfL9Fww+26brMD7ugq/k/GZbWxaLjQuzh+1Ba8sA4QHGoG9I5/a0=
X-Received: by 2002:a17:906:5657:: with SMTP id
 v23mr4687759ejr.90.1623840559461; 
 Wed, 16 Jun 2021 03:49:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxQlp/FZEj4fOx5BTk1BTk2+XxLW8Ud2w9HgiUpZ3NOi+dYnYZQlpmQAYaCdPtO6fIekPyS9Q==
X-Received: by 2002:a17:906:5657:: with SMTP id
 v23mr4687739ejr.90.1623840559196; 
 Wed, 16 Jun 2021 03:49:19 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id lz24sm1284599ejb.33.2021.06.16.03.49.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jun 2021 03:49:18 -0700 (PDT)
Subject: Re: [PATCH 02/11] keyval: introduce keyval_merge
To: Markus Armbruster <armbru@redhat.com>,
 Daniel Berrange <berrange@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
References: <20210610133538.608390-1-pbonzini@redhat.com>
 <20210610133538.608390-3-pbonzini@redhat.com>
 <87a6nqkxvz.fsf@dusky.pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <4e2ae7a5-0549-7851-88f2-124d8c324416@redhat.com>
Date: Wed, 16 Jun 2021 12:49:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <87a6nqkxvz.fsf@dusky.pond.sub.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.17, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16/06/21 10:38, Markus Armbruster wrote:
> 
> ... and both values are the same other QType (QTYPE_QNULL, QTYPE_QNUM,
> QTYPE_QSTRING, QTYPE_QBOOL): overwrite.
> 
> Why is overwrite restricted to same QType?  Is there no need for
> overwriting say a string with a number?  Hmm, I guess it's okay, because
> keyval_parse() only ever produces QTYPE_QSTRING scalars.  May be worth a
> comment, preferably in a function contract.

Good point, I can add an assert that the only scalars are QTYPE_QSTRING.

> However, some users look at*all*  pairs.  This provides "repeated keys
> build up a list" semantics.
> 
> Example 4: repeated option key builds a list
> 
>      $ qemu-system-x86_64 -S -spice tls-port=12345,tls-channel=main,tls-channel=display
> 
> This fails for me because I don't have Spice set up (and know basically
> nothing about it), but a working variation of it should configure*two*
> channels, not one: the second tls-channel= does*not*  overwrite the
> first one, it configures another channel.
> 
> Since -spice is a merge_lists option, this should be the case for
> multiple -spice, too.  Merging the two options with keyval_merge() would
> not preserve that behavior, I'm afraid.
> 
> QemuOpts is... complicated.

Right, QemuOpts is complicated and keyval a bit less so, which makes 
keyval not applicable to every case: see -object where we had to resort 
to the OptsVisitor.  For those cases where repeated keys build up a 
list, it will not be possible to switch them to keyval.

The other remarks are mostly cosmetic, so there's not much to say on them.

Paolo


