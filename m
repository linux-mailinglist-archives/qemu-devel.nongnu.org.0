Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 665C42645D
	for <lists+qemu-devel@lfdr.de>; Wed, 22 May 2019 15:12:25 +0200 (CEST)
Received: from localhost ([127.0.0.1]:43090 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hTR2e-0007lF-Jt
	for lists+qemu-devel@lfdr.de; Wed, 22 May 2019 09:12:24 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35103)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1hTR1H-000707-AL
	for qemu-devel@nongnu.org; Wed, 22 May 2019 09:11:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1hTR1G-00081l-EY
	for qemu-devel@nongnu.org; Wed, 22 May 2019 09:10:59 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:55573)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <stefanha@gmail.com>)
	id 1hTR1G-00080Q-7g; Wed, 22 May 2019 09:10:58 -0400
Received: by mail-wm1-x343.google.com with SMTP id x64so2175911wmb.5;
	Wed, 22 May 2019 06:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=l8PjHMWG28m7XxVbVF9tspuIer9Lsq213BitqiACdXc=;
	b=X52ao6y9djROcxRB6x3rlWn+RkFURU2D2IirQ7JLqICN2lliPp0mWbIe62EdT69le/
	P53p8XPypI/6kd7j2FxCQKJ4e+RiEdxSD0uMLRUVJbKx7wyuAVFn4JMP196X+hultryU
	h27YpGeu99obZSSS2lRY0l+U9uagQXaGufsEDWRMdhX9+emKjUgCEqyhxRXcCmOZtAw0
	a0caO7YnawHRuLRUXNd+HX5plwhoE30GL0ZswjgMQ9dir2EMDz15G8bxQbacZn4y/Y01
	9jhnDb0oXuipdXzQ2VAHGY9QD1dD4BDGpGRAex6QntPGIIcCI5W34jqdEFmZNPNzABw2
	NzNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=l8PjHMWG28m7XxVbVF9tspuIer9Lsq213BitqiACdXc=;
	b=UpPad+/AX+CLOXEOB0tTTGasMJXbyXSzlhC3TmiXdbsDQRLyNJJqd0BdFodj9OpgwB
	YzmSWNDojgH/jlwuZpzujDTGU9CV+w49uMtxJY23GLOuMvfHj796AllEFKfZ2UUq9hRl
	VF1rbtq2sR3zK/1W9mDiuTCI0lVlz852ufLp6dKd79zhZ1ekZ1kc2NQkXtBkmNJxdb2h
	wBYZIArWv1stYKPu9y6GzGGSCS3UpemUddopEKN7HQyBlI7wQEX+Po0ChKsmghAtQ/FK
	gduD4oH5IyeAa+XWGf85fMQsguLpJK2KgHZ10xCbH1HcA1jrQm4qct6bSYxYUOBeNW9u
	iFbQ==
X-Gm-Message-State: APjAAAUbxGZipPfWODwBax9hBZZexqKb+VXTaFPd79638L9L7E2D/ISs
	Hm9THaUtMWUbd4BmVl7eDaI=
X-Google-Smtp-Source: APXvYqxrh+f21huGlm8ZUGDBEgLviw4mFZl1IVm9nm0vewj956Ev5BYx1MMFyXU8oausFgPOLv4RmQ==
X-Received: by 2002:a1c:8004:: with SMTP id b4mr7596283wmd.79.1558530657150;
	Wed, 22 May 2019 06:10:57 -0700 (PDT)
Received: from localhost ([51.15.41.238])
	by smtp.gmail.com with ESMTPSA id h6sm3136721wrm.47.2019.05.22.06.10.55
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 22 May 2019 06:10:55 -0700 (PDT)
Date: Wed, 22 May 2019 14:10:55 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Aarushi Mehta <mehta.aaru20@gmail.com>
Message-ID: <20190522131055.GK27900@stefanha-x1.localdomain>
References: <20190521235215.31341-1-mehta.aaru20@gmail.com>
	<20190521235215.31341-5-mehta.aaru20@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="sU4rRG038CsJurvk"
Content-Disposition: inline
In-Reply-To: <20190521235215.31341-5-mehta.aaru20@gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::343
Subject: Re: [Qemu-devel] [RFC PATCH 4/9] stubs: add aio interface stubs for
 io_uring
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: saket.sinha89@gmail.com, Stefan Hajnoczi <stefanha@redhat.com>,
	Julia Suvorova <jusual@mail.ru>, qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--sU4rRG038CsJurvk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 22, 2019 at 05:22:10AM +0530, Aarushi Mehta wrote:
> Signed-off-by: Aarushi Mehta <mehta.aaru20@gmail.com>
> ---
>  stubs/Makefile.objs |  1 +
>  stubs/io_uring.c    | 32 ++++++++++++++++++++++++++++++++
>  2 files changed, 33 insertions(+)
>  create mode 100644 stubs/io_uring.c

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--sU4rRG038CsJurvk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAlzlSl4ACgkQnKSrs4Gr
c8iviwgArpQhabuOd/u7mqXfMi/Sj8fYEemAHvibH2Y5uaaYQdPyMQBqZLRgsJKn
xHvszioMrxJezvvoAhY6cnE5DCvblkEAJwFajJs7LGxFMhtI4aZfXdP5vlc0UQ3s
mF+TghADC+GsZKkU2ga5qd/2zXoFRJbLprcZGw1fwXt8FPx1X+9ATKu91tQk0/Al
8c5FlIz1XM+QVCHyvZW9wul++ctB3X9iDzNqmm5JviG0K+HvlOwpw1RxazEeG5Mu
B4HgirBYw/BzBE7aXEz8J/gq7LbDzKCLcAIyxTsRPOa6egdKanb1CEprW8OjgPFP
pkAPNQUik3LSAa6hqOOe7UOEbPg6rA==
=NoLO
-----END PGP SIGNATURE-----

--sU4rRG038CsJurvk--

