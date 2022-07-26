Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C8C0580A04
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 05:34:21 +0200 (CEST)
Received: from localhost ([::1]:54326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGBKt-0007L4-TS
	for lists+qemu-devel@lfdr.de; Mon, 25 Jul 2022 23:34:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oGBIr-0005jM-6C
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 23:32:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40622)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oGBIn-000852-DD
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 23:32:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658806328;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0yWfDtlI5eoEJamqGTv31OwQny5fGqZxrOIlPsv/Vvg=;
 b=G+sxKeBdTGFQM3ZDIcy+vdccn+8my+AMp1460JDZtZUmMlflgdryL37ece27bBk+P86LzE
 LAMoztJ46Zyi+rDZNv9WTz+ye6cWCnTHT9V5h33mTmM8OmM6AW/uwxONqoD00oJc9tJulc
 hfC3wx1pRm+LyO5OJcRyt+4FHroGh7M=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-79-i7Oh9sw5OI-CQCVS2Bm1Dw-1; Mon, 25 Jul 2022 23:32:06 -0400
X-MC-Unique: i7Oh9sw5OI-CQCVS2Bm1Dw-1
Received: by mail-pl1-f199.google.com with SMTP id
 n15-20020a170902d2cf00b0016d68b4fcc0so3494786plc.8
 for <qemu-devel@nongnu.org>; Mon, 25 Jul 2022 20:32:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=0yWfDtlI5eoEJamqGTv31OwQny5fGqZxrOIlPsv/Vvg=;
 b=JoBeRuKGwdz0sMPlXQfUketeDM+jEqjbQ/heruAGrOI2Z5GVeTAEHhbCJrQRaiOaD2
 guTXxsFkbJRVegv7xiMNw/Rndufjc3eYURb2ANebMwPIGo3fnGuy2Ba88RyH5d+92Xfn
 Ofud1HNuIe3/tOSjFr9RjLcPlXssNZ1b5TB7DHKTE61+4zRRbCEMjPitSUfHAxej1n46
 Y2bol2EQS6k4DxNMk/+d2iiiafV8JTSUn+c8fBmaD8XugDnt3uPJt2jmuAzmxAEebWxI
 C7v1NMQP7Gr2M2YVBIO6lrQsqoa76ES7EtxLVPLULWCCvH4DjqphilAC6zfmSQ/AxCMx
 kdmA==
X-Gm-Message-State: AJIora9UksfDasGUQsVotW5GKsqfphuMFyRBwCZPEO8eVlkUbDjNj+KN
 oTd1Hcbi5YK0NoJUwy63EM1FTkWtXV/Inle5WQpkb0I9ECPwUPsf0CAbIhvA7LrAg5Vu3xOg+EL
 JrkKGNgLU6NXCPP8=
X-Received: by 2002:a17:90a:5998:b0:1f2:1c38:7f64 with SMTP id
 l24-20020a17090a599800b001f21c387f64mr32830396pji.16.1658806325577; 
 Mon, 25 Jul 2022 20:32:05 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1v05DIemBBZsPI00ilI2jEUUUurwFEOzSCqkIZQjWhfYYeWUbT9oCtZ/rHhM6T6Z8eNU/FsMw==
X-Received: by 2002:a17:90a:5998:b0:1f2:1c38:7f64 with SMTP id
 l24-20020a17090a599800b001f21c387f64mr32830378pji.16.1658806325202; 
 Mon, 25 Jul 2022 20:32:05 -0700 (PDT)
Received: from [10.72.12.201] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 e5-20020a17090a7c4500b001f001acc0e2sm11954101pjl.41.2022.07.25.20.32.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Jul 2022 20:32:04 -0700 (PDT)
Message-ID: <9ee782bb-494a-367e-6b06-261a8ae920db@redhat.com>
Date: Tue, 26 Jul 2022 11:31:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH 06/16] virtio-pci: support queue reset
Content-Language: en-US
To: Kangjie Xu <kangjie.xu@linux.alibaba.com>, qemu-devel@nongnu.org
Cc: mst@redhat.com, hengqi@linux.alibaba.com, xuanzhuo@linux.alibaba.com
References: <cover.1658141552.git.kangjie.xu@linux.alibaba.com>
 <e354b6aea06652e934f1dfef5ddc89c64857adb2.1658141552.git.kangjie.xu@linux.alibaba.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <e354b6aea06652e934f1dfef5ddc89c64857adb2.1658141552.git.kangjie.xu@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


在 2022/7/18 19:17, Kangjie Xu 写道:
> From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
>
> PCI devices support vq reset.
>
> Based on this function, the driver can adjust the size of the ring, and
> quickly recycle the buffer in the ring.
>
> Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> ---
>   hw/virtio/virtio-pci.c         | 16 ++++++++++++++++
>   include/hw/virtio/virtio-pci.h |  1 +
>   2 files changed, 17 insertions(+)
>
> diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
> index 45327f0b31..35e8a5101a 100644
> --- a/hw/virtio/virtio-pci.c
> +++ b/hw/virtio/virtio-pci.c
> @@ -1246,6 +1246,9 @@ static uint64_t virtio_pci_common_read(void *opaque, hwaddr addr,
>       case VIRTIO_PCI_COMMON_Q_USEDHI:
>           val = proxy->vqs[vdev->queue_sel].used[1];
>           break;
> +    case VIRTIO_PCI_COMMON_Q_RESET:
> +        val = proxy->vqs[vdev->queue_sel].reset;
> +        break;
>       default:
>           val = 0;
>       }
> @@ -1333,6 +1336,7 @@ static void virtio_pci_common_write(void *opaque, hwaddr addr,
>                          ((uint64_t)proxy->vqs[vdev->queue_sel].used[1]) << 32 |
>                          proxy->vqs[vdev->queue_sel].used[0]);
>               proxy->vqs[vdev->queue_sel].enabled = 1;
> +            proxy->vqs[vdev->queue_sel].reset = 0;
>           } else {
>               virtio_error(vdev, "wrong value for queue_enable %"PRIx64, val);
>           }
> @@ -1355,6 +1359,17 @@ static void virtio_pci_common_write(void *opaque, hwaddr addr,
>       case VIRTIO_PCI_COMMON_Q_USEDHI:
>           proxy->vqs[vdev->queue_sel].used[1] = val;
>           break;
> +    case VIRTIO_PCI_COMMON_Q_RESET:
> +        if (val == 1) {
> +            proxy->vqs[vdev->queue_sel].reset = 1;
> +
> +            virtio_queue_reset(vdev, vdev->queue_sel);
> +
> +            /* mark reset complete */


The code explain itself, so the comment could be removed.


> +            proxy->vqs[vdev->queue_sel].reset = 0;
> +            proxy->vqs[vdev->queue_sel].enabled = 0;
> +        }
> +        break;
>       default:
>           break;
>       }
> @@ -1950,6 +1965,7 @@ static void virtio_pci_reset(DeviceState *qdev)
>   
>       for (i = 0; i < VIRTIO_QUEUE_MAX; i++) {
>           proxy->vqs[i].enabled = 0;
> +        proxy->vqs[i].reset = 0;
>           proxy->vqs[i].num = 0;
>           proxy->vqs[i].desc[0] = proxy->vqs[i].desc[1] = 0;
>           proxy->vqs[i].avail[0] = proxy->vqs[i].avail[1] = 0;
> diff --git a/include/hw/virtio/virtio-pci.h b/include/hw/virtio/virtio-pci.h
> index 2446dcd9ae..e9290e2b94 100644
> --- a/include/hw/virtio/virtio-pci.h
> +++ b/include/hw/virtio/virtio-pci.h
> @@ -117,6 +117,7 @@ typedef struct VirtIOPCIRegion {
>   typedef struct VirtIOPCIQueue {
>     uint16_t num;
>     bool enabled;
> +  bool reset;


How is this migrated?

Thanks


>     uint32_t desc[2];
>     uint32_t avail[2];
>     uint32_t used[2];


