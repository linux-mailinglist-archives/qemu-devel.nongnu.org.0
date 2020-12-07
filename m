Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA8072D1074
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 13:20:03 +0100 (CET)
Received: from localhost ([::1]:59616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmFUo-0005aD-TF
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 07:20:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kmEhO-0005Ra-1A
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 06:28:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51415)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1kmEhF-0005mF-Uh
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 06:28:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607340528;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+8JKFHO8OLT3518wq+kubhGyOJEwtVs2WQNbFEQS9Wo=;
 b=D8W01e4aggu1xR1Dr7CxIpZQJQEhaoSsR62hPO55xdu/8HIyZZNMeUHTl+IzMblH4/M2Mr
 WyY1TqtcDcMJKgv1rtSMqFvSI8kF+TEnl0/oGyzldID6fY1WofgFOpGry+5NihFoG4hz7L
 uBBptXk3Pcmpx4dUGqvQAAPep+02JO0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-195-2HUZS2fQP8yaXyN_LPs_AA-1; Mon, 07 Dec 2020 06:28:46 -0500
X-MC-Unique: 2HUZS2fQP8yaXyN_LPs_AA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 700A81005504;
 Mon,  7 Dec 2020 11:28:45 +0000 (UTC)
Received: from localhost (ovpn-114-128.ams2.redhat.com [10.36.114.128])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 066AD648A2;
 Mon,  7 Dec 2020 11:28:38 +0000 (UTC)
Date: Mon, 7 Dec 2020 11:28:38 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Coiby Xu <coiby.xu@gmail.com>
Subject: Re: [PATCH for-5.2 01/10] test: new qTest case to test the
 vhost-user-blk-server
Message-ID: <20201207112838.GD203660@stefanha-x1.localdomain>
References: <20201111124331.1393747-1-stefanha@redhat.com>
 <20201111124331.1393747-2-stefanha@redhat.com>
 <20201125082056.wcxx274zo34qmobb@Rk>
 <20201125082820.6g5umkr4dafrzsai@Rk>
MIME-Version: 1.0
In-Reply-To: <20201125082820.6g5umkr4dafrzsai@Rk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="fOHHtNG4YXGJ0yqR"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--fOHHtNG4YXGJ0yqR
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 25, 2020 at 04:28:20PM +0800, Coiby Xu wrote:
> On Wed, Nov 25, 2020 at 04:20:56PM +0800, Coiby Xu wrote:
> > On Wed, Nov 11, 2020 at 12:43:22PM +0000, Stefan Hajnoczi wrote:
> > > +static void quit_storage_daemon(void *qmp_test_state)
> > > +{
> > > +    const char quit_str[] =3D "{ 'execute': 'quit' }";
> > > +
> > > +    /* Before quiting storate-daemon, quit qemu to avoid dubious mes=
sages */
> > > +    qobject_unref(qtest_qmp(global_qtest, quit_str));
> > > +
> > > +    /*
> > > +     * Give storage-daemon enough time to wake up&terminate
> > > +     * vu_client_trip coroutine so the Coroutine object could
> > > +     * be cleaned up. Otherwise LeakSanitizer would complain
> > > +     * about memory leaks.
> > > +     */
> > > +    g_usleep(1000);
> >=20
> > Your "[PATCH for-5.2 07/10] vhost-user-blk-test: fix races by using fd =
passing"
> > prompts to me think if there is a race condition under which 1000 ms
>                                                               ^^^^^^^
> Sorry, I meant 1000 =CE=BCs.

In the next revision vhost-user-blk-test sends a SIGTERM signal to
qemu-storage-daemon and then calls waitpid(2). This way there is a clean
shutdown without a sleep.

Regarding the LeakSanitizer issue you saw, are you still able to
reproduce it with commit f10802d2c9fd8bfd92c70f465da1a5992445157f
("qemu-storage-daemon: add missing cleanup calls") applied? Maybe
qemu-storage-daemon is still missing some cleanup code (e.g. to stop
exports before terminating).

Stefan

--fOHHtNG4YXGJ0yqR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl/OEeUACgkQnKSrs4Gr
c8jR0gf/TZsuBc3h0cJXmD/w6zsXrRBj30DXRikBT3VMrZRhyw2If+dtNWKXRdlX
IVn8PyKpD5LYLo77wto7hmw6EsJEuvNSDnw7j5VzY/hIkX4+xdKZqgktdgv9AqqN
WhoLhlGxvrYRP9a5A1cyTOenj62662krdxX9tNKmVVCvg7nIPc1qdIBivxN0+sYa
hbaoy1MUsyYxovyCPGvttDuylFBak1t9CoFeKPJ2YnVZ1MNvaZEZJJPh9LnL0wwi
YE7XR3BrPscDpeNQVfJqFXN2X61ZfVEG+PPUJYzoKEMV7j4Gao8zzNTkwsmUUcYl
nSfzjGaI1TsSWFhJ5sUo6YwLRzUbtg==
=YZj4
-----END PGP SIGNATURE-----

--fOHHtNG4YXGJ0yqR--


