Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C412AD4DD
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 12:27:04 +0100 (CET)
Received: from localhost ([::1]:40682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcRnj-0001tV-C0
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 06:27:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kcRZn-0008JC-75
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 06:12:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:55989)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kcRZl-0004m0-8n
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 06:12:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605006756;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FqEOVHHegPWsh5DP4Q780Qvg4oBy0JUEGJRndEnRZls=;
 b=HridquXloKzPKQo5lM6ZRJYZAFaSPiTepNTirP6HM7tzBeyJ3gc14Dhd25KtyKo5GERGsT
 wkIRsXBf2BIJ7f8Q0h7is5mxVEuwUp2kr+LsWF+DKO35m3qv2PdV4tYo2VPRS9wgt2rGPR
 0xWXcFoTqG+jEmA8JpDy6K6pYni3CUs=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-502-K6BkZzoiOkaTTecEFBlwPQ-1; Tue, 10 Nov 2020 06:12:34 -0500
X-MC-Unique: K6BkZzoiOkaTTecEFBlwPQ-1
Received: by mail-ej1-f71.google.com with SMTP id v21so4597353ejy.3
 for <qemu-devel@nongnu.org>; Tue, 10 Nov 2020 03:12:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FqEOVHHegPWsh5DP4Q780Qvg4oBy0JUEGJRndEnRZls=;
 b=XKbWlrX7kHVJJecr6DOzTXx3YCwK9+8LLzqdt9PRmjsiadZ8YI4Yl2CdAz5podRhFA
 60pAb1JoS3WbQpT7xrOwhqygHCliR4Snw+vPzxn9lql7A8TqiEh4EWTnfBGqE9/SWogk
 33LTE9h4ahifqZ3eSjxJS9UQl6Yxca6yV6l7BeLGMHpkg+m/hqgBrd7Txdsjmn9I/VwN
 On5zHBdFcA6ySKp1MhOz9C+JNRX8w86b5VR88nw0HHC5lAC7azs8hhZF7c9m+eoaROyo
 9m9qlvXsxuv2eyazgxsaBPXC3nmqzBj6i4au6bfNpJnWQA4zHy1UBXcuRrC93g06QDYN
 q5RQ==
X-Gm-Message-State: AOAM530ElRLI47HgyBmcT1sAI7vZuFXWOxC+Z4MjKA/D6NGBiKNs+bPb
 d0nOdBNuzb5sQIPsmjvY7/wmdu5HjkRsSPY6psa7hcQy53rXfFKvq1OK47gIaXs7px24gOM6Yut
 XZyvhIpkd4I7TRu4=
X-Received: by 2002:a17:906:43c6:: with SMTP id
 j6mr19324311ejn.547.1605006753618; 
 Tue, 10 Nov 2020 03:12:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzUaxKjdo0y5/qMkDo+IFJVom/GV/Yo3QI0u5kY9mltZ7gWB8Hbv/XjDk5Bu5zZOgDVoYdzag==
X-Received: by 2002:a17:906:43c6:: with SMTP id
 j6mr19324283ejn.547.1605006753354; 
 Tue, 10 Nov 2020 03:12:33 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id n16sm10323836ejz.46.2020.11.10.03.12.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Nov 2020 03:12:32 -0800 (PST)
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20201110095349.GA1082456@stefanha-x1.localdomain>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [RFC v3] VFIO Migration
Message-ID: <64fb6a41-fbfa-994c-9619-4df41ac97fde@redhat.com>
Date: Tue, 10 Nov 2020 12:12:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201110095349.GA1082456@stefanha-x1.localdomain>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/10 00:21:06
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: John G Johnson <john.g.johnson@oracle.com>, "Tian,
 Kevin" <kevin.tian@intel.com>, mtsirkin@redhat.com,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 quintela@redhat.com, Jason Wang <jasowang@redhat.com>, "Zeng,
 Xin" <xin.zeng@intel.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Yan Zhao <yan.y.zhao@intel.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Felipe Franciosi <felipe@nutanix.com>,
 Christophe de Dinechin <dinechin@redhat.com>,
 Thanos Makatos <thanos.makatos@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/11/20 10:53, Stefan Hajnoczi wrote:
> "allowed_values"
>    The list all values that the device implementation accepts for this migration
>    parameter. Integer ranges can be described using "<min>-<max>" strings.
> 
>    Examples: ['a', 'b', 'c'], [1, 5, 7], ['0-255', 512, '1024-2048'], [true]
> 
>    This member is optional. When absent, any value suitable for the type may be
>    given but the device implementation may refuse certain values.

I'd rather make this simpler:

- remove allowed_values for strings.  Effect: discourages using strings 
as enums, leaving them only for free-form values such as vendor name or 
model name.

- remove allowed_values for bools.  If off_value is absent the only 
allowed value is init_value.  If off_value is present, both true and 
false are allowed (and !off_value is the "on_value", so to speak).

- change allowed_values into allowed_min and allowed_max for int values. 
  Advantage: avoids having to parse strings as ranges.  Disadvantage: 
removes expressiveness (cannot say "x must be a power of two"), but I'm 
not sure it's worth the extra complication.

Thanks,

Paolo

> "description"
>    A human-readable description of the migration parameter. This is not intended
>    for user interfaces but rather as a troubleshooting aid for developers. The
>    description is typically written in English. This member is optional.
> 
> "init_value"
>    The initial parameter value when a device instance is created. This member is
>    required.
> 
> "off_value"
>    The parameter value that disables the effect of this parameter. This member
>    is absent if the migration parameter cannot be disabled.
> 
> "type"
>    The data type ("bool", "int", "str"). This member is required.


