Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7EFA2F3329
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 15:47:50 +0100 (CET)
Received: from localhost ([::1]:39648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzKxZ-0008I3-I8
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 09:47:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <olaf@aepfle.de>) id 1kzKv6-0007al-CH
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 09:45:16 -0500
Received: from mo4-p00-ob.smtp.rzone.de ([85.215.255.22]:32128)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <olaf@aepfle.de>) id 1kzKv2-0000xv-Mk
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 09:45:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1610462708;
 s=strato-dkim-0002; d=aepfle.de;
 h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:From:
 Subject:Sender;
 bh=Kwn0vPdtdBUuWEYSdbfArm2SgXFqZkZeyxKFKd4Cgvg=;
 b=K5Wd6k/FrbCytoI5ZWDcbgpRPvmuBI9dZ5cn4gH4444A/B8dgaQgiCsC7km8U25z7F
 Tf3fruH0L0QZwo3nW2MlDhgfrHg09lrW59J7lvY3Oik5KFhzESwDyMi2kNjTwAwsk3S/
 TEmYYGJVEiR5SsguuHjyYmHRUk3dwf0k23AtfiUNE/8sqkf0VuHx9qSmF/UGTLBv8jPl
 2vBQdkXE700oBkHVWycun5g3LMurdLbGWPQKFViMb5gpgjIS38kVrYxk/UjYTbYHb3Ka
 cTMvPxrRmAY/BRPDyof/Yfh5eHjTS+BJQcxjj6RjzUb8U7Koxt5tDJ6tYHwxPpV2rkvc
 wfjQ==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDXdoX8l8pYAcz5OTXuqX"
X-RZG-CLASS-ID: mo00
Received: from sender by smtp.strato.de (RZmta 47.12.1 SBL|AUTH)
 with ESMTPSA id h0968ex0CEiwQ3j
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 12 Jan 2021 15:44:58 +0100 (CET)
Date: Tue, 12 Jan 2021 15:44:43 +0100
From: Olaf Hering <olaf@aepfle.de>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: virtfs-proxy-helper fails due to bogus libattr test
Message-ID: <20210112154443.564deecc.olaf@aepfle.de>
In-Reply-To: <2315616.PpvBb8DKss@silver>
References: <20210112105110.2f0e4fbb.olaf@aepfle.de>
 <2315616.PpvBb8DKss@silver>
X-Mailer: Claws Mail 2020.08.19 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/h6GJLqgR4A3GK2ClKAg.7UI"; protocol="application/pgp-signature"
Received-SPF: none client-ip=85.215.255.22; envelope-from=olaf@aepfle.de;
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/h6GJLqgR4A3GK2ClKAg.7UI
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Tue, 12 Jan 2021 13:26:00 +0100
schrieb Christian Schoenebeck <qemu_oss@crudebyte.com>:

> Olaf, could you run a 'git bisect' to identify the relevant commit causin=
g this?

attr was recently moved from configure to meson.

After further inspection it turned out that messages on stderr may have no =
meaning for meson.

Elsewhere in the log I see:
libcap-ng support: YES
ATTR/XATTR support: YES
VirtFS support: YES

There is also --enable-tools, so CONFIG_TOOLS should be true.

have_virtfs_proxy_helper might be false, at least there is no indication th=
at a build of /usr/lib/virtfs-proxy-helper was attempted.

However, where is CONFIG_VIRTFS supposed to come from? It seems have_system=
 influences "have_virtfs". There is apparently no easy way to see if 'have_=
system' became true.


Olaf

--Sig_/h6GJLqgR4A3GK2ClKAg.7UI
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAl/9tdsACgkQ86SN7mm1
DoAphA//WbuiIMUQtjGG4XXzdZthBm27HLeuRwpNvjAK9FK+13mVz4INKvvqA8zr
MtneVSnWGVAtBc3KFKsQsAc5U2FwZMdGHu6RsurGgifULkru53ZsU6BLyZUVhX7z
pPgkxA2eXRQxYSzsgT+3KKQ8CwFkZL6lT+34xx/y0D6tlSjiHoFnsdpYfR0nBD0q
UcpJaTwcGrvP0JHpzn4bc6p220bderstkwHSc4D/gsc9d0kTBGvWyOs4+dAHqWG9
ZO40cM5PKcAhvY0iA5VY5l/sv6zSkM7qpX7WRJ6mQ0C+BHt0HXDOvuaomu8iDDdm
bwEAXVGxDOXOWZML2OYRaL08M9cT14ntRo/dClcV9na4U/6VhpZeFP6kkXGdTfj3
6FEBX/b4ovmoYXPCVZCbyUTw7kB2NrtbnFzfXME/cXwxUQTl3Vh+Jvsxpo8IHz0I
jyK1XH+8NNTRv3wKmeb+bvjkDgDVFWusXdegGdEDS45DU8A6t7mDX4eRVY+JPUF0
PcXK55oBePE8ikLMCHwglbNK0GdmLzySy0JE+WexCrDB+Ci39GCp2Cs5cbP2Fdcm
Ky6FcOItVZmQ+TGOGz6bD6naDcKckCpDGkRaTMtRzm2XtDR/UKipHAp8CQne6KYO
vjhem1oWUadY9CXVmGL1rnFFela+MYs8xfG/GmYGwZGqEM1Hzbw=
=93/u
-----END PGP SIGNATURE-----

--Sig_/h6GJLqgR4A3GK2ClKAg.7UI--

