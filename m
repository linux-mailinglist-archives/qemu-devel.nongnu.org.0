Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 781DC1B1074
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Apr 2020 17:44:21 +0200 (CEST)
Received: from localhost ([::1]:38080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jQYap-0002XL-7i
	for lists+qemu-devel@lfdr.de; Mon, 20 Apr 2020 11:44:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39506 helo=eggs1p.gnu.org)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groug@kaod.org>) id 1jQYZC-0001vU-3R
 for qemu-devel@nongnu.org; Mon, 20 Apr 2020 11:42:38 -0400
Received: from Debian-exim by eggs1p.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <groug@kaod.org>) id 1jQYZB-0003aF-Dr
 for qemu-devel@nongnu.org; Mon, 20 Apr 2020 11:42:37 -0400
Received: from 13.mo4.mail-out.ovh.net ([178.33.251.8]:49962)
 by eggs1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1jQYZA-0003Ur-UQ
 for qemu-devel@nongnu.org; Mon, 20 Apr 2020 11:42:37 -0400
Received: from player759.ha.ovh.net (unknown [10.108.35.185])
 by mo4.mail-out.ovh.net (Postfix) with ESMTP id DAA32230D12
 for <qemu-devel@nongnu.org>; Mon, 20 Apr 2020 17:42:31 +0200 (CEST)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
 [82.253.208.248]) (Authenticated sender: groug@kaod.org)
 by player759.ha.ovh.net (Postfix) with ESMTPSA id 1E8B3119A01C9;
 Mon, 20 Apr 2020 15:42:30 +0000 (UTC)
Date: Mon, 20 Apr 2020 17:42:26 +0200
From: Greg Kurz <groug@kaod.org>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [PATCH] qemu-options.hx: 9p: clarify -virtfs vs. -fsdev
Message-ID: <20200420174226.69807b11@bahia.lan>
In-Reply-To: <208f1fceffce2feaf7c900b29e326b967dce7762.1585661532.git.qemu_oss@crudebyte.com>
References: <208f1fceffce2feaf7c900b29e326b967dce7762.1585661532.git.qemu_oss@crudebyte.com>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 14044193964349561152
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduhedrgeefgdekjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhepfffhvffukfgjfhfogggtgfesthejredtredtvdenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecukfhppedtrddtrddtrddtpdekvddrvdehfedrvddtkedrvdegkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejheelrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrgh
Received-SPF: pass client-ip=178.33.251.8; envelope-from=groug@kaod.org;
 helo=13.mo4.mail-out.ovh.net
X-detected-operating-system: by eggs1p.gnu.org: First seen = 2020/04/20
 11:42:32
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Received-From: 178.33.251.8
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

On Tue, 31 Mar 2020 15:23:38 +0200
Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:

> The docs are ambiguous about the difference (or actually their
> equality) between options '-virtfs' vs. '-fsdev'. So clarify that
> '-virtfs' is actually just a convenience shortcut for its
> generalized form '-fsdev' in conjunction with '-device virtio-9p-pci'.
> 
> And as we're at it, also be a bit more descriptive what 9pfs is
> actually used for.
> 
> Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> ---

Applied to 9p-next.

>  qemu-options.hx | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 962a5ebaa6..fd3830c6cd 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -1542,9 +1542,17 @@ SRST
>  ``-virtfs proxy,sock_fd=sock_fd,mount_tag=mount_tag [,writeout=writeout][,readonly]``
>    \
>  ``-virtfs synth,mount_tag=mount_tag``
> -    Define a new filesystem device and expose it to the guest using a
> -    virtio-9p-device. The general form of a Virtual File system
> -    pass-through options are:
> +    Define a new virtual filesystem device and expose it to the guest using
> +    a virtio-9p-device (a.k.a. 9pfs), which essentially means that a certain
> +    directory on host is made directly accessible by guest as a pass-through
> +    file system by using the 9P network protocol for communication between
> +    host and guests, if desired even accessible, shared by several guests
> +    simultaniously.
> +
> +    Note that ``-virtfs`` is actually just a convenience shortcut for its
> +    generalized form ``-fsdev -device virtio-9p-pci``.
> +
> +    The general form of pass-through file system options are:
>  
>      ``local``
>          Accesses to the filesystem are done by QEMU.


