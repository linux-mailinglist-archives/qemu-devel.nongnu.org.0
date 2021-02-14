Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49E3631B232
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Feb 2021 20:20:08 +0100 (CET)
Received: from localhost ([::1]:42488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBMwB-0000zu-C5
	for lists+qemu-devel@lfdr.de; Sun, 14 Feb 2021 14:20:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lBMTo-00029c-Fp
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 13:50:48 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:38347)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lBMTl-0006Zl-N7
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 13:50:47 -0500
Received: by mail-wm1-x334.google.com with SMTP id x4so5897747wmi.3
 for <qemu-devel@nongnu.org>; Sun, 14 Feb 2021 10:50:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=GpvO/jREYvFeZ96qlPKXjWoAh3/GkDg4xkIwAX1Jub0=;
 b=ojhYS88GYtsQOy9UV8w3l3t5ddSfA1/jSNMTA5pgljDDswWztgZ0IGIRCQG9llJpee
 9DlU1ApDZBfHEdrvIzSgxOzevOzKD+aCmoGfuHBVXm4BFrtpGCJC4O4Z+ErfV9/EoXfJ
 KS2lIqzeGyYvYI91hXnS52btokrbNsORve5cWwnV+vPcKfd7SSyDk7WumUrQQEgHM/ur
 d0F/GOHgUygU1WZCfVSt+C+bkF+YCBzZl/ew7gdJ/AZo9K1ybnWJek3hMBcRnZBb6EaB
 EPUpENKm6ssm594G5bT9BaxD6ApT279IdXUUW7dUxZ5gwX356Be7cJ9a5XUcrwy5n8uz
 nNfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GpvO/jREYvFeZ96qlPKXjWoAh3/GkDg4xkIwAX1Jub0=;
 b=rPKJiz6yXGUWcr95EwedwElqgmM5ArjUPlijXDPxQj+NxGhIR9cQq1SQey39H1J+fL
 W/GgpH45HvzxFQ4LAkJYs0E/YNJ8mIwnocZc8kM4N9OxBgq3CQl2dkqVfM25Mnyl18rG
 O56kkvTd83Vzu74LxJVKBo7UMlH62duqxvl141QPMgvIc/Oe9dCkxovSsemT5QkiChVO
 3u3vhHUrP9bIjM0ola37iuj421yNfW826sYHDp2Zm+U4PkTXMuPg+O3+DHPeCx9G2RtY
 TNT2fer+5iE/XKzooI3Ghdw/FCbNe+olfIBNqnbaaqIoruOxoYuuDqGLmr9+r07zOYMz
 d8og==
X-Gm-Message-State: AOAM5333Z40Ok/zUKSRPy7eRV8kjizyFhBj2aTTBz27iViek0Z0BGFve
 EFKh0bid6dsls6WIB70BDrw=
X-Google-Smtp-Source: ABdhPJyt2YTlSmbMYvjxk/SQV7ef3U3y6MiqmIKa4Izzn4VrUnfmgcha53PlWbr4LDwM64zWi77T6g==
X-Received: by 2002:a1c:720d:: with SMTP id n13mr11154991wmc.103.1613328644241; 
 Sun, 14 Feb 2021 10:50:44 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id c11sm19878658wrs.28.2021.02.14.10.50.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 14 Feb 2021 10:50:43 -0800 (PST)
Subject: Re: [PATCH v8 35/35] Add Dockerfile for hexagon
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <1612763186-18161-1-git-send-email-tsimpson@quicinc.com>
 <1612763186-18161-36-git-send-email-tsimpson@quicinc.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <6a5411a3-3d48-d30e-df70-4c73328c5fed@amsat.org>
Date: Sun, 14 Feb 2021 19:50:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <1612763186-18161-36-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: ale@rev.ng, bcain@quicinc.com, Fam Zheng <fam@euphon.net>,
 richard.henderson@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Alessandro!

On 2/8/21 6:46 AM, Taylor Simpson wrote:
> From: Alessandro Di Federico <ale@rev.ng>
> 
> Signed-off-by: Alessandro Di Federico <ale@rev.ng>
> Tested-by: Taylor Simpson <tsimpson@quicinc.com>
> ---
>  .../debian-hexagon-cross-build-local.docker        |  18 +++
>  .../debian-hexagon-cross.build-toolchain.sh        | 141 +++++++++++++++++++++
>  .../docker/dockerfiles/debian-hexagon-cross.docker |   1 +
>  tests/tcg/configure.sh                             |   4 +
>  4 files changed, 164 insertions(+)
>  create mode 100644 tests/docker/dockerfiles/debian-hexagon-cross-build-local.docker
>  create mode 100755 tests/docker/dockerfiles/debian-hexagon-cross.build-toolchain.sh
>  create mode 100644 tests/docker/dockerfiles/debian-hexagon-cross.docker
> 
> diff --git a/tests/docker/dockerfiles/debian-hexagon-cross-build-local.docker b/tests/docker/dockerfiles/debian-hexagon-cross-build-local.docker
> new file mode 100644
> index 0000000..355adbf
> --- /dev/null
> +++ b/tests/docker/dockerfiles/debian-hexagon-cross-build-local.docker
> @@ -0,0 +1,18 @@
> +FROM debian:10
> +
> +RUN apt update && \
> +    DEBIAN_FRONTEND=noninteractive \
> +    apt install -y --no-install-recommends \
> +        ca-certificates build-essential cmake clang lld ninja-build \
> +	flex bison pkg-config wget python3 rsync
> +
> +ENV TOOLCHAIN_INSTALL /usr
> +ENV ROOTFS /usr
> +
> +ENV LLVM_URL https://github.com/llvm/llvm-project/archive/3d8149c2a1228609fd7d7c91a04681304a2f0ca9.tar.gz
> +ENV MUSL_URL https://github.com/quic/musl/archive/aff74b395fbf59cd7e93b3691905aa1af6c0778c.tar.gz
> +ENV LINUX_URL https://cdn.kernel.org/pub/linux/kernel/v5.x/linux-5.6.18.tar.xz
> +
> +COPY debian-hexagon-cross.build-toolchain.sh /root/hexagon-toolchain/

I had to add this to build your image with QEMU build system:

-- >8 --
diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index 93b29ad823e..ba73fb4b1f0 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -146,6 +146,8 @@ docker-image-debian-riscv64-cross: docker-image-debian10
 docker-image-debian-s390x-cross: docker-image-debian10
 docker-image-debian-sh4-cross: docker-image-debian10
 docker-image-debian-sparc64-cross: docker-image-debian10
+docker-image-debian-hexagon-cross-build-local: \
+
EXTRA_FILES:=$(SRC_PATH)/tests/docker/dockerfiles/debian-hexagon-cross.build-toolchain.sh

 docker-image-travis: NOUSER=1

---

> +++ b/tests/docker/dockerfiles/debian-hexagon-cross.docker
> @@ -0,0 +1 @@
> +FROM revng/qemu:debian-hexagon-cross

Once this patch gets merged, the image will be available on
qemu/qemu:debian-hexagon-cross.

I suppose for the final merge patch we want:
- rm debian-hexagon-cross.docker
- mv debian-hexagon-cross-build-local.docker debian-hexagon-cross.docker

Is that correct? If so, can you amend that detail after the '---'
separator of the commit description so we don't merge this patch
as it?

Also, can you add a job to build your image in .gitlab-ci.d/containers.yml?

Meanwhile:
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Regards,

Phil.

