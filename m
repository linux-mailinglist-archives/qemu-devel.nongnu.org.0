Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A2E1A4670
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Apr 2020 14:44:56 +0200 (CEST)
Received: from localhost ([::1]:33866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jMt1i-0002CP-VU
	for lists+qemu-devel@lfdr.de; Fri, 10 Apr 2020 08:44:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38963)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <raphael.norwitz@nutanix.com>) id 1jMsz4-0000rY-61
 for qemu-devel@nongnu.org; Fri, 10 Apr 2020 08:42:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <raphael.norwitz@nutanix.com>) id 1jMsz2-0007tx-64
 for qemu-devel@nongnu.org; Fri, 10 Apr 2020 08:42:09 -0400
Received: from [192.146.155.5] (port=16104 helo=mcp02.nutanix.com)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <raphael.norwitz@nutanix.com>) id 1jMsz2-0007tc-0H
 for qemu-devel@nongnu.org; Fri, 10 Apr 2020 08:42:08 -0400
Received: from localhost.localdomain (unknown [10.22.39.231])
 by mcp02.nutanix.com (Postfix) with ESMTP id D20E410061FB;
 Fri, 10 Apr 2020 12:42:05 +0000 (UTC)
Date: Thu, 9 Apr 2020 20:28:00 -0400
From: Raphael Norwitz <raphael.norwitz@nutanix.com>
To: mst@redhat.com, qemu-devel@nongnu.org
Subject: Re: [PATCH] MAINTAINERS: Add myself as vhost-user-blk maintainer
Message-ID: <20200410002800.GA7689@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
User-Agent: Mutt/1.5.21 (2010-09-15)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 192.146.155.5
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
Cc: raphael.s.norwitz@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ping

On Thu, Mar 26, 2020 at 04:47:35AM -0400, Raphael Norwitz wrote:
> As suggested by Michael, let's add me as a maintainer of
> vhost-user-blk and vhost-user-scsi.
>=20
> CC: Michael S. Tsirkin <mst@redhat.com>
> CC Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Raphael Norwitz <raphael.norwitz@nutanix.com>
> ---
>  MAINTAINERS | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e580276..239ecc1 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1845,6 +1845,18 @@ F: hw/display/virtio-gpu*
>  F: hw/display/virtio-vga.*
>  F: include/hw/virtio/virtio-gpu.h
> =20
> +vhost-user-blk
> +M: Raphael Norwitz <raphael.norwitz@nutanix.com>
> +S: Maintained
> +F: contrib/vhost-user-blk/
> +F: contrib/vhost-user-scsi/
> +F: hw/block/vhost-user-blk.c
> +F: hw/scsi/vhost-user-scsi.c
> +F: hw/virtio/vhost-user-blk-pci.c
> +F: hw/virtio/vhost-user-scsi-pci.c
> +F: include/hw/virtio/vhost-user-blk.h
> +F: include/hw/virtio/vhost-user-scsi.h
> +
>  vhost-user-gpu
>  M: Marc-Andr=E9 Lureau <marcandre.lureau@redhat.com>
>  M: Gerd Hoffmann <kraxel@redhat.com>
> --=20
> 1.8.3.1

