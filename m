Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B10518698
	for <lists+qemu-devel@lfdr.de>; Thu,  9 May 2019 10:12:15 +0200 (CEST)
Received: from localhost ([127.0.0.1]:50108 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hOeA2-0007AW-AC
	for lists+qemu-devel@lfdr.de; Thu, 09 May 2019 04:12:14 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42783)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <groug@kaod.org>) id 1hOe8x-0006bb-SN
	for qemu-devel@nongnu.org; Thu, 09 May 2019 04:11:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <groug@kaod.org>) id 1hOe8w-00031R-MM
	for qemu-devel@nongnu.org; Thu, 09 May 2019 04:11:07 -0400
Received: from 6.mo6.mail-out.ovh.net ([87.98.177.69]:35425)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <groug@kaod.org>) id 1hOe8v-0002wQ-Ie
	for qemu-devel@nongnu.org; Thu, 09 May 2019 04:11:05 -0400
Received: from player793.ha.ovh.net (unknown [10.108.35.210])
	by mo6.mail-out.ovh.net (Postfix) with ESMTP id D6D791BEF8A
	for <qemu-devel@nongnu.org>; Thu,  9 May 2019 10:11:02 +0200 (CEST)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
	[82.253.208.248]) (Authenticated sender: groug@kaod.org)
	by player793.ha.ovh.net (Postfix) with ESMTPSA id 7971C5A1FB53;
	Thu,  9 May 2019 08:10:57 +0000 (UTC)
Date: Thu, 9 May 2019 10:10:54 +0200
From: Greg Kurz <groug@kaod.org>
To: sathnaga@linux.vnet.ibm.com
Message-ID: <20190509101054.22a8f10e@bahia.lan>
In-Reply-To: <20190509080750.21999-1-sathnaga@linux.vnet.ibm.com>
References: <20190509080750.21999-1-sathnaga@linux.vnet.ibm.com>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 16183122315204401621
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduuddrkeehgddtudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecu
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 87.98.177.69
Subject: Re: [Qemu-devel] [Qemu-ppc] [PATCH] Fix typo on "info pic" monitor
 cmd output for xive
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: david@gibson.dropbear.id.au, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
	clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu,  9 May 2019 13:37:50 +0530
sathnaga@linux.vnet.ibm.com wrote:

> From: Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>
> 
> Instead of LISN i.e "Logical Interrupt Source Number" as per
> Xive PAPR document "info pic" prints as LSIN, let's fix it.
> 
> Signed-off-by: Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>
> ---

Reviewed-by: Greg Kurz <groug@kaod.org>

>  hw/intc/spapr_xive.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/intc/spapr_xive.c b/hw/intc/spapr_xive.c
> index 7faf03b1fb..df3c879826 100644
> --- a/hw/intc/spapr_xive.c
> +++ b/hw/intc/spapr_xive.c
> @@ -141,7 +141,7 @@ void spapr_xive_pic_print_info(SpaprXive *xive, Monitor *mon)
>      XiveSource *xsrc = &xive->source;
>      int i;
>  
> -    monitor_printf(mon, "  LSIN         PQ    EISN     CPU/PRIO EQ\n");
> +    monitor_printf(mon, "  LISN         PQ    EISN     CPU/PRIO EQ\n");
>  
>      for (i = 0; i < xive->nr_irqs; i++) {
>          uint8_t pq = xive_source_esb_get(xsrc, i);


