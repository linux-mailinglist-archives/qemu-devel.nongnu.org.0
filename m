Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A351636C762
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 15:56:29 +0200 (CEST)
Received: from localhost ([::1]:47968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbOCS-0005I2-Ol
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 09:56:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lbOB5-0004hH-S4
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 09:55:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1lbOB4-0008Rp-D9
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 09:55:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619531701;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tBL6yKLzKM6naH95lYZ5D4D86y1dR3J0p3n5vitQyjY=;
 b=XCXZJKJRTM3gseIYHTuTeVSAV3LBMyroo8OjrGsVob3Nkm01tjU4sB1ijcjtRMA4EA0Gk2
 QzcVf1cIe9qqChMxY9qR6grFC5e5QhnoRaAKd/tJABcrRvE35udUpRApaVyGaCD7J+HEMk
 CKabJWh5XqsXHd/YHVwb/6VIZrLlaEI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-153-tM3dzcd8MlKXsnRoNhJbEg-1; Tue, 27 Apr 2021 09:54:57 -0400
X-MC-Unique: tM3dzcd8MlKXsnRoNhJbEg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C8E32C7442;
 Tue, 27 Apr 2021 13:54:31 +0000 (UTC)
Received: from localhost (ovpn-115-30.ams2.redhat.com [10.36.115.30])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2343819714;
 Tue, 27 Apr 2021 13:54:30 +0000 (UTC)
Date: Tue, 27 Apr 2021 14:54:30 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH] hw/ide: Fix crash when plugging a piix3-ide device into
 the x-remote machine
Message-ID: <YIgXlp9Auj+b00aN@stefanha-x1.localdomain>
References: <20210416125256.2039734-1-thuth@redhat.com>
 <4c1c6e99-066e-f916-31dc-acb50caa5320@redhat.com>
MIME-Version: 1.0
In-Reply-To: <4c1c6e99-066e-f916-31dc-acb50caa5320@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="cdTM0Z9eY1lLmR8G"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.218,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>, Thomas Huth <thuth@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--cdTM0Z9eY1lLmR8G
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 27, 2021 at 03:27:40PM +0200, Philippe Mathieu-Daud=E9 wrote:
> 2/ There is no Kconfig dependency IDE_PIIX -> ISA_BUS, apparently
>    we need it.

Adding an ISA_BUS Kconfig dependency won't solve the problem since the
qemu-system-x86_64 binary is built with many machine types. Most of then
include ISA_BUS so the IDE_PIIX device will be linked in and available
when -M x-remote is used. The crash will still occur.

> Anyhow I think it would be easier to manage the ISA code if the bus
> were created explicitly, not under our feet. I have a WIP series
> doing that, but it isn't easy (as with all very old QEMU code/devices).

I suggest fixing this at the qdev level. Make piix3-ide have a
sub-device that inherits from ISA_DEVICE so it can only be instantiated
when there's an ISA bus.

Stefan

--cdTM0Z9eY1lLmR8G
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmCIF5UACgkQnKSrs4Gr
c8jB3gf/RLi20UqZswmGMDBNJfW8TpFcHdqgz1WDHqZZR+jP5dmKTqb6DgCJq2sC
X2c+Dw5WspVkwn1PwL3zW3NmsLGb4RtOca2GenZPJVtbPfMM2TFs5CX1m5nSLPfQ
PYsIs0SlqYtm6ppGHn+ryERuuigLMTb3eHIn6d4l7DbDUoIkVj6mhXogxbfZGcd/
FCXbmLR1sNlmY2ru94HjFggN4InnV9jUjp35k5sEga/sV+W9mSQ8LNB9HBwx3aQ4
Dc+MzMZTdx/xvQu1Sj7r4fTmsJVK+tzWoE+BtmAKPg4cH+JvKfzZJWgGoifAahUw
PEntUXHZPtMFOBw0EB/LqYaPGpYSRw==
=HPt4
-----END PGP SIGNATURE-----

--cdTM0Z9eY1lLmR8G--


