Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A45574CAC27
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 18:33:37 +0100 (CET)
Received: from localhost ([::1]:42468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPSr2-0006yu-HB
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 12:33:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1nPSqA-00067O-Mb
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 12:32:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29302)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <slp@redhat.com>) id 1nPSq9-0004ny-As
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 12:32:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646242360;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1USmVjxTTYdc7rMUiqrUNWQcVO4SlzVz/zIrE4siUEI=;
 b=XroDjJ2qrDHSS05jGu8W5my4Egmxemzx02og/dF2hYgKFj/DqT2Ea+8c9nkYp7skTHKVRU
 XzK1qOeKBTZgkz2ON8NH9s5n0LC+jrwNCwJhYlOQ6SBno/HeGatwKSv6ahHIuHzHV336g6
 oQ3AGcXCi8CULA3mTRKLxQ1MCFaj03M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-380-n-ihYirbN3STB5InILhdVg-1; Wed, 02 Mar 2022 12:32:36 -0500
X-MC-Unique: n-ihYirbN3STB5InILhdVg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BCF1C1006AA6;
 Wed,  2 Mar 2022 17:32:33 +0000 (UTC)
Received: from localhost (unknown [10.33.36.14])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E0D43838DD;
 Wed,  2 Mar 2022 17:31:26 +0000 (UTC)
Date: Wed, 2 Mar 2022 18:31:46 +0100
From: Sergio Lopez <slp@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH 2/2] Allow building vhost-user in BSD
Message-ID: <20220302173009.26auqvy4t4rx74td@mhamilton>
References: <20220302113644.43717-1-slp@redhat.com>
 <20220302113644.43717-3-slp@redhat.com>
 <66b68bcc-8d7e-a5f7-5e6c-b2d20c26ab01@redhat.com>
 <8dfc9854-4d59-0759-88d0-d502ae7c552f@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="j2z2ayxxgw7ingtg"
Content-Disposition: inline
In-Reply-To: <8dfc9854-4d59-0759-88d0-d502ae7c552f@gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Received-SPF: pass client-ip=170.10.133.124; envelope-from=slp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jagannathan Raman <jag.raman@oracle.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, qemu-block@nongnu.org,
 David Hildenbrand <david@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, vgoyal@redhat.com,
 Eric Farman <farman@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-s390x@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 John G Johnson <john.g.johnson@oracle.com>, Cornelia Huck <cohuck@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--j2z2ayxxgw7ingtg
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 02, 2022 at 06:18:59PM +0100, Philippe Mathieu-Daud=E9 wrote:
> On 2/3/22 18:10, Paolo Bonzini wrote:
> > On 3/2/22 12:36, Sergio Lopez wrote:
> > > With the possibility of using pipefd as a replacement on operating
> > > systems that doesn't support eventfd, vhost-user can also work on BSD
> > > systems.
> > >=20
> > > This change allows enabling vhost-user on BSD platforms too and
> > > makes libvhost_user (which still depends on eventfd) a linux-only
> > > feature.
> > >=20
> > > Signed-off-by: Sergio Lopez <slp@redhat.com>
> >=20
> > I would just check for !windows.
>=20
> What about Darwin / Haiku / Illumnos?

It should work on every system providing pipe() or pipe2(), so I guess
Paolo's right, every platform except Windows. FWIW, I already tested
it with Darwin.

Thanks,
Sergio.

--j2z2ayxxgw7ingtg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEvtX891EthoCRQuii9GknjS8MAjUFAmIfqgEACgkQ9GknjS8M
AjVb0Q/9Ht01R3I6wyyF8s7Xj1AMRR47qpVaBaP4gAuLPEHt/tesSX6bq5vtiN4K
Yg/0QPlVRz/l/MBcqdqAVcH39OBnx7WfIF4Op/RGkLtI2v2vVFVUZbU+rpOvRLD3
bq1ZNunvYibzTf0aWquIdzULJsCzQUNeNfgziievgeh/oCNlSSOkEbk8szCFVy4/
LDvbd2qoSzcVxt9qRCeXyaugdlBsv6dp3qZBfTstU11uFg9OV6nBukMGnf4eTH/S
8w/M+iNAsr2vzDaOlKtXG8KS1mvUo0bm1pExzSIVEbweK/cpLlJP12txswCoibwJ
YOyY3vGsiQs5QM0eV8ShQkuv8TQrjaUjyOFR10kKwytdWnvL8N69yetSnwgaoQVB
cTyhMqON5/wkHwnGOJVZrGyRvRDGbmkLnfbQlX583XyV1A+wYxlsPnhoJN2Nifwg
0tJbj5EptgrZXfwz+qziwkrWLreDAN4R99QYL0Dp6XIeVwxQ1UXTY/cIDdFYehyb
ZrItawbHFgkJ3lhCFJtIYX/QGv9lpZE5O8ylJ0BkSVUalImfTPNIoH8hzTXbKXIP
BhUvnXI/Gu8+oj3WQaTxmaEsZyzh1TNnqGs6nVIhKhypqQLQ1Bb4hZCJ/0XhDTaP
E49Qr/BL1BKZIOfyB5p3kud5vkF9gplF1L+Zmb71dK9ZUvp5iAc=
=A4cA
-----END PGP SIGNATURE-----

--j2z2ayxxgw7ingtg--


