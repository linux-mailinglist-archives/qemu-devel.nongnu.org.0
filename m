Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F0711B294
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Dec 2019 16:37:07 +0100 (CET)
Received: from localhost ([::1]:44504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1if430-0007sw-Bf
	for lists+qemu-devel@lfdr.de; Wed, 11 Dec 2019 10:37:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40407)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clg@kaod.org>) id 1if41v-0007S1-W9
 for qemu-devel@nongnu.org; Wed, 11 Dec 2019 10:36:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clg@kaod.org>) id 1if41u-0002Z9-Rj
 for qemu-devel@nongnu.org; Wed, 11 Dec 2019 10:35:59 -0500
Received: from 14.mo5.mail-out.ovh.net ([188.165.51.82]:59248)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clg@kaod.org>) id 1if41u-0002Og-Lw
 for qemu-devel@nongnu.org; Wed, 11 Dec 2019 10:35:58 -0500
Received: from player690.ha.ovh.net (unknown [10.108.42.176])
 by mo5.mail-out.ovh.net (Postfix) with ESMTP id D24D7262628
 for <qemu-devel@nongnu.org>; Wed, 11 Dec 2019 16:35:48 +0100 (CET)
Received: from kaod.org (lfbn-tou-1-1227-223.w90-76.abo.wanadoo.fr
 [90.76.50.223]) (Authenticated sender: clg@kaod.org)
 by player690.ha.ovh.net (Postfix) with ESMTPSA id 1717AD0F4835;
 Wed, 11 Dec 2019 15:35:41 +0000 (UTC)
Subject: Re: [PATCH] ppc/pnv: Make PnvXScomInterface an incomplete type
To: Greg Kurz <groug@kaod.org>, David Gibson <david@gibson.dropbear.id.au>
References: <157607473444.179018.14127987124523137347.stgit@bahia.lan>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <c66981b1-0be1-6f59-8dd7-5f4744c506e1@kaod.org>
Date: Wed, 11 Dec 2019 16:35:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <157607473444.179018.14127987124523137347.stgit@bahia.lan>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 924363826463017811
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrudelhedgjeegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucfkpheptddrtddrtddrtddpledtrdejiedrhedtrddvvdefnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrheiledtrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghenucevlhhushhtvghrufhiiigvpedt
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 188.165.51.82
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

On 11/12/2019 15:32, Greg Kurz wrote:
> PnvXScomInterface is an interface instance. It should never be
> dereferenced. Drop the dummy type definition for extra safety,
> which is the common practice with QOM interfaces.
> 
> Signed-off-by: Greg Kurz <groug@kaod.org>
> ---
>  include/hw/ppc/pnv_xscom.h |    4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/include/hw/ppc/pnv_xscom.h b/include/hw/ppc/pnv_xscom.h
> index 1c1d76bf9be5..b738011ab205 100644
> --- a/include/hw/ppc/pnv_xscom.h
> +++ b/include/hw/ppc/pnv_xscom.h
> @@ -22,9 +22,7 @@
>  
>  #include "qom/object.h"
>  
> -typedef struct PnvXScomInterface {
> -    Object parent;
> -} PnvXScomInterface;
> +typedef struct PnvXScomInterface PnvXScomInterface;
>  
>  #define TYPE_PNV_XSCOM_INTERFACE "pnv-xscom-interface"
>  #define PNV_XSCOM_INTERFACE(obj) \

We should use INTERFACE_CHECK() here.

C.

 


