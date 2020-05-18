Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B9EB1D7E65
	for <lists+qemu-devel@lfdr.de>; Mon, 18 May 2020 18:28:21 +0200 (CEST)
Received: from localhost ([::1]:32856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jaicm-0001SD-Ie
	for lists+qemu-devel@lfdr.de; Mon, 18 May 2020 12:28:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1jaibl-0000WW-G5
 for qemu-devel@nongnu.org; Mon, 18 May 2020 12:27:17 -0400
Received: from 5.mo177.mail-out.ovh.net ([46.105.39.154]:35033)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1jaibk-00022r-37
 for qemu-devel@nongnu.org; Mon, 18 May 2020 12:27:17 -0400
Received: from player714.ha.ovh.net (unknown [10.110.103.132])
 by mo177.mail-out.ovh.net (Postfix) with ESMTP id 5ADF312DCA5
 for <qemu-devel@nongnu.org>; Mon, 18 May 2020 18:27:13 +0200 (CEST)
Received: from kaod.org (82-64-250-170.subs.proxad.net [82.64.250.170])
 (Authenticated sender: clg@kaod.org)
 by player714.ha.ovh.net (Postfix) with ESMTPSA id DCA14126B993C;
 Mon, 18 May 2020 16:27:05 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G0054766cf72-3015-4a90-b400-470d3d166526,2E2A9519E3FAC9D985F861812C9F86F7BE89492F)
 smtp.auth=clg@kaod.org
Subject: Re: [PATCH 17/24] pnv/psi: Correct the pnv-psi* devices not to be
 sysbus devices
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20200518050408.4579-1-armbru@redhat.com>
 <20200518050408.4579-18-armbru@redhat.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <648a3207-b842-6dd3-0f00-a26acb3d48be@kaod.org>
Date: Mon, 18 May 2020 18:27:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200518050408.4579-18-armbru@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 13213561310930045779
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduhedruddthedguddttdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefuvfhfhffkffgfgggjtgfgsehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepfeffvddtudegieefudeugffhjefgieegieegleettdehgfeiieevueeihfegfefgnecukfhppedtrddtrddtrddtpdekvddrieegrddvhedtrddujedtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjedugedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhg
Received-SPF: pass client-ip=46.105.39.154; envelope-from=clg@kaod.org;
 helo=5.mo177.mail-out.ovh.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/18 12:27:13
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_PASS=-0.001,
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

I might have done things wrong regarding sysbus in the PowerNV machine.

For some devices (PHBs), I have added :

	qdev_set_parent_bus(DEVICE(...), sysbus_get_default());

Should we do the same for the PSI device ?

Thanks,

C.

> 
> Cc: "Cédric Le Goater" <clg@kaod.org>
> Cc: David Gibson <david@gibson.dropbear.id.au>
> Cc: qemu-ppc@nongnu.org
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
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


