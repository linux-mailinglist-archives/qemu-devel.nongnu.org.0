Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7A3650C83D
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Apr 2022 10:38:32 +0200 (CEST)
Received: from localhost ([::1]:39402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1niBHj-0000KN-Qj
	for lists+qemu-devel@lfdr.de; Sat, 23 Apr 2022 04:38:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1niBGQ-000829-Oi
 for qemu-devel@nongnu.org; Sat, 23 Apr 2022 04:37:10 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:35522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1niBGP-0001Xp-6H
 for qemu-devel@nongnu.org; Sat, 23 Apr 2022 04:37:10 -0400
Received: by mail-ej1-x629.google.com with SMTP id l7so20526935ejn.2
 for <qemu-devel@nongnu.org>; Sat, 23 Apr 2022 01:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=uc0koXLb7o1MifjyRBCEGUuNN4OjxS6lSEXPJR9wRuI=;
 b=H8ILPoNds9c5Zd3DCFFKvPSXPfAlmaQ1lW53mLYO3YTurr6qMVS6HOAGFTwZ6nyV4T
 0k8B2YVIBbGk0ECY3hw0NCG/gpQwlN76AilTBqt7EotiYcnEaJJuKHtAtYa5EsgPFJ6w
 QO6qnRunsj87A0em4opz+4zsT34BM84/AQ+JWDK2pMHJypbTGi/6HsS3TI4X029MD2mG
 jBLpu8VSu7djpO3y24fhYa/xip+sH6wA3hqXV8elvoI8FHZpGAC3QpyS57XQAvjEc4W3
 w8TfGNzfXjCUpq0/9JFoKCygZUvvjyBDTIn95mpTV/ye39eubzwFgpSYj69Ku7YOE43m
 P0Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=uc0koXLb7o1MifjyRBCEGUuNN4OjxS6lSEXPJR9wRuI=;
 b=vc50D2dY2rCTuRaUWcpbsQNXEdDlSDvblv4WZoQjAV/6I2yhxhos/dt3s5P8iyVIvZ
 PsbJFLaLJyI8NzvxOl3+9T3wzK8GpEVT3WjiRMWo0YwhP5dbDnJrTTBMVrz/4hidCz0A
 jT+ub7renLOCCgIWOOqX5VML3IgTIXlbCjNw0uDYuf9SQ3D5R0JE+k8PkMJIiAcKKcci
 lqZCWerO0vfipVVCdLeNkmbrFJJ5sUVICrxogWYvPSO8ge1bvCViqivVpNpps5cG6eqO
 nFXuAt6gWaYieaDcmYzMr4yaDdeEgLkhirHFT1nQdGCR3e97PcqvAe6Inq8MiGTUi8Vs
 NJWA==
X-Gm-Message-State: AOAM5314ELKry37SJVXNTyFKELka22lexgbscFL0RtQl6x89o50i/acT
 wvlzc/rOZ9EFQuqoo5ArhxQ=
X-Google-Smtp-Source: ABdhPJyiEFcJhYtMalm6SZp/qWHCw8vlRZY2o9JAFhPa3sL+YE29l3NhjH34o4bEa7QFIDeQE+pwEA==
X-Received: by 2002:a17:907:2d11:b0:6f0:f39:f647 with SMTP id
 gs17-20020a1709072d1100b006f00f39f647mr7418332ejc.694.1650703027874; 
 Sat, 23 Apr 2022 01:37:07 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 x98-20020a50baeb000000b00425d61cbb0esm165475ede.22.2022.04.23.01.37.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Apr 2022 01:37:07 -0700 (PDT)
Message-ID: <8f54234c-8f9d-89c7-3bde-a02adf93c1b8@redhat.com>
Date: Sat, 23 Apr 2022 10:37:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 for-7.1 5/9] nbd: use a QemuMutex to synchronize
 yanking, reconnection and coroutines
Content-Language: en-US
To: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 qemu-devel@nongnu.org
References: <20220414175756.671165-1-pbonzini@redhat.com>
 <20220414175756.671165-6-pbonzini@redhat.com>
 <995e87bd-f0f9-3ff9-32b0-19c02c29cf89@mail.ru>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <995e87bd-f0f9-3ff9-32b0-19c02c29cf89@mail.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x629.google.com
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

On 4/16/22 14:18, Vladimir Sementsov-Ogievskiy wrote:
> 14.04.2022 20:57, Paolo Bonzini wrote:
>> The condition for waiting on the s->free_sema queue depends on
>> both s->in_flight and s->state.  The latter is currently using
>> atomics, but this is quite dubious and probably wrong.
>>
>> Because s->state is written in the main thread too, for example by
>> the yank callback, it cannot be protected by a CoMutex.  Introduce a
>> separate lock that can be used by nbd_co_send_request(); later on this
>> lock will also be used for s->state.  There will not be any contention
>> on the lock unless there is a yank or reconnect, so this is not
>> performance sensitive.
>>
>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>> ---
>>   block/nbd.c | 46 +++++++++++++++++++++++++++-------------------
>>   1 file changed, 27 insertions(+), 19 deletions(-)
>>
>> diff --git a/block/nbd.c b/block/nbd.c
>> index 62dd338ef3..a2414566d1 100644
>> --- a/block/nbd.c
>> +++ b/block/nbd.c
>> @@ -71,17 +71,22 @@ typedef struct BDRVNBDState {
>>       QIOChannel *ioc; /* The current I/O channel */
>>       NBDExportInfo info;
>> -    CoMutex send_mutex;
>> +    /*
>> +     * Protects free_sema, in_flight, requests[].coroutine,
>> +     * reconnect_delay_timer.
>> +     */
> 
> requests[].coroutine is read without mutex in nbd_receive_replies
> 
> reconnect_delay_timer_del() is called without mutex in 
> nbd_cancel_in_flight() and in reconnect_delay_timer_cb()..
> 
> Is it OK? Worth improving the comment?

Yeah, let me check the reconnect_delay_timer idea you had in the 
previous patch, too.

> Prior to this patch, if request sending fails, we'll not send further 
> requests. After the patch, we can send more requests after failure on 
> unlocking send_mutex.
>
> What's wrong if we keep send_mutex critical section as is and just lock 
> requests_lock additionally inside send_mutex-critical-section?

I wanted to keep send_mutex just for the socket, basically.  The cse you 
point out exists but it is harmless.

Paolo

