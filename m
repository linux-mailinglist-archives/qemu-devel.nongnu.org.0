Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD735B6E9E
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Sep 2022 15:52:01 +0200 (CEST)
Received: from localhost ([::1]:51594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oY6KV-00007K-CM
	for lists+qemu-devel@lfdr.de; Tue, 13 Sep 2022 09:51:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oY6Hj-0005z1-OQ
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 09:49:08 -0400
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836]:43821)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oY6Hh-0008N4-WC
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 09:49:07 -0400
Received: by mail-qt1-x836.google.com with SMTP id a20so5988250qtw.10
 for <qemu-devel@nongnu.org>; Tue, 13 Sep 2022 06:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=4yQXv4w+8lbXEPvmV1omHYcbSHb5m1ZJFwB9pUoBdwQ=;
 b=pKYFyJraXsi7xjxlNW9glrA1u+KxcpClgpFuRBX0dO+6+KvknGsjCkYSdbG6ndxmNq
 81UxWMWFZxFxbGKvYt+kwzB6cWi4oGC2dDwa7INIc09gpEhuUp7GtBJZ4pF+p8+CkV6F
 6YYObo4AV+6kKtdHjZf2GfkMXrTBzXBfTrYlgV/FBAm5Gw7yFRmAlmqNig+nwnNqfnSU
 zhq2Q6qerUzjNRr3BIlA2TJ3tPj2pDuyREpb7aOZeIhPf3Tv2cD9Fvy1we/t1kDBjtN1
 k3sZJQMHgmyiYwHfgYlH7xe3Tizk0y9I7zULlYLfBvBZxhXzVw1qRlvisVEATSA8qL9K
 n5rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=4yQXv4w+8lbXEPvmV1omHYcbSHb5m1ZJFwB9pUoBdwQ=;
 b=KScQ4mRty5l25n5Pq6Ipvdl/nByMQrwVw5gILAhc/i6XJMay6nNdZOIq/MidJLXbUo
 mT3dDOQAoqPbAlwv5bxORk++S9GX6BVPNmvgH4ipApsIzhSd78+CUEabPi0kQXpOX3OV
 SU5wYhAN6cs8FZqTizsNsnsoHtcd95RXL8PedqsNoCpKvqg2wWu98u6opadaso56dSbf
 OMTr5M2FLawDtCYtKPqR541CgBUuE110JhOW7eS0ew4NF83NLDEIhuuN2AYdf5jK9M7T
 U5ZsPae3fjZDGRZXhqxxlsz6FirS8Dv1BdEhFA/F0a60FQYuxVEz/6kQsfb6ev6ZbMRc
 /c7w==
X-Gm-Message-State: ACgBeo1MWIwiFzh3BT7HBR+YhUWYChsy6Unrl/XsNS6xV734OigdBrS2
 jMlu8O4BgeG8Vv7Kmj2UM+/FszyHF2gsC2SYgw0=
X-Google-Smtp-Source: AA6agR5saE0kxcyxkZbTvoAYPi6oK7BRMQbddwjcz3lIRJvQyjt+zCpGbMAcOhHvXTRfXN8rbzhKb51o+q0xHi0OWv0=
X-Received: by 2002:ac8:7d53:0:b0:344:6545:5c02 with SMTP id
 h19-20020ac87d53000000b0034465455c02mr28114641qtb.365.1663076944607; Tue, 13
 Sep 2022 06:49:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220913105022.81953-1-antonio.caggiano@collabora.com>
 <20220913105022.81953-2-antonio.caggiano@collabora.com>
In-Reply-To: <20220913105022.81953-2-antonio.caggiano@collabora.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 13 Sep 2022 21:48:51 +0800
Message-ID: <CAEUhbmXWBFP33j1aSTBxzLhjP7truF_KrkrQn1N+sH0r6cNu+Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] virtio: Add shared memory capability
To: Antonio Caggiano <antonio.caggiano@collabora.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 gert.wollny@collabora.com, 
 dmitry.osipenko@collabora.com, "Dr. David Alan Gilbert" <dgilbert@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::836;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qt1-x836.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Tue, Sep 13, 2022 at 6:57 PM Antonio Caggiano
<antonio.caggiano@collabora.com> wrote:
>
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>
> Define a new capability type 'VIRTIO_PCI_CAP_SHARED_MEMORY_CFG'
> and the data structure 'virtio_pci_shm_cap' to go with it.
> They allow defining shared memory regions with sizes and offsets
> of 2^32 and more.
> Multiple instances of the capability are allowed and distinguished
> by a device-specific 'id'.
>
> v2: Remove virtio_pci_shm_cap as virtio_pci_cap64 is used instead.
> v3: No need for mask32 as cpu_to_le32 truncates the value.

The above changelog should be put under --- below

>
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Signed-off-by: Antonio Caggiano <antonio.caggiano@collabora.com>
> ---
>  hw/virtio/virtio-pci.c         | 18 ++++++++++++++++++
>  include/hw/virtio/virtio-pci.h |  4 ++++
>  2 files changed, 22 insertions(+)
>
> diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
> index a50c5a57d7..377bb06fec 100644
> --- a/hw/virtio/virtio-pci.c
> +++ b/hw/virtio/virtio-pci.c
> @@ -1169,6 +1169,24 @@ static int virtio_pci_add_mem_cap(VirtIOPCIProxy *proxy,
>      return offset;
>  }
>
> +int virtio_pci_add_shm_cap(VirtIOPCIProxy *proxy,
> +                           uint8_t bar, uint64_t offset, uint64_t length,
> +                           uint8_t id)
> +{
> +    struct virtio_pci_cap64 cap = {
> +        .cap.cap_len = sizeof cap,
> +        .cap.cfg_type = VIRTIO_PCI_CAP_SHARED_MEMORY_CFG,
> +    };
> +
> +    cap.cap.bar = bar;
> +    cap.cap.length = cpu_to_le32(length);
> +    cap.length_hi = cpu_to_le32(length >> 32);
> +    cap.cap.offset = cpu_to_le32(offset);
> +    cap.offset_hi = cpu_to_le32(offset >> 32);
> +    cap.cap.id = id;
> +    return virtio_pci_add_mem_cap(proxy, &cap.cap);
> +}
> +
>  static uint64_t virtio_pci_common_read(void *opaque, hwaddr addr,
>                                         unsigned size)
>  {
> diff --git a/include/hw/virtio/virtio-pci.h b/include/hw/virtio/virtio-pci.h
> index 2446dcd9ae..5e5c4a4c6d 100644
> --- a/include/hw/virtio/virtio-pci.h
> +++ b/include/hw/virtio/virtio-pci.h
> @@ -252,4 +252,8 @@ void virtio_pci_types_register(const VirtioPCIDeviceTypeInfo *t);
>   */
>  unsigned virtio_pci_optimal_num_queues(unsigned fixed_queues);
>
> +int virtio_pci_add_shm_cap(VirtIOPCIProxy *proxy,
> +                           uint8_t bar, uint64_t offset, uint64_t length,
> +                           uint8_t id);
> +
>  #endif
> --

Regards,
Bin

