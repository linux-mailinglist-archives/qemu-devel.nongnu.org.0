Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79F7C4EADF8
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 14:55:57 +0200 (CEST)
Received: from localhost ([::1]:38064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZBO8-0002q9-JM
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 08:55:56 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nZBJN-00005P-R4
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 08:51:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33343)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nZBJM-0006D6-9Z
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 08:51:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648558259;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3lrrDN+RLqC1yS3zQkD+9uABP1XzZmEpR/XjooHrw24=;
 b=Ng8Xr8IL59kuyz8WUQptt3wz6AV2Sapq96Sc/yCUzo8OJfBTryu10o7OvJnd245r+w5O2s
 gsnSZlzavoEQf7ev5iusvtj74bcqU9/jOn9Fbmo1yADfVm5xMJmUuCYYpHuUFOGXcm89q+
 ar2Vwre6WiBOnf/piq2XShHk875WtDQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-407-sA0D8XQ-OmyzJETFyNx71g-1; Tue, 29 Mar 2022 08:50:56 -0400
X-MC-Unique: sA0D8XQ-OmyzJETFyNx71g-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2DB77811E78;
 Tue, 29 Mar 2022 12:50:55 +0000 (UTC)
Received: from localhost (unknown [10.39.195.109])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BC037401E9D;
 Tue, 29 Mar 2022 12:50:54 +0000 (UTC)
Date: Tue, 29 Mar 2022 13:50:53 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jagannathan Raman <jag.raman@oracle.com>
Subject: Re: [PATCH v7 14/17] vfio-user: handle PCI BAR accesses
Message-ID: <YkMArX56GKwOTsc0@stefanha-x1.localdomain>
References: <cover.1648234157.git.jag.raman@oracle.com>
 <1c2cc82cc72964216fb63270805fefb095f4d4a8.1648234157.git.jag.raman@oracle.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="L52AFC1+c8ReFX/J"
Content-Disposition: inline
In-Reply-To: <1c2cc82cc72964216fb63270805fefb095f4d4a8.1648234157.git.jag.raman@oracle.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: eduardo@habkost.net, elena.ufimtseva@oracle.com, john.g.johnson@oracle.com,
 berrange@redhat.com, bleal@redhat.com, john.levon@nutanix.com, mst@redhat.com,
 armbru@redhat.com, quintela@redhat.com, f4bug@amsat.org, qemu-devel@nongnu.org,
 alex.williamson@redhat.com, kanth.ghatraju@oracle.com,
 thanos.makatos@nutanix.com, pbonzini@redhat.com, eblake@redhat.com,
 dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--L52AFC1+c8ReFX/J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 25, 2022 at 03:19:43PM -0400, Jagannathan Raman wrote:
> @@ -324,6 +325,170 @@ static void dma_unregister(vfu_ctx_t *vfu_ctx, vfu_=
dma_info_t *info)
>      trace_vfu_dma_unregister((uint64_t)info->iova.iov_base);
>  }
> =20
> +static size_t vfu_object_bar_rw(PCIDevice *pci_dev, int pci_bar,
> +                                hwaddr offset, char * const buf,
> +                                hwaddr len, const bool is_write)
> +{
> +    uint8_t *ptr =3D (uint8_t *)buf;
> +    uint8_t *ram_ptr =3D NULL;
> +    bool release_lock =3D false;
> +    MemoryRegionSection section =3D { 0 };
> +    MemoryRegion *mr =3D NULL;
> +    int access_size;
> +    hwaddr size =3D 0;
> +    MemTxResult result;
> +    uint64_t val;
> +
> +    section =3D memory_region_find(pci_dev->io_regions[pci_bar].memory,
> +                                 offset, len);
> +
> +    if (!section.mr) {
> +        return 0;
> +    }
> +
> +    mr =3D section.mr;
> +    offset =3D section.offset_within_region;
> +
> +    if (is_write && mr->readonly) {
> +        warn_report("vfu: attempting to write to readonly region in "
> +                    "bar %d - [0x%"PRIx64" - 0x%"PRIx64"]",
> +                    pci_bar, offset, (offset + len));
> +        return 0;

A mr reference is leaked. The return statement can be replaced with goto
exit.

> +    }
> +
> +    if (memory_access_is_direct(mr, is_write)) {
> +        /**
> +         * Some devices expose a PCI expansion ROM, which could be buffer
> +         * based as compared to other regions which are primarily based =
on
> +         * MemoryRegionOps. memory_region_find() would already check
> +         * for buffer overflow, we don't need to repeat it here.
> +         */
> +        ram_ptr =3D memory_region_get_ram_ptr(mr);
> +
> +        size =3D len;

This looks like it will access beyond the end of ram_ptr when
section.size < len after memory_region_find() returns.

> +
> +        if (is_write) {
> +            memcpy((ram_ptr + offset), buf, size);
> +        } else {
> +            memcpy(buf, (ram_ptr + offset), size);
> +        }
> +
> +        goto exit;

What happens when the access spans two adjacent MemoryRegions? I think
the while (len > 0) loop is needed even in the memory_access_is_direct()
case so we perform the full access instead of truncating it.

> +    }
> +
> +    while (len > 0) {

--L52AFC1+c8ReFX/J
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmJDAK0ACgkQnKSrs4Gr
c8g8vwf9HZiuWB/TBoxUWba0YGzUABKfCWT8CFn5bjNsm2Rz1YEzPO1nm2TaXBv9
EH/ZeARljgEIseAnRyapyOk2a2LYDCiHF8tm5CBnCoKHJMDC4jWTZTi7eNeb2ztH
mpGHxSySYVMzLIbnjqDScXAMr31C7II/5CAc4GiTy2LKuXOZkJhqTIHHQ+PQlFPg
x/4gM6R5W8ZiUdHK8x43zXl5r/No7hrGgqNi5WFbHtKdU1urNsa76mpH81TbVjly
kZTE611pbMQ4C2CbrmoIWf6s6kwhtlSeZTjgtMjNppQvtqoc1Q/TOn6C9Ilbv/cS
LNVlKVfizM9tD3ivn9VlLgP/PRoU3g==
=qx9K
-----END PGP SIGNATURE-----

--L52AFC1+c8ReFX/J--


