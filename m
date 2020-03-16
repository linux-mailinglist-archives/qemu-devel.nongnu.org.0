Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BE791872DD
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Mar 2020 19:58:26 +0100 (CET)
Received: from localhost ([::1]:46874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jDuwT-0005Be-6r
	for lists+qemu-devel@lfdr.de; Mon, 16 Mar 2020 14:58:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59143)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groug@kaod.org>) id 1jDu39-0004Z4-52
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 14:01:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groug@kaod.org>) id 1jDu38-0007ta-1U
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 14:01:15 -0400
Received: from 1.mo173.mail-out.ovh.net ([178.33.111.180]:41115)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <groug@kaod.org>) id 1jDu37-0007oB-Rg
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 14:01:13 -0400
Received: from player697.ha.ovh.net (unknown [10.108.35.128])
 by mo173.mail-out.ovh.net (Postfix) with ESMTP id DF83A13391A
 for <qemu-devel@nongnu.org>; Mon, 16 Mar 2020 19:01:11 +0100 (CET)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
 [82.253.208.248]) (Authenticated sender: groug@kaod.org)
 by player697.ha.ovh.net (Postfix) with ESMTPSA id 359DC107DFC69;
 Mon, 16 Mar 2020 18:01:05 +0000 (UTC)
Date: Mon, 16 Mar 2020 19:01:03 +0100
From: Greg Kurz <groug@kaod.org>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 5/8] ppc/spapr: Allow FWNMI on TCG
Message-ID: <20200316190103.00bd1628@bahia.lan>
In-Reply-To: <20200316142613.121089-6-npiggin@gmail.com>
References: <20200316142613.121089-1-npiggin@gmail.com>
 <20200316142613.121089-6-npiggin@gmail.com>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 13755963587237419459
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedugedrudeffedguddtjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvuffkjghfofggtgfgsehtjeertdertddvnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucfkpheptddrtddrtddrtddpkedvrddvheefrddvtdekrddvgeeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrieeljedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhg
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 178.33.111.180
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
Cc: Aravinda Prasad <arawinda.p@gmail.com>,
 Alexey Kardashevskiy <aik@ozlabs.ru>, qemu-devel@nongnu.org,
 Ganesh Goudar <ganeshgr@linux.ibm.com>, qemu-ppc@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 17 Mar 2020 00:26:10 +1000
Nicholas Piggin <npiggin@gmail.com> wrote:

> There should no longer be a reason to prevent TCG providing FWNMI.
> System Reset interrupts are generated to the guest with nmi monitor
> command and H_SIGNAL_SYS_RESET. Machine Checks can not be injected
> currently, but this could be implemented with the mce monitor cmd
> similarly to i386.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  hw/ppc/spapr_caps.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/hw/ppc/spapr_caps.c b/hw/ppc/spapr_caps.c
> index f626d769a0..679ae7959f 100644
> --- a/hw/ppc/spapr_caps.c
> +++ b/hw/ppc/spapr_caps.c
> @@ -516,10 +516,7 @@ static void cap_fwnmi_apply(SpaprMachineState *spapr, uint8_t val,
>          return; /* Disabled by default */
>      }
>  
> -    if (tcg_enabled()) {
> -        warn_report("Firmware Assisted Non-Maskable Interrupts(FWNMI) not "
> -                    "supported in TCG");

With this warning removed, we can now drop the "cap-fwnmi=off" setting
in qtest, but this can be done as a followup.

Reviewed-by: Greg Kurz <groug@kaod.org>

> -    } else if (kvm_enabled()) {
> +    if (kvm_enabled()) {
>          if (kvmppc_set_fwnmi() < 0) {
>              error_setg(errp, "Firmware Assisted Non-Maskable Interrupts(FWNMI) "
>                               "not supported by KVM");


