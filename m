Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EB89477355
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 14:40:22 +0100 (CET)
Received: from localhost ([::1]:33468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxqzc-0000NA-Vv
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 08:40:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mxqk4-0002Lv-9b
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 08:24:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48950)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mxqk2-0000XB-Gz
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 08:24:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639661053;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PVzp3hambPZar63yBmaVj+cWzS5Eahbj8lX0x2xvUUQ=;
 b=Nbh+4VpDKIVL+8D2t7ghb8WNeaWYeGa9NkCeRUcUa/VHMGRxMKwLH9Lnj+fR6g7LQQB8jh
 4G1mJVmmJY1gtY1iGBHVbNfPVqYtjdKBzVIwJYgQIH3pe8meX4vhgZYRWGJym1al93uInP
 fn2LvtNvt3jGL/cGvgwYCtLKCUSn/2g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-8-Pa7eTVX8PUOAvwaZm_Zc-A-1; Thu, 16 Dec 2021 08:24:09 -0500
X-MC-Unique: Pa7eTVX8PUOAvwaZm_Zc-A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 678D3835E2A;
 Thu, 16 Dec 2021 13:24:08 +0000 (UTC)
Received: from localhost (unknown [10.39.194.163])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EB84B5BE1D;
 Thu, 16 Dec 2021 13:24:07 +0000 (UTC)
Date: Thu, 16 Dec 2021 13:24:06 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jagannathan Raman <jag.raman@oracle.com>
Subject: Re: [PATCH v4 09/14] vfio-user: handle DMA mappings
Message-ID: <Ybs99rFUKFBIL/Md@stefanha-x1.localdomain>
References: <cover.1639549843.git.jag.raman@oracle.com>
 <2c9baf82a342cfc4ff3d35e017908b9050faf409.1639549843.git.jag.raman@oracle.com>
MIME-Version: 1.0
In-Reply-To: <2c9baf82a342cfc4ff3d35e017908b9050faf409.1639549843.git.jag.raman@oracle.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="wtb8MS6ShWHYZguB"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: elena.ufimtseva@oracle.com, john.g.johnson@oracle.com, thuth@redhat.com,
 bleal@redhat.com, swapnil.ingle@nutanix.com, john.levon@nutanix.com,
 philmd@redhat.com, qemu-devel@nongnu.org, wainersm@redhat.com,
 alex.williamson@redhat.com, thanos.makatos@nutanix.com,
 marcandre.lureau@gmail.com, crosa@redhat.com, pbonzini@redhat.com,
 alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--wtb8MS6ShWHYZguB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 15, 2021 at 10:35:33AM -0500, Jagannathan Raman wrote:
> Define and register callbacks to manage the RAM regions used for
> device DMA
>=20
> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  hw/remote/vfio-user-obj.c | 48 +++++++++++++++++++++++++++++++++++++++
>  hw/remote/trace-events    |  2 ++
>  2 files changed, 50 insertions(+)
>=20
> diff --git a/hw/remote/vfio-user-obj.c b/hw/remote/vfio-user-obj.c
> index c6d0c675b7..46f2251a68 100644
> --- a/hw/remote/vfio-user-obj.c
> +++ b/hw/remote/vfio-user-obj.c
> @@ -208,6 +208,47 @@ static ssize_t vfu_object_cfg_access(vfu_ctx_t *vfu_=
ctx, char * const buf,
>      return count;
>  }
> =20
> +static void dma_register(vfu_ctx_t *vfu_ctx, vfu_dma_info_t *info)
> +{
> +    MemoryRegion *subregion =3D NULL;
> +    g_autofree char *name =3D NULL;
> +    static unsigned int suffix;
> +    struct iovec *iov =3D &info->iova;
> +
> +    if (!info->vaddr) {
> +        return;
> +    }
> +
> +    name =3D g_strdup_printf("remote-mem-%u", suffix++);
> +
> +    subregion =3D g_new0(MemoryRegion, 1);
> +
> +    memory_region_init_ram_ptr(subregion, NULL, name,
> +                               iov->iov_len, info->vaddr);
> +
> +    memory_region_add_subregion(get_system_memory(), (hwaddr)iov->iov_ba=
se,
> +                                subregion);
> +
> +    trace_vfu_dma_register((uint64_t)iov->iov_base, iov->iov_len);
> +}
> +
> +static void dma_unregister(vfu_ctx_t *vfu_ctx, vfu_dma_info_t *info)
> +{
> +    MemoryRegion *mr =3D NULL;
> +    ram_addr_t offset;
> +
> +    mr =3D memory_region_from_host(info->vaddr, &offset);
> +    if (!mr) {
> +        return;
> +    }
> +
> +    memory_region_del_subregion(get_system_memory(), mr);
> +
> +    object_unparent((OBJECT(mr)));
> +
> +    trace_vfu_dma_unregister((uint64_t)info->iova.iov_base);
> +}

This does not support hot unplug (memory regions pointing to memory
mapped by libvfio-user are left registered). The code should keep a list
(e.g. https://docs.gtk.org/glib/struct.SList.html) of memory regions and
automatically remove them before destroying the vfu context.

It also doesn't support multiple vfio-user server instances running in
the same QEMU process. get_system_memory() is global but the memory
regions provided by vfio-user are per-client (i.e. VM). If multiple VMs
are connected to one vfio-user server process then they conflict.

I don't know the best way to support multiple vfio-user server
instances, it would be straightforward if QEMU supported multiple
MachineStates and didn't use global get_system_memory()/get_io_memory()
APIs. It would be nice to solve that in the future.

Maybe it's too hard to change that, I haven't looked. An alternative is
to make the x-remote machine empty (it doesn't create any devices) and
instead create a new PCI bus, interrupt controller, memory MemoryRegion,
and io MemoryRegion in VfuObject. Stop using get_system_memory() and
instead use the per-VfuObject memory MemoryRegion.

In either of those approaches it's probably necessary to specify the PCI
bus ID in --device and device_add so it's clear which vfio-user server
the PCI device is associated with.

The multiple vfio-user server instance limitation doesn't need to be
solved now, but I wanted to share some ideas around it. Maybe someone
has better ideas or is aware of limitations preventing what I described.

Stefan

--wtb8MS6ShWHYZguB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmG7PfYACgkQnKSrs4Gr
c8i7OQgApfW67UxQ9+qFWqG0+iZgXBcMU5Pil4Rc8RJfFoopslL4ne0O5ZV69nuK
Gp3/uTH6ce5SGbq2ivdl/qb6vF1SaqVairPzx+cFD1WQk35n2ON8oz7Cm8WD69fK
VyuwPhv4OBM6Lo5hN/nFVKu0dLU7aeb2Q1AZSyG7u3tYD/3RY2sMzXZ5Q5WcB4Ot
iRcEWepMJJNN++8OhvPjgloX8LMR/vZS4Ju5o3t40+yPtrNAe7qw1oigk3R6LErh
v1AF9UlNizalux9hMXopiasoLT5jS9uK1tBpvoQ55tbfuK2gicnPBWClHDCBgF2v
8qrB2W+pdHJT6LDXwa0Ro06NrAyxxw==
=c1Ay
-----END PGP SIGNATURE-----

--wtb8MS6ShWHYZguB--


