Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D38C2C8202
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 11:21:04 +0100 (CET)
Received: from localhost ([::1]:36852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjgIp-0001VS-4V
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 05:21:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pankaj.gupta.linux@gmail.com>)
 id 1kjgGl-00010M-Kb; Mon, 30 Nov 2020 05:18:55 -0500
Received: from mail-il1-x142.google.com ([2607:f8b0:4864:20::142]:35848)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pankaj.gupta.linux@gmail.com>)
 id 1kjgGk-0001CC-4t; Mon, 30 Nov 2020 05:18:55 -0500
Received: by mail-il1-x142.google.com with SMTP id z10so2274983ilu.3;
 Mon, 30 Nov 2020 02:18:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eRz4j+1joGd0G3OdSB79/UjF2VSaY8h1oaAexzTrqXs=;
 b=rNt4jpZQvzqjCuyPPMccHBtBVCuDFpKTYX0tUkcxQ983eKkePjmWugX2WkIAVLxVn8
 kb6cHU6seW+k5bD22peRssqk2IExGpr5AcHQJzuf+n6KeUkgHHJgem/T8QGOppGUOoor
 DPvd9L6eUQ6WjJ3IvvT1OmAkaa7XoR5cizMBf+edjzNKzMa+0HPVvCNpsKQUqrHIbWop
 qcQJXXCMKpDsv8Qg3FfQB1UtPiWBDFh30a1M79cMLpB+DOFpcFkv7QgdXw5gKCubofpz
 xBHuHYutRhPY6x+0FH2CdOekNMuKRT4QIR1oC1oJKxhjKhvB+DgjsXRDW3gjg8Lwyvpb
 PMpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eRz4j+1joGd0G3OdSB79/UjF2VSaY8h1oaAexzTrqXs=;
 b=VB/Z55tLIfgUo/HJc65W19V2wbscenKMoTNBsUWOXnyuDxtkG/t7TqH+tulcnpoD97
 Eb+FWBMoDJmtkv+6R8DHpUcpiGiWOke2EWtP1Xao0Cm8oBXcV3hO9ZLjnyprkVvq01fE
 1GXqdGoaKaoAjH7DvEFOl/5BXvSzYd3qvxwQ3yqMGU/TL5wJ/KKDv102/6ISqF8FcXh6
 pc8cGBl2BHbbSYS5/DbjSawtlOHteq08V328OkSO7DS8r84XjYQJAaBdCbiXHdsD6glq
 2NXfaUXViLkC1/tZ+BtoY/2BRh9fumdepXyV3tVMjLTwgkAp2uVM/5DGgho+RXKyuMlJ
 3yuA==
X-Gm-Message-State: AOAM532O0Gq6nsX9VCwLQg2AdZhWI6El6lJ8Sw/CZEoagJ0nKpcM1Hv0
 86fivIpYtMnWapq9XDxR9PS/kxhfTyKR2dakHTA=
X-Google-Smtp-Source: ABdhPJxdO5kyhUCSWqLw+keRKdLNu1iKKgIJQosfb0KyqnY0VXi68kl5X1CXkgfU457whvLAuTk5cEAREO4wY2VIDCo=
X-Received: by 2002:a92:d4cb:: with SMTP id o11mr18420397ilm.163.1606731532631; 
 Mon, 30 Nov 2020 02:18:52 -0800 (PST)
MIME-Version: 1.0
References: <20201130083630.2520597-1-ganqixin@huawei.com>
 <20201130083630.2520597-2-ganqixin@huawei.com>
In-Reply-To: <20201130083630.2520597-2-ganqixin@huawei.com>
From: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Date: Mon, 30 Nov 2020 11:18:41 +0100
Message-ID: <CAM9Jb+iXWAQq7gg8RxS=aVX1MHBVuZucb4rXGaTU40kJ6-TmTw@mail.gmail.com>
Subject: Re: [PATCH v2 01/12] pc-dimm: put it into the 'storage' category
To: Gan Qixin <ganqixin@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::142;
 envelope-from=pankaj.gupta.linux@gmail.com; helo=mail-il1-x142.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: thuth@redhat.com, zhang.zhanghailiang@huawei.com,
 "Michael S . Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
 Qemu Developers <qemu-devel@nongnu.org>, kuhn.chenqun@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> The category of the pc-dimm device is not set, put it into the 'storage'
> category.
>
> Signed-off-by: Gan Qixin <ganqixin@huawei.com>
> ---
> Cc: Michael S. Tsirkin <mst@redhat.com>
> ---
>  hw/mem/pc-dimm.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/hw/mem/pc-dimm.c b/hw/mem/pc-dimm.c
> index 2ffc986734..017146e3d1 100644
> --- a/hw/mem/pc-dimm.c
> +++ b/hw/mem/pc-dimm.c
> @@ -282,6 +282,7 @@ static void pc_dimm_class_init(ObjectClass *oc, void *data)
>      mdc->get_plugged_size = memory_device_get_region_size;
>      mdc->get_memory_region = pc_dimm_md_get_memory_region;
>      mdc->fill_device_info = pc_dimm_md_fill_device_info;
> +    set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);

Any reason why pc-dimm would be in the storage category?

>  }
>
>  static TypeInfo pc_dimm_info = {
> --
> 2.23.0
>
>

