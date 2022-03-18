Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 923AD4DE121
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 19:37:43 +0100 (CET)
Received: from localhost ([::1]:39790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVHTq-0005VO-4y
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 14:37:42 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nVHS9-00048U-KH
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 14:35:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32730)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nVHS4-0003lL-QZ
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 14:35:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647628547;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vdJ4W8rN8QSBpfYdvlh21/MMF776llFydmTZ8icpDII=;
 b=PQy3ie2i5vChQQ6/oW94zNNKE0oHHdn8YYmOrj7r+gyzUang2edTuDRs/O9mf0Ll63+8lB
 lOvQIy0w0OMztuGuOdXpth0+kxDX81HxJ0nS0Kj0We0wA9NqkCNlZOf+OnP9n9mbgWSHmO
 +qYDezrRhrCLSnD75k3+NqcQhhf9FUU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-115-TdPC1s2sPYaNbXYMDDS7gQ-1; Fri, 18 Mar 2022 14:35:46 -0400
X-MC-Unique: TdPC1s2sPYaNbXYMDDS7gQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 h127-20020a1c2185000000b0038c6f7e22a4so4207942wmh.9
 for <qemu-devel@nongnu.org>; Fri, 18 Mar 2022 11:35:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=vdJ4W8rN8QSBpfYdvlh21/MMF776llFydmTZ8icpDII=;
 b=tfJV180cvUz6lx7hJklY1KLZBYiL5T9RYp18rZRJBfni5tj0eDckBSSFcB+bfjIL9+
 3pVERIo8KE8cKKZuQwMdkkllA+IflwoS1CqeR/w/kY4PLr0jOdzcHgSnq+fFnBfclm2S
 g7xvPFlrDl9Gk6fcDgSGFapFlc7d1PRJzej5m/R0BMPuz/YIKpouLVFhBIUd6tuBu4QY
 9b7St6FFqsqUJSsvav4AyVGP+UYNWOMw8BnuXQxhoZmdFFLZgXC3lSRMIduUIQill5zW
 9vAYX4XYlju8WdMkXkMOWipv4tBxg3nR/PTtr5uxBKftTC8K10KqkY8k8OIm8Bi1Edis
 ijCg==
X-Gm-Message-State: AOAM532NbExVOLdyP7hqrkcmTc2vtvwoXuBHu1vbuq8wVNlSIMww9iP2
 m9SeLAYwhp9FOXUsO3yM2SiBlhCig8gCoJhaqVha//5shuf2rZGZabB37I9bh3fZNzzuqvqrq94
 LyOM3f+OVNTU4o3RzHEyIJFgk7JmnE9Hvk43y3XD6O2Gmxd4PROsNNY/sL1m3wmk=
X-Received: by 2002:a7b:c40f:0:b0:389:f3ad:5166 with SMTP id
 k15-20020a7bc40f000000b00389f3ad5166mr9188393wmi.63.1647628544924; 
 Fri, 18 Mar 2022 11:35:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzhLKUx4ZMIGMkZUdtLO6tr0xt/NTfA8yla/kpyVF7/FEZKEIEjAeixNF99s4C7eyVVEnJmRA==
X-Received: by 2002:a7b:c40f:0:b0:389:f3ad:5166 with SMTP id
 k15-20020a7bc40f000000b00389f3ad5166mr9188350wmi.63.1647628544425; 
 Fri, 18 Mar 2022 11:35:44 -0700 (PDT)
Received: from [192.168.8.104] (tmo-098-218.customers.d1-online.com.
 [80.187.98.218]) by smtp.gmail.com with ESMTPSA id
 j17-20020a05600c191100b00389a1a68b95sm19426377wmq.27.2022.03.18.11.35.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Mar 2022 11:35:43 -0700 (PDT)
Message-ID: <44a2aec2-93ea-ab57-e1b1-2a47bd91e262@redhat.com>
Date: Fri, 18 Mar 2022 19:35:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [RFC PATCH 1/3] hw/sd/sdhci: Honor failed DMA transactions
To: qemu-devel@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, Bin Meng <bin.meng@windriver.com>
References: <20211215205656.488940-1-philmd@redhat.com>
 <20211215205656.488940-2-philmd@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20211215205656.488940-2-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
> DMA transactions might fail. The DMA API returns a MemTxResult,
> indicating such failures. Do not ignore it. On failure, raise
> the ADMA error flag and eventually triggering an IRQ (see spec
> chapter 1.13.5: "ADMA2 States").
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   hw/sd/sdhci.c | 34 +++++++++++++++++++++++++---------
>   1 file changed, 25 insertions(+), 9 deletions(-)
> 
> diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
> index e0bbc903446..fe2f21f0c37 100644
> --- a/hw/sd/sdhci.c
> +++ b/hw/sd/sdhci.c
> @@ -742,6 +742,7 @@ static void sdhci_do_adma(SDHCIState *s)
>       unsigned int begin, length;
>       const uint16_t block_size = s->blksize & BLOCK_SIZE_MASK;
>       ADMADescr dscr = {};
> +    MemTxResult res;
>       int i;
>   
>       if (s->trnmod & SDHC_TRNS_BLK_CNT_EN && !s->blkcnt) {
> @@ -790,10 +791,13 @@ static void sdhci_do_adma(SDHCIState *s)
>                           s->data_count = block_size;
>                           length -= block_size - begin;
>                       }
> -                    dma_memory_write(s->dma_as, dscr.addr,
> -                                     &s->fifo_buffer[begin],
> -                                     s->data_count - begin,
> -                                     MEMTXATTRS_UNSPECIFIED);
> +                    res = dma_memory_write(s->dma_as, dscr.addr,
> +                                           &s->fifo_buffer[begin],
> +                                           s->data_count - begin,
> +                                           MEMTXATTRS_UNSPECIFIED);
> +                    if (res != MEMTX_OK) {
> +                        break;
> +                    }
>                       dscr.addr += s->data_count - begin;
>                       if (s->data_count == block_size) {
>                           s->data_count = 0;
> @@ -816,10 +820,13 @@ static void sdhci_do_adma(SDHCIState *s)
>                           s->data_count = block_size;
>                           length -= block_size - begin;
>                       }
> -                    dma_memory_read(s->dma_as, dscr.addr,
> -                                    &s->fifo_buffer[begin],
> -                                    s->data_count - begin,
> -                                    MEMTXATTRS_UNSPECIFIED);
> +                    res = dma_memory_read(s->dma_as, dscr.addr,
> +                                          &s->fifo_buffer[begin],
> +                                          s->data_count - begin,
> +                                          MEMTXATTRS_UNSPECIFIED);
> +                    if (res != MEMTX_OK) {
> +                        break;
> +                    }
>                       dscr.addr += s->data_count - begin;
>                       if (s->data_count == block_size) {
>                           sdbus_write_data(&s->sdbus, s->fifo_buffer, block_size);
> @@ -833,7 +840,16 @@ static void sdhci_do_adma(SDHCIState *s)
>                       }
>                   }
>               }
> -            s->admasysaddr += dscr.incr;
> +            if (res != MEMTX_OK) {
> +                if (s->errintstsen & SDHC_EISEN_ADMAERR) {
> +                    trace_sdhci_error("Set ADMA error flag");
> +                    s->errintsts |= SDHC_EIS_ADMAERR;
> +                    s->norintsts |= SDHC_NIS_ERR;
> +                }
> +                sdhci_update_irq(s);
> +            } else {
> +                s->admasysaddr += dscr.incr;
> +            }
>               break;
>           case SDHC_ADMA_ATTR_ACT_LINK:   /* link to next descriptor table */
>               s->admasysaddr = dscr.addr;

Patch looks sane to me:

Reviewed-by: Thomas Huth <thuth@redhat.com>

Are you still considering it or did you drop this from your TODO list? 
(since it was just marked as RFC?)

  Thomas


