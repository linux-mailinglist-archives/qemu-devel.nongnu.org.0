Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70E404BF65D
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 11:44:11 +0100 (CET)
Received: from localhost ([::1]:48238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMSeP-0003l8-UM
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 05:44:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nMSb2-00020F-Eu
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 05:40:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49733)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nMSay-0008Ad-4T
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 05:40:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645526434;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hqEyOCwI1FCqIKT916GkmsZA/309P6FPS8E6BybcFd4=;
 b=HUJDSwmBx+uHlaEOFUYRQcdOafKdtTKDLl1F8LG4ubxb+8W7yep+0P+GksS6MjCThxk+Wj
 c+gd23FCOYObbbis35Oe5DsYkKseIYIxjecpvCmKXDSBuEPSWIlC1lK7fH1womxZ4fp0oy
 iq9Cbw/+9QGv0IEexjgCuuSF0BTGsuA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-457-6pAIS0IvOpeUnBN47_MfpA-1; Tue, 22 Feb 2022 05:40:30 -0500
X-MC-Unique: 6pAIS0IvOpeUnBN47_MfpA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D9211801AB2;
 Tue, 22 Feb 2022 10:40:28 +0000 (UTC)
Received: from localhost (unknown [10.39.195.202])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2EA447A431;
 Tue, 22 Feb 2022 10:40:03 +0000 (UTC)
Date: Tue, 22 Feb 2022 10:40:02 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jagannathan Raman <jag.raman@oracle.com>
Subject: Re: [PATCH v6 12/19] vfio-user: IOMMU support for remote device
Message-ID: <YhS9gvErGeGVPcwk@stefanha-x1.localdomain>
References: <cover.1645079934.git.jag.raman@oracle.com>
 <f6dc62f6957a6ae2d289a5810d48c717eefff861.1645079934.git.jag.raman@oracle.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="0el0T+TWUExaPEQC"
Content-Disposition: inline
In-Reply-To: <f6dc62f6957a6ae2d289a5810d48c717eefff861.1645079934.git.jag.raman@oracle.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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


--0el0T+TWUExaPEQC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 17, 2022 at 02:48:59AM -0500, Jagannathan Raman wrote:
> +struct RemoteIommuElem {
> +    AddressSpace  as;
> +    MemoryRegion  mr;
> +};
> +
> +GHashTable *remote_iommu_elem_by_bdf;

A mutable global hash table requires synchronization when device
emulation runs in multiple threads.

I suggest using pci_setup_iommu()'s iommu_opaque argument to avoid the
global. If there is only 1 device per remote PCI bus, then there are no
further synchronization concerns.

> +
> +#define INT2VOIDP(i) (void *)(uintptr_t)(i)
> +
> +static AddressSpace *remote_iommu_find_add_as(PCIBus *pci_bus,
> +                                              void *opaque, int devfn)
> +{
> +    struct RemoteIommuElem *elem = NULL;
> +    int pci_bdf = PCI_BUILD_BDF(pci_bus_num(pci_bus), devfn);
> +
> +    if (!remote_iommu_elem_by_bdf) {
> +        return &address_space_memory;
> +    }

When can this happen? remote_configure_iommu() allocates
remote_iommu_elem_by_bdf so it should always be non-NULL.

--0el0T+TWUExaPEQC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmIUvYIACgkQnKSrs4Gr
c8gtKQf8D6bQNx8qrs5+QZKOmz9/JlUqOFnm8ityu6+zQeeTYUUayHkwcBVo0dHr
kM46tmqKMRK0fgYh1+XfvAnBwpb+wgxZeBKV+91i9a+M55ZL0ZBwkERz44JDKGwp
8jfIuawX+wSbDXb0h3+psXehsT03GG8rBmp8xZFnoWyMA1QSq/6J/zfcZH0sd5d2
wKsCJe5/FlMPWJo0R1TKSphiH4PpmIz5FU60pDxG3xLIiGV4Ys4hGsHCXr7oadws
NbzuU6bWX5wmFxvZU3T2visz23/0XqMlvlF/0HTv3XX2IPxv3jop9r/JEMCKTSGk
k75KX4SozeZgvGPvcEEbtMnYOJ4/2Q==
=cgb8
-----END PGP SIGNATURE-----

--0el0T+TWUExaPEQC--


