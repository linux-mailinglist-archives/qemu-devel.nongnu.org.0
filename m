Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 678F3874D1
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Aug 2019 11:05:30 +0200 (CEST)
Received: from localhost ([::1]:57460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hw0q1-0006Uf-LI
	for lists+qemu-devel@lfdr.de; Fri, 09 Aug 2019 05:05:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44329)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <stefanha@gmail.com>) id 1hw0pF-00064s-6s
 for qemu-devel@nongnu.org; Fri, 09 Aug 2019 05:04:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@gmail.com>) id 1hw0pE-0006XT-7n
 for qemu-devel@nongnu.org; Fri, 09 Aug 2019 05:04:41 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:44931)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <stefanha@gmail.com>) id 1hw0pE-0006WD-0i
 for qemu-devel@nongnu.org; Fri, 09 Aug 2019 05:04:40 -0400
Received: by mail-wr1-x443.google.com with SMTP id p17so97507787wrf.11
 for <qemu-devel@nongnu.org>; Fri, 09 Aug 2019 02:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=WgQ2B39Wnr7SVMpckGQ/VtnmwBDdI/Q5p+4YfbiKwWM=;
 b=D+znzyqwr+wHUOtyJpcWrnvXZcQRJsyhILY/HoSvj9EoYzHOvQJ3w5CfDWTjkbebhD
 7+wAiRbEBrOGVvsMTChKFTOwLN/BEYopKNxCrIaOJ7xXbXGhHOmjgRaqrKDpRfNh3Uqy
 +xKP9d1U3YaIZ6kvujJ3mOm16mIAAq96FKRSNzd5mRXjLtY0Yv58lWbmzf90v2+nrryE
 +P2FLxSck+o/ooduGRmp5S5rwbzQaWukXRnzzSDaTxy8PwgFvsoj1i5EHHGsOW4lqMfy
 ddp+VWN78SLlDmfREm30/jRANUrB2qI/EG8PUStvZQp66Bn7mJh8AAi+29MZ/wEfmJwz
 6bKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=WgQ2B39Wnr7SVMpckGQ/VtnmwBDdI/Q5p+4YfbiKwWM=;
 b=RwRK3uxVpd9vXzjOzJanHtdkkohM9tiMgn56rXB62YcVgcp4pEMUSwFEMq7GfLcdXc
 H23ss3dVkFocIBgSMf3qvUdRDNUPZtF6jixQ+Eakae/vkh4s081anvPsQxjsKIle1Gde
 M10b/zcXSfFT7KvaQeC/TNKubIfc4rm3y0TMhU9bvDIR8/UOx+VA8jkHFxNPg8L8uqac
 S/4ECa9tsrj84m8MU8/09TD+39PdC/0erfnfZqYULr9znPqwK8AWlUXkY5cYj+lGWOV2
 A4DKa8Ocvt86648NWshl/Js9CTU1pfeWTIa+4SfDFmBJVliJNSKzHMKtf0maNOD3wJvR
 sY5A==
X-Gm-Message-State: APjAAAUK6/MRwFGFKu67uTCwoX2EK+dhU/wOOeBvTaoDjtSDhwfg3wr1
 7hZGBt4/hpsE7qj4FacSqL8=
X-Google-Smtp-Source: APXvYqzxSi2AZMl9ULhUtAuRaaYUPP1zkOyZYcCjBem/XrMYrDlAK8fNZmjXGMVS7x2T6njQdH71xg==
X-Received: by 2002:adf:eacf:: with SMTP id o15mr23651586wrn.171.1565341478853; 
 Fri, 09 Aug 2019 02:04:38 -0700 (PDT)
Received: from localhost ([51.15.41.238])
 by smtp.gmail.com with ESMTPSA id o4sm3808020wmh.35.2019.08.09.02.04.37
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 09 Aug 2019 02:04:38 -0700 (PDT)
Date: Fri, 9 Aug 2019 10:04:36 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: "Oleinik, Alexander" <alxndr@bu.edu>
Message-ID: <20190809090436.GG25286@stefanha-x1.localdomain>
References: <20190805071038.32146-1-alxndr@bu.edu>
 <20190805071038.32146-5-alxndr@bu.edu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="GUPx2O/K0ibUojHx"
Content-Disposition: inline
In-Reply-To: <20190805071038.32146-5-alxndr@bu.edu>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::443
Subject: Re: [Qemu-devel] [RFC PATCH v2 04/17] fuzz: Skip modules that were
 already initialized
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
Cc: "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "bsd@redhat.com" <bsd@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "stefanha@redhat.com" <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--GUPx2O/K0ibUojHx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 05, 2019 at 07:11:05AM +0000, Oleinik, Alexander wrote:
> Signed-off-by: Alexander Oleinik <alxndr@bu.edu>
> ---
>  util/module.c | 7 +++++++
>  1 file changed, 7 insertions(+)

Why is this necessary?  Existing callers only invoke this function once
for each type.

Please include justification in the commit description.

Stefan

--GUPx2O/K0ibUojHx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl1NNyQACgkQnKSrs4Gr
c8hHBQf+MXABid6zLTvOBLVIHUIn5MVWmv0s6wJKeJtlDWzlTjArI1EpVn5CvNht
cfOGsXCUnDg6mzyQnZdsEUucy6l/4rESE9cCn8gHFsS8MVBDcywQslhkU7kEzV3u
jqkhQG+kPbzWwXEBMN2QXCtviornYP5+U1y7sNtg3Nd0cD/zR4T6/VoFYLxQz3hh
0nP02iU3rOixwnfTiTHrTla4W9xq8gfh3c7Q2AyxsdzEyMZ2XL7e5rNogOId7FiT
ahZ4y5R/2AXdEFXDlnh7DTWzmQXA4VsWMpMiA+ovvmBv7sCyAIHpcgC5E3xOY+S8
Mm/neMPZ1qE0d8zunwolZnyiYbI3OA==
=YfUJ
-----END PGP SIGNATURE-----

--GUPx2O/K0ibUojHx--

