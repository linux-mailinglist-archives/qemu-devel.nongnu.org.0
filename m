Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F307B8F6E
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Sep 2019 14:05:42 +0200 (CEST)
Received: from localhost ([::1]:58622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iBHfR-0004gH-8C
	for lists+qemu-devel@lfdr.de; Fri, 20 Sep 2019 08:05:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42008)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <david@redhat.com>) id 1iBHdQ-00046B-Vf
 for qemu-devel@nongnu.org; Fri, 20 Sep 2019 08:03:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <david@redhat.com>) id 1iBHdO-0004WF-D2
 for qemu-devel@nongnu.org; Fri, 20 Sep 2019 08:03:36 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46918)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <david@redhat.com>)
 id 1iBHdN-0004QM-Qg; Fri, 20 Sep 2019 08:03:34 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id C31C5317529D;
 Fri, 20 Sep 2019 12:03:32 +0000 (UTC)
Received: from [10.36.117.96] (ovpn-117-96.ams2.redhat.com [10.36.117.96])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 736615D6A7;
 Fri, 20 Sep 2019 12:03:31 +0000 (UTC)
Subject: Re: [PATCH v1] tests/tcg: target/s390x: Test MVC
To: qemu-devel@nongnu.org
References: <20190919092829.15393-1-david@redhat.com>
From: David Hildenbrand <david@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=david@redhat.com; prefer-encrypt=mutual; keydata=
 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
 SE+xAvmumFBY
Organization: Red Hat GmbH
Message-ID: <5cbd350c-0fb6-2b6b-e64b-04bd7f7f0b65@redhat.com>
Date: Fri, 20 Sep 2019 14:03:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190919092829.15393-1-david@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.49]); Fri, 20 Sep 2019 12:03:32 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
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
Cc: qemu-s390x@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19.09.19 11:28, David Hildenbrand wrote:
> Let's add a test that especially verifies that no data will be touched
> in case we cross page boundaries and one page access triggers a fault.
>=20
> Before the fault-safe handling fixes, the test failes with:
>       TEST    mvc on s390x
>     data modified during a fault
>     make[2]: *** [../Makefile.target:116: run-mvc] Error 1
>=20
> Cc: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  tests/tcg/s390x/Makefile.target |   1 +
>  tests/tcg/s390x/mvc.c           | 109 ++++++++++++++++++++++++++++++++
>  2 files changed, 110 insertions(+)
>  create mode 100644 tests/tcg/s390x/mvc.c
>=20
> diff --git a/tests/tcg/s390x/Makefile.target b/tests/tcg/s390x/Makefile=
.target
> index 6a3bfa8b29..241ef28f61 100644
> --- a/tests/tcg/s390x/Makefile.target
> +++ b/tests/tcg/s390x/Makefile.target
> @@ -7,3 +7,4 @@ TESTS+=3Dexrl-trt
>  TESTS+=3Dexrl-trtr
>  TESTS+=3Dpack
>  TESTS+=3Dmvo
> +TESTS+=3Dmvc
> diff --git a/tests/tcg/s390x/mvc.c b/tests/tcg/s390x/mvc.c
> new file mode 100644
> index 0000000000..aa552d52e5
> --- /dev/null
> +++ b/tests/tcg/s390x/mvc.c
> @@ -0,0 +1,109 @@
> +#include <stdint.h>
> +#include <stdlib.h>
> +#include <stdio.h>
> +#include <string.h>
> +#include <sys/mman.h>
> +#include <signal.h>
> +#include <setjmp.h>
> +
> +jmp_buf jmp_env;
> +
> +static void handle_sigsegv(int sig)
> +{
> +    siglongjmp(jmp_env, 1);
> +}
> +
> +#define ALLOC_SIZE (2 * 4096)
> +
> +static inline void mvc_256(const char *dst, const char *src)
> +{
> +    asm volatile (
> +        "    mvc 0(256,%[dst]),0(%[src])\n"
> +        :
> +        : [dst] "d" (dst),
> +          [src] "d" (src)
> +        : "memory");
> +}
> +
> +int main(void)
> +{
> +    char *src, *dst;
> +    int i;
> +
> +    /* register the SIGSEGV handler */
> +    if (signal(SIGSEGV, handle_sigsegv) =3D=3D SIG_ERR) {
> +        fprintf(stderr, "SIGSEGV not registered\n");
> +        return 1;
> +    }
> +
> +    /* prepare the buffers - two consecutive pages */
> +    src =3D valloc(ALLOC_SIZE);
> +    dst =3D valloc(ALLOC_SIZE);
> +    memset(src, 0xff, ALLOC_SIZE);
> +    memset(dst, 0x0, ALLOC_SIZE);
> +
> +    /* protect the second pages */
> +    if (mprotect(src + 4096, 4096, PROT_NONE) ||
> +        mprotect(dst + 4096, 4096, PROT_NONE)) {
> +        fprintf(stderr, "mprotect failed\n");
> +        return 1;
> +    }
> +
> +    /* fault on second destination page */
> +    if (sigsetjmp(jmp_env, 1) =3D=3D 0) {
> +        mvc_256(dst + 4096 - 128, src);
> +        fprintf(stderr, "fault not triggered\n");
> +        return 1;
> +    }
> +
> +    /* fault on second source page */
> +    if (sigsetjmp(jmp_env, 1) =3D=3D 0) {
> +        mvc_256(dst, src + 4096 - 128);
> +        fprintf(stderr, "fault not triggered\n");
> +        return 1;
> +    }
> +
> +    /* fault on second source and second destination page */
> +    if (sigsetjmp(jmp_env, 1) =3D=3D 0) {
> +        mvc_256(dst + 4096 - 128, src + 4096 - 128);
> +        fprintf(stderr, "fault not triggered\n");
> +        return 1;
> +    }
> +
> +    /* restore permissions */
> +    if (mprotect(src + 4096, 4096, PROT_READ | PROT_WRITE) ||
> +        mprotect(dst + 4096, 4096, PROT_READ | PROT_WRITE)) {
> +        fprintf(stderr, "mprotect failed\n");
> +        return 1;
> +    }
> +
> +    /* no data must be touched during the faults */
> +    for (i =3D 0; i < ALLOC_SIZE; i++) {
> +        if (src[i] !=3D 0xff || dst[i]) {
> +            fprintf(stderr, "data modified during a fault\n");
> +            return 1;
> +        }
> +    }
> +
> +    /* test if MVC works now correctly accross page boundaries */
> +    mvc_256(dst + 4096 - 128, src + 4096 - 128);
> +    for (i =3D 0; i < ALLOC_SIZE; i++) {
> +        if (src[i] !=3D 0xff) {
> +            fprintf(stderr, "src modified\n");
> +            return 1;
> +        }
> +        if (i < 4096 - 128 || i >=3D 4096 + 128) {
> +            if (dst[i]) {
> +                fprintf(stderr, "wrong dst modified\n");
> +                return 1;
> +            }
> +        } else {
> +            if (dst[i] !=3D 0xff) {
> +                fprintf(stderr, "wrong data moved\n");
> +                return 1;
> +            }
> +        }
> +    }
> +
> +    return 0;
> +}
>=20

I'll send this along with the updated pull request of

"[PULL SUBSYSTEM s390x 00/29] s390x/tcg: mem_helper: Fault-safe handling"

--=20

Thanks,

David / dhildenb

