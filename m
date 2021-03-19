Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05EA534187C
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 10:36:08 +0100 (CET)
Received: from localhost ([::1]:36080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNBY7-0000Py-2O
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 05:36:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lNBVv-0007sj-Hm
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 05:33:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:46775)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lNBVu-0002OW-2n
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 05:33:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616146428;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uLZxcHYoqlIrkuFbaEtdJlkDKXZwaX67cA3AJMlqaTY=;
 b=huA0wZ61aFrEH4ffk1+a/FVOpYXFl8nTjBR7wfggvXS5WfaUjEnIGBxGYh1y4AczdN450s
 m+O9xZoBxjzNm+d7r9L5rW7KNyKbGlU/APH1Mn2NIuvxyBb1h2+B8V0UGHhpvLuH4G+sro
 CC2K//HcGRN0S27fOsT7FGezF9sbobQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-498-u6XhO1_-O9KPT0rCWLyhEw-1; Fri, 19 Mar 2021 05:33:46 -0400
X-MC-Unique: u6XhO1_-O9KPT0rCWLyhEw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 017CD190A7B4;
 Fri, 19 Mar 2021 09:33:44 +0000 (UTC)
Received: from localhost (ovpn-112-193.ams2.redhat.com [10.36.112.193])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 925DC6EF48;
 Fri, 19 Mar 2021 09:33:44 +0000 (UTC)
Date: Fri, 19 Mar 2021 09:33:43 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: Serious doubts about Gitlab CI
Message-ID: <YFRv9zMvBXtpfN3t@stefanha-x1.localdomain>
References: <cb9d0504-aba5-3114-d121-694a5247764c@amsat.org>
 <YFOt+R77HfpNEYFc@stefanha-x1.localdomain>
 <2d1e40c6-5fa4-271f-5ecc-74da7c04ffea@redhat.com>
MIME-Version: 1.0
In-Reply-To: <2d1e40c6-5fa4-271f-5ecc-74da7c04ffea@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="JjEmmKt0Nd7U3bcF"
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
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
 "Daniel P . Berrange" <berrange@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 qemu-devel <qemu-devel@nongnu.org>, Cleber Rosa <crosa@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--JjEmmKt0Nd7U3bcF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 18, 2021 at 09:30:41PM +0100, Paolo Bonzini wrote:
> On 18/03/21 20:46, Stefan Hajnoczi wrote:
> > The QEMU Project has 50,000 minutes of GitLab CI quota. Let's enable
> > GitLab Merge Requests so that anyone can submit a merge request and get
> > CI coverage.
>=20
> Each merge request consumes about 2500.  That won't last long.

Yikes, that is 41 hours per CI run. I wonder if GitLab's CI minutes are
on slow machines or if we'll hit the same issue with dedicated runners.
It seems like CI optimization will be necessary...

Stefan

--JjEmmKt0Nd7U3bcF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmBUb/cACgkQnKSrs4Gr
c8jzIwgAurDKWegMdooiNXQdwfR9eUF8gIqxmifWgzCSCPxXfzzLgCEh3KWlDAEe
Do8QlA6FpkVuusbjsTcV6dXlLZN9vXlthQPtRSnJgDaxJvJr+j/gLsHxyBHDMRhA
2sTwFIv0479zPFA5ybdLKw744xCTKmkVGl67+AAMTKPHXQ3YN4L4ArbBK8le9FBN
sWZOq5vWWvhPkhk8LGHQCo1LhzWNMmi06R6wK7PFWqa5hJG6Ihzgt6BdTHc58JI6
mzjQ3dNoeSGg/F17WZqb0F/OsUBf1cJus60KLeQMFYjPEYklw5lgi03h21pzrXa/
6CmdIMAxOCwXy+vY4q46cLqCgiUQew==
=vUtL
-----END PGP SIGNATURE-----

--JjEmmKt0Nd7U3bcF--


