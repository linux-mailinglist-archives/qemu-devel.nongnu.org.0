Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C12AF6E8E0E
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 11:28:24 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppQaE-0005IC-TL; Thu, 20 Apr 2023 05:28:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ppQaC-0005I2-Kt
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 05:28:04 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ppQaB-0000Tf-3P
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 05:28:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VdToYCRQRWV2q04RDuIVArscNYAnaceS+1AH0D4hEgE=; b=dtURD7rfMPjaVx271BFe3NcHrz
 TLomN1ac/3V2Mh3V8G4Tvru9FfoJbVwLJUOOMKdoMZqVckDcbbwS1d8VQ7bjFVWd3llzM8FIdOntM
 OdOIXnSYSj6IzO61adI8W9uYzXOcpB7gII/0Yfbugib61epbBoP7IC5FU89VEXYte0IPtFCplFc9V
 gaACoxdW2IeVSL7tyw2gpaSAOuTTY/N1gHGFx/Ip80F7lRzRteBIT4ZK6OAbwl42nQGsuGsfNmlpO
 Tsux96h94VFA+VYf/h/2yhRTczh42zXrd7aMyJ1yERw+OkL4pfJopo6vyJEdta48tfemtACI4xMzO
 Sac3ijbbWEPv5sFhUtQMKXRXSmoNhZhR+RN5697Hkl8zMUB5995zLP+Waa657U2vQ7ClDv+FjgAxS
 qBAlcujNJnlBfPJhwm02zqyBk61oxQcGHg159kr/hyegzX8A1CMy1Q24WNN0GvEAr5DpThQZ68MyD
 viuMWvU/E7yGJzxzwUJ+QBVF9hiyPcKLM8Yv4Xe1HD+ZkBCJb8B2UyZ6/2YeHUR1RIVoGIN91YCqk
 yKvt0hsuOQVHqxV7J11+7RIlOU3PyI6OrAmdDebcGhZgYrKP+tDjNfhZqAfGuOHcBbFLhTV+vVxBE
 njwW3wJjFvc62WDvxpq2T2LiXGR82Gt82bWCnRaZA=;
Received: from host81-151-114-25.range81-151.btcentralplus.com
 ([81.151.114.25] helo=[10.8.0.6])
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ppQZF-0009sk-PM; Thu, 20 Apr 2023 10:27:09 +0100
Message-ID: <3f9c31ae-5434-0d93-7f01-fe483491e58d@ilande.co.uk>
Date: Thu, 20 Apr 2023 10:27:55 +0100
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
 <20230418162140.373219-5-alex.bennee@linaro.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20230418162140.373219-5-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 81.151.114.25
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v2 04/13] include/hw/virtio: document virtio_notify_config
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

> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   include/hw/virtio/virtio.h | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
> index f236e94ca6..22ec098462 100644
> --- a/include/hw/virtio/virtio.h
> +++ b/include/hw/virtio/virtio.h
> @@ -274,6 +274,13 @@ extern const VMStateInfo virtio_vmstate_info;
>   
>   int virtio_load(VirtIODevice *vdev, QEMUFile *f, int version_id);
>   
> +/**
> + * virtio_notify_config() - signal a change to device config
> + * @vdev: the virtio device
> + *
> + * Assuming the virtio device is up (VIRTIO_CONFIG_S_DRIVER_OK) this
> + * will trigger a guest interrupt and update the config version.
> + */
>   void virtio_notify_config(VirtIODevice *vdev);
>   
>   bool virtio_queue_get_notification(VirtQueue *vq);

I can't 100% vouch for the correctness of the description, however it makes sense to 
me so:

Acked-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


ATB,

Mark.

