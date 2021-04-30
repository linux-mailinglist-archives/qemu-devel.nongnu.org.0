Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E138C36F57F
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 07:48:45 +0200 (CEST)
Received: from localhost ([::1]:50894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcM16-0005A3-CR
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 01:48:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mprivozn@redhat.com>)
 id 1lcM0B-0004it-V3
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 01:47:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51689)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mprivozn@redhat.com>)
 id 1lcM07-00022Y-Cp
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 01:47:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619761661;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zqYHN1mBgEhaZ9tBX7QXYCtH9UG+UdBUWk4SfwWJhKg=;
 b=fsOK2izY7z4KjWaoYEYRMoReEL6I7+eJy7nSLegIL3ymwaRhYpG5TMy87ivZjK+A7tQ03Y
 n6xpTPci7/6MbrIf82lVBR1IaUfQbSIKqKgu7BOakU0H1VlzVlqxXfVLpS6H4CXFaUKdov
 Osw7BnQ3YwL7v3oBkoJnooR+MxgeH4s=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-435-JZVe1iwgNxC6SPbS4bqlUQ-1; Fri, 30 Apr 2021 01:47:37 -0400
X-MC-Unique: JZVe1iwgNxC6SPbS4bqlUQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 a12-20020a5d6cac0000b0290109c3c8d66fso8919147wra.15
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 22:47:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zqYHN1mBgEhaZ9tBX7QXYCtH9UG+UdBUWk4SfwWJhKg=;
 b=Smw+Sn6fXmVBFke1muEosGaYKPtyNrmLvLKEq2bNuqkuKSO9jt6BF+CimhHU8bTjGj
 E0rnSa/Z0GtARB8qQid512mi7YBeYerTYnyHF3QsWGkUkmmkhp8dXgXMjhD2JB7M7XfW
 OCyv6OYOnprKoQKkWQ6pdpIE/IaS9JCqli+joL9oTCFPUDtmEoEKU0wkvZp80+04pY3M
 3yQAJUhzESU7z2YXb0raHjhaj9+YklXJY587VvSf+x1ZdrZWBRic1ThJH3jKCJ8fxgH8
 nZw8K5pvV2Vc3iUW92aUUgDSNSQ+giwB+9g/NvxPxQkf1SLSEwY+JghVWTfwntUfYRGD
 SvvQ==
X-Gm-Message-State: AOAM532pWr5pP1UOMHS+NbOwOnHj3bH6SbHegADAuQH3kfzIYWAt7fKH
 lTFDf5EGLm47czW76Q+tSUzHy4gv6wxIFgQFJAf2HMmepGgdbZSlAlB0qMKHQw0J/fdUteTUBLy
 yvr01K9HQL6yIPHo=
X-Received: by 2002:a7b:c097:: with SMTP id r23mr4078008wmh.40.1619761655946; 
 Thu, 29 Apr 2021 22:47:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyJuZ6413VSK0f/udIvm+4a1EEHaYDdbptGMHYC83JSVLdrpNVPtTc83gqGgnxgd/mnuG7BVA==
X-Received: by 2002:a7b:c097:: with SMTP id r23mr4077984wmh.40.1619761655693; 
 Thu, 29 Apr 2021 22:47:35 -0700 (PDT)
Received: from ?IPv6:2a02:ab04:2f42:3c00:e5c2:1c68:9939:9520?
 (2a02-ab04-2f42-3c00-e5c2-1c68-9939-9520.dynamic.v6.chello.sk.
 [2a02:ab04:2f42:3c00:e5c2:1c68:9939:9520])
 by smtp.gmail.com with ESMTPSA id l25sm2111728wmi.17.2021.04.29.22.47.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Apr 2021 22:47:35 -0700 (PDT)
Subject: Re: [PATCH] virtio-blk: drop deprecated scsi=on|off property
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20210429155221.1226561-1-stefanha@redhat.com>
From: =?UTF-8?B?TWljaGFsIFByw612b3puw61r?= <mprivozn@redhat.com>
Message-ID: <83108055-6db0-9c03-1a91-ab940f816cfe@redhat.com>
Date: Fri, 30 Apr 2021 07:47:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210429155221.1226561-1-stefanha@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mprivozn@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mprivozn@redhat.com;
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Krempa <pkrempa@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, libvir-list@redhat.com,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Christoph Hellwig <hch@lst.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/29/21 5:52 PM, Stefan Hajnoczi wrote:
> The scsi=on|off property was deprecated in QEMU 5.0 and can be removed
> completely at this point.
> 
> Drop the scsi=on|off option. It was only available on Legacy virtio-blk
> devices. Linux v5.6 already dropped support for it.
> 
> Remove the hw_compat_2_4[] property assignment since scsi=on|off no
> longer exists. Old guests with Legacy virtio-blk devices no longer see
> the SCSI host features bit.
> 
> Live migrating old guests from an old QEMU with the SCSI feature bit
> enabled will fail with "Features 0x... unsupported. Allowed features:
> 0x...". We've followed the QEMU deprecation policy so users have been
> warned...
> 
> I have tested that libvirt still works when the property is absent. It
> no longer adds scsi=on|off to the command-line.
> 
> Cc: Markus Armbruster <armbru@redhat.com>
> Cc: Christoph Hellwig <hch@lst.de>
> Cc: Peter Krempa <pkrempa@redhat.com>
> Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  docs/specs/tpm.rst           |   2 +-
>  docs/system/deprecated.rst   |  13 ---
>  docs/pci_expander_bridge.txt |   2 +-
>  hw/block/virtio-blk.c        | 192 +----------------------------------
>  hw/core/machine.c            |   2 -
>  5 files changed, 3 insertions(+), 208 deletions(-)

Reviewed-by: Michal Privoznik <mprivozn@redhat.com>

Michal


