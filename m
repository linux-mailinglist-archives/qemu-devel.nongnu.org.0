Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32CB11D9715
	for <lists+qemu-devel@lfdr.de>; Tue, 19 May 2020 15:06:07 +0200 (CEST)
Received: from localhost ([::1]:44542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jb1wb-0004ER-Sn
	for lists+qemu-devel@lfdr.de; Tue, 19 May 2020 09:06:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1jb1vh-0003e5-Ff
 for qemu-devel@nongnu.org; Tue, 19 May 2020 09:05:09 -0400
Received: from 10.mo6.mail-out.ovh.net ([87.98.157.236]:34955)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1jb1vf-0003RO-Te
 for qemu-devel@nongnu.org; Tue, 19 May 2020 09:05:09 -0400
Received: from player735.ha.ovh.net (unknown [10.108.57.50])
 by mo6.mail-out.ovh.net (Postfix) with ESMTP id 866A420F892
 for <qemu-devel@nongnu.org>; Tue, 19 May 2020 15:05:01 +0200 (CEST)
Received: from kaod.org (82-64-250-170.subs.proxad.net [82.64.250.170])
 (Authenticated sender: clg@kaod.org)
 by player735.ha.ovh.net (Postfix) with ESMTPSA id 206E6124A3381;
 Tue, 19 May 2020 13:04:54 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-96R001ee25d7a3-0f63-4c99-b5e2-df2b1ee809d4,3DCE2E61E2D7C1BA27EF92566E0C35A5904F621F)
 smtp.auth=clg@kaod.org
Subject: Re: [PATCH 17/24] pnv/psi: Correct the pnv-psi* devices not to be
 sysbus devices
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20200518050408.4579-1-armbru@redhat.com>
 <20200518050408.4579-18-armbru@redhat.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <84602e75-5a01-cbd5-b9e1-50a1b58f8849@kaod.org>
Date: Tue, 19 May 2020 15:04:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200518050408.4579-18-armbru@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 15671682280782793555
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduhedruddtjedgheelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeefffdvtddugeeifeduuefghfejgfeigeeigeeltedthefgieeiveeuiefhgeefgfenucfkpheptddrtddrtddrtddpkedvrdeigedrvdehtddrudejtdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejfeehrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrgh
Received-SPF: pass client-ip=87.98.157.236; envelope-from=clg@kaod.org;
 helo=10.mo6.mail-out.ovh.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/19 09:05:02
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: qemu-ppc@nongnu.org, pbonzini@redhat.com, berrange@redhat.com,
 ehabkost@redhat.com, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/18/20 7:04 AM, Markus Armbruster wrote:
> pnv_chip_power8_instance_init() creates a "pnv-psi-POWER8" sysbus
> device in a way that leaves it unplugged.
> pnv_chip_power9_instance_init() and pnv_chip_power10_instance_init()
> do the same for "pnv-psi-POWER9" and "pnv-psi-POWER10", respectively.
> 
> These devices aren't actually sysbus devices.  Correct that.
> 
> Cc: "Cédric Le Goater" <clg@kaod.org>
> Cc: David Gibson <david@gibson.dropbear.id.au>
> Cc: qemu-ppc@nongnu.org
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

> ---
>  include/hw/ppc/pnv_psi.h | 2 +-
>  hw/ppc/pnv_psi.c         | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/include/hw/ppc/pnv_psi.h b/include/hw/ppc/pnv_psi.h
> index f0f5b55197..979fc59f33 100644
> --- a/include/hw/ppc/pnv_psi.h
> +++ b/include/hw/ppc/pnv_psi.h
> @@ -31,7 +31,7 @@
>  #define PSIHB_XSCOM_MAX         0x20
>  
>  typedef struct PnvPsi {
> -    SysBusDevice parent;
> +    DeviceState parent;
>  
>      MemoryRegion regs_mr;
>      uint64_t bar;
> diff --git a/hw/ppc/pnv_psi.c b/hw/ppc/pnv_psi.c
> index cfd5b7bc25..82f0769465 100644
> --- a/hw/ppc/pnv_psi.c
> +++ b/hw/ppc/pnv_psi.c
> @@ -943,7 +943,7 @@ static void pnv_psi_class_init(ObjectClass *klass, void *data)
>  
>  static const TypeInfo pnv_psi_info = {
>      .name          = TYPE_PNV_PSI,
> -    .parent        = TYPE_SYS_BUS_DEVICE,
> +    .parent        = TYPE_DEVICE,
>      .instance_size = sizeof(PnvPsi),
>      .class_init    = pnv_psi_class_init,
>      .class_size    = sizeof(PnvPsiClass),
> 


