Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 610C73ADF07
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Jun 2021 16:27:11 +0200 (CEST)
Received: from localhost ([::1]:52958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luyPm-0006Cz-Fj
	for lists+qemu-devel@lfdr.de; Sun, 20 Jun 2021 10:27:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1luyOw-0005Rq-TI
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 10:26:19 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:50135)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1luyOt-0001U9-2k
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 10:26:18 -0400
Received: from [192.168.100.1] ([82.142.1.74]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1Mgf4k-1lN0dJ2XsK-00h9Bu; Sun, 20 Jun 2021 16:26:09 +0200
Subject: Re: [PATCH 2/2] tests/tcg/linux-test: Check that sigaction can query
 SIGKILL/SIGSTOP
To: Ilya Leoshkevich <iii@linux.ibm.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <20210601145600.3131040-1-iii@linux.ibm.com>
 <20210601145600.3131040-3-iii@linux.ibm.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <2519118c-c5c4-c759-a17c-9c49e5bfac22@vivier.eu>
Date: Sun, 20 Jun 2021 16:26:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210601145600.3131040-3-iii@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:HjRHyxsMwOXysl72zQuInCZ+UVtM4GG1uyVCvardRZV6ZOCjP7S
 0+ql5/XcBnGJpPH3bcqjl3mDrxnTA3ADz9w8o5YSqcX+cy2pEJAZiIs1MGEKQwxb+LZEMNn
 2IOkf2T6enT4QFiahCSn4/YjUmiUZJ51DWHMVGuP7qHUqp37qdh20KUe2Hzps47jfFzqoKL
 ZDPr7iteZJ5pOM31ryggg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:hNA9SKi9Fvw=:5Mt8o+AT5KYQIE+5bH+hCU
 hfW6RDpyVKRJ2pSW5wIpAQFLbUFH1qTl+dP6OST7fUhoojyVzcjULZadfOm5X4M5YVNJoVgO0
 sgoue6V64Zc+f77ECeCt1r9ysy8S2EwE2j+G7RsjeKVe+mxMSXpmIBr6AGZ/aIgeTyIb/4Peq
 49eknjjFN99wQhFEd4biPPTifQWIm0jf5+kqQTPjwo/Vx492P3174mAVIkIc8Xb/drrW1kZRr
 uc/crNuLv4V8yS4P4EbP2XMXjc/hZdxDBRIIUnawoS+Y2Up5c44miW9st3AKjNAbMe4ouQbhA
 FVuuzKoMJLZrtPoaCjpq84wabk59kP0z0ORaMWsozv7hw3a8+fh/ZEwVw891mHeG5ht+rignX
 nLTHjSNt39swAruepoOzV6GQv28ArsYgPS33WfEFDZlqaANKU4uqxPpACsQW/Nc/HIZXNaP4s
 5i11p0sUClW+p5C8p+nYZkqtaunoTJ6Y2yGx00wataavXH3wxvT3LYpzTDqjQF39ZWyxj3icp
 WwzkP8bZJFskicoHlqOjjU=
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Christian Borntraeger <borntraeger@de.ibm.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 01/06/2021 à 16:56, Ilya Leoshkevich a écrit :
> Verify that querying is allowed, but making changes isn't.
> 
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> ---
>  tests/tcg/multiarch/linux-test.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/tests/tcg/multiarch/linux-test.c b/tests/tcg/multiarch/linux-test.c
> index ce033c21c7..cd9d8159bc 100644
> --- a/tests/tcg/multiarch/linux-test.c
> +++ b/tests/tcg/multiarch/linux-test.c
> @@ -496,6 +496,15 @@ static void test_signal(void)
>      sigemptyset(&act.sa_mask);
>      act.sa_flags = 0;
>      chk_error(sigaction(SIGSEGV, &act, NULL));
> +
> +    if (sigaction(SIGKILL, &act, NULL) == 0) {
> +        error("sigaction(SIGKILL, &act, NULL) must not succeed");
> +    }
> +    if (sigaction(SIGSTOP, &act, NULL) == 0) {
> +        error("sigaction(SIGSTOP, &act, NULL) must not succeed");
> +    }
> +    chk_error(sigaction(SIGKILL, NULL, &act));
> +    chk_error(sigaction(SIGSTOP, NULL, &act));
>  }
>  
>  #define SHM_SIZE 32768
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

Alex, I will merge this via linux-user, is it ok for you?

Thanks,
Laurent

