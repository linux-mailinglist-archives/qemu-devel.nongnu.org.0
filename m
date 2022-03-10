Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 833374D50C8
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 18:43:46 +0100 (CET)
Received: from localhost ([::1]:34436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSMpF-0004Pp-DX
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 12:43:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nSMo1-0003W7-GT
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 12:42:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55956)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nSMo0-0007KV-3H
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 12:42:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646934147;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ibyVEyhaR0rB+63+9AYTQaox4aoDFxKVSv2X4cyEZ04=;
 b=Xs8LtuTrtdxnJzvz0LJHOS84XwhlDYwUCMvmOVDHUhqVNe+z+q0mMkIv6QqMrjRpmNDdX3
 hK2S0cWferbcAg36K42+1oyBINrXIBXUs/0o1ZoeRrTv26cxmpRbifc+rbS0lDqSRHX5I9
 T45Cl9lQ+zjGsC9xcOblWmu8+JBD9Kw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-275-ZRKJdEpANN2Dd-eyqoA26g-1; Thu, 10 Mar 2022 12:42:23 -0500
X-MC-Unique: ZRKJdEpANN2Dd-eyqoA26g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C15171091DA0;
 Thu, 10 Mar 2022 17:42:22 +0000 (UTC)
Received: from localhost (unknown [10.39.195.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2899184798;
 Thu, 10 Mar 2022 17:42:20 +0000 (UTC)
Date: Thu, 10 Mar 2022 17:42:19 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH experiment 00/35] stackless coroutine backend
Message-ID: <Yio4e3FyFHkaZi0B@stefanha-x1.localdomain>
References: <20220310124413.1102441-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="SHVawIQk0GkI/eUj"
Content-Disposition: inline
In-Reply-To: <20220310124413.1102441-1-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: hreitz@redhat.com, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 sguelton@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--SHVawIQk0GkI/eUj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 10, 2022 at 01:43:38PM +0100, Paolo Bonzini wrote:
> Here is an experiment with using stackless coroutines in QEMU.  It
> only compiles enough code to run tests/unit/test-coroutine, but at
> least it proves that it's possible to quickly test ideas in the
> area of coroutine runtimes.  Another idea that could be toyed with
> in a similar manner could be (whoa) C++ coroutines.
>=20
> As expected, this also found some issues in existing code, so I
> plan to submit patches 1-5 separately.
>=20
> The new backend (which is the only one that works, due to the required
> code changes) is in patch 7.  For the big description of what stackless
> coroutines are, please refer to that patch.
>=20
> Patches 8-11 do some initial conversions.  Patch 12 introduce some
> preprocessor magic that greatly eases the rest of the work, and then
> the tests are converted one at a time, until patch 27 where the only
> ones missing are the CoRwlock tests.
>=20
> Therefore, patches 28-33 convert CoRwlock and pathces 34-35 take care
> of the corresponding tests, thus concluding the experiment.

Nice, the transformation is clear. It's simpler than Continuation
Passing Style transform because the loops and if statements remain
unmodified. This is a big advantage with the Duff's device-style
approach.

There are a lot of details to decide on in the translator tool and
runtime to optimize the code. I think the way the stack frames are
organized in this patch series is probably for convenience rather than
performance.

Out of curiousity, did you run the perf tests and compare against
ucontext?

Stefan

--SHVawIQk0GkI/eUj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmIqOHsACgkQnKSrs4Gr
c8hxyQgAl/ZgCEXdg1jyZwt0+I8OqXIBTbVxwUwfS2/fyt5C5n8NSrvcETrWtlFc
9v/gIlbiMEnn9Bqo0IyvDV84rMGJj+8mpMZP/FjSvGJzk7ePJJ6N1UtqrI+KWs8f
Jg/4diXeGDHy5h6jqVMtKEsqIG5OwqLfIRdWoFQmDsju/WH5clCDJ5JVc9si9443
cmZkWdnpZrRVQ60KMmHJf6wcFEVs04XGwllTyICReGWLHTzIbPGlXVS/RymzWJeO
iwUM0dcsfuiJjvef1WH34Umv/WwYITZk1cGXeAONTyrwqR2HHrsGmk2rqq8w9raf
EppTuYvC46S0oy2mz4p/Zaf5s8ZWwQ==
=HbQV
-----END PGP SIGNATURE-----

--SHVawIQk0GkI/eUj--


