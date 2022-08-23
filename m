Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E60159D284
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 09:46:30 +0200 (CEST)
Received: from localhost ([::1]:49918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQOcH-00069y-LQ
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 03:46:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oQOQW-0005XB-8k
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 03:34:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60131)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oQOQU-0005N7-56
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 03:34:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661240053;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ARvDpJVEIMA79mkngTQt0Th9+LwoMwWuyNLZhbw0+cU=;
 b=TXWVrZzMOAT74ghnNBzldQXGTm2RpF8rGpldn8S6mUayj0jZM+9kGUdfxnrJX/hdd7lKhZ
 au5p2zO63EFps1rtD6m2ghzrhcUylYneYBcT1pm/22CA5VBESEjJxcfnTcoh1xjbiLc7sK
 GMOOeNgICMHxa8+UYgtHo96hIdp4uag=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-393-tPKP998xPOylO5gIXFWN8g-1; Tue, 23 Aug 2022 03:34:09 -0400
X-MC-Unique: tPKP998xPOylO5gIXFWN8g-1
Received: by mail-pl1-f200.google.com with SMTP id
 k13-20020a170902c40d00b00172c510eecaso6634093plk.20
 for <qemu-devel@nongnu.org>; Tue, 23 Aug 2022 00:34:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=ARvDpJVEIMA79mkngTQt0Th9+LwoMwWuyNLZhbw0+cU=;
 b=QxZ3Pu9vsX3yZuLxWh68E4uV++GByeHYZ0TbRWL3c8WBnqB8pCFRUaWnjSqmgOlqZZ
 6GoZDoIBctPBPsweSYuq7NgdvB42NBubj66K/WvL+Zjp76IGPzT+pgSnTOHU4QGrwUhv
 6dSlrZ1YwgPRbrNxSBjq+5eJAISbeyYmZqMrxolnz2/AeecSmaGyIe+tyAzXISpMYdRp
 NstgoxTHpZJTKY03bEAyikCLw4uihoILkSIP/3XvHl1DJT91wruKHLA95hNYbwZm5drJ
 5Q1gF9e8FTogfCudq/n4QOemApTy6R0Qq9ZmwvF8Cf31/ThqqSdINX8Cw9TY7wW7HgYG
 TyVQ==
X-Gm-Message-State: ACgBeo33T98SSyz1ghxiSQQut4Cxgo/eE6bSM/7DUAvG57FlkhWG8jcw
 wpH1fNWCxpdq7YMvIw9uoAScc9v+529veNWm3so9eI3tiSF10jLzcS9uARKjcNjkb+UJdP5jvPz
 B//NQwZbBRLjYQGE=
X-Received: by 2002:a17:902:b684:b0:172:d9f4:e511 with SMTP id
 c4-20020a170902b68400b00172d9f4e511mr12588913pls.107.1661240048956; 
 Tue, 23 Aug 2022 00:34:08 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5KDk88Or4yznyhUqMZisDJkE/N1xrF1eBkTZIzeToxebh6+KxrMwXMJLWl/bbYSA2JNmnMpg==
X-Received: by 2002:a17:902:b684:b0:172:d9f4:e511 with SMTP id
 c4-20020a170902b68400b00172d9f4e511mr12588902pls.107.1661240048686; 
 Tue, 23 Aug 2022 00:34:08 -0700 (PDT)
Received: from [10.72.13.141] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 c127-20020a621c85000000b005289ef6db79sm9925058pfc.32.2022.08.23.00.34.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Aug 2022 00:34:07 -0700 (PDT)
Message-ID: <87cf42ed-4645-fec6-1990-317d85f09338@redhat.com>
Date: Tue, 23 Aug 2022 15:34:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.12.0
Subject: Re: [PATCH v2 05/24] virtio: core: vq reset feature negotation support
Content-Language: en-US
To: Kangjie Xu <kangjie.xu@linux.alibaba.com>, qemu-devel@nongnu.org
Cc: mst@redhat.com, eduardo@habkost.net, marcel.apfelbaum@gmail.com,
 f4bug@amsat.org, wangyanan55@huawei.com, hengqi@linux.alibaba.com,
 xuanzhuo@linux.alibaba.com
References: <cover.1660611460.git.kangjie.xu@linux.alibaba.com>
 <932993943b00e0a0567a7a78c7f92c97bb105d58.1660611460.git.kangjie.xu@linux.alibaba.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <932993943b00e0a0567a7a78c7f92c97bb105d58.1660611460.git.kangjie.xu@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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


在 2022/8/16 09:06, Kangjie Xu 写道:
> A a new command line parameter "queue_reset" is added.
>
> Meanwhile, the vq reset feature is disabled for pre-7.1 machines.
>
> Signed-off-by: Kangjie Xu <kangjie.xu@linux.alibaba.com>
> Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> ---
>   hw/core/machine.c          | 1 +
>   include/hw/virtio/virtio.h | 4 +++-
>   2 files changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index a673302cce..8b22b4647f 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -43,6 +43,7 @@
>   GlobalProperty hw_compat_7_0[] = {
>       { "arm-gicv3-common", "force-8-bit-prio", "on" },
>       { "nvme-ns", "eui64-default", "on"},
> +    { "virtio-device", "queue_reset", "false" },


7.1 is about to release so we need to do it for pre-7.2.

Thanks


>   };
>   const size_t hw_compat_7_0_len = G_N_ELEMENTS(hw_compat_7_0);
>   
> diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
> index 085997d8f3..ed3ecbef80 100644
> --- a/include/hw/virtio/virtio.h
> +++ b/include/hw/virtio/virtio.h
> @@ -295,7 +295,9 @@ typedef struct VirtIORNGConf VirtIORNGConf;
>       DEFINE_PROP_BIT64("iommu_platform", _state, _field, \
>                         VIRTIO_F_IOMMU_PLATFORM, false), \
>       DEFINE_PROP_BIT64("packed", _state, _field, \
> -                      VIRTIO_F_RING_PACKED, false)
> +                      VIRTIO_F_RING_PACKED, false), \
> +    DEFINE_PROP_BIT64("queue_reset", _state, _field, \
> +                      VIRTIO_F_RING_RESET, true)
>   
>   hwaddr virtio_queue_get_desc_addr(VirtIODevice *vdev, int n);
>   bool virtio_queue_enabled_legacy(VirtIODevice *vdev, int n);


