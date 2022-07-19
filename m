Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 081F3579D98
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 14:52:56 +0200 (CEST)
Received: from localhost ([::1]:60674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDmid-00034N-4c
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 08:52:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oDmhA-0001WH-J8
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 08:51:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27274)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oDmh8-00009i-0B
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 08:51:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658235080;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hvJvpPS3f5iN54jbdJkOtmyQ9lt8eI/3n3BKR2+H/f8=;
 b=RDRRaVePIHiOt9BZYThRZM/t3apMGONzFD1I+e6JA4x8IG0q+7FMp6qd4oRFiJ2uOaBv2F
 OVEQWDtWcV734iie1JPRxnxgOR4LgqIViNo7eWCQvALr/uIiGMXlbTGqTChjxk5Ozx3bPR
 6wanE9cxCXl1xucCCvU1z3Sjlh7rd7I=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-351-AjgwYHNzMU-_i79z3aGPxg-1; Tue, 19 Jul 2022 08:51:18 -0400
X-MC-Unique: AjgwYHNzMU-_i79z3aGPxg-1
Received: by mail-qv1-f70.google.com with SMTP id
 i8-20020ad44ba8000000b00472ff57d370so7268039qvw.2
 for <qemu-devel@nongnu.org>; Tue, 19 Jul 2022 05:51:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=hvJvpPS3f5iN54jbdJkOtmyQ9lt8eI/3n3BKR2+H/f8=;
 b=cGogTWzFX0ZXXRPKcU8HUtvwbfZGbcy4klb7JMY93TkandFsYLx651tRmSfUyIv0vP
 ZWxrGNLthrhKqoVZLbvqoAjL48E9Dgkyz/XEUyvaqAZrvgBbcts15nBsuMSXt4x37V4t
 tWgQigGZg87kK3hCCdlpot5AldyQ1z52ZS0Gd5yXIM6Uln9lWEZfbG4lTbEMuZlJpe/O
 SXi8kDHg3hfjWqTs30lVkhQm7NCFcW0RvyDPbNE1JRqlav9scO0nE5WlJlByleAMSpNY
 BfigJGfPI/sVh4ql2EOopK3l/5qh93pcjAQVFXB68sFJEVO5OUtTSnElfHFoxrj1Szdb
 Ltag==
X-Gm-Message-State: AJIora+yGVlgxXj70jt0yqxZviRLJTcbUdZySqJlp4VVzPmi2pwrozrw
 9COcvMMRA1Qz9lhzZeNrxCW2sfRJ3PCtmOqOrEHwHNuVXlOipkiRqQyeaSKFtQKQQL9LvBphYl9
 CVNp/5ltkBlGgjok=
X-Received: by 2002:a05:620a:94a:b0:6b5:d5a7:e044 with SMTP id
 w10-20020a05620a094a00b006b5d5a7e044mr11493748qkw.516.1658235078434; 
 Tue, 19 Jul 2022 05:51:18 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1s2zzm83ZyLoMfhP1rtWdy1uxNTyRS7SjemJpzjRvqJTxgmGEFhS6HgoKguBDzXBE93PnrkBQ==
X-Received: by 2002:a05:620a:94a:b0:6b5:d5a7:e044 with SMTP id
 w10-20020a05620a094a00b006b5d5a7e044mr11493735qkw.516.1658235078192; 
 Tue, 19 Jul 2022 05:51:18 -0700 (PDT)
Received: from [192.168.149.123]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 u11-20020a37ab0b000000b006b5cc25535fsm11931854qke.99.2022.07.19.05.51.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Jul 2022 05:51:17 -0700 (PDT)
Message-ID: <7d4c501f-72e5-bd24-265f-3bee26b8ffb9@redhat.com>
Date: Tue, 19 Jul 2022 14:51:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v9 15/21] job.c: enable job lock/unlock and remove
 Aiocontext locks
Content-Language: en-US
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>, qemu-devel@nongnu.org
References: <20220706201533.289775-1-eesposit@redhat.com>
 <20220706201533.289775-16-eesposit@redhat.com>
 <8a559bf0-c7d4-cd76-cb42-875c685eb8bc@yandex-team.ru>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <8a559bf0-c7d4-cd76-cb42-875c685eb8bc@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



Am 11/07/2022 um 16:33 schrieb Vladimir Sementsov-Ogievskiy:
> On 7/6/22 23:15, Emanuele Giuseppe Esposito wrote:
>> Change the job_{lock/unlock} and macros to use job_mutex.
>>
>> Now that they are not nop anymore, remove the aiocontext
>> to avoid deadlocks.
>>
>> Therefore:
>> - when possible, remove completely the aiocontext lock/unlock pair
>> - if it is used by some other function too, reduce the locking
>>    section as much as possible, leaving the job API outside.
>> - change AIO_WAIT_WHILE in AIO_WAIT_WHILE_UNLOCKED, since we
>>    are not using the aiocontext lock anymore
>>
>> There is only one JobDriver callback, ->free() that assumes that
>> the aiocontext lock is held (because it calls bdrv_unref), so for
>> now keep that under aiocontext lock.
>>
>> Also remove real_job_{lock/unlock}, as they are replaced by the
>> public functions.
>>
>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
>> ---
> 
> [..]
> 
>>   static int job_finalize_single_locked(Job *job)
>>   {
>>       int job_ret;
>> +    AioContext *ctx = job->aio_context;
>>         assert(job_is_completed_locked(job));
>>         /* Ensure abort is called for late-transactional failures */
>>       job_update_rc_locked(job);
>>   +    aio_context_acquire(ctx);
> 
> so here we acquire aio-context under job_mutex lock? Wouldn't that
> dead-lock?

I'll change it so that job_commit/clean/abort do not take the lock, but
just the aiocontext.

Emanuele
> 
>> +
>>       if (!job->ret) {
>>           job_commit_locked(job);
>>       } else {
> 
> 
> 


