Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D0E04820EE
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Dec 2021 01:02:09 +0100 (CET)
Received: from localhost ([::1]:58686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n35N1-00038t-S1
	for lists+qemu-devel@lfdr.de; Thu, 30 Dec 2021 19:02:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n35Kk-0001uV-Um
 for qemu-devel@nongnu.org; Thu, 30 Dec 2021 18:59:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40724)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n35Kh-000883-2o
 for qemu-devel@nongnu.org; Thu, 30 Dec 2021 18:59:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640908782;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T0aqbBO4A4CfthvoAFbzPMw5dZcVweXSodcj5CEqHvM=;
 b=BwmUKwiZTZcVIt1rB6KHa6AJOryQsaFPkU0qYgmqqIIC+k8AqH1VNp97kM/6mic66WxOsX
 RdUF1DQ4X41fBo+HfxnaoLCUiA6Hw+HsjMfF8OadZ4VRCca8NlpQUWQ09j2iawIocDKdDh
 llHQOkd2pP9eGry3jPDgZcyUtkakCKc=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-26-w8Lf8RNINqGEs3B7fRhXeQ-1; Thu, 30 Dec 2021 18:59:41 -0500
X-MC-Unique: w8Lf8RNINqGEs3B7fRhXeQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 dz8-20020a0564021d4800b003f897935eb3so17992573edb.12
 for <qemu-devel@nongnu.org>; Thu, 30 Dec 2021 15:59:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=T0aqbBO4A4CfthvoAFbzPMw5dZcVweXSodcj5CEqHvM=;
 b=BN5npW3qtceFEwslb9QQkArM+qh7ovN9evdFR7qZ3TKJgH7n+eDI0P3+EODkFXpaDH
 3ojuNyPnXzkOiWzQEFT8DjspzWkdcPFENUvmpbg7Kkung2oNTpgQSNbjdIdi+MwZ+i2H
 LDGxaN8Q95IRb/fe+jHsGXvjNipZ4wmGPXUcd7v1NcFOdd1HFMuJH7d2MJLx180eQUdC
 N/4aMRGQSHsLy2SnmdUVFYyTCZ8YEd/fdsJJ6oWDY4JGak9I/lLTVMxeKgaa84wlk27K
 O8SVlkcLsazg6BNgXHToXGY6zINbRWlWmhvCue0eK2DMkN84AkTWMSR/bCtkqL3TG7oJ
 KsRA==
X-Gm-Message-State: AOAM533elcEmqeFZEhCSCjeRHVQkAYdsBwc3OYoiXU3DM0qlrCaZwQsi
 wKfKoM+TSillU7ui6gwxvfkzfaMFVQipLR7oiTeA+smX5vNeJ2XtLOOluWxKGD9wE88lGYrkOwx
 FcAkq2ui2FJXlvJgoVw97fkv3ROx47ulZYix1fVNJxU9C866PLklsQVH+wbYDvam5
X-Received: by 2002:a17:906:c14a:: with SMTP id
 dp10mr28295751ejc.294.1640908779843; 
 Thu, 30 Dec 2021 15:59:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzNMLRF2CIDJBr0I8IJDkJcoZ7+c+tgLaaSqFl+Nbz7drALXHd+xw3jcglrdYvesUEbgKUEmQ==
X-Received: by 2002:a17:906:c14a:: with SMTP id
 dp10mr28295697ejc.294.1640908779508; 
 Thu, 30 Dec 2021 15:59:39 -0800 (PST)
Received: from [192.168.1.36] (26.red-83-50-86.dynamicip.rima-tde.net.
 [83.50.86.26])
 by smtp.gmail.com with ESMTPSA id cf27sm4447444edb.74.2021.12.30.15.59.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Dec 2021 15:59:39 -0800 (PST)
Message-ID: <7e18cc6a-ad77-0134-90b4-2b6294a45e02@redhat.com>
Date: Fri, 31 Dec 2021 00:59:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2 14/23] dma: Let dma_buf_read() / dma_buf_write()
 propagate MemTxResult
To: qemu-devel@nongnu.org
References: <20211223115554.3155328-1-philmd@redhat.com>
 <20211223115554.3155328-15-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211223115554.3155328-15-philmd@redhat.com>
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, David Hildenbrand <david@redhat.com>,
 Peter Xu <peterx@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Sven Schnelle <svens@stackframe.org>, Hannes Reinecke <hare@suse.com>,
 qemu-block@nongnu.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Havard Skinnemoen <hskinnemoen@google.com>, Joel Stanley <joel@jms.id.au>,
 Stefan Weil <sw@weilnetz.de>, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Beniamino Galvani <b.galvani@gmail.com>, Eric Auger <eric.auger@redhat.com>,
 qemu-arm@nongnu.org, Jan Kiszka <jan.kiszka@web.de>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Keith Busch <kbusch@kernel.org>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Eduardo Habkost <eduardo@habkost.net>, Andrew Jeffery <andrew@aj.id.au>,
 Klaus Jensen <k.jensen@samsung.com>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Tyrone Ting <kfting@nuvoton.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/23/21 12:55, Philippe Mathieu-Daudé wrote:
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
>  include/sysemu/dma.h  |  6 ++++--
>  hw/ide/ahci.c         |  8 ++++----
>  hw/nvme/ctrl.c        |  4 ++--
>  hw/scsi/megasas.c     | 48 ++++++++++++++++++++++++++++++-------------
>  hw/scsi/scsi-bus.c    |  4 ++--
>  softmmu/dma-helpers.c | 18 ++++++----------
>  6 files changed, 52 insertions(+), 36 deletions(-)
> 
> diff --git a/include/sysemu/dma.h b/include/sysemu/dma.h
> index fd8f16003dd..d11c1d794f9 100644
> --- a/include/sysemu/dma.h
> +++ b/include/sysemu/dma.h
> @@ -302,8 +302,10 @@ BlockAIOCB *dma_blk_read(BlockBackend *blk,
>  BlockAIOCB *dma_blk_write(BlockBackend *blk,
>                            QEMUSGList *sg, uint64_t offset, uint32_t align,
>                            BlockCompletionFunc *cb, void *opaque);
> -uint64_t dma_buf_read(void *ptr, int32_t len, QEMUSGList *sg, MemTxAttrs attrs);
> -uint64_t dma_buf_write(void *ptr, int32_t len, QEMUSGList *sg, MemTxAttrs attrs);
> +MemTxResult dma_buf_read(void *ptr, int32_t len, uint64_t *residp,
> +                         QEMUSGList *sg, MemTxAttrs attrs);
> +MemTxResult dma_buf_write(void *ptr, int32_t len, uint64_t *residp,
> +                          QEMUSGList *sg, MemTxAttrs attrs);
>  

This fails on 32-bit host when passing a size_t variable as residp
argument. I'll work a "clean" fix later. Meanwhile discarding this
patch.

> diff --git a/softmmu/dma-helpers.c b/softmmu/dma-helpers.c
> index b0be1564797..498303157e9 100644
> --- a/softmmu/dma-helpers.c
> +++ b/softmmu/dma-helpers.c
> @@ -321,22 +321,16 @@ static MemTxResult dma_buf_rw(void *buf, int32_t len, uint64_t *residp,
>      return res;
>  }
>  
> -uint64_t dma_buf_read(void *ptr, int32_t len, QEMUSGList *sg, MemTxAttrs attrs)
> +MemTxResult dma_buf_read(void *ptr, int32_t len, uint64_t *residp,
> +                         QEMUSGList *sg, MemTxAttrs attrs)
>  {
> -    uint64_t resid;
> -
> -    dma_buf_rw(ptr, len, &resid, sg, DMA_DIRECTION_FROM_DEVICE, attrs);
> -
> -    return resid;
> +    return dma_buf_rw(ptr, len, residp, sg, DMA_DIRECTION_FROM_DEVICE, attrs);
>  }
>  
> -uint64_t dma_buf_write(void *ptr, int32_t len, QEMUSGList *sg, MemTxAttrs attrs)
> +MemTxResult dma_buf_write(void *ptr, int32_t len, uint64_t *residp,
> +                          QEMUSGList *sg, MemTxAttrs attrs)
>  {
> -    uint64_t resid;
> -
> -    dma_buf_rw(ptr, len, &resid, sg, DMA_DIRECTION_TO_DEVICE, attrs);
> -
> -    return resid;
> +    return dma_buf_rw(ptr, len, residp, sg, DMA_DIRECTION_TO_DEVICE, attrs);
>  }
>  
>  void dma_acct_start(BlockBackend *blk, BlockAcctCookie *cookie,


