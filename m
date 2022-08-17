Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D00D8596F49
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Aug 2022 15:13:36 +0200 (CEST)
Received: from localhost ([::1]:59718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOIrW-0002Kt-Px
	for lists+qemu-devel@lfdr.de; Wed, 17 Aug 2022 09:13:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oOIoq-0007jc-MF
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 09:10:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36834)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oOIon-00029b-9u
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 09:10:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660741844;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cbnMHGykHJ2nGARE1DGpyp04jkUwQtpegzQTfSjbn6I=;
 b=eQkvAwXIuttav8iFOWcPOYQaxwSRvEk3l73kHvLjxjYizonU37X+5yOxJLHwbVo/j0tsy7
 LrevdyiLqbW8NHE+/q4AVrni7gRJcBb0gEX2Swrjn0bflX9zMXxk/WOG1B2Nf9d4sxmfCa
 jqlmof0KfE4J813lvnZ9mMUL2LdhVf0=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-574-_aw6eZJZNvCwEufTc3o3Ug-1; Wed, 17 Aug 2022 09:10:42 -0400
X-MC-Unique: _aw6eZJZNvCwEufTc3o3Ug-1
Received: by mail-qk1-f200.google.com with SMTP id
 bk21-20020a05620a1a1500b006b5c24695a4so11699300qkb.15
 for <qemu-devel@nongnu.org>; Wed, 17 Aug 2022 06:10:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=cbnMHGykHJ2nGARE1DGpyp04jkUwQtpegzQTfSjbn6I=;
 b=1W2pwsne0qi6J5MjOMFi8B9QnzvkHjrR475+3dXVQquNjK50804XjzlvYB1UO49Jgm
 WcEo46x7njphOSltDqVpJJzNB3wjIkDem9vhVkWkd5JMbfgNSrQTQKM5bl/VPnCqDxH8
 p3r1ALzoJIAwMyD/cUsTNEml3jfgdTsqY+PuTbCjGknC/KydC4tq0So5M4lvCqzeki95
 KH5eJfnLoMFzu9ze66lF9gDkk44bzO/aUoXohAAEWg5bwLpxbAVnp6S5nhBdz/7t0qdm
 fRbK69y/+2nDQIyKzJ8jYt8ZohsmK7FfIjrycpwROZFPaeZhSvaI9SaYgjJpnFXom4JJ
 irUQ==
X-Gm-Message-State: ACgBeo0XgqNb2XPlVh1SI15lxmhkdyw6q1iH5kfO+0fULVuJHrdJg7tB
 waCgbxVYGT60lnbAPdNZ+kj3DapTVdctALhKlfiIrWtEk9H2OKetYMDxutFkzw1mtbTmvCyi+wp
 rUpw2/8b8H7wiJbs=
X-Received: by 2002:a05:620a:2552:b0:6b4:8dbf:8992 with SMTP id
 s18-20020a05620a255200b006b48dbf8992mr18360502qko.109.1660741842378; 
 Wed, 17 Aug 2022 06:10:42 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5TsrhAXLcZyFHywuU2ttR1ZidqhRZ/AnQtcmGPW1ANMd3al470yT6zh4zIbJtMhduqSJGqjA==
X-Received: by 2002:a05:620a:2552:b0:6b4:8dbf:8992 with SMTP id
 s18-20020a05620a255200b006b48dbf8992mr18360463qko.109.1660741842096; 
 Wed, 17 Aug 2022 06:10:42 -0700 (PDT)
Received: from [192.168.149.123]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 w17-20020a05620a425100b006b5bf5d45casm14744974qko.27.2022.08.17.06.10.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Aug 2022 06:10:41 -0700 (PDT)
Message-ID: <16f6c85b-ef82-943f-fba3-6c9ba13b4601@redhat.com>
Date: Wed, 17 Aug 2022 15:10:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v10 14/21] jobs: protect job.aio_context with BQL and
 job_mutex
Content-Language: en-US
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>, qemu-devel@nongnu.org
References: <20220725073855.76049-1-eesposit@redhat.com>
 <20220725073855.76049-15-eesposit@redhat.com> <Yuze6ldui3LtEcZm@redhat.com>
 <bbb32ac1-0212-a0b6-9fae-a5907fbc9668@redhat.com>
In-Reply-To: <bbb32ac1-0212-a0b6-9fae-a5907fbc9668@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
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



Am 17/08/2022 um 10:04 schrieb Emanuele Giuseppe Esposito:
>>> +    /* protect against read in job_do_yield_locked */
>>> +    JOB_LOCK_GUARD();
>>> +    /* ensure the coroutine is quiescent while the AioContext is changed */
>>> +    assert(job->pause_count > 0);
>> job->pause_count only shows that pausing was requested. The coroutine is
>> only really quiescent if job->busy == false, too.
>>
>> Or maybe job->paused is actually the one you want here.
> I think job->paused works too.
> 

Actually it doesn't. At least test-block-iothread
test_propagate_mirror() fails, for both job->paused and !job->busy. I
think the reason is that if we wait for the flag to be set, we need to
actually wait that the job gets to the next pause point, because
job_pause() doesn't really pause the job, it just kind of "schedules"
the pause on next pause point.

So, either we leave pause_count > 0, or somehow wait (I was thinking
AIO_WAIT_WHILE(job->paused) but that's probably a very bad idea).

Do you have any suggestion for that?
Maybe Paolo has a better idea on how to do it?

Emanuele


