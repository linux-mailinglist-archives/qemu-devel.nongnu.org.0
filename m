Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9509333B0DC
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 12:21:52 +0100 (CET)
Received: from localhost ([::1]:38508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLlIF-0005to-Lc
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 07:21:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lLlGL-000598-4z
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 07:19:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51834)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lLlGJ-0006yD-0R
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 07:19:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615807190;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fLZbLe6oL0ffU0NzKcBSnGDvtVFN3uJxIlOZYBwX+0g=;
 b=Y7nHqPyfvAEVipDKadiKAHhGTCsghGmO/AWJCAKY0anhhkcV9hz6rwClf4YdoRVXO5HDjl
 YDQRDOciBnXaLq1BzM3HmE8HDyWKP/yrwqKSOUz+EhPNcmrWGiIYf2LFagIxpgDM+JO+eR
 CG8VSXWbL8SGYJdo4Zj2jSwvq2gBuI0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-59-zRZn7NlVNP6DxhtrY04Dhw-1; Mon, 15 Mar 2021 07:19:46 -0400
X-MC-Unique: zRZn7NlVNP6DxhtrY04Dhw-1
Received: by mail-wr1-f70.google.com with SMTP id z17so14928170wrv.23
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 04:19:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fLZbLe6oL0ffU0NzKcBSnGDvtVFN3uJxIlOZYBwX+0g=;
 b=M2mS7DU+XMTDgAXYMIjS0m9vw53AWzNz7piQMVPwLAb00sZRugE+ebOELOho5ZIIhl
 /qoaVRbEqWzgA2nedGyrTZAbwaiReTwWj7yelb9FhpKt72aa3ochtDFU0kt7eajYhXkg
 h28HOl1I+OhW7vEa4jKKc7VlqTmYg2Gq8uh2SW0o3T2J8XscxeQqOCCnGbz1tUHIAg/t
 Q/II0Mm3fskj56MSO6TZl02hAScm2zPSgascOAQTLQq02vameh41+hH56HCuPNOQrPpZ
 q2hy1UZJTxjIDtPrlV+PgrKoM71LQCvnfa2IyY7shQ4rRpWknmBRhQGQNFXftXlCNE5F
 PK1Q==
X-Gm-Message-State: AOAM532aNVQwHNbjaYLdukLlBoRNHxgHUZ3XITT3n9q7VD/U/zU3dJKZ
 r0ZRjHYgyZlk/Us03K+5ataXJG2CKWWkPvQxAAF8qKgF9R5sYiCi0/g9nuURr54kMvRG7zccy+/
 iqwCjnawwnLKQ5Gw=
X-Received: by 2002:a7b:c0c4:: with SMTP id s4mr26306608wmh.9.1615807185722;
 Mon, 15 Mar 2021 04:19:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwnEHCxEeFv1es3Ch4osKjLc97TUZcabLSLKYSeBwgYFyqN0EA0RKSR5mOXCBeolKKOX6rlSw==
X-Received: by 2002:a7b:c0c4:: with SMTP id s4mr26306582wmh.9.1615807185362;
 Mon, 15 Mar 2021 04:19:45 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id d204sm12332065wmc.17.2021.03.15.04.19.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Mar 2021 04:19:44 -0700 (PDT)
Subject: Re: [PATCH 2/2] hw/block/nvme: assert namespaces array indices
To: Klaus Jensen <its@irrelevant.dk>, qemu-devel@nongnu.org
References: <20210315110359.51450-1-its@irrelevant.dk>
 <20210315110359.51450-3-its@irrelevant.dk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <edd50e76-76bd-0d74-878a-0e7c02544e9f@redhat.com>
Date: Mon, 15 Mar 2021 12:19:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210315110359.51450-3-its@irrelevant.dk>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, Max Reitz <mreitz@redhat.com>,
 Minwoo Im <minwoo.im.dev@gmail.com>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/15/21 12:03 PM, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
> 
> Coverity complains about a possible memory corruption in the
> nvme_ns_attach and _detach functions. While we should not (famous last
> words) be able to reach this function without nsid having previously
> been validated, this is still an open door for future misuse.
> 
> Make Coverity and maintainers happy by asserting that the index into the
> array is valid. Also, while not detected by Coverity (yet), add an
> assert in nvme_subsys_ns and nvme_subsys_register_ns as well since a
> similar issue is exists there.
> 
> Fixes: 037953b5b299 ("hw/block/nvme: support namespace detach")
> Fixes: CID 1450757
> Fixes: CID 1450758
> Cc: Minwoo Im <minwoo.im.dev@gmail.com>
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> ---
>  hw/block/nvme-subsys.h |  2 ++
>  hw/block/nvme.h        | 10 ++++++++--
>  hw/block/nvme-subsys.c |  7 +++++--
>  3 files changed, 15 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/block/nvme-subsys.h b/hw/block/nvme-subsys.h
> index fb66ae752ad5..aafa04b84829 100644
> --- a/hw/block/nvme-subsys.h
> +++ b/hw/block/nvme-subsys.h
> @@ -54,6 +54,8 @@ static inline NvmeNamespace *nvme_subsys_ns(NvmeSubsystem *subsys,
>          return NULL;
>      }
>  
> +    assert(nsid && nsid <= NVME_SUBSYS_MAX_NAMESPACES);
> +
>      return subsys->namespaces[nsid];
>  }
>  
> diff --git a/hw/block/nvme.h b/hw/block/nvme.h
> index 4955d649c7d4..45ba9dbc2131 100644
> --- a/hw/block/nvme.h
> +++ b/hw/block/nvme.h
> @@ -236,12 +236,18 @@ static inline bool nvme_ns_is_attached(NvmeCtrl *n, NvmeNamespace *ns)
>  
>  static inline void nvme_ns_attach(NvmeCtrl *n, NvmeNamespace *ns)
>  {
> -    n->namespaces[nvme_nsid(ns) - 1] = ns;
> +    uint32_t nsid = ns->params.nsid;

Why not keep using nvme_nsid(ns)?

> +    assert(nsid && nsid <= NVME_MAX_NAMESPACES);
> +
> +    n->namespaces[nsid - 1] = ns;
>  }
>  
>  static inline void nvme_ns_detach(NvmeCtrl *n, NvmeNamespace *ns)
>  {
> -    n->namespaces[nvme_nsid(ns) - 1] = NULL;
> +    uint32_t nsid = ns->params.nsid;

Ditto.

> +    assert(nsid && nsid <= NVME_MAX_NAMESPACES);
> +
> +    n->namespaces[nsid - 1] = NULL;
>  }
>  
>  static inline NvmeCQueue *nvme_cq(NvmeRequest *req)
> diff --git a/hw/block/nvme-subsys.c b/hw/block/nvme-subsys.c
> index af4804a819ee..2f6d3b47bacf 100644
> --- a/hw/block/nvme-subsys.c
> +++ b/hw/block/nvme-subsys.c
> @@ -47,15 +47,18 @@ int nvme_subsys_register_ns(NvmeNamespace *ns, Error **errp)
>  {
>      NvmeSubsystem *subsys = ns->subsys;
>      NvmeCtrl *n;
> +    uint32_t nsid = ns->params.nsid;

Ditto.

Preferably using nvme_nsid():
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

>      int i;
>  
> -    if (subsys->namespaces[nvme_nsid(ns)]) {
> +    assert(nsid && nsid <= NVME_SUBSYS_MAX_NAMESPACES);
> +
> +    if (subsys->namespaces[nsid]) {
>          error_setg(errp, "namespace %d already registerd to subsy %s",
>                     nvme_nsid(ns), subsys->parent_obj.id);
>          return -1;
>      }
>  
> -    subsys->namespaces[nvme_nsid(ns)] = ns;
> +    subsys->namespaces[nsid] = ns;
>  
>      for (i = 0; i < ARRAY_SIZE(subsys->ctrls); i++) {
>          n = subsys->ctrls[i];
> 


