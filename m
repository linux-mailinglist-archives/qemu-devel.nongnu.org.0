Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38CDA483F7B
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 10:57:07 +0100 (CET)
Received: from localhost ([::1]:57250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4gZ0-0004ut-2o
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 04:57:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1n4gXa-0003XD-8H
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 04:55:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51362)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1n4gXY-0000kl-N9
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 04:55:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641290136;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HF2VlczSsHWxkP7wIN35QSZPmSkRYwqKh1d1uJtJvwM=;
 b=Sq6tRcpEa4950ejzHjVYGk/yEBhARyUqrBwbOdqbEu0JIkFQCWQ/JlD8P/3cUOwmnV/jPi
 HZ7tnnt5LG8EJVCjuLlLcDHJFXKECIpx2oM3dQY6dCkDrAuw3PDQ124tCNPESinJFoFQ0I
 2aQFf96svvcAT7knrXSaHI/TH/aN4Vs=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-613-i3nO5xpjOPiJW0lxtOaRJg-1; Tue, 04 Jan 2022 04:55:33 -0500
X-MC-Unique: i3nO5xpjOPiJW0lxtOaRJg-1
Received: by mail-pj1-f70.google.com with SMTP id
 35-20020a17090a0fa600b001b160e1ecffso23820592pjz.9
 for <qemu-devel@nongnu.org>; Tue, 04 Jan 2022 01:55:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=HF2VlczSsHWxkP7wIN35QSZPmSkRYwqKh1d1uJtJvwM=;
 b=fj47FgbE6TokDbJq3LAZk2Mdv+SwvEqxW7vaUGOSS9GI/+KQGYCw/AWzciCna82jeb
 X/z60fj64DxjJpnhfGyV4TunoLnq8WYNFv6tSp3J06A22wNFlORufphNHZ67ES20+81k
 jR5T4t7AHiwI5Q0grY4HrYfZLLte5+guKzNAegyJ9K95vtgP2UANlZ4IgocqIxrSds7u
 Yoc6G5XOYcNfGDGzf5o3nwXGPqyEL3yiU77ib436/xS9ljZ99HTZI3Unu4v05amp/eCT
 U8qRJotZ4NOLktTifH4IaKdFfOQ6eYlXd28hJzL56cxNaq4G2jLsALmljhqT/RWWuV/5
 ER3w==
X-Gm-Message-State: AOAM533k4WFHE5hzvMMWUZ4zbNVfLgtdb4zk7KBEzThATFTwzhft5kkG
 CS5bGhcd5tx6/Qq3gn7OtJ+m8asFyustcq/UfPBM2XKxLjWtFj35lgmQpkE12tGLZZSR/s55wiA
 kllcfGSyT7l5pylI=
X-Received: by 2002:a17:90a:c788:: with SMTP id
 gn8mr59351012pjb.212.1641290132167; 
 Tue, 04 Jan 2022 01:55:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxgMEW/px37l8UvOMBu/ocY3/FEgzmAXVjlxOSjUPGT2rkOF9D7ZjEJ3hGvBeFJpB7982VxWQ==
X-Received: by 2002:a17:90a:c788:: with SMTP id
 gn8mr59350991pjb.212.1641290131940; 
 Tue, 04 Jan 2022 01:55:31 -0800 (PST)
Received: from xz-m1.local ([191.101.132.50])
 by smtp.gmail.com with ESMTPSA id l22sm42308687pfc.167.2022.01.04.01.55.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jan 2022 01:55:31 -0800 (PST)
Date: Tue, 4 Jan 2022 17:55:24 +0800
From: Peter Xu <peterx@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH v2 8/9] hw/dma: Use dma_addr_t type definition when
 relevant
Message-ID: <YdQZi3GB0dbiOdbm@xz-m1.local>
References: <20220104085431.2122999-1-f4bug@amsat.org>
 <20220104085431.2122999-9-f4bug@amsat.org>
MIME-Version: 1.0
In-Reply-To: <20220104085431.2122999-9-f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) DKIMWL_WL_HIGH=-0.37, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Hannes Reinecke <hare@suse.com>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Klaus Jensen <its@irrelevant.dk>,
 Keith Busch <kbusch@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jan 04, 2022 at 09:54:30AM +0100, Philippe Mathieu-Daudé wrote:
> diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
> index 462f79a1f60..c3c49176110 100644
> --- a/hw/nvme/ctrl.c
> +++ b/hw/nvme/ctrl.c
> @@ -1147,7 +1147,7 @@ static uint16_t nvme_tx(NvmeCtrl *n, NvmeSg *sg, uint8_t *ptr, uint32_t len,
>  
>      if (sg->flags & NVME_SG_DMA) {
>          const MemTxAttrs attrs = MEMTXATTRS_UNSPECIFIED;
> -        uint64_t residual;
> +        dma_addr_t residual;
>  
>          if (dir == NVME_TX_DIRECTION_TO_DEVICE) {
>              residual = dma_buf_write(ptr, len, &sg->qsg, attrs);

If there's a new version: Maybe also change the return value types of
dma_buf_write|read() to dma_addr_t?

It'll be changed anyway in the next patch, so not a big deal.

The rest patches looks good to me.  Thanks.

-- 
Peter Xu


