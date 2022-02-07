Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F564ABE33
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 13:09:45 +0100 (CET)
Received: from localhost ([::1]:43010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH2q0-0006e3-Ng
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 07:09:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nH2Ti-0002gd-5Z
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 06:46:42 -0500
Received: from [2607:f8b0:4864:20::22e] (port=36675
 helo=mail-oi1-x22e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nH2Tf-0003rd-MG
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 06:46:41 -0500
Received: by mail-oi1-x22e.google.com with SMTP id s185so16619799oie.3
 for <qemu-devel@nongnu.org>; Mon, 07 Feb 2022 03:46:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=igx+iI0RK2cWa6whAWm+ke3bGrrr3WKp5Jo/prlIPG8=;
 b=JB6f8QuEPKP/ehDiL/ahp/ScTAAmySfP/99lFuw4XweK3tKEcDDiKIXxmGUod3/NbG
 /VjrpjBnL/z9i9E4f5ggjGXOvJEMfwtVP8Le6x/pK099L30IFNwrWBAgc1LviQqWzvEN
 hUK6MzphJSTR9bdJZ2kTB6mGeiaIBmwu8V6Nffuj3RoGx9FVyQ30N5Yqe3ijyKhpLGoc
 aqkqCBEqhNyVFmWkWTfL2bndiID+VbQhJZwAgZgp7/ycfuyBQIK/e28gR/2X5F2G0p6c
 DJlFlZu9qOIQPh7OPTp7S+bQvJztyi4x9CdaKtVUk1tnuTiIWVq3FNpGCzFWSL4ldqOy
 wUmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=igx+iI0RK2cWa6whAWm+ke3bGrrr3WKp5Jo/prlIPG8=;
 b=sB6UCA8NaRObigCjphupc4Xk7p7LfX09OJ0FSo1MdT/Je8pNXDTQSMKoSW1fYmnoDg
 dnnSWtvRDZUQpwD6TGFSb7sZD3d1Sag9OF05U5cs+tny8pKuEfr8CFfgbBoIbMo1BZU6
 DSMRRqbnylnp7HWMhPDjoGn479trWCbXs1NNAsniu8BEK6puugKqE/TmffN4HViBT9pr
 niMQNPdjlsMFhQ7Rp+Ehp8wNTviO/4L7F/p3JYFQFgnGUB2hkhesZMe+cD8LI1mMv+KJ
 iaw+PJwXMdkvlteXYH3aPf1IzH6QsJbJ3sHM/agwslj3ENtCcio89rZwK1OYKGHvvOXi
 vfqQ==
X-Gm-Message-State: AOAM533NpMtMYo3INjTqwRbLm8lfzIJyNFBzQ7RMTYmCrp2ymzj1jQBk
 Yn1x3GQKJwjpX91B4ozfDjM=
X-Google-Smtp-Source: ABdhPJzIaaqB4GxCZix98Ep/SSxidhxFt7tLz5dAH6NtLr7u0zBgZQTFYSWcOiDzG4V8Hy2aO3hzOg==
X-Received: by 2002:a05:6808:221d:: with SMTP id
 bd29mr7263508oib.63.1644234397520; 
 Mon, 07 Feb 2022 03:46:37 -0800 (PST)
Received: from [192.168.10.222] ([191.193.0.12])
 by smtp.gmail.com with ESMTPSA id h9sm3909128otk.42.2022.02.07.03.46.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Feb 2022 03:46:37 -0800 (PST)
Message-ID: <7df172fe-008a-0b98-2780-5155c98a71ba@gmail.com>
Date: Mon, 7 Feb 2022 08:46:34 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFC PATCH 1/1] virtio: fix feature negotiation for
 ACCESS_PLATFORM
Content-Language: en-US
To: Halil Pasic <pasic@linux.ibm.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
 qemu-devel@nongnu.org
References: <20220203164556.2666565-1-pasic@linux.ibm.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220203164556.2666565-1-pasic@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::22e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::22e;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x22e.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Jason Wang <jasowang@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Brijesh Singh <brijesh.singh@amd.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 2/3/22 13:45, Halil Pasic wrote:
> Unlike most virtio features ACCESS_PATFORM is considered mandatory, i.e.
> the driver must accept it if offered by the device. The virtio
> specification says that the driver SHOULD accept the ACCESS_PLATFORM
> feature if offered, and that the device MAY fail to operate if
> ACCESS_PLATFORM was offered but not negotiated.
> 
> While a SHOULD ain't exactly a MUST, we are certainly allowed to fail
> the device when the driver fences ACCESS_PLATFORM. With commit


I believe a link to the virtio specification where this is being mentioned would
be good to have in the commit message.


> 2943b53f68 ("virtio: force VIRTIO_F_IOMMU_PLATFORM") we already made the
> decision to do so whenever the get_dma_as() callback is implemented (by
> the bus), which in practice means for the entirety of virtio-pci.
> 
> That means, if the device needs to translate I/O addresses, then
> ACCESS_PLATFORM is mandatory. The aforementioned commit tells us
> in the commit message that this is for security reasons.
> 
> If ACCESS_PLATFORM is offered not we want the device to utilize an

I think you meant "If ACCESS_PLATFORM is offered".


> IOMMU and do address translation, but because the device does not have
> access to the entire guest RAM, and needs the driver to grant access
> to the bits it needs access to (e.g. confidential guest support), we
> still require the guest to have the corresponding logic and to accept
> ACCESS_PLATFORM. If the driver does not accept ACCESS_PLATFORM, then
> things are bound to go wrong, and we may see failures much less graceful
> than failing the device because the driver didn't negotiate
> ACCESS_PLATFORM.
> 
> So let us make ACCESS_PLATFORM mandatory for the driver regardless
> of whether the get_dma_as() callback is implemented or not.
> 
> Signed-off-by: Halil Pasic <pasic@linux.ibm.com>
> Fixes: 2943b53f68 ("virtio: force VIRTIO_F_IOMMU_PLATFORM")
> 
> ---
> This patch is based on:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg866199.html
> 
> During the review of "virtio: fix the condition for iommu_platform not
> supported" Daniel raised the question why do we "force IOMMU_PLATFORM"
> iff has_iommu && !!klass->get_dma_as. My answer to that was, that
> this logic ain't right.
> 
> While at it I used the opportunity to re-organize the code a little
> and provide an explanatory comment.
> ---
>   hw/virtio/virtio-bus.c | 17 ++++++++++-------
>   1 file changed, 10 insertions(+), 7 deletions(-)
> 
> diff --git a/hw/virtio/virtio-bus.c b/hw/virtio/virtio-bus.c
> index fbf0dd14b8..359430eb1c 100644
> --- a/hw/virtio/virtio-bus.c
> +++ b/hw/virtio/virtio-bus.c
> @@ -78,16 +78,19 @@ void virtio_bus_device_plugged(VirtIODevice *vdev, Error **errp)
>           return;
>       }
>   
> -    vdev_has_iommu = virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM);
> -    if (klass->get_dma_as != NULL && has_iommu) {
> +    vdev->dma_as = &address_space_memory;

At this point you can also do:

    if (!has_iommu) {
        return;
    }

and the rest of the code will have one less indentation level.


Thanks,


Daniel



> +    if (has_iommu) {
> +        vdev_has_iommu = virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM);
> +        /* Fail FEATURE_OK if the device tries to drop IOMMU_PLATFORM */
>           virtio_add_feature(&vdev->host_features, VIRTIO_F_IOMMU_PLATFORM);
> -        vdev->dma_as = klass->get_dma_as(qbus->parent);
> -        if (!vdev_has_iommu && vdev->dma_as != &address_space_memory) {
> -            error_setg(errp,
> +        if (klass->get_dma_as) {
> +            vdev->dma_as = klass->get_dma_as(qbus->parent);
> +            if (!vdev_has_iommu && vdev->dma_as != &address_space_memory) {
> +                error_setg(errp,
>                          "iommu_platform=true is not supported by the device");
> +                return;
> +            }
>           }
> -    } else {
> -        vdev->dma_as = &address_space_memory;
>       }
>   }
>   
> 
> base-commit: da89f242b4b774a25eaa16be125cf3e17299c127

