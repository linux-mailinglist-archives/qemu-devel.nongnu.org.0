Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22CB1554540
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jun 2022 12:23:22 +0200 (CEST)
Received: from localhost ([::1]:54044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3xW5-0000kC-8O
	for lists+qemu-devel@lfdr.de; Wed, 22 Jun 2022 06:23:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1o3xTh-00070P-PE
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 06:20:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33952)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1o3xTe-000094-RQ
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 06:20:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655893249;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HHkBpzpYxUfNbUksPsEJObHkabf3Jbe7sLaSwej4UhY=;
 b=cH3WsO23jNRl6vCmrc27XNyCOgaA3T+gCSaSecdd4z4nP4e8ObQPMP0lzm0Vcvx6uVhGcd
 rAG4/rcN1g684EcjyurTdU1zk5Q92n9XCVAcQwksbZrksXCrnojeNjh6W1zqYMuBX8pDwI
 +ZJQTaCplaN2x0k34ViSZY2X3G6vRxg=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-323-2RhxO8IoO0ycfy7IaZsjlQ-1; Wed, 22 Jun 2022 06:20:48 -0400
X-MC-Unique: 2RhxO8IoO0ycfy7IaZsjlQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 v8-20020adfa1c8000000b0021b81a553fbso3247638wrv.18
 for <qemu-devel@nongnu.org>; Wed, 22 Jun 2022 03:20:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:reply-to
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=HHkBpzpYxUfNbUksPsEJObHkabf3Jbe7sLaSwej4UhY=;
 b=JcPon+dsvl/PZQntCsDcN75mZlxgBbFWAxvNJDrKvZaBzgGYO3KSeXaHDMbXhpFBaG
 M0blABNYWRKCZjJmJyiP5N9TFZknj/4TX+fI45zCeENwD+z4v6SHkIhGk+B8QJF8CwKi
 GslmFVFgP5qZ8JPttCg+qMfdQxF8V6QMBQE7HX0oRe1mAS0ZEFjzFxZS4q17b7sXTLiD
 jdpTTHYwsGbzmS0jE7a1aCrhrDxyQ5XlcuFfBnjld+qKS622l3ZcJaLNxpE62ivapIw8
 DhCzz7Hy6pUNJCCVG7N9fBfO3g0asuOFHWPvoQkv+5/bkFCJeU8qKMfQHUsQQkMHY4U2
 gZKg==
X-Gm-Message-State: AJIora8nY9MfXmdVf43Dc6shL/Ng/0ByZbCjGx/Vgr4goAuytC02SBU9
 6VV6zgW8gr5hXUfe2oreYFruwX7isfwgaJHTaiI56ppdncOJCxSDySSxvEUchH58qR/hcDAzpyu
 LeoNiHt2+dLKTYd4=
X-Received: by 2002:a05:600c:3d98:b0:39c:5cad:ab58 with SMTP id
 bi24-20020a05600c3d9800b0039c5cadab58mr3033505wmb.100.1655893247281; 
 Wed, 22 Jun 2022 03:20:47 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1u1KhRxG6xbbc6++RlGZ++k1tg48N9o2XVja3JY0287Vq+W/dCIEzPWtfdXhuD2Qn+2rj2hLA==
X-Received: by 2002:a05:600c:3d98:b0:39c:5cad:ab58 with SMTP id
 bi24-20020a05600c3d9800b0039c5cadab58mr3033478wmb.100.1655893247028; 
 Wed, 22 Jun 2022 03:20:47 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 w5-20020a05600018c500b00210320d9fbfsm22206009wrq.18.2022.06.22.03.20.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Jun 2022 03:20:46 -0700 (PDT)
Message-ID: <0f4f26de-1402-5c3a-9903-389fef9b234f@redhat.com>
Date: Wed, 22 Jun 2022 12:20:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2] virtio-iommu: Fix the partial copy of probe request
Content-Language: en-US
To: Zhenzhong Duan <zhenzhong.duan@intel.com>, qemu-devel@nongnu.org,
 Jean-Philippe Brucker <jean-philippe@linaro.org>
Cc: mst@redhat.com
References: <20220617062024.3168331-1-zhenzhong.duan@intel.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20220617062024.3168331-1-zhenzhong.duan@intel.com>
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

Hi,

On 6/17/22 08:20, Zhenzhong Duan wrote:
> The structure of probe request doesn't include the tail, this leads
> to a few field missed to be copied. Currently this isn't an issue as
> those missed field belong to reserved field, just in case reserved
> field will be used in the future.
>
> Fixes: 1733eebb9e75b ("virtio-iommu: Implement RESV_MEM probe request")
> Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
nice catch.

Reviewed-by: Eric Auger <eric.auger@redhat.com>

the spec is pretty confusing here though (virtio-v1.2-csd01.pdf) as it
presents the struct as follows:

struct virtio_iommu_req_probe {
struct virtio_iommu_req_head head; /* Device-readable */
le32 endpoint;
u8 reserved[64]; /* Device-writable */
u8 properties[probe_size];
struct virtio_iommu_req_tail tail;
};

Adding Jean in the loop ...

Thanks!

Eric




> ---
>  v2: keep bugfix change and drop cleanup change
>
>  hw/virtio/virtio-iommu.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
> index 7c122ab95780..195f909620ab 100644
> --- a/hw/virtio/virtio-iommu.c
> +++ b/hw/virtio/virtio-iommu.c
> @@ -708,7 +708,8 @@ static int virtio_iommu_handle_probe(VirtIOIOMMU *s,
>                                       uint8_t *buf)
>  {
>      struct virtio_iommu_req_probe req;
> -    int ret = virtio_iommu_iov_to_req(iov, iov_cnt, &req, sizeof(req));
> +    int ret = virtio_iommu_iov_to_req(iov, iov_cnt, &req,
> +                    sizeof(req) + sizeof(struct virtio_iommu_req_tail));
>  
>      return ret ? ret : virtio_iommu_probe(s, &req, buf);
>  }


