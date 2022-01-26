Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C01449C663
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 10:37:32 +0100 (CET)
Received: from localhost ([::1]:49776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCek6-0001sz-SO
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 04:37:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nCefj-00068C-N2
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 04:32:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57860)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nCefh-0001kX-Uo
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 04:32:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643189577;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9BK/xR/ogslsVnba4CSTCCFrebTZB50VeiJ9i0drpJc=;
 b=KJkVwr1ke0ONvDTRiM70DnJ46X7yPrFSlU7SKUv9yMjHsdQdC2LSavcqTunUEkLts+YVay
 uWBogG9b6rrgCLpIWijObfJYV/WB8u1w4FgEf1hjScn18oT8KtvDdz7zX2mOQj6W8oY0YL
 tOCPQUqaRiCzyUUiX030eXRojEvNEzU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-451-_eW_FKhYNimPJzo0s0tlGA-1; Wed, 26 Jan 2022 04:32:53 -0500
X-MC-Unique: _eW_FKhYNimPJzo0s0tlGA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C596B1966328;
 Wed, 26 Jan 2022 09:32:51 +0000 (UTC)
Received: from localhost (unknown [10.39.195.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 625946ABBC;
 Wed, 26 Jan 2022 09:32:41 +0000 (UTC)
Date: Wed, 26 Jan 2022 09:32:40 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jag Raman <jag.raman@oracle.com>
Subject: Re: [PATCH v5 05/18] qdev: unplug blocker for devices
Message-ID: <YfEVOKTeMgaD/Nh1@stefanha-x1.localdomain>
References: <cover.1642626515.git.jag.raman@oracle.com>
 <5ad3f47f9ed507211fa8db5b8c36b9d32413bbbb.1642626515.git.jag.raman@oracle.com>
 <Ye/Qe86YifZB/AiD@stefanha-x1.localdomain>
 <4B7C4ECE-8A8B-486B-A66A-983FDD2D6223@oracle.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="IlQOg9LA1bsThMIY"
Content-Disposition: inline
In-Reply-To: <4B7C4ECE-8A8B-486B-A66A-983FDD2D6223@oracle.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.155,
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
Cc: "eduardo@habkost.net" <eduardo@habkost.net>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John Johnson <john.g.johnson@oracle.com>,
 "berrange@redhat.com" <berrange@redhat.com>,
 "bleal@redhat.com" <bleal@redhat.com>,
 "john.levon@nutanix.com" <john.levon@nutanix.com>,
 "mst@redhat.com" <mst@redhat.com>, "armbru@redhat.com" <armbru@redhat.com>,
 "quintela@redhat.com" <quintela@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@gmail.com>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "eblake@redhat.com" <eblake@redhat.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--IlQOg9LA1bsThMIY
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 25, 2022 at 02:43:33PM +0000, Jag Raman wrote:
>=20
>=20
> > On Jan 25, 2022, at 5:27 AM, Stefan Hajnoczi <stefanha@redhat.com> wrot=
e:
> >=20
> > On Wed, Jan 19, 2022 at 04:41:54PM -0500, Jagannathan Raman wrote:
> >> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> >> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> >> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> >> ---
> >> include/hw/qdev-core.h |  5 +++++
> >> softmmu/qdev-monitor.c | 35 +++++++++++++++++++++++++++++++++++
> >> 2 files changed, 40 insertions(+)
> >>=20
> >> diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
> >> index eed2983072..67df5e0081 100644
> >> --- a/include/hw/qdev-core.h
> >> +++ b/include/hw/qdev-core.h
> >> @@ -193,6 +193,7 @@ struct DeviceState {
> >>     int instance_id_alias;
> >>     int alias_required_for_version;
> >>     ResettableState reset;
> >> +    GSList *unplug_blockers;
> >> };
> >>=20
> >> struct DeviceListener {
> >> @@ -433,6 +434,10 @@ typedef bool (QDevPutBusFunc)(BusState *bus, Erro=
r **errp);
> >> bool qdev_set_bus_cbs(QDevGetBusFunc *get_bus, QDevPutBusFunc *put_bus,
> >>                       Error **errp);
> >>=20
> >> +int qdev_add_unplug_blocker(DeviceState *dev, Error *reason, Error **=
errp);
> >> +void qdev_del_unplug_blocker(DeviceState *dev, Error *reason);
> >> +bool qdev_unplug_blocked(DeviceState *dev, Error **errp);
> >> +
> >> /**
> >>  * GpioPolarity: Polarity of a GPIO line
> >>  *
> >> diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
> >> index 7306074019..1a169f89a2 100644
> >> --- a/softmmu/qdev-monitor.c
> >> +++ b/softmmu/qdev-monitor.c
> >> @@ -978,10 +978,45 @@ void qmp_device_del(const char *id, Error **errp)
> >>             return;
> >>         }
> >>=20
> >> +        if (qdev_unplug_blocked(dev, errp)) {
> >> +            return;
> >> +        }
> >> +
> >>         qdev_unplug(dev, errp);
> >>     }
> >> }
> >>=20
> >> +int qdev_add_unplug_blocker(DeviceState *dev, Error *reason, Error **=
errp)
> >> +{
> >> +    ERRP_GUARD();
> >> +
> >> +    if (!migration_is_idle()) {
> >> +        error_setg(errp, "migration is in progress");
> >> +        return -EBUSY;
> >> +    }
> >=20
> > Why can this function not be called during migration?
>=20
> Since =E2=80=98unplug_blockers' is a member of the device, I thought it w=
ouldn=E2=80=99t be correct to
> allow changes to the device's state during migration.
>=20
> I did weigh the following reasons against adding this check:
>   - unplug_blockers is not migrated to the destination anyway, so it does=
n=E2=80=99t matter if
>     it changes after migration starts

Yes.

>   - whichever code/object that needs to add the blocker could add it at t=
he destination
>     if needed

Yes.

> However, unlike qmp_device_add(), qmp_object_add() doesn=E2=80=99t reject=
 during
> migration. As such, an object could add a blocker for the device when mig=
ration is
> in progress.
>=20
> Would you prefer to throw a warning, or fully remove this test?

Adding an unplug blocker during migration seems safe to me. I would
remove this test.

Stefan

--IlQOg9LA1bsThMIY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmHxFTcACgkQnKSrs4Gr
c8gLhgf+LeZzTuiTSngKivzAkGXMsyW35hS6xLRR3LMXLkQX5MHYsvHXIj2pzm0v
SZ1Zv1HVnI2c9Q9L+AJC+5hjvhgWTkEx3b2Qjr7+Sh8r0O8Qylu/SBZTqvnVkt/1
GK45hikW3pKuYsr1dtae9+ku65jQd+EBTfLK9+mW9r1dgpaXfBNDLf5pbM/t3f3o
BBvEhoBsZmnr0wDV9OrC3QUKap42jAbXUyUisD/rBxAAul19qHKiKcjGV4Rw1tdc
okbDAMEE3N1KRtG2xjGIWVoYgdk4tojRBMs7wgQAL4683GzJOsIjK9a1C+IfqJha
xrbW7kK68KETcpiMGGpYOQJopaI35w==
=QA/T
-----END PGP SIGNATURE-----

--IlQOg9LA1bsThMIY--


