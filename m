Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CCFD42208C
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 10:19:52 +0200 (CEST)
Received: from localhost ([::1]:37796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXffz-00035M-Cp
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 04:19:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXfcA-0006eN-9n
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 04:15:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38749)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXfc8-00025w-T9
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 04:15:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633421751;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GWK9jhYHAz16BVu0V3LktixTLTLqMth4byPzqPPXRzM=;
 b=B1iA5uHp6OJjm/guRc9/cDsBW9rsbLJpXkZ9cYJj4ybFfm7PteXn+uy4chlyQkjCTA+muo
 6eqNUNIOAhnHIQU813JfgkRUWoOCb1zkoTx7lBOXghgmRC2Mv5p9T20xQXLEJRys1MPAfV
 1m2NcoaGuKyKJ1ZrRNYNf2cxuL1mAyE=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-45-nZeKZt6vNTm9FGEjcakmKQ-1; Tue, 05 Oct 2021 04:15:48 -0400
X-MC-Unique: nZeKZt6vNTm9FGEjcakmKQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 y15-20020a50ce0f000000b003dab997cf7dso16356830edi.9
 for <qemu-devel@nongnu.org>; Tue, 05 Oct 2021 01:15:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=GWK9jhYHAz16BVu0V3LktixTLTLqMth4byPzqPPXRzM=;
 b=qVOD/hU8mBHmJk+WTfU0aH1GupAXpZXWUqfP9RX0QihSloeZOh6CDYxeQeQ803p4rF
 EKSTS/r3qxHM828HPq5yOCqf4ied+PUfcetXJpVNnvdzSieN/IYnjJcGZLzxj8prOQet
 RdwKq+PInm2YJridXIH2uv6R6nYEH5z5/BN23pgh25vYIhLQ3J5cKOJk5R4C+XH0EJvZ
 vZiQKfDYv9AVziyne4uBiMsyfnR24BqAegtpMCO5YIvMe2Ibn1Y5+iVrkVCEJNgyreQa
 lNhBk9tVfBzVsSae4YqUd3hBzp+tohHu5LOIn/+Y+jJWR7RZwKLkzFB6vHTOVyI0TrLe
 aQ7A==
X-Gm-Message-State: AOAM531r4gdZpVohX/PiEpY19mCJR2ISdmaikIkoT15auhj94pyp9Ezm
 BzsBxv8o0WuV6OsbU3/pbNCyd122nX7aDAP+ikCwJrbSc/Nfj5Xe2SjW6TpZ5f3/+qfX9XG4Y/m
 aDvf1/LH+lVAq6eA=
X-Received: by 2002:a17:906:2506:: with SMTP id
 i6mr22661455ejb.186.1633421747514; 
 Tue, 05 Oct 2021 01:15:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxyp4YSodXDYgZa9apzHQbUL+ooKe4LzYLJ9sj3uKlP/MO0rUF0FZcxHp7ME/b9/xv4DfDqaA==
X-Received: by 2002:a17:906:2506:: with SMTP id
 i6mr22661442ejb.186.1633421747353; 
 Tue, 05 Oct 2021 01:15:47 -0700 (PDT)
Received: from redhat.com ([2.55.147.134])
 by smtp.gmail.com with ESMTPSA id i10sm8525891edl.15.2021.10.05.01.15.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 01:15:46 -0700 (PDT)
Date: Tue, 5 Oct 2021 04:15:43 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>
Subject: Re: [PATCH 2/3] vdpa: Add vhost_vdpa_section_end
Message-ID: <20211005041429-mutt-send-email-mst@kernel.org>
References: <20211005080131.408506-1-eperezma@redhat.com>
 <20211005080131.408506-3-eperezma@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211005080131.408506-3-eperezma@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Parav Pandit <parav@mellanox.com>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, virtualization@lists.linux-foundation.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 05, 2021 at 10:01:30AM +0200, Eugenio Pérez wrote:
> Abstract this operation, that will be reused when validating the region
> against the iova range that the device supports.
> 
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>

Note that as defined end is actually 1 byte beyond end of section.
As such it can e.g. overflow if cast to u64.
So be careful to use int128 ops with it.
Also - document?

> ---
>  hw/virtio/vhost-vdpa.c | 18 +++++++++++-------
>  1 file changed, 11 insertions(+), 7 deletions(-)
> 
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index ea1aa71ad8..a1de6c7c9c 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -24,6 +24,15 @@
>  #include "trace.h"
>  #include "qemu-common.h"
>  
> +static Int128 vhost_vdpa_section_end(const MemoryRegionSection *section)
> +{
> +    Int128 llend = int128_make64(section->offset_within_address_space);
> +    llend = int128_add(llend, section->size);
> +    llend = int128_and(llend, int128_exts64(TARGET_PAGE_MASK));
> +
> +    return llend;
> +}
> +
>  static bool vhost_vdpa_listener_skipped_section(MemoryRegionSection *section)
>  {
>      return (!memory_region_is_ram(section->mr) &&
> @@ -160,10 +169,7 @@ static void vhost_vdpa_listener_region_add(MemoryListener *listener,
>      }
>  
>      iova = TARGET_PAGE_ALIGN(section->offset_within_address_space);
> -    llend = int128_make64(section->offset_within_address_space);
> -    llend = int128_add(llend, section->size);
> -    llend = int128_and(llend, int128_exts64(TARGET_PAGE_MASK));
> -
> +    llend = vhost_vdpa_section_end(section);
>      if (int128_ge(int128_make64(iova), llend)) {
>          return;
>      }
> @@ -221,9 +227,7 @@ static void vhost_vdpa_listener_region_del(MemoryListener *listener,
>      }
>  
>      iova = TARGET_PAGE_ALIGN(section->offset_within_address_space);
> -    llend = int128_make64(section->offset_within_address_space);
> -    llend = int128_add(llend, section->size);
> -    llend = int128_and(llend, int128_exts64(TARGET_PAGE_MASK));
> +    llend = vhost_vdpa_section_end(section);
>  
>      trace_vhost_vdpa_listener_region_del(v, iova, int128_get64(llend));
>  
> -- 
> 2.27.0


