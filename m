Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B3B046FF0C
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Dec 2021 11:52:30 +0100 (CET)
Received: from localhost ([::1]:34348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvdVt-0004qM-KS
	for lists+qemu-devel@lfdr.de; Fri, 10 Dec 2021 05:52:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jtomko@redhat.com>) id 1mvdUl-0002v4-RZ
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 05:51:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46687)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jtomko@redhat.com>) id 1mvdUh-0001V3-96
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 05:51:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639133474;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lm6Y2iS1Yy0UtJTMyphkV97A/gwh+Vjw4+xtIg/5uC4=;
 b=HBwS28L+myTrTdR43mSHpunsTnv5sq+fvcQVtkcX7VfJVfYmoRmSMo3FKUi0lICLO9/bvI
 tCljrJNobX8p270KoGp1bbTQgQsNHd4gsmE0lHhscMLFShSAZ63ASCzhLdjP7XL1Z26h9K
 jPMKZQcY+a8AECKUSnzLZKbaeptoBvQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-592-BJSt7i6dPCitbcSCrB4nMw-1; Fri, 10 Dec 2021 05:51:11 -0500
X-MC-Unique: BJSt7i6dPCitbcSCrB4nMw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3599534787;
 Fri, 10 Dec 2021 10:51:10 +0000 (UTC)
Received: from fedora (unknown [10.40.193.61])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E360E10013D0;
 Fri, 10 Dec 2021 10:51:08 +0000 (UTC)
Date: Fri, 10 Dec 2021 11:51:05 +0100
From: =?iso-8859-1?B?SuFu?= Tomko <jtomko@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Subject: Re: [RFC PATCH] blog post: how to get your new feature up-streamed
Message-ID: <YbMxGUTa6uqU3ydt@fedora>
References: <20211126203319.3298089-1-alex.bennee@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20211126203319.3298089-1-alex.bennee@linaro.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jtomko@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Vw3A40oDmxARJ64w"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jtomko@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.619,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: pbonzini@redhat.com, thuth@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Vw3A40oDmxARJ64w
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On a Friday in 2021, Alex Benn=E9e wrote:
>Experience has shown that getting new functionality up-streamed can be
>a somewhat painful process. Lets see if we can collect some of our
>community knowledge into a blog post describing some best practices
>for getting code accepted.
>
>[AJB: obviously RFC for now, need material for the end]
>
>Signed-off-by: Alex Benn=E9e <alex.bennee@linaro.org>
>---
> ...26-so-you-want-to-add-something-to-qemu.md | 100 ++++++++++++++++++
> 1 file changed, 100 insertions(+)
> create mode 100644 _posts/2021-11-26-so-you-want-to-add-something-to-qemu=
.md
>
>diff --git a/_posts/2021-11-26-so-you-want-to-add-something-to-qemu.md b/_=
posts/2021-11-26-so-you-want-to-add-something-to-qemu.md
>new file mode 100644
>index 0000000..d38c0ca
>--- /dev/null
>+++ b/_posts/2021-11-26-so-you-want-to-add-something-to-qemu.md

[..]

>+The maintainers path
>+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>+

[..]

>+I won't pretend there isn't some commitment required when becoming a
>+maintainer. However if you were motivated enough to write the code for
>+a new feature you should be up to keeping it running smoothly in the
>+upstream. The level of effort required is also proportional to the
>+popularity of the feature - there is a world of difference between
>+maintaining an individual device and a core subsystem. If the feature
>+

Unfinished sentence.

>+Practically you will probably want to get yourself a
>+[GitLab](https://gitlab.com/qemu-project/qemu/-/blob/master/MAINTAINERS)
>+account so you can run the CI tests on your pull requests. While
>+membership of `qemu-devel` is recommended no one is expecting you to
>+read every message sent to it as long as you look at those where you
>+are explicitly Cc'd.
>+
>+Now if you are convinced to become a maintainer for your new feature
>+lets discuss how you can improve the chances of getting it merged.
>+

* let's

Jano

--Vw3A40oDmxARJ64w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEE7DTm0WabvfIr7YZ4Ak1z5KIMl5QFAmGzMRQACgkQAk1z5KIM
l5QlqQf/QY9CGNFeiTBOHPDMyb/0FlaJyIc/26+7veppXX2wKNodXhkA6jEOABLc
LqbWl4dLWHBgvkCtQHFwPpcjCdzSPuqWG9oAvkT3LAUgALAnTBr+5sagTzy/eRzq
WduToFp/jhEToyote4L0lyuCgxcZ5BIXc8mJT2WzLD+z8T11yZJT+aRU0F8XimGD
4zZP/oCJw6tyiE59EMDagiIYwY1YCm3RNHZ//0lU3jTqCkNa+qLo0s6NH1waM6L7
fYqcl026FCuXpf5BH7iKT0gm4x79R6msOlf8XDGL5f4LMT6wcZcL9jOrn/g66T3L
j8X/93FPJ5S5T90krdv9yBL1yjfXhQ==
=QaFI
-----END PGP SIGNATURE-----

--Vw3A40oDmxARJ64w--


