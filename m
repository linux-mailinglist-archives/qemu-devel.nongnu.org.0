Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9AB44EAB27
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 12:20:00 +0200 (CEST)
Received: from localhost ([::1]:43192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZ8xD-000405-6q
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 06:19:59 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nZ8uz-0002xn-1w; Tue, 29 Mar 2022 06:17:41 -0400
Received: from [2a00:1450:4864:20::42d] (port=46069
 helo=mail-wr1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nZ8ux-0006dx-Gn; Tue, 29 Mar 2022 06:17:40 -0400
Received: by mail-wr1-x42d.google.com with SMTP id w4so24025393wrg.12;
 Tue, 29 Mar 2022 03:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=TdgSNRAb6NvzClbdHu9ydEIQUW3jmq7FP1djIC/u9mQ=;
 b=VDqMcM2YENg5x/pLfjyO1Q4wtQQw3x6cCEM0FBLXXMdY3Bsrb0ANessrJGCqza6LG7
 mOrTw+tzE4cpQLtPVkJp3XIljuPMBAyeN+7XjEiJQvSJVkmM+FTAcYIzV6vzwEF51nqS
 LXCU+W+6mDZETv2WOrhiKAHQcJ2aqIkzFXlbzCr8mqo25+e6x0dQbxFsd8KQdjPF6U/e
 euR0fqidriD+toVHE0BlosqHxlS0ah1MP2Hz6r9bS/voLUZWGY9aX3+/62zL5UQK/NjQ
 rW/C3IB6Jq3hq1Oil48dOLr+g+ab7xLInu7vS4UPRLuKCV9o0slFjizYzv+N5qzvOiqU
 Y3bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=TdgSNRAb6NvzClbdHu9ydEIQUW3jmq7FP1djIC/u9mQ=;
 b=rXl5NCFhc+qsBdy6DxjpPMVBU/cjid10Lfmjsyanh5qx9MFf1UHt1rkL1dwB5sY6Ho
 VCXXq+bIG1CwX6wxMagencgNjNNuHPmHcUIshD+b8VejGWfA86a/u6erMx2jl+Vk0m4n
 keB92tHSVP+be+n4B7x46BURi0gMbGP0/WhBlvw6Ne7STWOK8PQp3gUCgCdiwaeqODKU
 mRemS+SS/Lc+2S8jziks48JhZ6x+oyxWpSNc9JLIuae0Tzmync6xMYR6a/r7xGgAKqg+
 +PhUy9EPq51ORSfzODSCB/b5QL9lurHxOipbqqZosUBPrr/HaHrQV71qwYlyT5YeZVWn
 yi/Q==
X-Gm-Message-State: AOAM530urKA9uReiZps1A2hzYO/ussI2E9icjZnzbXg0cENgsBXOXNUP
 eZ6kQksQh0vAmu97ZldFPpY=
X-Google-Smtp-Source: ABdhPJypuoVW/HerY/EggAxCN1cZj735YunLLhznWkRkffx0ghCiBao3Q7Nv9/BHDYE3Lu7WFM2z6g==
X-Received: by 2002:a5d:59a2:0:b0:204:19bc:42ff with SMTP id
 p2-20020a5d59a2000000b0020419bc42ffmr29684807wrr.687.1648549057228; 
 Tue, 29 Mar 2022 03:17:37 -0700 (PDT)
Received: from ?IPV6:2600:70ff:f07f:0:d557:f3bb:5d8b:b5f3?
 ([2600:70ff:f07f:0:d557:f3bb:5d8b:b5f3])
 by smtp.gmail.com with ESMTPSA id
 j16-20020a05600c191000b0038c9249ffdesm2025817wmq.9.2022.03.29.03.17.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Mar 2022 03:17:36 -0700 (PDT)
Message-ID: <dab63073-d532-2795-fce4-77bd0839f578@gmail.com>
Date: Tue, 29 Mar 2022 12:17:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH for-7.0] main-loop: Disable GLOBAL_STATE_CODE() assertions
Content-Language: en-US
To: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
References: <20220329093545.52114-1-hreitz@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220329093545.52114-1-hreitz@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Akihiko Odaki <akihiko.odaki@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 29/3/22 11:35, Hanna Reitz wrote:
> These assertions are very useful for developers to find bugs, and so
> they have indeed pointed us towards bugs already.  For users, it is not
> so useful to find these bugs.  We should probably not enable them in
> releases until we are sufficiently certain that they will not fire
> during normal operation, unless something is going seriously wrong.
> 
> For example, we have received a bug report that you cannot add an NBD
> server on a BDS in an I/O thread with `-incoming defer`.  I am sure this
> is a real bug that needs investigation, but we do not really have that
> time right now, so close to release, and so I would rather disable the
> assertions to get time to investigate such reports.
> 
> (I am just putting the link as "buglink" below, not "closes", because
> disabling the assertion will not fix the likely underlying bug.)
> 
> Buglink: https://gitlab.com/qemu-project/qemu/-/issues/945

Also helps:
https://gitlab.com/qemu-project/qemu/-/issues/926

> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
> ---
>   include/qemu/main-loop.h | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/include/qemu/main-loop.h b/include/qemu/main-loop.h
> index 7a4d6a0920..3bf8aeb3cd 100644
> --- a/include/qemu/main-loop.h
> +++ b/include/qemu/main-loop.h
> @@ -272,7 +272,8 @@ bool qemu_in_main_thread(void);
>   /* Mark and check that the function is part of the global state API. */
>   #define GLOBAL_STATE_CODE()                                         \
>       do {                                                            \
> -        assert(qemu_in_main_thread());                              \
> +        /* FIXME: Re-enable after 7.0 release */                    \
> +        /* assert(qemu_in_main_thread()); */                        \
>       } while (0)
>   
>   /* Mark and check that the function is part of the I/O API. */

Do you want me to cancel/repost my PR without this patch?

https://lore.kernel.org/qemu-devel/20220328224012.32737-3-philippe.mathieu.daude@gmail.com/

Otherwise:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


