Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C24C85111D3
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 08:59:21 +0200 (CEST)
Received: from localhost ([::1]:45986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njbdw-0003xt-SZ
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 02:59:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1njbaT-0002h6-Ll
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 02:55:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49933)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1njbaP-0000Ye-RP
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 02:55:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651042540;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KYxq+v1NZI9ugBer7tpQ0au/erctGSgYJeD5Jl2skic=;
 b=WH6/3ZUEU+7sgiTvfUwKs1bcVSbxO9yi98JFRkpZs99VSDwdQTmRXjhZqngGOT3zbRYpZH
 Qc1e7auiVhomn2qEKQ/CvN2xpncvCzsXZ9sRa9PFCRDQdbvCQLz67LHC8CXRmGbR64IzL6
 QtXKSAw0bgESuv6hUKLj/6tcJ8ZD2X4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-38-6vfJC_WeP7eTkPhSXrVpcw-1; Wed, 27 Apr 2022 02:55:38 -0400
X-MC-Unique: 6vfJC_WeP7eTkPhSXrVpcw-1
Received: by mail-wr1-f72.google.com with SMTP id
 s8-20020adf9788000000b0020adb01dc25so356555wrb.20
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 23:55:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=KYxq+v1NZI9ugBer7tpQ0au/erctGSgYJeD5Jl2skic=;
 b=Wbr4O9OXvERyjZ2a+VOYNOf3cmBl8yo2FupXKhLZhWp/rjEJSJoHspsVhSvCskc20I
 el069daoMAgDzhEjSzU6TkjMPvsYsgcKniTsOhY0QI10gqdkFhNvu02yzzblbj1ozSTb
 V20UOMqtOLMjf16M12SaDrZsv8ZVQ7VhaGQhbk41NANCBljwdQGNWWyQMUjS/Gy8YKPU
 f/FlCcxjfp0Gv6gbgAEbirEdxqe9n4Bho0/aPiLPYFHKR6pDqwOBzKbzb5Kyw9+XKIWy
 HJ7cJjXHP4+IJV3n+6Kk0tNosraylPTk8b2R8l+2Jqe3MIohS3a3hmd6Ow2p9zNgEB1t
 62Iw==
X-Gm-Message-State: AOAM53192Crz2laGKFWhJyiF7c9SvwUVRSoGkjp6QVzAJQbJdKrD0VmQ
 V3YdHEJkmG2lc02fyVdoVpvuSlg4DAE5PXN4n2zPY0+2hAxA96oTakuvOYxJHKMB7rde6u1RyPP
 P2JwQzgeysdV27Yw=
X-Received: by 2002:a1c:f009:0:b0:387:6fea:8ebc with SMTP id
 a9-20020a1cf009000000b003876fea8ebcmr34180669wmb.84.1651042537578; 
 Tue, 26 Apr 2022 23:55:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxsdakiXqkcXTBLLNSLtCNqDGdQRC6bpQ8ahqnQlrCiXefZaChqhLzUt0akhqYnCY2HU5E/bw==
X-Received: by 2002:a1c:f009:0:b0:387:6fea:8ebc with SMTP id
 a9-20020a1cf009000000b003876fea8ebcmr34180650wmb.84.1651042537346; 
 Tue, 26 Apr 2022 23:55:37 -0700 (PDT)
Received: from ?IPV6:2a02:1206:4552:34c0:71ab:1dfe:eb3b:43f9?
 ([2a02:1206:4552:34c0:71ab:1dfe:eb3b:43f9])
 by smtp.gmail.com with ESMTPSA id
 z6-20020a05600c0a0600b00393d831bf15sm978024wmp.46.2022.04.26.23.55.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Apr 2022 23:55:36 -0700 (PDT)
Message-ID: <8f01c640-f876-568a-d6ff-bbb112e5154f@redhat.com>
Date: Wed, 27 Apr 2022 08:55:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [RFC PATCH v2 0/8] Removal of AioContext lock, bs->parents and
 ->children: new rwlock
Content-Language: en-US
To: qemu-block@nongnu.org
References: <20220426085114.199647-1-eesposit@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <20220426085114.199647-1-eesposit@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



Am 26/04/2022 um 10:51 schrieb Emanuele Giuseppe Esposito:
> Luckly, most of the cases where we recursively go through a graph are
> the BlockDriverState callback functions in block_int-common.h
> In order to understand what to protect, I categorized the callbacks in
> block_int-common.h depending on the type of function that calls them:
> 
> 1) If the caller is a generated_co_wrapper, this function must be
>    protected by rdlock. The reason is that generated_co_wrapper create
>    coroutines that run in the given bs AioContext, so it doesn't matter
>    if we are running in the main loop or not, the coroutine might run
>    in an iothread.
> 2) If the caller calls it directly, and has the GLOBAL_STATE_CODE() macro,
>    then the function is safe. The main loop is the writer and thus won't
>    read and write at the same time.
> 3) If the caller calls it directly, but has not the GLOBAL_STATE_CODE()
>    macro, then we need to check the callers and see case-by-case if the
>    caller is in the main loop, if it needs to take the lock, or delegate
>    this duty to its caller (to reduce the places where to take it).
> 
> I used the vrc script (https://github.com/bonzini/vrc) to get help finding
> all the callers of a callback. Using its filter function, I can
> omit all functions protected by the added lock to avoid having duplicates
> when querying for new callbacks.

I was wondering, if a function is in category (3) and runs in an
Iothread but the function itself is not (currently) recursive, meaning
it doesn't really traverse the graph or calls someone that traverses it,
should I add the rdlock anyways or not?

Example: bdrv_co_drain_end

Pros:
   + Covers if in future a new recursive callback for a new/existing
     BlockDriver is implemented.
   + Covers also the case where I or someone missed the recursive part.

Cons:
   - Potentially introducing an unnecessary critical section.

What do you think?

Emanuele


