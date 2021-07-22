Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AAB13D23D2
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 14:51:51 +0200 (CEST)
Received: from localhost ([::1]:39544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6YB4-00060D-57
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 08:51:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1m6Xxn-0005pD-Ca
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 08:38:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33624)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1m6Xxl-00051o-UD
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 08:38:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626957485;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=knqNoJ0335NB1fQBr2aiuUa5AZTHqFvQJnu6tMzAwRw=;
 b=YYkOYHy5Xf4PYk2e4HHmksy/Hwgj9prgS9XDtJHwTPeGr/HEyuimnEM4FRxt0avs2KMh+Y
 Ics4ZG0met5f4gVEM1YNEiMNWEdo7ZxgjqUzoOygsaBZRVi8T3dpWo4KyURnMdmR8yW3VL
 NXK3DJMVuVE3JrTM1FDG+Hzs9l/mgJY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-360-VlqEH3NjMGaQPUyUYex7nQ-1; Thu, 22 Jul 2021 08:38:04 -0400
X-MC-Unique: VlqEH3NjMGaQPUyUYex7nQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 5-20020a0560001565b029013fe432d176so2395469wrz.23
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 05:38:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=knqNoJ0335NB1fQBr2aiuUa5AZTHqFvQJnu6tMzAwRw=;
 b=VZJDA9KSx3PllSscgtjiRvJVAqCjrzv+KbbGSDHPSEtpvS7updFA0mDB1iiEAFtF5K
 h2BtCWXf2BXlosI2IuuBSGo44dIx8O+QVccvYgAr9n92ABbJma5y55hPpqjX1dKwE3pm
 CLXQyAab+TQ3aMJci0CHkxwbAG6gqDKtVQ6DfDaLQ1EzS5f730aSh8HUW4vTYbEHGIEx
 ygfbdq2ZMCHfnLWD+5OQSzauTHJJuK8FstgVPy6mYj3KR7ulvD/U+mj5sCyhugXsHDEU
 6Z2z41C9Slmhp5/NrU3lIPAMpzUBr879GdoU+lyv33UG+S5/KWX7Awuwq97HpKebLjkI
 11Kw==
X-Gm-Message-State: AOAM532Hm2tIUDrIf56qen53RhWDw9s+K8f2iuPAymc5OUbOkJHO+GY/
 sILo1L7KJEDFj6Mc3xP/0bvCVkbABxgFGcMtCEJiC6X8Gf50b+QQ7KRAk7SbCQDTZ2g9yRY8jN0
 AdwKrENjKGQmCpmM=
X-Received: by 2002:a05:6000:1865:: with SMTP id
 d5mr46090591wri.376.1626957483036; 
 Thu, 22 Jul 2021 05:38:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJybOB/gyL5bGPu1a/qQ5Nrfvll4JYQRFWRrynlU2BgNND8mV4bbeRvn0UR1M4E5QsIvCu5X7A==
X-Received: by 2002:a05:6000:1865:: with SMTP id
 d5mr46090562wri.376.1626957482668; 
 Thu, 22 Jul 2021 05:38:02 -0700 (PDT)
Received: from [192.168.100.42] ([82.142.17.146])
 by smtp.gmail.com with ESMTPSA id d8sm30850650wrv.20.2021.07.22.05.38.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Jul 2021 05:38:02 -0700 (PDT)
Subject: Re: [PATCH 2/2] acpi: x86: pcihp: add support hotplug on
 multifunction bridges
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
References: <20210722105945.2080428-1-imammedo@redhat.com>
 <20210722105945.2080428-3-imammedo@redhat.com>
From: Laurent Vivier <lvivier@redhat.com>
Message-ID: <4a7618ec-5131-7ecf-7ff8-33a862f38726@redhat.com>
Date: Thu, 22 Jul 2021 14:38:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210722105945.2080428-3-imammedo@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lvivier@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.203, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: peter.maydell@linaro.org, jusual@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22/07/2021 12:59, Igor Mammedov wrote:
> Commit 17858a1695 (hw/acpi/ich9: Set ACPI PCI hot-plug as default on Q35)
> switched PCI hotplug from native to ACPI one by default.
> 
> That however breaks ihotplug on following CLI that used to work:
>    -nodefaults -machine q35 \
>    -device pcie-root-port,id=pcie-root-port-0,multifunction=on,bus=pcie.0,addr=0x1,chassis=1 \
>    -device pcie-root-port,id=pcie-root-port-1,port=0x1,addr=0x1.0x1,bus=pcie.0,chassis=2
> 
> where PCI device is hotplugged to pcie-root-port-1 with error on guest side:
> 
>   ACPI BIOS Error (bug): Could not resolve symbol [^S0B.PCNT], AE_NOT_FOUND (20201113/psargs-330)
>   ACPI Error: Aborting method \_SB.PCI0.PCNT due to previous error (AE_NOT_FOUND) (20201113/psparse-531)
>   ACPI Error: Aborting method \_GPE._E01 due to previous error (AE_NOT_FOUND) (20201113/psparse-531)
>   ACPI Error: AE_NOT_FOUND, while evaluating GPE method [_E01] (20201113/evgpe-515)
> 
> cause is that QEMU's ACPI hotplug never supported functions other then 0
> and due to bug it was generating notification entries for not described
> functions.
> 
> Technically there is no reason not to describe cold-plugged bridges
> (root ports) on functions other then 0, as they similaraly to bridge
> on function 0 are unpluggable.
> 
> Fix consists of describing cold-plugged bridges[root ports] on functions
> other than 0.
> 
> Fixes: 17858a169508609ca9063c544833e5a1adeb7b52
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> Reported-by: Laurent Vivier <lvivier@redhat.com>
> ---
>  hw/i386/acpi-build.c | 31 ++++++++++++++++++++++++-------
>  1 file changed, 24 insertions(+), 7 deletions(-)
> 

Tested-by: Laurent Vivier <lvivier@redhat.com>


