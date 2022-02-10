Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9E6F4B15DF
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 20:09:04 +0100 (CET)
Received: from localhost ([::1]:38034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIEoR-0007qj-De
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 14:09:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nIBu9-0007qN-UO
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 11:02:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55887)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nIBu7-0005j1-3t
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 11:02:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644508962;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ch+E0mWDAtVKg4Ro1RxPGIrJ3yzMM5wT6/OE7gINB2s=;
 b=ShQ52CSX2zEVYo45GcesbE93AZcYIvOFG7Rxratdx6ytliU5vfBf/29hWApa8qV2DT6OnU
 y06ZPD9cc/R2CTBRJA5OYvAZ4Ne+BkAc7u5dS9Eh9viawJINHMg9+QLBDdCQGSR0ZnMZ6P
 ZEPcKoaASQHzNfZkwIPYy0iRpzyWSuc=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-197-r2C5o2_yPBGkJpN1zpk05g-1; Thu, 10 Feb 2022 11:02:36 -0500
X-MC-Unique: r2C5o2_yPBGkJpN1zpk05g-1
Received: by mail-qt1-f198.google.com with SMTP id
 x5-20020ac84d45000000b002cf826b1a18so4726806qtv.2
 for <qemu-devel@nongnu.org>; Thu, 10 Feb 2022 08:02:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Ch+E0mWDAtVKg4Ro1RxPGIrJ3yzMM5wT6/OE7gINB2s=;
 b=Nwsw2se+obpfVj7ojnka/LgKLFKuTvkEIkD4vYCqbwCCa7BSYiZWJP6uXYP3sHzhu9
 QZvntToJn67KLvCKuEWz/JGuqCsttP2sxp/9uDuSmxWQlsmtLvR767c5m7P/gDD4UjRU
 9O/AXNOGE/id8kGjv8/OuaGDbZdLIPSEmbyE1SC2Ol649t5hFuOkOjIN3ZyATjbWTBGr
 PTfqRDOaj4F8fmLu6qcnqzEKmnoD84rKkQWIDva4rCLARiw9K1EAkuIVRssr5HX3X+wH
 2GJ4wp17myBi0ryz/MFutyZuE1l658sx73a5Aq4d8/qh+Wh0vJApA1e7gDeP48+f53PC
 /aRQ==
X-Gm-Message-State: AOAM533TqUOj2/dS2gI48NmIaSg/SFPjXHDyyrX0iVaPrjB7e1scovE4
 Rx+dSWHYtmXQr4e9A7UOmADVeCJS/5ZmqxA2jZiRq9y4VfbTDiMjqJiquuo25XKR2NSW0gPPOPU
 4WPAiTxQ0fh3T3Lk=
X-Received: by 2002:a05:6214:1c47:: with SMTP id
 if7mr5550451qvb.128.1644508955855; 
 Thu, 10 Feb 2022 08:02:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz51F0xaKqnq2veWt5z20UuzHiN6w/M+FO4PkUMUvSXxDuhrzIvTv35iUbhwOfbO2YYQZsAYw==
X-Received: by 2002:a05:6214:1c47:: with SMTP id
 if7mr5550418qvb.128.1644508955632; 
 Thu, 10 Feb 2022 08:02:35 -0800 (PST)
Received: from ?IPV6:2a04:ee41:4:31cb:e591:1e1e:abde:a8f1?
 ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id x18sm11380424qtw.93.2022.02.10.08.02.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Feb 2022 08:02:33 -0800 (PST)
Message-ID: <f6edf47b-b80c-0a93-ebc9-4fbea904d8a3@redhat.com>
Date: Thu, 10 Feb 2022 17:02:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 4/6] test-bdrv-drain.c: adapt test to the coming subtree
 drains
To: Stefan Hajnoczi <stefanha@redhat.com>
References: <20220208153655.1251658-1-eesposit@redhat.com>
 <20220208153655.1251658-5-eesposit@redhat.com>
 <YgUiANhIRFEos9L8@stefanha-x1.localdomain>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <YgUiANhIRFEos9L8@stefanha-x1.localdomain>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 10/02/2022 15:32, Stefan Hajnoczi wrote:
> On Tue, Feb 08, 2022 at 10:36:53AM -0500, Emanuele Giuseppe Esposito wrote:
>> There will be 2 problems in this test when we will add
>> subtree drains in bdrv_replace_child_noperm:
>>
>> - First, the test is inconsistent about taking the AioContext lock when
>>   calling bdrv_replace_child_noperm.  bdrv_replace_child_noperm is reached
>>   in two places: from blk_insert_bs directly, and via block_job_create.
>>   Only the second does it with the AioContext lock taken, and there seems
>>   to be no reason why the lock is needed.
>>   Move aio_context_acquire further down, to just protect block_job_add_bdrv()
>>
>> - Second, test_detach_indirect is only interested in observing the first
>>   call to .drained_begin. In the original test, there was only a single
>>   subtree drain; however, with additional drains introduced in
>>   bdrv_replace_child_noperm(), the test callback would be called too early
>>   and/or multiple times.
>>   Override the callback only when we actually want to use it, and put back
>>   the original after it's been invoked.
>>
>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>> ---
>>  tests/unit/test-bdrv-drain.c | 17 ++++++++++++-----
>>  1 file changed, 12 insertions(+), 5 deletions(-)
>>
>> diff --git a/tests/unit/test-bdrv-drain.c b/tests/unit/test-bdrv-drain.c
>> index 4924ceb562..c52ba2db4e 100644
>> --- a/tests/unit/test-bdrv-drain.c
>> +++ b/tests/unit/test-bdrv-drain.c
>> @@ -912,12 +912,12 @@ static void test_blockjob_common_drain_node(enum drain_type drain_type,
>>      blk_insert_bs(blk_target, target, &error_abort);
>>      blk_set_allow_aio_context_change(blk_target, true);
>>  
>> -    aio_context_acquire(ctx);
>>      tjob = block_job_create("job0", &test_job_driver, NULL, src,
>>                              0, BLK_PERM_ALL,
>>                              0, 0, NULL, NULL, &error_abort);
>>      tjob->bs = src;
>>      job = &tjob->common;
>> +    aio_context_acquire(ctx);
> 
> block_job_create() uses src's AioContext. In the IOThread case the
> AioContext is not qemu_aio_context. My expectation is that src's
> AioContext must be acquired before block_job_create() starts using src.
> 
> blockdev.c QMP commands acquire the BDS's AioContext before calling the
> function that creates the job. It seems strange to do it differently in
> this test case.
> 
> You mentioned that blk_insert_bs() is called without acquiring an
> AioContext. That may be because we know blk_target is in
> qemu_aio_context and we assume our thread holds it (even if we don't
> explicitly hold it).

This is an assumption done in all unit tests, so it's not worth changing
only this case.

 If you want to fix an inconsistency then maybe fix
> that instead of removing the acquire around block_job_create()?

Your explanation above makes sense, I think I will drop this change here.

Thank you,
Emanuele


