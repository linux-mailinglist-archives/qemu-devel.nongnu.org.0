Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 297D7132325
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jan 2020 11:03:27 +0100 (CET)
Received: from localhost ([::1]:45602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iolhs-0002h5-BI
	for lists+qemu-devel@lfdr.de; Tue, 07 Jan 2020 05:03:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46608)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groug@kaod.org>) id 1iolWF-0006Fh-48
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 04:51:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groug@kaod.org>) id 1iolWC-0006qH-P3
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 04:51:22 -0500
Received: from 4.mo178.mail-out.ovh.net ([46.105.49.171]:60768)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <groug@kaod.org>) id 1iolWC-0006oM-In
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 04:51:20 -0500
Received: from player159.ha.ovh.net (unknown [10.108.54.38])
 by mo178.mail-out.ovh.net (Postfix) with ESMTP id 148528B4FB
 for <qemu-devel@nongnu.org>; Tue,  7 Jan 2020 10:51:17 +0100 (CET)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
 [82.253.208.248]) (Authenticated sender: groug@kaod.org)
 by player159.ha.ovh.net (Postfix) with ESMTPSA id 8779DDE7D743;
 Tue,  7 Jan 2020 09:51:14 +0000 (UTC)
Date: Tue, 7 Jan 2020 10:51:13 +0100
From: Greg Kurz <groug@kaod.org>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH v1 12/59] virtfs-proxy-helper.c: remove 'err_out' label
 in setugid()
Message-ID: <20200107105113.7a443d51@bahia.lan>
In-Reply-To: <20200106182425.20312-13-danielhb413@gmail.com>
References: <20200106182425.20312-1-danielhb413@gmail.com>
 <20200106182425.20312-13-danielhb413@gmail.com>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 6094777671292524806
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrvdehvddgtdejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtgfesthejredtredtvdenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecukfhppedtrddtrddtrddtpdekvddrvdehfedrvddtkedrvdegkeenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrudehledrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 46.105.49.171
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
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon,  6 Jan 2020 15:23:38 -0300
Daniel Henrique Barboza <danielhb413@gmail.com> wrote:

> 'err_out' can be removed and be replaced by 'return -errno'
> in its only instance in the function.
> 
> CC: Greg Kurz <groug@kaod.org>
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---

I don't really mind, but I confirm this doesn't change behavior.

Acked-by: Greg Kurz <groug@kaod.org>

What's the plan to get this and the other 9p related patches merged ?
Through the trivial tree or each subsystem tree ?

>  fsdev/virtfs-proxy-helper.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/fsdev/virtfs-proxy-helper.c b/fsdev/virtfs-proxy-helper.c
> index 0d4de49dcf..aa1ab2590d 100644
> --- a/fsdev/virtfs-proxy-helper.c
> +++ b/fsdev/virtfs-proxy-helper.c
> @@ -287,8 +287,7 @@ static int setugid(int uid, int gid, int *suid, int *sgid)
>      *sgid = getegid();
>  
>      if (setresgid(-1, gid, *sgid) == -1) {
> -        retval = -errno;
> -        goto err_out;
> +        return -errno;
>      }
>  
>      if (setresuid(-1, uid, *suid) == -1) {
> @@ -322,7 +321,6 @@ err_sgid:
>      if (setresgid(-1, *sgid, *sgid) == -1) {
>          abort();
>      }
> -err_out:
>      return retval;
>  }
>  


