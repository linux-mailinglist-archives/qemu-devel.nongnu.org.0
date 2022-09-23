Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 760385E85DE
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Sep 2022 00:27:16 +0200 (CEST)
Received: from localhost ([::1]:33306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obr8d-0005Yn-4v
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 18:27:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1obqaq-0000qa-CP
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 17:52:21 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:35135)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1obqan-0007GD-Aq
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 17:52:19 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1N8G6I-1pOQuk1NuC-014FED; Fri, 23 Sep 2022 23:52:06 +0200
Message-ID: <8e41dc36-569d-2a62-f678-51e6c154e9e9@vivier.eu>
Date: Fri, 23 Sep 2022 23:52:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v3 5/5] tests/tcg/linux-test: Add linux-madvise test
Content-Language: fr
To: Ilya Leoshkevich <iii@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Taylor Simpson <tsimpson@quicinc.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org
References: <20220906000839.1672934-1-iii@linux.ibm.com>
 <20220906000839.1672934-6-iii@linux.ibm.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220906000839.1672934-6-iii@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:eNSjyQ8eMH+9TDWNX33JB9OxnS2CA67K8yFQEePiUPi5JauHfy6
 JTLB9alIs/uitxIAUa745eqMVJBZc37/s4DAUMOiIpsi+nLdhQNPmBOziCiljXaHSOkTcrv
 XG3PPnHU91efOMSFQHMUa+mRwDhXSXdjKCGO9M/eTXuHewpPtFDQpsvo+Kn4+H9NzOjb2+0
 6scMJsm6hPo1515wBdo1A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:LeVeFLeVvuA=:x5K/gFUgGTzu68Lqk5idpw
 2IuO7hhBXi43iRnqEOsz+o3imiRiNBvgTCUKsVFcq4JWVfK3ccnStMOUvlHgx/1twsGo9nIuH
 c8Td3JvPGviOe2dHrH6wOHaquQ2tUvScg1uOLysv6guuqIAT06qd0+hvbkY4SdfgsXLrzY5nD
 mTgRskJjvVWLndqqzn+0W3+SilRKRYbbwp5R2fXvEwUnupneKgTrVlQeRUzhzyA0oC9khK147
 K7R4aRuAbeUbflgt2+mQLtftZte9aVb/dbtZRC+7RcchKAFFyyI5m9876P98zCt3pt7PE2jH/
 85a66EK+ycP2LXBKDsDoFA8i9Zb6FnC7XQDS84H7fzgbRf+VX2Euin4MfEbvgx+2Gm5hGJc3w
 3XsOdvrNMAydZCcrUKkhOCNHwYz1QXXY/C0KoeBi5siR3Me22iqjHtOvIP6g2u6mU36fWf2Kl
 DGZ74yu5usjR4dne8WCu2IUL+djwZZ/Hyem1+HfN/wraCNR+1LKVXvZXo4FaQ6jIRlRXxgN8B
 eHzjlk1WtI7jHUhGJle+t1ZBvp4XqC4AyXcQ7Ox7xIMZFei5xO+A9JpDzuFffBfOBzTHZ7svy
 GMGM6puitgZZOp8IrcHQwJDl6Tcr0QBP4Gr6+jJCss0mUzbg6dQJRpE0s/dxh387j1qagWbS4
 pxTGxetrGVVggVhMNHi1126dxjnPxLQYHCyM++3CcyxPSqx2csBv6/waqkBswo0fVyxKW1ee6
 HvhrRhDINQyBrS+yR2Zbpvphdt/Fcig2ke8dOeTmhMhWFvWh/e13n2KAEm6IkAQoJpjREOcO6
 pqQp1EA
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 06/09/2022 à 02:08, Ilya Leoshkevich a écrit :
> Add a test that checks madvise(MADV_DONTNEED) behavior with anonymous
> and file mappings in order to prevent regressions.
> 
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> ---
>   tests/tcg/multiarch/linux/linux-madvise.c | 70 +++++++++++++++++++++++
>   1 file changed, 70 insertions(+)
>   create mode 100644 tests/tcg/multiarch/linux/linux-madvise.c
> 
> diff --git a/tests/tcg/multiarch/linux/linux-madvise.c b/tests/tcg/multiarch/linux/linux-madvise.c
> new file mode 100644
> index 0000000000..29d0997e68
> --- /dev/null
> +++ b/tests/tcg/multiarch/linux/linux-madvise.c
> @@ -0,0 +1,70 @@
> +#include <assert.h>
> +#include <stdlib.h>
> +#include <sys/mman.h>
> +#include <unistd.h>
> +
> +static void test_anonymous(void)
> +{
> +    int pagesize = getpagesize();
> +    char *page;
> +    int ret;
> +
> +    page = mmap(NULL, pagesize, PROT_READ, MAP_ANONYMOUS | MAP_PRIVATE, -1, 0);
> +    assert(page != MAP_FAILED);
> +
> +    /* Check that mprotect() does not interfere with MADV_DONTNEED. */
> +    ret = mprotect(page, pagesize, PROT_READ | PROT_WRITE);
> +    assert(ret == 0);
> +
> +    /* Check that MADV_DONTNEED clears the page. */
> +    *page = 42;
> +    ret = madvise(page, pagesize, MADV_DONTNEED);
> +    assert(ret == 0);
> +    assert(*page == 0);
> +
> +    ret = munmap(page, pagesize);
> +    assert(ret == 0);
> +}
> +
> +static void test_file(void)
> +{
> +    char tempname[] = "/tmp/.cmadviseXXXXXX";
> +    int pagesize = getpagesize();
> +    ssize_t written;
> +    char c = 42;
> +    char *page;
> +    int ret;
> +    int fd;
> +
> +    fd = mkstemp(tempname);
> +    assert(fd != -1);
> +    ret = unlink(tempname);
> +    assert(ret == 0);
> +    written = write(fd, &c, sizeof(c));
> +    assert(written == sizeof(c));
> +    page = mmap(NULL, pagesize, PROT_READ, MAP_PRIVATE, fd, 0);
> +    assert(page != MAP_FAILED);
> +
> +    /* Check that mprotect() does not interfere with MADV_DONTNEED. */
> +    ret = mprotect(page, pagesize, PROT_READ | PROT_WRITE);
> +    assert(ret == 0);
> +
> +    /* Check that MADV_DONTNEED resets the page. */
> +    *page = 0;
> +    ret = madvise(page, pagesize, MADV_DONTNEED);
> +    assert(ret == 0);
> +    assert(*page == c);
> +
> +    ret = munmap(page, pagesize);
> +    assert(ret == 0);
> +    ret = close(fd);
> +    assert(ret == 0);
> +}
> +
> +int main(void)
> +{
> +    test_anonymous();
> +    test_file();
> +
> +    return EXIT_SUCCESS;
> +}
Applied to my linux-user-for-7.2 branch.

Thanks,
Laurent


