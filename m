Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7AD04CAAB4
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 17:46:52 +0100 (CET)
Received: from localhost ([::1]:58330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPS7n-0002BD-Io
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 11:46:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nPS6l-0001W8-O5
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 11:45:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20614)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nPS6j-0003Jm-A4
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 11:45:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646239544;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uwmUzLPX8ErfFRL8A+QIDO7iLygGVH/Q+uaLLey8sFY=;
 b=SVLWoS+szohzxUnOICGYCTBZA181rKOPtJ1W6bri/4OoFeaBMMwe+mqt5IbtVdMFL1lgIR
 a53ZJMvIPteGtEGHiH9RT0/Lh+mwH1wlFJg0GLhDBDmaiIKd7D0M5oJvDD0eXozTvl6+rv
 +PFqPLMElxeAWHYm3UGLbe6ouz4OcUE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-592--fOtWGikMp6rcNJVB0X1Xg-1; Wed, 02 Mar 2022 11:45:41 -0500
X-MC-Unique: -fOtWGikMp6rcNJVB0X1Xg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 31D1480D6A5;
 Wed,  2 Mar 2022 16:45:39 +0000 (UTC)
Received: from localhost (unknown [10.39.195.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E33A080001;
 Wed,  2 Mar 2022 16:45:07 +0000 (UTC)
Date: Wed, 2 Mar 2022 16:45:06 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jag Raman <jag.raman@oracle.com>
Subject: Re: [PATCH v6 07/19] vfio-user: define vfio-user-server object
Message-ID: <Yh+fEqjP+U+LI0j/@stefanha-x1.localdomain>
References: <cover.1645079934.git.jag.raman@oracle.com>
 <309a6afc6f47d7e812a6f18ce591dff092efbb06.1645079934.git.jag.raman@oracle.com>
 <YhOxteVSJd3GpqkK@stefanha-x1.localdomain>
 <DD1CDEFD-D610-4A03-BDF5-4CC38A639CD2@oracle.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="93VeTYl/UGJjcM9i"
Content-Disposition: inline
In-Reply-To: <DD1CDEFD-D610-4A03-BDF5-4CC38A639CD2@oracle.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
Cc: "eduardo@habkost.net" <eduardo@habkost.net>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John Johnson <john.g.johnson@oracle.com>,
 "berrange@redhat.com" <berrange@redhat.com>,
 "bleal@redhat.com" <bleal@redhat.com>,
 "john.levon@nutanix.com" <john.levon@nutanix.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, "armbru@redhat.com" <armbru@redhat.com>,
 "quintela@redhat.com" <quintela@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Kanth Ghatraju <kanth.ghatraju@oracle.com>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "eblake@redhat.com" <eblake@redhat.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--93VeTYl/UGJjcM9i
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 28, 2022 at 07:14:21PM +0000, Jag Raman wrote:
> > On Feb 21, 2022, at 10:37 AM, Stefan Hajnoczi <stefanha@redhat.com> wro=
te:
> > On Thu, Feb 17, 2022 at 02:48:54AM -0500, Jagannathan Raman wrote:
> >> +struct VfuObjectClass {
> >> +    ObjectClass parent_class;
> >> +
> >> +    unsigned int nr_devs;
> >> +
> >> +    /*
> >> +     * Can be set to shutdown automatically when all server object
> >> +     * instances are destroyed
> >> +     */
> >> +    bool auto_shutdown;
> >=20
> > This field is introduced but it is hardcoded to true. Is there a way to
> > set it to false?
>=20
> We could add a property to =E2=80=99TYPE_REMOTE_MACHINE=E2=80=99 which in=
dicates if
> it would run as a server/daemon.

Yes.

An alternative is to add a per-instance property to --object
x-vfio-user-server. In practice there is not much benefit since users
are unlikely to mix auto-shutdown instances with non-auto-shutdown
instances, but the code might be a little simpler and cleaner.

Stefan

--93VeTYl/UGJjcM9i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmIfnxIACgkQnKSrs4Gr
c8hnHwf/dR43kX+F2wTmiNPtz/MwYaC42Ya/G6D5GlzCe7ww762vXSiDB08PWtXN
TNQwevF2HfWfe/gXoI0+DeHRv/fxdnXqd6lhWDCcPkXonmF2buxyf/SPZ7cEkJzF
+PrBwmyiMz7/6R5ujys1A9go9I51HbXwqSao+E+j95WAsyJ4aAP6/bBUPvO+ztyx
E9/8+xL6kS61ZvWP/7xVcMdsGVeJJeQh0qp6kx1aPe3Gyw70vBoklGbfUEiHokXD
RHUI1XuEb2XzbdYHhtn5Y468jaUbiWNFicNJhqq48IAbm1MjqciUGGfkFqo91DnG
mKT6jifIktEJvJKyyWNeySudogsrgQ==
=s3CV
-----END PGP SIGNATURE-----

--93VeTYl/UGJjcM9i--


