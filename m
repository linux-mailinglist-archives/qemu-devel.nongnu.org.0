Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A58883CEF8B
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 01:02:16 +0200 (CEST)
Received: from localhost ([::1]:34336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5cH9-0007yt-Og
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 19:02:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m5c7y-0006JW-7N
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 18:52:46 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:33328)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m5c7w-0000b4-HZ
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 18:52:45 -0400
Received: by mail-pf1-x436.google.com with SMTP id m83so18021376pfd.0
 for <qemu-devel@nongnu.org>; Mon, 19 Jul 2021 15:52:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=cz/02rpzus5rR5zPZgaw+yg+FqwCpOKtYhxwdCltEYo=;
 b=cadtX8WaXK6qz2vzBdDL7c1AYmmdTDJ9EbI7l4NepAn37+fj0Y4fPgsZz7cIPTPTyd
 k0gyxOL1+87JVWzpDk0zA+T3iCwHUFrjm5FRRDTQAOsulR6iJlWskKMID9CBzOU3laO6
 FeTqXFITV5f9ER4mCAkeSXUSn1QvEmLms1VWDQ52x3HwYzUawTIuiAj1j7MD/P+1Xqjz
 JVMzJeSYG2P4iCn+l3Jwvc0QCpgGhUhoQU1TfIppNlaJDv+/4Z/D07+7emmtw+hCCw1L
 t9iF/JcNxcHtlOgijhkY2XhMzdTRY22icy81i/EGbxk6tOnLTBPxCPpzrz+XeMxMLoWO
 fxrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cz/02rpzus5rR5zPZgaw+yg+FqwCpOKtYhxwdCltEYo=;
 b=HuE8DKMvlzfHq2K3KNUnIDtcA+QC+QVwYoS+jv24FC1ax71AA5AFSGSNdv3FL+u30Y
 /U+WlexT9OMJSQfy8NQrDTPM2HcZX0qs2XZtlG6ivhwfOqIaDkZ/LxwaOdwTZhV8/TKe
 H+Wew+1CB3vi1iv5pMU6KmabUukToJHo9W9RMoRAvo0v+gfcsKIgSFyYONC7yBfOxnHk
 +qqfh6acrFiA7hgW+21WqR3oZjevmw3SGjbUpyn0xKMRrpIsHi3TSeWz2MZfgmWSaAqM
 sKChnEiy/7mD+NLlxVg63SChQYQejo+hkMfG3qKorhvWcA3pmpZ/mx7jE3RdtCj3r5XB
 KIrg==
X-Gm-Message-State: AOAM532EZkUszS53Z4PRgMzlLCVkHM9DWLQtjJO3GAxvGtcHPtuhrxne
 PqrAODwGEeA0M7v/UU7qlYjX0g==
X-Google-Smtp-Source: ABdhPJzVMcK8kPjl25uwtbAg5ySz+ENbZAWVOPQUq4DJ1rrVFYx1prpBIrmZZE+AE5l9hv0GhYecwg==
X-Received: by 2002:a63:1926:: with SMTP id z38mr6113400pgl.451.1626735163041; 
 Mon, 19 Jul 2021 15:52:43 -0700 (PDT)
Received: from [192.168.3.43] (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id g4sm24653993pgn.45.2021.07.19.15.52.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Jul 2021 15:52:42 -0700 (PDT)
Subject: Re: [PATCH v2 2/2] gitlab: enable a very minimal build with the
 tricore container
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210719214825.2264-1-alex.bennee@linaro.org>
 <20210719214825.2264-3-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5bed073e-0fae-2153-e4fe-8cecb7b10998@linaro.org>
Date: Mon, 19 Jul 2021 12:52:39 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210719214825.2264-3-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Willian Rampazzo <willianr@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/19/21 11:48 AM, Alex Bennée wrote:
> diff --git a/tests/docker/dockerfiles/debian-tricore-cross.docker b/tests/docker/dockerfiles/debian-tricore-cross.docker
> index 985925134c..4ea9112289 100644
> --- a/tests/docker/dockerfiles/debian-tricore-cross.docker
> +++ b/tests/docker/dockerfiles/debian-tricore-cross.docker
> @@ -15,9 +15,39 @@ RUN git clone --single-branch \
>           https://github.com/bkoppelmann/tricore-binutils.git \
>           /usr/src/binutils && \
>       cd /usr/src/binutils && chmod +x missing && \
> -    CFLAGS=-w ./configure --prefix=/usr --disable-nls --target=tricore && \
> -    make && make install && \
> -    rm -rf /usr/src/binutils
> +    CFLAGS=-w ./configure --prefix=/usr/local --disable-nls --target=tricore && \
> +    make && make install
>   
> -# This image isn't designed for building QEMU but building tests
> -ENV QEMU_CONFIGURE_OPTS --disable-system --disable-user
> +FROM debian:buster-slim
> +# Duplicate deb line as deb-src
> +RUN cat /etc/apt/sources.list | sed "s/^deb\ /deb-src /" >> /etc/apt/sources.list
> +# Install very minimal QEMU build deps for use in CI
> +# $ lcitool variables debian-10 qemu+minimal
> +RUN apt update && \

Is there really an advantage here above basing this on debian-amd64?


r~

