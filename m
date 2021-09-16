Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A7340DA93
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 15:03:24 +0200 (CEST)
Received: from localhost ([::1]:49490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQr2y-00043q-0G
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 09:03:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsuvorov@redhat.com>)
 id 1mQr0R-00023H-9a
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 09:00:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49617)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsuvorov@redhat.com>)
 id 1mQr0O-0004Tw-RI
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 09:00:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631797243;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Mh9hOwxySgdZf5T/R3qcRZI+qbOSIb5CXeQKoU+vmvI=;
 b=cJUhCKUVLFOHiUoLmFp9gjwx1S19yv7I8z/8kx0GElgWN/mSQq7iah1I0/LpPS9bC3tMo+
 uOJ2dTxYB6lnSx0B3FNRWLKD6e0Vvf9EQR8/UopoSWU0VHXEvD5ebAAREQja9PSdwdpgNQ
 i9vLkYzn758hiXLqp9kZvaPOmP7b3n8=
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com
 [209.85.161.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-28-90th94gcPiiQsFHJ7dfP7g-1; Thu, 16 Sep 2021 08:59:34 -0400
X-MC-Unique: 90th94gcPiiQsFHJ7dfP7g-1
Received: by mail-oo1-f72.google.com with SMTP id
 t1-20020a4ad0a1000000b0028bbf04eae9so23517367oor.10
 for <qemu-devel@nongnu.org>; Thu, 16 Sep 2021 05:59:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Mh9hOwxySgdZf5T/R3qcRZI+qbOSIb5CXeQKoU+vmvI=;
 b=JIFx4UEm5Efg3TVahMJV//JaIs3yNECHevMxcfZanoOfT7c5Pu4AGgXGpJGu2ok1vC
 4gSJapwYGZz5pwGQFepu9gHISgsRJvfqYoNTtS4lgzd9z3dQGVJ63qQVEWgzmXL0LgrW
 rY3Dfv2jtVsdI4u4WP643zWYWlZCRGkz/JV7g9Nmljmavo88ZKGXqYFA9vfG1I1wfkka
 gdvR69S82lryOLF3fjD+SP1JNQW5H8xOpXOHKySC8TrMsULj/CpJ1l2MunHA5/I0883V
 hU8BFR711F41q6yW97miVQuvNVyqBYcZKYosg27gUv8VFlfs+1OYXPb1H2QDeJK2MPwA
 QdsA==
X-Gm-Message-State: AOAM532SOZhMZq+W9rkb5litbGXmoie1CGfLMAWdatAILvhkaaQdlb3d
 lRPuKuMxwIvhmNjV2Mp1W/18c9IZ1Vpqfln7VQ7Ztq80NSaw1Li1U3VhqpgGIdR6PxXgqEvfhph
 qSY1qSDmOs840qQiD+IQlieXWARf7ax0=
X-Received: by 2002:a54:4383:: with SMTP id u3mr8786083oiv.149.1631797173591; 
 Thu, 16 Sep 2021 05:59:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxdZGFA6NARQDdFQi4PsjE+ivRpVx+6kfW3HkNPOKuU+3zEjJuPLnDu6Q6beskl/huHqlgNZdxediKNgEVyhUc=
X-Received: by 2002:a54:4383:: with SMTP id u3mr8786071oiv.149.1631797173376; 
 Thu, 16 Sep 2021 05:59:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210914045410.3380946-1-ani@anisinha.ca>
 <20210914045410.3380946-3-ani@anisinha.ca>
In-Reply-To: <20210914045410.3380946-3-ani@anisinha.ca>
From: Julia Suvorova <jusual@redhat.com>
Date: Thu, 16 Sep 2021 14:59:22 +0200
Message-ID: <CAMDeoFUMn21-m4hnMaWdjVFW9izOXg58HJZQ+PcXy5HbVqrESw@mail.gmail.com>
Subject: Re: [PATCH 2/3] hw/i386/acpi: fix conflicting IO address range for
 acpi pci hotplug in q35
To: Ani Sinha <ani@anisinha.ca>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsuvorov@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsuvorov@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
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
Cc: Igor Mammedov <imammedo@redhat.com>,
 Philippe Mathieu Daude <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Sep 14, 2021 at 6:54 AM Ani Sinha <ani@anisinha.ca> wrote:
>
> Change caf108bc58790 ("hw/i386/acpi-build: Add ACPI PCI hot-plug methods to Q35")
> selects an IO address range for acpi based PCI hotplug for q35 arbitrarily. It
> starts at address 0x0cc4 and ends at 0x0cdb. At the time when the patch was
> written but the final version of the patch was not yet pushed upstream, this
> address range was free and did not conflict with any other IO address ranges.
> However, with the following change, this address range was no
> longer conflict free as in this change, the IO address range
> (value of ACPI_PCIHP_SIZE) was incremented by four bytes:
>
> b32bd763a1ca92 ("pci: introduce acpi-index property for PCI device")
>
> This can be seen from the output of QMP command 'info mtree' :
>
> 0000000000000600-0000000000000603 (prio 0, i/o): acpi-evt
> 0000000000000604-0000000000000605 (prio 0, i/o): acpi-cnt
> 0000000000000608-000000000000060b (prio 0, i/o): acpi-tmr
> 0000000000000620-000000000000062f (prio 0, i/o): acpi-gpe0
> 0000000000000630-0000000000000637 (prio 0, i/o): acpi-smi
> 0000000000000cc4-0000000000000cdb (prio 0, i/o): acpi-pci-hotplug
> 0000000000000cd8-0000000000000ce3 (prio 0, i/o): acpi-cpu-hotplug
>
> It shows that there is a region of conflict between IO regions of acpi
> pci hotplug and acpi cpu hotplug.
>
> Unfortunately, the change caf108bc58790 did not update the IO address range
> appropriately before it was pushed upstream to accomodate

s/accomodate/accommodate

> the increased
> length of the IO address space introduced in change b32bd763a1ca92.
>
> Due to this bug, windows guests complain 'This device cannot find
> enough free resources it can use' in the device manager panel for extended
> IO buses. This issue also breaks the correct functioning of pci hotplug as the
> following shows that the IO space for pci hotplug has been truncated:
>
> (qemu) info mtree -f
> FlatView #0
>  AS "I/O", root: io
>  Root memory region: io
>   0000000000000cc4-0000000000000cd7 (prio 0, i/o): acpi-pci-hotplug
>   0000000000000cd8-0000000000000cf7 (prio 0, i/o): acpi-cpu-hotplug
>
> Therefore, in this fix, we adjust the IO address range for the acpi pci
> hotplug so that it does not conflict with cpu hotplug and there is no
> truncation of IO spaces. The starting IO address of PCI hotplug region
> has been decremented by four bytes in order to accomodate

same

> four byte
> increment in the IO address space introduced by change
> b32bd763a1ca92 ("pci: introduce acpi-index property for PCI device")
>
> After fixing, the following are the corrected IO ranges:
>
> 0000000000000600-0000000000000603 (prio 0, i/o): acpi-evt
> 0000000000000604-0000000000000605 (prio 0, i/o): acpi-cnt
> 0000000000000608-000000000000060b (prio 0, i/o): acpi-tmr
> 0000000000000620-000000000000062f (prio 0, i/o): acpi-gpe0
> 0000000000000630-0000000000000637 (prio 0, i/o): acpi-smi
> 0000000000000cc0-0000000000000cd7 (prio 0, i/o): acpi-pci-hotplug
> 0000000000000cd8-0000000000000ce3 (prio 0, i/o): acpi-cpu-hotplug
>
> This change has been tested using a Windows Server 2019 guest VM. Windows
> no longer complains after this change.
>
> Fixes: caf108bc58790 ("hw/i386/acpi-build: Add ACPI PCI hot-plug methods to Q35")
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/561
>
> Signed-off-by: Ani Sinha <ani@anisinha.ca>

On the code itself:
Reviewed-by: Julia Suvorova <jusual@redhat.com>


> ---
>  include/hw/acpi/ich9.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/hw/acpi/ich9.h b/include/hw/acpi/ich9.h
> index a329ce43ab..f04f1791bd 100644
> --- a/include/hw/acpi/ich9.h
> +++ b/include/hw/acpi/ich9.h
> @@ -29,7 +29,7 @@
>  #include "hw/acpi/acpi_dev_interface.h"
>  #include "hw/acpi/tco.h"
>
> -#define ACPI_PCIHP_ADDR_ICH9 0x0cc4
> +#define ACPI_PCIHP_ADDR_ICH9 0x0cc0
>
>  typedef struct ICH9LPCPMRegs {
>      /*
> --
> 2.25.1
>


