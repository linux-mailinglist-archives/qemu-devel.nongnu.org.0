Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 504AB6EDD32
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 09:50:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prDMN-0006H6-S0; Tue, 25 Apr 2023 03:45:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1prDMJ-0006E7-Rx
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 03:45:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1prDMF-0006X8-Rj
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 03:45:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682408703;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PmrLEpXv2pqWz2/NCOZUvt9nVuMauUiZd5CJpR4z3D8=;
 b=ZzZ4ur/ZsaLZBrtI1DRFrZXsT9EKZLy4L37P64BmS+3L5X9g+7LY2Rqetruaokt4NFtPDw
 YKZnnvge+97oce5VuqQZBrHXodIqXrPXcNmovv5vqpfQwaEuDcGQWZTY9IfDTU0Dlk+q/i
 zfVgCtoXlavXR/N1yfCWt5CDielHqes=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-497-nL1SvIYuNRibjdPs-p-VGQ-1; Tue, 25 Apr 2023 03:45:01 -0400
X-MC-Unique: nL1SvIYuNRibjdPs-p-VGQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-3f18b63229bso51513565e9.0
 for <qemu-devel@nongnu.org>; Tue, 25 Apr 2023 00:45:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682408700; x=1685000700;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PmrLEpXv2pqWz2/NCOZUvt9nVuMauUiZd5CJpR4z3D8=;
 b=RLctfx6fS6gwVS5DLDtRWcttxDmgon/b+ZLA7PJYaD/sFFt6iu5hQwqX/9YBuY6QH0
 lDHsClWzMUM/JACAlMK4kjU/o6W9o6AGEhs9ExDsb+GX4vnUtP9HgaYivX/44rrnpFRP
 4edLqkGa6bKZ447qRIJxNVXLc0VYvkWTHxzvJwf8cF1saP0o04YyQ6HMqQc664UeqYBZ
 rKGgjUifDm9v6mk1Q8F+M96dLwqS2WYpC2VhSanafaUXxHDobxVKTd7KoApmputWQWQO
 qiP8agXyGteSl96luXY8J5onaHWFJtbiGxRcLrH8E/ULAiJK6OhJQNBE21ivO91MJT9b
 HinA==
X-Gm-Message-State: AAQBX9fxYTKu2kwhNlabtnxicGTay6IRecYbB4EWJ3OBeTUFscltIQS8
 AxCN/nxKsZyLS9coUxzaTMb66dEwnPGxpes4gD14W98DGRRPtKM+a5JLowyCmZETW5w6HTJvIzE
 TrQo/G37S59Onntc=
X-Received: by 2002:a05:6000:12d1:b0:2cf:e313:2860 with SMTP id
 l17-20020a05600012d100b002cfe3132860mr10541022wrx.33.1682408700556; 
 Tue, 25 Apr 2023 00:45:00 -0700 (PDT)
X-Google-Smtp-Source: AKy350YPJEskwWegzx7KskDouJAuW0slGk7hw4Ss0F94aRr5kZUCZczysxcHnM6wephUNVQdTQnJMw==
X-Received: by 2002:a05:6000:12d1:b0:2cf:e313:2860 with SMTP id
 l17-20020a05600012d100b002cfe3132860mr10540999wrx.33.1682408700239; 
 Tue, 25 Apr 2023 00:45:00 -0700 (PDT)
Received: from [10.33.192.205] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 a14-20020adfe5ce000000b002fbe0772ab1sm12423001wrn.16.2023.04.25.00.44.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Apr 2023 00:44:59 -0700 (PDT)
Message-ID: <bb623772-8367-3089-2a15-796d32a3a48a@redhat.com>
Date: Tue, 25 Apr 2023 09:44:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v8 8/8] memory: abort on re-entrancy in debug builds
Content-Language: en-US
To: Alexander Bulekov <alxndr@bu.edu>, qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>, Peter Xu <peterx@redhat.com>,
 Jason Wang <jasowang@redhat.com>, David Hildenbrand <david@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Bandan Das <bsd@redhat.com>, "Edgar E . Iglesias"
 <edgar.iglesias@gmail.com>, Darren Kenny <darren.kenny@oracle.com>,
 Bin Meng <bin.meng@windriver.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Jon Maloy <jmaloy@redhat.com>,
 Siqi Chen <coc.cyqh@gmail.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Fam Zheng <fam@euphon.net>, "open list:Block I/O path"
 <qemu-block@nongnu.org>
References: <20230421142736.2817601-1-alxndr@bu.edu>
 <20230421142736.2817601-9-alxndr@bu.edu>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230421142736.2817601-9-alxndr@bu.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.194, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 21/04/2023 16.27, Alexander Bulekov wrote:
> This is useful for using unit-tests/fuzzing to detect bugs introduced by
> the re-entrancy guard mechanism into devices that are intentionally
> re-entrant.
> 
> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
> ---
>   softmmu/memory.c | 3 +++
>   util/async.c     | 3 +++
>   2 files changed, 6 insertions(+)
> 
> diff --git a/softmmu/memory.c b/softmmu/memory.c
> index a11ee3e30d..5390f91db6 100644
> --- a/softmmu/memory.c
> +++ b/softmmu/memory.c
> @@ -547,6 +547,9 @@ static MemTxResult access_with_adjusted_size(hwaddr addr,
>           !mr->ram_device && !mr->ram && !mr->rom_device && !mr->readonly) {
>           if (mr->dev->mem_reentrancy_guard.engaged_in_io) {
>               trace_memory_region_reentrant_io(get_cpu_index(), mr, addr, size);
> +#ifdef DEBUG
> +            abort();
> +#endif
>               return MEMTX_ACCESS_ERROR;
>           }
>           mr->dev->mem_reentrancy_guard.engaged_in_io = true;
> diff --git a/util/async.c b/util/async.c
> index a9b528c370..2dc9389e0d 100644
> --- a/util/async.c
> +++ b/util/async.c
> @@ -160,6 +160,9 @@ void aio_bh_call(QEMUBH *bh)
>           last_engaged_in_io = bh->reentrancy_guard->engaged_in_io;
>           if (bh->reentrancy_guard->engaged_in_io) {
>               trace_reentrant_aio(bh->ctx, bh->name);
> +#ifdef DEBUG
> +            abort();
> +#endif
>           }
>           bh->reentrancy_guard->engaged_in_io = true;
>       }

Reviewed-by: Thomas Huth <thuth@redhat.com>


