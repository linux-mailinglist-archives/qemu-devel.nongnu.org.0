Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B90352CE899
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Dec 2020 08:27:47 +0100 (CET)
Received: from localhost ([::1]:46436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kl5VK-0000XJ-Og
	for lists+qemu-devel@lfdr.de; Fri, 04 Dec 2020 02:27:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pankaj.gupta.linux@gmail.com>)
 id 1kl5SM-0008Ar-Ir; Fri, 04 Dec 2020 02:24:42 -0500
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42]:34464)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pankaj.gupta.linux@gmail.com>)
 id 1kl5SL-0007qZ-2Q; Fri, 04 Dec 2020 02:24:42 -0500
Received: by mail-io1-xd42.google.com with SMTP id i18so4831608ioa.1;
 Thu, 03 Dec 2020 23:24:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NEGOO7o9RDWdU9FzlaHFbV7zwMtyrmhsOxqfCouYE8w=;
 b=mQgd8Zt5lT/7rbv+VXaOiVcYDtre3rc+in9W2vmDMyBuJf3P+VJIxWJRrugTXuXZT8
 uY6H8aixL62+XTM/r+dl1PFMzK6JRafKP690bKadBBNpkMN0eXWsqHedvwuGi/Kt7qUo
 aNoj5EI5l/sZyUb28eXYhD6fCcOvNj7ulbjeWx4SRTCAHWxxsL2cbfr6Be74t1pDb/28
 /NRd3sXWS2oPfP/aCAN0WHZ5fXC04UOlgYxoRhCQf5xyM5Ru0KLqqJHeyH95VVWDZfrI
 GR/wecgxtbui6Ol4WMGmGrMCkDj8ZsTUZLyzNpg6bvw8muiOYB1SA3ZFZTfsTSP3a3pt
 nrdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NEGOO7o9RDWdU9FzlaHFbV7zwMtyrmhsOxqfCouYE8w=;
 b=OtAXT4ZUrGuNkPBJCPGslhIWIByzivNOaabe4UwziZQtRUJ6NhA4siKBCitylBZiQP
 x2tkmucHEHpP7vaCgqb7klbcWV8OWbXu26y4ZJIT8hwYSA6e/goU3PWGh6w7XF0SckJt
 aja7rMNP+9ArnD5ajxo0kRw8cyiIWuZ14kNHh5ZmLjyGWpTo2AerrOzs4lCVuq24JruN
 mHPm838vscZ29FffjBQDhpIFt12hS1At5kXKps8EL81WJYeUZ27M3IN8IeCD+xw8M0Yt
 T/+OQqwp4Ih2FOjCgSgGfUsF643qu/Uxyx294/CGnNijcgR/vyqyzk80RX3/tkQDEmkc
 h1/w==
X-Gm-Message-State: AOAM532+5bQ72UohwoZKcRddZa4QrV0/EjBvOpbCfVKJ6VKQIiB5FUjB
 5ttUaYKeRTVZI+I6gz/JCrYvmWiydd+L62hxAOk=
X-Google-Smtp-Source: ABdhPJxwB2pFJAhrtXC6veI4YusAHlqJAnPD9b67BK9zebZBJDntSoHVrIIcEaBmyJytQolIirsLLq3qxA3o+cmmghA=
X-Received: by 2002:a6b:5d07:: with SMTP id r7mr4621476iob.84.1607066679658;
 Thu, 03 Dec 2020 23:24:39 -0800 (PST)
MIME-Version: 1.0
References: <20201115184903.1292715-1-ganqixin@huawei.com>
 <20201115184903.1292715-3-ganqixin@huawei.com>
In-Reply-To: <20201115184903.1292715-3-ganqixin@huawei.com>
From: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Date: Fri, 4 Dec 2020 08:24:28 +0100
Message-ID: <CAM9Jb+i5tBwfzBezpHQagVvEnOO+=iuPogUzufZWXKFWQB2V-A@mail.gmail.com>
Subject: Re: [PATCH 02/13] virtio-pmem: put it into the 'storage' category
To: Gan Qixin <ganqixin@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d42;
 envelope-from=pankaj.gupta.linux@gmail.com; helo=mail-io1-xd42.google.com
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
Cc: thuth@redhat.com, Zhanghailiang <zhang.zhanghailiang@huawei.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
 Qemu Developers <qemu-devel@nongnu.org>,
 "Chenqun \(kuhn\)" <kuhn.chenqun@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> The category of the virtio-pmem device is not set, put it into the 'storage'
> category.
>
> Signed-off-by: Gan Qixin <ganqixin@huawei.com>
> ---
> Cc: Michael S. Tsirkin <mst@redhat.com>
> ---
>  hw/virtio/virtio-pmem.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/hw/virtio/virtio-pmem.c b/hw/virtio/virtio-pmem.c
> index ddb0125901..98b3139cd0 100644
> --- a/hw/virtio/virtio-pmem.c
> +++ b/hw/virtio/virtio-pmem.c
> @@ -175,6 +175,7 @@ static void virtio_pmem_class_init(ObjectClass *klass, void *data)
>
>      vpc->fill_device_info = virtio_pmem_fill_device_info;
>      vpc->get_memory_region = virtio_pmem_get_memory_region;
> +    set_bit(DEVICE_CATEGORY_STORAGE, dc->categories);

Just noticed "virtio_pmem_pci_class_init" is marked as DEVICE_CATEGORY_MISC.
So, both virtio-pmem & virtio_pmem_pci have the same device category?

Thanks,
Pankaj

>  }
>
>  static TypeInfo virtio_pmem_info = {
> --
> 2.23.0
>
>

