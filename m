Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B5DF66E369
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 17:23:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHojY-00006i-8y; Tue, 17 Jan 2023 11:22:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pHojT-000060-GB
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 11:22:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pHojR-0005Lk-Ux
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 11:22:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673972561;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6bdcl2smhkDZVGHgw3VosgEyspzYgLmrfgH5NlnsPUc=;
 b=ZM9kaKjQJO2Nq0EQlxK+JXSu6AaZtsaH1o2DHu/EyUoZBJSfYuqRurc6POKY8mPbc5oGR6
 PysypzTEETWKEuxx9pMK74h5dfF7KYf+Y6sFeKswNDWTEUpjMpjbr7nGL69AOgG5QRTGKP
 ayN9xQ8Ed0q0lnz8ZHiSH7BQC/AwZFA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-139-2N6Pjm4cOmyccjV1ZruRAg-1; Tue, 17 Jan 2023 11:22:37 -0500
X-MC-Unique: 2N6Pjm4cOmyccjV1ZruRAg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1028B3843971;
 Tue, 17 Jan 2023 16:22:37 +0000 (UTC)
Received: from localhost (unknown [10.39.194.48])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7F8081121315;
 Tue, 17 Jan 2023 16:22:36 +0000 (UTC)
Date: Tue, 17 Jan 2023 11:22:35 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Cc: qemu-devel@nongnu.org, Warner Losh <imp@bsdimp.com>,
 Kyle Evans <kevans@freebsd.org>, Kevin Wolf <kwolf@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 0/3]  TSA: make sure QEMU compiles when using clang TSA
Message-ID: <Y8bLS3hynFInMFvb@fedora>
References: <20230117135203.3049709-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="/0RbbXU9uPmEKM09"
Content-Disposition: inline
In-Reply-To: <20230117135203.3049709-1-eesposit@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


--/0RbbXU9uPmEKM09
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 17, 2023 at 08:52:00AM -0500, Emanuele Giuseppe Esposito wrote:
> This serie aims to enable clang Thread Safety Analysis (TSA) in QEMU.

It's worth covering what TSA is and why it's useful:

Thread Safety Analysis "warns about potential race conditions in code.
The analysis is completely static (i.e. compile-time); there is no
run-time overhead"

"Thread safety analysis works very much like a type system for
multi-threaded programs. In addition to declaring the type of data (e.g.
int, float, etc.), the programmer can (optionally) declare how access to
that data is controlled in a multi-threaded environment. For example, if
foo is guarded by the mutex mu, then the analysis will issue a warning
whenever a piece of code reads or writes to foo without first locking
mu."

https://clang.llvm.org/docs/ThreadSafetyAnalysis.html

--/0RbbXU9uPmEKM09
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmPGy0oACgkQnKSrs4Gr
c8iW/wf/bgAz0lm4D52lwurS6tTLMzCmkPFTN2DfbI2RNytWAqP2ZA94afo7P8VJ
LYRl9q78URnMOYF4+241lKDtX+7PCjOWng/eaEAd8Zk+Uq923CPbyeWwPjYaYA1N
+piCht7o4IHoDFKpO6AlufPo9kqAd6IpPEGMEOY89PZvXqxPAlochIo6FfBb8/Eq
ge3yFheMCVzbkq2KLsqqt6jxGO7Yg409YSpDkFMaoJ2u1MM+TOjMGXr/zEHccQrm
59SaX5J0+fu4hJj4fwwS42vmwhIQo/3J49ZynVOvK6FPSyAdrzC63iabt8cmvfqc
x8drx1th+MrChkXPdL0IJ4xvdZbqWQ==
=kXHx
-----END PGP SIGNATURE-----

--/0RbbXU9uPmEKM09--


