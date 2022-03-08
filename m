Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C1E54D14AC
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 11:24:39 +0100 (CET)
Received: from localhost ([::1]:47190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRX1C-0000f4-HZ
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 05:24:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nRWyv-0006xc-9a
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 05:22:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30052)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nRWys-000269-Lh
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 05:22:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646734932;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nM94Z7FQ3m5olVJKGzTCirlYZkpSsGHj7pzCELnL15A=;
 b=V19ptO2oJWBzk+jT50uoR1NorrTk56xLNYDrJjEk/pABJd/zXjKIcwORiynHxF5+GhdOII
 uK/GSsbmC/De5aikxct7Io1luARvQBhoQtd3tIvJYEMebC9th6hNIW0gEvE/JD5nRUm9gA
 6S4y6/EWBi7DBXBncgqHF0EQX+PjiRs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-610-YmhwfHReMFmLDlL-ZvTTgg-1; Tue, 08 Mar 2022 05:22:09 -0500
X-MC-Unique: YmhwfHReMFmLDlL-ZvTTgg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EB2681854E26;
 Tue,  8 Mar 2022 10:22:07 +0000 (UTC)
Received: from localhost (unknown [10.39.193.143])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 309177A8DA;
 Tue,  8 Mar 2022 10:21:57 +0000 (UTC)
Date: Tue, 8 Mar 2022 10:21:56 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jag Raman <jag.raman@oracle.com>
Subject: Re: [PATCH v6 18/19] vfio-user: handle reset of remote device
Message-ID: <YicuRNkZcKkpgKwO@stefanha-x1.localdomain>
References: <cover.1645079934.git.jag.raman@oracle.com>
 <54278334564d9e9f8d2eb3ff884260ac90da44e5.1645079934.git.jag.raman@oracle.com>
 <YiXuJ2YqCZEbrsHn@stefanha-x1.localdomain>
 <36FEEF91-B3AD-4DCB-B529-546FAF75E9DB@oracle.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="6VLmUlUGHx2ES/HD"
Content-Disposition: inline
In-Reply-To: <36FEEF91-B3AD-4DCB-B529-546FAF75E9DB@oracle.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: "eduardo@habkost.net" <eduardo@habkost.net>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John Johnson <john.g.johnson@oracle.com>,
 "berrange@redhat.com" <berrange@redhat.com>,
 "bleal@redhat.com" <bleal@redhat.com>,
 "john.levon@nutanix.com" <john.levon@nutanix.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, "armbru@redhat.com" <armbru@redhat.com>,
 "quintela@redhat.com" <quintela@redhat.com>,
 "f4bug@amsat.org" <f4bug@amsat.org>, qemu-devel <qemu-devel@nongnu.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Kanth Ghatraju <kanth.ghatraju@oracle.com>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "eblake@redhat.com" <eblake@redhat.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--6VLmUlUGHx2ES/HD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 07, 2022 at 03:37:51PM +0000, Jag Raman wrote:
>=20
>=20
> > On Mar 7, 2022, at 6:36 AM, Stefan Hajnoczi <stefanha@redhat.com> wrote:
> >=20
> > On Thu, Feb 17, 2022 at 02:49:05AM -0500, Jagannathan Raman wrote:
> >> Adds handler to reset a remote device
> >>=20
> >> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> >> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> >> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> >> ---
> >> hw/remote/vfio-user-obj.c | 19 +++++++++++++++++++
> >> 1 file changed, 19 insertions(+)
> >>=20
> >> diff --git a/hw/remote/vfio-user-obj.c b/hw/remote/vfio-user-obj.c
> >> index 2304643003..55f1bf5e0f 100644
> >> --- a/hw/remote/vfio-user-obj.c
> >> +++ b/hw/remote/vfio-user-obj.c
> >> @@ -989,6 +989,19 @@ static bool vfu_object_migratable(VfuObject *o)
> >>     return dc->vmsd && !dc->vmsd->unmigratable;
> >> }
> >>=20
> >> +static int vfu_object_device_reset(vfu_ctx_t *vfu_ctx, vfu_reset_type=
_t type)
> >> +{
> >> +    VfuObject *o =3D vfu_get_private(vfu_ctx);
> >> +
> >> +    if (type =3D=3D VFU_RESET_LOST_CONN) {
> >> +        return 0;
> >> +    }
> >=20
> > Why is a lost connection ignored? Should there be a QMP monitor event?
>=20
> We handle the lost connection case in vfu_object_ctx_run(), which is in
> PATCH 5 of this series. We are sending a QMP monitor event in this case.

Great, please add a comment here.

Stefan

--6VLmUlUGHx2ES/HD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmInLkQACgkQnKSrs4Gr
c8gv7Af9H7dpstBDuqrZwz3SHZ9Z244I/iq6M4/dRed5vuU2VuCxaYqOg5ufLt+2
bY8egp+M5XE9iIpQ3lXG6zf+ORP/6kcT3fGOC7CCHDl+HuYJBLqSdgS+HTD+jW9h
xmUN5fr8IMSmZBkTKRplHUnnHnftE3wnFAKqdNUnUgsjI3GIY6VCLMpPWjAPR2J8
0i48k0fdP6WRPhQKPRJRAcIBNkOmJMpAR/MhSai2Gv+wSXGNfGiT4d4VWzgUc0gw
/XT2HZlPRm+63Ice7GHUScDMfNBlVjouTtjWjrC3Tfqo2mdDz9WO+sflE9hF18bF
B4B9plzDio5JKADoyDn/BgaH2cHcYQ==
=lrjO
-----END PGP SIGNATURE-----

--6VLmUlUGHx2ES/HD--


