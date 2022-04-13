Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19EAF4FF9D2
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Apr 2022 17:15:11 +0200 (CEST)
Received: from localhost ([::1]:57128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1neei4-00009w-Q6
	for lists+qemu-devel@lfdr.de; Wed, 13 Apr 2022 11:15:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qtxuning1999@sjtu.edu.cn>)
 id 1neeWr-0004vi-2I; Wed, 13 Apr 2022 11:03:33 -0400
Received: from smtp178.sjtu.edu.cn ([202.120.2.178]:44712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qtxuning1999@sjtu.edu.cn>)
 id 1neeWn-0003BY-Eq; Wed, 13 Apr 2022 11:03:32 -0400
Received: from mta03.sjtu.edu.cn (mta03.sjtu.edu.cn [202.121.179.7])
 by smtp178.sjtu.edu.cn (Postfix) with ESMTPS id 1407F1008CBC2;
 Wed, 13 Apr 2022 23:03:09 +0800 (CST)
Received: from localhost (localhost [127.0.0.1])
 by mta03.sjtu.edu.cn (Postfix) with ESMTP id EBC0210DC2E;
 Wed, 13 Apr 2022 23:03:08 +0800 (CST)
X-Virus-Scanned: amavisd-new at mta03.sjtu.edu.cn
Received: from mta03.sjtu.edu.cn ([127.0.0.1])
 by localhost (mta03.sjtu.edu.cn [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id Br8kdR2Jze1m; Wed, 13 Apr 2022 23:03:08 +0800 (CST)
Received: from mstore105.sjtu.edu.cn (unknown [10.118.0.105])
 by mta03.sjtu.edu.cn (Postfix) with ESMTP id C812510DA31;
 Wed, 13 Apr 2022 23:03:08 +0800 (CST)
Date: Wed, 13 Apr 2022 23:03:08 +0800 (CST)
From: Guo Zhi <qtxuning1999@sjtu.edu.cn>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-ID: <1629847184.11451847.1649862188392.JavaMail.zimbra@sjtu.edu.cn>
In-Reply-To: <5b961174-4863-7e34-fce8-e910d80603ec@gmail.com>
References: <897919466.10558377.1649695044864.JavaMail.zimbra@sjtu.edu.cn>
 <20220412021240.2080218-1-qtxuning1999@sjtu.edu.cn>
 <5b961174-4863-7e34-fce8-e910d80603ec@gmail.com>
Subject: Re: [PATCH v2] hw/ppc: change indentation to spaces from TABs
MIME-Version: 1.0
Content-Type: text/plain; charset=GB2312
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [218.193.191.26]
X-Mailer: Zimbra 8.8.15_GA_4203 (ZimbraWebClient - GC100 (Mac)/8.8.15_GA_3928)
Thread-Topic: hw/ppc: change indentation to spaces from TABs
Thread-Index: xDhx7ukzv6GwXY0bNlZYKUwIY/kkUQ==
Received-SPF: pass client-ip=202.120.2.178;
 envelope-from=qtxuning1999@sjtu.edu.cn; helo=smtp178.sjtu.edu.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Greg Kurz <groug@kaod.org>, qemu-ppc <qemu-ppc@nongnu.org>,
 =?gb2312?Q?C=A8=A6dric?= Le Goater <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Thanks for your help, I'll pay attention to the commit specification next t=
ime.

Guo

----- Original Message -----
From: "Daniel Henrique Barboza" <danielhb413@gmail.com>
To: "Guo Zhi" <qtxuning1999@sjtu.edu.cn>, "C=A8=A6dric Le Goater" <clg@kaod=
.org>, "David Gibson" <david@gibson.dropbear.id.au>, "Greg Kurz" <groug@kao=
d.org>
Cc: "qemu-ppc" <qemu-ppc@nongnu.org>, "qemu-devel@nongnu.org Developers" <q=
emu-devel@nongnu.org>
Sent: Wednesday, April 13, 2022 9:00:15 PM
Subject: Re: [PATCH v2] hw/ppc: change indentation to spaces from TABs

On 4/11/22 23:12, Guo Zhi wrote:
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/374
>=20
> There are still some files in the QEMU PPC code base that use TABs for in=
dentation instead of using  spaces. The TABs should be replaced so that we =
have a consistent coding style.
>=20

I forgot to mention about the commit msg. Ideally we want the commit msg
to have shorter lines. If you use 'vim' you can do that by selecting
the commit msg and hitting 'G' and 'W' in non-insert mode.

I've amended it before queueing, so don't worry about it. I also moved the
'Resolves' tag to the end of the commit msg, which I also forgot to mention
about.

> Signed-off-by: Guo Zhi <qtxuning1999@sjtu.edu.cn>
> ---


Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>



>   hw/ppc/ppc440_bamboo.c |  6 +++---
>   hw/ppc/spapr_rtas.c    | 18 +++++++++---------
>   include/hw/ppc/ppc.h   | 10 +++++-----
>   3 files changed, 17 insertions(+), 17 deletions(-)
>=20
> diff --git a/hw/ppc/ppc440_bamboo.c b/hw/ppc/ppc440_bamboo.c
> index 7fb620b9a0..5ec3a9a17f 100644
> --- a/hw/ppc/ppc440_bamboo.c
> +++ b/hw/ppc/ppc440_bamboo.c
> @@ -3,9 +3,9 @@
>    *
>    * Copyright 2007 IBM Corporation.
>    * Authors:
> - *=09Jerone Young <jyoung5@us.ibm.com>
> - *=09Christian Ehrhardt <ehrhardt@linux.vnet.ibm.com>
> - *=09Hollis Blanchard <hollisb@us.ibm.com>
> + *  Jerone Young <jyoung5@us.ibm.com>
> + *  Christian Ehrhardt <ehrhardt@linux.vnet.ibm.com>
> + *  Hollis Blanchard <hollisb@us.ibm.com>
>    *
>    * This work is licensed under the GNU GPL license version 2 or later.
>    *
> diff --git a/hw/ppc/spapr_rtas.c b/hw/ppc/spapr_rtas.c
> index d7c04237fe..d58b65e88f 100644
> --- a/hw/ppc/spapr_rtas.c
> +++ b/hw/ppc/spapr_rtas.c
> @@ -474,16 +474,16 @@ static void rtas_ibm_nmi_interlock(PowerPCCPU *cpu,
>  =20
>       if (spapr->fwnmi_machine_check_interlock !=3D cpu->vcpu_id) {
>           /*
> -=09 * The vCPU that hit the NMI should invoke "ibm,nmi-interlock"
> +         * The vCPU that hit the NMI should invoke "ibm,nmi-interlock"
>            * This should be PARAM_ERROR, but Linux calls "ibm,nmi-interlo=
ck"
> -=09 * for system reset interrupts, despite them not being interlocked.
> -=09 * PowerVM silently ignores this and returns success here. Returning
> -=09 * failure causes Linux to print the error "FWNMI: nmi-interlock
> -=09 * failed: -3", although no other apparent ill effects, this is a
> -=09 * regression for the user when enabling FWNMI. So for now, match
> -=09 * PowerVM. When most Linux clients are fixed, this could be
> -=09 * changed.
> -=09 */
> +         * for system reset interrupts, despite them not being interlock=
ed.
> +         * PowerVM silently ignores this and returns success here. Retur=
ning
> +         * failure causes Linux to print the error "FWNMI: nmi-interlock
> +         * failed: -3", although no other apparent ill effects, this is =
a
> +         * regression for the user when enabling FWNMI. So for now, matc=
h
> +         * PowerVM. When most Linux clients are fixed, this could be
> +         * changed.
> +         */
>           rtas_st(rets, 0, RTAS_OUT_SUCCESS);
>           return;
>       }
> diff --git a/include/hw/ppc/ppc.h b/include/hw/ppc/ppc.h
> index 364f165b4b..02af03ada2 100644
> --- a/include/hw/ppc/ppc.h
> +++ b/include/hw/ppc/ppc.h
> @@ -99,11 +99,11 @@ enum {
>       ARCH_MAC99_U3,
>   };
>  =20
> -#define FW_CFG_PPC_WIDTH=09(FW_CFG_ARCH_LOCAL + 0x00)
> -#define FW_CFG_PPC_HEIGHT=09(FW_CFG_ARCH_LOCAL + 0x01)
> -#define FW_CFG_PPC_DEPTH=09(FW_CFG_ARCH_LOCAL + 0x02)
> -#define FW_CFG_PPC_TBFREQ=09(FW_CFG_ARCH_LOCAL + 0x03)
> -#define FW_CFG_PPC_CLOCKFREQ=09(FW_CFG_ARCH_LOCAL + 0x04)
> +#define FW_CFG_PPC_WIDTH        (FW_CFG_ARCH_LOCAL + 0x00)
> +#define FW_CFG_PPC_HEIGHT       (FW_CFG_ARCH_LOCAL + 0x01)
> +#define FW_CFG_PPC_DEPTH        (FW_CFG_ARCH_LOCAL + 0x02)
> +#define FW_CFG_PPC_TBFREQ       (FW_CFG_ARCH_LOCAL + 0x03)
> +#define FW_CFG_PPC_CLOCKFREQ    (FW_CFG_ARCH_LOCAL + 0x04)
>   #define FW_CFG_PPC_IS_KVM       (FW_CFG_ARCH_LOCAL + 0x05)
>   #define FW_CFG_PPC_KVM_HC       (FW_CFG_ARCH_LOCAL + 0x06)
>   #define FW_CFG_PPC_KVM_PID      (FW_CFG_ARCH_LOCAL + 0x07)

