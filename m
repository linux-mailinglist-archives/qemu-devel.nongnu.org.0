Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E0037277C
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 10:45:32 +0200 (CEST)
Received: from localhost ([::1]:59656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldqgN-0006Cz-57
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 04:45:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ldqeb-0005JJ-W6
 for qemu-devel@nongnu.org; Tue, 04 May 2021 04:43:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53561)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ldqeZ-000825-0p
 for qemu-devel@nongnu.org; Tue, 04 May 2021 04:43:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620117817;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9HUEvGpTY4VuTEBw9BcY1joXy+GWC6/XRFz53B6aSqg=;
 b=a43zfIqQ1mP8Q1EdWpSIFdjZNB0EczppiXj7E+KVBIJTJITGH0OVjxgdz9ItqM6mitHmuj
 EKmjkpsAX2aQ1XtlXDfnoY/4lmhjJ9/km3qUTqVofgR44cl1da71N71pbJkXw4iV9cdpr8
 jabM6Pu1ahKEd7tc/c2+w0n4HQnoI4E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-60-731B0-ZNOKSUPg7rY1fDdA-1; Tue, 04 May 2021 04:43:35 -0400
X-MC-Unique: 731B0-ZNOKSUPg7rY1fDdA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 225B0A40C7;
 Tue,  4 May 2021 08:43:34 +0000 (UTC)
Received: from localhost (ovpn-115-110.ams2.redhat.com [10.36.115.110])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 969965944A;
 Tue,  4 May 2021 08:43:33 +0000 (UTC)
Date: Tue, 4 May 2021 09:43:32 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: Switching to the GitLab bug tracker
Message-ID: <YJEJNBJOqry5sHiy@stefanha-x1.localdomain>
References: <a6d77040-1dba-90c7-5ebe-5778177e686e@redhat.com>
MIME-Version: 1.0
In-Reply-To: <a6d77040-1dba-90c7-5ebe-5778177e686e@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="EDLmUJbElFY8bJZt"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 qemu-discuss <qemu-discuss@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--EDLmUJbElFY8bJZt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 03, 2021 at 01:16:51PM +0200, Thomas Huth wrote:
> As you might have already noticed by some other mails on the qemu-devel
> mailing list, we are in progress of switching our bug tracking tool from
> Launchpad to Gitlab. The new tracker can now be found here:
>=20
>  https://gitlab.com/qemu-project/qemu/-/issues

Thank you for doing this, Thomas!

> 1) We likely won't have the possibility anymore to automatically send e-m=
ail
> notifications for new bugs to the qemu-devel mailing list. If you want to
> get informed about new bugs, please use the notification mechanism from
> Gitlab instead. That means, log into your gitlab account, browse to
>=20
>  https://gitlab.com/qemu-project/qemu
>=20
> and click on the bell icon at the top of the page to manage your
> notifications, e.g. enable notifications for "New issues" there.

All maintainers and most regular contributors should follow the issue
tracker so that QEMU developers are aware of new issues. Please do this!

An alternative mechanism is the RSS/Atom feed available by clicking the
"Subscribe to RSS feed" button left of the "New issue" button here:

  https://gitlab.com/qemu-project/qemu/-/issues

Stefan

--EDLmUJbElFY8bJZt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmCRCTQACgkQnKSrs4Gr
c8h4BQf/bSfBSGZWG53+3o0wqDSMagPrFHg7sBWkarJrzWFkTMpaCm2VNgmkZRH0
/NyPfYqTuTd1KQ/D5+jlu6VhiAZSW+F5Lu+udQqFoREAEGQjlk7k5yRY05en3/5M
re00uTpemvtOkbm4D5JWb7x+BB3hZf+NuU6X6QAMdWWz1uwD2cQqPd85f43QfFoS
u4tZsxtPQWRgzeHOT71F7S4/59YJ791MIZpOrZgfb6hDsR01JH673N06m+xUADB6
M8UNnn2krDs0GNaVA2arGa8yodkNB5I5x7jlnsDiBYjBng84Klauy7R21mogIM0I
Gjty6pfC/pHtOfKWK+MWgfY+suGAUg==
=hXD2
-----END PGP SIGNATURE-----

--EDLmUJbElFY8bJZt--


