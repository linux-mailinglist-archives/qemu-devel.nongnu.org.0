Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 772E5588884
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Aug 2022 10:13:58 +0200 (CEST)
Received: from localhost ([::1]:53252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJ9Vt-0004Wn-AA
	for lists+qemu-devel@lfdr.de; Wed, 03 Aug 2022 04:13:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oJ9Rz-0001Te-4G
 for qemu-devel@nongnu.org; Wed, 03 Aug 2022 04:09:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oJ9Rv-0000VL-1L
 for qemu-devel@nongnu.org; Wed, 03 Aug 2022 04:09:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659514189;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VawaB+RlByZ3cIyMXyTXZRmF5i3on7JQFQrRZESzf4c=;
 b=X5rFxrxVd0RpqeFltJQn66W8nE0gZWVv3i+IPg9wR65Fapy5yazKzXQoKNWhOVMJmzcIak
 g0ZeCyxpuBaKyhv2TvifqAw/OKxrCvvyuFWGIH9hHta2a2yug13nerpCmmcKX/596gssG+
 H3yg2LkYAU+kjQdPH3AxMtPLP7GHxT8=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-557-SdBZ1BrBP2qAUcMl8BTywQ-1; Wed, 03 Aug 2022 04:09:48 -0400
X-MC-Unique: SdBZ1BrBP2qAUcMl8BTywQ-1
Received: by mail-lj1-f197.google.com with SMTP id
 y10-20020a2eb00a000000b0025e505fc2c4so2179109ljk.11
 for <qemu-devel@nongnu.org>; Wed, 03 Aug 2022 01:09:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=VawaB+RlByZ3cIyMXyTXZRmF5i3on7JQFQrRZESzf4c=;
 b=6v2O5pVNuDzfJXDphpeUSLxo1ZlzxJwV/WIoPpa8x88lUX+V5GlJgWpcQy5HGMGjdK
 NZVd9WoBi+4yS+qLxQGZy1n85UZRMfDLM0LP/OPWXz8IRwvrhNmqmmSehETsHMEVToGg
 2AECY7raDfoEhPig210+xSpCcj+ygQZOE3SrlsCq2UlmNtv/LEkL7ieGceaxqIvM1+nV
 +y/CZkSEvgwA/n9MPNZvVbLT4fiB0Ptk9caQrW12wrnq1AuApkWkO0MPOqxpIdLvTuLk
 7qbTC6rNHr1daENQEkeyNhKeI6rtn2V8Rm0nb4IW9hyW+P4SMYa1D4jojb4jablL9Wmw
 8aEg==
X-Gm-Message-State: AJIora9n0tLL9KIfW7t1RQaQHuDe20rtmWjAMGYrKAzFtNkYMQ4VqsAE
 FLOWvjBm2Uw2bF2cHgh6nXesGnp2q17cBSFw2Fe2VGOtMgWreqFtZrQTYnjRyZIGBXfetfz19re
 Nny+4lPNHVqGAgVWZ3fgjjXMUwgaxVt8=
X-Received: by 2002:a2e:4611:0:b0:25e:2ba7:601b with SMTP id
 t17-20020a2e4611000000b0025e2ba7601bmr7405169lja.62.1659514186614; 
 Wed, 03 Aug 2022 01:09:46 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sEjKrMLB6I//S+fqJXEHiIIDOja7UR5cpd1tTz/01CulhzEv1rDSnAEgcb0JlVODLRUFV9Px9IC/SWSVw/T/s=
X-Received: by 2002:a19:790f:0:b0:48a:d438:9f79 with SMTP id
 u15-20020a19790f000000b0048ad4389f79mr8018889lfc.411.1659514175759; Wed, 03
 Aug 2022 01:09:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220802143908.274364-1-eperezma@redhat.com>
In-Reply-To: <20220802143908.274364-1-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 3 Aug 2022 16:09:22 +0800
Message-ID: <CACGkMEtHaMXFqUN1o=Z-1c=s1hX81umSEbxP6Vf9cH34aERhYw@mail.gmail.com>
Subject: Re: [PATCH] vdpa: do not save failed dma maps in SVQ iova tree
To: =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Aug 2, 2022 at 10:39 PM Eugenio P=C3=A9rez <eperezma@redhat.com> wr=
ote:
>
> If a map fails for whatever reason, it must not be saved in the tree.
> Otherwise, qemu will try to unmap it in cleanup, leaving to more errors.
>
> Fixes: 34e3c94eda ("vdpa: Add custom IOTLB translations to SVQ")
> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> ---
>  hw/virtio/vhost-vdpa.c | 20 +++++++++++++-------
>  1 file changed, 13 insertions(+), 7 deletions(-)
>
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index 3ff9ce3501..e44c23dce5 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -176,6 +176,7 @@ static void vhost_vdpa_listener_commit(MemoryListener=
 *listener)
>  static void vhost_vdpa_listener_region_add(MemoryListener *listener,
>                                             MemoryRegionSection *section)
>  {
> +    DMAMap mem_region =3D {};
>      struct vhost_vdpa *v =3D container_of(listener, struct vhost_vdpa, l=
istener);
>      hwaddr iova;
>      Int128 llend, llsize;
> @@ -212,13 +213,13 @@ static void vhost_vdpa_listener_region_add(MemoryLi=
stener *listener,
>
>      llsize =3D int128_sub(llend, int128_make64(iova));
>      if (v->shadow_vqs_enabled) {
> -        DMAMap mem_region =3D {
> -            .translated_addr =3D (hwaddr)(uintptr_t)vaddr,
> -            .size =3D int128_get64(llsize) - 1,
> -            .perm =3D IOMMU_ACCESS_FLAG(true, section->readonly),
> -        };

Nit: can we keep this part unchanged?

Thanks

> +        int r;
>
> -        int r =3D vhost_iova_tree_map_alloc(v->iova_tree, &mem_region);
> +        mem_region.translated_addr =3D (hwaddr)(uintptr_t)vaddr,
> +        mem_region.size =3D int128_get64(llsize) - 1,
> +        mem_region.perm =3D IOMMU_ACCESS_FLAG(true, section->readonly),
> +
> +        r =3D vhost_iova_tree_map_alloc(v->iova_tree, &mem_region);
>          if (unlikely(r !=3D IOVA_OK)) {
>              error_report("Can't allocate a mapping (%d)", r);
>              goto fail;
> @@ -232,11 +233,16 @@ static void vhost_vdpa_listener_region_add(MemoryLi=
stener *listener,
>                               vaddr, section->readonly);
>      if (ret) {
>          error_report("vhost vdpa map fail!");
> -        goto fail;
> +        goto fail_map;
>      }
>
>      return;
>
> +fail_map:
> +    if (v->shadow_vqs_enabled) {
> +        vhost_iova_tree_remove(v->iova_tree, &mem_region);
> +    }
> +
>  fail:
>      /*
>       * On the initfn path, store the first error in the container so we
> --
> 2.31.1
>


