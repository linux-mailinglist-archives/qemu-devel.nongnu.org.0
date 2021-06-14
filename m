Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 166213A5E44
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 10:18:46 +0200 (CEST)
Received: from localhost ([::1]:50604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lshnx-0004oK-4q
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 04:18:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lshmU-000230-Mz
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 04:17:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40120)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lshmP-0004Ta-Jr
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 04:17:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623658628;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fC46tPxuR0IsAOiaoV2UfNORQMmv5kIC8LAQMYNrSGQ=;
 b=h3Z13jESLdDxQ6ukp359nmkAv802a7I0l3bE1YXOs4Dd9JP2427lE83YS+62O4z5FS3BAQ
 BhCsV+GkT/u4xRiKnpT/1n69tvEtWPih82UktVXT7YJbwP5yGGkJBLzqMEwgSGYu1gta4m
 vO0L2UtsTGngFqDWUU7tqLmodAEgRQc=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-604-Y6qvobq9NH-Pf3zQaddvrA-1; Mon, 14 Jun 2021 04:17:07 -0400
X-MC-Unique: Y6qvobq9NH-Pf3zQaddvrA-1
Received: by mail-ej1-f71.google.com with SMTP id
 w13-20020a170906384db02903d9ad6b26d8so2757921ejc.0
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 01:17:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fC46tPxuR0IsAOiaoV2UfNORQMmv5kIC8LAQMYNrSGQ=;
 b=LJ3QIxrpqRDc99Ujns8eU+9wi7F10H0lKMlJXLQqEEKciGLS4vb4/HHZMagxiOjM6m
 nuG7Tu5aiAdnGGozQ0bcjubmN6gkxRppct+XBXRlZ2jXSDlMD5bjqKu3baHzYAmWx0oN
 EdJmuGnMMDwZ7tUui8yfRxAR6VsDktQoNBReKU8qStGX09niI3l66bBuTJE+ZA6cORXr
 Kbvzch3uNyvwwgEBD81xxr2gmEQOfk9bGlGgbrcPGLKpgDDj/kAbY0HjFCafThRmFVZC
 mUjcMy50ZEVr3F51eF4Z3fdhBEI7Xd9SzItT7uhqftBgjSDdqwYaRL1AVugMOW0xna8S
 Yq/Q==
X-Gm-Message-State: AOAM532tg83/x+uD2+J+sLSPMOLeA5VrSAjyDrpOVTbzWE9pNri34SJ/
 Rop84csYr6UW17YT+gnwsbCmiZSUuSrgC7Wx1rNjfrV/M5pmlm4pxCrBzUFLwjzCXjdCsyhx0TT
 icmcN3yN/ak1Q+f1SfN1NWEuwv/j5R3EDMmrOP5fnf+et5PrcQEbZkZrAk73nLmEtbzc=
X-Received: by 2002:a50:ec08:: with SMTP id g8mr16016909edr.376.1623658625864; 
 Mon, 14 Jun 2021 01:17:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxoFwJ1fv5I79adnxqzFV7007N0s1hSeWetBAe+QkgvUf8b+AzuQppj7GL08eUAhY4Etj0K7Q==
X-Received: by 2002:a50:ec08:: with SMTP id g8mr16016892edr.376.1623658625705; 
 Mon, 14 Jun 2021 01:17:05 -0700 (PDT)
Received: from localhost.localdomain ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id
 w8sm284475edc.39.2021.06.14.01.17.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jun 2021 01:17:05 -0700 (PDT)
Subject: Re: [PATCH v3 0/5] block-copy: make helper APIs thread safe
To: Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>,
 qemu-block@nongnu.org
References: <20210614081130.22134-1-eesposit@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-ID: <3761c5a9-d29e-8ce5-f785-38b01d76e141@redhat.com>
Date: Mon, 14 Jun 2021 10:17:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210614081130.22134-1-eesposit@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.144, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 14/06/2021 10:11, Emanuele Giuseppe Esposito wrote:
> This serie of patches bring thread safety to the smaller APIs used by
> block-copy, namely ratelimit, progressmeter, co-shared-resource
> and aiotask.
> The end goal is to reduce the usage of AioContexlock in block-copy,
> by introducing smaller granularity locks thus on making the block layer
> thread safe.
> 
> What's missing for block-copy to be fully thread-safe is fixing
> the CoSleep API to allow cross-thread sleep and wakeup.
> Paolo is working on it and will post the patches once his new
> CoSleep API is accepted.
> 
> Patches 1-3 work on ratelimit, 4 covers progressmeter and
> 5 co-shared-resources.
> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
> v3:
> * Rebase on current master (had conflicts in block-copy), remove based-on in
>    cover letter

Hi Kevin & Max,

I think this series ha been reviewed and I just rebased it to current 
master. Can you give it a look and let me know if it can be merged?

Thank you,
Emanuele

> 
> Emanuele Giuseppe Esposito (2):
>    progressmeter: protect with a mutex
>    co-shared-resource: protect with a mutex
> 
> Paolo Bonzini (3):
>    ratelimit: treat zero speed as unlimited
>    block-copy: let ratelimit handle a speed of 0
>    blockjob: let ratelimit handle a speed of 0
> 
>   block/block-copy.c                | 28 ++++++--------
>   block/meson.build                 |  1 +
>   block/progress_meter.c            | 64 +++++++++++++++++++++++++++++++
>   blockjob.c                        | 46 +++++++++++++---------
>   include/qemu/co-shared-resource.h |  4 +-
>   include/qemu/progress_meter.h     | 34 ++++++++--------
>   include/qemu/ratelimit.h          | 12 +++++-
>   job-qmp.c                         |  8 +++-
>   job.c                             |  3 ++
>   qemu-img.c                        |  9 +++--
>   util/qemu-co-shared-resource.c    | 24 +++++++++---
>   11 files changed, 168 insertions(+), 65 deletions(-)
>   create mode 100644 block/progress_meter.c
> 


