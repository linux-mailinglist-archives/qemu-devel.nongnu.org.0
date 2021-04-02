Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD966352BA5
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Apr 2021 17:13:26 +0200 (CEST)
Received: from localhost ([::1]:36002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lSLUD-0002b7-BS
	for lists+qemu-devel@lfdr.de; Fri, 02 Apr 2021 11:13:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lSLTN-00022L-GY
 for qemu-devel@nongnu.org; Fri, 02 Apr 2021 11:12:33 -0400
Received: from 5.mo52.mail-out.ovh.net ([188.165.45.220]:47912)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lSLTL-0003Ch-AM
 for qemu-devel@nongnu.org; Fri, 02 Apr 2021 11:12:33 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.137])
 by mo52.mail-out.ovh.net (Postfix) with ESMTPS id D3FBF256D31;
 Fri,  2 Apr 2021 17:12:19 +0200 (CEST)
Received: from kaod.org (37.59.142.95) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Fri, 2 Apr 2021
 17:12:19 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G0017aa8a2b9-02fb-4f61-8382-18e3f2b59c62,
 CB78C42F11C12B32A09FD1B1D16988F28347D0D1) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 78.197.208.248
Date: Fri, 2 Apr 2021 17:12:17 +0200
From: Greg Kurz <groug@kaod.org>
To: Vaibhav Jain <vaibhav@linux.ibm.com>
Subject: Re: [PATCH v3] ppc/spapr: Add support for implement support for
 H_SCM_HEALTH
Message-ID: <20210402171217.711ad6b5@bahia.lan>
In-Reply-To: <20210402102128.213943-1-vaibhav@linux.ibm.com>
References: <20210402102128.213943-1-vaibhav@linux.ibm.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG7EX2.mxp5.local (172.16.2.62) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: 56c54b3b-684b-4f6b-821b-a618a71a243b
X-Ovh-Tracer-Id: 3770357316049148347
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrudeiiedgkeefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtgfhisehtjeertdertddvnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeekgeffheegjeegvdejueevleeiffekheeghfeijeetvedukeehudetlefhteefgfenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtohepmhgrrhgtvghlrdgrphhfvghlsggruhhmsehgmhgrihhlrdgtohhm
Received-SPF: pass client-ip=188.165.45.220; envelope-from=groug@kaod.org;
 helo=5.mo52.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: xiaoguangrong.eric@gmail.com, mst@redhat.com, aneesh.kumar@linux.ibm.com,
 qemu-devel@nongnu.org, kvm-ppc@vger.kernel.org, shivaprasadbhat@gmail.com,
 qemu-ppc@nongnu.org, bharata@linux.vnet.ibm.com, imammedo@redhat.com,
 ehabkost@redhat.com, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri,  2 Apr 2021 15:51:28 +0530
Vaibhav Jain <vaibhav@linux.ibm.com> wrote:

> Add support for H_SCM_HEALTH hcall described at [1] for spapr
> nvdimms. This enables guest to detect the 'unarmed' status of a
> specific spapr nvdimm identified by its DRC and if its unarmed, mark
> the region backed by the nvdimm as read-only.
> 
> The patch adds h_scm_health() to handle the H_SCM_HEALTH hcall which
> returns two 64-bit bitmaps (health bitmap, health bitmap mask) derived
> from 'struct nvdimm->unarmed' member.
> 
> Linux kernel side changes to enable handling of 'unarmed' nvdimms for
> ppc64 are proposed at [2].
> 
> References:
> [1] "Hypercall Op-codes (hcalls)"
>     https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/powerpc/papr_hcalls.rst#n220
> [2] "powerpc/papr_scm: Mark nvdimm as unarmed if needed during probe"
>     https://lore.kernel.org/linux-nvdimm/20210329113103.476760-1-vaibhav@linux.ibm.com/
> 
> Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
> ---
> Changelog
> 
> v3:
> * Switched to PPC_BIT macro for definitions of the health bits. [ Greg, David ]
> * Updated h_scm_health() to use a const uint64_t to denote supported
>   bits in 'hbitmap_mask'.
> * Fixed an error check for drc->dev to return H_PARAMETER in case nvdimm
>   is not yet plugged in [ Greg ]
> * Fixed an wrong error check for ensuring drc and drc-type are correct
>   [ Greg ]
> 
> v2:
> * Added a check for drc->dev to ensure that the dimm is plugged in
>   when servicing H_SCM_HEALTH. [ Shiva ]
> * Instead of accessing the 'nvdimm->unarmed' member directly use the
>   object_property_get_bool accessor to fetch it. [ Shiva ]
> * Update the usage of PAPR_PMEM_UNARMED* macros [ Greg ]
> * Updated patch description reference#1 to point appropriate section
>   in the documentation. [ Greg ]
> ---

Reviewed-by: Greg Kurz <groug@kaod.org>

>  hw/ppc/spapr_nvdimm.c  | 36 ++++++++++++++++++++++++++++++++++++
>  include/hw/ppc/spapr.h |  3 ++-
>  2 files changed, 38 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/ppc/spapr_nvdimm.c b/hw/ppc/spapr_nvdimm.c
> index b46c36917c..252204e25f 100644
> --- a/hw/ppc/spapr_nvdimm.c
> +++ b/hw/ppc/spapr_nvdimm.c
> @@ -31,6 +31,10 @@
>  #include "qemu/range.h"
>  #include "hw/ppc/spapr_numa.h"
>  
> +/* DIMM health bitmap bitmap indicators. Taken from kernel's papr_scm.c */
> +/* SCM device is unable to persist memory contents */
> +#define PAPR_PMEM_UNARMED PPC_BIT(0)
> +
>  bool spapr_nvdimm_validate(HotplugHandler *hotplug_dev, NVDIMMDevice *nvdimm,
>                             uint64_t size, Error **errp)
>  {
> @@ -467,6 +471,37 @@ static target_ulong h_scm_unbind_all(PowerPCCPU *cpu, SpaprMachineState *spapr,
>      return H_SUCCESS;
>  }
>  
> +static target_ulong h_scm_health(PowerPCCPU *cpu, SpaprMachineState *spapr,
> +                                 target_ulong opcode, target_ulong *args)
> +{
> +
> +    NVDIMMDevice *nvdimm;
> +    uint64_t hbitmap = 0;
> +    uint32_t drc_index = args[0];
> +    SpaprDrc *drc = spapr_drc_by_index(drc_index);
> +    const uint64_t hbitmap_mask = PAPR_PMEM_UNARMED;
> +
> +
> +    /* Ensure that the drc is valid & is valid PMEM dimm and is plugged in */
> +    if (!drc || !drc->dev ||
> +        spapr_drc_type(drc) != SPAPR_DR_CONNECTOR_TYPE_PMEM) {
> +        return H_PARAMETER;
> +    }
> +
> +    nvdimm = NVDIMM(drc->dev);
> +
> +    /* Update if the nvdimm is unarmed and send its status via health bitmaps */
> +    if (object_property_get_bool(OBJECT(nvdimm), NVDIMM_UNARMED_PROP, NULL)) {
> +        hbitmap |= PAPR_PMEM_UNARMED;
> +    }
> +
> +    /* Update the out args with health bitmap/mask */
> +    args[0] = hbitmap;
> +    args[1] = hbitmap_mask;
> +
> +    return H_SUCCESS;
> +}
> +
>  static void spapr_scm_register_types(void)
>  {
>      /* qemu/scm specific hcalls */
> @@ -475,6 +510,7 @@ static void spapr_scm_register_types(void)
>      spapr_register_hypercall(H_SCM_BIND_MEM, h_scm_bind_mem);
>      spapr_register_hypercall(H_SCM_UNBIND_MEM, h_scm_unbind_mem);
>      spapr_register_hypercall(H_SCM_UNBIND_ALL, h_scm_unbind_all);
> +    spapr_register_hypercall(H_SCM_HEALTH, h_scm_health);
>  }
>  
>  type_init(spapr_scm_register_types)
> diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
> index 47cebaf3ac..6e1eafb05d 100644
> --- a/include/hw/ppc/spapr.h
> +++ b/include/hw/ppc/spapr.h
> @@ -538,8 +538,9 @@ struct SpaprMachineState {
>  #define H_SCM_BIND_MEM          0x3EC
>  #define H_SCM_UNBIND_MEM        0x3F0
>  #define H_SCM_UNBIND_ALL        0x3FC
> +#define H_SCM_HEALTH            0x400
>  
> -#define MAX_HCALL_OPCODE        H_SCM_UNBIND_ALL
> +#define MAX_HCALL_OPCODE        H_SCM_HEALTH
>  
>  /* The hcalls above are standardized in PAPR and implemented by pHyp
>   * as well.


