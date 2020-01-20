Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93518143032
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jan 2020 17:46:40 +0100 (CET)
Received: from localhost ([::1]:39882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1itaCF-0001h9-DL
	for lists+qemu-devel@lfdr.de; Mon, 20 Jan 2020 11:46:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33342)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefanha@redhat.com>) id 1itaBD-00011o-5x
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 11:45:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@redhat.com>) id 1itaBB-0005oh-09
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 11:45:33 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:31041)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefanha@redhat.com>) id 1itaB9-0005mv-Gs
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 11:45:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579538729;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JJxxLis5dRSAFBhCDMV6l5YbX9mpDVEVbL6mLcr+KQ8=;
 b=XurKrSAcL+isxPxQxGNQGLUt3UCrpgcTrLs9K+ABEDFm1VVC5D8xODvmHucAps35WU6PSq
 g5AUPzReS3QOZIs0fIBVv7iyUR50ciOCt+8MR9q/hwNiTHHdeR6Qcx6XG9s3lBtKV5b3qi
 zKB7pzLGy3Bk7mZXTM5ejLLGSL5bZIA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-18-P-RI49u4O9OR1r4hhwA4gQ-1; Mon, 20 Jan 2020 11:45:26 -0500
X-MC-Unique: P-RI49u4O9OR1r4hhwA4gQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4F5E6802569;
 Mon, 20 Jan 2020 16:45:25 +0000 (UTC)
Received: from localhost (ovpn-117-223.ams2.redhat.com [10.36.117.223])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 59BA7860F0;
 Mon, 20 Jan 2020 16:45:18 +0000 (UTC)
Date: Mon, 20 Jan 2020 16:45:17 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@gmail.com>
Subject: Re: [PATCH 00/26] Various qom & qdev enhancements
Message-ID: <20200120164517.GA603908@stefanha-x1.localdomain>
References: <20200110153039.1379601-1-marcandre.lureau@redhat.com>
 <CAJ+F1CLH_G1diJvm+xcb28Gsy_YizEncuHsX3HTC2y_y2CFd1A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJ+F1CLH_G1diJvm+xcb28Gsy_YizEncuHsX3HTC2y_y2CFd1A@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="opJtzjQTFsWo+cga"
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>, QEMU <qemu-devel@nongnu.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--opJtzjQTFsWo+cga
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 10, 2020 at 07:38:02PM +0400, Marc-Andr=E9 Lureau wrote:
> Something went wrong with git-publish & "git branch
> --edit-description" interaction (which I started to play with - I
> think git-publish should make use of it). It seems it got the mail
> summary from git-publish and content from git description, fun :)

Yes, the branch description might be a good place to stash the cover
letter or at least part of it.

Stefan

--opJtzjQTFsWo+cga
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl4l2R0ACgkQnKSrs4Gr
c8iIuAf/fQ8FRnjAAhWX5nh5BkosscUnw6068hpDFepwH4T64qI2+bI1RVkAiNGF
rdyb3JSDiNuuMnS6PEvO2sKfX2TwHKLpim2qqM/0XVWhyAKhiKUF0j5kLUKZ+8Iu
ssoNUtvYqhsiJYhPmdBSnRXwTJgLOjJmuZ614pThLKa1G7N7jVEYT1YYINm+6QzA
Getz3POzPtjj+lg4mX2D1AZX4USNT5HSxf6AlafFLrFe1333/GGdCXBKAnL5dhUN
XzjW7PU3pPFDU0zGG1GYw3XwyvAdPP2lhi98aSdMydz3Gb5uLn2HfrvBKz86TCP5
42oTS9NTtECywqjfJfF9UHDy83kyyw==
=iPSe
-----END PGP SIGNATURE-----

--opJtzjQTFsWo+cga--


