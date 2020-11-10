Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C2722AD440
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 11:59:55 +0100 (CET)
Received: from localhost ([::1]:39528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcRNS-00023B-3o
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 05:59:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kcRMD-0000es-9h
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 05:58:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27030)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kcRMB-00086L-Ff
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 05:58:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605005914;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9JpiuM9hHgTjsTpEtQNzQwekWpxPDue+9RW80Stxwo4=;
 b=eR36+bQon0mLdfdCMjY7d8gpm++F0J1iCxqr8tI25YXp6zwf693Ax6rAQ1WGu0pYLpGIB3
 6DnKM4CUL3vzlsGKm7EuG105wywZWoqp8IEsY87SWBSFxhxFGlEEA2lRBdEnye8j1lqriz
 eWkJHuBKttQNb7NO+aGfC48UiNTJZDc=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-373-jAfszpu3M6OhnoBzSlWGXw-1; Tue, 10 Nov 2020 05:58:33 -0500
X-MC-Unique: jAfszpu3M6OhnoBzSlWGXw-1
Received: by mail-ej1-f70.google.com with SMTP id 27so4551843ejy.8
 for <qemu-devel@nongnu.org>; Tue, 10 Nov 2020 02:58:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9JpiuM9hHgTjsTpEtQNzQwekWpxPDue+9RW80Stxwo4=;
 b=SyIHdxKjcQ8Zt9hEMqQVINJ4SpyjGrCytnabCG6ItIWKva8mZXo4qSxWYh5hok2FY+
 pB5SrIMc8bRZuVanU0EdFoxOT+Z/W4W889AK0mc79PPmGJ26cS26pJ7e0Lw5eOgo1grZ
 i2c7+GuX8VGR00FHnoDz5iDPt/se9BUSgETWrA86syI/KUnetWmPnmHK95rGf74YE86E
 ovPdEqX+2Wg6ugu1whnYqcX8SlRUYo9K4Q93PNmjiR9ox5LBiDXyEbSar01wqDUmZFhi
 B56EpCQj6ICBmBQ3W5R1/vU+JXx6SYfNQ1x+Da1FiywG58p8RoCLNBiQ7/4nCA9i5DNf
 a8EA==
X-Gm-Message-State: AOAM532vVZLM1nRnpq1i2mECrKA9rxlZn8H5BkU28ZXNxmgtoE6sicmx
 qWD4v98c9RbLVL6AI30RDUGr2jT2l94sZJ2nFKKqvp/MyERLHoduQcNK3vMAAejb0Sm5f7l5evi
 IX7UufdU3bchH48g=
X-Received: by 2002:a17:906:4e99:: with SMTP id
 v25mr19249765eju.242.1605005911567; 
 Tue, 10 Nov 2020 02:58:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwFEYnL8k6Wj9Pa4+tGu2o45yvqOKXxp+eZyr2zSr2CYnwjrgH0IfyWuCTfdEw6m75zS+Gs9g==
X-Received: by 2002:a17:906:4e99:: with SMTP id
 v25mr19249748eju.242.1605005911307; 
 Tue, 10 Nov 2020 02:58:31 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id m16sm8791330eja.58.2020.11.10.02.58.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Nov 2020 02:58:30 -0800 (PST)
To: Eduardo Habkost <ehabkost@redhat.com>
References: <20201106211034.GY5733@habkost.net>
 <ca99fc61-6cdd-117d-343e-8141e385522e@redhat.com>
 <20201109113404.GA24970@merkur.fritz.box>
 <3b711053-e67a-86fb-59e7-c06948dd8928@redhat.com>
 <20201109152125.GZ5733@habkost.net>
 <2300fd53-afa1-b957-b33b-cff2986fcb93@redhat.com>
 <20201109171618.GA5733@habkost.net>
 <098ca211-3ad5-b194-e9f5-678291fe641e@redhat.com>
 <20201109185558.GB5733@habkost.net>
 <9659e726-7948-4e02-f303-abcbe4c96148@redhat.com>
 <20201109202855.GD5733@habkost.net>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2 00/44] Make qdev static property API usable by any QOM
 type
Message-ID: <c501a54d-4e8a-52bf-14fa-cfce3eafe57f@redhat.com>
Date: Tue, 10 Nov 2020 11:58:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201109202855.GD5733@habkost.net>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/10 02:00:53
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, "Daniel P. Berrange" <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 John Snow <jsnow@redhat.com>, Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 09/11/20 21:28, Eduardo Habkost wrote:
> I don't know yet what's the best solution for the x86 feature
> case.  Maybe duplicating the list of feature names would be a
> small price to pay to get a static list of properties defined at
> compilation time?  Maybe we can replace
> FeatureWordInfo.feat_names[] with property introspection code
> that will find the property name for a given struct field?

The problem is associating the names with the metadata (feature 
word/bit).  Right now we do that by placing the names in the 
feat_names[] arrays, which are indexed by feature word and bit.

>>> If object*_property_add*() is hidden behind a function call or a
>>> `if` statement, it's already too much complexity to me.
>> You want to remove hiding behind a function call, but why is it any better
>> to hide behind layers of macros?  Just the example you had in your email
>> included DEFINE_PROP, DEFINE_FIELD_PROP, DEFINE_PROP_UINT32.  It's still
>> impossible to figure out without either parsing or executing C code.
>
> Because we can be absolutely sure the macros (and the property
> array) will be constant expressions evaluated at compilation
> time.

That's not entirely true.  You can always build Property objects 
manually in a for loop.  (Though at that point you might as well use the 
existing API and not the new one).

I think we agree on where _to go_ (schema described outside C code, and 
possibly integrated with the QAPI schema).  I think neither of us has a 
clear idea of how to get there. :)  I don't see this series as a step 
towards that; I see it more as a worthwhile way to remove boilerplate 
from QOM objects.

In my opinion the next steps for QOM (in general, not necessarily 
related to the goal) should be to:

1) audit the code and ensure that there are no conditional properties

2) figure out if it makes sense to provide run-time (not compile-time) 
introspection of QOM class properties, as either a stable or an 
experimental interface, and how it works together with the QAPI 
introspection.  In particular, whether compound QAPI types can be 
matched across QOM and QAPI introspection.

3) figure out if there are any instance properties that can be easily 
extended to class properties.  In particular, figure out if we can do 
class-level property aliasing.

Paolo


