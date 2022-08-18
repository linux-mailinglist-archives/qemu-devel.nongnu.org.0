Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E6DA597F8F
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Aug 2022 09:52:56 +0200 (CEST)
Received: from localhost ([::1]:48264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOaKk-00037a-To
	for lists+qemu-devel@lfdr.de; Thu, 18 Aug 2022 03:52:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oOaF7-0000YF-UA
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 03:47:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27755)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oOaF5-0006wN-65
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 03:47:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660808822;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o3kDK64fwtUe2ua3C285HRNWDxZLerNHHZqcHmPAr58=;
 b=h0YCYnxq631hA9H2v+qNWEz/JwglsD4T8/uuOvAxGag3vhSyjJPTgMAUDzQ2DaY57H+GkX
 buiN9pYUUr+b0Y8TdzZMSmGIiEfmJdsU/Cu9+QOectLTmjAVxYRqD/XsFdbkEnYRzIgdZx
 E+JdC36TSvj4wMjz3W7DnRS0UudbIN8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-647-vAju1SwGO7q7SAjJ-UcuKA-1; Thu, 18 Aug 2022 03:47:00 -0400
X-MC-Unique: vAju1SwGO7q7SAjJ-UcuKA-1
Received: by mail-wm1-f72.google.com with SMTP id
 j22-20020a05600c485600b003a5e4420552so2295331wmo.8
 for <qemu-devel@nongnu.org>; Thu, 18 Aug 2022 00:47:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=o3kDK64fwtUe2ua3C285HRNWDxZLerNHHZqcHmPAr58=;
 b=C+Ez9mpPIIqsHtHbnaKuc0REVJRlr7IS8b5BKOdVwTFJonLcjqfNuWG+5cZPVnDB1T
 q2syl2a8IsA4frUnQVYp4nXo9U14HUHmuWnJrlZEux+aK2b4n3d+Oofj3LLGo969MzVu
 CYZvm420hd/XdJhLkVNFXIrPHeQUbswVC9f/KYTdkU9hFbc39nPq1s5NGyes3ahPqBLz
 Yr4zUFLcUtRx8bQuMWXif4FGkXz/U7ubzVTHyVekQBhu5/w0HEO43aAizIMS0v8+OXNU
 m28h2EGHoD0S0FFnZKQh0CErgvUf6lASNej/CvZQ1xkDLI0I4tDPyO23MLp+YzpjmZVR
 rs/Q==
X-Gm-Message-State: ACgBeo1b6On+juo8sAOVlvU69Qf3CePFC3WggwKTkuA2A9hOmWwrBg3U
 Cgy1hePzCIwuqSu+5t0iFFYHnAccl0fZ62+jP/jGwIylg6lUyKrl09XkdbCC3/dYc/Ax+qim5xx
 yK+A+57waZQ9n7W4=
X-Received: by 2002:a5d:6746:0:b0:221:76b8:b8d1 with SMTP id
 l6-20020a5d6746000000b0022176b8b8d1mr915316wrw.710.1660808819775; 
 Thu, 18 Aug 2022 00:46:59 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5bEpzXQOvqp9bdUG256XR6WBCQzRqS5E1KMYIILHo0RHaTmDRDA3qOf6wXb+vSPERwNkqgIg==
X-Received: by 2002:a5d:6746:0:b0:221:76b8:b8d1 with SMTP id
 l6-20020a5d6746000000b0022176b8b8d1mr915295wrw.710.1660808819538; 
 Thu, 18 Aug 2022 00:46:59 -0700 (PDT)
Received: from [192.168.149.123]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 p16-20020a05600c1d9000b003a60ff7c082sm4596608wms.15.2022.08.18.00.46.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Aug 2022 00:46:59 -0700 (PDT)
Message-ID: <563d5629-d47a-9682-f5c8-6be2c4806e8c@redhat.com>
Date: Thu, 18 Aug 2022 09:46:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v10 18/21] job.c: enable job lock/unlock and remove
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
References: <20220725073855.76049-1-eesposit@redhat.com>
 <20220725073855.76049-19-eesposit@redhat.com>
 <d3212eb9-1054-9821-4062-5e9b960da630@yandex-team.ru>
 <43acbcd7-d00f-ee74-df22-314745900f93@redhat.com>
 <efd80f7e-f024-7ce0-4227-3918d1243cbd@yandex-team.ru>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <efd80f7e-f024-7ce0-4227-3918d1243cbd@yandex-team.ru>
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



Am 17/08/2022 um 20:54 schrieb Vladimir Sementsov-Ogievskiy:
> On 8/16/22 15:52, Emanuele Giuseppe Esposito wrote:
>>>>    }
>>>> @@ -501,8 +481,12 @@ void job_unref_locked(Job *job)>
>>>> assert(!job->txn);
>>>>              if (job->driver->free) {
>>>> +            AioContext *aio_context = job->aio_context;
>>>>                job_unlock();
>>>> +            /* FIXME: aiocontext lock is required because cb calls
>>>> blk_unref */
>>>> +            aio_context_acquire(aio_context);
>>>>                job->driver->free(job);
>>>> +            aio_context_release(aio_context);
>>> So, job_unref_locked() must be called with aio_context not locked,
>>> otherwise we dead-lock here? That should be documented in function
>>> declaration comment.
>>>
>>> For example in qemu-img.c in run_block_job() we do exactly that: call
>>> job_unref_locked()  inside aio-context lock critical seaction..
>> No, job_unref_locked has also status and refcnt and all the other fields
>> that need to be protectd. Only free must be called without job lock held.
>>
> 
> I mean, don't we try here to acquire aio_context twice, when we call
> job_unref_locked() with aio_context _already_ acquired?
> 
You're right, so why do we need the AioContext lock in qemu-img then?
All jobs API don't need it, aio_poll seems not to need it either, and
progress API has its own lock.

I guess I could remove it?

Emanuele


