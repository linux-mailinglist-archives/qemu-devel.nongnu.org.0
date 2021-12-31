Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA7034823D5
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Dec 2021 12:54:55 +0100 (CET)
Received: from localhost ([::1]:38978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n3GUo-0000VG-QP
	for lists+qemu-devel@lfdr.de; Fri, 31 Dec 2021 06:54:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n3GRk-0006Bv-QM
 for qemu-devel@nongnu.org; Fri, 31 Dec 2021 06:51:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35562)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n3GRj-0000hn-4u
 for qemu-devel@nongnu.org; Fri, 31 Dec 2021 06:51:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640951502;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OyiGith5rIKv6blPRYRNpA4iiJP2dthXi9GFfRbLi5A=;
 b=OHBZveOKTLCjYL9unF1WUvBug3IH90oA6gLHwXti/kSVe+k/nAlWYVgjpztHvtFedPIZfb
 YV0Mam+AlvdRvuDF0Aipm2QfSq6cvj6Ur77/KQcIJoenX9GeP8oz19xQP14fylI6hHdkdF
 GfYA+SQgKCSwqoXMeYu45R/OIWp7djQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-270-fnQRhf-nPD2x8805HPxOLQ-1; Fri, 31 Dec 2021 06:51:41 -0500
X-MC-Unique: fnQRhf-nPD2x8805HPxOLQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 g189-20020a1c20c6000000b00345bf554707so13415465wmg.4
 for <qemu-devel@nongnu.org>; Fri, 31 Dec 2021 03:51:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=OyiGith5rIKv6blPRYRNpA4iiJP2dthXi9GFfRbLi5A=;
 b=6yknpBHZdEBFUlmBSaDPN7b1GbEIucRd+nlLXcBds/V+VaJZx5ZlpJcO0oYxHF+OVr
 J115Q17XMUo8kO+kwU/NFlFJMlCkzkd8+nTmMk4Rywbuk43Doz/xSvLLOfMEXJKZyk8N
 gbYoPdJ56y8U40x9V7a21K6RlvzgII9dShdwh27vGnuc63BAWCp5apMvw7A224NqKVez
 lpQvWzHVS4kfrX142dQXy7Yd8i8a3YMQa6KrD/7eHweFT9OQkxi+1ggynNrlTCPLJbz1
 Mey8qwhUkz7xotew7utOURrH/mNv2A63GoG1cBgLibgni+u76vMrfY/5n6KKHep7+jDp
 LOZA==
X-Gm-Message-State: AOAM530eMDeRmN3RwgyH9rxpDcNZ9AGUvqmKKMEuZODYFl8lpFhdKyko
 MMYET4vM5W6RrITntYgwE0dduWA+9VyYWgR8LjQcq4CQgN0PXXLeR8IqvdTBN1LTRmlh7bnqm1O
 3BV1+a4483e51jfaZVgujBzIk5EX+ccshKYmEEIZkZ9syHQr/kdlAj/M6DcKGU1YJ
X-Received: by 2002:a1c:4644:: with SMTP id t65mr29360356wma.116.1640951500167; 
 Fri, 31 Dec 2021 03:51:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz3oBqI5PNzeGq1+mSIIlo7r9ER0mG9pcXfUcK8o9cupNMHkqXl3VFDqxovfbYyaPCAsAcIDg==
X-Received: by 2002:a1c:4644:: with SMTP id t65mr29360338wma.116.1640951499923; 
 Fri, 31 Dec 2021 03:51:39 -0800 (PST)
Received: from [192.168.1.36] (26.red-83-50-86.dynamicip.rima-tde.net.
 [83.50.86.26])
 by smtp.gmail.com with ESMTPSA id j3sm26784298wro.22.2021.12.31.03.51.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Dec 2021 03:51:39 -0800 (PST)
Message-ID: <32740819-2ab4-d9d5-8bc3-1e24b7f592ba@redhat.com>
Date: Fri, 31 Dec 2021 12:51:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 8/8] hw/dma: Let dma_buf_read() / dma_buf_write()
 propagate MemTxResult
To: qemu-devel@nongnu.org
References: <20211231114901.976937-1-philmd@redhat.com>
 <20211231114901.976937-9-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211231114901.976937-9-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) DKIMWL_WL_HIGH=-0.573, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.024,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Klaus Jensen <k.jensen@samsung.com>,
 David Hildenbrand <david@redhat.com>, Peter Xu <peterx@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/31/21 12:49, Philippe Mathieu-Daudé wrote:
> Since the previous commit, dma_buf_rw() returns a MemTxResult
> type. Do not discard it, return it to the caller.
> 
> Since both dma_buf_read/dma_buf_write functions were previously
> returning the QEMUSGList size not consumed, add an extra argument
> where the unconsummed size can be stored.
> 
> Update the few callers.
> 
> Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  include/hw/scsi/scsi.h |  2 +-
>  include/sysemu/dma.h   |  6 +++--
>  hw/ide/ahci.c          |  8 +++---
>  hw/nvme/ctrl.c         |  4 +--
>  hw/scsi/megasas.c      | 59 ++++++++++++++++++++++++++++++------------
>  hw/scsi/scsi-bus.c     |  6 +++--
>  softmmu/dma-helpers.c  | 18 +++++--------
>  7 files changed, 63 insertions(+), 40 deletions(-)
> 
> diff --git a/include/hw/scsi/scsi.h b/include/hw/scsi/scsi.h
> index b27d133b113..1ffb367f94f 100644
> --- a/include/hw/scsi/scsi.h
> +++ b/include/hw/scsi/scsi.h
> @@ -30,7 +30,7 @@ struct SCSIRequest {
>      int16_t           status;
>      int16_t           host_status;
>      void              *hba_private;
> -    size_t            residual;
> +    uint64_t          residual;

Oops I forgot to mention this change since the previous version.

>      SCSICommand       cmd;
>      NotifierList      cancel_notifiers;
>  
> diff --git a/include/sysemu/dma.h b/include/sysemu/dma.h
> index 45a2567848c..77a346d5ed1 100644
> --- a/include/sysemu/dma.h
> +++ b/include/sysemu/dma.h
> @@ -303,8 +303,10 @@ BlockAIOCB *dma_blk_read(BlockBackend *blk,
>  BlockAIOCB *dma_blk_write(BlockBackend *blk,
>                            QEMUSGList *sg, uint64_t offset, uint32_t align,
>                            BlockCompletionFunc *cb, void *opaque);
> -uint64_t dma_buf_read(void *ptr, int32_t len, QEMUSGList *sg, MemTxAttrs attrs);
> -uint64_t dma_buf_write(void *ptr, int32_t len, QEMUSGList *sg, MemTxAttrs attrs);
> +MemTxResult dma_buf_read(void *ptr, dma_size_t len, dma_size_t *residual,
> +                         QEMUSGList *sg, MemTxAttrs attrs);
> +MemTxResult dma_buf_write(void *ptr, dma_size_t len, dma_size_t *residual,
> +                          QEMUSGList *sg, MemTxAttrs attrs);
>  


