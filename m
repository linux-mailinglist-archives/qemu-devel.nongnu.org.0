Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD89A156370
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Feb 2020 09:38:48 +0100 (CET)
Received: from localhost ([::1]:38934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j0LdX-00029o-PW
	for lists+qemu-devel@lfdr.de; Sat, 08 Feb 2020 03:38:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53226)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groug@kaod.org>) id 1j0Lcm-0001VW-TP
 for qemu-devel@nongnu.org; Sat, 08 Feb 2020 03:38:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groug@kaod.org>) id 1j0Lcl-00019C-HZ
 for qemu-devel@nongnu.org; Sat, 08 Feb 2020 03:38:00 -0500
Received: from 10.mo68.mail-out.ovh.net ([46.105.79.203]:42940)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <groug@kaod.org>) id 1j0Lcl-000184-B6
 for qemu-devel@nongnu.org; Sat, 08 Feb 2020 03:37:59 -0500
Received: from player715.ha.ovh.net (unknown [10.110.208.43])
 by mo68.mail-out.ovh.net (Postfix) with ESMTP id 4797E15A154
 for <qemu-devel@nongnu.org>; Sat,  8 Feb 2020 09:37:57 +0100 (CET)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
 [82.253.208.248]) (Authenticated sender: groug@kaod.org)
 by player715.ha.ovh.net (Postfix) with ESMTPSA id ACA72EF58F9D;
 Sat,  8 Feb 2020 08:37:55 +0000 (UTC)
Date: Sat, 8 Feb 2020 09:37:53 +0100
From: Greg Kurz <groug@kaod.org>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [PATCH] MAINTAINERS: 9pfs: Add myself as reviewer
Message-ID: <20200208093753.5decf8ce@bahia.lan>
In-Reply-To: <E1j04TG-0001xn-JY@lizzy.crudebyte.com>
References: <E1j04TG-0001xn-JY@lizzy.crudebyte.com>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 8314770815000156480
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedugedrheeigdduvddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpeffhffvuffkjghfofggtgfgsehtjeertdertddvnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucfkpheptddrtddrtddrtddpkedvrddvheefrddvtdekrddvgeeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeduhedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhg
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.79.203
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 7 Feb 2020 14:32:43 +0100
Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:

> Currently 9pfs is only taken care of by Greg. Since I am actively working
> on 9pfs and already became quite used to the code base, it makes sense to
> volunteer as reviewer for 9pfs related patches.
> 
> Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> Cc: Greg Kurz <groug@kaod.org>
> ---

Great thanks for volunteering Christian ! :)

I've applied this to 9p-next and I will send a PR soon.

>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e72b5e5f69..ce46c0a552 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1578,6 +1578,7 @@ F: include/hw/virtio/
>  
>  virtio-9p
>  M: Greg Kurz <groug@kaod.org>
> +R: Christian Schoenebeck <qemu_oss@crudebyte.com>
>  S: Odd Fixes
>  F: hw/9pfs/
>  X: hw/9pfs/xen-9p*


