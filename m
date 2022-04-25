Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D400050DD69
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 12:00:01 +0200 (CEST)
Received: from localhost ([::1]:52706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nivVg-00019Q-Ux
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 06:00:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1niv4e-0007XE-M8
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 05:32:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40474)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1niv4b-0004as-6t
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 05:32:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650879119;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cqfbD7XCoLrKux4krFFpz9I3SnWhMlGCE7z799cEL10=;
 b=EPUH5hRz0xrflssmYjfc8nlEuoXdbOSjolwcbNCM3o8zhzJ4WcjxwBbSk9iWxvmWmcHG1a
 +euVFqbM3CG/bqSar6CcUk3Yzwwld1l9wdFAysxdBniNUneB59yMu/6XcHIBZOhE4Fyrk/
 WhwZsCNM11p+qIHE4g+Aru9TUfCAGRE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-214-AWbn2Iz5N2WtWetdlgJo8w-1; Mon, 25 Apr 2022 05:31:51 -0400
X-MC-Unique: AWbn2Iz5N2WtWetdlgJo8w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 463A085A5BE;
 Mon, 25 Apr 2022 09:31:51 +0000 (UTC)
Received: from localhost (unknown [10.39.192.194])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E780740CF910;
 Mon, 25 Apr 2022 09:31:50 +0000 (UTC)
Date: Mon, 25 Apr 2022 10:31:49 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jagannathan Raman <jag.raman@oracle.com>
Subject: Re: [PATCH v8 12/17] vfio-user: IOMMU support for remote device
Message-ID: <YmZqhRsiQk8SvI0n@stefanha-x1.localdomain>
References: <cover.1650379269.git.jag.raman@oracle.com>
 <2a42664b61cef7cdd44688679b60a8c6c397b075.1650379269.git.jag.raman@oracle.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="zLDtisO056a1ZQl1"
Content-Disposition: inline
In-Reply-To: <2a42664b61cef7cdd44688679b60a8c6c397b075.1650379269.git.jag.raman@oracle.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: eduardo@habkost.net, elena.ufimtseva@oracle.com, thuth@redhat.com,
 john.g.johnson@oracle.com, berrange@redhat.com, bleal@redhat.com,
 john.levon@nutanix.com, mst@redhat.com, armbru@redhat.com, quintela@redhat.com,
 f4bug@amsat.org, qemu-devel@nongnu.org, thanos.makatos@nutanix.com,
 kanth.ghatraju@oracle.com, marcandre.lureau@redhat.com, pbonzini@redhat.com,
 eblake@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--zLDtisO056a1ZQl1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 19, 2022 at 04:44:17PM -0400, Jagannathan Raman wrote:
> +static AddressSpace *remote_iommu_find_add_as(PCIBus *pci_bus,
> +                                              void *opaque, int devfn)
> +{
> +    RemoteIommu *iommu = opaque;
> +    RemoteIommuElem *elem = NULL;
> +
> +    qemu_mutex_lock(&iommu->lock);
> +
> +    elem = g_hash_table_lookup(iommu->elem_by_devfn, INT2VOIDP(devfn));
> +
> +    if (!elem) {
> +        elem = g_malloc0(sizeof(RemoteIommuElem));
> +        g_hash_table_insert(iommu->elem_by_devfn, INT2VOIDP(devfn), elem);
> +    }
> +
> +    if (!elem->mr) {
> +        elem->mr = MEMORY_REGION(object_new(TYPE_MEMORY_REGION));
> +        memory_region_set_size(elem->mr, UINT64_MAX);
> +        address_space_init(&elem->as, elem->mr, NULL);
> +    }
> +
> +    qemu_mutex_unlock(&iommu->lock);
> +
> +    return &elem->as;
> +}

A few comments that can be added to this file to explain the design:

- Each vfio-user server handles one PCIDevice on a PCIBus. There is one
  RemoteIommu per PCIBus, so the RemoteIommu tracks multiple PCIDevices
  by maintaining a ->elem_by_devfn mapping.

- memory_region_init_iommu() is not used because vfio-user MemoryRegions
  will be added to the elem->mr container instead. This is more natural
  than implementing the IOMMUMemoryRegionClass APIs since vfio-user
  provides something that is close to a full-fledged MemoryRegion and
  not like an IOMMU mapping.

- When a device is hot unplugged, the elem->mr reference is dropped so
  all vfio-user MemoryRegions associated with this vfio-user server are
  destroyed.

> +static void remote_iommu_finalize(Object *obj)
> +{
> +    RemoteIommu *iommu = REMOTE_IOMMU(obj);
> +
> +    qemu_mutex_destroy(&iommu->lock);
> +
> +    if (iommu->elem_by_devfn) {

->init() and ->finalize() are a pair, so I don't think ->finalize() will
ever be called with a NULL ->elem_by_devfn.

If ->elem_by_devfn can be NULL then there would probably need to be a
check around qemu_mutex_destroy(&iommu->lock) too.

> +        g_hash_table_destroy(iommu->elem_by_devfn);
> +        iommu->elem_by_devfn = NULL;
> +    }
> +}

--zLDtisO056a1ZQl1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmJmaoUACgkQnKSrs4Gr
c8idUgf/VhZpEcKJc0P5St5WXa9gcmCXqZVP6f5YYpwZ7MyO2lLYggh74U1Ax8L7
S+V/TYkb5vBYnyVBry+TP/VYWx+Z5WcY89kM5B7Saxu/mWK03VQkHLj9l1mru+Ut
fxOK1Ag31Noy42tBqI8dSX03GT24g5u9dTbq+Qa8Wj/MJXT1ihQWtrV/W23Lrq21
sasyTg/h1YLaT/ffPX86uvya5vTd7zDebHmBKQFSpd/HZo/QEDeGhIVyH5RSkqN2
PgOFMabfK0M80GMP9DpuLxCfLaV/EAny8Ddo4Su2A+1DUJjGQnV8Wz89ytFoSEbz
5PNGioUgDTAT8hHIcCuG8/C36PzLjQ==
=ipNM
-----END PGP SIGNATURE-----

--zLDtisO056a1ZQl1--


