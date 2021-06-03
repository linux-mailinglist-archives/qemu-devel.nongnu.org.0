Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5421E399D43
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 10:56:58 +0200 (CEST)
Received: from localhost ([::1]:48800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loj9t-0002rM-FH
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 04:56:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1loix0-0002Xw-2g
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 04:43:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29082)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1loiww-0004Tx-Me
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 04:43:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622709813;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/wyFagcmzwdlB0N4TkLGtniq7h/gmlq0opJg6JpbiCQ=;
 b=efPqmpy0LfCvihYfJ29t8UYKXgfgnnEE2LqX6FdpLTr3RtSEw5QAP05mfolxT6ZJq/6m7N
 SqT1QvlKVOD7UjA6mIfg+o+6140VJruKAr3z288NVxqfQ/nWCQqVWTdVCXirL0WpOCi36T
 P7xPZfM7tpdkaAsY29yeqmV9hqqBQyw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-337-84ZTtaexNIueIXf2BkebPw-1; Thu, 03 Jun 2021 04:43:29 -0400
X-MC-Unique: 84ZTtaexNIueIXf2BkebPw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8B9C880ED8D;
 Thu,  3 Jun 2021 08:43:28 +0000 (UTC)
Received: from localhost (ovpn-114-228.ams2.redhat.com [10.36.114.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 318FE1001281;
 Thu,  3 Jun 2021 08:43:28 +0000 (UTC)
Date: Thu, 3 Jun 2021 09:43:27 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v2 1/2] GitLab: Add "Bug" issue reporting template
Message-ID: <YLiWL2LB3+sbrpJm@stefanha-x1.localdomain>
References: <20210521173818.255817-1-jsnow@redhat.com>
 <20210521173818.255817-2-jsnow@redhat.com>
 <YLdN4OcxSD0fJOvD@stefanha-x1.localdomain>
 <e6cda390-d1ac-723c-47a4-135abb7717a5@redhat.com>
MIME-Version: 1.0
In-Reply-To: <e6cda390-d1ac-723c-47a4-135abb7717a5@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="aKM32XLfuHypoamq"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Peter Krempa <pkrempa@redhat.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--aKM32XLfuHypoamq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 02, 2021 at 12:09:47PM -0400, John Snow wrote:
> On 6/2/21 5:22 AM, Stefan Hajnoczi wrote:
> > On Fri, May 21, 2021 at 01:38:17PM -0400, John Snow wrote:
> > > +## Host environment
> > > + - Operating system: (Windows 10 21H1, Fedora 34, etc.)
> > > + - OS/kernel version: (For POSIX hosts, use `uname -a`)
> > > + - Architecture: (x86, ARM, s390x, etc.)
> > > + - QEMU flavor: (qemu-system-x86_64, qemu-aarch64, qemu-img, etc.)
> >=20
> > Is this necessary since we ask for the command-line below?
> >=20
>=20
> Not strictly, IF the entire form is filled out. I had noticed some bugs i=
n
> gitlab where reporters seem to be aware of what kind of QEMU they are
> running, but are unable to procure the command line invocation. (it is be=
ing
> launched through docker, virsh, etc.) *
>=20
> It's redundant, but I am operating on the belief that the CLI may not alw=
ays
> be available. I don't expect people to not file a bug because they can't
> find it.
>=20
> I think of it as a prompt to get a more detailed report on the first try.=
 Is
> it worth keeping?
>=20
> *(Aside: maybe a wiki "how to report a bug" page could have a small secti=
on
> on identifying the command line arguments when QEMU is being launched via
> vmm/boxes/virsh/docker and so on.)

It didn't occur to me that the fields were optional :).

For me personally, long bug reporting templates reduce the chance that I
will report a bug.

Stefan

--aKM32XLfuHypoamq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmC4li8ACgkQnKSrs4Gr
c8jEagf7BIAPKlxY5ddHK6MWA+W5YREXcuEYgfjx/1wdLr9nicHqxKYgZpNehTxC
CAam4YFfADF3wK079Y6OMlsG2Gzyg9nErmzlSxpxyozpJdbKVyGMwpTc6y51XioW
htyQMPqG31lVCvYcuflQc4OIyImQ+9i/ldXLySoX6OhfxOP4AD7NlZgXwK8djGGI
S00Be+Y8bx2XYEHO20bp0YsGp8uy564UTtcKtjN0a9jpyIuxAXjK7CbvVGPYZ5kH
TZcPfPt6nI9XNkcZFiObk6NULWOw+zVOstF/90Gyk3U6+QTW8BK16qFidKoM8drZ
RxH4nwIkIYPwXSScyfLJ0g2322pm4g==
=A9ep
-----END PGP SIGNATURE-----

--aKM32XLfuHypoamq--


