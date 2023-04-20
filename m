Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BF3B6E8E06
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 11:25:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppQXr-0003TO-0d; Thu, 20 Apr 2023 05:25:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ppQXo-0003LM-JG
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 05:25:36 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ppQXm-0008TP-MM
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 05:25:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9Rp4pXqrqBxqrjyT8Er3156X38qoB0KtAgmbhPvuofE=; b=J35jEi9v9XhkDbV0xVPG/J8bjx
 6XWNt7xZaVS1l9KRwa9ZzjlfbD5SiSPdTM9lAoRSgekc0DetN2tu43UTg3hNf4PhQLeh2X3aTgyzv
 eAJ8KfDfdeiplXD9dhQIB6cLHaqC6Y353n8G2aNRzsIF/hAPX60u9EuMiFSXPCa8FrIGuwT6nduSm
 7Gr7yfM6PcNUvN7oYjhPuUwOx/KFYoS6Lcn8pme7i3kyEGSJvao9WyxV1QGOgvTcRx51DQ0HjiANz
 iUi8WP+ek7gdHB+PFgLhRRiq2aznM7uWlZhS7p+3M+qAx3NWZPaO1OCPsEeefCJUMXExVNgwe8HTI
 x4VFEztO7SbZs6EEzCUECEjv5obtoJd8U3770qc+JDTyuRgpwZvREhyczoiBAThypZ/NqcRzSqbWm
 CWp2VYn3uyzek9HHYbP6+d1D4BWMd9OaappH471ypB9ampndNKg51VAZLqrkNNXaSut4ViY/oScdQ
 I/HuZNlk1SNWDEfuPplR6H0deNF/Mce+2Qw1w43dlLb7TJKWqBcnu9TH2jJKl7QUIrVQs5ubHgg2J
 kAXHYQeLhfLjUOlJvPoh4IU60Qvk+6pLpY1mTLNFSu1JXgpfmwAcewRZbXpIaIj9S/yTzWcYEzywI
 Vqkg8G9IMZdACkEwXSLgZOp5BA3NNd8+7hBVRF5Vk=;
Received: from host81-151-114-25.range81-151.btcentralplus.com
 ([81.151.114.25] helo=[10.8.0.6])
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ppQWo-0009qT-PJ; Thu, 20 Apr 2023 10:24:38 +0100
Message-ID: <55bf17e5-9875-f193-e1d7-ee688333bc78@ilande.co.uk>
Date: Thu, 20 Apr 2023 10:25:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Viresh Kumar
 <viresh.kumar@linaro.org>, Mathieu Poirier <mathieu.poirier@linaro.org>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Markus Armbruster <armbru@redhat.com>,
 Erik Schilling <erik.schilling@linaro.org>, Jason Wang
 <jasowang@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 virtio-fs@redhat.com, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Eric Blake <eblake@redhat.com>
References: <20230418162140.373219-1-alex.bennee@linaro.org>
 <20230418162140.373219-4-alex.bennee@linaro.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20230418162140.373219-4-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 81.151.114.25
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v2 03/13] hw/virtio: fix typo in VIRTIO_CONFIG_IRQ_IDX
 comments
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.597,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 18/04/2023 17:21, Alex Bennée wrote:

> Fixes: 544f0278af (virtio: introduce macro VIRTIO_CONFIG_IRQ_IDX)
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   hw/display/vhost-user-gpu.c    | 4 ++--
>   hw/net/virtio-net.c            | 4 ++--
>   hw/virtio/vhost-user-fs.c      | 4 ++--
>   hw/virtio/vhost-user-gpio.c    | 2 +-
>   hw/virtio/vhost-vsock-common.c | 4 ++--
>   hw/virtio/virtio-crypto.c      | 4 ++--
>   6 files changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/hw/display/vhost-user-gpu.c b/hw/display/vhost-user-gpu.c
> index 71dfd956b8..7c61a7c3ac 100644
> --- a/hw/display/vhost-user-gpu.c
> +++ b/hw/display/vhost-user-gpu.c
> @@ -489,7 +489,7 @@ vhost_user_gpu_guest_notifier_pending(VirtIODevice *vdev, int idx)
>   
>       /*
>        * Add the check for configure interrupt, Use VIRTIO_CONFIG_IRQ_IDX -1
> -     * as the Marco of configure interrupt's IDX, If this driver does not
> +     * as the macro of configure interrupt's IDX, If this driver does not
>        * support, the function will return
>        */
>   
> @@ -506,7 +506,7 @@ vhost_user_gpu_guest_notifier_mask(VirtIODevice *vdev, int idx, bool mask)
>   
>       /*
>        * Add the check for configure interrupt, Use VIRTIO_CONFIG_IRQ_IDX -1
> -     * as the Marco of configure interrupt's IDX, If this driver does not
> +     * as the macro of configure interrupt's IDX, If this driver does not
>        * support, the function will return
>        */
>   
> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> index 53e1c32643..c53616a080 100644
> --- a/hw/net/virtio-net.c
> +++ b/hw/net/virtio-net.c
> @@ -3359,7 +3359,7 @@ static bool virtio_net_guest_notifier_pending(VirtIODevice *vdev, int idx)
>       }
>       /*
>        * Add the check for configure interrupt, Use VIRTIO_CONFIG_IRQ_IDX -1
> -     * as the Marco of configure interrupt's IDX, If this driver does not
> +     * as the macro of configure interrupt's IDX, If this driver does not
>        * support, the function will return false
>        */
>   
> @@ -3391,7 +3391,7 @@ static void virtio_net_guest_notifier_mask(VirtIODevice *vdev, int idx,
>       }
>       /*
>        *Add the check for configure interrupt, Use VIRTIO_CONFIG_IRQ_IDX -1
> -     * as the Marco of configure interrupt's IDX, If this driver does not
> +     * as the macro of configure interrupt's IDX, If this driver does not
>        * support, the function will return
>        */
>   
> diff --git a/hw/virtio/vhost-user-fs.c b/hw/virtio/vhost-user-fs.c
> index 83fc20e49e..49d699ffc2 100644
> --- a/hw/virtio/vhost-user-fs.c
> +++ b/hw/virtio/vhost-user-fs.c
> @@ -161,7 +161,7 @@ static void vuf_guest_notifier_mask(VirtIODevice *vdev, int idx,
>   
>       /*
>        * Add the check for configure interrupt, Use VIRTIO_CONFIG_IRQ_IDX -1
> -     * as the Marco of configure interrupt's IDX, If this driver does not
> +     * as the macro of configure interrupt's IDX, If this driver does not
>        * support, the function will return
>        */
>   
> @@ -177,7 +177,7 @@ static bool vuf_guest_notifier_pending(VirtIODevice *vdev, int idx)
>   
>       /*
>        * Add the check for configure interrupt, Use VIRTIO_CONFIG_IRQ_IDX -1
> -     * as the Marco of configure interrupt's IDX, If this driver does not
> +     * as the macro of configure interrupt's IDX, If this driver does not
>        * support, the function will return
>        */
>   
> diff --git a/hw/virtio/vhost-user-gpio.c b/hw/virtio/vhost-user-gpio.c
> index d6927b610a..3b013f2d0f 100644
> --- a/hw/virtio/vhost-user-gpio.c
> +++ b/hw/virtio/vhost-user-gpio.c
> @@ -194,7 +194,7 @@ static void vu_gpio_guest_notifier_mask(VirtIODevice *vdev, int idx, bool mask)
>   
>       /*
>        * Add the check for configure interrupt, Use VIRTIO_CONFIG_IRQ_IDX -1
> -     * as the Marco of configure interrupt's IDX, If this driver does not
> +     * as the macro of configure interrupt's IDX, If this driver does not
>        * support, the function will return
>        */
>   
> diff --git a/hw/virtio/vhost-vsock-common.c b/hw/virtio/vhost-vsock-common.c
> index d2b5519d5a..623bdf91cc 100644
> --- a/hw/virtio/vhost-vsock-common.c
> +++ b/hw/virtio/vhost-vsock-common.c
> @@ -129,7 +129,7 @@ static void vhost_vsock_common_guest_notifier_mask(VirtIODevice *vdev, int idx,
>   
>       /*
>        * Add the check for configure interrupt, Use VIRTIO_CONFIG_IRQ_IDX -1
> -     * as the Marco of configure interrupt's IDX, If this driver does not
> +     * as the macro of configure interrupt's IDX, If this driver does not
>        * support, the function will return
>        */
>   
> @@ -146,7 +146,7 @@ static bool vhost_vsock_common_guest_notifier_pending(VirtIODevice *vdev,
>   
>       /*
>        * Add the check for configure interrupt, Use VIRTIO_CONFIG_IRQ_IDX -1
> -     * as the Marco of configure interrupt's IDX, If this driver does not
> +     * as the macro of configure interrupt's IDX, If this driver does not
>        * support, the function will return
>        */
>   
> diff --git a/hw/virtio/virtio-crypto.c b/hw/virtio/virtio-crypto.c
> index 802e1b9659..6b3e607329 100644
> --- a/hw/virtio/virtio-crypto.c
> +++ b/hw/virtio/virtio-crypto.c
> @@ -1208,7 +1208,7 @@ static void virtio_crypto_guest_notifier_mask(VirtIODevice *vdev, int idx,
>   
>       /*
>        * Add the check for configure interrupt, Use VIRTIO_CONFIG_IRQ_IDX -1
> -     * as the Marco of configure interrupt's IDX, If this driver does not
> +     * as the macro of configure interrupt's IDX, If this driver does not
>        * support, the function will return
>        */
>   
> @@ -1227,7 +1227,7 @@ static bool virtio_crypto_guest_notifier_pending(VirtIODevice *vdev, int idx)
>   
>       /*
>        * Add the check for configure interrupt, Use VIRTIO_CONFIG_IRQ_IDX -1
> -     * as the Marco of configure interrupt's IDX, If this driver does not
> +     * as the macro of configure interrupt's IDX, If this driver does not
>        * support, the function will return
>        */

Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


ATB,

Mark.

