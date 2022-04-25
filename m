Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F98F50E9D6
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 21:59:53 +0200 (CEST)
Received: from localhost ([::1]:45588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nj4sC-0001KT-FV
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 15:59:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1nj4qm-0000RH-Q7
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 15:58:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52983)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1nj4qk-0008Mk-Bf
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 15:58:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650916701;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WRA+/TwRZoYTlVNNziTPVnQhxJKOT9VOQ8rXq3HvAqY=;
 b=MZpnOx7VFxa9NcJM1UmEawtSOAgyUuHAZ3xE38d2UsRN4Zevedj6pBvC4HUcMsPbZUkdm9
 NEHQQBLAkakSQRoBtFnmXkb3f3IcsjtEfCP6tg/zQIcDGCO8GWNdiGwFGO7Ew+HIAhmXL+
 vSjJBc0cnfRWDWk5iHFDwwjtsopftFQ=
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-558-Osf2kd6LOyGBGO-bNcbQXw-1; Mon, 25 Apr 2022 15:58:18 -0400
X-MC-Unique: Osf2kd6LOyGBGO-bNcbQXw-1
Received: by mail-io1-f70.google.com with SMTP id
 y10-20020a056602164a00b00653f388e244so12226118iow.22
 for <qemu-devel@nongnu.org>; Mon, 25 Apr 2022 12:58:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WRA+/TwRZoYTlVNNziTPVnQhxJKOT9VOQ8rXq3HvAqY=;
 b=l32OrhgNKu1HWyDhHArzJSB2DGUJCytqz3/jZ6QhNL+Oq4i0R+GeKsqH/MGqV43dBV
 Rh2yQOtYBDlcOryzd0vDkFCH2xDQBri6vWXHw5OqqXVTrl4mebB7Jfq/MZo+CllIVMfL
 iG+JHiMtjqpyu4U4cTIEObLghZjv5kQlThfCqdsJCA4RYNF2tdVzCXAZHmi0q4bQcdvc
 1bSe68Ik2B+lRM4qNO/03yMuSWY/CQtvMxGmL1cGIBTwJFan3vdNsLs0Ny3uAlBltmdF
 vrM9NZFp1adzFrTfLoDZ9E7ROiq85O2YXNokl7zTVg+M2EnI9vpHdKrbVdGKS9nUmTlB
 VQnA==
X-Gm-Message-State: AOAM530d4elgrJLLgMDxDOx6fWxoP/SmpruadlQTN/u42r5o6WbHD/zm
 Ch0UOrwq2cVrTZt1tX3k7FnS3Mo1BTJ/uGPQ/of6Jgq7CPX3fm3kkeJytEixkJg3g2M2KAi+IRf
 RyPPkMy8ps9G+fKM=
X-Received: by 2002:a6b:f403:0:b0:657:880c:f351 with SMTP id
 i3-20020a6bf403000000b00657880cf351mr2081903iog.131.1650916697278; 
 Mon, 25 Apr 2022 12:58:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxvYDmnQ1vPI/+fMI2/pwhYkDTEGzAFR1XK+yrU0c8uu+cTxxKeaEP5VUxIwBf7psDH7x+86A==
X-Received: by 2002:a6b:f403:0:b0:657:880c:f351 with SMTP id
 i3-20020a6bf403000000b00657880cf351mr2081892iog.131.1650916697048; 
 Mon, 25 Apr 2022 12:58:17 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 c15-20020a5d8b4f000000b00648f75d0289sm7994446iot.6.2022.04.25.12.58.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Apr 2022 12:58:15 -0700 (PDT)
Date: Mon, 25 Apr 2022 13:58:14 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v3 for-7.1] vfio/common: remove spurious tpm-crb-cmd
 misalignment warning
Message-ID: <20220425135814.37168ee1.alex.williamson@redhat.com>
In-Reply-To: <20220323203119.360894-1-eric.auger@redhat.com>
References: <20220323203119.360894-1-eric.auger@redhat.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, stefanb@linux.vnet.ibm.com, cohuck@redhat.com,
 qemu-devel@nongnu.org, eric.auger.pro@gmail.com, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 23 Mar 2022 21:31:19 +0100
Eric Auger <eric.auger@redhat.com> wrote:

> The CRB command buffer currently is a RAM MemoryRegion and given
> its base address alignment, it causes an error report on
> vfio_listener_region_add(). This region could have been a RAM device
> region, easing the detection of such safe situation but this option
> was not well received. So let's add a helper function that uses the
> memory region owner type to detect the situation is safe wrt
> the assignment. Other device types can be checked here if such kind
> of problem occurs again.
>=20
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>=20
> ---
>=20
> v2 -> v3:
> - Use TPM_IS_CRB()
>=20
> v1 -> v2:
> - do not check the MR name but rather the owner type
> ---
>  hw/vfio/common.c     | 27 ++++++++++++++++++++++++++-
>  hw/vfio/trace-events |  1 +
>  2 files changed, 27 insertions(+), 1 deletion(-)
>=20
> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> index 080046e3f51..55bc116473e 100644
> --- a/hw/vfio/common.c
> +++ b/hw/vfio/common.c
> @@ -40,6 +40,7 @@
>  #include "trace.h"
>  #include "qapi/error.h"
>  #include "migration/migration.h"
> +#include "sysemu/tpm.h"
> =20
>  VFIOGroupList vfio_group_list =3D
>      QLIST_HEAD_INITIALIZER(vfio_group_list);
> @@ -861,6 +862,22 @@ static void vfio_unregister_ram_discard_listener(VFI=
OContainer *container,
>      g_free(vrdl);
>  }
> =20
> +static bool vfio_known_safe_misalignment(MemoryRegionSection *section)
> +{
> +    MemoryRegion *mr =3D section->mr;
> +
> +    if (!TPM_IS_CRB(mr->owner)) {
> +        return false;
> +    }
> +
> +    /* this is a known safe misaligned region, just trace for debug purp=
ose */
> +    trace_vfio_known_safe_misalignment(memory_region_name(mr),
> +                                       section->offset_within_address_sp=
ace,
> +                                       section->offset_within_region,
> +                                       qemu_real_host_page_size);

qemu_real_host_page_size and qemu_real_host_page_mask are now functions.

I thought I'd just append "()" in each case, but then the 32-bit build
breaks...

> +    return true;
> +}
> +
>  static void vfio_listener_region_add(MemoryListener *listener,
>                                       MemoryRegionSection *section)
>  {
> @@ -884,7 +901,15 @@ static void vfio_listener_region_add(MemoryListener =
*listener,
>      if (unlikely((section->offset_within_address_space &
>                    ~qemu_real_host_page_mask) !=3D
>                   (section->offset_within_region & ~qemu_real_host_page_m=
ask))) {
> -        error_report("%s received unaligned region", __func__);
> +        if (!vfio_known_safe_misalignment(section)) {
> +            error_report("%s received unaligned region %s iova=3D0x%"PRI=
x64
> +                         " offset_within_region=3D0x%"PRIx64
> +                         " qemu_real_host_page_mask=3D0x%"PRIxPTR,
> +                         __func__, memory_region_name(section->mr),
> +                         section->offset_within_address_space,
> +                         section->offset_within_region,
> +                         qemu_real_host_page_mask);

Note how here we're very verbosely printing
"qemu_real_host_page_mask=3D0x%..." and we're passing the
qemu_real_host_page_mask value.  In the previous trace command we're
passing qemu_real_host_page_size.

> +        }
>          return;
>      }
> =20
> diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
> index 0ef1b5f4a65..6f38a2e6991 100644
> --- a/hw/vfio/trace-events
> +++ b/hw/vfio/trace-events
> @@ -100,6 +100,7 @@ vfio_listener_region_add_skip(uint64_t start, uint64_=
t end) "SKIPPING region_add
>  vfio_spapr_group_attach(int groupfd, int tablefd) "Attached groupfd %d t=
o liobn fd %d"
>  vfio_listener_region_add_iommu(uint64_t start, uint64_t end) "region_add=
 [iommu] 0x%"PRIx64" - 0x%"PRIx64
>  vfio_listener_region_add_ram(uint64_t iova_start, uint64_t iova_end, voi=
d *vaddr) "region_add [ram] 0x%"PRIx64" - 0x%"PRIx64" [%p]"
> +vfio_known_safe_misalignment(const char *name, uint64_t iova, uint64_t o=
ffset_within_region, uint64_t page_size) "Region \"%s\" iova=3D0x%"PRIx64" =
offset_within_region=3D0x%"PRIx64" qemu_real_host_page_mask=3D0x%"PRIxPTR "=
: cannot be mapped for DMA"

So here we've been passed qemu_real_host_page_size but we're again
printing "qemu_real_host_page_mask=3D0x%...".  To make things slightly
more complicated, qemu_real_host_page_mask is now an intptr_t, which is
arbitrarily not supported in trace commands, while
qemu_real_host_page_size is a uintptr_t which is supported in trace
commands :-\  I'll let you decide how you want to resolve this.  Thanks,

Alex


