Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A62133E17C
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 23:37:57 +0100 (CET)
Received: from localhost ([::1]:49502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMIK3-00008R-VQ
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 18:37:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lMIHl-0007f2-RA
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 18:35:33 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:33012)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lMIHk-0007ce-B0
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 18:35:33 -0400
Received: by mail-wr1-x42e.google.com with SMTP id 7so11305577wrz.0
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 15:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=kx52BrnXTYQfLiTJmAXCupKe2GWehYI46K8VkFAjbLM=;
 b=FBhsk9MQQigOwkx66ztrN+4bHpgUhy6nTcVwjkqkeM1cmC/4mwlU/9oBYGhbGGnc6A
 OnC9HOlAniJOO/DeSuLhiLjSI0z6D/Cj0Gxzdb5Z+oRbzoKMuh+tCDVSRmXcqytjnDHJ
 KBNGP1MiFqvuT9m4iKM0g9lHHpH6WoJcLjb89DeDXChN/GAvkWxoMJ44dC/Sc3Rvp62k
 6WE/YRy5w/xx3s8BdQRe7e326tfLmzzomtGVEEQgWEYLav/X69mZLRTJ5pG3BnNuKhAP
 ubC+O2+0q9a1ZLDdt5X5DlztFd28sS4FX+yhAn3IX60C4cfQYrD+FKmykrSq2VEPxj1E
 fqLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kx52BrnXTYQfLiTJmAXCupKe2GWehYI46K8VkFAjbLM=;
 b=RtLUgJ59dbV6hEWZhFPtuZ92YbNKVG5iobDTwQzofuA6ju36Dz4qlYP+6MfmTBLxqu
 6VGGTUR1vky05V6pOZEVNfmmzU/w95tQbjNyUO8qvFdTaM4NjGZMjlYc0xExZg9qA6d3
 mJF4ra5H0mPULsWCeDF9TYPPVmabU4fm+nHESAVn9EAcg95nagAMKqFcvMCeBXznxdJn
 pnGX/2Ct3V+Wzgxz26lrEEseZa8lzESiaqzIY+1uipkqggdPDZpsnvRREulTg2llIwfY
 I+7sqyMZAs5mppVAM4jF7PUFHqywSeeiAKm8+BZo5vrOV0Fc/JkZeMI+XPx7zV2ZRiC3
 4lYQ==
X-Gm-Message-State: AOAM5335R21rXjY1C83pT+ddLjRrYuBIg46f0DwCZrT6xpgmaOg9HFsn
 By34OhyXP0wvKGKj1flv3k8=
X-Google-Smtp-Source: ABdhPJzXWD3SNhEgqVW5hfYjjK+++oHCy19Qxh3AtBthJpDHjZSl+elFn/cV2aQQ335apT9cY/6OaQ==
X-Received: by 2002:a5d:43cc:: with SMTP id v12mr1136665wrr.287.1615934130626; 
 Tue, 16 Mar 2021 15:35:30 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id l5sm647837wmh.0.2021.03.16.15.35.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Mar 2021 15:35:30 -0700 (PDT)
Subject: Re: [PATCH v5 22/57] tcg: Build ffi data structures for helpers
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210311143958.562625-1-richard.henderson@linaro.org>
 <20210311143958.562625-23-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <269e1fd0-dd33-c9db-8792-49c60be1ae16@amsat.org>
Date: Tue, 16 Mar 2021 23:35:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210311143958.562625-23-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: sw@weilnetz.de, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Richard,

On 3/11/21 3:39 PM, Richard Henderson wrote:
> We will shortly use libffi for tci, as that is the only
> portable way of calling arbitrary functions.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  meson.build                            |   9 +-
>  include/exec/helper-ffi.h              | 115 +++++++++++++++++++++++++
>  include/exec/helper-tcg.h              |  24 ++++--
>  target/hppa/helper.h                   |   2 +
>  target/i386/ops_sse_header.h           |   6 ++
>  target/m68k/helper.h                   |   1 +
>  target/ppc/helper.h                    |   3 +
>  tcg/tcg.c                              |  20 +++++
>  tests/docker/dockerfiles/fedora.docker |   1 +
>  9 files changed, 172 insertions(+), 9 deletions(-)
>  create mode 100644 include/exec/helper-ffi.h

> diff --git a/include/exec/helper-tcg.h b/include/exec/helper-tcg.h
> index 27870509a2..a71b848576 100644
> --- a/include/exec/helper-tcg.h
> +++ b/include/exec/helper-tcg.h
> @@ -10,50 +10,57 @@
>     to get all the macros expanded first.  */
>  #define str(s) #s
>  
> +#ifdef CONFIG_TCG_INTERPRETER
> +# define DO_CIF(NAME)  .cif = &cif_##NAME,

The comma in the macro bugs me... What about adding it as last field?

> +#else
> +# define DO_CIF(NAME)
> +#endif
> +
>  #define DEF_HELPER_FLAGS_0(NAME, FLAGS, ret) \
> -  { .func = HELPER(NAME), .name = str(NAME), \
> +  { .func = HELPER(NAME), DO_CIF(NAME) .name = str(NAME), \
>      .flags = FLAGS | dh_callflag(ret), \
>      .sizemask = dh_sizemask(ret, 0) },
>  
>  #define DEF_HELPER_FLAGS_1(NAME, FLAGS, ret, t1) \
> -  { .func = HELPER(NAME), .name = str(NAME), \
> +  { .func = HELPER(NAME), DO_CIF(NAME) .name = str(NAME), \
>      .flags = FLAGS | dh_callflag(ret), \
>      .sizemask = dh_sizemask(ret, 0) | dh_sizemask(t1, 1) },

> diff --git a/tests/docker/dockerfiles/fedora.docker b/tests/docker/dockerfiles/fedora.docker
> index 915fdc1845..8140fe67b2 100644
> --- a/tests/docker/dockerfiles/fedora.docker
> +++ b/tests/docker/dockerfiles/fedora.docker
> @@ -32,6 +32,7 @@ ENV PACKAGES \
>      libcurl-devel \
>      libepoxy-devel \
>      libfdt-devel \
> +    libffi-devel \
>      libiscsi-devel \
>      libjpeg-devel \
>      libpmem-devel \
> 

What happened to the other Docker images?

Otherwise the rest LGTM.

