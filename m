Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4066B2E2571
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Dec 2020 09:25:41 +0100 (CET)
Received: from localhost ([::1]:49806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ksLwJ-0005nG-QR
	for lists+qemu-devel@lfdr.de; Thu, 24 Dec 2020 03:25:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ksLvM-0005N9-Pp
 for qemu-devel@nongnu.org; Thu, 24 Dec 2020 03:24:40 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:44089)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1ksLvK-0000ot-AO
 for qemu-devel@nongnu.org; Thu, 24 Dec 2020 03:24:40 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 24654746553;
 Thu, 24 Dec 2020 09:24:33 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 9329F746552; Thu, 24 Dec 2020 09:24:32 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 911E2746383;
 Thu, 24 Dec 2020 09:24:32 +0100 (CET)
Date: Thu, 24 Dec 2020 09:24:32 +0100 (CET)
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH v3 5/8] hw/mips/fuloong2e: Remove unused env entry
In-Reply-To: <20201224031750.52146-6-jiaxun.yang@flygoat.com>
Message-ID: <dc4f6c6-ae89-4f43-1f88-8380c7ebd78f@eik.bme.hu>
References: <20201224031750.52146-1-jiaxun.yang@flygoat.com>
 <20201224031750.52146-6-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Cleber Rosa <crosa@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: BALATON Zoltan <balaton@eik.bme.hu>
From: BALATON Zoltan via <qemu-devel@nongnu.org>

On Thu, 24 Dec 2020, Jiaxun Yang wrote:
> modetty is not handled by kernel and the parameter
> here seems unreasonable.
>
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
> v3: Bring busclock back
> ---
> hw/mips/fuloong2e.c | 2 --
> 1 file changed, 2 deletions(-)
>
> diff --git a/hw/mips/fuloong2e.c b/hw/mips/fuloong2e.c
> index d846ef7b00..c4843dd15e 100644
> --- a/hw/mips/fuloong2e.c
> +++ b/hw/mips/fuloong2e.c
> @@ -159,10 +159,8 @@ static uint64_t load_kernel(CPUMIPSState *env)
>     }
>
>     /* Setup minimum environment variables */
> -    prom_set(prom_buf, index++, "busclock=33000000");

Commit message does not mention removing this as well. Was this 
unintentionally left here?

Regards,
BALATON Zoltan

>     prom_set(prom_buf, index++, "cpuclock=100000000");
>     prom_set(prom_buf, index++, "memsize=%"PRIi64, loaderparams.ram_size / MiB);
> -    prom_set(prom_buf, index++, "modetty0=38400n8r");
>     prom_set(prom_buf, index++, NULL);
>
>     rom_add_blob_fixed("prom", prom_buf, prom_size, ENVP_PADDR);
>

