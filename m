Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5893F765DB
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Jul 2019 14:33:07 +0200 (CEST)
Received: from localhost ([::1]:39548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hqzPF-0008Pq-DI
	for lists+qemu-devel@lfdr.de; Fri, 26 Jul 2019 08:33:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46046)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <stefanha@gmail.com>) id 1hqzOv-0007xn-IQ
 for qemu-devel@nongnu.org; Fri, 26 Jul 2019 08:32:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@gmail.com>) id 1hqzOt-0004Le-KQ
 for qemu-devel@nongnu.org; Fri, 26 Jul 2019 08:32:45 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:33577)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <stefanha@gmail.com>) id 1hqzOp-0003i5-Vc
 for qemu-devel@nongnu.org; Fri, 26 Jul 2019 08:32:41 -0400
Received: by mail-wr1-x442.google.com with SMTP id n9so54366578wru.0
 for <qemu-devel@nongnu.org>; Fri, 26 Jul 2019 05:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=t0YWy61JIpA6pKCdoDs5FI23+WIJLemZEyTvjtmUaTA=;
 b=b/UzthkZyPfcTO2G7YsJhRzADqfqvwgHCNf2hzJWbbrsEUH7L4hLmBWkJhCrI5NzmE
 L7P3ph2HR+t+32z6h+4h8cE/91Hbu98BY22ZFWZC9I3z85Bi1zPfasBn7ZEUTQJTh33k
 B+L+lmxjQ4XeJ4ZNoyhLteGOobBhUoS9/QHVkw2pA5AzuufWuAjpaVTBpMRtYRgLmCAj
 tvI3/KojKI0PyE5GChQuABhoN4dA6/vM0neSQ15Y5pZDiiYDRBiyFG7jDVRNqsND7fMb
 qQ7ag1uDlR7INUT4nkodffMIR486ex2r28652h56N7P0mKx7JUt/936TvH80w/aAJMdR
 ArcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=t0YWy61JIpA6pKCdoDs5FI23+WIJLemZEyTvjtmUaTA=;
 b=UOgr20Mm+94gpLFT0nSeH/pFtEw9+l7BjVTD7dfQ0Ju5+cWM0/Aatn78VdjIoshQce
 GMg2UMhfrQzrIn2JAr5uQdsyGlDLJjFXCtVkWkwaijEaI4+p9w574gjbrT8whU+3h+/Q
 QUOKgPFZ9jTMERxb0iOO0uUOQb5Pb7v626hnFIK+ikHIy4odUIWWUnS+VoxIFqZGY/iW
 3iPVkY7VkbnM4ZI/Y/1ww7jcrNxsLUZ8brwyg2kgLi+embvw0Fd4GPQzGocJvUPGFW2O
 BPQet8HMQiqbMxpeNqU6zIi+r6TmE+nUyYxphDpJGcDIn5pWbteTmY056362xr4PC4OU
 zjEw==
X-Gm-Message-State: APjAAAVeIcOPt22Fxg8EkOrY/QSufa+/YMyFYGAjrFcHLTOT07FR3ims
 7Xw66s8NADniy0yK9/qnimY=
X-Google-Smtp-Source: APXvYqwb43oGbrqVDxgi8Y8ORi5Zz2hcD2JMsGogC6IGwN61bvCCldR0I3OPxtW4FH/wBm0LkYCCvw==
X-Received: by 2002:a5d:4949:: with SMTP id r9mr14477963wrs.289.1564144358124; 
 Fri, 26 Jul 2019 05:32:38 -0700 (PDT)
Received: from localhost ([51.15.41.238])
 by smtp.gmail.com with ESMTPSA id t1sm63752802wra.74.2019.07.26.05.32.36
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 26 Jul 2019 05:32:37 -0700 (PDT)
Date: Fri, 26 Jul 2019 13:32:35 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: "Oleinik, Alexander" <alxndr@bu.edu>
Message-ID: <20190726123235.GA25977@stefanha-x1.localdomain>
References: <20190725032321.12721-1-alxndr@bu.edu>
 <20190725032321.12721-3-alxndr@bu.edu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="liOOAslEiF7prFVr"
Content-Disposition: inline
In-Reply-To: <20190725032321.12721-3-alxndr@bu.edu>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::442
Subject: Re: [Qemu-devel] [RFC 02/19] fuzz: add FUZZ_TARGET type to qemu
 module system
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
 "stefanha@redhat.com" <stefanha@redhat.com>,
 "superirishdonkey@gmail.com" <superirishdonkey@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--liOOAslEiF7prFVr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 25, 2019 at 03:23:45AM +0000, Oleinik, Alexander wrote:
> Signed-off-by: Alexander Oleinik <alxndr@bu.edu>
> ---
>  include/qemu/module.h | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)

I wouldn't worry about #ifdefs since none of this generates code.  The
only bloat will be the debuginfo, but I think avoiding ifdef is worth it
(to prevent bitrot and to make the code easier to understand).

Anyway:

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--liOOAslEiF7prFVr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl068uMACgkQnKSrs4Gr
c8hrVgf9H8Ig2jq6S1IV/lkBoVQ6XFqq+GlXiQClR6bG3pEY1edqWT4lefqwXubh
T2uNo3XcBu8k+ERTvMRHd3z1DUfoYtONGwOqcUsqlI2AYm11pOhfyX4W/NJ3nlm+
lFeuGbOezzKCZTL6BMAlxkoeGoVz9cT1/wQoFDwTPcpFSWlNnMSnD6eYpxVHaMRE
3TtcFB2lOEFNr/i/KBZvBTSPGzcoSQDWX9EewrmZn3i13czmi9FIaH7y5J+aiP70
XrggTyzAhPSDC3vr1J+JCyV7ONFrWe7EEvRJ+TvCM2CrM+Px8ooDzUTsTKpQ7Qu6
N3+L6JELvmyFt5hawGZhqkW93vbwaw==
=e75S
-----END PGP SIGNATURE-----

--liOOAslEiF7prFVr--

