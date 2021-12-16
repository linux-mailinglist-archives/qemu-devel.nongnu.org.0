Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ABD047728C
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 14:02:14 +0100 (CET)
Received: from localhost ([::1]:41846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxqOj-0007lb-Az
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 08:02:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxq2V-0003qb-Ln
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 07:39:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44498)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mxq2S-0004pm-Fg
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 07:39:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639658352;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X752vyuIExQbwXF0zjjAzzOvAjZYTnvlYfj3RN/LtQM=;
 b=ZBKgw7tE7LeG9EttnpUu2JEBxcdjUC8I9yYQxoexZd7M70YISA0wARu1/hQFEQOEwu6/9E
 h+TeSPV/3UVeB6pqVz148OQbDc5g/ziNWKpUn3zAem6z/QV/Sl8n+nbsFbO+FpJVlsvSiB
 jSvr7im8PQQoCtJpLQkDkuKtlDw620o=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-187-P6qEs0MoP2m3PP9SKI8ojg-1; Thu, 16 Dec 2021 07:39:11 -0500
X-MC-Unique: P6qEs0MoP2m3PP9SKI8ojg-1
Received: by mail-wm1-f69.google.com with SMTP id
 j20-20020a05600c1c1400b00343ad0c4c40so1236515wms.0
 for <qemu-devel@nongnu.org>; Thu, 16 Dec 2021 04:39:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=X752vyuIExQbwXF0zjjAzzOvAjZYTnvlYfj3RN/LtQM=;
 b=yCmchABpsZcG8a73RGLcnf2QCYverJunCas3KBjWE/6MTkp8BTzZ6AmWARvBt2mTIV
 3Q015LTrvaOdFhDWEREHZAntWq/YCrU93NLg0YIJgxhitP7l8n9h5bKqtwI1Sf5ZsOPt
 9TCEpn0RaEuUvlqSXv/uzQTEeJTlglSUb2rRYwAKxb7H7QMesJlmh895cogA+mmT5P9b
 ItudBUuLWbFtxycp96q2SR5m+vSQQhHt16O2+tGLOZYcUBe+fY51JNsCH6xjsz3MEC/d
 sKxsQVvJT+1IDLGcsWYVfLA9qLAXQ/q6mkv4MZ6zhDGo0giFKCQEAWtffPtKWvg8kPvj
 pKtg==
X-Gm-Message-State: AOAM533w7bHoxWsk0E8jfvi/UKpYW5kgzZxxdARuWZPhXC4tUuMi5gZB
 jNBQGLLN4EZ7ahwrYPGNEuq/zx1Gf5FeRZbwLn4/7CZiF56QWdiJsSuZGdsRY7HwnJ/q6Kn8L4c
 f9Jnzof9nPNockdygeZBU0JvBqUbxT3j7MANndyEwyAeDfs0edkvF9yHo7z9c0+Et
X-Received: by 2002:a05:600c:1e8b:: with SMTP id
 be11mr4903078wmb.40.1639658349283; 
 Thu, 16 Dec 2021 04:39:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz/4a0LEVQqVS1nRToOiaajMw3P6mO0qtPLlotZOJl7gydyw+7kJ2pWUFQUS5NQ80WvZQjCCQ==
X-Received: by 2002:a05:600c:1e8b:: with SMTP id
 be11mr4903046wmb.40.1639658349068; 
 Thu, 16 Dec 2021 04:39:09 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id o1sm5974544wri.100.2021.12.16.04.39.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Dec 2021 04:39:08 -0800 (PST)
Message-ID: <0293e8b3-a55d-da6a-f6cd-51535b643046@redhat.com>
Date: Thu, 16 Dec 2021 13:39:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 8/8] dma: Let dma_buf_read() / dma_buf_write() propagate
 MemTxResult
To: qemu-devel@nongnu.org
References: <20211216123558.799425-1-philmd@redhat.com>
 <20211216123558.799425-9-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211216123558.799425-9-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.034, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Hannes Reinecke <hare@suse.com>, qemu-block@nongnu.org,
 David Hildenbrand <david@redhat.com>, Jason Wang <jasowang@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Li Qiang <liq3ea@gmail.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Peter Xu <peterx@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Alexander Bulekov <alxndr@bu.edu>,
 Gerd Hoffmann <kraxel@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/16/21 13:35, Philippe Mathieu-Daudé wrote:
> Since the previous commit, dma_buf_rw() returns a MemTxResult
> type. Do not discard it, return it to the caller.
> 
> Since both dma_buf_read/dma_buf_write functions were previously
> returning the QEMUSGList size not consumed, add an extra argument
> where the unconsummed size can be stored.
> 
> Update the few callers.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  include/sysemu/dma.h  |  6 ++++--
>  hw/ide/ahci.c         |  8 ++++----
>  hw/nvme/ctrl.c        |  4 ++--
>  hw/scsi/megasas.c     | 48 ++++++++++++++++++++++++++++++-------------
>  hw/scsi/scsi-bus.c    |  4 ++--
>  softmmu/dma-helpers.c | 18 ++++++----------
>  6 files changed, 52 insertions(+), 36 deletions(-)
> 
> diff --git a/include/sysemu/dma.h b/include/sysemu/dma.h
> index cdf379fecad..9f998edbea4 100644
> --- a/include/sysemu/dma.h
> +++ b/include/sysemu/dma.h
> @@ -303,8 +303,10 @@ BlockAIOCB *dma_blk_read(BlockBackend *blk,
>  BlockAIOCB *dma_blk_write(BlockBackend *blk,
>                            QEMUSGList *sg, uint64_t offset, uint32_t align,
>                            BlockCompletionFunc *cb, void *opaque);
> -uint64_t dma_buf_read(void *ptr, int32_t len, QEMUSGList *sg, MemTxAttrs attrs);
> -uint64_t dma_buf_write(void *ptr, int32_t len, QEMUSGList *sg, MemTxAttrs attrs);
> +MemTxResult dma_buf_read(void *ptr, int32_t len, uint64_t *residp,
> +                         QEMUSGList *sg, MemTxAttrs attrs);
> +MemTxResult dma_buf_write(void *ptr, int32_t len, uint64_t *residp,
> +                          QEMUSGList *sg, MemTxAttrs attrs);

Side note, ideally all functions returning the MemTxResult
type should use the warn_unused_result attribute.


