Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DE644B196C
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 00:27:43 +0100 (CET)
Received: from localhost ([::1]:46672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIIqk-000088-6X
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 18:27:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nIIp2-0007e6-0C
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 18:25:56 -0500
Received: from [2607:f8b0:4864:20::42f] (port=41596
 helo=mail-pf1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nIIoz-0004y0-SU
 for qemu-devel@nongnu.org; Thu, 10 Feb 2022 18:25:55 -0500
Received: by mail-pf1-x42f.google.com with SMTP id i30so13025407pfk.8
 for <qemu-devel@nongnu.org>; Thu, 10 Feb 2022 15:25:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=xKC7a/4F0k2YU7iGRcqzw9fkRBTQuxDuHp8aGEhCDuY=;
 b=dlb4wtJo4yIhaFJKKYZ3ehZQavzqlnbcnhaS0rIiZbZQUwwD+IZQ75U6byrDMO6YxS
 cNJWAyjuF+WfiiBJ8p8T71VQqNugQAoyVULaKgXnLz2P5DeU3YxWuhsHh9PgJPJGq0np
 7axNv2/piosGpNST4W7mWGoq4H83UO4NpOhhoK8COD49cl3I7CtlQuvviJxeoQEesRN2
 tTBIlQTdLRBULkw+R4lYbmHeSeQd6CzkS7E5AYq8l2PYo5G1O9sf16wkXCBOcul66GuG
 2Tv9wCJJDDePErg4P33FLFeunqfVCbmtY89EoT7S9YzqrP8OqE29FAqoGP1e7IqL7rhv
 j9sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=xKC7a/4F0k2YU7iGRcqzw9fkRBTQuxDuHp8aGEhCDuY=;
 b=MS3loQmV4EWxjSOMhkLs4MX69V926yxSAtE2NJpTGQd1u6tEsh3IKCsGBV5hLNjxW2
 twJ5GIKJag1FKs0iltcY9W2GAjgUEz1wvw2bMcEjGavlUlEnMKmagrmVUF4usBeXy8NN
 SW02P54wzyjDEdFU+RItqTS6Aaob1FXt0eDhdVbKcJRRDQGoSzsuRiCuIdDlmKFXALqj
 5aGhznVd8n0qJqszof1vrfP9t+gPmNhVK9wqti+Z2wGYEH4Q8wbOKcl3gSVXccvicanf
 mQvm6IKcPyoAT9clYiBEfxgSjCnj5hTenzogAhn2mIOlsSyT/v3BmD8jj0cQtFXLfC1t
 4hvQ==
X-Gm-Message-State: AOAM533T7vccUoONHIx0b9HhG7gOj/GwCNAOXjuWchViiu97QtqUdOUt
 uLqZuX4HezahjYxkeEFdJuM0lw==
X-Google-Smtp-Source: ABdhPJyOWXPjvl2+2Jmaj6Tm2gHcCBAWb01J22zYTGLcw5i/TqjuxsZwsLGFKBn1XCL3n5LO0rMFng==
X-Received: by 2002:a63:1666:: with SMTP id 38mr7908520pgw.499.1644535552633; 
 Thu, 10 Feb 2022 15:25:52 -0800 (PST)
Received: from [10.0.0.163] ([124.189.222.164])
 by smtp.gmail.com with ESMTPSA id t2sm23858781pfg.207.2022.02.10.15.25.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Feb 2022 15:25:52 -0800 (PST)
Message-ID: <06019c44-0623-e08a-2819-07422c5dbf22@linaro.org>
Date: Fri, 11 Feb 2022 10:25:46 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/9] accel/tcg: Add missing 'tcg/tcg.h' header
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20220209230030.93987-1-f4bug@amsat.org>
 <20220209230030.93987-2-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220209230030.93987-2-f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Riku Voipio <riku.voipio@iki.fi>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/10/22 10:00, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   accel/tcg/tcg-accel-ops-icount.c | 1 +
>   accel/tcg/tcg-accel-ops-mttcg.c  | 1 +
>   accel/tcg/tcg-accel-ops-rr.c     | 1 +
>   accel/tcg/tcg-accel-ops.c        | 1 +
>   4 files changed, 4 insertions(+)

What exactly are these files using from tcg.h?
I briefly scanned tcg-accel-ops-icount.c and didn't see anything.


r~


> 
> diff --git a/accel/tcg/tcg-accel-ops-icount.c b/accel/tcg/tcg-accel-ops-icount.c
> index bdaf2c943b..379a9d44f4 100644
> --- a/accel/tcg/tcg-accel-ops-icount.c
> +++ b/accel/tcg/tcg-accel-ops-icount.c
> @@ -31,6 +31,7 @@
>   #include "qemu/main-loop.h"
>   #include "qemu/guest-random.h"
>   #include "exec/exec-all.h"
> +#include "tcg/tcg.h"
>   
>   #include "tcg-accel-ops.h"
>   #include "tcg-accel-ops-icount.h"
> diff --git a/accel/tcg/tcg-accel-ops-mttcg.c b/accel/tcg/tcg-accel-ops-mttcg.c
> index dc421c8fd7..de7dcb02e6 100644
> --- a/accel/tcg/tcg-accel-ops-mttcg.c
> +++ b/accel/tcg/tcg-accel-ops-mttcg.c
> @@ -33,6 +33,7 @@
>   #include "qemu/guest-random.h"
>   #include "exec/exec-all.h"
>   #include "hw/boards.h"
> +#include "tcg/tcg.h"
>   
>   #include "tcg-accel-ops.h"
>   #include "tcg-accel-ops-mttcg.h"
> diff --git a/accel/tcg/tcg-accel-ops-rr.c b/accel/tcg/tcg-accel-ops-rr.c
> index a805fb6bdd..889d0882a2 100644
> --- a/accel/tcg/tcg-accel-ops-rr.c
> +++ b/accel/tcg/tcg-accel-ops-rr.c
> @@ -32,6 +32,7 @@
>   #include "qemu/notify.h"
>   #include "qemu/guest-random.h"
>   #include "exec/exec-all.h"
> +#include "tcg/tcg.h"
>   
>   #include "tcg-accel-ops.h"
>   #include "tcg-accel-ops-rr.h"
> diff --git a/accel/tcg/tcg-accel-ops.c b/accel/tcg/tcg-accel-ops.c
> index ea7dcad674..58e4b09043 100644
> --- a/accel/tcg/tcg-accel-ops.c
> +++ b/accel/tcg/tcg-accel-ops.c
> @@ -33,6 +33,7 @@
>   #include "qemu/main-loop.h"
>   #include "qemu/guest-random.h"
>   #include "exec/exec-all.h"
> +#include "tcg/tcg.h"
>   
>   #include "tcg-accel-ops.h"
>   #include "tcg-accel-ops-mttcg.h"


