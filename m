Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34305530E77
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 12:54:09 +0200 (CEST)
Received: from localhost ([::1]:41748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nt5hP-0004Il-Qd
	for lists+qemu-devel@lfdr.de; Mon, 23 May 2022 06:54:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nt5fp-0002M6-Ex
 for qemu-devel@nongnu.org; Mon, 23 May 2022 06:52:29 -0400
Received: from 4.mo552.mail-out.ovh.net ([178.33.43.201]:39129)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nt5fm-0003IN-HG
 for qemu-devel@nongnu.org; Mon, 23 May 2022 06:52:28 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.97])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id BEA9024B6A;
 Mon, 23 May 2022 10:52:14 +0000 (UTC)
Received: from kaod.org (37.59.142.97) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Mon, 23 May
 2022 12:52:14 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G002354fbaff-84d6-497e-824f-29e3b5b49ff7,
 C731B9A3BAA00D555485D2122847869B54396093) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <18d4df72-0bf2-142c-7a06-bf46206cdd77@kaod.org>
Date: Mon, 23 May 2022 12:52:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH] Trivial: 3 char repeat typos
Content-Language: en-US
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>,
 <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>, <laurent@vivier.eu>,
 <mjt@tls.msk.ru>
CC: <danielhb413@gmail.com>, <mst@redhat.com>, <qemu-arm@nongnu.org>
References: <20220523095629.144441-1-dgilbert@redhat.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220523095629.144441-1-dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG4EX2.mxp5.local (172.16.2.32) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: cd6195bf-1ece-4281-85f8-f9811ec329da
X-Ovh-Tracer-Id: 7448390835730615148
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrjedugddtfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepudeiffdtudeikefhheevtefhtdfhieeggfduteehvedugeeghfdvuefftedtudejnecuffhomhgrihhnpehkvgihrdgurghtrgdpqhgtohguvgdruggrthgrnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdeljeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehqvghmuhdqrghrmhesnhhonhhgnhhurdhorhhg
Received-SPF: pass client-ip=178.33.43.201; envelope-from=clg@kaod.org;
 helo=4.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 5/23/22 11:56, Dr. David Alan Gilbert (git) wrote:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> 
> Inspired by Julia Lawall's fixing of Linux
> kernel comments, I looked at qemu, although I did it manually.
> 
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.

> ---
>   hw/intc/openpic.c                | 2 +-
>   hw/net/imx_fec.c                 | 2 +-
>   hw/pci/pcie_aer.c                | 2 +-
>   hw/pci/shpc.c                    | 2 +-
>   hw/ppc/spapr_caps.c              | 2 +-
>   hw/scsi/spapr_vscsi.c            | 2 +-
>   qapi/net.json                    | 2 +-
>   target/arm/cpu64.c               | 2 +-
>   tools/virtiofsd/passthrough_ll.c | 2 +-
>   ui/input.c                       | 2 +-
>   10 files changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/hw/intc/openpic.c b/hw/intc/openpic.c
> index 49504e740f..b0787e8ee7 100644
> --- a/hw/intc/openpic.c
> +++ b/hw/intc/openpic.c
> @@ -729,7 +729,7 @@ static void openpic_tmr_set_tmr(OpenPICTimer *tmr, uint32_t val, bool enabled)
>   }
>   
>   /*
> - * Returns the currrent tccr value, i.e., timer value (in clocks) with
> + * Returns the current tccr value, i.e., timer value (in clocks) with
>    * appropriate TOG.
>    */
>   static uint64_t openpic_tmr_get_timer(OpenPICTimer *tmr)
> diff --git a/hw/net/imx_fec.c b/hw/net/imx_fec.c
> index 0db9aaf76a..8c11b237de 100644
> --- a/hw/net/imx_fec.c
> +++ b/hw/net/imx_fec.c
> @@ -438,7 +438,7 @@ static void imx_eth_update(IMXFECState *s)
>        *   assignment fail.
>        *
>        * To ensure that all versions of Linux work, generate ENET_INT_MAC
> -     * interrrupts on both interrupt lines. This should be changed if and when
> +     * interrupts on both interrupt lines. This should be changed if and when
>        * qemu supports IOMUX.
>        */
>       if (s->regs[ENET_EIR] & s->regs[ENET_EIMR] &
> diff --git a/hw/pci/pcie_aer.c b/hw/pci/pcie_aer.c
> index 92bd0530dd..eff62f3945 100644
> --- a/hw/pci/pcie_aer.c
> +++ b/hw/pci/pcie_aer.c
> @@ -323,7 +323,7 @@ static void pcie_aer_msg_root_port(PCIDevice *dev, const PCIEAERMsg *msg)
>            */
>       }
>   
> -    /* Errro Message Received: Root Error Status register */
> +    /* Error Message Received: Root Error Status register */
>       switch (msg->severity) {
>       case PCI_ERR_ROOT_CMD_COR_EN:
>           if (root_status & PCI_ERR_ROOT_COR_RCV) {
> diff --git a/hw/pci/shpc.c b/hw/pci/shpc.c
> index 28e62174c4..88b56da799 100644
> --- a/hw/pci/shpc.c
> +++ b/hw/pci/shpc.c
> @@ -480,7 +480,7 @@ static const MemoryRegionOps shpc_mmio_ops = {
>       .endianness = DEVICE_LITTLE_ENDIAN,
>       .valid = {
>           /* SHPC ECN requires dword accesses, but the original 1.0 spec doesn't.
> -         * It's easier to suppport all sizes than worry about it. */
> +         * It's easier to support all sizes than worry about it. */
>           .min_access_size = 1,
>           .max_access_size = 4,
>       },
> diff --git a/hw/ppc/spapr_caps.c b/hw/ppc/spapr_caps.c
> index 655ab856a0..b4283055c1 100644
> --- a/hw/ppc/spapr_caps.c
> +++ b/hw/ppc/spapr_caps.c
> @@ -553,7 +553,7 @@ static void cap_ccf_assist_apply(SpaprMachineState *spapr, uint8_t val,
>                * instruction is a harmless no-op.  It won't correctly
>                * implement the cache count flush *but* if we have
>                * count-cache-disabled in the host, that flush is
> -             * unnnecessary.  So, specifically allow this case.  This
> +             * unnecessary.  So, specifically allow this case.  This
>                * allows us to have better performance on POWER9 DD2.3,
>                * while still working on POWER9 DD2.2 and POWER8 host
>                * cpus.
> diff --git a/hw/scsi/spapr_vscsi.c b/hw/scsi/spapr_vscsi.c
> index a07a8e1523..e320ccaa23 100644
> --- a/hw/scsi/spapr_vscsi.c
> +++ b/hw/scsi/spapr_vscsi.c
> @@ -1013,7 +1013,7 @@ static int vscsi_send_capabilities(VSCSIState *s, vscsi_req *req)
>       }
>   
>       /*
> -     * Current implementation does not suppport any migration or
> +     * Current implementation does not support any migration or
>        * reservation capabilities. Construct the response telling the
>        * guest not to use them.
>        */
> diff --git a/qapi/net.json b/qapi/net.json
> index b92f3f5fb4..8da34360db 100644
> --- a/qapi/net.json
> +++ b/qapi/net.json
> @@ -298,7 +298,7 @@
>   #
>   # @udp: use the udp version of l2tpv3 encapsulation
>   #
> -# @cookie64: use 64 bit coookies
> +# @cookie64: use 64 bit cookies
>   #
>   # @counter: have sequence counter
>   #
> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index 04427e073f..2467c5bf76 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -997,7 +997,7 @@ static void aarch64_a64fx_initfn(Object *obj)
>       cpu->gic_vpribits = 5;
>       cpu->gic_vprebits = 5;
>   
> -    /* Suppport of A64FX's vector length are 128,256 and 512bit only */
> +    /* Support of A64FX's vector length are 128,256 and 512bit only */
>       aarch64_add_sve_properties(obj);
>       bitmap_zero(cpu->sve_vq_supported, ARM_MAX_VQ);
>       set_bit(0, cpu->sve_vq_supported); /* 128bit */
> diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
> index b15c631ca5..7a73dfcce9 100644
> --- a/tools/virtiofsd/passthrough_ll.c
> +++ b/tools/virtiofsd/passthrough_ll.c
> @@ -2319,7 +2319,7 @@ static int do_lo_create(fuse_req_t req, struct lo_inode *parent_inode,
>            * If security.selinux has not been remapped and selinux is enabled,
>            * use fscreate to set context before file creation. If not, use
>            * tmpfile method for regular files. Otherwise fallback to
> -         * non-atomic method of file creation and xattr settting.
> +         * non-atomic method of file creation and xattr setting.
>            */
>           if (!mapped_name && lo->use_fscreate) {
>               err = do_create_secctx_fscreate(req, parent_inode, name, mode, fi,
> diff --git a/ui/input.c b/ui/input.c
> index 8ac407dec4..e2a90af889 100644
> --- a/ui/input.c
> +++ b/ui/input.c
> @@ -364,7 +364,7 @@ void qemu_input_event_send(QemuConsole *src, InputEvent *evt)
>        * when 'alt+print' was pressed. This flaw is now fixed and the
>        * 'sysrq' key serves no further purpose. We normalize it to
>        * 'print', so that downstream receivers of the event don't
> -     * neeed to deal with this mistake
> +     * need to deal with this mistake
>        */
>       if (evt->type == INPUT_EVENT_KIND_KEY &&
>           evt->u.key.data->key->u.qcode.data == Q_KEY_CODE_SYSRQ) {


