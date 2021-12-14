Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A993B4743AB
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Dec 2021 14:40:42 +0100 (CET)
Received: from localhost ([::1]:42226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mx82r-0002NL-Ot
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 08:40:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mx7f3-0001Uu-Dl
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 08:16:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26902)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mx7f0-0001WR-Km
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 08:16:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639487762;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ea3CbCHcLhDk9o9oK6T8lothLdws7OrRu+ylDCTQ5zo=;
 b=KH/Uge8u6/ex6xSJuyDR14OZMsFe+u1v40z9CeA1OCiIAnVW5ztfPY7D2GioHVpsEZ2rBJ
 jrItKOvPfgxus2ys6OCaJUJD3rgxXG3JrCztuHvj2H+I6EP6VYTnFdnB5lxwL/2PUy91G6
 9e/AXsXZgFSb3ej7FE1IYIDOgN3PsFU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-388-HLZhRCBUO0KmFlxQH_aSWQ-1; Tue, 14 Dec 2021 08:16:00 -0500
X-MC-Unique: HLZhRCBUO0KmFlxQH_aSWQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 v62-20020a1cac41000000b0033719a1a714so11268430wme.6
 for <qemu-devel@nongnu.org>; Tue, 14 Dec 2021 05:16:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Ea3CbCHcLhDk9o9oK6T8lothLdws7OrRu+ylDCTQ5zo=;
 b=I8xFQaa5v+atghIM2hNMZ4EvlatvaPCDZ1qGA5zlyhQiEs9yB0mYw7hYz32E2XFE87
 UppYlpcNZ1MnAVRDTyr1ebhGxlQBbCjQSLCFLLvFSd9TLVnqLklxJSQCUG/reSy4CdeZ
 n2us4GVDwQsVSP2W5LiEsYOW+mhmGdoLYv5j2vf47Awue42+SbsUZ+Cb/fZUwMwo4cHn
 JQ5x7qYsMShVCvsteMDBjPHhhYQZxdVejWUglRY6v/FTxoK9cO+cntghEddrbwKHjait
 GOPQLG99iPJZ6IF+eoLPcYTo9HOZfsS7z9Vo25S1Por3YpRbAz8df/zayOKoZ9cnGuDH
 nVXg==
X-Gm-Message-State: AOAM532my6ncKBRLM9DNLNMXwzsZGP77+bs/U1H/0XUQpgJC2Hgk3Rh3
 FkYeiqiJ6KcGGDcyRsSbxTIBpPCaeL0ISu97zd8rNzK1IVLkiZMHXSvbkb0rwJZk+3cR8BZXBUn
 afUwRBAiurzXCGjk=
X-Received: by 2002:a5d:44d1:: with SMTP id z17mr5827166wrr.143.1639487759713; 
 Tue, 14 Dec 2021 05:15:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzinpWGxbTGDk2yzT1ouO0huOqWUZ7C6GazkYbR+OlJhIGR10n/jVLZ8DgTKQa8ULyVPsnwZA==
X-Received: by 2002:a5d:44d1:: with SMTP id z17mr5827127wrr.143.1639487759535; 
 Tue, 14 Dec 2021 05:15:59 -0800 (PST)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id w7sm13529474wru.51.2021.12.14.05.15.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Dec 2021 05:15:58 -0800 (PST)
Message-ID: <4e9fd884-6b07-71d0-d153-3324f2563679@redhat.com>
Date: Tue, 14 Dec 2021 14:15:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH for-7.0] hw: Add compat machines for 7.0
To: Cornelia Huck <cohuck@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 David Hildenbrand <david@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>
References: <20211208170241.110551-1-cohuck@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20211208170241.110551-1-cohuck@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.716,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.962, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08/12/2021 18.02, Cornelia Huck wrote:
> Add 7.0 machine types for arm/i440fx/q35/s390x/spapr.
> 
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> ---
>   hw/arm/virt.c              |  9 ++++++++-
>   hw/core/machine.c          |  3 +++
>   hw/i386/pc.c               |  3 +++
>   hw/i386/pc_piix.c          | 14 +++++++++++++-
>   hw/i386/pc_q35.c           | 13 ++++++++++++-
>   hw/ppc/spapr.c             | 15 +++++++++++++--
>   hw/s390x/s390-virtio-ccw.c | 14 +++++++++++++-
>   include/hw/boards.h        |  3 +++
>   include/hw/i386/pc.h       |  3 +++
>   9 files changed, 71 insertions(+), 6 deletions(-)

Thanks, I've queued this to my s390x-next branch now (since nobody else 
objected, I assume the patch should be fine for everybody).

  Thomas


