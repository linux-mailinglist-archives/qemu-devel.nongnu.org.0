Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC5614EDEFF
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 18:42:26 +0200 (CEST)
Received: from localhost ([::1]:49326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZxsP-0001kP-J0
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 12:42:25 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nZxqL-0000Lk-4Z; Thu, 31 Mar 2022 12:40:17 -0400
Received: from [2a00:1450:4864:20::62e] (port=40609
 helo=mail-ej1-x62e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nZxqJ-0005zt-I5; Thu, 31 Mar 2022 12:40:16 -0400
Received: by mail-ej1-x62e.google.com with SMTP id p15so502643ejc.7;
 Thu, 31 Mar 2022 09:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=4l+UFIqllCnjwxzRY08WwhfQq1MqeRPATxbCTgTI7Io=;
 b=NkXUet2oH3Afc/UZ058MuIXpwwTR7h8jnXbw4IJhEmpT/8krA5vmNMHFbDPrSE8znC
 Rhrhxe/6Y3zO3Vck4AkvY+RiPmFVL7X63T0FTIatEtyLRT/g/lA0az8PGlEVvBBFhEkl
 4zNOAOkg4Paj5tQbaDi/o+rzyHcCeJLnC6xhbYeAaCOroU7ThWo+pDqTn02CkAQsWTMz
 2XIvtgCJ41ySgwrn5v4Nna/u02JGmmTuqAq3FU7wDJixJeM+YrpIwiaUwUYP0DGPIdPR
 WdamLhOChWtwWNYAiQ36p0j6g3n7iTz4gDSeZqqUkKBDxWL4vyUxr6y9UNrEkHz+rXue
 zCFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=4l+UFIqllCnjwxzRY08WwhfQq1MqeRPATxbCTgTI7Io=;
 b=SADdLeYGdtXv8UzUFLu6J25S46cmN7/XF673a9eCxl6Si++mJkGb17532FjT9SgYdy
 PY1Em0YUzic3AsEqq5u+W4A3ZOCcKSfqhIOutVeNhnZOjui8bu2nI/sPTdrEvZYAAvoa
 co5tFvJYGjPkOqo5l5ztumIc2kg5ONN7t2/PuNA2x2K/yoeIWmMcvPUY78MJcHsspd9e
 eiK/PAYaZAiOhi/Qn+MMjSWOiO3Ts5kWu4P8DsXTYR3S63voOV/EuDfpTAu9oXBWcSQT
 04HrYFJpSIAQ6JH2ZQq1lLtR/GpNS7nOQzIIoe62GDq2gedAVjT0RVIhcNOFO2E29gmU
 CJ4g==
X-Gm-Message-State: AOAM532C6PEjjDAlaYAt90jkJLpV/EYupx9kISdXoZfWqtgGlRz/3bQC
 E6aJuMixybs5+qxqv0hub2s=
X-Google-Smtp-Source: ABdhPJzpC8uCoxM0tXBAGCERPGDHGlNs0mgz/KKQdpb9kWK/fm+lazdcNAwLvq+UNHjNAJjRaf0rbQ==
X-Received: by 2002:a17:906:c344:b0:6b4:c768:4a9a with SMTP id
 ci4-20020a170906c34400b006b4c7684a9amr5748685ejb.151.1648744809999; 
 Thu, 31 Mar 2022 09:40:09 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:8ca6:a836:a237:fed1?
 ([2001:b07:6468:f312:8ca6:a836:a237:fed1])
 by smtp.googlemail.com with ESMTPSA id
 a5-20020aa7cf05000000b0041919e52a38sm11255058edy.46.2022.03.31.09.40.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Mar 2022 09:40:09 -0700 (PDT)
Message-ID: <311c2e0a-fb2c-241c-cbd1-1162f7e74e18@redhat.com>
Date: Thu, 31 Mar 2022 18:40:08 +0200
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
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <8ae70388-ff46-6ec1-7f84-14d41ca9a6dd@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62e.google.com
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

On 3/31/22 15:51, Emanuele Giuseppe Esposito wrote:
> 
> bdrv_graph_list_wrlock <-> start_exclusive
> bdrv_graph_list_wrunlock <-> end_exclusive
> bdrv_graph_list_rdlock <-> cpu_exec_start
> bdrv_graph_list_rdunlock <-> cpu_exec_end

This wouldn't protect the list but the whole graph, i.e. the parents and 
children of all BDSes.  So the functions would be:

   bdrv_graph_wrlock <-> start_exclusive
   bdrv_graph_wrunlock <-> end_exclusive
   bdrv_graph_rdlock <-> cpu_exec_start
   bdrv_graph_rdunlock <-> cpu_exec_end


The list itself would be used internally to implement the write-side 
lock and unlock primitives, but it would not be protected by the above 
functions.  So there would be a couple additional functions:

   bdrv_graph_list_lock <-> cpu_list_lock
   bdrv_graph_list_unlock <-> cpu_list_unlock

> +void bdrv_graph_list_rdlock(BlockDriverState *bs);
> +void bdrv_graph_list_rdunlock(BlockDriverState *bs);

Apart from the naming change, these two would be coroutine_fn.

> +#define BS_GRAPH_READER(bs) /* in main loop OR bs->reading_graph */
> +#define BS_GRAPH_WRITER(bs) /* in main loop AND bs->bs_graph_pending_op

bs_graph_pending_op is not part of bs->, it is a global variable 
(corresponding to pending_cpus in cpus-common.c).  I would call it 
bs_graph_pending_reader since you have "has_writer" below.

Also, this second #define does not need an argument, and is really the 
same as assert_bdrv_graph_writable(bs).  So perhaps you can rename the 
first one to assert_bdrv_graph_readable(bs).

> 
> +    /*
> +     * If true, the main loop is modifying the graph.
> +     * bs cannot read the graph.
> +     * Protected by bs_graph_list_lock.
> +     */
> +    bool has_writer;

Note that it's "has_waiter" in cpus-common.c. :)  has_writer is fine too.

Paolo

