Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F3C52BB3A
	for <lists+qemu-devel@lfdr.de>; Wed, 18 May 2022 14:49:17 +0200 (CEST)
Received: from localhost ([::1]:41620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrJ76-0007Hh-AC
	for lists+qemu-devel@lfdr.de; Wed, 18 May 2022 08:49:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nrJ1w-0005CH-LL; Wed, 18 May 2022 08:43:56 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:34550)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nrJ1v-0001ri-1z; Wed, 18 May 2022 08:43:56 -0400
Received: by mail-ej1-x62d.google.com with SMTP id n13so1705295ejv.1;
 Wed, 18 May 2022 05:43:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=d9J8jihWB1ayRwy9+xQ7eMt6u8CXZUhlrN5wTtp21qM=;
 b=RnaMsd88p/jL0EvjbY4NKqbM3815MVORgTEZQrESmart262fUybiuoRRvYVykVTvJQ
 cPgHVHo6snhbOBJcIGFKBNMJE26AqomXDTR1LtUw2azPpdnb4b/YXl2rkDPuMqKrqUh0
 1/btqxtIqHe7aiZgvV0+i138vijqnCIsUTHJpyFLnj3IDoa2cZrtCs9CSwE25Z+wkRkd
 ebHZZ4JXZ+QGUKz4Zf8r17b+6p8LkPhK5UMSYmy7slPbjGLdNcoXPX028QK64tWUN9KY
 k8QxvKL+rLmK6hNaIGs9Sr/CxCGA01DE6e2wwqp6KDvgMpxN8kYULylnJ4kGoNE+TT4c
 HblA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=d9J8jihWB1ayRwy9+xQ7eMt6u8CXZUhlrN5wTtp21qM=;
 b=fxgM2TisZAvDg0IPpahqh7WUaNEZO9oZEJkpt8eURJwXPVAWAkT3s0gjZ0ZpH3QnPy
 A+qIshelkytt1SzFcmAKWhvEjX47WqN5ghOknoNX5c9MXK0X7Vyqvmf8E317TTFoDuph
 nP6Eb21qF5j9ApDxRQYMhM91gf+UXL8fuY7r49cN3vyusoJtrzdJ+fkARj1uI1L4Brqi
 IhaAAmkMpB4z9pbEZU2v1N6b/hDu8rA2w2tcCXmIHCYf8GCm+wBYw38HGgziLaJOwLe7
 g5RG4QjA8juovSQ4xLIvCRT4048+GIi7xd41XzoMb45aRBFXJg94+JP/catjd0+9cq4n
 jpxw==
X-Gm-Message-State: AOAM530SHQITwNlLuLjPIZVQJ/WCX5gnviF/22nsCy4xAFWcrv8uBXAV
 N6vsYgSKrPbxhadXFxm6GA4=
X-Google-Smtp-Source: ABdhPJyIHqsjEtS9hT4XHGzn4EteDkFokXrtFE+54Dionbd17ydTEmsXs3rPcd/+fzNhbXkfapjhMg==
X-Received: by 2002:a17:906:3ec1:b0:6e8:aae3:90de with SMTP id
 d1-20020a1709063ec100b006e8aae390demr24586715ejj.127.1652877833050; 
 Wed, 18 May 2022 05:43:53 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 y12-20020a170906518c00b006f3ef214e35sm918294ejk.155.2022.05.18.05.43.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 May 2022 05:43:52 -0700 (PDT)
Message-ID: <6fc3e40e-7682-b9dc-f789-3ca95e0430db@redhat.com>
Date: Wed, 18 May 2022 14:43:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [RFC PATCH v2 0/8] Removal of AioContext lock, bs->parents and
 ->children: new rwlock
Content-Language: en-US
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Fam Zheng <fam@euphon.net>, qemu-devel@nongnu.org
References: <20220426085114.199647-1-eesposit@redhat.com>
 <YnKB+SP678gNrAb1@stefanha-x1.localdomain>
 <YoN/935E4MfinZFQ@stefanha-x1.localdomain>
 <cc5e12d1-d25f-d338-bff2-0d3f5cc0def7@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <cc5e12d1-d25f-d338-bff2-0d3f5cc0def7@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62d.google.com
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

On 5/18/22 14:28, Emanuele Giuseppe Esposito wrote:
> For example, all callers of bdrv_open() always take the AioContext lock.
> Often it is taken very high in the call stack, but it's always taken.

I think it's actually not a problem of who takes the AioContext lock or 
where; the requirements are contradictory:

* IO_OR_GS_CODE() functions, when called from coroutine context, expect 
to be called with the AioContext lock taken (example: 
bdrv_co_yield_to_drain)

* to call these functions with the lock taken, the code has to run in 
the BDS's home iothread.  Attempts to do otherwise results in deadlocks 
(the main loop's AIO_WAIT_WHILEs expect progress from the iothread, that 
cannot happen without releasing the aiocontext lock)

* running the code in the BDS's home iothread is not possible for 
GLOBAL_STATE_CODE() functions (unless the BDS home iothread is the main 
thread, but that cannot be guaranteed in general)

> We might suppose that many callbacks are called under drain and in
> GLOBAL_STATE, which should be enough, but from our experimentation in
> the previous series we saw that currently not everything is under drain,
> leaving some operations unprotected (remember assert_graph_writable
> temporarily disabled, since drain coverage for bdrv_replace_child_noperm
> was not 100%?).
> Therefore we need to add more drains. But isn't drain what we decided to
> drop at the beginning? Why isn't drain good?

To sum up the patch ordering deadlock that we have right now:

* in some cases, graph manipulations are protected by the AioContext lock

* eliminating the AioContext lock is needed to move callbacks to 
coroutine contexts (see above for the deadlock scenario)

* moving callbacks to coroutine context is needed by the graph rwlock 
implementation

On one hand, we cannot protect the graph across manipulations with a 
graph rwlock without removing the AioContext lock; on the other hand, 
the AioContext lock is what _right now_ protects the graph.

So I'd rather go back to Emanuele's draining approach.  It may not be 
beautiful, but it allows progress.  Once that is in place, we can remove 
the AioContext lock (which mostly protects virtio-blk/virtio-scsi code 
right now) and reevaluate our next steps.

Paolo

