Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CFCE463C1D
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Nov 2021 17:44:46 +0100 (CET)
Received: from localhost ([::1]:46132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ms6FI-0007Us-K4
	for lists+qemu-devel@lfdr.de; Tue, 30 Nov 2021 11:44:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1ms6Co-00052p-Ca
 for qemu-devel@nongnu.org; Tue, 30 Nov 2021 11:42:10 -0500
Received: from 9.mo548.mail-out.ovh.net ([46.105.48.137]:55671)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1ms6Cb-0004as-Tv
 for qemu-devel@nongnu.org; Tue, 30 Nov 2021 11:42:10 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.129])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id CA4D41FEF8;
 Tue, 30 Nov 2021 16:41:43 +0000 (UTC)
Received: from kaod.org (37.59.142.102) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Tue, 30 Nov
 2021 17:41:42 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-102R004c2bb010c-b49d-4576-ad8d-08557c5fc001,
 1FE831E2BDC1BE20692CF32662DF656E64B35270) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 90.11.56.15
Message-ID: <3b6ac407-799d-68ac-de50-fb54191920e4@kaod.org>
Date: Tue, 30 Nov 2021 17:41:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v3 2/3] test/tcg/ppc64le: test mtfsf
Content-Language: en-US
To: "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>,
 <qemu-devel@nongnu.org>, <qemu-ppc@nongnu.org>
References: <20211124172523.3598396-1-lucas.araujo@eldorado.org.br>
 <20211124172523.3598396-3-lucas.araujo@eldorado.org.br>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20211124172523.3598396-3-lucas.araujo@eldorado.org.br>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.102]
X-ClientProxiedBy: DAG3EX1.mxp5.local (172.16.2.21) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: f0890547-e6dc-419f-8c9e-7218d1d4766f
X-Ovh-Tracer-Id: 6072822626536557359
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddriedugdelfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhepkfffgggfuffvfhfhjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhephffhleegueektdetffdvffeuieeugfekkeelheelteeftdfgtefffeehueegleehnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepmhgrthhhvghushdrfhgvrhhsthesvghlughorhgrughordhorhhgrdgsrh
Received-SPF: pass client-ip=46.105.48.137; envelope-from=clg@kaod.org;
 helo=9.mo548.mail-out.ovh.net
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.211,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: richard.henderson@linaro.org, danielhb413@gmail.com,
 mark.cave-ayland@ilande.co.uk, pc@us.ibm.com, matheus.ferst@eldorado.org.br,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello Lucas,

On 11/24/21 18:25, Lucas Mateus Castro (alqotel) wrote:
> Added tests for the mtfsf to check if FI bit of FPSCR is being set
> and if exception calls are being made correctly.
> 
> Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.br>

Could you please rebase on mainline and resend ?

Thanks,

C.
  
> ---
>   tests/tcg/ppc64/Makefile.target   |  1 +
>   tests/tcg/ppc64le/Makefile.target |  1 +
>   tests/tcg/ppc64le/mtfsf.c         | 61 +++++++++++++++++++++++++++++++
>   3 files changed, 63 insertions(+)
>   create mode 100644 tests/tcg/ppc64le/mtfsf.c
> 
> diff --git a/tests/tcg/ppc64/Makefile.target b/tests/tcg/ppc64/Makefile.target
> index 6ab7934fdf..8f4c7ac4ed 100644
> --- a/tests/tcg/ppc64/Makefile.target
> +++ b/tests/tcg/ppc64/Makefile.target
> @@ -11,6 +11,7 @@ endif
>   bcdsub: CFLAGS += -mpower8-vector
>   
>   PPC64_TESTS += byte_reverse
> +PPC64_TESTS += mtfsf
>   ifneq ($(DOCKER_IMAGE)$(CROSS_CC_HAS_POWER10),)
>   run-byte_reverse: QEMU_OPTS+=-cpu POWER10
>   run-plugin-byte_reverse-with-%: QEMU_OPTS+=-cpu POWER10
> diff --git a/tests/tcg/ppc64le/Makefile.target b/tests/tcg/ppc64le/Makefile.target
> index 5e65b1590d..b8cd9bf73a 100644
> --- a/tests/tcg/ppc64le/Makefile.target
> +++ b/tests/tcg/ppc64le/Makefile.target
> @@ -10,6 +10,7 @@ endif
>   bcdsub: CFLAGS += -mpower8-vector
>   
>   PPC64LE_TESTS += byte_reverse
> +PPC64LE_TESTS += mtfsf
>   ifneq ($(DOCKER_IMAGE)$(CROSS_CC_HAS_POWER10),)
>   run-byte_reverse: QEMU_OPTS+=-cpu POWER10
>   run-plugin-byte_reverse-with-%: QEMU_OPTS+=-cpu POWER10
> diff --git a/tests/tcg/ppc64le/mtfsf.c b/tests/tcg/ppc64le/mtfsf.c
> new file mode 100644
> index 0000000000..b3d31f3637
> --- /dev/null
> +++ b/tests/tcg/ppc64le/mtfsf.c
> @@ -0,0 +1,61 @@
> +#include <stdlib.h>
> +#include <assert.h>
> +#include <signal.h>
> +#include <sys/prctl.h>
> +
> +#define FPSCR_VE     7  /* Floating-point invalid operation exception enable */
> +#define FPSCR_VXSOFT 10 /* Floating-point invalid operation exception (soft) */
> +#define FPSCR_FI     17 /* Floating-point fraction inexact                   */
> +
> +#define FP_VE           (1ull << FPSCR_VE)
> +#define FP_VXSOFT       (1ull << FPSCR_VXSOFT)
> +#define FP_FI           (1ull << FPSCR_FI)
> +
> +void sigfpe_handler(int sig, siginfo_t *si, void *ucontext)
> +{
> +    if (si->si_code == FPE_FLTINV) {
> +        exit(0);
> +    }
> +    exit(1);
> +}
> +
> +int main(void)
> +{
> +    union {
> +        double d;
> +        long long ll;
> +    } fpscr;
> +
> +    struct sigaction sa = {
> +        .sa_sigaction = sigfpe_handler,
> +        .sa_flags = SA_SIGINFO
> +    };
> +
> +    /*
> +     * Enable the MSR bits F0 and F1 to enable exceptions.
> +     * This shouldn't be needed in linux-user as these bits are enabled by
> +     * default, but this allows to execute either in a VM or a real machine
> +     * to compare the behaviors.
> +     */
> +    prctl(PR_SET_FPEXC, PR_FP_EXC_PRECISE);
> +
> +    /* First test if the FI bit is being set correctly */
> +    fpscr.ll = FP_FI;
> +    __builtin_mtfsf(0b11111111, fpscr.d);
> +    fpscr.d = __builtin_mffs();
> +    assert((fpscr.ll & FP_FI) != 0);
> +
> +    /* Then test if the deferred exception is being called correctly */
> +    sigaction(SIGFPE, &sa, NULL);
> +
> +    /*
> +     * Although the VXSOFT exception has been chosen, based on test in a Power9
> +     * any combination of exception bit + its enabling bit should work.
> +     * But if a different exception is chosen si_code check should
> +     * change accordingly.
> +     */
> +    fpscr.ll = FP_VE | FP_VXSOFT;
> +    __builtin_mtfsf(0b11111111, fpscr.d);
> +
> +    return 1;
> +}
> 


