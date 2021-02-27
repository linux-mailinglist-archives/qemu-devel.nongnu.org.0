Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCB8C326D5D
	for <lists+qemu-devel@lfdr.de>; Sat, 27 Feb 2021 15:11:57 +0100 (CET)
Received: from localhost ([::1]:43088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lG0K4-00032b-BZ
	for lists+qemu-devel@lfdr.de; Sat, 27 Feb 2021 09:11:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lG0Is-0002bi-VT
 for qemu-devel@nongnu.org; Sat, 27 Feb 2021 09:10:42 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:52217)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lG0In-0006qy-NX
 for qemu-devel@nongnu.org; Sat, 27 Feb 2021 09:10:42 -0500
Received: by mail-wm1-x32b.google.com with SMTP id g11so5850072wmh.1
 for <qemu-devel@nongnu.org>; Sat, 27 Feb 2021 06:10:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=toqVQY8/Zjx9tC0VpERDdwTMPf2Ew2IJHgU7FCMsxeA=;
 b=IIkOt5NW9GfdQ5d5PrLwvGMt/QsDkok6mY2KQdndCjtzAG3WQolfc2+oI1AIx26vNk
 EyoEs3IA42F87cVVZA9g5KrZlzD9YhzKDLBpzDkB0GA22Pny5fVt/vmn4lV+W83hOLGQ
 pNVnNj7RQc271lPyYdGNG+zJK2nL2+T1DuSFAj2uS0XEK4Wr0upbTNqftaIfn5cnJBRX
 nm75tLBSr3e5wmh4oJe+apANpqorYSx/WLBKOKza8k3mwdC0klFIUg6R/kt8E3ad0vVx
 JdWO6t95Cr3csZG8FHap3HzwaRvK/IyYIUW7t+aa1mLS1p8pVXTwgsVjq7KEo/t3sVdZ
 ZLiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=toqVQY8/Zjx9tC0VpERDdwTMPf2Ew2IJHgU7FCMsxeA=;
 b=pchGFGz4MbvW651PbZz2c90dPNIFP4ro7ZIZRHKHvmEmi7DsNB3IsDG/l4Hbcxu/pn
 egWZsZEW8JpQ0BqGE6Oyl/UxyFfNPeY7yDUP1jmLwGJBS5lLom8fFtMd+X8oJolQ1kow
 UGdS2CUPwezmwB0yMauBy1+X6To8Nz3Sjjz0LcRH53o9wyDv+y+fGYRgVY0dgLx5zoJg
 rFY+pB/6nD/9VuiplRPvjPQk9mhR+iobnmlOsos98tU/0nO9znx3Tbos98KNU1eoEgsd
 w4/LtonBBm9m03cu/gT4zTW6UbBkKH9NBcEmyw3S6tc7dGu/1afooAdKA2jY5CiepKxB
 NyGw==
X-Gm-Message-State: AOAM5306663S8gxptcKr00Rf9AomJFlrNScKBgAy0rmKZU0rGPUXdERn
 p1oLlX3AOrRQZM8rVNiCE6Q=
X-Google-Smtp-Source: ABdhPJwBSs9UkOEXnzuGpFMBV5pHb/JypNEVTlyzUwL80wTNYzQEqph5KoSXLwjiVVpHGnqI+aqJvA==
X-Received: by 2002:a05:600c:4f0c:: with SMTP id
 l12mr7323359wmq.16.1614435031383; 
 Sat, 27 Feb 2021 06:10:31 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id k4sm22457201wrd.9.2021.02.27.06.10.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 27 Feb 2021 06:10:30 -0800 (PST)
Subject: Re: [PATCH v8 35/35] Add Dockerfile for hexagon
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1612763186-18161-1-git-send-email-tsimpson@quicinc.com>
 <1612763186-18161-36-git-send-email-tsimpson@quicinc.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <66686d28-86ae-574f-b9af-66b154e85424@amsat.org>
Date: Sat, 27 Feb 2021 15:10:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <1612763186-18161-36-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.35,
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
Cc: ale@rev.ng, Fam Zheng <fam@euphon.net>, bcain@quicinc.com,
 richard.henderson@linaro.org, laurent@vivier.eu, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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
...

> +build_llvm_clang() {
> +  fetch "$BASE/llvm-project" "$LLVM_URL"
> +  cdp "$BASE/build-llvm"
> +
> +  cmake -G Ninja \
> +    -DCMAKE_BUILD_TYPE=Release \
> +    -DCMAKE_INSTALL_PREFIX=${TOOLCHAIN_INSTALL} \
> +    -DLLVM_ENABLE_LLD=ON \
> +    -DLLVM_TARGETS_TO_BUILD="X86;Hexagon" \

Is the X86 target really required?

> +    -DLLVM_ENABLE_PROJECTS="clang;lld" \
> +    "$BASE/llvm-project/llvm"
> +  ninja all install
> +  cd ${TOOLCHAIN_BIN}
> +  ln -sf clang hexagon-unknown-linux-musl-clang
> +  ln -sf clang++ hexagon-unknown-linux-musl-clang++
> +  ln -sf llvm-ar hexagon-unknown-linux-musl-ar
> +  ln -sf llvm-objdump hexagon-unknown-linux-musl-objdump
> +  ln -sf llvm-objcopy hexagon-unknown-linux-musl-objcopy
> +  ln -sf llvm-readelf hexagon-unknown-linux-musl-readelf
> +  ln -sf llvm-ranlib hexagon-unknown-linux-musl-ranlib
> +
> +  # workaround for now:
> +  cat <<EOF > hexagon-unknown-linux-musl.cfg
> +-G0 --sysroot=${HEX_SYSROOT}
> +EOF
> +}

