Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EECB5386E6
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 19:50:46 +0200 (CEST)
Received: from localhost ([::1]:38804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvjXR-0007y3-J7
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 13:50:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nvi6v-00016x-01
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:19:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49281)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nvi6r-0000rq-Si
 for qemu-devel@nongnu.org; Mon, 30 May 2022 12:19:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653927552;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=reeTFjPfcGxM5qCZXDGkw4pRoE/g40A9zlNawePOM5g=;
 b=c2ctPCC/3ywx+DrIjOjNT1Yqe/MleORx9AHqC/IEpj4u/WyQsQG4koj5JXnrfBCoiJP9rk
 OJvSimpvQExiKwZTiX3LQ4dDFhfxApOzePJ8GLdcjITYSR0q59KxNY8v3utOGTC7rPhYVP
 iu0VNYir7VyUT35FFYWoyhZjAsPnWd8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-325-Vp4N3IDxN26k5lKEf_W3Yg-1; Mon, 30 May 2022 12:19:11 -0400
X-MC-Unique: Vp4N3IDxN26k5lKEf_W3Yg-1
Received: by mail-wm1-f72.google.com with SMTP id
 k16-20020a7bc310000000b0038e6cf00439so7239470wmj.0
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 09:19:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=reeTFjPfcGxM5qCZXDGkw4pRoE/g40A9zlNawePOM5g=;
 b=WGw47Q/MlFLEj3NY9We0XMUvPY+4k6+TzY2KMLFW6xxY9opiOlIghKTgNXEt+9ojww
 12P8ValfY+ebMCO69x8rf3eFfFzl1V34eWO7ArNhwM/xHrECmWdNHmVBdc52TNvS4Sre
 Dg3dqY3LEPVSOYl8sJdfDBjzCbhDkUo4AcGMuByWNX3kHeH7usJjGMcTBMglrQT52z3V
 qMu6Fua5V21k1lmQFlgZQCD00VRltBAiWIyiix2ZWPzhRgZaV0DnMn4/9ZE24X85KEm6
 RklT5IobSLcqUDAb96BgEoNALUGCoAjjqDYpSv/IR/SZO8hCNypc5QdZ6dtvTzxFbaQc
 esXQ==
X-Gm-Message-State: AOAM531BcLcPFPtR3+SPpHGmDsXkbW20X2Ag+Acnb5bgqi8Jv0/ULztc
 KIccYxaq7+YSHr9/u51b3nw/rDVeV4eCYkRsGReSB8VTwBhzUwMqw5Pb2InTfyzo2Y16dgk7wkG
 By4p+paLMvTw52mw=
X-Received: by 2002:adf:e5d0:0:b0:210:313a:e4dc with SMTP id
 a16-20020adfe5d0000000b00210313ae4dcmr6031822wrn.152.1653927549926; 
 Mon, 30 May 2022 09:19:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyqGtfF9F4eNBgcQ/XNOyH1YvEKh8L/HplQ5OKWscnamJfpHeIoUGbX/OONHlQNYlvFX8qBDw==
X-Received: by 2002:adf:e5d0:0:b0:210:313a:e4dc with SMTP id
 a16-20020adfe5d0000000b00210313ae4dcmr6031802wrn.152.1653927549666; 
 Mon, 30 May 2022 09:19:09 -0700 (PDT)
Received: from ?IPV6:2003:cb:c704:7c00:aaa9:2ce5:5aa0:f736?
 (p200300cbc7047c00aaa92ce55aa0f736.dip0.t-ipconnect.de.
 [2003:cb:c704:7c00:aaa9:2ce5:5aa0:f736])
 by smtp.gmail.com with ESMTPSA id
 i67-20020a1c3b46000000b003944821105esm257616wma.2.2022.05.30.09.19.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 May 2022 09:19:09 -0700 (PDT)
Message-ID: <b675b817-7b7c-06ee-b971-3df2d7374622@redhat.com>
Date: Mon, 30 May 2022 18:19:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [RESEND PATCH] hw/dma: fix crash caused by race condition
Content-Language: en-US
To: Tong Zhang <t.zhang2@samsung.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Xu <peterx@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: "ztong0001@gmail.com" <ztong0001@gmail.com>,
 Francisco Londono <f.londono@samsung.com>
References: <CGME20220427205118uscas1p25031437c0cdd4363c104be13033f366a@uscas1p2.samsung.com>
 <20220427205056.2522-1-t.zhang2@samsung.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220427205056.2522-1-t.zhang2@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On 27.04.22 22:51, Tong Zhang wrote:
> assert(dbs->acb) is meant to check the return value of io_func per
> documented in commit 6bee44ea34 ("dma: the passed io_func does not
> return NULL"). However, there is a chance that after calling
> aio_context_release(dbs->ctx); the dma_blk_cb function is called before
> the assertion and dbs->acb is set to NULL again at line 121. Thus when
> we run assert at line 181 it will fail.
> 
>   softmmu/dma-helpers.c:181: dma_blk_cb: Assertion `dbs->acb' failed.
> 
> Reported-by: Francisco Londono <f.londono@samsung.com>
> Signed-off-by: Tong Zhang <t.zhang2@samsung.com>
> ---
>  softmmu/dma-helpers.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/softmmu/dma-helpers.c b/softmmu/dma-helpers.c
> index 7820fec54c..cb81017928 100644
> --- a/softmmu/dma-helpers.c
> +++ b/softmmu/dma-helpers.c
> @@ -177,8 +177,8 @@ static void dma_blk_cb(void *opaque, int ret)
>      aio_context_acquire(dbs->ctx);
>      dbs->acb = dbs->io_func(dbs->offset, &dbs->iov,
>                              dma_blk_cb, dbs, dbs->io_func_opaque);
> -    aio_context_release(dbs->ctx);
>      assert(dbs->acb);
> +    aio_context_release(dbs->ctx);
>  }
>  
>  static void dma_aio_cancel(BlockAIOCB *acb)

I'm fairly new to that code, but I wonder what prevents dma_blk_cb() to
run after you reshuffled the code?

After all, acquire/release is only around the dbs->io_func() call, so I
don't immediately see how it interacts with re-entrance?

-- 
Thanks,

David / dhildenb


