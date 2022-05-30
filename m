Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE9205382A5
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 16:36:48 +0200 (CEST)
Received: from localhost ([::1]:46332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvgVj-0001UJ-VM
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 10:36:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvgTC-0000j8-CC
 for qemu-devel@nongnu.org; Mon, 30 May 2022 10:34:10 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:34012)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvgTA-0000lh-QN
 for qemu-devel@nongnu.org; Mon, 30 May 2022 10:34:10 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 nn3-20020a17090b38c300b001e0e091cf03so69561pjb.1
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 07:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=WFtoBP3iaBSWIVsrIpkUpGqBsIHmASmMhyBDoaai1TQ=;
 b=Mvbt5IIQiUd0hMcLL12tyeJ8NLMC5ZIMVAE2lfwkoFU5b8OfR/B5vYEVGX369exl90
 rdmBWLyxMvBqZ9gadAXMsxVSylXfepgK22HNVcU44evGd9hc7mDm3g7sd2eoEGnWQIr5
 eRBHrqcar5S3T5ZmjN1Vi0QpemVNsL35NdnoOYy5O/pBBqQJt3hOkpcNCRysRNumCmjJ
 8YlCHYI2fcYvl/kerVYiuWnafXm8JgtyRwOlBcMWoVaiz8AdH8A37m2c+aJzAGyIRucK
 /eVn9dgh9oBK2KuJJtjPTO2HjbQTaiFVnF+h/rvhz6idtpjL5mR1rAmCoEDa+GjmSBcJ
 axLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=WFtoBP3iaBSWIVsrIpkUpGqBsIHmASmMhyBDoaai1TQ=;
 b=IBbyQujsl03Xarz/aiTrSj4fyiBR9hvyr/RgLlgyeZ3GYipyy3nSFPIWOtQ3HLX6iz
 rta/bQzYGrdgAkd3Y0qsQ84swpaJuKyZZvNWs9fIH+OAqVQ8lyycczomoe331EgENXpB
 xXuNQH9GQbSKSMpuK8FAg+TXFrAcVy4gD9OgV2rVvOdeVm6ZUyfT+P9Dl2f3v/xc8rCs
 abuZhlx7jb+nbC32uxEIP1P0JhsBtqrIS/kXPNm9ZiFhajQmtDlTK/0wNP6sn9m9vVO6
 8ipEibHcULzBSJxkZCVAd86N4DZz1fJXA05fgw6fQIQ9BPgozemSlHxvd0z+onvOBdPP
 UpEw==
X-Gm-Message-State: AOAM531qGwwxwVdOH06atF13KObeNlknSz+T0Ga/7pigo+Fy0zXXrG9S
 X8IYeeHODDAQC9okk2nJkj0252qOd1s=
X-Google-Smtp-Source: ABdhPJzU2ZO3sftnJNAaJSuBYnQrPvZIiuVwb8qc0OzRGrfWftBbnHOV5qfhHB/ngmzBd2W/hPalsQ==
X-Received: by 2002:a17:902:9f8e:b0:163:bda9:ccb1 with SMTP id
 g14-20020a1709029f8e00b00163bda9ccb1mr10372170plq.124.1653921247199; 
 Mon, 30 May 2022 07:34:07 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 b15-20020a17090a10cf00b001dd11e4b927sm5839320pje.39.2022.05.30.07.34.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 May 2022 07:34:06 -0700 (PDT)
Message-ID: <021746df-c8d0-d93f-5844-8c8fc8afab2f@amsat.org>
Date: Mon, 30 May 2022 16:34:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.1
Subject: Re: [RESEND PATCH] hw/dma: fix crash caused by race condition
Content-Language: en-US
To: Tong Zhang <t.zhang2@samsung.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Xu <peterx@redhat.com>, David Hildenbrand <david@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: "ztong0001@gmail.com" <ztong0001@gmail.com>,
 Francisco Londono <f.londono@samsung.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>
References: <CGME20220427205118uscas1p25031437c0cdd4363c104be13033f366a@uscas1p2.samsung.com>
 <20220427205056.2522-1-t.zhang2@samsung.com>
In-Reply-To: <20220427205056.2522-1-t.zhang2@samsung.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

+Emanuele / Alexander / Stefan

On 27/4/22 22:51, Tong Zhang wrote:
> assert(dbs->acb) is meant to check the return value of io_func per
> documented in commit 6bee44ea34 ("dma: the passed io_func does not
> return NULL"). However, there is a chance that after calling
> aio_context_release(dbs->ctx); the dma_blk_cb function is called before
> the assertion and dbs->acb is set to NULL again at line 121. Thus when
> we run assert at line 181 it will fail.
> 
>    softmmu/dma-helpers.c:181: dma_blk_cb: Assertion `dbs->acb' failed.
> 
> Reported-by: Francisco Londono <f.londono@samsung.com>
> Signed-off-by: Tong Zhang <t.zhang2@samsung.com>
> ---
>   softmmu/dma-helpers.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/softmmu/dma-helpers.c b/softmmu/dma-helpers.c
> index 7820fec54c..cb81017928 100644
> --- a/softmmu/dma-helpers.c
> +++ b/softmmu/dma-helpers.c
> @@ -177,8 +177,8 @@ static void dma_blk_cb(void *opaque, int ret)
>       aio_context_acquire(dbs->ctx);
>       dbs->acb = dbs->io_func(dbs->offset, &dbs->iov,
>                               dma_blk_cb, dbs, dbs->io_func_opaque);
> -    aio_context_release(dbs->ctx);
>       assert(dbs->acb);
> +    aio_context_release(dbs->ctx);
>   }
>   
>   static void dma_aio_cancel(BlockAIOCB *acb)


