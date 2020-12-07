Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A023D2D16B6
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 17:46:33 +0100 (CET)
Received: from localhost ([::1]:48312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmJeh-000464-Kw
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 11:46:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1kmJbn-0002yU-RM
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 11:43:31 -0500
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642]:34569)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1kmJbj-0000Jz-Jj
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 11:43:30 -0500
Received: by mail-ej1-x642.google.com with SMTP id g20so20457677ejb.1
 for <qemu-devel@nongnu.org>; Mon, 07 Dec 2020 08:43:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=trwWkN08RC97k3KH48B9gNQriEKWSyCbtbzCxwfGmWE=;
 b=B1EfYNbMVMFOaHv5Q1+MqxN4scHz/Hv2fxp5bGgVC+k0ctBrJNkDB5ON3sGBLmaQW5
 blaRzeSuWIpqS+bVQsZMBPxJI8qZqkB3vAkb7ZKE/z1Y2OwARk5Rn2HNXDzI7jOlrvf4
 RNSG3KDnMlyl33wXV01uXcO2Fn3qrf6AB/zxTIeRuxVzkPpRx14EgA0CNunoi2Bl4rGC
 5qAN0mMe6htUVLfW/sP/mFXpYntXPXC2gICjdEpOUEJvh+hE+akT2xtD0KWG30J3Gniq
 Dg6xvPp/SY/g5caQK0EmruRZ2vgxERtmT1abew+RC1FKJZNx/gw5mhLQw18Yzijrqefe
 e8iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=trwWkN08RC97k3KH48B9gNQriEKWSyCbtbzCxwfGmWE=;
 b=AEql4nh8zigFaWi/J3hkQlj1KVaLYD9Pd4mrbykEBxleXD7ptXWJJrTvF8mvPuuB/c
 Dmo1gAl/qedZchW9d6B6pYFuMDUQSABBgo/WjLyBO8plIdHtGTNVWX9CFa5oVJdnKd6M
 AZi0m/dEfW+4qx4GNz5euc0bHqwHBPvhQmgJ2873qayqGjLed5JLjNMGjIYjZbdAk2Pv
 Yj8Eu5mfpHtieR3Sh0xtAbAup266jYS2l9s0j+TFKX350n6+/19qMm8qgAtpl7AlR/e5
 RdwEYSSkoin1BToK7gmvt6x7u1S05QbGHpv2GBCIyIX+oWGxOcU4jTLKQ6kPG14aT3lF
 mzeg==
X-Gm-Message-State: AOAM533cwumGCefxESCde+tdhRhTmjS21JyYfX1xc70XFCoF4BgGELv/
 ow0KxfkqCyZJEoSE2wVohwc=
X-Google-Smtp-Source: ABdhPJwY9MeoSxGwRPyIJV5M0g2NpLCkzQk4QntsuJ7EEGm36J5EQc7Tf8qRkCsQBxMYB/d2Z8WFeA==
X-Received: by 2002:a17:906:ae41:: with SMTP id
 lf1mr20055824ejb.369.1607359405393; 
 Mon, 07 Dec 2020 08:43:25 -0800 (PST)
Received: from localhost ([51.15.41.238])
 by smtp.gmail.com with ESMTPSA id w20sm14259249edi.12.2020.12.07.08.43.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Dec 2020 08:43:24 -0800 (PST)
Date: Mon, 7 Dec 2020 16:43:23 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>
Subject: Re: [RFC PATCH 04/27] vhost: add vhost_kernel_set_vring_enable
Message-ID: <20201207164323.GK203660@stefanha-x1.localdomain>
References: <20201120185105.279030-1-eperezma@redhat.com>
 <20201120185105.279030-5-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ogUXNSQj4OI1q3LQ"
Content-Disposition: inline
In-Reply-To: <20201120185105.279030-5-eperezma@redhat.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::642;
 envelope-from=stefanha@gmail.com; helo=mail-ej1-x642.google.com
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


--ogUXNSQj4OI1q3LQ
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2020 at 07:50:42PM +0100, Eugenio P=E9rez wrote:
> Signed-off-by: Eugenio P=E9rez <eperezma@redhat.com>
> ---
>  hw/virtio/vhost-backend.c | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>=20
> diff --git a/hw/virtio/vhost-backend.c b/hw/virtio/vhost-backend.c
> index 222bbcc62d..317f1f96fa 100644
> --- a/hw/virtio/vhost-backend.c
> +++ b/hw/virtio/vhost-backend.c
> @@ -201,6 +201,34 @@ static int vhost_kernel_get_vq_index(struct vhost_de=
v *dev, int idx)
>      return idx - dev->vq_index;
>  }
> =20
> +static int vhost_kernel_set_vq_enable(struct vhost_dev *dev, unsigned id=
x,
> +                                      bool enable)
> +{
> +    struct vhost_vring_file file =3D {
> +        .index =3D idx,
> +    };
> +
> +    if (!enable) {
> +        file.fd =3D -1; /* Pass -1 to unbind from file. */
> +    } else {
> +        struct vhost_net *vn_dev =3D container_of(dev, struct vhost_net,=
 dev);
> +        file.fd =3D vn_dev->backend;
> +    }
> +
> +    return vhost_kernel_net_set_backend(dev, &file);

This is vhost-net specific even though the function appears to be
generic. Is there a plan to extend this to all devices?

> +}
> +
> +static int vhost_kernel_set_vring_enable(struct vhost_dev *dev, int enab=
le)
> +{
> +    int i;
> +
> +    for (i =3D 0; i < dev->nvqs; ++i) {
> +        vhost_kernel_set_vq_enable(dev, i, enable);
> +    }
> +
> +    return 0;
> +}

I suggest exposing the per-vq interface (vhost_kernel_set_vq_enable())
in VhostOps so it follows the ioctl interface.
vhost_kernel_set_vring_enable() can be moved to vhost.c can loop over
all vqs if callers find it convenient to loop over all vqs.

--ogUXNSQj4OI1q3LQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl/OW6sACgkQnKSrs4Gr
c8jcDwgAvhR1DPn/758yBurYSAd5bodrjz48KqGTFPhHnHIzAsDSztsiZ/VKnhlt
lkf8slJQyaaQ5G9Po4HX6CNdMSNmkBT1mz0lk6dnr75aHQ/hijqknpXM1og/4MRQ
lCUyXQhHsLGZ3ETT8Is/Bgg99b3T0SykRSzhlpzIMaPqGgzvzTNdh1u0SFKi3W3o
Vke/ZS/yZ2K0F+sNwQzPGp5JflOTagn1QuGO8JslZinLNh8y3C05n/6ZCWbM9Jl9
ABaBPHhenGFmH672WMK839qEawHgEUS6aziPnVfPczqudEqinJpHT9Oc6xMeBG1D
mv3UoTm7iaY08guxGcO5yO6FILXe/g==
=IdPX
-----END PGP SIGNATURE-----

--ogUXNSQj4OI1q3LQ--

