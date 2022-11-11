Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DC3D625944
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 12:23:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otS7s-0005KQ-Cs; Fri, 11 Nov 2022 06:23:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1otS7q-0005ET-9q
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 06:23:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1otS7o-0003dJ-PW
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 06:23:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668165787;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2eKR15EPpg9gmvm20aURzuqf1g7IBaUOiQr+6KOE8qI=;
 b=ZMz19EZJGfrVh4wY0dBNY6M5/f+hpPCr6nw1T6I4+ZvPVTIrVAPi+p/h6O6U612SYOaq7S
 Ch2xuofbkxo2g0PnfkhH3qX4sWga/cuCO9yxiXj3IZNfDWSi6M8C5sw7mWvgK18RldorV5
 gaZE2WzT/9lf5GIc9AhBAr94iU5rdNA=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-637-VXzqHJ43M0q-ij0jwVWPrA-1; Fri, 11 Nov 2022 06:23:05 -0500
X-MC-Unique: VXzqHJ43M0q-ij0jwVWPrA-1
Received: by mail-qt1-f198.google.com with SMTP id
 s14-20020a05622a1a8e00b00397eacd9c1aso3438844qtc.21
 for <qemu-devel@nongnu.org>; Fri, 11 Nov 2022 03:23:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2eKR15EPpg9gmvm20aURzuqf1g7IBaUOiQr+6KOE8qI=;
 b=SrxMcLhoraFvl5GmgxXL+8OULIiSEWJaCqgu9dWreXoMOBwwaqzwiPzjjcoyiYamYc
 bkfHQdtxLGcZox2gksMiNhK5z4Dug0K3K8zw1lEE409oNRNQLtgqr6RqjxqFIHP/zX3s
 sijzF7fKzKC/dWtUy/PUKLoPS/++HNJfWE4oZhyfbZ02sUBMsCyzGHLKiwQ0yMtHO+Ge
 OBPoLO1qCsvR1zIx81fTg+ZqD9iKQ4m062wiWW8i1DZxLHoUZN+yGjiUhtPCx+D1J5u4
 JWHLwQE4mgjkjikiMaCAeSTEP6vEvMoVRpHOvACtyPiFTDBU5uDur3172jV9tx/J+jPG
 h1hA==
X-Gm-Message-State: ANoB5pkR5m6s0A6qTV1IQo+CDg/XIpu74AIbxgox+gW1z7+XGUBr8/TX
 koGvZpaw3y4V5dWkaDHZhvjw/mmcF5rq+Vlt/nQQjcUCVPegDsn4ncKn/iWW2aFYEjndkg242v4
 8TXZHP8ZGj5tahi0=
X-Received: by 2002:a05:6214:2dc7:b0:4bb:754f:e974 with SMTP id
 nc7-20020a0562142dc700b004bb754fe974mr1432118qvb.2.1668165785427; 
 Fri, 11 Nov 2022 03:23:05 -0800 (PST)
X-Google-Smtp-Source: AA0mqf62dYvLb7FLn2+Ycc8mSeBJrx0osExTXDpYABI3bmdZZCh29zRmuYN52eg/Yc+Gf0ndQjWThQ==
X-Received: by 2002:a05:6214:2dc7:b0:4bb:754f:e974 with SMTP id
 nc7-20020a0562142dc700b004bb754fe974mr1432113qvb.2.1668165785223; 
 Fri, 11 Nov 2022 03:23:05 -0800 (PST)
Received: from [192.168.149.123]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 fu33-20020a05622a5da100b003a5172220dbsm1137107qtb.8.2022.11.11.03.23.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Nov 2022 03:23:05 -0800 (PST)
Message-ID: <9808260a-df91-a3f0-7dec-76b568733057@redhat.com>
Date: Fri, 11 Nov 2022 12:23:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 00/13] block: Simplify drain
Content-Language: en-US
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
Cc: stefanha@redhat.com, hreitz@redhat.com, pbonzini@redhat.com,
 qemu-devel@nongnu.org
References: <20221108123738.530873-1-kwolf@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <20221108123738.530873-1-kwolf@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



Am 08/11/2022 um 13:37 schrieb Kevin Wolf:
> I'm aware that exactly nobody has been looking forward to a series with
> this title, but it has to be. The way drain works means that we need to
> poll in bdrv_replace_child_noperm() and that makes things rather messy
> with Emanuele's multiqueue work because you must not poll while you hold
> the graph lock.
> 
> The other reason why it has to be is that drain is way too complex and
> there are too many different cases. Some simplification like this will
> hopefully make it considerably more maintainable. The diffstat probably
> tells something, too.
> 
> There are roughly speaking three parts in this series:
> 
> 1. Make BlockDriver.bdrv_drained_begin/end() non-coroutine_fn again,
>    which allows us to not poll on bdrv_drained_end() any more.
> 
> 2. Remove subtree drains. They are a considerable complication in the
>    whole drain machinery (in particular, they require polling in the
>    BdrvChildClass.attach/detach() callbacks that are called during
>    bdrv_replace_child_noperm()) and none of their users actually has a
>    good reason to use them.
> 
> 3. Finally get rid of polling in bdrv_replace_child_noperm() by
>    requiring that the child is already drained by the caller and calling
>    callbacks only once and not again for every nested drain section.
> 
> If necessary, a prefix of this series can be merged that covers only the
> first or the first two parts and it would still make sense.

I added by Reviewed-by where I felt confortable with the code, the other
parts I am not enough confident to review them.
But yes if this works it will be very helpful for the AioContext lock
removal!

Thank you,
Emanuele

> 
> Kevin Wolf (13):
>   qed: Don't yield in bdrv_qed_co_drain_begin()
>   test-bdrv-drain: Don't yield in .bdrv_co_drained_begin/end()
>   block: Revert .bdrv_drained_begin/end to non-coroutine_fn
>   block: Remove drained_end_counter
>   block: Inline bdrv_drain_invoke()
>   block: Drain invidual nodes during reopen
>   block: Don't use subtree drains in bdrv_drop_intermediate()
>   stream: Replace subtree drain with a single node drain
>   block: Remove subtree drains
>   block: Call drain callbacks only once
>   block: Remove ignore_bds_parents parameter from drain functions
>   block: Don't poll in bdrv_replace_child_noperm()
>   block: Remove poll parameter from bdrv_parent_drained_begin_single()
> 
>  include/block/block-global-state.h |   3 +
>  include/block/block-io.h           |  52 +---
>  include/block/block_int-common.h   |  17 +-
>  include/block/block_int-io.h       |  12 -
>  block.c                            | 132 ++++++-----
>  block/block-backend.c              |   4 +-
>  block/io.c                         | 281 ++++------------------
>  block/qed.c                        |  24 +-
>  block/replication.c                |   6 -
>  block/stream.c                     |  20 +-
>  block/throttle.c                   |   6 +-
>  blockdev.c                         |  13 -
>  blockjob.c                         |   2 +-
>  tests/unit/test-bdrv-drain.c       | 369 +++++++----------------------
>  14 files changed, 270 insertions(+), 671 deletions(-)
> 


