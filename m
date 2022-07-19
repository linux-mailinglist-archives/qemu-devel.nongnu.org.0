Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4D0557978B
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 12:20:51 +0200 (CEST)
Received: from localhost ([::1]:44590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDkLT-0005RI-11
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 06:20:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oDjyb-0008O6-M4
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 05:57:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41994)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oDjyZ-00058T-TP
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 05:57:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658224631;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CeUDguV4iYRX931+4M/b8FtxWoGb/6zPswU1MQaW/gA=;
 b=aBYPI7Eot/LQ3JsI1ACn8BUa0bUNr/rLUvvbBn8xp6ppY+pea2KzBdbSL43XA8kvfwef5J
 LLpNuc3dSBTrNIljXrsoESgyHrKJyDcvdeHkGQdgrFEq18ijyQMbXKciqACr4DlLpsTplb
 +MRP61gq5O0QPHeKALs4DPKmIaGEhHE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-316-EJxVzIv2OXqPQoDSUw6doQ-1; Tue, 19 Jul 2022 05:57:04 -0400
X-MC-Unique: EJxVzIv2OXqPQoDSUw6doQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 q19-20020a7bce93000000b003a3264f3de9so136086wmj.3
 for <qemu-devel@nongnu.org>; Tue, 19 Jul 2022 02:57:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=CeUDguV4iYRX931+4M/b8FtxWoGb/6zPswU1MQaW/gA=;
 b=F8AenbhwBY3EBHDyIWsqDyDmHEE3LslYWvIU12HyRjM4JvPmXSf+cxWKIboaInTG30
 qMENp8EgRRSQrMiUR290gMFwUXYGjIHkj6puXg9f85XaoqA4yd7N3xJcFvG8IPcPOsny
 QgDasb5rx2Id3ljfXRdKM6kjpIwpGMIs9khBmf1JF2V7ivw0smr/HpGiOdI+JnSqcAOG
 9uqtkPGSrHymM/JE+dWQlIkxC8SNkQ63wzyaYs9XCHAyipCPPAzUPh15nmlhVek2lLWq
 5OOCje5OlvgfyZE4eHRfoglftn6m67EwVLduxvNB9YSMHLtBpDN0uYQvInGEWQ37gpWB
 JJiw==
X-Gm-Message-State: AJIora9zCHJxJCuNA42BCR4QaG9fRyuRfRjG08sOiOQkLKvh2AaOuDrZ
 fXffZWmsZnC3uNIrwO2SxR8R+YR2fmvKEOyd0tCioqK8v02qcm2JG2GspGOgdDNZjNxMZ4JtObA
 hiJI84N5I7m5AXT0=
X-Received: by 2002:a05:6000:168e:b0:21d:ae03:49d9 with SMTP id
 y14-20020a056000168e00b0021dae0349d9mr26269426wrd.457.1658224623103; 
 Tue, 19 Jul 2022 02:57:03 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tB+GPx2WyHKP0karEyAIi0nSHNgkdLqwOogv6b0TuPyaAWzVv74K7kHvB4iguQVlTdSZTvwQ==
X-Received: by 2002:a05:6000:168e:b0:21d:ae03:49d9 with SMTP id
 y14-20020a056000168e00b0021dae0349d9mr26269404wrd.457.1658224622868; 
 Tue, 19 Jul 2022 02:57:02 -0700 (PDT)
Received: from [192.168.149.123]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 i3-20020a05600c14c300b003a32251c3f0sm2005418wmh.33.2022.07.19.02.57.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Jul 2022 02:57:02 -0700 (PDT)
Message-ID: <88e07fa2-60c9-0fb6-fc1b-b03a2f7d37f5@redhat.com>
Date: Tue, 19 Jul 2022 11:57:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [RFC PATCH 7/8] block: use the new _change_ API instead of
 _can_set_ and _set_
Content-Language: en-US
To: Hanna Reitz <hreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, John Snow <jsnow@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>, qemu-block@nongnu.org
References: <20220712211911.1302836-1-eesposit@redhat.com>
 <20220712211911.1302836-8-eesposit@redhat.com>
 <ea2b8793-532d-e7c1-c34f-a9ef89f8586d@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <ea2b8793-532d-e7c1-c34f-a9ef89f8586d@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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



Am 18/07/2022 um 18:39 schrieb Paolo Bonzini:
> On 7/12/22 23:19, Emanuele Giuseppe Esposito wrote:
>> diff --git a/block/block-backend.c b/block/block-backend.c
>> index 674eaaa2bf..6e90ac3a6a 100644
>> --- a/block/block-backend.c
>> +++ b/block/block-backend.c
>> @@ -2184,8 +2184,12 @@ static int blk_do_set_aio_context(BlockBackend
>> *blk, AioContext *new_context,
>>           bdrv_ref(bs);
>>             if (update_root_node) {
>> -            ret = bdrv_child_try_set_aio_context(bs, new_context,
>> blk->root,
>> -                                                 errp);
>> +            /*
>> +             * update_root_node MUST be false for
>> blk_root_set_aio_ctx_commit(),
>> +             * as we are already in the commit function of a
>> transaction.
>> +             */
>> +            ret = bdrv_child_try_change_aio_context(bs, new_context,
>> blk->root,
>> +                                                    errp);
>>               if (ret < 0) {
>>                   bdrv_unref(bs);
>>                   return ret;
> 
> 
> Looking further at blk_do_set_aio_context:
> 
>         if (tgm->throttle_state) {
>             bdrv_drained_begin(bs);
>             throttle_group_detach_aio_context(tgm);
>             throttle_group_attach_aio_context(tgm, new_context);
>             bdrv_drained_end(bs);
>         }
> 
> Perhaps the drained_begin/drained_end pair can be moved to
> blk_set_aio_context?  It shouldn't be needed from the change_aio_ctx
> callback, because bs is already drained.  If so, blk_do_set_aio_context
> would become just:
> 
>      if (tgm->throttle_state) {
>          throttle_group_detach_aio_context(tgm);
>          throttle_group_attach_aio_context(tgm, new_context);
>      }
>      blk->ctx = new_context;
> 
> and blk_set_aio_context would be something like:
> 
>     if (bs) {
>         bdrv_ref(bs);
>         ret = bdrv_child_try_set_aio_context(bs, new_context, blk->root,
>                                              errp);
>         if (ret < 0) {
>             goto out_no_drain;
>         }
>         bdrv_drained_begin(bs);
>     }
>     ret = blk_do_set_aio_context(blk, new_context, errp);
>     if (bs) {
>         bdrv_drained_end(bs);
> out_no_drain;
>         bdrv_unref(bs);
>     }
>     return ret;
> 
> Paolo
> 

This is another example on how things here do not take into account many
other use cases outside the common ones: if I use the above suggestion,
test-block-iothread fails.

The reason why it fails is simple: now we drain regardless of
tgm->throttle_state being true or false. And this requires yet another
aiocontext lock.

Which means that if we are calling blk_set_aio_context where the bs
exists and tgm->throttle_state is true, we have a bug.

Test is test_attach_blockjob and function is line 435
blk_set_aio_context(blk, ctx, &error_abort);

The reason is that bs is first switched to the new aiocontext and then
we try to drain it without holding the lock.

Wrapping the new drains in aio_context_acquire/release(new_context) is
not so much helpful either, since apparently the following
blk_set_aio_context makes aio_poll() hang.
I am not sure why, any ideas?


Code:

static int blk_do_set_aio_context(BlockBackend *blk, AioContext
*new_context,
                                  Error **errp)
{
    BlockDriverState *bs = blk_bs(blk);
    ThrottleGroupMember *tgm = &blk->public.throttle_group_member;

    if (bs) {
        bdrv_ref(bs);

        if (tgm->throttle_state) {
            throttle_group_detach_aio_context(tgm);
            throttle_group_attach_aio_context(tgm, new_context);
        }

        bdrv_unref(bs);
    }

    blk->ctx = new_context;
    return 0;
}


int blk_set_aio_context(BlockBackend *blk, AioContext *new_context,
                        Error **errp)
{
    BlockDriverState *bs = blk_bs(blk);
    int ret;
    GLOBAL_STATE_CODE();

    if (bs) {
        bdrv_ref(bs);
        ret = bdrv_child_try_change_aio_context(bs, new_context, blk->root,
                                                errp);
        if (ret < 0) {
            goto out_no_drain;
        }
        if (new_context != qemu_get_aio_context()) {
            aio_context_acquire(new_context);
        }
        bdrv_drained_begin(bs); // <-------------------- hangs here!
    }

    ret = blk_do_set_aio_context(blk, new_context, errp);

    if (bs) {
        bdrv_drained_end(bs);
        if (new_context != qemu_get_aio_context()) {
            aio_context_release(new_context);
        }
out_no_drain:
        bdrv_unref(bs);
    }

    return ret;
}

Emanuele


