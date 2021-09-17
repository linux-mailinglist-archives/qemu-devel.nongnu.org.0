Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 789C540FD6F
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 17:58:16 +0200 (CEST)
Received: from localhost ([::1]:35690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRGFj-00062A-1P
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 11:58:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mRGDx-0005A9-8w
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 11:56:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37588)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mRGDs-0000ka-VI
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 11:56:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631894179;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZTNxZB0jK+eUy2jyHRaWda0Y4jurIL8j9+KZMScI8rY=;
 b=HRCzqQIYBUg0eyZ9b9M/eZAUhvaOK46P0EODEFpGZQ4Y5OBQ4bejfed4JQsKudxx6TGbY7
 qnHlyCBRhErLP/R1tK90Jd/76zjRDtRKrDCVkM/T6a/dU1/s5SuM7ow1ODviqajNrQsYfJ
 9bOWKwA0DoOoX3DNqNodwr7aJD2XQOQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-38-bFDBb15EMUm4vZbUt4PCLA-1; Fri, 17 Sep 2021 11:56:17 -0400
X-MC-Unique: bFDBb15EMUm4vZbUt4PCLA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7D829835DE3;
 Fri, 17 Sep 2021 15:56:16 +0000 (UTC)
Received: from localhost (unknown [10.39.194.234])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6EDB15C1A1;
 Fri, 17 Sep 2021 15:56:03 +0000 (UTC)
Date: Fri, 17 Sep 2021 16:56:02 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: Rust in Qemu BoF followup: Rust vs. qemu platform support
Message-ID: <YUS6kp0l7eiHt/fu@stefanha-x1.localdomain>
References: <YURYvaOpya498Xx2@yekko>
 <CAAdtpL5W9eztLiPSu=goROh8eHMn+7BLUuKaEfukcVrKCEAtXg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAAdtpL5W9eztLiPSu=goROh8eHMn+7BLUuKaEfukcVrKCEAtXg@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="2WSGO6lPA+XFVzNm"
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Sergio Lopez <slp@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>, hreitz@redhat.com,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--2WSGO6lPA+XFVzNm
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 17, 2021 at 01:11:56PM +0200, Philippe Mathieu-Daud=E9 wrote:
> Le ven. 17 sept. 2021 10:58, David Gibson <david@gibson.dropbear.id.au> a
> =E9crit :
>=20
> > Hi all,
> >
> > At the qemu-in-rust BoF at KVM Forum, I volunteered to look into
> > whether Rust supported all the host/build platforms that qemu does,
> > which is obviously vital if we want to make Rust a non-optional
> > component of the build
> >
>=20
> Could user mode emulation be impacted by this decision? What code used by
> user emulation could potentially be converted to Rust?

qemu-user does not have the same security requirements as qemu-system,
since the application is running under a given uid/gid on the host
system and can invoke system calls.

I think the benefits of Rust in qemu-user would be more around
expressiveness (language constructs like pattern matching, traits, etc)
and correctness (memory leaks, concurrency, etc). Both benefits might
motivate someone to write parts of qemu-user in Rust, so I guess the
answer is "all of it potentially could be converted". It's impossible to
know until someone contributes patches.

Stefan

--2WSGO6lPA+XFVzNm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmFEupIACgkQnKSrs4Gr
c8iaswf7BAvChaRprLZpLVJvdtWinfw2nhT/T0Y/ai4U7qQHNJBJ56JDtt6FwUee
vWUzS6ZboW+rqWMnJps/htPEOHotKVasauD/LzGXpY5gpPUFZILmPT0OUfwrObic
u9EMncK5aFzZd/MUFMfRX6v2Gpasg1T/9+IMr93ipcrkoRyAbFKE7vgH3jTUQUWo
fRQceccpZtp52zmAab0X9uXU3uNnMEd2Con/avQdwz6IAcLxhv89eeEC5RM1Zj5N
HWN5FqCd3IjDKf9OlMhH/9XXl0clsMubkRLQnJYmNePbqBbVvKeT3XIBfyP5SFyb
xRM8nCMcFt+8yo9e27chmUG0s1ZcsA==
=064X
-----END PGP SIGNATURE-----

--2WSGO6lPA+XFVzNm--


