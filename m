Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C014D6DB5CE
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Apr 2023 23:33:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkth4-0006wh-Mu; Fri, 07 Apr 2023 17:32:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <olaf@aepfle.de>) id 1pkth2-0006wZ-7w
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 17:32:24 -0400
Received: from mo4-p00-ob.smtp.rzone.de ([81.169.146.162])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <olaf@aepfle.de>) id 1pkth0-0006es-Dj
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 17:32:24 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1680903135; cv=none;
 d=strato.com; s=strato-dkim-0002;
 b=N47fsBzHrMoIK8TggcF1+2usarDcqiqBF8XsyxwJiWrl64kB/QQ7EHRvWKPp9TRahV
 wMp1K9aQJhH0WirKW31p/FEYZfBh04AqOsdsAzzCmszEpLYI/H5ULaPaZzhCQOGNH1Sm
 mIZR1hbZKQqPCxMiV34tpy1aNAVIm3aNTXn8bS3nwDlkon2o4XaIpIikB3QksUypoQTK
 IiQBoy3r+oGYzLLR5k1m9pvHg7VaqY2JGdGvneUVUqQmiQ1Hp4F5fWjBbgbzBtuy+39g
 /2jkw6dMMQsHYQtC7OPENdNAEjkOKplXt3SP2BbGajh/aaSNMuu/FcmfOWcsPnwUGbds
 OKbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1680903135;
 s=strato-dkim-0002; d=strato.com;
 h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
 From:Subject:Sender;
 bh=XFiS0oKQYXqHvajqJey6wUUC38b7yqOWk2P7FXbEcwU=;
 b=dyHt4qIiq4tH9ulGO7lcXk3GqHA3dOjEtqNsrbjHqqjX1eBNPTkknQIta6L7Bd94ZM
 fqHoRMOH733/57Irn+jJMnn42Ca1gPLRWz1o24p9i1Te4hIjoUz3WIO9f50bW1LG88uG
 jE9euFSBOwID3sX3HddFhwfJ6liG1JT6xfcOrmO/6A6Zb9MJL/JBpMpJ2hw5+0hxmrBI
 9a1t8Bm0qzRc9zf9EOqpJlJoKcJrza4ui2SxaUY0++0kT2BvGNQz/S7DWvQl0/tlt+bJ
 9qW5or3+1XkkdcvFDCW87pfCJDvQt9BMEUWO36SdqDJOcWQM3VEJ4DocSYtPucsSVWG/
 5FSg==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1680903135;
 s=strato-dkim-0002; d=aepfle.de;
 h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
 From:Subject:Sender;
 bh=XFiS0oKQYXqHvajqJey6wUUC38b7yqOWk2P7FXbEcwU=;
 b=VsAS12tyrQXUVV4wI/wDUPKrKBXZSGGPqwSBkxNRLjErFCp9kXd4R4MLLMnWM2QYM8
 D9deLDEcZC4m68BYuK9eFxtzL5M/E8lJK15NJLZLdQikJieUZUQwhNyXc5Cf9p6Ikn+k
 r1ZG08FInE+oWpq5wY/u5okeX3vqx/xk4hKn5ZT43nzKh/370bBanG0g23/s2hNsVjZe
 jb1xAkOOGiK9zC0R/kbMVHD3wnQ8h9LLDUVu52yRC4yRhPNLg6T/axVMf11QO7WgscwX
 lxuWcHb3RvoGTZB996lHO9Pt0XES5oeq2RmYH1iRiqLJ1WpPzpQ2GFQgbRNahXYXQ3Ga
 nszA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1680903135;
 s=strato-dkim-0003; d=aepfle.de;
 h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
 From:Subject:Sender;
 bh=XFiS0oKQYXqHvajqJey6wUUC38b7yqOWk2P7FXbEcwU=;
 b=Sk4HNlqzwFrGYr9CXXxlQPoTgZqpNn1ZOdVY8HMyDux8lUTs8hDiChg2ndB4mtJHmW
 jE1oJKDGYWFaU7G+DCAA==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisR5AEWIPBvsPI52f2TnxTwFPmhSWhc+9ByBCFU+BA=="
Received: from sender by smtp.strato.de (RZmta 49.4.0 AUTH)
 with ESMTPSA id x6987cz37LWFF1b
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Fri, 7 Apr 2023 23:32:15 +0200 (CEST)
Date: Fri, 7 Apr 2023 23:32:02 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>, Philippe
 =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>, Ani Sinha
 <ani@anisinha.ca>, Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PULL 5/6] edk2: replace build scripts
Message-ID: <20230407233202.51e9938c.olaf@aepfle.de>
In-Reply-To: <20230320093847.539751-6-kraxel@redhat.com>
References: <20230320093847.539751-1-kraxel@redhat.com>
 <20230320093847.539751-6-kraxel@redhat.com>
X-Mailer: Claws Mail 20220819T065813.516423bc hat ein Softwareproblem,
 kann man nichts machen.
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/N.A5z4X_H+tBpM9bscI7ML7";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Content-Transfer-Encoding: 7bit
Received-SPF: none client-ip=81.169.146.162; envelope-from=olaf@aepfle.de;
 helo=mo4-p00-ob.smtp.rzone.de
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

--Sig_/N.A5z4X_H+tBpM9bscI7ML7
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Mon, 20 Mar 2023 10:38:46 +0100 Gerd Hoffmann <kraxel@redhat.com>:

> Remove Makefile.edk2 and the edk2*.sh scripts and replace them
> with a python script (which already handles fedora rpm builds)
> and a config file for it.

This breaks 'make roms efirom' (in case this happens to be a valid make tar=
get).

Olaf

--Sig_/N.A5z4X_H+tBpM9bscI7ML7
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmQwi9IACgkQ86SN7mm1
DoCz0xAAhtniqt7ZADfdTyk0IvTH5dmknmEw62xUjMyn7x6lOTzuVJzo2JzqQ1/2
AGp2UyiL8fV4QhjmVqszkCTbStnycerwx+9mDyN1bEU9+y9uE+gmAVghI+oqN0I3
nlxe8U6SRpop8tbRPk4hdRmb3LKejOffzy3Rd/oq7Iarc11ONMRVzlZDi0Gx0E3L
HLdw58mLjfB4O65pdfkUrCCudvCE8pohWgJWbjP1HjUk4N8LpheavtPIok+hTI2J
woH0rJT+BBp0T8sh7sm5PZ2+p9dbg5QfL2dYpQsPF7KtWy9IKPtRQaGq1gsZk9kg
vJB8iHXV21QA8ZQI2Bd3rc1blhwOuqPl6sChlOSYaz+ZNophgM/qRUu8tRlrQp2d
5VbYPuPUMmQc2s225mrUkOrGp5uTZ27FXn5WxvBKA7orzS6aYwNFMAzUhGdqPUyD
0OYjpJUv03dAScTY3C8oQvJWlJaPvBMhEAHN71bfRh2wmzl8XACPmD/nKNmy6B0s
6I8xVDM2HxS+05A6eNM6Nmwycqn2Q8dSmetjAX0UYRV+q6sSymIx4YJfNIujT4Wz
vB2CKUtpEXGZSvRRtbeVKgbxrdv0T98BygpqM/9tlbaXRtLdDeAA87E9HkblSW6c
kHbcxZXREoQOHG8zcMwR99YVQWWFDU7+aMm1Dyb0hWePV+1ZJp8=
=h8eQ
-----END PGP SIGNATURE-----

--Sig_/N.A5z4X_H+tBpM9bscI7ML7--

