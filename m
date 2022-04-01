Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E88074EEC02
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 13:06:48 +0200 (CEST)
Received: from localhost ([::1]:39276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naF7A-0004lR-1j
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 07:06:48 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1naF2W-00018O-4s; Fri, 01 Apr 2022 07:02:01 -0400
Received: from [2a00:1450:4864:20::530] (port=44978
 helo=mail-ed1-x530.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1naF2T-0006nN-U0; Fri, 01 Apr 2022 07:01:59 -0400
Received: by mail-ed1-x530.google.com with SMTP id w25so2487731edi.11;
 Fri, 01 Apr 2022 04:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=wxMwicRUY1sVW1DL+XjEHIQ4dKKR2OMSKjK5bMu2A4g=;
 b=e0hpiQnH1cKlGegNRU41qNpJJshoOx2QA9UAwoE65XNaZ2xE980IEjNKoFq2Qnj/iT
 kP+JcDP0rtkVe6XBRZtf5+eH6r7HGK351CmARONIJ0DJ2p/nAjIBXmha0jc7jJyx9xia
 RPJdBMfB5+ffnRne0BgbgdGtyPMkN18m5UJ7wDHjIalNjJG/TZL+jZzLu9hg+KouFnoz
 upcrGQI71AXMC7+OEhmGV8De9njciCxK9/m9w4YCYyCf+5vdnoGQHAPgAqAvPN18lCG/
 lmM7qP6S174uCUr5cQT3B86bWMGEfHaGjH6/jkgKFBnzq20fiYNOarWbHz/xphlbWRux
 8Q9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=wxMwicRUY1sVW1DL+XjEHIQ4dKKR2OMSKjK5bMu2A4g=;
 b=ldoXMP/dftixAvihLkGxdSfiUM2xUGmBIO5dMF6rg1DD5bUj9egeKO4F5qT4hGQLvj
 lamg3KKP9Yfdj7PfgUGl4f/yhhG+9yYKiN78lRD3Xu4eP/5G47AmtxtTCwkXAXomXWLB
 ScQdEGBzgJHzHU3TW00ZfepNDdEKKBv5raJPTGcICRzSyOhJZtb1HpkD3ZnYzUAAMJMk
 Jj94hSbUHVBgcOALw/P60j73uc2AoLGdsMyPUAM6Hyrpr1IRJoCAQ/t5zb755FOk2IYz
 64Y8cGfrGQGtygQVZaI9+0Iz6AW/uSDDuM/PKuhcPkM3BIdH93RVCu15n1VHQC72cNK8
 wLqA==
X-Gm-Message-State: AOAM530evEGM+ooryEgnuLqZwn8KncUtoUCfeoIjbTtpueQ/JWFRjqVW
 isELLYvfv7mAYW3W8EeuKc8=
X-Google-Smtp-Source: ABdhPJyGo04zYWJC59NP8Gv9PuE4hV6Luu2GYxNKWL9irIi48zeZZUuW7fXlZG+6P6wZs7msAwoi3A==
X-Received: by 2002:aa7:cc82:0:b0:410:d2b0:1a07 with SMTP id
 p2-20020aa7cc82000000b00410d2b01a07mr20557405edt.359.1648810915646; 
 Fri, 01 Apr 2022 04:01:55 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:8ca6:a836:a237:fed1?
 ([2001:b07:6468:f312:8ca6:a836:a237:fed1])
 by smtp.googlemail.com with ESMTPSA id
 b20-20020a1709063f9400b006e12836e07fsm912519ejj.154.2022.04.01.04.01.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Apr 2022 04:01:55 -0700 (PDT)
Message-ID: <69b2ce82-4826-71ed-9c32-d323df69b7c4@redhat.com>
Date: Fri, 1 Apr 2022 13:01:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [RFC PATCH 0/5] Removal of AioContext lock, bs->parents and
 ->children: proof of concept
Content-Language: en-US
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
References: <20220301142113.163174-1-eesposit@redhat.com>
 <Yh89L8gT46MbSJCQ@stefanha-x1.localdomain>
 <af53599c-c7de-d2b8-00fa-0e7d28121251@redhat.com>
 <e9eeec7b-d03e-5e8e-cc42-568c670726ca@redhat.com>
 <c8d45cd9-e7de-9acd-3fd6-13de58f5ce48@redhat.com>
 <c6a12090-b6c3-31d8-fb90-a76c9dd2e949@redhat.com>
 <88f2798b-9327-e54f-5792-e37404b94ef7@redhat.com>
 <8ae70388-ff46-6ec1-7f84-14d41ca9a6dd@redhat.com>
 <311c2e0a-fb2c-241c-cbd1-1162f7e74e18@redhat.com>
 <9d3c36f0-0834-ec9c-8473-d052d64a61dd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <9d3c36f0-0834-ec9c-8473-d052d64a61dd@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::530
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x530.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/1/22 10:05, Emanuele Giuseppe Esposito wrote:
>> The list itself would be used internally to implement the write-side
>> lock and unlock primitives, but it would not be protected by the above
>> functions.  So there would be a couple additional functions:
>>
>>    bdrv_graph_list_lock <-> cpu_list_lock
>>    bdrv_graph_list_unlock <-> cpu_list_unlock
> 
> The list would be graph_bdrv_states, why do we need to protect it with a
> lock? Currently it is protected by BQL, and theoretically only
> bdrv_graph_wrlock iterates on it. And as we defined in the assertion
> below, wrlock is always in the main loop too.

You're right, CPU_FOREACH only appears in start_exclusive; so likewise 
you only need to walk the list in bdrv_graph_wrlock, i.e. only under BQL.

My thought was that, within the implementation, you'll need a mutex to 
protect has_waiter, and protecting the list with the same mutex made 
sense to me.  But indeed it's not necessary.

Paolo

>>> +void bdrv_graph_list_rdlock(BlockDriverState *bs);
>>> +void bdrv_graph_list_rdunlock(BlockDriverState *bs);
>>
>> Apart from the naming change, these two would be coroutine_fn.
>>
>>> +#define BS_GRAPH_READER(bs) /* in main loop OR bs->reading_graph */
>>> +#define BS_GRAPH_WRITER(bs) /* in main loop AND bs->bs_graph_pending_op
>>
>> bs_graph_pending_op is not part of bs->, it is a global variable
>> (corresponding to pending_cpus in cpus-common.c).  I would call it
>> bs_graph_pending_reader since you have "has_writer" below.

