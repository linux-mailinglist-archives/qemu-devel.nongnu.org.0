Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14D6C43C7D4
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 12:42:07 +0200 (CEST)
Received: from localhost ([::1]:56656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfgNi-0005yY-5J
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 06:42:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mfgKm-0004YX-1d
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 06:39:04 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:44991)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mfgKk-0001tl-6o
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 06:39:03 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 j2-20020a1c2302000000b0032ca9b0a057so1936849wmj.3
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 03:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=WGplko+ZSKEFX3mPK0s9GS9/vkwDkTNPFB64zvmmnUg=;
 b=NYe10Sf/LW950znj//gimThladb4fwbwRnB9jbYqanaISXesuj0bfjCIXhkEGiF/FP
 wMPsIm3u7GXPQ0UWErTwSJxkkMoebskFPknwv59y4JhFz8aYYU0Kh6pbjy0yzCupcZHq
 ab/JqmqopK/6fKJA6gXU4bBwXqc894rLdDRiV9LU11QEexjtateRIcXRR7bSZQa+3Scr
 0CC8sn8CMYidjdbA2HPr1aO55LWk4YPmiPNVJEiLSWt2clnGZHko2SjXWo4WeYGHo7Tk
 ojgxIKaM2m7FoYVPwYHXRkLUuv087RTWbFvrLZjEQpvtPtveRBGTw3O9uW3bUdacqCuT
 HLCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=WGplko+ZSKEFX3mPK0s9GS9/vkwDkTNPFB64zvmmnUg=;
 b=y+GNCIkvZoXt8uLYQMYtNLCxsJTm4hgr1IGFdlZ+967Rp+2ABE6YpyyaKN1QNO9NtW
 Rt9SsKy7mZh14CplFmUmbvcoP/aComwhYuQklbq9DibePFrisqiyH2ibFbPaXWkXHFUv
 aa/cQTNjDdVnfTWsfRHu6vzJr2ANn7mX6IwqfBSuQWZL/5FNjWySbnzmfIXNJBN8Y/B4
 2wE2Mj4Z2I3kIcOtJANSKHJBlcYFy90cW0DMBfRoK099yzT1JTdHli2D7y5+R45bG9Pv
 ka9w/MOwpNkzJZYrv2u86jr+SqvCQ81NKSECJ8M2GaARyprGHa+rIK9l4gS8ip7k8kLw
 ycwA==
X-Gm-Message-State: AOAM5311t60sLBAnsuT13zYPyHnyBD+y6Yc4hLbsNAOl9nnYeAB7v5Cv
 VNQL1GUK35YPWvo45YViOL6dWGbbwuU=
X-Google-Smtp-Source: ABdhPJwIcN8D0g9dITaxSjwqeXDQDojl4x1gvrWXV+J0Uh4dg4SR46DKPU7ijuYn785xnpyhNn4S5A==
X-Received: by 2002:a1c:9d82:: with SMTP id g124mr968768wme.160.1635331137835; 
 Wed, 27 Oct 2021 03:38:57 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id n11sm11919804wrs.14.2021.10.27.03.38.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Oct 2021 03:38:53 -0700 (PDT)
Message-ID: <f0cbc301-fcf2-e9d5-f926-2f96a7ec14fd@amsat.org>
Date: Wed, 27 Oct 2021 12:38:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 04/33] tests/tcg/mips: Run MSA opcodes tests on user-mode
 emulation
Content-Language: en-US
To: qemu-devel@nongnu.org
References: <20211023214803.522078-1-f4bug@amsat.org>
 <20211023214803.522078-5-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211023214803.522078-5-f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-2.847,
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Luis Pires <luis.pires@eldorado.org.br>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/23/21 23:47, Philippe Mathieu-Daudé wrote:
> The following commits added various user-mode tests
> for various MSA instructions:
> 
>  - 0fdd986a6c8 ("Add tests for MSA integer add instructions")
>  - 1be82d89011 ("Add tests for MSA integer average instructions")
>  - 1d336c87a3c ("Add tests for MSA bit set instructions")
>  - 1e6bea794c8 ("Add tests for MSA integer max/min instructions")
>  - 2a367db039f ("Add tests for MSA pack instructions")
>  - 3d9569b8550 ("Add tests for MSA move instructions")
>  - 4b302ce90db ("Add tests for MSA integer multiply instructions")
>  - 520e210c0aa ("Add tests for MSA integer compare instructions")
>  - 53e116fed6d ("Add tests for MSA integer subtract instructions")
>  - 666952ea7c1 ("Add tests for MSA bit move instructions")
>  - 72f463bc080 ("Add tests for MSA integer divide instructions")
>  - 8598f5fac1c ("Add tests for MSA FP max/min instructions")
>  - 99d423e576a ("Add tests for MSA shift instructions")
>  - a8f91dd9fd0 ("Add tests for MSA integer dot product instructions")
>  - b62592ab655 ("Add tests for MSA bit counting instructions")
>  - ba632924450 ("Add tests for MSA logic instructions")
>  - fc76f486677 ("Add tests for MSA interleave instructions")
> 
> Cover them in the buildsys machinery so they are run automatically
> when calling 'make check-tcg'.
> 
> Start running them on the mips64el target.
> 
> Cc: Alex Bennée <alex.bennee@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  tests/tcg/mips/ase-msa.mak         | 30 ++++++++++++++++++++++++++++++
>  MAINTAINERS                        |  1 +
>  tests/tcg/mips/Makefile.target     |  5 +++++
>  tests/tcg/mips64/Makefile.target   |  9 +++++++++
>  tests/tcg/mips64el/Makefile.target | 12 ++++++++++++
>  tests/tcg/mipsel/Makefile.target   |  9 +++++++++
>  6 files changed, 66 insertions(+)
>  create mode 100644 tests/tcg/mips/ase-msa.mak
>  create mode 100644 tests/tcg/mips64/Makefile.target
>  create mode 100644 tests/tcg/mips64el/Makefile.target
>  create mode 100644 tests/tcg/mipsel/Makefile.target
> 
> diff --git a/tests/tcg/mips/ase-msa.mak b/tests/tcg/mips/ase-msa.mak
> new file mode 100644
> index 00000000000..be1ba967a5b
> --- /dev/null
> +++ b/tests/tcg/mips/ase-msa.mak
> @@ -0,0 +1,30 @@
> +# -*- Mode: makefile -*-
> +#
> +# MIPS MSA specific TCG tests
> +#
> +# Copyright (c) 2021 Philippe Mathieu-Daudé <f4bug@amsat.org>
> +#
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +
> +MSA_DIR = $(SRC_PATH)/tests/tcg/mips/user/ase/msa
> +
> +MSA_TEST_CLASS = bit-count bit-move bit-set fixed-multiply \
> +				float-max-min int-add int-average int-compare int-divide \
> +				int-dot-product interleave int-max-min int-modulo \
> +				int-multiply int-subtract logic move pack shift
> +
> +MSA_TEST_SRCS = $(foreach class,$(MSA_TEST_CLASS),$(wildcard $(MSA_DIR)/$(class)/*.c))
> +
> +MSA_TESTS = $(patsubst %.c,%,$(notdir $(MSA_TEST_SRCS)))
> +
> +$(MSA_TESTS): CFLAGS+=-mmsa $(MSA_CFLAGS)
> +$(MSA_TESTS): %: $(foreach CLASS,$(MSA_TEST_CLASS),$(wildcard $(MSA_DIR)/$(CLASS)/%.c))
> +	$(CC) -static $(CFLAGS) -o $@ \
> +		$(foreach CLASS,$(MSA_TEST_CLASS),$(wildcard $(MSA_DIR)/$(CLASS)/$@.c))

FYI I am using $wilcard because because the test files are in multiple
directories ($MSA_TEST_CLASS).

> +
> +$(foreach test,$(MSA_TESTS),run-$(test)): QEMU_OPTS += -cpu $(MSA_CPU)
> +
> +# FIXME: These tests fail when using plugins
> +ifneq ($(CONFIG_PLUGIN),y)
> +TESTS += $(MSA_TESTS)
> +endif
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 4e77d03651b..53c6c549b80 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3111,6 +3111,7 @@ R: Jiaxun Yang <jiaxun.yang@flygoat.com>
>  R: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
>  S: Odd Fixes
>  F: tcg/mips/
> +F: tests/tcg/mips*
>  
>  PPC TCG target
>  M: Richard Henderson <richard.henderson@linaro.org>
> diff --git a/tests/tcg/mips/Makefile.target b/tests/tcg/mips/Makefile.target
> index 1a994d5525e..191fe179119 100644
> --- a/tests/tcg/mips/Makefile.target
> +++ b/tests/tcg/mips/Makefile.target
> @@ -17,3 +17,8 @@ TESTS += $(MIPS_TESTS)
>  hello-mips: CFLAGS+=-mno-abicalls -fno-PIC -mabi=32
>  hello-mips: LDFLAGS+=-nostdlib
>  endif
> +
> +# FIXME enable MSA tests

This is commented because the Debian toolchain produces:

/usr/mips-linux-gnu/include/gnu/stubs.h:17:11: fatal error:
gnu/stubs-o32_hard_2008.h: No such file or directory
 # include <gnu/stubs-o32_hard_2008.h>
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~

> +#MSA_CFLAGS=-march=mips64r5 -mnan=2008

Here I meant:

   MSA_CFLAGS=-march=mips32r5 -mnan=2008

Anyhow, similar error using -march=mips32r6.

> +#MSA_CPU=P5600
> +#include $(SRC_PATH)/tests/tcg/mips/ase-msa.mak
> diff --git a/tests/tcg/mips64/Makefile.target b/tests/tcg/mips64/Makefile.target
> new file mode 100644
> index 00000000000..d876b92f219
> --- /dev/null
> +++ b/tests/tcg/mips64/Makefile.target
> @@ -0,0 +1,9 @@
> +# -*- Mode: makefile -*-
> +#
> +# mips64el specific TCG tests
> +#
> +# Copyright (c) 2021 Philippe Mathieu-Daudé <f4bug@amsat.org>
> +#
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +
> +# 64-bit MSA is tested on little-endian target
> diff --git a/tests/tcg/mips64el/Makefile.target b/tests/tcg/mips64el/Makefile.target
> new file mode 100644
> index 00000000000..87c0d6dce18
> --- /dev/null
> +++ b/tests/tcg/mips64el/Makefile.target
> @@ -0,0 +1,12 @@
> +# -*- Mode: makefile -*-
> +#
> +# mips64el specific TCG tests
> +#
> +# Copyright (c) 2021 Philippe Mathieu-Daudé <f4bug@amsat.org>
> +#
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +
> +# MSA
> +MSA_CFLAGS=-march=mips64r5 -mnan=legacy
> +MSA_CPU=Loongson-3A4000
> +include $(SRC_PATH)/tests/tcg/mips/ase-msa.mak
> diff --git a/tests/tcg/mipsel/Makefile.target b/tests/tcg/mipsel/Makefile.target
> new file mode 100644
> index 00000000000..c8acacb4497
> --- /dev/null
> +++ b/tests/tcg/mipsel/Makefile.target
> @@ -0,0 +1,9 @@
> +# -*- Mode: makefile -*-
> +#
> +# mipsel specific TCG tests
> +#
> +# Copyright (c) 2021 Philippe Mathieu-Daudé <f4bug@amsat.org>
> +#
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +
> +# 32-bit MSA is tested on big-endian target
> 

