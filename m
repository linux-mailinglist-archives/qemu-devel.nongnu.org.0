Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09E4259D1C2
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 09:15:24 +0200 (CEST)
Received: from localhost ([::1]:38038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQO89-0004eK-Ux
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 03:15:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fengli@smartx.com>) id 1oQO4s-0002ga-MT
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 03:12:00 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:43929)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <fengli@smartx.com>) id 1oQO4n-00022V-7n
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 03:11:58 -0400
Received: by mail-pl1-x62d.google.com with SMTP id 20so12027291plo.10
 for <qemu-devel@nongnu.org>; Tue, 23 Aug 2022 00:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smartx-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:in-reply-to:to:references:date:subject:mime-version
 :content-transfer-encoding:from:from:to:cc;
 bh=pt3rPBGqlrh7tnn/gWf67LzxoyhkwBVxMsyppf+CuLQ=;
 b=siIaKFREmcVi3d97kd7h/w+lG57y3e0fLxC4AlvMb5dYG7sjdJaYacVcP2iYGm+l2o
 RQe2ln6RNMcEDJrE3TZzLgZqjxDTzE61tzV7pl93f+dN4+e4BHvVX4tDokNqafg8lxe9
 5ZXX/9kK+oJTol1T/kNo6hHlS1HZLw2YuNOaA4QDyoz7KJyEV6nNmHGOsdiBvBs1AK7y
 yFv9AeXjANFA84doZ2OJ7sg3oDpkP4VhuC4PoG5targoYAB1zDgCnP0KB8MfWgibiKJ0
 YArxAjhEw9VL5rKe5JX1NtFI3wJ1gigLKo3EtH7CfoDMxAf3neqCTFMEivFcjscO2fZh
 0yDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=message-id:in-reply-to:to:references:date:subject:mime-version
 :content-transfer-encoding:from:x-gm-message-state:from:to:cc;
 bh=pt3rPBGqlrh7tnn/gWf67LzxoyhkwBVxMsyppf+CuLQ=;
 b=8QMCGCU3G3CwswPIMlNDuWJyE7tVp5mM74Vcz3giWjTCNqVA7PE5ADI+STOlAiRvYn
 mlbo5gwxleTV4Cr3yM1KqfgYa389+ji9QYy2cJaKVCe4ThnX0MAYZlSP50b70+Rh4cS+
 9sL3g2SQ35dOU0uU+oUc1sOY3pLcVXj+B6KpCmDq6yUuRApGIU8blG2CFSwvOkYzIMcK
 aIvL3aNHBIAEA3Mxn162BFMP/Cko2uZEx87rjvUnTp37CbDhOsjrjxDxyLNOaegspFdl
 Vl2IHQn7PSI67I36HqGc94z8HC3/Ct97HkoVWcJp7wLQ4DD/P8c/IyMaCu/493qqXy0/
 SlZw==
X-Gm-Message-State: ACgBeo1WIeGBfQOGfVgykR5roWOEA9/LWdLJt9UwXu603g3MyG8sc7TW
 Y56UFfpzoez12gpEA0rJr+4mrw==
X-Google-Smtp-Source: AA6agR4USecHdzpTjFaBUBcOraWgD7Y6JDqxpsCQwSQDLY/kSsSJGfQLvqs9gHeBImGEzgeg7+hRmQ==
X-Received: by 2002:a17:902:e74d:b0:173:569:278b with SMTP id
 p13-20020a170902e74d00b001730569278bmr959981plf.135.1661238710768; 
 Tue, 23 Aug 2022 00:11:50 -0700 (PDT)
Received: from smtpclient.apple (61-221-155-12.hinet-ip.hinet.net.
 [61.221.155.12]) by smtp.gmail.com with ESMTPSA id
 cp7-20020a170902e78700b0016dc1df9bf7sm9713292plb.27.2022.08.23.00.11.49
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 23 Aug 2022 00:11:50 -0700 (PDT)
From: Li Feng <fengli@smartx.com>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.100.31\))
Subject: Re: [PATCH] vhost: reduce the set_mem_table call frenquency
Date: Tue, 23 Aug 2022 15:12:15 +0800
References: <20220823053820.35499-1-fengli@smartx.com>
To: "Michael S. Tsirkin" <mst@redhat.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
In-Reply-To: <20220823053820.35499-1-fengli@smartx.com>
Message-Id: <98D65A85-DC2E-4A5A-932B-A838199FF929@smartx.com>
X-Mailer: Apple Mail (2.3696.100.31)
Received-SPF: none client-ip=2607:f8b0:4864:20::62d;
 envelope-from=fengli@smartx.com; helo=mail-pl1-x62d.google.com
X-Spam_score_int: 14
X-Spam_score: 1.4
X-Spam_bar: +
X-Spam_report: (1.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Sorry, looks like I use the old qemu code, master has fix this issue.
Just ignore this patch.

> 2022=E5=B9=B48=E6=9C=8823=E6=97=A5 =E4=B8=8B=E5=8D=881:38=EF=BC=8CLi =
Feng <fengli@smartx.com> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> If the vhost memory layout doesn't change, don't need to call the =
vhost
> backend.
> The set_mem_table is time consuming when sending to vhost-user =
backend.
>=20
> On aarch64, the edk2 uefi firmware will write the pflash which will
> trigger the vhost_commit hundreds of times.
>=20
> Signed-off-by: Li Feng <fengli@smartx.com>
> ---
> hw/virtio/vhost.c         | 14 ++++++++++++++
> include/hw/virtio/vhost.h |  2 ++
> 2 files changed, 16 insertions(+)
>=20
> diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
> index f758f177bb..848d2f20d6 100644
> --- a/hw/virtio/vhost.c
> +++ b/hw/virtio/vhost.c
> @@ -523,6 +523,11 @@ static void vhost_commit(MemoryListener =
*listener)
>     /* Rebuild the regions list from the new sections list */
>     regions_size =3D offsetof(struct vhost_memory, regions) +
>                        dev->n_mem_sections * sizeof =
dev->mem->regions[0];
> +    if (dev->mem && dev->started) {
> +        g_free(dev->old_mem);
> +        dev->old_mem =3D dev->mem;
> +        dev->mem =3D NULL;
> +    }
>     dev->mem =3D g_realloc(dev->mem, regions_size);
>     dev->mem->nregions =3D dev->n_mem_sections;
>     used_memslots =3D dev->mem->nregions;
> @@ -542,6 +547,12 @@ static void vhost_commit(MemoryListener =
*listener)
>         goto out;
>     }
>=20
> +    if (dev->old_mem && dev->regions_size =3D=3D regions_size &&
> +            memcmp(dev->mem, dev->old_mem, dev->regions_size) =3D=3D =
0) {
> +        goto out;
> +    }
> +
> +    dev->regions_size =3D regions_size;
>     for (i =3D 0; i < dev->mem->nregions; i++) {
>         if (vhost_verify_ring_mappings(dev,
>                        (void =
*)(uintptr_t)dev->mem->regions[i].userspace_addr,
> @@ -1445,6 +1456,8 @@ int vhost_dev_init(struct vhost_dev *hdev, void =
*opaque,
>     hdev->mem =3D g_malloc0(offsetof(struct vhost_memory, regions));
>     hdev->n_mem_sections =3D 0;
>     hdev->mem_sections =3D NULL;
> +    hdev->old_mem =3D NULL;
> +    hdev->regions_size =3D 0;
>     hdev->log =3D NULL;
>     hdev->log_size =3D 0;
>     hdev->log_enabled =3D false;
> @@ -1491,6 +1504,7 @@ void vhost_dev_cleanup(struct vhost_dev *hdev)
>     }
>     g_free(hdev->mem);
>     g_free(hdev->mem_sections);
> +    g_free(hdev->old_mem);
>     if (hdev->vhost_ops) {
>         hdev->vhost_ops->vhost_backend_cleanup(hdev);
>     }
> diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
> index a346f23d13..b1d7287099 100644
> --- a/include/hw/virtio/vhost.h
> +++ b/include/hw/virtio/vhost.h
> @@ -73,6 +73,8 @@ struct vhost_dev {
>     MemoryListener memory_listener;
>     MemoryListener iommu_listener;
>     struct vhost_memory *mem;
> +    struct vhost_memory *old_mem;
> +    int regions_size;
>     int n_mem_sections;
>     MemoryRegionSection *mem_sections;
>     int n_tmp_sections;
> --=20
> 2.37.2
>=20


