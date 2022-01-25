Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8561749B1BF
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 11:39:11 +0100 (CET)
Received: from localhost ([::1]:40762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCJEE-0001rb-L0
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 05:39:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nCJ2j-0007A7-GM
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 05:27:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22038)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nCJ2h-0005Hs-Sk
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 05:27:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643106435;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7WAiYhRMsgj+n19YKgGJNUPtN+teyPg6ZalLIEpUilo=;
 b=OJb7YMTSly549X2ez7ayMQM8RWLtWvwPwCVukPfYI0ghrvswUENciEvc/TulBYAA7J3CMq
 zDc687P0WCUwZ/RcOyFqBnmXK204LUqPlyafY+SK8rouTiPOGYLdGoPj9fk7EUti9hu9Am
 njYnQ/geA/k1XGNNzjBKZUgBsyZgQ7E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-21-GlYtuL5wPpuqrPNU76vYrw-1; Tue, 25 Jan 2022 05:27:11 -0500
X-MC-Unique: GlYtuL5wPpuqrPNU76vYrw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E14BF83DD20;
 Tue, 25 Jan 2022 10:27:09 +0000 (UTC)
Received: from localhost (unknown [10.39.195.26])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4476F54684;
 Tue, 25 Jan 2022 10:27:09 +0000 (UTC)
Date: Tue, 25 Jan 2022 10:27:07 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jagannathan Raman <jag.raman@oracle.com>
Subject: Re: [PATCH v5 05/18] qdev: unplug blocker for devices
Message-ID: <Ye/Qe86YifZB/AiD@stefanha-x1.localdomain>
References: <cover.1642626515.git.jag.raman@oracle.com>
 <5ad3f47f9ed507211fa8db5b8c36b9d32413bbbb.1642626515.git.jag.raman@oracle.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="KCgW0oez8KzyB7uc"
Content-Disposition: inline
In-Reply-To: <5ad3f47f9ed507211fa8db5b8c36b9d32413bbbb.1642626515.git.jag.raman@oracle.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
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


--KCgW0oez8KzyB7uc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 19, 2022 at 04:41:54PM -0500, Jagannathan Raman wrote:
> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> ---
>  include/hw/qdev-core.h |  5 +++++
>  softmmu/qdev-monitor.c | 35 +++++++++++++++++++++++++++++++++++
>  2 files changed, 40 insertions(+)
>=20
> diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
> index eed2983072..67df5e0081 100644
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
> @@ -433,6 +434,10 @@ typedef bool (QDevPutBusFunc)(BusState *bus, Error *=
*errp);
>  bool qdev_set_bus_cbs(QDevGetBusFunc *get_bus, QDevPutBusFunc *put_bus,
>                        Error **errp);
> =20
> +int qdev_add_unplug_blocker(DeviceState *dev, Error *reason, Error **err=
p);
> +void qdev_del_unplug_blocker(DeviceState *dev, Error *reason);
> +bool qdev_unplug_blocked(DeviceState *dev, Error **errp);
> +
>  /**
>   * GpioPolarity: Polarity of a GPIO line
>   *
> diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
> index 7306074019..1a169f89a2 100644
> --- a/softmmu/qdev-monitor.c
> +++ b/softmmu/qdev-monitor.c
> @@ -978,10 +978,45 @@ void qmp_device_del(const char *id, Error **errp)
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
> +int qdev_add_unplug_blocker(DeviceState *dev, Error *reason, Error **err=
p)
> +{
> +    ERRP_GUARD();
> +
> +    if (!migration_is_idle()) {
> +        error_setg(errp, "migration is in progress");
> +        return -EBUSY;
> +    }

Why can this function not be called during migration?

> +
> +    dev->unplug_blockers =3D g_slist_prepend(dev->unplug_blockers, reaso=
n);
> +
> +    return 0;
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

--KCgW0oez8KzyB7uc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmHv0HsACgkQnKSrs4Gr
c8idIAgAiOapwiWGEbuZREuTA+z+v3Bsc2LJqWCkSHZOjsvqvpwaqDe4nti0ws7w
2Ky5q2fitYJSq0eKVqh2aZ9FtRFnVDKsaUlYrfz5lcDYGgoF+LacEkRSN6022Y9q
CRwpYF/3bKowsCfVFJZ6xkyp+8Whz2iQXCx5oo0wn8kmvL9rxVFmhvJW1+DRg6Qe
C/BVZ1Fbxcp01S1F42oXe+3VmVt7+0iG3W+l6qJ8kzLEzHhVYeQq+B9V0ldopHDR
ZnlB2s+AWKWSIbLvDBQR6VmpD4NMxY6eqU+BDbvYSrgCYRD22QCkj8FYsBQxllNy
n5z2blS4NZrYTP/tJ3PtT+laAqdDLw==
=ClOb
-----END PGP SIGNATURE-----

--KCgW0oez8KzyB7uc--


