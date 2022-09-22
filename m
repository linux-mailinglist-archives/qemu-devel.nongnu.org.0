Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED5255E6B7B
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 21:07:58 +0200 (CEST)
Received: from localhost ([::1]:33018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obRYE-0004Pr-1a
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 15:07:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1obRUq-0006gc-6c
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 15:04:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40813)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1obRUm-0001ea-RE
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 15:04:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663873463;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=Lh7W15735NJHMU47sKYHQK736fDhADoa//9uWu+HNYQ=;
 b=XylLAauvOb/blIhXU+L/84QpnlqFqq1AcPu5VQZu+ojLBXEdJL7V/rqJIX7kou+wVQliVY
 aLTR0rnbFvV+yN+fGwTE2sXtKLdTd6aO9cC+kJoq1fVmgStVITeV3yHLKe+Qjg8cHi7GJP
 NE6yifl8fcTixCCD1ImCv0U+BLClqos=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-193-9ln9LDObN1-1W-JkKG-rxQ-1; Thu, 22 Sep 2022 15:04:16 -0400
X-MC-Unique: 9ln9LDObN1-1W-JkKG-rxQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1E4793C0F681;
 Thu, 22 Sep 2022 19:04:16 +0000 (UTC)
Received: from localhost (unknown [10.39.192.25])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F092BC15BA4;
 Thu, 22 Sep 2022 19:04:14 +0000 (UTC)
Date: Thu, 22 Sep 2022 15:04:12 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: thuth@redhat.com,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Cc: qemu-devel@nongnu.org
Subject: Inscrutable CI jobs (avocado & Travis s390 check-tcg)
Message-ID: <YyyxrNp+5XrmLi1Y@fedora>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="fxxtQCJKWdROyIC7"
Content-Disposition: inline
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--fxxtQCJKWdROyIC7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

QEMU's avocado and Travis s390x check-tcg CI jobs fail often and I don't
know why. I think it's due to timeouts but maybe there is something
buried in the logs that I missed.

I waste time skimming through logs when merging qemu.git pull requests
and electricity is wasted on tests that don't produce useful pass/fail
output.

Here are two recent examples:
https://gitlab.com/qemu-project/qemu/-/jobs/3070754718
https://app.travis-ci.com/gitlab/qemu-project/qemu/jobs/583629583

If there are real test failures then the test output needs to be
improved so people can identify failures.

If the tests are timing out then they need to be split up and/or reduced
in duration. BTW, if it's a timeout, why are we using an internal
timeout instead of letting CI mark the job as timed out?

Any other ideas for improving these CI jobs?

Thanks,
Stefan

--fxxtQCJKWdROyIC7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmMssawACgkQnKSrs4Gr
c8h9KQf/dXAZ+dFtvFr+F2Y0d85JD0amNim4rP9j9e12kTO75ySjE1Kqq+F2AcvS
xjNr64uLvT6sql+mk8WJHsjPnI68Elb6vw0f4+K7kTP2o1mQNcwLsG+SRqfaEqWb
YRmU8KryO1Q28NLgtrVO8dStytJwlCTPNfIVBhFtbCjIPhESNjXuq7e8KA9mLXkd
KacPD9/vZl/Cu4ojG9zMyL2ycXc08fJ+CWEJZeRZaKTjyL8popZGOPu8x0E3HKNi
ZanzR+j5BUITlXyrCnDrR3ofLAiaehpHMVVTPUEoNRUm2IPONNb/50Aq0avVrOf+
x+KucYJRggQ2w3PIefyGQJ2x+Z8X7Q==
=zgwS
-----END PGP SIGNATURE-----

--fxxtQCJKWdROyIC7--


