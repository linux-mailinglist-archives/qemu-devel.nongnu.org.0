Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EDE1B0D9E
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Sep 2019 13:13:30 +0200 (CEST)
Received: from localhost ([::1]:32834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i8N2X-0000KP-4N
	for lists+qemu-devel@lfdr.de; Thu, 12 Sep 2019 07:13:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35261)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefanha@gmail.com>) id 1i8N05-0006rn-J5
 for qemu-devel@nongnu.org; Thu, 12 Sep 2019 07:10:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@gmail.com>) id 1i8N04-0005yt-Jz
 for qemu-devel@nongnu.org; Thu, 12 Sep 2019 07:10:57 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:39306)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <stefanha@gmail.com>) id 1i8N04-0005yL-Dd
 for qemu-devel@nongnu.org; Thu, 12 Sep 2019 07:10:56 -0400
Received: by mail-wr1-x435.google.com with SMTP id t16so27981163wra.6
 for <qemu-devel@nongnu.org>; Thu, 12 Sep 2019 04:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=6T4xRSycWGtwahIO4tHN85IopCNUAATn6buOKSZeUy0=;
 b=QSTB7kAiFytCZ2kGYWerZCDn0M1xryrJ22760/b5fam+7f6XV5TAUh3B1707LCwGbj
 rEsXrCAWjtqHg7y2h8gct+5z9+PsmZMbNMwIKWF2LagfaTE6t5jwmEZl63jzidM//zPa
 JymKFzhjTccAPUZh7Nn3KB3looKhr90ykN7CrWGpTKwf/D4uRDLET7bAR8AKpidPyJXq
 4LWfJrZJIz2p2Ra1+qz3uPKTqJpnUu2oWrL0wtliXbV9H9O7Zb+IeQjWpVbfi6OF9IeZ
 +iZqdjuZMQpPoic51IzJcANcCMb90WLgt6lsf+ntCfa5DoNtJVC0LIPPnyHM4Y6PZ/RX
 wv0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=6T4xRSycWGtwahIO4tHN85IopCNUAATn6buOKSZeUy0=;
 b=RwqLB0gbaAdHhAu9QeMZbuoxumjzPt53Y+jDUUocOSAPFfTyWvngbi3eTmTXPHQRiu
 ALzWB+Tp8xcXRTR1W9tuUbaRJZEBV0TDgZiykzCTKXdBktICoQXHNb6ouJnalXraUgdG
 qvpSIV+Chf7FblGg8RuBPfHWZ9Tl/qUI3ev5UxwMPsPSMwWc3BsFbAEDwAQ0A03OB9tH
 GSBgm1I5g6Oe0vT1GZqLpq2O1mwjYC7/tloy37ClsDV2LSNAIzDAUd27F0FSY73VqTH9
 OeGUf9wpFNc10zJFb8zDtB7f9wZcEM5f/8tHAzykO+URYOBiOCnRfy0VLsFlal8rv6mJ
 vDAw==
X-Gm-Message-State: APjAAAX/w8vNpRH1B1pf/vWPKym2DIS2QWmsTzqSEKOlJWWmpWaHuXn2
 KPbSBDMeJv472Dd7g1lw8Bt9103a7T4=
X-Google-Smtp-Source: APXvYqxCJg1Qnyk7XvGSIqOtOQVtBwcBj9rEnO+EG1kXNkpl8uwns3fVklU9TSTf7YHNhSHmbvhd0A==
X-Received: by 2002:adf:f7c3:: with SMTP id a3mr6002849wrq.141.1568286655183; 
 Thu, 12 Sep 2019 04:10:55 -0700 (PDT)
Received: from localhost (178.165.130.7.wireless.dyn.drei.com. [178.165.130.7])
 by smtp.gmail.com with ESMTPSA id r15sm6261486wmh.42.2019.09.12.04.10.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Sep 2019 04:10:54 -0700 (PDT)
Date: Thu, 12 Sep 2019 13:10:53 +0200
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Message-ID: <20190912111053.GC23174@stefanha-x1.localdomain>
References: <20190904055250.22421-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="lMM8JwqTlfDpEaS6"
Content-Disposition: inline
In-Reply-To: <20190904055250.22421-1-kraxel@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::435
Subject: Re: [Qemu-devel] [PATCH] vnc: fix websocket field in events
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--lMM8JwqTlfDpEaS6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 04, 2019 at 07:52:50AM +0200, Gerd Hoffmann wrote:
> Just need to fill VncClientInfo.websocket in vnc_client_cache_addr().
>=20
> Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=3D1748175
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  ui/vnc.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--lMM8JwqTlfDpEaS6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl16J70ACgkQnKSrs4Gr
c8ggGwgAiMyUHpcBf9knK0DN/siFy/yce3lRBxbjWt4+sCpSqc64zYL9W8BWFzuU
vd262Pf5fMj5spzZSsBP1fikeXYI5ouXh91HxWRBDJY7sa13I5h/Z9mfu/HggKmi
Xil0XzWfwQjsG1JQw18e9JWfnPiAdaEB3J5pfqR5VqNVRPnTRGcyJj4PlzqZKiDa
prVNzbX4mAhAgERAbmXlMyp3nEjPnrus/rBPtoUcmoH3U+/tpu8sZfSjpKBj9t0D
Xzge12bd67GhzxxdGGQ+jbf+UBs6Cxts38LzvFIFnrwX1TW5n463FrbVHCR4RxSW
To1z/yUUoPtHhSCLFFnCf15+zzCERQ==
=XG1A
-----END PGP SIGNATURE-----

--lMM8JwqTlfDpEaS6--

