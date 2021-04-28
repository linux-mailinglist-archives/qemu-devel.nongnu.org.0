Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4480336D99C
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 16:30:51 +0200 (CEST)
Received: from localhost ([::1]:38702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lblDG-0002JH-A4
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 10:30:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lblC6-0001sl-3R
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 10:29:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56922)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lblC2-00021P-8o
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 10:29:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619620172;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l8yRGmBIrXEkeH1Pa4ng4Evj6xN8noAI4vETN9vL7ck=;
 b=LcYcV8aOd+u5yf5bX5iSRGMdoDXvaB2ZatmhJAyZZzzZbETp/usF+i0rf2YS/gEdCw4Wae
 ukYPJQ0f09tuO36xFsZrQfQAY5L3XjKNIbz9tzcVHu6jFdty5LqPXKBGtnp9FSTxXRIxim
 NtUQNX27Mxkc2AbXdM51wV+k0h/7XOo=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-509-FyzYSjyHPfWLDSFTnUro0Q-1; Wed, 28 Apr 2021 10:29:27 -0400
X-MC-Unique: FyzYSjyHPfWLDSFTnUro0Q-1
Received: by mail-oi1-f200.google.com with SMTP id
 c11-20020a544e8b0000b029013d55eb5c1aso25356608oiy.8
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 07:29:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=l8yRGmBIrXEkeH1Pa4ng4Evj6xN8noAI4vETN9vL7ck=;
 b=LbrExj8gMsLaBuJjxn+QZ1d1tnLbG8R20yKXZVWXxXaN3zmzATzQLTTFTOc7hpkdoD
 EoVLjHwc3Sp5shOfHYNmG4+/5iDmeO3d+GSU850t6zGqoWrrk1F73JPjZhPmNquK9lFA
 vD705fjRZb6iqv66XynG7bbTNZaU2wupiOt5wuADS+INyEgMagdettmsNftKPNFIEkax
 liHls8J/XeuiL0lZuaAqVJC+vvN1ng1qZX9KMA9L87eXlUbvarsbi06CqWvHn6qSxOWy
 Nl2/K68gc/3X9lAahjmJzz2uFGvRXw9y5JUWbiAk6JbyJBbN8zTuk5gtf8hnLnTOKVcw
 NUAg==
X-Gm-Message-State: AOAM5325+hk8E40VI1YcmH9pyCagLrcJ0ciE0FOW+4r3m9OCzO+FpJoi
 ZRKdFzGwvzBvWqewzGhbuXIzpKgKIl4lbVFzl74HZ1bWc1aH7pgXsZaQtViSBFJhZ21ZHnM5Zpz
 BaEQHWX5TyTMvo/I=
X-Received: by 2002:aca:c68a:: with SMTP id w132mr3143349oif.130.1619620166901; 
 Wed, 28 Apr 2021 07:29:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxXlsYQNG487mS51E8UIH6l8yTG293sKRoxcgsZTyGAtdpBT6ZnZ++zZqBYdJZ/7oyGk3aFGg==
X-Received: by 2002:aca:c68a:: with SMTP id w132mr3143335oif.130.1619620166680; 
 Wed, 28 Apr 2021 07:29:26 -0700 (PDT)
Received: from [192.168.0.173] (ip68-103-222-6.ks.ok.cox.net. [68.103.222.6])
 by smtp.gmail.com with ESMTPSA id q20sm8113oic.41.2021.04.28.07.29.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Apr 2021 07:29:26 -0700 (PDT)
Subject: Re: [PATCH] tools/meson.build: Error on enabling virtiofsd and
 have_system is false
To: Mahmoud Mandour <ma.mandourr@gmail.com>
References: <20210428133507.52066-1-ma.mandourr@gmail.com>
 <e1059890-79ab-eae6-1db1-5c4033f7b584@redhat.com>
 <CAD-LL6iLpZSAUHquK=gJyXGS3rqOCJZqt0smV29ifeE5ZgZNQA@mail.gmail.com>
From: Connor Kuehl <ckuehl@redhat.com>
Message-ID: <d5fc9d07-22fa-de61-ab7a-038419351190@redhat.com>
Date: Wed, 28 Apr 2021 09:29:25 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAD-LL6iLpZSAUHquK=gJyXGS3rqOCJZqt0smV29ifeE5ZgZNQA@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ckuehl@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ckuehl@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/28/21 9:13 AM, Mahmoud Mandour wrote:
>> I am not entirely sure if this is true. The error message before this
>> patch is applied is:
>>
>>         ../tools/meson.build:12:6: ERROR: Problem encountered: virtiofsd
>>         requires libcap-ng-devel and seccomp-devel
>>
>> From what I know about virtiofsd, I know it definitely depends on those
>> two things.
>>
>> Is it possible that the error here is that the top-level meson.build is
>> not properly collecting the seccomp and libcap-ng dependencies if the
>> configure invocation doesn't require a system emulation target?
> I also thought that this is the case since I also specifically get this
> error message
> if I enable virtiofsd and specify a target list with only Linux-user
> targets while nothing
> in tools/meson.build specifies so. But I think that even if it correctly
> managed the
> dependencies it would include and build virtiofsd unnecessarily and that's
> not what we want(?)

I think that's exactly what we want for the default case because
virtiofsd is enabled by default (../configure --help).

Even if the virtiofsd dependencies are satisfied, if one doesn't want to
build virtiofsd, they can pass --disable-virtiofsd to the configure
invocation.

Connor


