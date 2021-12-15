Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D5E475E1D
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 18:04:29 +0100 (CET)
Received: from localhost ([::1]:41734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxXhc-0001B6-53
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 12:04:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mxXVt-00006A-5Z
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 11:52:22 -0500
Received: from [2607:f8b0:4864:20::1036] (port=43732
 helo=mail-pj1-x1036.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mxXVq-0002Ud-QX
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 11:52:20 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 a11-20020a17090a854b00b001b11aae38d6so339152pjw.2
 for <qemu-devel@nongnu.org>; Wed, 15 Dec 2021 08:52:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wSdIMCKdiN7KwN9P5Uo8tHa8hTVFrHM1rKeEsrjlwLI=;
 b=JCuO8CKQQzRPP8eCQ/1cY3PhOFasXjvUVvJKn/+6txpTW8bM4DtG93NqBe7ajPrmnt
 Z9aPYxDgPD3OulnQEHSSu5Kmpm1KQWh/xJmMJh6ooWkWtsGylwCNtxXFd6FC8SkkktOG
 zrnYuYiLrD7hC5vQJOLGgY6Hzte352cY/5HnW/iZrXi5ALsBARyR43aN2vGOejDqKudh
 17LWwGq1SBlL/RhPtT8QEr0OmF/DPjiY+1+w7UG1mOmrMBjfp3vfY2gW2VftCw6yCDt7
 4QKGz53omLNmI7MW1LKHffXHbHMORGIE/hB3gKJAurXSd2fkwXMjYFUwuz5pPul2sBo/
 gIiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wSdIMCKdiN7KwN9P5Uo8tHa8hTVFrHM1rKeEsrjlwLI=;
 b=TnTrucPleYcUIuHJYuzCKCLTMgKq/TTD2DcGliO2R0THXFG3LR1pZBBYQZCdrdY05G
 c/pVjKB4VmoZ0dPjqu+R8kksVq+VxBK7VuokYFkrJalKHwrPVcij+0/RxlicPYLozXfj
 4MGnAifpu9EfB4az9vgdETRlBBTKNJtJyXWm6yLnzyY2e9PSlyRhUP4xbcDERh9hd8BV
 9rJ+C+1NqVv7NfqIz+OGRmOghX06zsM+eey9skRZ4dZkMuj0Dj0p4NIuh9QV4X/k9Dck
 ZxVdgY2pcycdkG1sdgG5n0YC75c1BeJVGv302JSgr4u6PUWZTbeCe6HFh36PQ2EDV3RB
 4Nbg==
X-Gm-Message-State: AOAM532GgQTcWNvusEzVAKAf+AO/ostfEH7ffAaC9z0sbmqnFSKeTX+o
 8+SId7i8rFOJ+X0Irlc0oPvv0Q==
X-Google-Smtp-Source: ABdhPJxjYJ/3QOXItQnWnh9GYNCaJ3TSkXXC3R+xc+riuOKrN+Nr7VxYNUAmyOofhEzfIc1sEVOEkQ==
X-Received: by 2002:a17:902:c60b:b0:148:a78b:bef with SMTP id
 r11-20020a170902c60b00b00148a78b0befmr3862898plr.77.1639587136794; 
 Wed, 15 Dec 2021 08:52:16 -0800 (PST)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id p12sm3651082pfo.125.2021.12.15.08.52.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Dec 2021 08:52:16 -0800 (PST)
Subject: Re: [PATCH] linux-user: Remove the deprecated ppc64abi32 target
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>
References: <20211215084958.185214-1-thuth@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d4e9876b-d9c3-cc64-8992-6ba52c5a7fbb@linaro.org>
Date: Wed, 15 Dec 2021 08:52:14 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211215084958.185214-1-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1036
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.64,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Greg Kurz <groug@kaod.org>, qemu-ppc@nongnu.org,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/15/21 12:49 AM, Thomas Huth wrote:
> It's likely broken, and nobody cared for picking it up again
> during the deprecation phase, so let's remove this now.
> 
> Since this is the last entry in deprecated_targets_list, remove
> the related code in the configure script, too.
> 
> Signed-off-by: Thomas Huth<thuth@redhat.com>
> ---
>   .gitlab-ci.d/buildtest.yml                    | 27 -----------------
>   configs/targets/ppc64abi32-linux-user.mak     |  8 -----
>   configure                                     | 29 +------------------
>   docs/about/deprecated.rst                     |  7 -----
>   docs/about/removed-features.rst               |  8 +++++
>   docs/user/main.rst                            |  1 -
>   linux-user/elfload.c                          |  4 +--
>   linux-user/ppc/signal.c                       | 11 ++-----
>   linux-user/ppc/target_syscall.h               |  4 +--
>   linux-user/syscall_defs.h                     |  6 ++--
>   .../dockerfiles/debian-ppc64el-cross.docker   |  2 +-
>   tests/tcg/configure.sh                        |  2 +-
>   12 files changed, 21 insertions(+), 88 deletions(-)
>   delete mode 100644 configs/targets/ppc64abi32-linux-user.mak

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

