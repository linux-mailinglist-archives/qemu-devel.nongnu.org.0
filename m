Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4900F7349C
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Jul 2019 19:08:21 +0200 (CEST)
Received: from localhost ([::1]:53542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hqKkW-0001Ts-Ek
	for lists+qemu-devel@lfdr.de; Wed, 24 Jul 2019 13:08:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47569)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <clg@kaod.org>) id 1hqKkI-0000yk-R1
 for qemu-devel@nongnu.org; Wed, 24 Jul 2019 13:08:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1hqKkH-00074N-Rk
 for qemu-devel@nongnu.org; Wed, 24 Jul 2019 13:08:06 -0400
Received: from 1.mo68.mail-out.ovh.net ([46.105.41.146]:56909)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1hqKkH-0006x1-Jz
 for qemu-devel@nongnu.org; Wed, 24 Jul 2019 13:08:05 -0400
Received: from player746.ha.ovh.net (unknown [10.109.159.90])
 by mo68.mail-out.ovh.net (Postfix) with ESMTP id 78BEF13D2A8
 for <qemu-devel@nongnu.org>; Wed, 24 Jul 2019 19:08:03 +0200 (CEST)
Received: from kaod.org (deibp9eh1--blueice1n4.emea.ibm.com [195.212.29.166])
 (Authenticated sender: clg@kaod.org)
 by player746.ha.ovh.net (Postfix) with ESMTPSA id AC0F485F4F5F;
 Wed, 24 Jul 2019 17:07:58 +0000 (UTC)
To: Greg Kurz <groug@kaod.org>, David Gibson <david@gibson.dropbear.id.au>
References: <156398742921.546975.8822387598242513827.stgit@bahia.lan>
 <156398743479.546975.14566809803480887488.stgit@bahia.lan>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <f475ac78-d96b-586f-f3b8-5db7183eb41f@kaod.org>
Date: Wed, 24 Jul 2019 19:07:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <156398743479.546975.14566809803480887488.stgit@bahia.lan>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 10408663166517676883
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduvddrkedtgddutdegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.41.146
Subject: Re: [Qemu-devel] [PATCH for-4.1 1/2] spapr/irq: Inform the user
 when falling back to emulated IC
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24/07/2019 18:57, Greg Kurz wrote:
> Just to give an indication to the user that the error condition is
> handled and how.
>=20
> Reported-by: Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>
> Signed-off-by: Greg Kurz <groug@kaod.org>



Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>

Thanks,

C.

> ---
>  hw/ppc/spapr_irq.c |    1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/hw/ppc/spapr_irq.c b/hw/ppc/spapr_irq.c
> index ff3df0bbd8cf..d07aed8ca9f9 100644
> --- a/hw/ppc/spapr_irq.c
> +++ b/hw/ppc/spapr_irq.c
> @@ -86,6 +86,7 @@ static void spapr_irq_init_kvm(SpaprMachineState *spa=
pr,
>           * emulated mode
>           */
>          error_prepend(&local_err, "kernel_irqchip allowed but unavaila=
ble: ");
> +        error_append_hint(&local_err, "Falling back to kernel-irqchip=3D=
off\n");
>          warn_report_err(local_err);
>      }
>  }
>=20


