Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C862D16CE
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 17:54:38 +0100 (CET)
Received: from localhost ([::1]:36100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmJmX-0002eB-2x
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 11:54:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1kmJkL-0001fc-Sn
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 11:52:21 -0500
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643]:32790)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1kmJkK-0001lV-6Q
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 11:52:21 -0500
Received: by mail-ej1-x643.google.com with SMTP id b9so10126421ejy.0
 for <qemu-devel@nongnu.org>; Mon, 07 Dec 2020 08:52:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=OTQRBjUe2TNjYMgJefl7n0HpBavaiUEtwmxJsr1/2t4=;
 b=erKmXltJIFGXdOQcph/EmLbnMRY6RChItOwpRyiu8mFYM+wjLN9CHS8NfD8l6oT6qJ
 1f/szmE8g+MJAyGMfg78p8iPicMlWeScTuFEWULsmGKKsuAlilIgx6fw334H1Q6/1R2r
 qFRDGMSE6bgWNv5M5iOHiqZOmFzj+zS2s/4VInI1sJuZOADPtUs8x7MlwhR1+oGPruEG
 ydJKuWQ1H76nsoemtOULbMSmbVQAUW1rsuwvKPl4VoUrKRtyPt1353Tsr2CsusdN1oij
 t/UNHMJUgc6F8336mbycNpSenKA4XbUZoHoG4eaWiwmHcftSFe8ZoQZgiCadTLdwYC3w
 L1AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=OTQRBjUe2TNjYMgJefl7n0HpBavaiUEtwmxJsr1/2t4=;
 b=bjQX+gjDlb/oOnv13eMWeHzgRONovkvdk9KFHyx9IcwS2/wtsJ5nkP9H7BOGXtsrRj
 pzYhh5uWY+GKj7wfEQ1FO7Q0GrJvLSdL+X8eh6lVspNXZnoDMkpQ8Gv5HeAeY3XwTwtf
 tFCkKhnWYIpPOT3lxlCwJJPhPwD0y0dX4Fe6fTeAFeDK1P/FoZDd3rzkqqtTlg95z9FB
 oT4+qalrFLrmJBrczNJ28FVysyoD9eB5fLx1Irxt4ufDYddYVOkpgd72Gu1w+L/WjpDb
 DrNKwu4GBn5Kxx6BCnnNMY3qpss2/1KDkUEuKrLlg7ggQAepOGqFzxivBrNz6dNC8t8d
 S4tw==
X-Gm-Message-State: AOAM532jD7IDtti3M6P4FAcAhZh/Gw6uyjPQmRmY/Z3FDTI4FPaa4ty9
 2XMh61238jaxCqKof56SbZc=
X-Google-Smtp-Source: ABdhPJycsLY1gSAtaotTfUaJl7iKx3GhozpQNix9ydMBC5YVDHoyAJwcCg7JB0Eipy1M7eJ+9OyCCg==
X-Received: by 2002:a17:907:28d4:: with SMTP id
 en20mr19944431ejc.196.1607359938454; 
 Mon, 07 Dec 2020 08:52:18 -0800 (PST)
Received: from localhost ([51.15.41.238])
 by smtp.gmail.com with ESMTPSA id q4sm10641523ejc.78.2020.12.07.08.52.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Dec 2020 08:52:17 -0800 (PST)
Date: Mon, 7 Dec 2020 16:52:16 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>
Subject: Re: [RFC PATCH 05/27] vhost: Add hdev->dev.sw_lm_vq_handler
Message-ID: <20201207165216.GL203660@stefanha-x1.localdomain>
References: <20201120185105.279030-1-eperezma@redhat.com>
 <20201120185105.279030-6-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="VBq/nvTu32OVLBUP"
Content-Disposition: inline
In-Reply-To: <20201120185105.279030-6-eperezma@redhat.com>
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


--VBq/nvTu32OVLBUP
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2020 at 07:50:43PM +0100, Eugenio P=E9rez wrote:
> Only virtio-net honors it.
>=20
> Signed-off-by: Eugenio P=E9rez <eperezma@redhat.com>
> ---
>  include/hw/virtio/vhost.h |  1 +
>  hw/net/virtio-net.c       | 39 ++++++++++++++++++++++++++++-----------
>  2 files changed, 29 insertions(+), 11 deletions(-)
>=20
> diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
> index 4a8bc75415..b5b7496537 100644
> --- a/include/hw/virtio/vhost.h
> +++ b/include/hw/virtio/vhost.h
> @@ -83,6 +83,7 @@ struct vhost_dev {
>      bool started;
>      bool log_enabled;
>      uint64_t log_size;
> +    VirtIOHandleOutput sw_lm_vq_handler;

sw =3D=3D software?
lm =3D=3D live migration?

Maybe there is a name that is clearer. What are these virtqueues called?
Shadow vqs? Logged vqs?

Live migration is a feature that uses dirty memory logging, but other
features may use dirty memory logging too. The name should probably not
be associated with live migration.

>      Error *migration_blocker;
>      const VhostOps *vhost_ops;
>      void *opaque;
> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> index 9179013ac4..9a69ae3598 100644
> --- a/hw/net/virtio-net.c
> +++ b/hw/net/virtio-net.c
> @@ -2628,24 +2628,32 @@ static void virtio_net_tx_bh(void *opaque)
>      }
>  }
> =20
> -static void virtio_net_add_queue(VirtIONet *n, int index)
> +static void virtio_net_add_queue(VirtIONet *n, int index,
> +                                 VirtIOHandleOutput custom_handler)
>  {

We talked about the possibility of moving this into the generic vhost
code so that devices don't need to be modified. It would be nice to hide
this feature inside vhost.

--VBq/nvTu32OVLBUP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl/OXb8ACgkQnKSrs4Gr
c8h0zgf/Y8KuZmHAiJe/VBJicMVsGgLkqfkqKp7+bL8u8nU75Wm24ECd47sAbvWK
q/BQs7t9VxQ0KBH8DJBGviwxG4bfoAtzXpSKgHRgbvd0AWHqJqfbEcKP+yZ0mKwB
uSAsQqNU/K9DxvNiJSzzklUvKmvKPrWXwgWsP2jRKOTAxn2nvNrCO+X9sAveTmEk
ZMfFOsHVNVxc4nJIwRsySTnpUz4ADJvzrhGk8cvjIIg/9Gq28EsYiMLWhtQymrj6
iEIZnfg5REWv/w3KzvwqVBaBqVF/QkFk0w8naAuT+KHbr+fKZLtMVC6ebY44vqZN
+iQr7fQg3dfy8ba7WFxyYHnVGmZMEQ==
=GegK
-----END PGP SIGNATURE-----

--VBq/nvTu32OVLBUP--

