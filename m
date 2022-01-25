Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77E6149B1CB
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 11:43:07 +0100 (CET)
Received: from localhost ([::1]:46162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCJI2-0005d4-H3
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 05:43:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nCJ8W-0005PM-5w
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 05:33:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51693)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nCJ8U-0006NB-J1
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 05:33:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643106794;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vf6isb1+bE1bcYq1vmTNgvFCfzeeOZBSLO1mr3b8fmg=;
 b=eUP8jzU2zNaq01zCqaiyTMZZB6ohEy/zAe07QtWMEGPTdvQU9li87IO8NooAtUp7OnBlxl
 xMB2AJLbgoSKmWxwOTn6N9C/NQzF7Tye4sQ04J28oocIi0LgiwXAV2Ahc5j/KaVEnOWFES
 JRkkIqePc506lJdcH5JSI3/085bNGgo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-102-RWTvSIn2MpKJwEywRaLIlQ-1; Tue, 25 Jan 2022 05:33:09 -0500
X-MC-Unique: RWTvSIn2MpKJwEywRaLIlQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 68A158143EB;
 Tue, 25 Jan 2022 10:33:07 +0000 (UTC)
Received: from localhost (unknown [10.39.195.26])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 53D05105B1EC;
 Tue, 25 Jan 2022 10:32:48 +0000 (UTC)
Date: Tue, 25 Jan 2022 10:32:47 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jagannathan Raman <jag.raman@oracle.com>
Subject: Re: [PATCH v5 06/18] vfio-user: add HotplugHandler for remote machine
Message-ID: <Ye/Rz1bHJN2m9vCo@stefanha-x1.localdomain>
References: <cover.1642626515.git.jag.raman@oracle.com>
 <fa3282607f7fed7736bfdf3c1ae9f7fce466ed44.1642626515.git.jag.raman@oracle.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="12H2Kopd/iMiiVUM"
Content-Disposition: inline
In-Reply-To: <fa3282607f7fed7736bfdf3c1ae9f7fce466ed44.1642626515.git.jag.raman@oracle.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.158,
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
Cc: eduardo@habkost.net, elena.ufimtseva@oracle.com, john.g.johnson@oracle.com,
 berrange@redhat.com, bleal@redhat.com, john.levon@nutanix.com, mst@redhat.com,
 armbru@redhat.com, quintela@redhat.com, qemu-devel@nongnu.org, f4bug@amsat.org,
 marcandre.lureau@gmail.com, thanos.makatos@nutanix.com, pbonzini@redhat.com,
 eblake@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--12H2Kopd/iMiiVUM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 19, 2022 at 04:41:55PM -0500, Jagannathan Raman wrote:
> Allow hotplugging of PCI(e) devices to remote machine
>=20
> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> ---
>  hw/remote/machine.c | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)

Why is this code necessary? I expected the default hotplug behavior to
pretty much handle this case - hotplugging device types that the bus
doesn't support should fail and unplug should already unparent/unrealize
the device.

>=20
> diff --git a/hw/remote/machine.c b/hw/remote/machine.c
> index 952105eab5..220ff01aa9 100644
> --- a/hw/remote/machine.c
> +++ b/hw/remote/machine.c
> @@ -54,14 +54,39 @@ static void remote_machine_init(MachineState *machine)
> =20
>      pci_bus_irqs(pci_host->bus, remote_iohub_set_irq, remote_iohub_map_i=
rq,
>                   &s->iohub, REMOTE_IOHUB_NB_PIRQS);
> +
> +    qbus_set_hotplug_handler(BUS(pci_host->bus), OBJECT(s));
> +}
> +
> +static void remote_machine_pre_plug_cb(HotplugHandler *hotplug_dev,
> +                                       DeviceState *dev, Error **errp)
> +{
> +    if (!object_dynamic_cast(OBJECT(dev), TYPE_PCI_DEVICE)) {
> +        error_setg(errp, "Only allowing PCI hotplug");
> +    }
> +}
> +
> +static void remote_machine_unplug_cb(HotplugHandler *hotplug_dev,
> +                                     DeviceState *dev, Error **errp)
> +{
> +    if (!object_dynamic_cast(OBJECT(dev), TYPE_PCI_DEVICE)) {
> +        error_setg(errp, "Only allowing PCI hot-unplug");
> +        return;
> +    }
> +
> +    qdev_unrealize(dev);
>  }
> =20
>  static void remote_machine_class_init(ObjectClass *oc, void *data)
>  {
>      MachineClass *mc =3D MACHINE_CLASS(oc);
> +    HotplugHandlerClass *hc =3D HOTPLUG_HANDLER_CLASS(oc);
> =20
>      mc->init =3D remote_machine_init;
>      mc->desc =3D "Experimental remote machine";
> +
> +    hc->pre_plug =3D remote_machine_pre_plug_cb;
> +    hc->unplug =3D remote_machine_unplug_cb;
>  }
> =20
>  static const TypeInfo remote_machine =3D {
> @@ -69,6 +94,10 @@ static const TypeInfo remote_machine =3D {
>      .parent =3D TYPE_MACHINE,
>      .instance_size =3D sizeof(RemoteMachineState),
>      .class_init =3D remote_machine_class_init,
> +    .interfaces =3D (InterfaceInfo[]) {
> +        { TYPE_HOTPLUG_HANDLER },
> +        { }
> +    }
>  };
> =20
>  static void remote_machine_register_types(void)
> --=20
> 2.20.1
>=20

--12H2Kopd/iMiiVUM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmHv0c8ACgkQnKSrs4Gr
c8gGPQgAw3e44/4lCoEdWN+ISRpqC5gPvJkSKi0P1LT88M8RVchiYA0+nfHHrkXP
MTP0wL4qrGPw4MkE0gIDL5Gd5ABwGsgAdDBwu85lsfl76O8M3fK9dHV6fu1CtSQs
BamgEsWAkXfanWnyLGH9gYLMyYdadraCttV3ivV6wAHsP0qQUUHMMPyp5PjMDjfH
xF41PxD1mngMpGgrTH1cPIbUG3d+470XnVAH7ltVrDx/8CJqsOoLzYV/gDcW2+ox
mdgpNkI2Ph5F+m3TrHA9R1SwcY4XFKdNig65vRGjQ668/wZR7cMNxuKHq3WWMhWb
Yvs/+bTsFbaqw2JrHiQzoJbdb/BlBw==
=QiBK
-----END PGP SIGNATURE-----

--12H2Kopd/iMiiVUM--


