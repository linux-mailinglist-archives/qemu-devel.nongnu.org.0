Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A81F40345B
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 08:44:10 +0200 (CEST)
Received: from localhost ([::1]:34926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNrJZ-0007g5-HB
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 02:44:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mNrIY-00070L-MS
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 02:43:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27535)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mNrIU-0002Zx-NB
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 02:43:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631083380;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k5++5x8XaP11OdY6vWh6sMKTlXknkTYIUaBhtR5gVrI=;
 b=bIruFPLWrsiA8U9fPx6G7qYzDwKYJqQ9cucWbO6t5bfbw11BgFl5QUCI3127XZPlMnyUFH
 TcoiQzq/xxUqEBpdHW6z3mAU8C0v55cdjkC6+myuahab9j0pfnCcaqOu7j8PLB5dxXoQKs
 +OjMGJRfz7FKA/hioQnN1X8Tyi8+Eo4=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-321-KCBgsHXeOVyes1tnqIf7pQ-1; Wed, 08 Sep 2021 02:42:59 -0400
X-MC-Unique: KCBgsHXeOVyes1tnqIf7pQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 s15-20020a056402520f00b003cad788f1f6so544915edd.22
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 23:42:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=k5++5x8XaP11OdY6vWh6sMKTlXknkTYIUaBhtR5gVrI=;
 b=KTK2Ci8sn3KqGSZQWMoFAoizttQ2NNGJ/bPoPG3jL4mnTzwv8pk5hDuE9+I24uiQle
 l5Km49qCT/peBx/ndzeIYaTxRT0MTVN7Dh2a0ipXfVzOtkZoN/vYObyagKKpKQbTPVUo
 UvxbaPIqMoGFj/jOm0l/jINw0viWSWmsucfFm1HtiULvq6QF+7CBg2PH8SZDcQwf3tBa
 htPj0zW7HrV7czH1aiDgXD0njthuqN8/2upT2sFTidxt9CRjQVufFXxlBn2Hwu2xoE59
 3QhTey/kTGesQTILduMxo9tNikdTFGx+P0K+oOxRw8FoIXt+R0nDQvFy3pjYbsdwUtBW
 zWAQ==
X-Gm-Message-State: AOAM5327QlctShr2b0UgbnLCynLNNjMfCGbE1bksApP/d8WaXjaOoE/2
 dOfTGyayZlTUyibnA8uSYZFIZNYIZRd4aW/gydsPLLqfodUZAKOhhA0ZHJRdNCF1iNSa2olg/i2
 m5Xj8/CobTOUMRN0=
X-Received: by 2002:aa7:d601:: with SMTP id c1mr2226845edr.143.1631083378224; 
 Tue, 07 Sep 2021 23:42:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxXjcvQLwzYi4ru74lOcAcbFOSbbZDfOJugVUuFN4KHB9FRK+DkJPH8ZLvGfH8qpWQCCg52UQ==
X-Received: by 2002:aa7:d601:: with SMTP id c1mr2226825edr.143.1631083378006; 
 Tue, 07 Sep 2021 23:42:58 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id c2sm145235edk.50.2021.09.07.23.42.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Sep 2021 23:42:57 -0700 (PDT)
Date: Wed, 8 Sep 2021 08:42:56 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Ani Sinha <ani@anisinha.ca>
Subject: Re: [PATCH] hw/i386/acpi-build: adjust q35 IO addr range for acpi
 pci hotplug
Message-ID: <20210908084256.6077f7a3@redhat.com>
In-Reply-To: <20210908041139.2219253-1-ani@anisinha.ca>
References: <20210908041139.2219253-1-ani@anisinha.ca>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: jusual@redhat.com, philmd@redhat.com, qemu-devel@nongnu.org, "Michael S.
 Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed,  8 Sep 2021 09:41:39 +0530
Ani Sinha <ani@anisinha.ca> wrote:

> Change caf108bc58790 ("hw/i386/acpi-build: Add ACPI PCI hot-plug methods to Q35")
> selects an IO address range for acpi based PCI hotplug for q35 arbitrarily. It
> starts at address 0x0cc4 and ends at 0x0cdb. It was assumed that this address
> range was free and available. However, upon more testing, it seems this address
> range to be not available for some latest versions of windows. 

The range is something assigned by QEMU, and guest has no say where it should be.
but perhaps we failed to describe it properly or something similar, so one gets
'no resource' error.
We need a find out a reason why Windows doesn't like it. You might get more
detailed error running Windows debug build with ACPI debugger attached.

> Hence, this
> change modifies the IO address range so that windows can allocate the address
> range without any conflict. The new address range would start at 0x0dd4 and end
> at address 0x0deb.
> 
> This change has been tested using a Windows Server 2019 guest VM.
> 
> Fixes: caf108bc58790 ("hw/i386/acpi-build: Add ACPI PCI hot-plug methods to Q35")
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/561
> 
> Signed-off-by: Ani Sinha <ani@anisinha.ca>
> ---
>  include/hw/acpi/ich9.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/hw/acpi/ich9.h b/include/hw/acpi/ich9.h
> index a329ce43ab..b68c5a2174 100644
> --- a/include/hw/acpi/ich9.h
> +++ b/include/hw/acpi/ich9.h
> @@ -29,7 +29,7 @@
>  #include "hw/acpi/acpi_dev_interface.h"
>  #include "hw/acpi/tco.h"
>  
> -#define ACPI_PCIHP_ADDR_ICH9 0x0cc4
> +#define ACPI_PCIHP_ADDR_ICH9 0x0dd4

that's ABI change, it must be versioned 

>  
>  typedef struct ICH9LPCPMRegs {
>      /*


