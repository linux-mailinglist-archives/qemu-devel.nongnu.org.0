Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99D28477422
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 15:14:27 +0100 (CET)
Received: from localhost ([::1]:47922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxrWc-0000ZF-EP
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 09:14:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mxrTw-0005Wq-F2
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 09:11:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mxrTt-0005Zg-DO
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 09:11:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639663891;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ypApTWuQ2HooZ/DZNdmGvh+SvmaEih60+TvA+9ER1Io=;
 b=QEeJGgj9WxBKf06iCTnFqX+JALMvG2Qq0Dx5smrG6DidkSkj9Im85OVomCvAozjdboU0t7
 26Y2knTLpembXC1AojZlHo6LPNzF0LN8V2oblqRzMBDXNg8nbSHEVtpMXjvHHzJNUcrDCk
 TEELDUb4GoTMIGvTSk4i6z28wjDZx50=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-124-D_43sHmBPPKSiJPBtMQb-w-1; Thu, 16 Dec 2021 09:11:30 -0500
X-MC-Unique: D_43sHmBPPKSiJPBtMQb-w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B7DD892502;
 Thu, 16 Dec 2021 14:11:28 +0000 (UTC)
Received: from localhost (unknown [10.39.194.163])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8D81157CAA;
 Thu, 16 Dec 2021 14:10:51 +0000 (UTC)
Date: Thu, 16 Dec 2021 14:10:50 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jagannathan Raman <jag.raman@oracle.com>
Subject: Re: [PATCH v4 10/14] vfio-user: handle PCI BAR accesses
Message-ID: <YbtI6t3xdLaXFmJc@stefanha-x1.localdomain>
References: <cover.1639549843.git.jag.raman@oracle.com>
 <da25f11aa2c7f4aeb2eec3d6930e491051794ecf.1639549843.git.jag.raman@oracle.com>
MIME-Version: 1.0
In-Reply-To: <da25f11aa2c7f4aeb2eec3d6930e491051794ecf.1639549843.git.jag.raman@oracle.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="87j0agywOCbt0l6O"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

--87j0agywOCbt0l6O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Dec 15, 2021 at 10:35:34AM -0500, Jagannathan Raman wrote:
> +static ssize_t vfu_object_bar_rw(PCIDevice *pci_dev, hwaddr addr, size_t count,
> +                                 char * const buf, const bool is_write,
> +                                 bool is_io)
> +{
> +    AddressSpace *as = NULL;
> +    MemTxResult res;
> +
> +    if (is_io) {
> +        as = &address_space_io;
> +    } else {
> +        as = pci_device_iommu_address_space(pci_dev);

This access is not initiated by the device, it's coming from the CPU. It
shouldn't go through the IOMMU address space.

--87j0agywOCbt0l6O
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmG7SOoACgkQnKSrs4Gr
c8hJmgf9GPJjy1mE/ToRfP2YVJi+rSTM4z7hP9Bt9yae9AAXQULdejFlhtTaDr6k
5Tef/Pv75fHdyZmqQ7mL29PV+8Nyw+ruYIycKJiuCalsoGV5USQ2QSotb/DTbuoi
EJgyS/d9OTwiCU+jW6wlAypHGxNv184iQ9KCmPeUkVXyYjXu3BghLwQ6FTS8i8V1
s7e+J/vzG8gn8T+RHYhTFTmKjWjKT0fanyM/CMKhR5hM7EaV8U9w+dk8+vKOlt91
tMDp+LSh6Y0QWuDECuy5ofe5AJPmlTB+KKBW6NS1dsL2KTnoJr3XuyeLjF/vgNly
kWte691ZsAGOxgnUEY7ard/oqqxDTA==
=jcWf
-----END PGP SIGNATURE-----

--87j0agywOCbt0l6O--


