Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB2495F4859
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 19:26:51 +0200 (CEST)
Received: from localhost ([::1]:39088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oflgw-0006O8-VP
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 13:26:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1oflOV-0004ea-7f
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 13:07:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58665)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1oflOR-0007RY-Ej
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 13:07:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664903259;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6aFaI0Jgy3iVtTcT3TzSVOGZHPhwhDG6hQSorrSfY4k=;
 b=jWD8xl+5pEnw+vh413qEW7NgyMQw9YOeZRyvbrVAsi/bJVC57uSlXj5+B/CLaICopvatGO
 yoGID73FNQ0u1rnm3b7z+WPh1NOmD0hT7+KPwTQLvQSxMTDEOny+aCmnI5HA817wgMRFGJ
 CM2cj/h6kWlE86nAILaTrAjpNm45d0A=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-377-ycX8FB6zP2uo35pkvuBaIw-1; Tue, 04 Oct 2022 13:07:36 -0400
X-MC-Unique: ycX8FB6zP2uo35pkvuBaIw-1
Received: by mail-wr1-f70.google.com with SMTP id
 k30-20020adfb35e000000b0022e04708c18so3081684wrd.22
 for <qemu-devel@nongnu.org>; Tue, 04 Oct 2022 10:07:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date;
 bh=6aFaI0Jgy3iVtTcT3TzSVOGZHPhwhDG6hQSorrSfY4k=;
 b=R8AApCLcF7NNggTR/beg0PdGm2TCh5LwkxPnaoEBcKCFOJ7sCb+Vw/1JLr1l+9V5Pt
 hCGVyzWUj8o9M8sAjwt43Vi58vGQP60cQlyqyyN52Xpyc4zwWdsI6OSsQ3bGcOJ7eIS3
 7Gibq3OmcbFav94KVihp8yd5o+mLCAgH5WqKAhcfvx7ihl8NQrfQVk7F7ADgJ5vonr6C
 z0umOl8hpF9YrEWHaVIY6tReg3Ou7YdR/SpeM8dA6PPJtB80X9d3ZAnOBgv0E5qaH7wO
 OSb5Eoqng9UfjyA/RN2EJXiVMEMxUEWjkLN2tA53NgquJD/J6ut8rbCfwIDYnCt7vGBD
 4jdA==
X-Gm-Message-State: ACrzQf13E4BOkFFUl91Z7DEGNLQQcSkEEhK12SmT6IK+L8VW92OcWjEU
 VylOOn7yYObMwwU1fAjmODgx3lQi3nGGfnfw7OvIf86X45fXtgCKP9hJm4LzrlVYCl/T71AI3Ba
 weeF9YzOd9gTOqcQ=
X-Received: by 2002:adf:cf0a:0:b0:22e:3f43:a5f7 with SMTP id
 o10-20020adfcf0a000000b0022e3f43a5f7mr5999075wrj.634.1664903255424; 
 Tue, 04 Oct 2022 10:07:35 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4P6UlASiSLqJ6D3ynJCodzlvVDUbi3JE9+TuRJ061K2aMCosoRDz46DR4VEruySPrbwZvf+w==
X-Received: by 2002:adf:cf0a:0:b0:22e:3f43:a5f7 with SMTP id
 o10-20020adfcf0a000000b0022e3f43a5f7mr5999058wrj.634.1664903255127; 
 Tue, 04 Oct 2022 10:07:35 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 k5-20020adff5c5000000b0022afbd02c69sm10953478wrp.56.2022.10.04.10.07.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Oct 2022 10:07:34 -0700 (PDT)
Message-ID: <47ef4d34-cb5b-259b-6aae-bc25bbeae3ce@redhat.com>
Date: Tue, 4 Oct 2022 19:07:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 5/5] pci-ids: document modern virtio-pci ids in pci.h
 too
Content-Language: en-US
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, David Hildenbrand <david@redhat.com>,
 peter.maydell@linaro.org
References: <20221004112100.301935-1-kraxel@redhat.com>
 <20221004112100.301935-6-kraxel@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20221004112100.301935-6-kraxel@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.449, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Gerd,

On 10/4/22 13:21, Gerd Hoffmann wrote:
> While being at it add a #define for the magic 0x1040 number.
>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric
> ---
>  include/hw/pci/pci.h   | 10 ++++++++++
>  hw/virtio/virtio-pci.c |  2 +-
>  2 files changed, 11 insertions(+), 1 deletion(-)
>
> diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
> index 42c83cb5ed00..d1ac308574f1 100644
> --- a/include/hw/pci/pci.h
> +++ b/include/hw/pci/pci.h
> @@ -76,6 +76,7 @@ extern bool pci_available;
>  #define PCI_SUBVENDOR_ID_REDHAT_QUMRANET 0x1af4
>  #define PCI_SUBDEVICE_ID_QEMU            0x1100
>  
> +/* legacy virtio-pci devices */
>  #define PCI_DEVICE_ID_VIRTIO_NET         0x1000
>  #define PCI_DEVICE_ID_VIRTIO_BLOCK       0x1001
>  #define PCI_DEVICE_ID_VIRTIO_BALLOON     0x1002
> @@ -85,6 +86,15 @@ extern bool pci_available;
>  #define PCI_DEVICE_ID_VIRTIO_9P          0x1009
>  #define PCI_DEVICE_ID_VIRTIO_VSOCK       0x1012
>  
> +/*
> + * modern virtio-pci devices get their id assigned automatically,
> + * there is no need to add #defines here.  It gets calculated as
> + *
> + * PCI_DEVICE_ID = PCI_DEVICE_ID_VIRTIO_10_BASE +
> + *                 virtio_bus_get_vdev_id(bus)
> + */
> +#define PCI_DEVICE_ID_VIRTIO_10_BASE     0x1040
> +
>  #define PCI_VENDOR_ID_REDHAT             0x1b36
>  #define PCI_DEVICE_ID_REDHAT_BRIDGE      0x0001
>  #define PCI_DEVICE_ID_REDHAT_SERIAL      0x0002
> diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
> index a50c5a57d7e5..e7d80242b73f 100644
> --- a/hw/virtio/virtio-pci.c
> +++ b/hw/virtio/virtio-pci.c
> @@ -1688,7 +1688,7 @@ static void virtio_pci_device_plugged(DeviceState *d, Error **errp)
>          pci_set_word(config + PCI_VENDOR_ID,
>                       PCI_VENDOR_ID_REDHAT_QUMRANET);
>          pci_set_word(config + PCI_DEVICE_ID,
> -                     0x1040 + virtio_bus_get_vdev_id(bus));
> +                     PCI_DEVICE_ID_VIRTIO_10_BASE + virtio_bus_get_vdev_id(bus));
>          pci_config_set_revision(config, 1);
>      }
>      config[PCI_INTERRUPT_PIN] = 1;


