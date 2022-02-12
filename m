Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A653A4B35D2
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Feb 2022 16:16:51 +0100 (CET)
Received: from localhost ([::1]:36638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIu8o-00018b-7l
	for lists+qemu-devel@lfdr.de; Sat, 12 Feb 2022 10:16:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nIu6S-0008It-0i
 for qemu-devel@nongnu.org; Sat, 12 Feb 2022 10:14:24 -0500
Received: from [2607:f8b0:4864:20::62c] (port=44822
 helo=mail-pl1-x62c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nIu6Q-0004Yu-48
 for qemu-devel@nongnu.org; Sat, 12 Feb 2022 10:14:23 -0500
Received: by mail-pl1-x62c.google.com with SMTP id y18so6980769plb.11
 for <qemu-devel@nongnu.org>; Sat, 12 Feb 2022 07:14:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Mmz08dlER61uQi9TBpBSKLvqoBt2++jwVcWei6Z4P8g=;
 b=DS43PmbHZ5AyqM+a+orhw6oYFlEU/cdO9XnIFUcUAUlIT7MBgT101LwV9OlNgN89bf
 nKU3/+SoWW/zPHph25eB1+EQ55qXjTO4O1Wq/tRjtZXtNP4qm2xJ7PtlpmHahw2HmVTl
 wWCihHHCnGsmCIbSbJWk4ppAbKEC8RPxGD4nfYlx2e/rWPqUGZUGn0+87WjSU4fJwUFT
 ic4BGWiw3CgwmNAYZM0mepGm02q0PsCBYL9iHtKJzZuugWvl9pPpvCaZOE7my04YuNYQ
 vinLD5Ket0PEjCj/Z539CeLnYKFhkzqlvZPoXN7+Lr6kJp2AtWYZ9adj4E63uFNn/Hhb
 ghzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Mmz08dlER61uQi9TBpBSKLvqoBt2++jwVcWei6Z4P8g=;
 b=pL/8RJ7L1VdTcDoREE6ORcTYe5kPQGWN+tJsswVxc9T4vaXik9O8yWTuJ2NW1LigNj
 91EXteaT1M+fD52vYihGACdgNmVteY6hniaUNaXtDWGt8iYEB9RK5aaXpq5vLCl/HWk+
 JS4bJV5wpBzuY/51ix5VyUoa0Arb3H0Dmnv+WDNdj6k6HLdjbq/qCLEaClSiqDrFrfbX
 gfiVDhD6cubik4G+KnmQviJWo4SQENnuUKzEW12DlRv00mGWe2MRo9cUcEykJDBi/2Xs
 aMLUBJx9/ZFGV1xPjqItwGuMwhjKFgpt4OAIGZGF6zIdbPc2NAYJmnTHZbOjiCMwTK6b
 TnkQ==
X-Gm-Message-State: AOAM531zHAmQ53LAFpBJ7HXzOfW7Ctjf1aH8AG0GQZ55iwBOatJ1KI9w
 WD3a6GblVl/QPMF7gSkDsYM=
X-Google-Smtp-Source: ABdhPJzObqSiXwV6+E/vk4b+geW1VJG9jrfE5hvFJOKBlqGRTsKvE7vm6htbJet3dxMrtdHcGgbA+g==
X-Received: by 2002:a17:902:d2ce:: with SMTP id
 n14mr6385262plc.20.1644678860311; 
 Sat, 12 Feb 2022 07:14:20 -0800 (PST)
Received: from [10.0.2.15] (p912131-ipoe.ipoe.ocn.ne.jp. [153.243.13.130])
 by smtp.gmail.com with ESMTPSA id a20sm25324441pfv.150.2022.02.12.07.14.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 12 Feb 2022 07:14:19 -0800 (PST)
Message-ID: <d1bfb5c5-8b7b-849d-d0a4-cab3ebe07057@gmail.com>
Date: Sun, 13 Feb 2022 00:14:13 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 01/13] lcitool: refresh
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20220211163434.58423-1-f4bug@amsat.org>
 <20220211163434.58423-2-f4bug@amsat.org>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
In-Reply-To: <20220211163434.58423-2-f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Li Zhang <lizhang@suse.de>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Will Cohen <wwcohen@gmail.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2022/02/12 1:34, Philippe Mathieu-Daudé via wrote:
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   tests/docker/dockerfiles/ubuntu1804.docker | 2 --
>   tests/docker/dockerfiles/ubuntu2004.docker | 2 --
>   2 files changed, 4 deletions(-)
> 
> diff --git a/tests/docker/dockerfiles/ubuntu1804.docker b/tests/docker/dockerfiles/ubuntu1804.docker
> index 699f2dfc6a..040938277a 100644
> --- a/tests/docker/dockerfiles/ubuntu1804.docker
> +++ b/tests/docker/dockerfiles/ubuntu1804.docker
> @@ -65,7 +65,6 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
>               libpam0g-dev \
>               libpcre2-dev \
>               libpixman-1-dev \
> -            libpmem-dev \
>               libpng-dev \
>               libpulse-dev \
>               librbd-dev \
> @@ -89,7 +88,6 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
>               libvdeplug-dev \
>               libvirglrenderer-dev \
>               libvte-2.91-dev \
> -            libxen-dev \
>               libzstd-dev \
>               llvm \
>               locales \
> diff --git a/tests/docker/dockerfiles/ubuntu2004.docker b/tests/docker/dockerfiles/ubuntu2004.docker
> index 87513125b8..159e7f60c9 100644
> --- a/tests/docker/dockerfiles/ubuntu2004.docker
> +++ b/tests/docker/dockerfiles/ubuntu2004.docker
> @@ -66,7 +66,6 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
>               libpam0g-dev \
>               libpcre2-dev \
>               libpixman-1-dev \
> -            libpmem-dev \
>               libpng-dev \
>               libpulse-dev \
>               librbd-dev \
> @@ -91,7 +90,6 @@ RUN export DEBIAN_FRONTEND=noninteractive && \
>               libvdeplug-dev \
>               libvirglrenderer-dev \
>               libvte-2.91-dev \
> -            libxen-dev \
>               libzstd-dev \
>               llvm \
>               locales \

This can't be applied to master.

% git am ~/mbox.txt
Applying: lcitool: refresh
error: patch failed: tests/docker/dockerfiles/ubuntu1804.docker:89
error: tests/docker/dockerfiles/ubuntu1804.docker: patch does not apply
error: patch failed: tests/docker/dockerfiles/ubuntu2004.docker:91
error: tests/docker/dockerfiles/ubuntu2004.docker: patch does not apply
Patch failed at 0001 lcitool: refresh

Regards,
Akihiko Odaki

