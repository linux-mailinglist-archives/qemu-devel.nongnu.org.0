Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D16D301012
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 23:36:34 +0100 (CET)
Received: from localhost ([::1]:38842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l352f-0005vR-2X
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 17:36:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l350u-0005TE-1r
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 17:34:44 -0500
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:42688)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l350s-0004ir-7u
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 17:34:43 -0500
Received: by mail-ed1-x533.google.com with SMTP id g24so8289836edw.9
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 14:34:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=iGQ8HNrjW9kJLHY/7iqZvyQE84TDa3sRYIVhBaaxj9k=;
 b=Xr9xIfSI0DYT7V8gRPeTJA+LlFMFkX5bPWpEYR4PHtIRLrCNnELsfFfx4ANCgO6jca
 N72wB1l6B1WmFhTryfeakMdzjI2y0HdZjdBFP8iytlSZZknmBQkZB3fwS4eTHgE7KHBp
 yANY249JkPLij14+z0XZueDpLauy0edzNmHilIviAp7/YlciRUo6WMftwN+MGfm2IA65
 61PbTE+PYb0jpzUzkjn5vGz7xfkdXnMweTY57gh46j5hxNBJ67czf0/FTRIEgQB3aDQD
 SiJzU3WYeA/Qysnq/4yW2lwzberh0jzHs2iOi+uISURQl1zp/dw5UKf26Zm6bn2ah30z
 siFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iGQ8HNrjW9kJLHY/7iqZvyQE84TDa3sRYIVhBaaxj9k=;
 b=SSwR0QuURDxe6EXALGg/YJihhFJNmpNXzO2ldvIRhe44B1dB1DRXzxD9SbXkxJLsCy
 eGtktfBANkCSxMx3i6uqie8DxMhIt71rC/+s6Rgg6TB5rhd99PDp60J+dtWIcdw0D9Zx
 5UMB5RWGjLDdWplnxKZ7HXTz/8509cXSZGGKr9oi0OVqtkK1S/bBCFDeVSh15WhyOR5Z
 qvyaf+qG/cIYqNZ4Jxg06X0ApurtDFj2AGaKtHlVXd0lyFWs0jle9xvgbBz/OmJ9tMcu
 iHz92HH7Q/R7VRngYQbsK2O9yx5Vll0dAW/JUmYXFf9JGbPCQfft7rM9faIGUAU2GRue
 u9LA==
X-Gm-Message-State: AOAM530+c+UH0fPXnBJFrlMeJwFSI5u8ZUovCzgvPU2MI7i5JYR5FF9l
 tJc180tsCz07XdhyAi555fA=
X-Google-Smtp-Source: ABdhPJzQsHADygS5a0IdzKGEHMoXSK833Su5GKP1rpvUlFONR/opLNrmP55i3s8umU6ZCjJoGe8LOg==
X-Received: by 2002:aa7:c384:: with SMTP id k4mr4803860edq.23.1611354880538;
 Fri, 22 Jan 2021 14:34:40 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id x16sm5410883ejc.22.2021.01.22.14.34.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Jan 2021 14:34:39 -0800 (PST)
Subject: Re: [PATCH v7 34/35] Hexagon build infrastructure
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
References: <1611113349-24906-1-git-send-email-tsimpson@quicinc.com>
 <1611113349-24906-35-git-send-email-tsimpson@quicinc.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <0cd4a077-9358-4216-1dd2-d7212f5d082f@amsat.org>
Date: Fri, 22 Jan 2021 23:34:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <1611113349-24906-35-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x533.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.221,
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
Cc: ale@rev.ng, alex.bennee@linaro.org, richard.henderson@linaro.org,
 laurent@vivier.eu, bcain@quicinc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/20/21 4:29 AM, Taylor Simpson wrote:
> Add file to default-configs
> Add hexagon to meson.build
> Add hexagon to target/meson.build
> Add target/hexagon/meson.build
> Change scripts/qemu-binfmt-conf.sh
> 
> We can build a hexagon-linux-user target and run programs on the Hexagon
> scalar core.  With hexagon-linux-clang installed, "make check-tcg" will
> pass.
> 
> Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
> ---
>  default-configs/targets/hexagon-linux-user.mak |   1 +
>  meson.build                                    |   1 +
>  scripts/qemu-binfmt-conf.sh                    |   6 +-
>  target/hexagon/meson.build                     | 187 +++++++++++++++++++++++++
>  target/meson.build                             |   1 +
>  5 files changed, 195 insertions(+), 1 deletion(-)
>  create mode 100644 default-configs/targets/hexagon-linux-user.mak
>  create mode 100644 target/hexagon/meson.build
...

> +++ b/target/hexagon/meson.build
> @@ -0,0 +1,187 @@
> +##
> +##  Copyright(c) 2020-2021 Qualcomm Innovation Center, Inc. All Rights Reserved.
> +##
> +##  This program is free software; you can redistribute it and/or modify
> +##  it under the terms of the GNU General Public License as published by
> +##  the Free Software Foundation; either version 2 of the License, or
> +##  (at your option) any later version.
> +##
> +##  This program is distributed in the hope that it will be useful,
> +##  but WITHOUT ANY WARRANTY; without even the implied warranty of
> +##  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> +##  GNU General Public License for more details.
> +##
> +##  You should have received a copy of the GNU General Public License
> +##  along with this program; if not, see <http://www.gnu.org/licenses/>.
> +##
> +
> +hexagon_ss = ss.source_set()
> +
> +prog_python = import('python').find_installation('python3')
> +
> +hex_common_py = 'hex_common.py'
> +attribs_def_h = meson.current_source_dir() / 'attribs_def.h'
> +gen_tcg_h = meson.current_source_dir() / 'gen_tcg.h'
> +
> +#
> +#  Step 1
> +#  We use a C program to create semantics_generated.pyinc
> +#
> +gen_semantics = executable('gen_semantics', 'gen_semantics.c')
> +
> +semantics = custom_target(
> +    'semantics_generated.pyinc',
> +    output: 'semantics_generated.pyinc',
> +    input: gen_semantics,
> +    command: ['@INPUT@', '@OUTPUT@'],
> +)
> +hexagon_ss.add(semantics)

Is something missing here?

$ make -j8
[316/1048] Generating semantics_generated.pyinc with a custom command
FAILED: target/hexagon/semantics_generated.pyinc
target/hexagon/gen_semantics target/hexagon/semantics_generated.pyinc
/bin/sh: 1: target/hexagon/gen_semantics: not found
ninja: build stopped: subcommand failed.

$ make target/hexagon/semantics_generated.pyinc V=1
/usr/bin/ninja -v   -j1  target/hexagon/semantics_generated.pyinc | cat
[1/1] target/hexagon/gen_semantics target/hexagon/semantics_generated.pyinc
FAILED: target/hexagon/semantics_generated.pyinc
target/hexagon/gen_semantics target/hexagon/semantics_generated.pyinc
/bin/sh: 1: target/hexagon/gen_semantics: not found
ninja: build stopped: subcommand failed.
make: *** [Makefile:172: run-ninja] Error 1

OK, I'm cross-compiling, target/hexagon/gen_semantics has been generated
but with as target, and we want it linked for the host...

Cc'ing Paolo in case he figures the issue simply looking at this patch
:)

Phil.

