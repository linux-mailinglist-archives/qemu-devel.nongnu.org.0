Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10EF5FE294
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Nov 2019 17:19:27 +0100 (CET)
Received: from localhost ([::1]:41396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iVeJh-00039s-NJ
	for lists+qemu-devel@lfdr.de; Fri, 15 Nov 2019 11:19:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50814)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groug@kaod.org>) id 1iVeHq-0001of-EV
 for qemu-devel@nongnu.org; Fri, 15 Nov 2019 11:17:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groug@kaod.org>) id 1iVeHo-0004Qc-Q3
 for qemu-devel@nongnu.org; Fri, 15 Nov 2019 11:17:30 -0500
Received: from 8.mo69.mail-out.ovh.net ([46.105.56.233]:36896)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <groug@kaod.org>) id 1iVeHo-0004OF-It
 for qemu-devel@nongnu.org; Fri, 15 Nov 2019 11:17:28 -0500
Received: from player716.ha.ovh.net (unknown [10.108.54.59])
 by mo69.mail-out.ovh.net (Postfix) with ESMTP id 0A17E7235E
 for <qemu-devel@nongnu.org>; Fri, 15 Nov 2019 17:17:25 +0100 (CET)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
 [82.253.208.248]) (Authenticated sender: groug@kaod.org)
 by player716.ha.ovh.net (Postfix) with ESMTPSA id 108DFC1B3923;
 Fri, 15 Nov 2019 16:17:21 +0000 (UTC)
Date: Fri, 15 Nov 2019 17:17:19 +0100
From: Greg Kurz <groug@kaod.org>
To: David Gibson <david@gibson.dropbear.id.au>, =?UTF-8?B?Q8OpZHJpYw==?= Le
 Goater <clg@kaod.org>
Subject: Re: [PATCH] ppc/pnv: Drop "chip" link from POWER9 PSI object
Message-ID: <20191115171719.7ace9c0c@bahia.lan>
In-Reply-To: <157383383118.166856.2588933416368211047.stgit@bahia.lan>
References: <157383383118.166856.2588933416368211047.stgit@bahia.lan>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 14957861740675897830
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrudefhedgkeejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdqfffguegfifdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtgfesthejredtredtvdenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecukfhppedtrddtrddtrddtpdekvddrvdehfedrvddtkedrvdegkeenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeduiedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 46.105.56.233
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

Oops 'for-5.0' tag is missing :)

On Fri, 15 Nov 2019 17:03:51 +0100
Greg Kurz <groug@kaod.org> wrote:

> It has no apparent user.
> 
> Signed-off-by: Greg Kurz <groug@kaod.org>
> ---
>  hw/ppc/pnv.c |    2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
> index d7130c3304f0..24bc3d5ab32b 100644
> --- a/hw/ppc/pnv.c
> +++ b/hw/ppc/pnv.c
> @@ -1091,8 +1091,6 @@ static void pnv_chip_power9_instance_init(Object *obj)
>  
>      object_initialize_child(obj, "psi",  &chip9->psi, sizeof(chip9->psi),
>                              TYPE_PNV9_PSI, &error_abort, NULL);
> -    object_property_add_const_link(OBJECT(&chip9->psi), "chip", obj,
> -                                   &error_abort);
>  
>      object_initialize_child(obj, "lpc",  &chip9->lpc, sizeof(chip9->lpc),
>                              TYPE_PNV9_LPC, &error_abort, NULL);
> 
> 


