Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CD375575EE
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jun 2022 10:53:47 +0200 (CEST)
Received: from localhost ([::1]:43058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4Iaw-0003aN-9e
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 04:53:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1o4IYP-00024i-IM
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 04:51:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30208)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1o4IYL-0007jS-SM
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 04:51:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655974265;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eUkcgIbFjbLlytO/KFdcuhAP9P7qlEXLFgsqC2I+0Sc=;
 b=NFG5PoqWkddD8H931MbUSP3h4Tzax9PpWTwV5j/QyvJM6eBxf78mcaCE8vmAcozmm0+uBz
 8id4brxfp34NFb2Lle4diPpgKv+YiaTYYu1cAWIw/MCTdyBg8wFWwwYYpIQAVVJdrpccTy
 KTYk1c3X1aF+IcKuT1xfmbJFTS9INsM=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-335-HAsiAdReNKGcbzo9Xk_RIg-1; Thu, 23 Jun 2022 04:51:03 -0400
X-MC-Unique: HAsiAdReNKGcbzo9Xk_RIg-1
Received: by mail-qv1-f72.google.com with SMTP id
 b18-20020a0ccd12000000b004703d1b04e8so12466658qvm.13
 for <qemu-devel@nongnu.org>; Thu, 23 Jun 2022 01:51:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:reply-to
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=eUkcgIbFjbLlytO/KFdcuhAP9P7qlEXLFgsqC2I+0Sc=;
 b=CpQuM+knfJMAGg9fy7RZjXJohZww5H7m9NL3GAo7krLw7fLPSAoB/brsENMttx6w4h
 w17sdV205cBILvPXNeBoYnWK53r/DMVOebNs6/lVGQEwbCxOZtL1s+o5ed3KfVbhP+C2
 L3VSR2beWrhMt9kM4gx2HGY7L9zDxbdufZn39LBHM4sxxkByfm9auNIrGkh7Nl2ZEzlV
 7g3zHM46dpHlwHhS2AcOLP81uA9BIWDf/fJ2/Se1xOkX3AeuQ2hnjLR/z1QSU+kMkU6R
 gEApB273vJNybhFAxAvWR7uXqC0JoovwKHbuUcliEmY4AckLzjhd8oFD6dknZh4thC4F
 dqJg==
X-Gm-Message-State: AJIora/LVrqH98QP+kENGJ+xT6bmE6P3avcN/N66gFaJ0wa970Qd1nUA
 0C3L6FOrkBKnYLVRmH+yNmXLkZPsX04I21EaQ4oWbehubRdp/+6vU4KH5JRfccFvytjNhtiJmCa
 FStdDZU6UkCCdkho=
X-Received: by 2002:a05:6214:519d:b0:470:4fe1:cc5c with SMTP id
 kl29-20020a056214519d00b004704fe1cc5cmr12449635qvb.91.1655974262906; 
 Thu, 23 Jun 2022 01:51:02 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1txTvNWcShfe3wr/ZwDwVpGr/iuKiP1NsLzNMQLq3v2mQRvqtG67tlrjAWJqqKXmBE8Z/uOnQ==
X-Received: by 2002:a05:6214:519d:b0:470:4fe1:cc5c with SMTP id
 kl29-20020a056214519d00b004704fe1cc5cmr12449624qvb.91.1655974262665; 
 Thu, 23 Jun 2022 01:51:02 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 g10-20020a05620a40ca00b006a6bb044740sm19216360qko.66.2022.06.23.01.51.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Jun 2022 01:51:02 -0700 (PDT)
Message-ID: <ad570d50-fa39-25fb-dbbe-65b760e11591@redhat.com>
Date: Thu, 23 Jun 2022 10:50:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v3] virtio-iommu: Fix the partial copy of probe request
Content-Language: en-US
To: Zhenzhong Duan <zhenzhong.duan@intel.com>, qemu-devel@nongnu.org
Cc: mst@redhat.com, jean-philippe@linaro.org
References: <20220623023152.3473231-1-zhenzhong.duan@intel.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20220623023152.3473231-1-zhenzhong.duan@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Duan,

On 6/23/22 04:31, Zhenzhong Duan wrote:
> The structure of probe request doesn't include the tail, this leads
> to a few field missed to be copied. Currently this isn't an issue as
> those missed field belong to reserved field, just in case reserved
> field will be used in the future.
>
> Changed 4th parameter of virtio_iommu_iov_to_req() to receive size
> of device-readable part.
>
> Fixes: 1733eebb9e75b ("virtio-iommu: Implement RESV_MEM probe request")
> Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
> ---
>  v3: moved "- sizeof(struct virtio_iommu_req_tail)" to virtio_iommu_handle_req() per Jean
>  v2: keep bugfix change and drop cleanup change
>
>  hw/virtio/virtio-iommu.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
> index 7c122ab95780..08b227e828f8 100644
> --- a/hw/virtio/virtio-iommu.c
> +++ b/hw/virtio/virtio-iommu.c
> @@ -675,11 +675,10 @@ static int virtio_iommu_probe(VirtIOIOMMU *s,
>  
>  static int virtio_iommu_iov_to_req(struct iovec *iov,
>                                     unsigned int iov_cnt,
> -                                   void *req, size_t req_sz)
> +                                   void *req, size_t payload_sz)
>  {
> -    size_t sz, payload_sz = req_sz - sizeof(struct virtio_iommu_req_tail);
> +    size_t sz = iov_to_buf(iov, iov_cnt, 0, req, payload_sz);
>  
> -    sz = iov_to_buf(iov, iov_cnt, 0, req, payload_sz);
>      if (unlikely(sz != payload_sz)) {
>          return VIRTIO_IOMMU_S_INVAL;
>      }
> @@ -692,7 +691,8 @@ static int virtio_iommu_handle_ ## __req(VirtIOIOMMU *s,                \
>                                           unsigned int iov_cnt)          \
>  {                                                                       \
>      struct virtio_iommu_req_ ## __req req;                              \
> -    int ret = virtio_iommu_iov_to_req(iov, iov_cnt, &req, sizeof(req)); \
> +    int ret = virtio_iommu_iov_to_req(iov, iov_cnt, &req,               \
> +                    sizeof(req) - sizeof(struct virtio_iommu_req_tail));\
>                                                                          \
>      return ret ? ret : virtio_iommu_ ## __req(s, &req);                 \
>  }


