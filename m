Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24D226E9DAB
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 23:09:17 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppbVP-00004u-Lz; Thu, 20 Apr 2023 17:07:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ppbVN-0008WS-II
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 17:07:49 -0400
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ppbVL-0000qy-DF
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 17:07:48 -0400
Received: by mail-ot1-x331.google.com with SMTP id
 46e09a7af769-6a5d9853d97so566096a34.2
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 14:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682024865; x=1684616865;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/LRoAAglM5ULHMNGaZv7PVM8tE/5EL93ZZeuN9cZADs=;
 b=CN+gbunFh6l4vfGNx9NLDZUGNTpqgPTV4BklVKdKDwYGStIgrdedNWzZnyh20UZmNS
 vGgvl38unlQ9BpZabw14xT8MP3O2unW01JzwqSIjpg09UgCF/UBYLvKm3GSHxgvZnQNh
 QDfMpBIsA9/5vs8A+NJKTEForUs3kk2GeXY7KFOjDqrorN8NRMWov8qag4zb7psVewfV
 1ymyp7CNBwaUyJDQs5gLpoS1M/ohQetPxsfQhDx9thu8J841BJIiTtYn6PCPnZpTx5IK
 6njs3i4uNrTwydvSP3UVHcTlje6s6esoQssCUdne9Mu1Putlwm/v5OtxAlY1UaquzB9U
 jk1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682024865; x=1684616865;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/LRoAAglM5ULHMNGaZv7PVM8tE/5EL93ZZeuN9cZADs=;
 b=EL7/WhTZFNYMDZT7hBe8J/VGWFB8PWI8jfvhEr4p4vfHZPZ5MWaLitKgzfMQVt571R
 U3alIsbAUuyndrB/Pbk2AQEa8fNWto332zlPyxNZwT4vK7jLC/ht9zjDE9LrsI1S3dlw
 7Hk5eaoXAAw2AU5EB/wRCe4G+m0sGUouUjiS2FTEBM61XOx+frV+TSQr9B0BIAEgykDV
 nbPPQVoPryDPF4aLLqHlKIoIIzS2IonAbK/Dms/haCd0X9l3t5zsjUf7XhYecdVpzBj9
 ZuCcdUO3Jl9xVUvfVHjL3W6yutXvQIApSR8ynBvtdQiC8NPl5mrSOTt/Ag+QvnjOW7td
 r0hg==
X-Gm-Message-State: AAQBX9e1GJBofFVlmk8zxJe0ydmwFJe8enhOSxOuHkGWSnLalNIt7bck
 o/Q/9J0e8emMqcsXsTIMBCE=
X-Google-Smtp-Source: AKy350YmuBaKralkfncCmVQ5MGbxsowRddE8E0HVAsoAAkW7xNVAoJR+w5hGppo8skdIC4LWjOgGAA==
X-Received: by 2002:a05:6870:f292:b0:187:fee8:bb0e with SMTP id
 u18-20020a056870f29200b00187fee8bb0emr1898185oap.57.1682024865736; 
 Thu, 20 Apr 2023 14:07:45 -0700 (PDT)
Received: from [192.168.68.107] ([191.255.108.232])
 by smtp.gmail.com with ESMTPSA id
 z6-20020a056870e14600b0018b182ce317sm1135997oaa.55.2023.04.20.14.07.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Apr 2023 14:07:45 -0700 (PDT)
Message-ID: <8595e336-85ae-592e-8447-f1429719a8a7@gmail.com>
Date: Thu, 20 Apr 2023 18:07:41 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] async: Suppress GCC13 false positive in aio_bh_poll()
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>, 
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20230420202939.1982044-1-clg@kaod.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20230420202939.1982044-1-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::331;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x331.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-1.669,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



On 4/20/23 17:29, Cédric Le Goater wrote:
> From: Cédric Le Goater <clg@redhat.com>
> 
> GCC13 reports an error :
> 
> ../util/async.c: In function ‘aio_bh_poll’:
> include/qemu/queue.h:303:22: error: storing the address of local variable ‘slice’ in ‘*ctx.bh_slice_list.sqh_last’ [-Werror=dangling-pointer=]
>    303 |     (head)->sqh_last = &(elm)->field.sqe_next;                          \
>        |     ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
> ../util/async.c:169:5: note: in expansion of macro ‘QSIMPLEQ_INSERT_TAIL’
>    169 |     QSIMPLEQ_INSERT_TAIL(&ctx->bh_slice_list, &slice, next);
>        |     ^~~~~~~~~~~~~~~~~~~~
> ../util/async.c:161:17: note: ‘slice’ declared here
>    161 |     BHListSlice slice;
>        |                 ^~~~~
> ../util/async.c:161:17: note: ‘ctx’ declared here
> 
> But the local variable 'slice' is removed from the global context list
> in following loop of the same routine. Add a pragma to silent GCC.
> 
> Cc: Stefan Hajnoczi <stefanha@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Daniel P. Berrangé <berrange@redhat.com>
> Signed-off-by: Cédric Le Goater <clg@redhat.com>
> ---


Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Tested-by: Daniel Henrique Barboza <danielhb413@gmail.com>


If no one opposes I'll queue this patch, and the following 2 already reviewed
patches, in ppc-next:

[PATCH for-8.0 v2 3/3] target/ppc: Fix helper_pminsn() prototype
[PATCH for-8.0 v2 2/3] target/s390x: Fix float_comp_to_cc() prototype


The reason is that I updated to Fedora 38 too soon and became aggravated by
these GCC13 false positives.



Thanks,


Daniel



>   util/async.c | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
> 
> diff --git a/util/async.c b/util/async.c
> index 21016a1ac7..856e1a8a33 100644
> --- a/util/async.c
> +++ b/util/async.c
> @@ -164,7 +164,21 @@ int aio_bh_poll(AioContext *ctx)
>   
>       /* Synchronizes with QSLIST_INSERT_HEAD_ATOMIC in aio_bh_enqueue().  */
>       QSLIST_MOVE_ATOMIC(&slice.bh_list, &ctx->bh_list);
> +
> +    /*
> +     * GCC13 [-Werror=dangling-pointer=] complains that the local variable
> +     * 'slice' is being stored in the global 'ctx->bh_slice_list' but the
> +     * list is emptied before this function returns.
> +     */
> +#if !defined(__clang__)
> +#pragma GCC diagnostic push
> +#pragma GCC diagnostic ignored "-Wpragmas"
> +#pragma GCC diagnostic ignored "-Wdangling-pointer="
> +#endif
>       QSIMPLEQ_INSERT_TAIL(&ctx->bh_slice_list, &slice, next);
> +#if !defined(__clang__)
> +#pragma GCC diagnostic pop
> +#endif
>   
>       while ((s = QSIMPLEQ_FIRST(&ctx->bh_slice_list))) {
>           QEMUBH *bh;

