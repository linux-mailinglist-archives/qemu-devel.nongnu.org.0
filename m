Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3382D2DAB34
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 11:48:16 +0100 (CET)
Received: from localhost ([::1]:35800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kp7sN-0001Ry-7d
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 05:48:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kp7qG-0008VN-76
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 05:46:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:39457)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kp7qE-0005AY-Gh
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 05:46:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608029161;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HIOJTPg1wzuXF32MbSgn1Z++Zv6VeUyXjKQK1m/A1zY=;
 b=XC9xUfS8thhjyeP+5b3FJ7nJU4w8e/zXc0YsGQEL6h+X5I1XnIMWeAvN/CVITTYMM/Brpr
 2A2nSq8QuOv+sS/8ARMKxWqNCJ9PDicC+vmbbiRUMhrGe2Zt/8w2JtmHMowTQ/Pj6CeYob
 G5xqe1ISUBzsh0cNw54gBKOFRfacOqo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-240-QBueWhSaOg247tWyfvEGZA-1; Tue, 15 Dec 2020 05:45:57 -0500
X-MC-Unique: QBueWhSaOg247tWyfvEGZA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 50B5515734;
 Tue, 15 Dec 2020 10:45:55 +0000 (UTC)
Received: from localhost (ovpn-117-148.ams2.redhat.com [10.36.117.148])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BEFC087406;
 Tue, 15 Dec 2020 10:45:45 +0000 (UTC)
Date: Mon, 14 Dec 2020 21:23:46 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jagannathan Raman <jag.raman@oracle.com>
Subject: Re: [PATCH v13 10/19] multi-process: Associate fd of a PCIDevice
 with its object
Message-ID: <20201214212346.GK620320@stefanha-x1.localdomain>
References: <cover.1607922214.git.jag.raman@oracle.com>
 <e174acc9bba334c8127574aa21d432a7b3a54330.1607922214.git.jag.raman@oracle.com>
MIME-Version: 1.0
In-Reply-To: <e174acc9bba334c8127574aa21d432a7b3a54330.1607922214.git.jag.raman@oracle.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="YQEH9CATo+4lan7A"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_12_24=1.049,
 DKIMWL_WL_HIGH=-0.001, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: elena.ufimtseva@oracle.com, fam@euphon.net, swapnil.ingle@nutanix.com,
 john.g.johnson@oracle.com, qemu-devel@nongnu.org, kraxel@redhat.com,
 quintela@redhat.com, mst@redhat.com, armbru@redhat.com,
 kanth.ghatraju@oracle.com, felipe@nutanix.com, thuth@redhat.com,
 ehabkost@redhat.com, konrad.wilk@oracle.com, dgilbert@redhat.com,
 alex.williamson@redhat.com, thanos.makatos@nutanix.com, kwolf@redhat.com,
 berrange@redhat.com, mreitz@redhat.com, ross.lagerwall@citrix.com,
 marcandre.lureau@gmail.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--YQEH9CATo+4lan7A
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Dec 14, 2020 at 12:14:50AM -0500, Jagannathan Raman wrote:
> +static void remote_object_release(DeviceListener *listener, DeviceState *dev)
> +{
> +    RemoteObject *o = container_of(listener, RemoteObject, listener);
> +
> +    if (o->dev == dev) {
> +        object_unref(OBJECT(o));
> +    }
> +}
> +
> +static void remote_object_machine_done(Notifier *notifier, void *data)
> +{
> +    RemoteObject *o = container_of(notifier, RemoteObject, machine_done);
> +    DeviceState *dev = NULL;
> +    QIOChannel *ioc = NULL;
> +    Coroutine *co = NULL;
> +    RemoteCommDev *comdev = NULL;
> +    Error *err = NULL;
> +
> +    dev = qdev_find_recursive(sysbus_get_default(), o->devid);
> +    if (!dev || !object_dynamic_cast(OBJECT(dev), TYPE_PCI_DEVICE)) {
> +        error_report("%s is not a PCI device", o->devid);
> +        return;
> +    }
> +
> +    ioc = qio_channel_new_fd(o->fd, &err);
> +    if (!ioc) {
> +        error_report_err(err);
> +        return;
> +    }
> +    qio_channel_set_blocking(ioc, false, NULL);
> +
> +    o->dev = dev;
> +
> +    o->listener.unrealize = remote_object_release;
> +    device_listener_register(&o->listener);

The remote_object_release() name is outdated. How about
remote_object_unrealize_listener()?

--YQEH9CATo+4lan7A
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl/X1+IACgkQnKSrs4Gr
c8gE5QgAoM2AHAP8lCtLFmdhwg66diq7TgYMPkrb9Wy0RqrRHnxduVDz0AYyx+1N
2VfooBbm7GWykV2L4DqHcw1o4k1FnqVcsMcQjAvXswpXxecOy/k6Z0zgsH2Q285o
0yWQPJ3qP9Ih0PpNh/TOWu/r25w0u5HTKudIlhGOalrUzQdup1NvLFRJIQaHL2Ps
paS0knuDMlGhWGSF1j1AyUZAWh+4FoiQdv6nvJ4CI9CMLQ49amlGJc3fSTYDF125
BTmQFOxViHm/LxmzLTsyDuUylPi+nExEqwFVDtnNAc37EkVYxHsqjSQnhaecfbME
oHkb8qxFEuwgVJdroQRkJVImv6ANMA==
=nBjs
-----END PGP SIGNATURE-----

--YQEH9CATo+4lan7A--


