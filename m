Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78CEF14505A
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jan 2020 10:46:23 +0100 (CET)
Received: from localhost ([::1]:39158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iuCac-0002dd-Hn
	for lists+qemu-devel@lfdr.de; Wed, 22 Jan 2020 04:46:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53800)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1iuCZj-0002C9-ET
 for qemu-devel@nongnu.org; Wed, 22 Jan 2020 04:45:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1iuCZi-0001aP-DM
 for qemu-devel@nongnu.org; Wed, 22 Jan 2020 04:45:27 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:58670
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1iuCZi-0001a6-9X
 for qemu-devel@nongnu.org; Wed, 22 Jan 2020 04:45:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579686326;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JkoPrv/80DGtgyjUZ4wjgvC18MNhcEZ8m94M6I70ZmA=;
 b=Ayk4GYkblsVcnM+4WpS/brtxBrtkG2JzjwsxM4qqiygmTQVVS8/w3CZAhoaGP+PaNXiuL7
 C6NLmjDUQR352+9mrq4/duw8AUOKN9F7nRM9QjkicV5BhUymP1S6f+khnIWnVV5F8jejdm
 NckNNoz4vOYr9/wJrlEqXJJMT0BHcJw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-159-CKWbhBA8NZOoVyHWx45SZA-1; Wed, 22 Jan 2020 04:45:24 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3243F477
 for <qemu-devel@nongnu.org>; Wed, 22 Jan 2020 09:45:23 +0000 (UTC)
Received: from work-vm (unknown [10.36.118.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7EB6660CD3;
 Wed, 22 Jan 2020 09:45:20 +0000 (UTC)
Date: Wed, 22 Jan 2020 09:45:17 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH] vhost: coding style fix
Message-ID: <20200122094517.GB3263@work-vm>
References: <20200122080840.592054-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200122080840.592054-1-mst@redhat.com>
User-Agent: Mutt/1.13.0 (2019-11-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: CKWbhBA8NZOoVyHWx45SZA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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

* Michael S. Tsirkin (mst@redhat.com) wrote:
> Drop a trailing whitespace. Make line shorter.
>=20
> Fixes: 76525114736e8 ("vhost: Only align sections for vhost-user")
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

Oops apologies for that.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  hw/virtio/vhost.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
> index 25fd469179..9edfadc81d 100644
> --- a/hw/virtio/vhost.c
> +++ b/hw/virtio/vhost.c
> @@ -551,7 +551,7 @@ static void vhost_region_add_section(struct vhost_dev=
 *dev,
>      trace_vhost_region_add_section(section->mr->name, mrs_gpa, mrs_size,
>                                     mrs_host);
> =20
> -    if (dev->vhost_ops->backend_type =3D=3D VHOST_BACKEND_TYPE_USER) {  =
=20
> +    if (dev->vhost_ops->backend_type =3D=3D VHOST_BACKEND_TYPE_USER) {
>          /* Round the section to it's page size */
>          /* First align the start down to a page boundary */
>          size_t mrs_page =3D qemu_ram_pagesize(mrs_rb);
> @@ -566,8 +566,8 @@ static void vhost_region_add_section(struct vhost_dev=
 *dev,
>          if (alignage) {
>              mrs_size +=3D mrs_page - alignage;
>          }
> -        trace_vhost_region_add_section_aligned(section->mr->name, mrs_gp=
a, mrs_size,
> -                                               mrs_host);
> +        trace_vhost_region_add_section_aligned(section->mr->name, mrs_gp=
a,
> +                                               mrs_size, mrs_host);
>      }
> =20
>      if (dev->n_tmp_sections) {
> --=20
> MST
>=20
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


