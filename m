Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE747485058
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 10:51:31 +0100 (CET)
Received: from localhost ([::1]:38454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n52x8-0005ui-U4
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 04:51:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1n52ur-0004eA-H4
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 04:49:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45536)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1n52uo-000300-DY
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 04:49:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641376144;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Kb2Af7+ZmaC3F9gLVftuM8Jw7UDHteSljiPjn3+5wg8=;
 b=RCJO33bYexTz45R2n2ttOefAie4Y+WQEviQ9eBMBIOR2CzOKuK1R5ezcs5T07VupcdnkKu
 dGsJknaFHTOAZZaJRXSK75KxnwjA5kQ+YgH35TJ6nWzLdaNspxY1gSZwTSAtFp1E6oy29a
 yxvp8Nork2enL4nCnyzlAEDt3pvirHs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-552-5fdpoQ9LMI6uGuvSHTEsEg-1; Wed, 05 Jan 2022 04:49:01 -0500
X-MC-Unique: 5fdpoQ9LMI6uGuvSHTEsEg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 45656190B2A0;
 Wed,  5 Jan 2022 09:49:00 +0000 (UTC)
Received: from localhost (unknown [10.39.194.143])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B5CFB1059146;
 Wed,  5 Jan 2022 09:48:50 +0000 (UTC)
Date: Wed, 5 Jan 2022 09:48:49 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: "Longpeng(Mike)" <longpeng2@huawei.com>
Subject: Re: [RFC 03/10] vdpa: add the infrastructure of vdpa-dev
Message-ID: <YdVpgaq/mFEZQpT7@stefanha-x1.localdomain>
References: <20220105005900.860-1-longpeng2@huawei.com>
 <20220105005900.860-4-longpeng2@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20220105005900.860-4-longpeng2@huawei.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="qxW7WiH2pDAOI0jd"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: mst@redhat.com, jasowang@redhat.com, cohuck@redhat.com,
 qemu-devel@nongnu.org, yechuan@huawei.com, arei.gonglei@huawei.com,
 huangzhichao@huawei.com, pbonzini@redhat.com, sgarzare@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--qxW7WiH2pDAOI0jd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jan 05, 2022 at 08:58:53AM +0800, Longpeng(Mike) wrote:
> +static const VirtioPCIDeviceTypeInfo vhost_vdpa_device_pci_info = {
> +    .base_name               = TYPE_VHOST_VDPA_DEVICE_PCI,
> +    .generic_name            = "vhost-vdpa-device-pci",
> +    .transitional_name       = "vhost-vdpa-device-pci-transitional",
> +    .non_transitional_name   = "vhost-vdpa-device-pci-non-transitional",

Does vDPA support Transitional VIRTIO devices?

I expected this device to support Modern devices only.

Stefan

--qxW7WiH2pDAOI0jd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmHVaYAACgkQnKSrs4Gr
c8hT8QgAiATW5wqOD0JsFE2q6w/Stn6xeCBqf1O/wHDFK1slaRcaL3qg62OEcvjG
QRGKr6V5Nr33Jw/JJ3GZxejSgtRDOv5KqcIt8oEgEIPySg+aPzKPqvLSXth+1Vig
RiX/+9ZC3/idNUKuON+0vQi+gwUoSidodcVZlzi9wNuLQe6rwC7QxiDiEwy4BH3D
PRe9ChdMSrQ4XXSQlQ7THeAzDzWTYqrGWPkU6Q1pKVUHEPMEBsNNHBqlfX7NzLqQ
DJWofBiAqV8xmfyrxzbLRAeYRt318tRmOQ7VpfGJBkoFrLHzrvEL0ggNtgErM95A
+JQsghs38us6TD6b+ai74vv8WEO/uw==
=AwXt
-----END PGP SIGNATURE-----

--qxW7WiH2pDAOI0jd--


