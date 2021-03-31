Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4387134F9C2
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Mar 2021 09:22:31 +0200 (CEST)
Received: from localhost ([::1]:55492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRVBL-0000um-DT
	for lists+qemu-devel@lfdr.de; Wed, 31 Mar 2021 03:22:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>)
 id 1lRVA0-0000Ux-EN; Wed, 31 Mar 2021 03:21:04 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:36779)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>)
 id 1lRV9y-0000l1-94; Wed, 31 Mar 2021 03:21:04 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.216])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 6A6D5961F045;
 Wed, 31 Mar 2021 09:20:58 +0200 (CEST)
Received: from kaod.org (37.59.142.104) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Wed, 31 Mar
 2021 09:20:57 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-104R005201826ac-a360-4a58-b93b-0faac95adc14,
 9D8442807461E38AC8E896D56D3346AE12FD8989) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 78.197.208.248
Date: Wed, 31 Mar 2021 09:20:56 +0200
From: Greg Kurz <groug@kaod.org>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH qemu] spapr: Rename RTAS_MAX_ADDR to FDT_MAX_ADDR
Message-ID: <20210331092056.458de363@bahia.lan>
In-Reply-To: <20210331025123.29310-1-aik@ozlabs.ru>
References: <20210331025123.29310-1-aik@ozlabs.ru>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.104]
X-ClientProxiedBy: DAG3EX2.mxp5.local (172.16.2.22) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: 5cfa61e1-80d2-465a-90d4-51c68a9287f0
X-Ovh-Tracer-Id: 2511319744087431648
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrudeiuddguddujecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvuffkjghfofggtgfgihesthejredtredtvdenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepfedutdeijeejveehkeeileetgfelteekteehtedtieefffevhffflefftdefleejnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopegurghvihgusehgihgsshhonhdrughrohhpsggvrghrrdhiugdrrghu
Received-SPF: pass client-ip=178.32.125.2; envelope-from=groug@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 31 Mar 2021 13:51:23 +1100
Alexey Kardashevskiy <aik@ozlabs.ru> wrote:

> SLOF instantiates RTAS since
> 744a928ccee9 ("spapr: Stop providing RTAS blob")
> so the max address applies to the FDT only.
> 
> This renames the macro and fixes up the comment.
> 
> This should not cause any behavioral change.
> 
> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> ---

Reviewed-by: Greg Kurz <groug@kaod.org>

>  hw/ppc/spapr.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index 73a06df3b1b1..1e18a0a62839 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -100,7 +100,7 @@
>   *
>   * We load our kernel at 4M, leaving space for SLOF initial image
>   */
> -#define RTAS_MAX_ADDR           0x80000000 /* RTAS must stay below that */
> +#define FDT_MAX_ADDR            0x80000000 /* FDT must stay below that */
>  #define FW_MAX_SIZE             0x400000
>  #define FW_FILE_NAME            "slof.bin"
>  #define FW_OVERHEAD             0x2800000
> @@ -1617,11 +1617,11 @@ static void spapr_machine_reset(MachineState *machine)
>      spapr_clear_pending_events(spapr);
>  
>      /*
> -     * We place the device tree and RTAS just below either the top of the RMA,
> +     * We place the device tree just below either the top of the RMA,
>       * or just below 2GB, whichever is lower, so that it can be
>       * processed with 32-bit real mode code if necessary
>       */
> -    fdt_addr = MIN(spapr->rma_size, RTAS_MAX_ADDR) - FDT_MAX_SIZE;
> +    fdt_addr = MIN(spapr->rma_size, FDT_MAX_ADDR) - FDT_MAX_SIZE;
>  
>      fdt = spapr_build_fdt(spapr, true, FDT_MAX_SIZE);
>  
> @@ -2694,7 +2694,7 @@ static void spapr_machine_init(MachineState *machine)
>      spapr->rma_size = spapr_rma_size(spapr, &error_fatal);
>  
>      /* Setup a load limit for the ramdisk leaving room for SLOF and FDT */
> -    load_limit = MIN(spapr->rma_size, RTAS_MAX_ADDR) - FW_OVERHEAD;
> +    load_limit = MIN(spapr->rma_size, FDT_MAX_ADDR) - FW_OVERHEAD;
>  
>      /*
>       * VSMT must be set in order to be able to compute VCPU ids, ie to


