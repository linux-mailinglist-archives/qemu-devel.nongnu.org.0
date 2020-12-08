Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D31412D26D7
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 10:05:03 +0100 (CET)
Received: from localhost ([::1]:42062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmYve-0003rD-ET
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 04:05:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1kmYti-0003P7-Tg
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 04:03:02 -0500
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643]:46884)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1kmYtg-0000xZ-L7
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 04:03:02 -0500
Received: by mail-ej1-x643.google.com with SMTP id bo9so23471671ejb.13
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 01:02:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=heOnO8xtoXTUu7nkg7Tr0zoCny6XJ7I7y8VFkwKx3YI=;
 b=NAcUA4g6FpMBOE1Xlxt2Q1ElVyu7anh6kb/qyZlxlLM2F5boiqCY7XXrG73lLkjkTO
 G24s2g422BaJZe7uWJWbXmCoKCwFQGB7nP3ln4yb+t0aO74TxgVEvBrAK+i6Lg6p4ZRx
 4o+Nc01KscoeDYfhWOgT8Jke8eZgxT/e8fyJ9To8vxOA6OyyIKLwsBuznaAOAmwlcGmo
 1BePba9ADIsphBcP16NjyMjxqjyGLJLp4qwcAPlebCigeVxX5uR6f5HANjd0HIzTIgBH
 veF5YLY0e8cNXIPT+nO7CAqZ86TDl6IKWGH5eimx+JDkHCnAQWSJJQMO9G74fjFcjVhX
 t/GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=heOnO8xtoXTUu7nkg7Tr0zoCny6XJ7I7y8VFkwKx3YI=;
 b=ePz82UswA0eg61pCjdox9lzVocWoZMEqZ6JgjwpSZUfg3k0SKVQFnxNtTyTzjtsiew
 cXOhimz1rUIkjHKqxDQ4PfqG9JB2ufVWgfY/EkZQsP9ryW3NXCz6nMTokkt7Ba+BG1vB
 onN0OlXga5F0ompjVFNAcqrn4T4FgyvynJ4qYwyljq2fXQ0ocwV0/4A1UFE+53kUlB5I
 5qkWRXKT5ZenDs9KDOld9xcYuS1K1yTa2DHWNFjKAu74XV8TOGoHHm+8A94GAxc3wklg
 eFptUUYxt5uALXgGeTG60xtRpojyBypQ1UPkS8oZ1HJH+lbKhZa1sgZ0hU13vZ0PN5BW
 3vlQ==
X-Gm-Message-State: AOAM5303ywYyPO0jTji3n3Kcc6C7g4vH5lDru4RIfHJ0qnniStSLR4qs
 65+l+aBuwKNbEx/XUyWJyBM=
X-Google-Smtp-Source: ABdhPJwwqplxjiYTxGvk+CUu6nv9Om15+cCcDhpuWLQyJld3SKfxflSD8GOU2YNR5fW6/sN9mUvT0g==
X-Received: by 2002:a17:906:4d52:: with SMTP id
 b18mr21499156ejv.405.1607418174634; 
 Tue, 08 Dec 2020 01:02:54 -0800 (PST)
Received: from localhost ([51.15.41.238])
 by smtp.gmail.com with ESMTPSA id x16sm6694407ejb.38.2020.12.08.01.02.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 01:02:53 -0800 (PST)
Date: Tue, 8 Dec 2020 09:02:52 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>
Subject: Re: [RFC PATCH 24/27] vhost: iommu changes
Message-ID: <20201208090252.GW203660@stefanha-x1.localdomain>
References: <20201120185105.279030-1-eperezma@redhat.com>
 <20201120185105.279030-25-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="pEAjBjStGYT6H+Py"
Content-Disposition: inline
In-Reply-To: <20201120185105.279030-25-eperezma@redhat.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::643;
 envelope-from=stefanha@gmail.com; helo=mail-ej1-x643.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
 Daniel Daly <dandaly0@gmail.com>, virtualization@lists.linux-foundation.org,
 Liran Alon <liralon@gmail.com>, Eli Cohen <eli@mellanox.com>,
 Nitin Shrivastav <nitin.shrivastav@broadcom.com>,
 Alex Barba <alex.barba@broadcom.com>,
 Christophe Fontaine <cfontain@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Lee Ballard <ballle98@gmail.com>, Lars Ganrot <lars.ganrot@gmail.com>,
 Rob Miller <rob.miller@broadcom.com>, Stefano Garzarella <sgarzare@redhat.com>,
 Howard Cai <howard.cai@gmail.com>, Parav Pandit <parav@mellanox.com>,
 vm <vmireyno@marvell.com>, Salil Mehta <mehta.salil.lnk@gmail.com>,
 Stephen Finucane <stephenfin@redhat.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Sean Mooney <smooney@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Jim Harford <jim.harford@broadcom.com>,
 Dmytro Kazantsev <dmytro.kazantsev@gmail.com>, Siwei Liu <loseweigh@gmail.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Michael Lilja <ml@napatech.com>,
 Max Gurtovoy <maxgu14@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--pEAjBjStGYT6H+Py
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2020 at 07:51:02PM +0100, Eugenio P=E9rez wrote:
> diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
> index eebfac4455..cb44b9997f 100644
> --- a/hw/virtio/vhost.c
> +++ b/hw/virtio/vhost.c
> @@ -1109,6 +1109,10 @@ static int vhost_sw_live_migration_start(struct vh=
ost_dev *dev)
> =20
>      assert(dev->vhost_ops->vhost_set_vring_enable);
>      dev->vhost_ops->vhost_set_vring_enable(dev, false);
> +    if (vhost_dev_has_iommu(dev)) {
> +        r =3D vhost_backend_invalidate_device_iotlb(dev, 0, -1ULL);
> +        assert(r =3D=3D 0);
> +    }
> =20
>      for (idx =3D 0; idx < dev->nvqs; ++idx) {
>          struct vhost_virtqueue *vq =3D &dev->vqs[idx];
> @@ -1269,6 +1273,19 @@ int vhost_device_iotlb_miss(struct vhost_dev *dev,=
 uint64_t iova, int write)
> =20
>      trace_vhost_iotlb_miss(dev, 1);
> =20
> +    if (dev->sw_lm_enabled) {
> +        uaddr =3D iova;
> +        len =3D 4096;
> +        ret =3D vhost_backend_update_device_iotlb(dev, iova, uaddr, len,
> +                                                IOMMU_RW);

It would be nice to look up the available memory so
vhost_backend_update_device_iotlb() can be called with a much bigger
[uaddr, uaddr+len) range. This will reduce the number of iotlb misses.

Will vIOMMU be required for this feature? If not, then the vring needs
to be added to the vhost memory regions because vhost will not send QEMU
iotlb misses.

--pEAjBjStGYT6H+Py
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl/PQTwACgkQnKSrs4Gr
c8g3Ggf/ezALRa8CClAoD8oR71XoA1kVIcse2cg110kSgP3P6FQZ4K8P3eagY4KQ
MZOEBk/dhIcMAMUhqDGhKvCOgFzp4rxXGLJWWpVRqWXnyt+3pbt+qbRN1K6Mnw5m
yYr0IR/vdzG0tDl7Oy5n5igf8gbTiNAiO82jgonHy6KLiw8vhEqB/fdBVQOjorQn
4QbiOck2C58BSE+8G7iXFHCJWtoQd0O3zIgxDGsecDrDZYIP3RKcpd3EQfXUKDgc
8pESaRJsNfEfiM485waNw2fA9C4cV9tkWe9qup607f1Hgj6qw+1/Wboy+y4A86B2
0RfBLz7wh4oXLsoYnD1JLzTW2e3qXw==
=ebuW
-----END PGP SIGNATURE-----

--pEAjBjStGYT6H+Py--

