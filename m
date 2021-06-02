Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2310139854E
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 11:30:47 +0200 (CEST)
Received: from localhost ([::1]:43966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loND4-00029Q-8X
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 05:30:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1loN8Z-0003lH-Tt
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 05:26:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40988)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1loN8Y-0008Rd-D6
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 05:26:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622625965;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dqIwZI6j3wjDsyZo/QTnJ1S581QkPKmj8Cig5ZgetNw=;
 b=b8msfbWvgsnOF+LhCdd0N0LHcbLmO+RoqI8cymVH2XMPIaDED3H21fnD99W4K55cMn0168
 +30R7qph4XYJc0nP6TIDZa1UC1GKffV0IgX1Vu0AYdHsubNi7FYeSpENGu1UDUd6rPI4TF
 uEMveCQvZzFYGZIy3j1qkQV53FqcGSc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-371-ON0sqhKKO3CQ4LPsLKeUWQ-1; Wed, 02 Jun 2021 05:26:01 -0400
X-MC-Unique: ON0sqhKKO3CQ4LPsLKeUWQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C98511020C41;
 Wed,  2 Jun 2021 09:26:00 +0000 (UTC)
Received: from localhost (ovpn-114-228.ams2.redhat.com [10.36.114.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6D7A01002EF0;
 Wed,  2 Jun 2021 09:26:00 +0000 (UTC)
Date: Wed, 2 Jun 2021 10:25:59 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v2 2/2] GitLab: Add "Feature Request" issue template.
Message-ID: <YLdOp4JBVEWJmJgH@stefanha-x1.localdomain>
References: <20210521173818.255817-1-jsnow@redhat.com>
 <20210521173818.255817-3-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210521173818.255817-3-jsnow@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="aKof4ZCWOqRqc13z"
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
 Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--aKof4ZCWOqRqc13z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 21, 2021 at 01:38:18PM -0400, John Snow wrote:
> Based on Peter Krempa's libvirt template, feature.md.
>=20
> CC: Peter Krempa <pkrempa@redhat.com>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  .gitlab/issue_templates/feature_request.md | 32 ++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
>  create mode 100644 .gitlab/issue_templates/feature_request.md

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--aKof4ZCWOqRqc13z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmC3TqcACgkQnKSrs4Gr
c8goHwf+I5dK935jO0MswAdx6RdlDF1KHzxuNcQBE0O/BT3pJyvVcgH1PCLpyn7F
tlKLEQhreuj1P++K27zUBsFw0e8nfN7QVzFXxAV+aX4ecJH9iLySi5B2ErdTwmlD
hsBy8NHTbIRK3QZ90TucBTBRkiMRXtOZ6wFvwBz/2/zlIyGFU9Qtz1n3/7/5o8w9
EhlYX7JecPIPP1Vw1ujudv8nkb8LDCHZN1i2YFFqmiVN+ETrGyMmpFnBPzlURdPd
uU++reoCeSw6zfky8p6LGK9aswXb05n2o7q08vYKShRCF6Ybt+NsHHWcM/hxy6gE
pjKDdcPgjQa/x6lt5JbVu+TbY8ZzMQ==
=0eWQ
-----END PGP SIGNATURE-----

--aKof4ZCWOqRqc13z--


