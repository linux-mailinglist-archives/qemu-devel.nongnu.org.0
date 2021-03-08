Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A00F1330AD6
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 11:08:45 +0100 (CET)
Received: from localhost ([::1]:55528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJCoe-0007f0-Mq
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 05:08:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lJCms-0007Dc-H5
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 05:06:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21002)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lJCmq-0003oR-T5
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 05:06:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615198012;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LSKv3gMXX16cS52U4Qvp+J82MiTG73WzoxEbYLwybO4=;
 b=cVK36ePNiYOvPr3pWHCHm4zGad9r1d0h2WewSgWwbwonkroP3TR9KhpE5bHqXTrSO+GgPn
 dGoPCL4h9f8ncPBrLZ7EJzJK1mmv+VTyCAIu+RdRFLX9bnqEyz3Po5yFd8m5TWUquZ/ifx
 QTrl85qICeK0CFMRHCxKMX+tIdwWZbE=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-1-DCovMwDGMg-nOAQ81zOl4Q-1; Mon, 08 Mar 2021 05:06:50 -0500
X-MC-Unique: DCovMwDGMg-nOAQ81zOl4Q-1
Received: by mail-ej1-f70.google.com with SMTP id v19so3872119ejc.12
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 02:06:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LSKv3gMXX16cS52U4Qvp+J82MiTG73WzoxEbYLwybO4=;
 b=EXdFaIUpb2LJnTo7UBYkZDpnmKq0RXUSkQ2Ybli02toyVgb/AlIgvW8ggIBR+Zb3vT
 l0B57hOaCOGeGdDWMM2V5yJQzll7tJ0pNVb9Q9rzbbiDMR+mrRRuvUeG+4yLu5+Ll257
 Kpyrq/UnpYicCdE3yDqx5z/9dPR0ZRYdE5URf55oAzoVeNerYKVJ8uE+ErHCKkNuxIbC
 HS+GuxpkxHL/MJ46j9M0bJwN+hTDSfzhr9v11C6qxw5oPQkOc3u32BI7kU3TVfwY+76r
 AiGHG+NxWfL8nF97WJwl0G/mCkyzdzLF9hA/chH9ZHCnzbK1B/yxkhx+avlvXmAFetiH
 PBrw==
X-Gm-Message-State: AOAM533Omx4e8tvlQaifX7O9mEaMNbSbFzrfLDcfAFEN3ddk6NM1or+L
 INSm6+6qrL49XYi55yT03kyqL5Xh9LUm4QML+sWwGS6kCf3xL55PgiuEm0usY7hAijPXRRYPdyn
 iyTw4fF/eBr0rJ4KNSpwwriwC+dePWVQr6CuksrIrG7IHcVpTS+jbK/7lYsLCW1c4
X-Received: by 2002:a05:6402:95b:: with SMTP id
 h27mr21681136edz.93.1615198009396; 
 Mon, 08 Mar 2021 02:06:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz0vANs4XPKrXiuvO1Csa/OPG9eVPxEHXvBQh9bKMaViISOCdXeDffDDzG/5Uk7zUA7zITIOA==
X-Received: by 2002:a05:6402:95b:: with SMTP id
 h27mr21681105edz.93.1615198009155; 
 Mon, 08 Mar 2021 02:06:49 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id r17sm6127661ejz.109.2021.03.08.02.06.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Mar 2021 02:06:48 -0800 (PST)
Subject: Re: [PATCH] virtio-net: calculating proper msix vectors on init
To: Jason Wang <jasowang@redhat.com>, mst@redhat.com
References: <20210308053059.28753-1-jasowang@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <5a0806aa-af0b-2a41-c604-ede8dd49de31@redhat.com>
Date: Mon, 8 Mar 2021 11:06:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210308053059.28753-1-jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: ehabkost@redhat.com, stefanha@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Jason,

On 3/8/21 6:30 AM, Jason Wang wrote:
> Currently, the default msix vectors for virtio-net-pci is 3 which is
> obvious not suitable for multiqueue guest, so we depends on the user
> or management tools to pass a correct vectors parameter. In fact, we
> can simplifying this by calculating the number of vectors on realize.
> 
> Consider we have N queues, the number of vectors needed is 2*N + 2
> (#queue pais + plus one config interrupt and control vq). We didn't

Typo "pairs".

> check whether or not host support control vq because it was added
> unconditionally by qemu to avoid breaking legacy guests such as Minix.
> 
> Signed-off-by: Jason Wang <jasowang@redhat.com>
> ---
>  hw/core/machine.c          | 1 +
>  hw/virtio/virtio-net-pci.c | 8 +++++++-
>  2 files changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index 4386f57b5c..979133f8b7 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -39,6 +39,7 @@
>  GlobalProperty hw_compat_5_2[] = {
>      { "ICH9-LPC", "smm-compat", "on"},
>      { "PIIX4_PM", "smm-compat", "on"},
> +    { "virtio-net-pci", "vectors", "3"},
>  };
>  const size_t hw_compat_5_2_len = G_N_ELEMENTS(hw_compat_5_2);
>  
> diff --git a/hw/virtio/virtio-net-pci.c b/hw/virtio/virtio-net-pci.c
> index 292d13d278..2894c46b66 100644
> --- a/hw/virtio/virtio-net-pci.c
> +++ b/hw/virtio/virtio-net-pci.c
> @@ -41,7 +41,8 @@ struct VirtIONetPCI {
>  static Property virtio_net_properties[] = {
>      DEFINE_PROP_BIT("ioeventfd", VirtIOPCIProxy, flags,
>                      VIRTIO_PCI_FLAG_USE_IOEVENTFD_BIT, true),
> -    DEFINE_PROP_UINT32("vectors", VirtIOPCIProxy, nvectors, 3),
> +    DEFINE_PROP_UINT32("vectors", VirtIOPCIProxy, nvectors,
> +                       DEV_NVECTORS_UNSPECIFIED),
>      DEFINE_PROP_END_OF_LIST(),
>  };
>  
> @@ -50,6 +51,11 @@ static void virtio_net_pci_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
>      DeviceState *qdev = DEVICE(vpci_dev);
>      VirtIONetPCI *dev = VIRTIO_NET_PCI(vpci_dev);
>      DeviceState *vdev = DEVICE(&dev->vdev);
> +    VirtIONet *net = VIRTIO_NET(vdev);
> +
> +    if (vpci_dev->nvectors == DEV_NVECTORS_UNSPECIFIED) {
> +        vpci_dev->nvectors = 2 * MAX(net->nic_conf.peers.queues, 1) + 2;

Please either document that magic '2':

           vpci_dev->nvectors = 2 * MAX(net->nic_conf.peers.queues, 1)
                                + 1 /* Config interrupt */
                                + 1 /* Control vq */;

Or add self-explicit definitions and use them in place.

> +    }
>  
>      virtio_net_set_netclient_name(&dev->vdev, qdev->id,
>                                    object_get_typename(OBJECT(qdev)));
> 


