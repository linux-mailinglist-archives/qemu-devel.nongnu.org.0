Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 138A960DA4
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Jul 2019 00:09:25 +0200 (CEST)
Received: from localhost ([::1]:56452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hjWOS-0004A3-Ai
	for lists+qemu-devel@lfdr.de; Fri, 05 Jul 2019 18:09:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53567)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <pbonzini@redhat.com>) id 1hjWMz-0002qI-Rs
 for qemu-devel@nongnu.org; Fri, 05 Jul 2019 18:07:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1hjWMy-0007W8-Qb
 for qemu-devel@nongnu.org; Fri, 05 Jul 2019 18:07:53 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:52094)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1hjWMy-0007Vu-KB
 for qemu-devel@nongnu.org; Fri, 05 Jul 2019 18:07:52 -0400
Received: by mail-wm1-f68.google.com with SMTP id 207so10466647wma.1
 for <qemu-devel@nongnu.org>; Fri, 05 Jul 2019 15:07:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FuM9ONZjKIdrtoJnHnysXvIn36oevuhhGcae6FCEhA4=;
 b=keTfNJ9woJWRpPdfrpyFI1qFrM12Y1+D9tYvnyf1vCySjusRi8loJHO7MngFLrAoyE
 0MW2EmoVjiiA0jVpkUL0Z0/JWrlR8lr7fg1ZYK2nUYAIqXGir1qWUNgkv5c9dSLLb5RK
 WCqKd9NnWe5A4HtoVo81fyCsy71cDGY5i8ZFNsIs0GR8waChdJnqmO5iZ+PN9hhXwvlK
 5xH4FKbQw8CehjIHXPaG7sxHpnsjaGvvbY00Q6hcM13sFXaBETDkdG6X7GH54y60sj9P
 0FnYltfNLU0C9nY3Kc0tRfasswOM442gw78XDOE2Ne7+eLBqx8k34r+W+7/ZqsYUM2Ym
 WZxA==
X-Gm-Message-State: APjAAAXQy0RYhhHf/ARPLDitrA+xzOqI1m++RQJmHzWA1u2xxgh/Rd3C
 4s64Jmzv+JEyiD1KaixxsLVJSvaaQIc=
X-Google-Smtp-Source: APXvYqxOgdEQ8nbG8Q/+pPpVD1LwEAPSzP5AjCLfZqMMevlYMt/NzFVJ3D5cE4gdBWM9zVf6+3vFvA==
X-Received: by 2002:a05:600c:24a:: with SMTP id 10mr448519wmj.7.1562364471507; 
 Fri, 05 Jul 2019 15:07:51 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:19db:ad53:90ea:9423?
 ([2001:b07:6468:f312:19db:ad53:90ea:9423])
 by smtp.gmail.com with ESMTPSA id x18sm8556815wmi.12.2019.07.05.15.07.50
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Fri, 05 Jul 2019 15:07:51 -0700 (PDT)
To: Eduardo Habkost <ehabkost@redhat.com>
References: <1562079681-19204-1-git-send-email-pbonzini@redhat.com>
 <1562079681-19204-3-git-send-email-pbonzini@redhat.com>
 <20190705205228.GF5198@habkost.net>
 <2015601d-8979-e5d6-fb14-ed74dc420813@redhat.com>
 <20190705214129.GH5198@habkost.net>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <90631bfa-80a6-db32-15fe-82a6765b5f1e@redhat.com>
Date: Sat, 6 Jul 2019 00:07:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190705214129.GH5198@habkost.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.128.68
Subject: Re: [Qemu-devel] [PATCH 2/7] target/i386: introduce generic feature
 dependency mechanism
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
Cc: Liran Alon <liran.alon@oracle.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05/07/19 23:41, Eduardo Habkost wrote:
>>>> +    for (i = 0; i < ARRAY_SIZE(feature_dependencies); i++) {
>>>> +        FeatureDep *d = &feature_dependencies[i];
>>>> +        if ((env->user_features[d->from] & d->from_flag) &&
>>>> +            !(env->features[d->from] & d->from_flag)) {
>>> Why does it matter if the feature was cleared explicitly by the
>>> user?
>> Because the feature set of named CPU models should be internally
>> consistent.  I thought of this mechanism as a quick "clean up user's
>> choices" pass to avoid having to remember a multitude of VMX features,
>> for example it makes "-cpu host,-rdtscp" just work.
> If named CPU models are already consistent, ignoring
> user_features shouldn't make a difference, right?  It would also
> be a useful mechanism to detect inconsistencies in internal CPU
> model definitions.

Ok, I can drop that check.

>> It has to be done before expansion, so that env->user_features is set
>> properly before -cpu host is expanded.
> 
> I don't get it.  It looks like you only need env->user_features
> to be set above because you are handling dependencies before
> cpu->max_features is handled.
> 
> If you handle dependencies at x86_cpu_filter_features() instead
> (after cpu->max_features was already handled), you don't even
> need to worry about setting user_features.

I think you're right, but on the other hand setting user_features is
cleaner.  Effectively the dependent features have been disabled because
of something the user told QEMU.  So on one hand I can move the loop to
x86_cpu_filter_features, on the other hand I'd prefer to set
user_features and then it feels more like expansion (e.g. of vmx-ept=off
to vmx-ept=off,vmx-unrestricted-guest=off) than filtering.

Paolo

