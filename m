Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2DEA30D426
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 08:43:25 +0100 (CET)
Received: from localhost ([::1]:53170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7Cou-0002TF-9g
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 02:43:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l7Co7-00023Q-3z
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 02:42:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20969)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l7Co3-0007fM-Cj
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 02:42:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612338150;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=73eTZmb2aQsGDV1AW+di7mWDeqfDtPK67gugM0FPbOU=;
 b=ExomxhDR6/1M9nRWG5SsSF3tYPmeCzOYR3dqk+NmEMOEKoYAE7Uw+Bj6CdyXRPfdfmrOqB
 mQsmkO/ybj02lN6nDZ9F7kyOzcIPpfTCva8D1q7s2UJ0yWuTNLLyqRV/8FImETWfqj6rmq
 7rkQSAdM+FhHZ4JGZ+f2rVh6eouQhE0=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-12-39sBfma1MEeqVx7Kgfg9Vw-1; Wed, 03 Feb 2021 02:42:26 -0500
X-MC-Unique: 39sBfma1MEeqVx7Kgfg9Vw-1
Received: by mail-ed1-f69.google.com with SMTP id j12so10934892edq.10
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 23:42:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=73eTZmb2aQsGDV1AW+di7mWDeqfDtPK67gugM0FPbOU=;
 b=d/kf4LXbdFlKe0tG8Wv62aQM2kTV3hafN56uSFzEFp50lsQl2iXHQbp+IwCUwMNMRB
 siatslMAg96lQsUM91tqyrfj9dp2/fYIrDAYjmLWlSup4jAEDTP2QcPHveaoRQaXe+74
 nidX7EK5ZKKeEIQQU6iNoEiXe/nmTp/zDjoRxD9Y+hopFc+mov8LjAxoPNOd9gieIBv6
 XWPx0H4qPk09xlS6cLW+CsELE4Jrzqr4+T4XVpseltE3iXKgf/NIRydqJ0E2rTyi2CKZ
 qbpYrQGsv6yI3hnZF2R1csgxooPlswDwsEb3LY2vK6HDnBjqWhmhoT5WhjydS5VMIs6R
 pBDA==
X-Gm-Message-State: AOAM531u8IX2gRhqGFuWGJ3T91AWkWYv1Gc/gCEkddOYdD6YeW9RJTfr
 W+ZuSy9sP627i//a1VVaM96h0dJTJ3RrBdQt8TJtGC0Tl3oPWsMqgNvqTUhxapIpShtvfMC7Zqn
 KodaV2mjGpTVhuUs=
X-Received: by 2002:aa7:d0d4:: with SMTP id u20mr1639982edo.203.1612338145204; 
 Tue, 02 Feb 2021 23:42:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyEX0d5YyitWwDd8vMZ6irHyXJS850UI7FKRAQkq+VqBsYWYc+V6NbK6IKFb41d29Y9YtAPKA==
X-Received: by 2002:aa7:d0d4:: with SMTP id u20mr1639967edo.203.1612338144977; 
 Tue, 02 Feb 2021 23:42:24 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id dm6sm586417ejc.32.2021.02.02.23.42.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Feb 2021 23:42:24 -0800 (PST)
Subject: Re: [PATCH] replay: rng-builtin support
To: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>, qemu-devel@nongnu.org
References: <161233201286.170686.7858208964037376305.stgit@pasha-ThinkPad-X280>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <3e9bfe1c-4df2-496b-a4af-5c8cb7d3e9b4@redhat.com>
Date: Wed, 3 Feb 2021 08:42:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <161233201286.170686.7858208964037376305.stgit@pasha-ThinkPad-X280>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.155, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: lvivier@redhat.com, amit@kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03/02/21 07:00, Pavel Dovgalyuk wrote:
> This patch enables using rng-builtin with record/replay
> by making the callbacks deterministic.
> 
> Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
> ---
>   backends/rng-builtin.c |    3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/backends/rng-builtin.c b/backends/rng-builtin.c
> index f38dff117d..f367eb665c 100644
> --- a/backends/rng-builtin.c
> +++ b/backends/rng-builtin.c
> @@ -10,6 +10,7 @@
>   #include "qemu/main-loop.h"
>   #include "qemu/guest-random.h"
>   #include "qom/object.h"
> +#include "sysemu/replay.h"
>   
>   OBJECT_DECLARE_SIMPLE_TYPE(RngBuiltin, RNG_BUILTIN)
>   
> @@ -37,7 +38,7 @@ static void rng_builtin_request_entropy(RngBackend *b, RngRequest *req)
>   {
>       RngBuiltin *s = RNG_BUILTIN(b);
>   
> -    qemu_bh_schedule(s->bh);
> +    replay_bh_schedule_event(s->bh);
>   }
>   
>   static void rng_builtin_init(Object *obj)
> 

Queued, thanks.

Paolo


