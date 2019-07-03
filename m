Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E351E5DDCA
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Jul 2019 07:39:49 +0200 (CEST)
Received: from localhost ([::1]:32802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hiXzh-0005zY-5a
	for lists+qemu-devel@lfdr.de; Wed, 03 Jul 2019 01:39:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39417)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <pbonzini@redhat.com>) id 1hiXxo-0005Gc-4p
 for qemu-devel@nongnu.org; Wed, 03 Jul 2019 01:37:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1hiXxm-000525-BO
 for qemu-devel@nongnu.org; Wed, 03 Jul 2019 01:37:52 -0400
Received: from mail-wr1-f50.google.com ([209.85.221.50]:43639)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1hiXxm-0004zk-4s
 for qemu-devel@nongnu.org; Wed, 03 Jul 2019 01:37:50 -0400
Received: by mail-wr1-f50.google.com with SMTP id p13so1140454wru.10
 for <qemu-devel@nongnu.org>; Tue, 02 Jul 2019 22:37:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=L0aGZAVpfb0bbuaWZcXEwrDLFpAfzCOr2o2ibyoclBg=;
 b=f6DNYYHAkK/nyiA+kyrX4Bk5OIETynodnYtJNBqRR53BqChwQXm/xR9mfOmYUeTID+
 Nog1m7N0Qhcc/x7P91Wj9XKjvvjUVtzubgX1nLOA0L8Pe7rYvnZiuzxHzp2TgQAMLgvh
 2UNSMRAsO0Ia/Ixfs4ZIgTL4X0mu1MIai9uQB8XURR6dmEZvtBc7BvoiW8yMVeLkCeIz
 b4gZAyLjcY7C+LAV97GmSN3fJuRbf6RhyEhc6c+vli3jVpxiT0AFkAO94DKfhhWzYPKq
 5fT8H4l+VKJfX7zMt8OVgxFbPnvnbLtBpeI/dN5EPoLrDiEiCPvPXnvNz/IU2Ndk7Uct
 kQlw==
X-Gm-Message-State: APjAAAUvtU/VZR3TVJHUVYgfpznvKikotBEAbLeQWMfYaRBtsBXcSrCv
 uy+UodyZIPOKgFriZcKOr0ZjzA==
X-Google-Smtp-Source: APXvYqzbtMm5RhLusUO5956K3xDkb7LSbKWQA0XjQUlCH1G3sh640Pd8YyjUSY+EOGCdXr92PHZFRQ==
X-Received: by 2002:adf:eb86:: with SMTP id t6mr26077160wrn.96.1562132268113; 
 Tue, 02 Jul 2019 22:37:48 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:b8:794:183e:9e2a?
 ([2001:b07:6468:f312:b8:794:183e:9e2a])
 by smtp.gmail.com with ESMTPSA id q193sm971896wme.8.2019.07.02.22.37.47
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Tue, 02 Jul 2019 22:37:47 -0700 (PDT)
To: Markus Armbruster <armbru@redhat.com>
References: <878stfzozv.fsf@dusky.pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <1c014d01-edef-d418-75a4-96f0811717e8@redhat.com>
Date: Wed, 3 Jul 2019 07:37:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <878stfzozv.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.50
Subject: Re: [Qemu-devel] What's IOMMUMemoryRegion's super?
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>,
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03/07/19 07:05, Markus Armbruster wrote:
>     static const TypeInfo iommu_memory_region_info = {
>         .parent             = TYPE_MEMORY_REGION,
>         .name               = TYPE_IOMMU_MEMORY_REGION,
>         .class_size         = sizeof(IOMMUMemoryRegionClass),
>         .instance_size      = sizeof(IOMMUMemoryRegion),
>         .instance_init      = iommu_memory_region_initfn,
>         .abstract           = true,
>     };
> 
>     typedef struct IOMMUMemoryRegionClass {
>         /* private */
> --->    struct DeviceClass parent_class;
>         [...]
>     };
> 
>     struct IOMMUMemoryRegion {
>         MemoryRegion parent_obj;
>         [...]
>     };
> 
> The parent is TYPE_MEMORY_REGION, and the instance struct's first member is
> TYPE_MEMORY_REGION's instance struct as I expect, but the class struct's
> first member is something else entirely.

Cut-and-paste error.  MemoryRegion adds no methods so that could be
either ObjectClass or better

    typedef struct MemoryRegionClass {
        /* private */
        ObjectClass parent_class;
    } ObjectClass;

Paolo

