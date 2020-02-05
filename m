Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7078315394F
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Feb 2020 20:49:58 +0100 (CET)
Received: from localhost ([::1]:55636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1izQgP-0004pP-0o
	for lists+qemu-devel@lfdr.de; Wed, 05 Feb 2020 14:49:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36885)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefanha@gmail.com>) id 1izQfY-0004QV-Vf
 for qemu-devel@nongnu.org; Wed, 05 Feb 2020 14:49:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@gmail.com>) id 1izQfX-0006dx-09
 for qemu-devel@nongnu.org; Wed, 05 Feb 2020 14:49:03 -0500
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:39392)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <stefanha@gmail.com>)
 id 1izQfW-0006a5-NH; Wed, 05 Feb 2020 14:49:02 -0500
Received: by mail-wr1-x443.google.com with SMTP id y11so4269387wrt.6;
 Wed, 05 Feb 2020 11:49:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=NNHT8cGbSxUgGFXCRBtSiLeQ66txvza3NgssIEwqfJg=;
 b=H5kGMgLu9EfFTCaq65s9kG0THasop0HUSFe5KZNP7NH30FmgYjVP2sYrOA8YEgup3+
 Imo8tFKv+3iZ7MB6F4J9PXrtgPaUCM3yQaCLIWfBwemt/q7hi18uq5BsUkh+eWQ4+Lpp
 U5XTedrlwFe6/Fy6Pm7ShOmEgM3MSaKvgbj0HFMZptq35XTF+l/5T8zQ+UNBM5zZKv8Z
 CUTDIUQCBkHXY/uUfgx7GlDyaDkSqu2DpQ+i4wDDJx+BTv2iCmPSb96FFEmraN+DHwhY
 2cMZelyYo9wyl7EQRithgqQv4Md4xcJWu2vO/WNv1OEXkGWOK1rptrj0k8OTzgBSb3+n
 LFRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=NNHT8cGbSxUgGFXCRBtSiLeQ66txvza3NgssIEwqfJg=;
 b=WcusmxehzUooEbHRlw5pLX5vXeeP4SajV2OYmMA3H3MwIrxdAXpS2k8DDrvAWM9EOn
 d3DKR6tgR4du5DwONuSmViR3IzCC7WZ+fxDSX5+1f1ab48ccBd/JqUJgXMYNPwtLZX/d
 o7j9VY3pTG6ATVwlOimWIJgg/YpSgTuKZ0JFzOP5vFTZZwaAK/Na8sEEU2Jkio7+bgNp
 66Hz9BWnD/YNwWntVFqjMWpO9h1a5UTB5szVIx5MMzOb1D7AEfwOWfbCejtYZZlhVBHc
 UkqcuY4LPQ8MbI9q6W1watWXlOin3gOd77PMhcs2+GGn+kC+4hrk8IvxfImJlpl5dBfa
 weNg==
X-Gm-Message-State: APjAAAVjWSP02DbONqTUoCdsjfzGrjCDZd+LCokzOkYdRwUWOHtpda1S
 ISybLLtt+/gUjIT/GGGtoYg=
X-Google-Smtp-Source: APXvYqxefAvt1bV7JB/wBfTTOxAsiQZirU94mnH5FvyXRbP1d27iTZQZdybyICjqqil8VywFSEqNbA==
X-Received: by 2002:adf:e610:: with SMTP id p16mr128899wrm.81.1580932140925;
 Wed, 05 Feb 2020 11:49:00 -0800 (PST)
Received: from localhost ([51.15.41.238])
 by smtp.gmail.com with ESMTPSA id c9sm641744wme.41.2020.02.05.11.48.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Feb 2020 11:49:00 -0800 (PST)
Date: Wed, 5 Feb 2020 19:48:58 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Julia Suvorova <jusual@redhat.com>
Subject: Re: [PATCH] hw/pci/pci_bridge: Fix typo in comment
Message-ID: <20200205194858.GA69308@stefanha-x1.localdomain>
References: <20200205185123.210209-1-jusual@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="IS0zKkzwUGydFO0o"
Content-Disposition: inline
In-Reply-To: <20200205185123.210209-1-jusual@redhat.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::443
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
Cc: qemu-trivial@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--IS0zKkzwUGydFO0o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 05, 2020 at 07:51:23PM +0100, Julia Suvorova wrote:
> Signed-off-by: Julia Suvorova <jusual@redhat.com>
> ---
>  include/hw/pci/pci_bridge.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--IS0zKkzwUGydFO0o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl47HCoACgkQnKSrs4Gr
c8hZ3Qf+Jvc6VEBsgdqXkfprAHywACh4UuPqkFAVK6ZdK2hmjh3yNJD3uB020CP7
bkQ0yGgrHv31WVcUzQdpTnzy96n+3K+FQP9xPNiCwtmLpuDgjZ6VWIT22M7UJji+
D61djJnv/yJSg6hNi73ZE2y+Mka4jw5slybsSrvVMJR9v6a5lUXDKSCsFMq99oOy
YnTe6kAHwU9d+3o+kBatYPa4KrnBUhBkVqjaHmewfdO2cxtpEdAEBdED5bMhlbur
23yV5Pe3iJRT7G45H5hmYz09gZr8ZVRO4spKaxZakn2N62ytX1SDxnTKLOowIbKI
HmS4warvtbT8hQzgQXo74bwHiYzwPA==
=79iw
-----END PGP SIGNATURE-----

--IS0zKkzwUGydFO0o--

