Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 226BA52A536
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 16:49:37 +0200 (CEST)
Received: from localhost ([::1]:46462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqyVz-0004JK-Ps
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 10:49:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nqy1b-0004SJ-Nb
 for qemu-devel@nongnu.org; Tue, 17 May 2022 10:18:11 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:41669)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nqy1a-00067x-6S
 for qemu-devel@nongnu.org; Tue, 17 May 2022 10:18:11 -0400
Received: by mail-ej1-x636.google.com with SMTP id dk23so35002228ejb.8
 for <qemu-devel@nongnu.org>; Tue, 17 May 2022 07:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Miy9xfIrm3ZBZCF8nAaaoKnSj3u9P1uqfAyeiRiB3jQ=;
 b=V3sxKvvwul3o5pgWIADNMA0UjRMNQ60JEP2jtUX+mLvPOs/q6u2Plch5CO/T2o3NAI
 15OLV4O4qfcdJDbAFuiQRZbrtWebP6X0ve4veg1vdfX1BW25JKV4bxiv0tdXcAeaI7DO
 RxCizBaUon4AdY3Yy3N5jPjNod3420TShpULr22vozgilF/5anY0nwAQMidvXYSh3AZy
 KihB2WExsjFRtHutFO/IZr1k0wWz2GX0pcAcJoTaUNdc6EWQGpRSki48lSOZ3GuqXsVj
 Z/L9QlmTCVKwNBLZq+lrX1ADP6bo31VV719fQ6byKkQAokpIM7WuTnP1Z6UkKYMSr5cb
 f05w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Miy9xfIrm3ZBZCF8nAaaoKnSj3u9P1uqfAyeiRiB3jQ=;
 b=POmnvUJGBv0WJYuFCMBEPg0T658whenWuDi+8//URuM4WH2feJwSV6uaFDuwE1U9Tz
 335rw6tZuxgEjHJih+LpDkTzhjWHUuw/5sCwA/ZAS9MFoFrzw6mH+pbb5JoYxl9SiPWo
 nrXpRj2ut8Xvv9gGi9AywrfZsMRrs0Go38/T85Lm56wOdxPtPuzn6ygRO6iHQnR4Y7tN
 4nD1M7+d1J4myjyy+5cPxrsCp9fwUOv3+hg7gb9nn8SPs7D43GhCEeu8G+PXx5Fo5yZp
 E1p9a5pUXIg28hY1255Lu/CHeOue14mZPIoPJyUDBwyyPbbk66D7l4SVbzdOvMCS1ps0
 6Ilw==
X-Gm-Message-State: AOAM5320CQGHI98JRnyNYE9S65C1ckWDW0APh/eJA4Dx1kXhwOztiuKA
 m16ChpaSPX7b+OLHZaEGpek=
X-Google-Smtp-Source: ABdhPJyPpxOL938JpiEFpb/A0jr3cxvP9bbjvSDzuJw3OMt2qYyA+fzsY6FNLvQbBtQTuFx3ovyV7g==
X-Received: by 2002:a17:907:7810:b0:6e7:ef73:8326 with SMTP id
 la16-20020a170907781000b006e7ef738326mr19717540ejc.429.1652797088471; 
 Tue, 17 May 2022 07:18:08 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 bx15-20020a0564020b4f00b0042aac7c2fa3sm4283809edb.96.2022.05.17.07.18.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 May 2022 07:18:08 -0700 (PDT)
Message-ID: <ecf91e34-b588-f3ee-45eb-34fbde597cad@redhat.com>
Date: Tue, 17 May 2022 16:18:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v3 2/3] thread-pool: replace semaphore with condition
 variable
Content-Language: en-US
To: Nicolas Saenz Julienne <nsaenzju@redhat.com>, qemu-devel@nongnu.org
Cc: stefanha@redhat.com, =?UTF-8?B?THVrw6HFoSBEb2t0b3I=?= <ldoktor@redhat.com>
References: <20220514065012.1149539-1-pbonzini@redhat.com>
 <20220514065012.1149539-3-pbonzini@redhat.com>
 <c5fcbce258e2671f1ee22b3f4fdddea361cb2509.camel@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <c5fcbce258e2671f1ee22b3f4fdddea361cb2509.camel@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x636.google.com
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

On 5/17/22 14:46, Nicolas Saenz Julienne wrote:
>> -    while (!pool->stopping) {
>> +    while (!pool->stopping && pool->cur_threads <= pool->max_threads) {
>>           ThreadPoolElement *req;
>>           int ret;
>>   
>> -        do {
>> +        if (QTAILQ_EMPTY(&pool->request_list)) {
>>               pool->idle_threads++;
>> -            qemu_mutex_unlock(&pool->lock);
>> -            ret = qemu_sem_timedwait(&pool->sem, 10000);
>> -            qemu_mutex_lock(&pool->lock);
>> +            ret = qemu_cond_timedwait(&pool->request_cond, &pool->lock, 10000);
>>               pool->idle_threads--;
>> -        } while (back_to_sleep(pool, ret));
>> -        if (ret == -1 || pool->stopping ||
>> -            pool->cur_threads > pool->max_threads) {
>> -            break;
>> +            if (ret == 0 &&
>> +                QTAILQ_EMPTY(&pool->request_list) &&
>> +                pool->cur_threads > pool->min_threads) {
>> +                /* Timed out + no work to do + no need for warm threads = exit.  */
>> +                break;
>> +            }
> 
>   Some comments:
> 
> - A completely idle pool will now never be able to lose its threads, as the
>    'pool->cur_threads <= pool->max_threads' condition is only checked after a
>    non-timeout wakeup.

Are you sure?  The full code is:

             ret = qemu_cond_timedwait(&pool->request_cond, &pool->lock, 10000);
             pool->idle_threads--;
             if (ret == 0 &&
                 QTAILQ_EMPTY(&pool->request_list) &&
                 pool->cur_threads > pool->min_threads) {
                 /* Timed out + no work to do + no need for warm threads  exit.  */
                 break;
             }
             /*
              * Even if there was some work to do, check if there aren't
              * too many worker threads before picking it up.
              */
             continue;

That is, it won't immediately pick up the job after _any_ wait,
whether successful or not.  It will first of all "continue" to
check pool->cur_threads <= pool->max_threads.

This is also the reason why I had to add a qemu_cond_signal() at the
bottom of the worker thread (because maybe it got a signal to act on a
non-empty queue, but decided to exit instead).

> - You don't take into account the possibility of being woken up with an empty
>    queue. Which I belive possible:

It's absolutely possible, but the difference between v2 and v3 _should_
be the fix.  Of course I could have screwed up, but it seems correct
this time.

Paolo

