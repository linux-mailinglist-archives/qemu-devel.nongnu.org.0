Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B32BF6ECC7F
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 15:03:16 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqvq9-0004Xf-Uj; Mon, 24 Apr 2023 09:02:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pqvq7-0004VO-Qs
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 09:02:43 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pqvq5-0004Q9-Lk
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 09:02:43 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3f086770a50so29022505e9.2
 for <qemu-devel@nongnu.org>; Mon, 24 Apr 2023 06:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682341359; x=1684933359;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ocGALLHHPBcm2259H2QGQje69HfnXukuyORSYpgIqO4=;
 b=puOPFJtnjaketPkOtjlz7yoegEwZYohTQ+Jj3wvKJKuWBHfQcKgGNnIyZSB0GkAWeO
 cAknDklAjjR1VKRUbf/agru1vvDpYe2ga0k5Vn21LiyGDjP6UXMfQhbP8QJhqS291B9K
 6+us7yV4pGN9OE9XHquVuSMROoeNNqQl6kgsxU3lJZeUZVpVzSVtw9INKB/Sj3BxmUPE
 dQ9nqGBS/pkeFgcppC2YyKWBBJ7hHjE8jGxc4O91i0n8R+MjB9f5AKU4hAM/Pdj7EUKv
 IeL5Oqtu3Nblf4TVvaXySeR/Vn3MWhwl8gD/3P7VH1c6/BcahJ+fsoVVL2KtzbBecnWI
 GHCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682341359; x=1684933359;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=ocGALLHHPBcm2259H2QGQje69HfnXukuyORSYpgIqO4=;
 b=E6glWEWLVcbCfWeOmhoUPcauRR3G3WE2gZIReLlIpdgqTkWHAnh8T/bYE/PRQ5qwQI
 SP4E9FMQud6CCOut4OFUJrZ+f8HnP6qC4dFOYXzclw/RoPlWaYO6xWTMYuzTH6olfxt8
 tBXshpPIC/o37I19Yu4CZ0fKR01CJkP+kMZPyefGo0OkOY0aP/Wq8CqtIiiKdNDBYVWO
 TbTeHtkOIoVlC9fDdE35BD+0B1wX75eDSL10U3lV2eAVa0IGJgNTjrIUxHawOuUkKxky
 sLseW5tNeJ5fSnl5IrbJajcM8+9eaKtyQqnY0Sqw/3nB2iAIsvxT6Of0WtodnG2SzHwg
 tqNQ==
X-Gm-Message-State: AAQBX9eDoe14aciF5rnx7P+TFd9RVKYtj9uY/dbm4mTNyCXUD1M25i4H
 OA1hzbaxx/u7uJyhg1lwfJ2a4Q==
X-Google-Smtp-Source: AKy350biiSNqZ4A33+XCDlmv3053u+oGmbrNeKEsXNdYhOG1ei8bwdag/GChdkkM8Dy4byTiRz3tuA==
X-Received: by 2002:a05:600c:21a:b0:3f1:75b6:8c7 with SMTP id
 26-20020a05600c021a00b003f175b608c7mr7521119wmi.37.1682341359187; 
 Mon, 24 Apr 2023 06:02:39 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 k36-20020a05600c1ca400b003f1733feb3dsm15641335wms.0.2023.04.24.06.02.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Apr 2023 06:02:38 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E3F941FFB7;
 Mon, 24 Apr 2023 14:02:37 +0100 (BST)
References: <20230424114533.1937153-1-iii@linux.ibm.com>
 <20230424114533.1937153-2-iii@linux.ibm.com>
User-agent: mu4e 1.11.3; emacs 29.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Ilya Leoshkevich <iii@linux.ibm.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, David Hildenbrand
 <david@redhat.com>, qemu-devel@nongnu.org, qemu-s390x@nongnu.org, Thomas
 =?utf-8?Q?Wei=C3=9Fschuh?= <thomas@t-8ch.de>, Peter Maydell
 <peter.maydell@linaro.org>
Subject: Re: [PATCH v2 1/3] tests/tcg: Make the QEMU headers available to
 the tests
Date: Mon, 24 Apr 2023 14:00:51 +0100
In-reply-to: <20230424114533.1937153-2-iii@linux.ibm.com>
Message-ID: <87fs8pa0wi.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


Ilya Leoshkevich <iii@linux.ibm.com> writes:

> The QEMU headers contain macros and functions that are useful in the
> test context. Add them to tests' include path. Also provide a header
> similar to "qemu/osdep.h" for use in the freestanding environment.
>
> Tests that include <sys/auxv.h> get QEMU's copy of <elf.h>, which does
> not work without <stdint.h>. Make use of the new header in these tests
> in order to fix this.
>
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> ---
>  tests/include/qemu/testdep.h   | 14 ++++++++++++++
>  tests/tcg/Makefile.target      |  4 ++--
>  tests/tcg/aarch64/sve-ioctls.c |  1 +
>  tests/tcg/aarch64/sysregs.c    |  1 +
>  4 files changed, 18 insertions(+), 2 deletions(-)
>  create mode 100644 tests/include/qemu/testdep.h
>
> diff --git a/tests/include/qemu/testdep.h b/tests/include/qemu/testdep.h
> new file mode 100644
> index 00000000000..ddf7c543bf4
> --- /dev/null
> +++ b/tests/include/qemu/testdep.h
> @@ -0,0 +1,14 @@
> +/*
> + * Common dependencies for QEMU tests.
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +#ifndef QEMU_TESTDEP_H
> +#define QEMU_TESTDEP_H
> +
> +#include <stdint.h>
> +#include "qemu/compiler.h"
> +
> +#define g_assert_not_reached __builtin_trap
> +
> +#endif
> diff --git a/tests/tcg/Makefile.target b/tests/tcg/Makefile.target
> index 8318caf9247..5474395e693 100644
> --- a/tests/tcg/Makefile.target
> +++ b/tests/tcg/Makefile.target
> @@ -85,8 +85,8 @@ TESTS=3D
>  # additional tests which may re-use existing binaries
>  EXTRA_TESTS=3D
>=20=20
> -# Start with a blank slate, the build targets get to add stuff first
> -CFLAGS=3D
> +# Start with the minimal build flags, the build targets will extend them
> +CFLAGS=3D-I$(SRC_PATH)/include -I$(SRC_PATH)/tests/include
>  LDFLAGS=3D

Hmm I'm not so sure about this. The tests are deliberately minimal in
terms of their dependencies because its hard enough getting a plain
cross-compiler to work. Is there really much benefit to allowing this?
What happens when a user includes another header which relies on
functionality from one of the many libraries QEMU itself links to?

>=20=20
>  QEMU_OPTS=3D
> diff --git a/tests/tcg/aarch64/sve-ioctls.c b/tests/tcg/aarch64/sve-ioctl=
s.c
> index 9544dffa0ee..11a0a4e47ff 100644
> --- a/tests/tcg/aarch64/sve-ioctls.c
> +++ b/tests/tcg/aarch64/sve-ioctls.c
> @@ -8,6 +8,7 @@
>   *
>   * SPDX-License-Identifier: GPL-2.0-or-later
>   */
> +#include "qemu/testdep.h"
>  #include <sys/prctl.h>
>  #include <asm/hwcap.h>
>  #include <stdio.h>
> diff --git a/tests/tcg/aarch64/sysregs.c b/tests/tcg/aarch64/sysregs.c
> index 46b931f781d..35ec25026a9 100644
> --- a/tests/tcg/aarch64/sysregs.c
> +++ b/tests/tcg/aarch64/sysregs.c
> @@ -11,6 +11,7 @@
>   * SPDX-License-Identifier: GPL-2.0-or-later
>   */
>=20=20
> +#include "qemu/testdep.h"
>  #include <asm/hwcap.h>
>  #include <stdio.h>
>  #include <sys/auxv.h>


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

