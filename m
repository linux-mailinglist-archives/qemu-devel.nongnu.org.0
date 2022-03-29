Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB2F44EAB3D
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 12:31:34 +0200 (CEST)
Received: from localhost ([::1]:55176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZ98P-00044k-H7
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 06:31:33 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nZ8yh-0005K0-Kg
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 06:21:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56184)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nZ8yf-0007GV-4k
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 06:21:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648549288;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hTR0AqlX4oC72QIK/ikikB4ucrCc+hAEe7lwLwS0w+0=;
 b=SymKEuSKpmZvFAuRBFoFyLTVzXVkF6veo7nK2Ih9WL+RrNWxklfLlfHwwGb+vnRmyPhz6M
 mDMQECAOD5hdI/WW1/0oioD35flRl+wnqrx0THoHyo1yker2Cfoarg1s1aR6MHTFZMKRUC
 ajhBQCMsfCAVBP3jyA/q5IxUlxfPe9c=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-54-j7MUEGwNPSiczumKwvf0Tg-1; Tue, 29 Mar 2022 06:21:26 -0400
X-MC-Unique: j7MUEGwNPSiczumKwvf0Tg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 621D3180138A;
 Tue, 29 Mar 2022 10:21:25 +0000 (UTC)
Received: from localhost (unknown [10.39.195.109])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 38E4A112132D;
 Tue, 29 Mar 2022 10:21:07 +0000 (UTC)
Date: Tue, 29 Mar 2022 11:21:05 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jagannathan Raman <jag.raman@oracle.com>
Subject: Re: [PATCH v7 07/17] vfio-user: define vfio-user-server object
Message-ID: <YkLdkdDsX4UhFCK3@stefanha-x1.localdomain>
References: <cover.1648234157.git.jag.raman@oracle.com>
 <35c1c4121dab88dc66548b8d47b27db275ac08d8.1648234157.git.jag.raman@oracle.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="LIYWjlOlIuZgirQ6"
Content-Disposition: inline
In-Reply-To: <35c1c4121dab88dc66548b8d47b27db275ac08d8.1648234157.git.jag.raman@oracle.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
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


--LIYWjlOlIuZgirQ6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 25, 2022 at 03:19:36PM -0400, Jagannathan Raman wrote:
  ##
> diff --git a/include/hw/remote/machine.h b/include/hw/remote/machine.h
> index 8d0fa98d33..2fcb9dada5 100644
> --- a/include/hw/remote/machine.h
> +++ b/include/hw/remote/machine.h
> @@ -26,6 +26,12 @@ struct RemoteMachineState {
>      bool vfio_user;
>  };
> =20
> +struct RemoteMachineClass {
> +    MachineClass parent_class;
> +
> +    bool auto_shutdown;
> +};
> +
>  /* Used to pass to co-routine device and ioc. */
>  typedef struct RemoteCommDev {
>      PCIDevice *dev;
> @@ -33,7 +39,7 @@ typedef struct RemoteCommDev {
>  } RemoteCommDev;
> =20
>  #define TYPE_REMOTE_MACHINE "x-remote-machine"
> -OBJECT_DECLARE_SIMPLE_TYPE(RemoteMachineState, REMOTE_MACHINE)
> +OBJECT_DECLARE_TYPE(RemoteMachineState, RemoteMachineClass, REMOTE_MACHI=
NE)
> =20
>  void coroutine_fn mpqemu_remote_msg_loop_co(void *data);
> =20
> diff --git a/hw/remote/machine.c b/hw/remote/machine.c
> index a9a75e170f..70178b222c 100644
> --- a/hw/remote/machine.c
> +++ b/hw/remote/machine.c
> @@ -78,25 +78,48 @@ static void remote_machine_set_vfio_user(Object *obj,=
 bool value, Error **errp)
>      s->vfio_user =3D value;
>  }
> =20
> +static bool remote_machine_get_auto_shutdown(Object *obj, Error **errp)
> +{
> +    RemoteMachineClass *rmc =3D REMOTE_MACHINE_GET_CLASS(obj);
> +
> +    return rmc->auto_shutdown;
> +}
> +
> +static void remote_machine_set_auto_shutdown(Object *obj, bool value,
> +                                             Error **errp)
> +{
> +    RemoteMachineClass *rmc =3D REMOTE_MACHINE_GET_CLASS(obj);
> +
> +    rmc->auto_shutdown =3D value;
> +}
> +
>  static void remote_machine_class_init(ObjectClass *oc, void *data)
>  {
>      MachineClass *mc =3D MACHINE_CLASS(oc);
> +    RemoteMachineClass *rmc =3D REMOTE_MACHINE_CLASS(oc);
>      HotplugHandlerClass *hc =3D HOTPLUG_HANDLER_CLASS(oc);
> =20
>      mc->init =3D remote_machine_init;
>      mc->desc =3D "Experimental remote machine";
> =20
> +    rmc->auto_shutdown =3D true;
> +
>      hc->unplug =3D qdev_simple_device_unplug_cb;
> =20
>      object_class_property_add_bool(oc, "vfio-user",
>                                     remote_machine_get_vfio_user,
>                                     remote_machine_set_vfio_user);
> +
> +    object_class_property_add_bool(oc, "auto-shutdown",
> +                                   remote_machine_get_auto_shutdown,
> +                                   remote_machine_set_auto_shutdown);
>  }
> =20
>  static const TypeInfo remote_machine =3D {
>      .name =3D TYPE_REMOTE_MACHINE,
>      .parent =3D TYPE_MACHINE,
>      .instance_size =3D sizeof(RemoteMachineState),
> +    .class_size =3D sizeof(RemoteMachineClass),

Why is ->auto_shutdown a global RemoteMachineClass field instead of a
RemoteMachineState instance field?

The getter/setter functions receive an object instance so they could
access the value in RemoteMachineState instead of RemoteMachineClass.
Moving the field to RemoteMachineState would allow multiple
RemoteMachineState instances with different ->auto_shutdown values in
case QEMU ever supports running multiple machines within a single
process.

--LIYWjlOlIuZgirQ6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmJC3ZEACgkQnKSrs4Gr
c8jQkgf+KoSLAJqzasWAJwBqcQ3nEzDgV+zJkZMCKaRMiTFAxqjd3g3I75hyWxlu
IY2dxRe42gqG5sF2uZN9emUUmJKn6ncAEIhyRessWfAEU9Hb+AYpgIXiAgo4PWSz
EOmzjqXS1fyU94oduuBrOW/GiAU0DUEoZJyki+rCg4I2d2bOZEYVsINchMyNftel
Z7Mry4gjblB84UwBVFt0YO/wr8J2VkEzCKrEQcPkvXb5jLvmtosstewKNQ0oz08Z
kTPw8iHKhS0dV2791kSgsLAV1t+5FghZfUlSE5IEdCY2h9XFQYp6QWDcEcb7pAcE
Kn4tVm0FfUmwf9nYoJy0EPK5dOzfLA==
=YlvA
-----END PGP SIGNATURE-----

--LIYWjlOlIuZgirQ6--


