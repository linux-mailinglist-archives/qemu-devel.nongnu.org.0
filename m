Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F242AD596
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 12:46:53 +0100 (CET)
Received: from localhost ([::1]:38500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcS6u-0008C3-4A
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 06:46:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kcS0k-0002fB-6v
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 06:40:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42238)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kcS0f-00058x-Nd
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 06:40:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605008424;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WXv8SvILGs7LvaBcW1Rf4tJ1JhX5+kNmXnK+c7A9hoI=;
 b=gCc1OpxrJmvBfHJBPSIrQlNGcEApjChgzobKRh3h6olhmLqYPqFDbkAnGwji/dW4wp7Pgk
 bDbxauEl8V10Sf0KewAf/kAtBEVbMjx88NZWhR5ONX8HqQfr1kjSgea0ACw+p2HiLvnuUX
 DH67TmxT8a4CQQNcY8pVQsQkAw7fgTI=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-185-IuT0Cq4QOI6d6O2SIZHgbA-1; Tue, 10 Nov 2020 06:40:21 -0500
X-MC-Unique: IuT0Cq4QOI6d6O2SIZHgbA-1
Received: by mail-ej1-f69.google.com with SMTP id p18so4633212ejl.14
 for <qemu-devel@nongnu.org>; Tue, 10 Nov 2020 03:40:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WXv8SvILGs7LvaBcW1Rf4tJ1JhX5+kNmXnK+c7A9hoI=;
 b=b6T0sAh7boVnrsKRYdqS3Bn1lLOLHjg4HzTwU07TE5bxKiBMMWSewGcNG/Jwdef+6r
 uCaZX8vwgHbUXUvtzK5G/UHFTLUXs/yohpkbw+Z8f1GVm7mg9H8bcMr4+B4a7RrEFW63
 xU1sWhalwqM+4agKUk6UOiU8ZFPKDxkYSdG6jDJ1yxItlHpXvUHYooyWN5KYSDA2HB4m
 9TGw64hmtrxyc3F2ceOJrRb5EeD+ZY7+T0Lnc9ByH6gx8gD0yi23E4feFVmdUTiYiCiN
 TYK9gXFWiM9W1P3EOblnX8ELFXpuDwxHAsccqTjiV9Av2joe3pmLNt4XAaBommV8VjD7
 9xJw==
X-Gm-Message-State: AOAM533qoJDs5ZIKuaeSQN/8RBnGIzR/a+L+HdhgEPW5iiHGdlt2TzmR
 lXQnEjnFhuNXMfADflHMzc8hUmiYdCbV7SZON52y8zxVtc4bF4X6evAVJbUjkx0QrWRxDw8jLcV
 pKC/Z58ucwVIMcCo=
X-Received: by 2002:a17:906:13d4:: with SMTP id
 g20mr19321064ejc.206.1605008420223; 
 Tue, 10 Nov 2020 03:40:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJys2lnMO7jCz1mKQzcaXMQEXiyF/HRTB0mQu3gBe1WowZtmpqXlApXlGKC9tyeAWCjJ2LV3Ow==
X-Received: by 2002:a17:906:13d4:: with SMTP id
 g20mr19321052ejc.206.1605008419989; 
 Tue, 10 Nov 2020 03:40:19 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id k11sm10565208edh.72.2020.11.10.03.40.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Nov 2020 03:40:19 -0800 (PST)
Subject: Re: QOM address space handling
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 qemu-devel <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
References: <0ad53d69-ce4a-c5ea-fba4-fa19daada11c@ilande.co.uk>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <4d4b1f60-98b6-6a41-42e7-685b2059da4c@redhat.com>
Date: Tue, 10 Nov 2020 12:40:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <0ad53d69-ce4a-c5ea-fba4-fa19daada11c@ilande.co.uk>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/11/20 12:14, Mark Cave-Ayland wrote:
> There are 2 possible solutions here: 1) ensure QOM objects that add 
> address spaces during instance init have a corresponding instance 
> finalize function to remove them or 2) move the creation of address 
> spaces from instance init to realize.
> 
> Does anyone have any arguments for which solution is preferred?

I slightly prefer (1) because there could be cases where you also create 
subdevices using that address space, and in order to set properties of 
subdevices before realize, you would have to create the subdevices in 
instance_init as well.

Thanks,

Paolo

> As part of this work I hacked up an address_space_count() function in 
> memory.c that returns the size of the address_spaces QTAILQ and added a 
> printf() to display the value during instance init and finalize which 
> demonstrates the problem nicely. This means it should be possible to add 
> a similar to check to device-introspect-test in future to prevent 
> similar errors from happening again.


