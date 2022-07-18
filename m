Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC0FD577E63
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 11:12:14 +0200 (CEST)
Received: from localhost ([::1]:41410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDMnW-0001bk-5A
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 05:12:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oDMkz-000784-RL
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 05:09:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44346)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oDMkx-00055X-SA
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 05:09:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658135368;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4zmBzUYJpQTSBtrW74olpr3hphjd2OldfWKYZpxW7/k=;
 b=HdqQRxjBtvcu6cykSY+qyffq33wkxWeUIyiNL97bHLIdH7hZUWoolZ1ix9LI9CafHwBUhW
 K2qSin9dOlkCQgCLMPx+pRVdiuFgIY5HGbQStLbDbFnEk62gPGMNGwDZm2AgnnuwcUmSW5
 3RRa9QwxEXrnh0Hzc3PJeBIgthb/s8Y=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-85-eZp-R7DSPJOlGNhsbdGtzw-1; Mon, 18 Jul 2022 05:09:27 -0400
X-MC-Unique: eZp-R7DSPJOlGNhsbdGtzw-1
Received: by mail-qv1-f70.google.com with SMTP id
 li2-20020a0562145e0200b0047350bbed70so5132296qvb.19
 for <qemu-devel@nongnu.org>; Mon, 18 Jul 2022 02:09:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=4zmBzUYJpQTSBtrW74olpr3hphjd2OldfWKYZpxW7/k=;
 b=bN9ZArGxyna+S6ExmV9J1FcAZI+bTZsvfXN6dBO3fRkQH4Xa4cKKoxVAhyRewE2qQE
 uuxn65Roc/qz1HVEl31sSAgtANMhkCgu+kmJpa4ev3NyxVD6sKfh2el5dRIqq5ArXeZ1
 RBCT0kZdrOc2YmgQQKMK0QHw8Htmpz+Wk2rGgZTREsWuamLwCMQ+xf1lRwqB2BWD9PiT
 h5pQmHCHUL0tYLoBVNtCKGOs/kSGCsaHpzMIf0qNWOlxDSADoRDF4nr+pBn8zDfjTXdR
 zRPpe7FI/JEECwYiTxvAsQsfphJ35akilmTmpwZd2TsxS+Rr2stq0mrLT/OESPJ2BQjU
 XPYg==
X-Gm-Message-State: AJIora8r/dRhKxE4by2kpJTx2sKeK/ZRPAJ2iHm7lxXM0DIFhMo9n+Mf
 u5ZuoqaiTg7Y8bW711/PSf6djvZs39JPqbK6GcBjLphS2HXnwe5/ZTB4SUjhjdMXuREYgcc6NQi
 tK2HdrsAaCSKuP0c=
X-Received: by 2002:ad4:5ce8:0:b0:473:d3c0:5c2d with SMTP id
 iv8-20020ad45ce8000000b00473d3c05c2dmr3441902qvb.83.1658135366958; 
 Mon, 18 Jul 2022 02:09:26 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vYkTnNlbhI1nOcIdf9jfwqKmr9Sr2HrcRTHY7lVLg0XIKgm83lJ5nc29bRC417mNiIx2mV7Q==
X-Received: by 2002:ad4:5ce8:0:b0:473:d3c0:5c2d with SMTP id
 iv8-20020ad45ce8000000b00473d3c05c2dmr3441894qvb.83.1658135366704; 
 Mon, 18 Jul 2022 02:09:26 -0700 (PDT)
Received: from [192.168.149.123]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 m12-20020a05620a290c00b006b59ddb4bc5sm11402385qkp.84.2022.07.18.02.09.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Jul 2022 02:09:26 -0700 (PDT)
Message-ID: <ae5919e6-7c79-f9fa-f1da-d72a0e589922@redhat.com>
Date: Mon, 18 Jul 2022 11:09:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [RFC PATCH 3/8] RFC: block: use transactions as a replacement of
 ->{can_}set_aio_context()
Content-Language: en-US
To: Hanna Reitz <hreitz@redhat.com>, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, John Snow <jsnow@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>, qemu-block@nongnu.org
References: <20220712211911.1302836-1-eesposit@redhat.com>
 <20220712211911.1302836-4-eesposit@redhat.com>
 <5439553d-25b2-fbe4-fabf-6e1179663dc7@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <5439553d-25b2-fbe4-fabf-6e1179663dc7@redhat.com>
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



Am 14/07/2022 um 18:45 schrieb Hanna Reitz:
>> + * First, go recursively through all nodes in the graph, and see if they
>> + * can change their AioContext.
>> + * If so, add for each node a new transaction with a callback to
>> change the
>> + * AioContext with the new one.
>> + * Once recursion is completed, if all nodes are allowed to change their
>> + * AioContext then commit the transaction, running all callbacks in
>> order.
>> + * Otherwise don't do anything.
> 
> Nice explanation, but I’d start with something more simple to describe
> the external interface, like “Change bs's and recursively all of its
> parents' and children's AioContext to the given new context, returning
> an error if that isn't possible.  If ignore_child is not NULL, that
> child (and its subgraph) will not be touched.”
You want to have your suggestion as a replacement or addition to mine?
> 
>> + *
>> + * This function still requires the caller to take the bs current
>> + * AioContext lock, otherwise draining could fail since AIO_WAIT_WHILE
> 
> Well, let’s just say “will” instead of “could”.  Callers don’t need to
> know they can get lucky when they ignore the rules.
> 
>> + * assumes the lock is always held if bs is in another AioContext.
>> + */
>> +int bdrv_child_try_change_aio_context(BlockDriverState *bs,
>> AioContext *ctx,
>> +                                      BdrvChild *ignore_child, Error
>> **errp)
> 
> Do the other functions need to be public?  Outside of this file, this
> one seems sufficient to me, but I may well be overlooking something.
> 
> Also, why is this function called bdrv_child_*, and not just
> bdrv_try_change_aio_context()?  (Or maybe have a
> bdrv_try_change_aio_context() variant without the ignore_child
> parameter, just like bdrv_try_set_aio_context()?)
> 
> Actually, wouldn’t just bdrv_change_aio_context() be sufficient?  I
> mean, it isn’t called bdrv_try_co_pwritev().  Most functions try to do
> something and return errors if they can’t.  Not sure if we need to make
> that clear in the name.
> 
> (I may be wrong, but I suspect bdrv_try_set_aio_context() is only named
> such that the compiler will check that the bdrv_set_aio_context()
> interface is completely unused;
> 42a65f02f9b380bd8074882d5844d4ea033389cc’s commit message does seem to
> confirm that.)

Ok, I will change the name in bdrv_change_aio_context. And I now
understand your suggestion on the last patch to remove
bdrv_try_set_aio_context.

Emanuele


