Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB69E643F57
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Dec 2022 10:08:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2TvD-0000wG-HD; Tue, 06 Dec 2022 04:07:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p2Tv5-0000qb-Hn
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 04:07:22 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p2Tus-0005bi-1I
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 04:07:18 -0500
Received: by mail-wr1-x434.google.com with SMTP id bx10so22573565wrb.0
 for <qemu-devel@nongnu.org>; Tue, 06 Dec 2022 01:07:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4kYtFcVG2jDkw1dZw5wxmPWQqYCo6bvjrc91qV9QfEc=;
 b=pTcZfCDosDEyVTRUDyoF6wJdhGJvbB9qAUc0AoGuKq4IiWo3G4spe1G4ll4hVN1t7r
 5tId+lq8VYN6gV5aZW++8mrPjl9hO632OylRfHev87ursWI5SS12lUsCtjcR03ft+TQF
 0dX7e7W8JePzYgikMMyVnuDUm4SJ7f9lN9u34JbcLUW6LN9fv98J6Kd0sapf/c4qSL87
 4S+/4A6b1dSJKEKNQplwj8nn5axvlCF65jpFzp0gG0tFMDlbcF1Q+qtBOjoMVg1HtYiC
 d5NcT4sxcFdF+Y0Ydx49wZo8xlFkKdiDW77ybg2oYL06Z+s27c6qntJ5MUbEzwSMZscR
 7+cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4kYtFcVG2jDkw1dZw5wxmPWQqYCo6bvjrc91qV9QfEc=;
 b=N0bH3E/7Ic3dyQuZDggkx5HiRj7elokA0D6THoGkulkh8v/Lrj3Ut4if98NriObp4T
 XO2hVzATQqs0JIhCInBluI4mQKOAYJyLmQcb1R2YcFXa4HYgiPDvpGlcimjA8k/rt5if
 AVVHtHtMNWzQomZeQMGAVXK/879MYG/KZ3iix1Rf/zy3IvkT4yb7liXQRxMKullD8A5Z
 6DVVE2fi5iweZsg3QgrDZO1DHHbKD7ny608YUCW7eluU4e77QIZhiJlF9sdkfJa2S9GT
 QyZqdDbCS3ZhqqclRPlh/JWYrv6EDI7nhjuwckEwovMZ8HzJDTqIoO8YPPdJ4IPsQUky
 D4Mw==
X-Gm-Message-State: ANoB5pkFISbX9yYHIOo1gGmGTRV78jmJbXXYx9fPCHv/G+3loq9pYTts
 YCQwdTCilMyFx4uYtqPeIx/33A==
X-Google-Smtp-Source: AA0mqf5FA5lBQ7rjvEFov4Po8gmLdFRQCdggIxJU0FYoxwYa2a3s6vzcErd4u6WLOpFf/cAbH+4w1Q==
X-Received: by 2002:a05:6000:128c:b0:236:e512:1a9e with SMTP id
 f12-20020a056000128c00b00236e5121a9emr43715672wrx.416.1670317624219; 
 Tue, 06 Dec 2022 01:07:04 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 hg6-20020a05600c538600b003a6125562e1sm20311621wmb.46.2022.12.06.01.07.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Dec 2022 01:07:03 -0800 (PST)
Message-ID: <ee85dd7e-7ec0-03f2-ba17-c8e2987f200c@linaro.org>
Date: Tue, 6 Dec 2022 10:07:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH v2 1/2] vhost: configure all host notifiers in a single MR
 transaction
Content-Language: en-US
To: "Longpeng(Mike)" <longpeng2@huawei.com>, stefanha@redhat.com,
 mst@redhat.com, jasowang@redhat.com, sgarzare@redhat.com
Cc: cohuck@redhat.com, pbonzini@redhat.com, arei.gonglei@huawei.com,
 yechuan@huawei.com, huangzhichao@huawei.com, qemu-devel@nongnu.org
References: <20221206081841.2458-1-longpeng2@huawei.com>
 <20221206081841.2458-2-longpeng2@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221206081841.2458-2-longpeng2@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.265,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 6/12/22 09:18, Longpeng(Mike) via wrote:
> From: Longpeng <longpeng2@huawei.com>
> 
> This allows the vhost device to batch the setup of all its host notifiers.
> This significantly reduces the device starting time, e.g. the time spend
> on enabling notifiers reduce from 376ms to 9.1ms for a VM with 64 vCPUs
> and 3 vhost-vDPA generic devices[1] (64vq per device)
> 
> [1] https://www.mail-archive.com/qemu-devel@nongnu.org/msg921541.html
> 
> Signed-off-by: Longpeng <longpeng2@huawei.com>
> ---
>   hw/virtio/vhost.c | 40 ++++++++++++++++++++++++++++++++++++++--
>   1 file changed, 38 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
> index 7fb008bc9e..16f8391d86 100644
> --- a/hw/virtio/vhost.c
> +++ b/hw/virtio/vhost.c
> @@ -1507,7 +1507,7 @@ void vhost_dev_cleanup(struct vhost_dev *hdev)
>   int vhost_dev_enable_notifiers(struct vhost_dev *hdev, VirtIODevice *vdev)
>   {
>       BusState *qbus = BUS(qdev_get_parent_bus(DEVICE(vdev)));
> -    int i, r, e;
> +    int i, n, r, e;
>   
>       /* We will pass the notifiers to the kernel, make sure that QEMU
>        * doesn't interfere.
> @@ -1518,6 +1518,12 @@ int vhost_dev_enable_notifiers(struct vhost_dev *hdev, VirtIODevice *vdev)
>           goto fail;
>       }
>   
> +    /*
> +     * Batch all the host notifiers in a single transaction to avoid
> +     * quadratic time complexity in address_space_update_ioeventfds().
> +     */
> +    memory_region_transaction_begin();
> +
>       for (i = 0; i < hdev->nvqs; ++i) {
>           r = virtio_bus_set_host_notifier(VIRTIO_BUS(qbus), hdev->vq_index + i,
>                                            true);
> @@ -1527,8 +1533,12 @@ int vhost_dev_enable_notifiers(struct vhost_dev *hdev, VirtIODevice *vdev)
>           }
>       }
>   
> +    memory_region_transaction_commit();
> +
>       return 0;
>   fail_vq:
> +    /* save i for a second iteration after transaction is committed. */
> +    n = i;
>       while (--i >= 0) {
>           e = virtio_bus_set_host_notifier(VIRTIO_BUS(qbus), hdev->vq_index + i,
>                                            false);
> @@ -1536,8 +1546,18 @@ fail_vq:
>               error_report("vhost VQ %d notifier cleanup error: %d", i, -r);
>           }
>           assert (e >= 0);
> -        virtio_bus_cleanup_host_notifier(VIRTIO_BUS(qbus), hdev->vq_index + i);
>       }
> +
> +    /*
> +     * The transaction expects the ioeventfds to be open when it
> +     * commits. Do it now, before the cleanup loop.
> +     */
> +    memory_region_transaction_commit();
> +
> +    while (--n >= 0) {
> +        virtio_bus_cleanup_host_notifier(VIRTIO_BUS(qbus), hdev->vq_index + n);
> +    }
> +
>       virtio_device_release_ioeventfd(vdev);
>   fail:
>       return r;

Similarly to patch #2, removing both goto statement in this function (as 
a preliminary patch) will 1/ simplify the code 2/ simplify reviewing 
your changes, resulting in something like:

int vhost_dev_enable_notifiers(struct vhost_dev *hdev,
                                VirtIODevice *vdev)
{
     BusState *qbus = BUS(qdev_get_parent_bus(DEVICE(vdev)));
     int i, r, e;

     /* We will pass the notifiers to the kernel, make sure that QEMU
      * doesn't interfere.
      */
     r = virtio_device_grab_ioeventfd(vdev);
     if (r < 0) {
         error_report("binding does not support host notifiers");
         return r;
     }

     memory_region_transaction_begin();

     for (i = 0; i < hdev->nvqs; ++i) {
         r = virtio_bus_set_host_notifier(VIRTIO_BUS(qbus),
                                          hdev->vq_index + i,
                                          true);
         if (r < 0) {
             error_report("vhost VQ %d notifier binding failed: %d",
                          i, -r);
             while (--i >= 0) {
                 e = virtio_bus_set_host_notifier(VIRTIO_BUS(qbus),
                                                  hdev->vq_index + i,
                                                  false);
                 if (e < 0) {
                     error_report(
                                "vhost VQ %d notifier cleanup error: %d",
                                  i, -r);
                 }
                 assert (e >= 0);
                 virtio_bus_cleanup_host_notifier(VIRTIO_BUS(qbus),
                                                  hdev->vq_index + i);
             }
             virtio_device_release_ioeventfd(vdev);
             break;
         }
     }

     memory_region_transaction_commit();

     return r;
}

What do you think?

Regards,

Phil.

