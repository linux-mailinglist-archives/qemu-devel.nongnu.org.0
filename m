Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A760F50C83B
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Apr 2022 10:36:58 +0200 (CEST)
Received: from localhost ([::1]:37232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1niBGD-0007Bx-K1
	for lists+qemu-devel@lfdr.de; Sat, 23 Apr 2022 04:36:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1niBEL-0006EC-7n
 for qemu-devel@nongnu.org; Sat, 23 Apr 2022 04:35:02 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:41512)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1niBEI-0000vg-R5
 for qemu-devel@nongnu.org; Sat, 23 Apr 2022 04:35:00 -0400
Received: by mail-ej1-x634.google.com with SMTP id y10so20442814ejw.8
 for <qemu-devel@nongnu.org>; Sat, 23 Apr 2022 01:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=5RNmr/UU/MVM12/khC6XMLB+tqePBcQ4l+ycU1BfRkI=;
 b=Ct9nAocFz1xkBJWwLb8pxh7T34RMBE/L4pLrSmmfhPXoD4RfVF6XseyHpxEs5fTJy1
 JTSq9AkoNynyAg+LPurCZQlZkqGXJt3NSyrQZVXQDFcMlIU/uw3kjbTza5kwi9DyxtY2
 ArjmD0YOA4WEZiHTMoG4ogMWVKVs+ZsEcnZaQPuUHfXTMw3EUwROHNouS/J1AyWFTfKz
 A5IQT8i5nIkAFaf9GQcmgRhpLCQEPlh6mcJazlka5zwR4IL15o8mx29SHgFgTCSW04Tt
 00v97TyAPkiil6eL6amFw38mMj+8VHBVVNseNd9hGadKFr0iwSfXBWVJo7MvjnPnCFJ9
 Tbzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=5RNmr/UU/MVM12/khC6XMLB+tqePBcQ4l+ycU1BfRkI=;
 b=B58EsWMKXoS0Q/YqS1kc47abFfodqZZ2PSuDMGEy5xl/hcL4ULvnWPuYbjerj8c+Wg
 +y2+zmFVI7ksRUtw8ItnJOMktp3nW6aZ0HiuvHnWvzdTwVO3dtE0Iz0gz3C5MNEOtz7U
 jjYFhzv3qAdGsaRiLuuJ+7SU7DqsDU02IiPIT+TkECo6NtDk7f/9TR5ORAYtvEsia6I5
 X2TEC/K6dtFsizWP00rGhQ6wGGgJ0amUDdHs4bpn4VKLRX4CsciUu3y9ZJn8TqSB7aik
 t+ciHNP9pvnXCVw56e7f33XSm530bn2ZaftizpD4i52GMYz8f2aaODqJ3A/ikcRK7mn7
 YTHQ==
X-Gm-Message-State: AOAM533KyNbftYWeV3FbgSwWVY7mTVTtSDsG4ZdYc+9u/ImotEkXcrd8
 YfBokHLbYNZcVWPc/JUrqjwzCohxB0pdxg==
X-Google-Smtp-Source: ABdhPJwXAHCSkTpBaCVxpaldtQrX66YSfS987120mepB90OIG+MJTp8R5/vU67DGsklViGzofOCs2w==
X-Received: by 2002:a17:907:3f86:b0:6db:b745:f761 with SMTP id
 hr6-20020a1709073f8600b006dbb745f761mr7372309ejc.610.1650702896636; 
 Sat, 23 Apr 2022 01:34:56 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 z16-20020a05640235d000b004258d76a908sm1940498edc.54.2022.04.23.01.34.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Apr 2022 01:34:55 -0700 (PDT)
Message-ID: <8c4199f9-96ed-f1e7-4f89-cf599c95f552@redhat.com>
Date: Sat, 23 Apr 2022 10:34:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 for-7.1 4/9] nbd: keep send_mutex/free_sema handling
 outside nbd_co_do_establish_connection
Content-Language: en-US
To: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 qemu-devel@nongnu.org
References: <20220414175756.671165-1-pbonzini@redhat.com>
 <20220414175756.671165-5-pbonzini@redhat.com>
 <db1afb67-5d7a-5c98-1564-6a3a637d138f@mail.ru>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <db1afb67-5d7a-5c98-1564-6a3a637d138f@mail.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x634.google.com
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
Cc: eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/16/22 13:54, Vladimir Sementsov-Ogievskiy wrote:
>> @@ -187,9 +187,6 @@ static void reconnect_delay_timer_cb(void *opaque)
>>       if (qatomic_load_acquire(&s->state) == 
>> NBD_CLIENT_CONNECTING_WAIT) {
>>           s->state = NBD_CLIENT_CONNECTING_NOWAIT;
>>           nbd_co_establish_connection_cancel(s->conn);
>> -        while (qemu_co_enter_next(&s->free_sema, NULL)) {
>> -            /* Resume all queued requests */
>> -        }
>>       }
>>       reconnect_delay_timer_del(s);
> 
> Seems, removing the timer is not needed here too. We do 
> nbd_co_establish_connection_cancel(), and timer will be removed in 
> nbd_reconnect_attempt anyway.
> 
> More over, we don't need to keep timer in the state at all: it should 
> become local thing for nbd_reconnect_attempt. A kind of call 
> nbd_co_do_establish_connection() with timeout. That could be refactored 
> later, using same way as in 4-5 patches of my "[PATCH v4 0/7] 
> copy-before-write: on-cbw-error and cbw-timeout" series.

Yes, good point.

>> nbd_reconnect_attempt(BDRVNBDState *s)
>>           s->ioc = NULL;
>>       }
>> -    nbd_co_do_establish_connection(s->bs, NULL);
>> +    qemu_co_mutex_unlock(&s->send_mutex);
>> +    nbd_co_do_establish_connection(s->bs, blocking, NULL);
>> +    qemu_co_mutex_lock(&s->send_mutex);
> 
> 
> Hmm. So, that breaks a critical section.
> 
> We can do it because in_flight=1 and we are not connected => all other 
> requests will wait in the queue.
> 
> Still. during nbd_co_do_establish_connection() state may become 
> CONNECTED. That theoretically means that parallel requests may start.
> 
> Is it bad? Seems not.. Bad thing that comes into my mind is that 
> parallel request fails, and go to reconnect, and start own timer, but we 
> remove it now after locking the mutex back. But that's not possible as 
> parallel request should wait for in-flight=0 to start own 
> reconnect-attempt. And that is not possible, as we keep our in-flight 
> point.

Yes that was even intended. :>  Synchronizing on in_flight == 0 before 
reconnecting is the important bit that simplifies a lot of things.

>> @@ -2049,7 +2046,6 @@ static void 
>> nbd_cancel_in_flight(BlockDriverState *bs)
>>       if (s->state == NBD_CLIENT_CONNECTING_WAIT) {
>>           s->state = NBD_CLIENT_CONNECTING_NOWAIT;
>> -        qemu_co_queue_restart_all(&s->free_sema);
> 
> As I understand, we always have one request running (or no requests at 
> all, but that's OK too) and it will wake all others (altogether, or they 
> will wake each other in a chain). So, we don't need to wake them here.

Exactly, the "let each coroutine wake up the next one" pattern can be 
generalized to the error cases because the wakeups cascade until 
in_flight becomes 0.

Paolo

>>       }
>>       nbd_co_establish_connection_cancel(s->conn);
> 
> 


