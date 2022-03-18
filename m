Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 714FE4DE13F
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 19:40:57 +0100 (CET)
Received: from localhost ([::1]:42988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVHWy-0007kC-Ix
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 14:40:56 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nVHV1-0006VJ-SP
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 14:38:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46060)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nVHV0-00042W-6h
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 14:38:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647628733;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q9vq172mxRtwNwXTPUzfXS+pDY5DpYB6lzoEZz6DQog=;
 b=PWENbWAPvY/Mz9hL5CVSC8OkGZbHkWh/crynVFj/wrqumikxz3WfMlQmCPpQVAVwad05IN
 arDvU5BOk+QfB/3SfCelajEhWjGqvFZsTJ4sWXBgTYNalcL9sIImcBPR/Hh7pMtnRwO793
 TZwoIbZrfadQMUvBiQyk/zwyNyv+KPA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-314-YoiuzckoMCS3tElOSEXEcw-1; Fri, 18 Mar 2022 14:38:50 -0400
X-MC-Unique: YoiuzckoMCS3tElOSEXEcw-1
Received: by mail-wm1-f71.google.com with SMTP id
 c126-20020a1c3584000000b00380dee8a62cso3370153wma.8
 for <qemu-devel@nongnu.org>; Fri, 18 Mar 2022 11:38:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=q9vq172mxRtwNwXTPUzfXS+pDY5DpYB6lzoEZz6DQog=;
 b=Y78qXDRbi//uzgpV+aeLGzjTBFjYa/8K3cNxTcr3vqaLafueT+lfnXVPmTbVpJL43/
 QRry7ejJuTCtFyTRDj4MFSnXEgNr7TRSHQjLBmStvqq83eZAD2uY5MFw0lKxQdirNXrs
 NKNXkAEGYPQ9KrC7TYzRdLQjgcStvsSG0gbFJFrtFbWQOzGb3f6uqlGCpJ+BwyAMu0MS
 chPywgfocKWJbJ1mvmX673mPPUUiqvj+Jcb1TOVScC60tqUzu0q82PSILz1NdcMNpeXT
 p6qcyp5x05ZUjA1icm0gX/5hy/52mhbp61PG6Uxgyd6mrzpgSiXnaITxRLa07HigfJdw
 BDfw==
X-Gm-Message-State: AOAM533IMbssNPloub9p85+oVO1zymJuAbB98bMmZ1VFbBBrc/tX6xzi
 ayB5AcZKXdMDUp7ZwQvac65g6NPj+ZZX6sQuyL/2+Jx5D2AQznC+JJcn5AWlLzqqeVG+/kpfGO5
 bfkaKiOjqAWHRy08sD29Dn36XxANvxUp/mC0G8C5Lq594MWYYngReULPUj/2mJWE=
X-Received: by 2002:a05:6000:128f:b0:1f1:e586:87af with SMTP id
 f15-20020a056000128f00b001f1e58687afmr9120468wrx.222.1647628729298; 
 Fri, 18 Mar 2022 11:38:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy/WrueNBOMSvMNqRIlQWfOVeucsUNsd/EP/ADs2DHhGpdZ+C+DGdXT/G3BAzKksek+kF8UlQ==
X-Received: by 2002:a05:6000:128f:b0:1f1:e586:87af with SMTP id
 f15-20020a056000128f00b001f1e58687afmr9120417wrx.222.1647628728745; 
 Fri, 18 Mar 2022 11:38:48 -0700 (PDT)
Received: from [192.168.8.104] (tmo-098-218.customers.d1-online.com.
 [80.187.98.218]) by smtp.gmail.com with ESMTPSA id
 o12-20020adfa10c000000b001efb97fae48sm7178268wro.80.2022.03.18.11.38.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Mar 2022 11:38:47 -0700 (PDT)
Message-ID: <cdf34ed8-a6bc-946f-a254-4b736fff3ff1@redhat.com>
Date: Fri, 18 Mar 2022 19:38:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [RFC PATCH 2/3] hw/sd/sdhci: Prohibit DMA accesses to devices
To: qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philippe.mathieu.daude@gmail.com>,
 Bin Meng <bin.meng@windriver.com>
References: <20211215205656.488940-1-philmd@redhat.com>
 <20211215205656.488940-3-philmd@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20211215205656.488940-3-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 David Hildenbrand <david@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Li Qiang <liq3ea@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Peter Xu <peterx@redhat.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Darren Kenny <darren.kenny@oracle.com>, Bandan Das <bsd@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Alexander Bulekov <alxndr@bu.edu>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15/12/2021 21.56, Philippe Mathieu-Daudé wrote:
> From: Philippe Mathieu-Daudé <f4bug@amsat.org>
> 
> The issue reported by OSS-Fuzz produces the following backtrace:
> 
>    ==447470==ERROR: AddressSanitizer: heap-buffer-overflow
>    READ of size 1 at 0x61500002a080 thread T0
>        #0 0x71766d47 in sdhci_read_dataport hw/sd/sdhci.c:474:18
>        #1 0x7175f139 in sdhci_read hw/sd/sdhci.c:1022:19
>        #2 0x721b937b in memory_region_read_accessor softmmu/memory.c:440:11
>        #3 0x72171e51 in access_with_adjusted_size softmmu/memory.c:554:18
>        #4 0x7216f47c in memory_region_dispatch_read1 softmmu/memory.c:1424:16
>        #5 0x7216ebb9 in memory_region_dispatch_read softmmu/memory.c:1452:9
>        #6 0x7212db5d in flatview_read_continue softmmu/physmem.c:2879:23
>        #7 0x7212f958 in flatview_read softmmu/physmem.c:2921:12
>        #8 0x7212f418 in address_space_read_full softmmu/physmem.c:2934:18
>        #9 0x721305a9 in address_space_rw softmmu/physmem.c:2962:16
>        #10 0x7175a392 in dma_memory_rw_relaxed include/sysemu/dma.h:89:12
>        #11 0x7175a0ea in dma_memory_rw include/sysemu/dma.h:132:12
>        #12 0x71759684 in dma_memory_read include/sysemu/dma.h:152:12
>        #13 0x7175518c in sdhci_do_adma hw/sd/sdhci.c:823:27
>        #14 0x7174bf69 in sdhci_data_transfer hw/sd/sdhci.c:935:13
>        #15 0x7176aaa7 in sdhci_send_command hw/sd/sdhci.c:376:9
>        #16 0x717629ee in sdhci_write hw/sd/sdhci.c:1212:9
>        #17 0x72172513 in memory_region_write_accessor softmmu/memory.c:492:5
>        #18 0x72171e51 in access_with_adjusted_size softmmu/memory.c:554:18
>        #19 0x72170766 in memory_region_dispatch_write softmmu/memory.c:1504:16
>        #20 0x721419ee in flatview_write_continue softmmu/physmem.c:2812:23
>        #21 0x721301eb in flatview_write softmmu/physmem.c:2854:12
>        #22 0x7212fca8 in address_space_write softmmu/physmem.c:2950:18
>        #23 0x721d9a53 in qtest_process_command softmmu/qtest.c:727:9
> 
> A DMA descriptor is previously filled in RAM. An I/O access to the
> device (frames #22 to #16) start the DMA engine (frame #13). The
> engine fetch the descriptor and execute the request, which itself
> accesses the SDHCI I/O registers (frame #1 and #0), triggering a
> re-entrancy issue.
> 
> Fix by prohibit transactions from the DMA to devices. The DMA engine
> is thus restricted to memories.
> 
> Reported-by: OSS-Fuzz (Issue 36391)
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/451
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   hw/sd/sdhci.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
> index fe2f21f0c37..0e5e988927e 100644
> --- a/hw/sd/sdhci.c
> +++ b/hw/sd/sdhci.c
> @@ -741,6 +741,7 @@ static void sdhci_do_adma(SDHCIState *s)
>   {
>       unsigned int begin, length;
>       const uint16_t block_size = s->blksize & BLOCK_SIZE_MASK;
> +    const MemTxAttrs attrs = { .memory = true };
>       ADMADescr dscr = {};
>       MemTxResult res;
>       int i;
> @@ -794,7 +795,7 @@ static void sdhci_do_adma(SDHCIState *s)
>                       res = dma_memory_write(s->dma_as, dscr.addr,
>                                              &s->fifo_buffer[begin],
>                                              s->data_count - begin,
> -                                           MEMTXATTRS_UNSPECIFIED);
> +                                           attrs);
>                       if (res != MEMTX_OK) {
>                           break;
>                       }
> @@ -823,7 +824,7 @@ static void sdhci_do_adma(SDHCIState *s)
>                       res = dma_memory_read(s->dma_as, dscr.addr,
>                                             &s->fifo_buffer[begin],
>                                             s->data_count - begin,
> -                                          MEMTXATTRS_UNSPECIFIED);
> +                                          attrs);
>                       if (res != MEMTX_OK) {
>                           break;
>                       }

Looks sane to me!

Reviewed-by: Thomas Huth <thuth@redhat.com>


