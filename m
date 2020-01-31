Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C44A14F134
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Jan 2020 18:23:00 +0100 (CET)
Received: from localhost ([::1]:56878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ixa0R-0008QC-8g
	for lists+qemu-devel@lfdr.de; Fri, 31 Jan 2020 12:22:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33185)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefanha@gmail.com>) id 1ixZza-0007x3-56
 for qemu-devel@nongnu.org; Fri, 31 Jan 2020 12:22:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@gmail.com>) id 1ixZzZ-0000se-6k
 for qemu-devel@nongnu.org; Fri, 31 Jan 2020 12:22:06 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:41270)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <stefanha@gmail.com>) id 1ixZzY-0000qb-Vg
 for qemu-devel@nongnu.org; Fri, 31 Jan 2020 12:22:05 -0500
Received: by mail-wr1-x436.google.com with SMTP id c9so9562847wrw.8
 for <qemu-devel@nongnu.org>; Fri, 31 Jan 2020 09:22:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=yk3+W7sbap/tZdI3bg7dqQ8fV+ENIrbbwCwGfxjHnJM=;
 b=tR9N3wyfZ6fmfNQ5BCkiPlWa+T9rXADu1bJ3lEMLp5f18tNCALFW2UOYkMpq7lYddb
 Rl6NHWbAV+jOv8wv8cM5Wa9Zica29ShvzUUzrH6z/RaO5Xzv34ClaNaPfgkpIbGGxv9p
 B6WCGGpO33jD11/FY0mFayjz19R50BPDiKBxNY3kwBXDIiUyuwB2he53+DFXN2nI8o9p
 pSeJ8+J4lJ/nYPSIM9AmmwMRN9gIRrZWxbMUCrrlNaoTfbgGL9VfbltfLx27wfQXEVYL
 2izyjc+a1C+KwngMncQ886M/XEZn0NswkBosgbOEAUKfsoPc1Gr0nG9S5wa8VjQnWLtY
 /qlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=yk3+W7sbap/tZdI3bg7dqQ8fV+ENIrbbwCwGfxjHnJM=;
 b=FYP4WOxssDrmgMGGihm44G1GUxwrvrlXb9FxzNKqLdEEmrd938aYA/pZKi9uVSYA/L
 igtVMjoC018q+jfrzuHRiAs36b3vCStNu8SV+yKPXV+Vo1lpXUoSL/D3rV354Z1Vaib7
 8HuVAqTYn5erYVa9gXBqC1TSVRrD652BSZaHxBj4W8rMg0vAzG962CvM3Fp0xSK8hiJV
 R2kak0FGGwDzmXB5owVdtbovef4DdPLSiGiOx3eDNrBcHd9Gs1Itsrl2vRv3IVrTpcJq
 hXH02YqsVEv4JY8ocgiCnddkQ2kuU3ECVB7nSGgR6YmhgaPgNonPoeOxjO2Q26hoWQ/k
 5uRA==
X-Gm-Message-State: APjAAAXg1oa8gxM8Zxw0tZ6KfzEQMHKSE+AgN9JMJB3f5/tnWCdVx4JC
 jPPnLEstJsecBkitL076Kcs=
X-Google-Smtp-Source: APXvYqw8lp5yUApzmbfSfL2/pH0scOzf2lypyO7rS38fvY2I9qF6yk+WaI1NluydGSC7UF7KEU88nw==
X-Received: by 2002:adf:fd8d:: with SMTP id d13mr4440878wrr.208.1580491322640; 
 Fri, 31 Jan 2020 09:22:02 -0800 (PST)
Received: from localhost (229.227-241-81.adsl-static.isp.belgacom.be.
 [81.241.227.229])
 by smtp.gmail.com with ESMTPSA id y12sm11332057wmj.6.2020.01.31.09.22.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jan 2020 09:22:01 -0800 (PST)
Date: Fri, 31 Jan 2020 11:28:57 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Subject: Re: [GSoC/Outreachy QEMU proposal] Extend support for ioctls in QEMU
 linux-user mode
Message-ID: <20200131112857.GA4487@stefanha-x1.localdomain>
References: <CAL1e-=j5WJkV=X+KkfBuS3pjf6z3aJrtu4xpYeVbjEUYiWxxTQ@mail.gmail.com>
 <CAL1e-=ghxDLcU3iqkZ8q_sbk_DyR70t2a-jFtoNDVa7iTkMXsQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="LQksG6bCIzRHxTLp"
Content-Disposition: inline
In-Reply-To: <CAL1e-=ghxDLcU3iqkZ8q_sbk_DyR70t2a-jFtoNDVa7iTkMXsQ@mail.gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::436
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Stefan Hajnoczi <stefanha@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--LQksG6bCIzRHxTLp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jan 30, 2020 at 12:09:58PM +0100, Aleksandar Markovic wrote:
> Stefan, there was an idea in this thread that this project contributes
> (apart to QEMU) to another ooen source project (LTP). In my layman view,
> this is an advantage. But, how does that fit into GSoC/Outreachy rules?

That is fine for GSoC.  It will benefit the open source community and
the code being written will be under an approved open source license.

For Outreachy we focus on the QEMU codebase because the funding comes
for sponsors that may wish their donations to be used for QEMU
development.

Stefan

--LQksG6bCIzRHxTLp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl40D3kACgkQnKSrs4Gr
c8hu2Qf8CuNztOMmZmBtlDN7+pACnSEur9lgJHOm2cMWy/m5+CZHEcm96SEGCEtM
1ATvzmqx+BWVd+hnFCdMpLi9/HMjWjNczFwGUTOdKSr7GNpOyX7dCGjyXQIVcm1B
VdxLqgnbaUEjgtEXBQuPldw/MbQnAcGWJzw9RBGurWotuICJ22UqAZSda/i0pY/3
nOqF6w4jRylUjORmUPvrGYylAGfsGLI3IGDXSTwT/7UwzLaJAABPN1Nycfw9UwfA
wQ8reE0MP6ck0TML4qjFIkmztREPIcEIllAu2xx3NsDvWNhiBUutZ/ILZEXvvtZG
mTVQeEYG99mBrymicywf0cie7jBHaw==
=zVYX
-----END PGP SIGNATURE-----

--LQksG6bCIzRHxTLp--

