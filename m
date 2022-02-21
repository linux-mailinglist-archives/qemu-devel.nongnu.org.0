Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C1904BDA90
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 16:30:44 +0100 (CET)
Received: from localhost ([::1]:56090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMAeB-0004M5-2H
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 10:30:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nMAbj-0002ho-LO
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 10:28:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31181)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nMAbh-0005Zb-IM
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 10:28:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645457289;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JZjmWMXJ2DnssERDvGzw6xsWRLhp3/cUgGAH1bUkDzc=;
 b=F97lgMM94hrFaCDpiSz7ZDugsR5qeBCAmtlSKs/vOSS/6dBB3hlQcVuYWx52s42szPQnVN
 f65EwGehhqEI/AAYmOA+nILwTmVcG5iftCCsYKzMWRjFOr//9tP1EHh/+hZ+2epSgjI9yh
 Ed36WUXDm1GqImUI5iyiLzn0SZJYGQ0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-661-_qdOVPu2NfmeBaWpHiXHNA-1; Mon, 21 Feb 2022 10:28:05 -0500
X-MC-Unique: _qdOVPu2NfmeBaWpHiXHNA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E7169814243;
 Mon, 21 Feb 2022 15:28:03 +0000 (UTC)
Received: from localhost (unknown [10.39.195.91])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 67E4A753C3;
 Mon, 21 Feb 2022 15:27:30 +0000 (UTC)
Date: Mon, 21 Feb 2022 15:27:29 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jagannathan Raman <jag.raman@oracle.com>
Subject: Re: [PATCH v6 03/19] qdev: unplug blocker for devices
Message-ID: <YhOvYR463nBTfQFM@stefanha-x1.localdomain>
References: <cover.1645079934.git.jag.raman@oracle.com>
 <5acc81b16d52949a47cbcbfcc2eacc0e4f3a5687.1645079934.git.jag.raman@oracle.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="VwEqvrVq5RV1OAcx"
Content-Disposition: inline
In-Reply-To: <5acc81b16d52949a47cbcbfcc2eacc0e4f3a5687.1645079934.git.jag.raman@oracle.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
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
Cc: eduardo@habkost.net, elena.ufimtseva@oracle.com, john.g.johnson@oracle.com,
 berrange@redhat.com, bleal@redhat.com, john.levon@nutanix.com, mst@redhat.com,
 armbru@redhat.com, quintela@redhat.com, f4bug@amsat.org, qemu-devel@nongnu.org,
 alex.williamson@redhat.com, kanth.ghatraju@oracle.com,
 thanos.makatos@nutanix.com, pbonzini@redhat.com, eblake@redhat.com,
 dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--VwEqvrVq5RV1OAcx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 17, 2022 at 02:48:50AM -0500, Jagannathan Raman wrote:
> Add blocker to prevent hot-unplug of devices
>=20
> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> ---
>  include/hw/qdev-core.h | 35 +++++++++++++++++++++++++++++++++++
>  softmmu/qdev-monitor.c | 26 ++++++++++++++++++++++++++
>  2 files changed, 61 insertions(+)
>=20
> diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
> index 92c3d65208..4b1d77f44a 100644
> --- a/include/hw/qdev-core.h
> +++ b/include/hw/qdev-core.h
> @@ -193,6 +193,7 @@ struct DeviceState {
>      int instance_id_alias;
>      int alias_required_for_version;
>      ResettableState reset;
> +    GSList *unplug_blockers;
>  };
> =20
>  struct DeviceListener {
> @@ -419,6 +420,40 @@ void qdev_simple_device_unplug_cb(HotplugHandler *ho=
tplug_dev,
>  void qdev_machine_creation_done(void);
>  bool qdev_machine_modified(void);
> =20
> +/**
> + * Device Unplug blocker: prevents a device from being unplugged. It cou=
ld
      ^^^^^^^^^^^^^^^^^^^^^

This looks strange. gtkdoc will probably treat it as the doc comment for
qdev_add_unplug_blocker(), which is actually defined below. I suggest
not trying to define a new section in the documentation and instead just
focussing on doc comments for qdev_add_unplug_block() and other
functions.

The gtkdoc way of defining sections is covered here but it's almost
never used in QEMU:
https://developer-old.gnome.org/gtk-doc-manual/stable/documenting_sections.=
html.en

> + * be used to indicate that another object depends on the device.
> + *
> + * qdev_add_unplug_blocker: Adds an unplug blocker to a device
> + *
> + * @dev: Device to be blocked from unplug
> + * @reason: Reason for blocking
> + *
> + */
> +void qdev_add_unplug_blocker(DeviceState *dev, Error *reason);

Does the caller have to call qdev_del_unplug_blocker() later?

An assert(!dev->unplug_blockers) would be nice when DeviceState is
destroyed. That way leaks will be caught.

> +
> +/**
> + * qdev_del_unplug_blocker: Removes an unplug blocker from a device
> + *
> + * @dev: Device to be unblocked
> + * @reason: Pointer to the Error used with qdev_add_unplug_blocker.
> + *          Used as a handle to lookup the blocker for deletion.
> + *
> + */
> +void qdev_del_unplug_blocker(DeviceState *dev, Error *reason);
> +
> +/**
> + * qdev_unplug_blocked: Confirms if a device is blocked from unplug
> + *
> + * @dev: Device to be tested
> + * @reason: Returns one of the reasons why the device is blocked,
> + *          if any
> + *
> + * Returns: true if device is blocked from unplug, false otherwise
> + *
> + */
> +bool qdev_unplug_blocked(DeviceState *dev, Error **errp);
> +
>  /**
>   * GpioPolarity: Polarity of a GPIO line
>   *
> diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
> index 01f3834db5..69d9cf3f25 100644
> --- a/softmmu/qdev-monitor.c
> +++ b/softmmu/qdev-monitor.c
> @@ -945,10 +945,36 @@ void qmp_device_del(const char *id, Error **errp)
>              return;
>          }
> =20
> +        if (qdev_unplug_blocked(dev, errp)) {
> +            return;
> +        }
> +
>          qdev_unplug(dev, errp);
>      }
>  }
> =20
> +void qdev_add_unplug_blocker(DeviceState *dev, Error *reason)

These functions belong in hw/core/qdev.c because they are part of the
DeviceState API, not qdev monitor commands?

> +{
> +    dev->unplug_blockers =3D g_slist_prepend(dev->unplug_blockers, reaso=
n);
> +}
> +
> +void qdev_del_unplug_blocker(DeviceState *dev, Error *reason)
> +{
> +    dev->unplug_blockers =3D g_slist_remove(dev->unplug_blockers, reason=
);
> +}
> +
> +bool qdev_unplug_blocked(DeviceState *dev, Error **errp)
> +{
> +    ERRP_GUARD();
> +
> +    if (dev->unplug_blockers) {
> +        error_propagate(errp, error_copy(dev->unplug_blockers->data));
> +        return true;
> +    }
> +
> +    return false;
> +}
> +
>  void hmp_device_add(Monitor *mon, const QDict *qdict)
>  {
>      Error *err =3D NULL;
> --=20
> 2.20.1
>=20

--VwEqvrVq5RV1OAcx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmITr2EACgkQnKSrs4Gr
c8jw4gf/ZBZB5mzTRqQX920xUH2sH7Ih0luX7BNrRQ1hGFPcqDgGSqBmiL+fLVXT
Y4pB8E66892Mnm2rZmlr4lftnRYCUtov5LryokoO3+2AT6KV7R3yyZxd4Stz3joj
XGxhjN+1bisK16UKifbSbZhJK9epfOAxseojADpo7qrZ7Z+c3B2li7UCXwRPSCUh
jbx5G+UR3mzybOMqnLUu63VnIMDq7g4CTURr9d/UHq2xQ6q8tVUPMFt+nl3Ea6on
0mUPZTqHcW9lZwvY8A7QonQeBZfwuhW9f0ynSILUclKbh09rSMUcMBbrlIIgd7n4
dmXKQw3E9JRwgqiJ27P7i1ZYGzUPPA==
=Fvmo
-----END PGP SIGNATURE-----

--VwEqvrVq5RV1OAcx--


