Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF3D22F332D
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 15:48:43 +0100 (CET)
Received: from localhost ([::1]:42148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzKyQ-0000u9-Ry
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 09:48:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <olaf@aepfle.de>) id 1kzKx7-0008RC-J9
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 09:47:21 -0500
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.50]:28694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <olaf@aepfle.de>) id 1kzKx5-0001g9-NF
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 09:47:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1610462836;
 s=strato-dkim-0002; d=aepfle.de;
 h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:From:
 Subject:Sender;
 bh=pxgn2IdkQ/GKxMCr5I6xIHIfVzXx1iHDrrESbYhTC/o=;
 b=VuoF82CfTXHEgiRHbEk7pODGcEEnPbb2LDjyAkGD8S0eruJfrFSu0CNL8nPCktAWD9
 C0DA7s0lHItv2T16CAJiDIzBJp+7YY43dz2kZLY51cgDkwf6jzr5Iq3auh1UXpTd0D7X
 o8Yg6bJjTXfhiWlGiUOfk1bCxJBTjftThoq/DB42LOJ8NmN48G2V3r2vWHWNCmT7TRb9
 CfUqSavkM/0XgOhb8oTDCOmfIcpT5v04yg7PXtxsGTcyeCkj+g7h8YA9YQD1hKSLTT1S
 MYE6T6hVQPmeySXZcSVx/AKEbsjZ3QvhWtNonBXN7mU8TEEQkyNZLWC5gtcc3i5WC338
 88jQ==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDXdoX8l8pYAcz5OTXuqX"
X-RZG-CLASS-ID: mo00
Received: from sender by smtp.strato.de (RZmta 47.12.1 SBL|AUTH)
 with ESMTPSA id h0968ex0CEl9Q4i
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 12 Jan 2021 15:47:09 +0100 (CET)
Date: Tue, 12 Jan 2021 15:47:00 +0100
From: Olaf Hering <olaf@aepfle.de>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: virtfs-proxy-helper fails due to bogus libattr test
Message-ID: <20210112154700.41c1cb87.olaf@aepfle.de>
In-Reply-To: <13c2a785-a8a8-6a17-3265-b3597fc5d734@redhat.com>
References: <20210112105110.2f0e4fbb.olaf@aepfle.de>
 <2315616.PpvBb8DKss@silver> <20210112122900.GH1360503@redhat.com>
 <13c2a785-a8a8-6a17-3265-b3597fc5d734@redhat.com>
X-Mailer: Claws Mail 2020.08.19 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/Xg3p=tKbDKpfKnHRvKiLWYt"; protocol="application/pgp-signature"
Received-SPF: none client-ip=85.215.255.50; envelope-from=olaf@aepfle.de;
 helo=mo4-p01-ob.smtp.rzone.de
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>,
 "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>,
 qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/Xg3p=tKbDKpfKnHRvKiLWYt
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Tue, 12 Jan 2021 14:08:31 +0100
schrieb Paolo Bonzini <pbonzini@redhat.com>:

> Olaf, can you expand on that?

The full log is here:
https://build.opensuse.org/public/build/home:olh:xen-unstable/openSUSE_15.1=
/x86_64/qemu/_log

I browsed configure and meson.build to make a guess which variable is false=
, so virtfs-proxy-helper is not built anymore.


Olaf

--Sig_/Xg3p=tKbDKpfKnHRvKiLWYt
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAl/9tmQACgkQ86SN7mm1
DoBWQw/+MHYTOYxd3L3EZZDzkvF2tnbhLKqHEAvfzuPZLvZa4hb8djGv9c2lwOQ+
VUiAlx11DxUZEI0XYuEXKGp/7YKPyHE6hRz8V8C8Odi6qycbgv0NHKZJnabcxLD7
4qpsbgxn52UQcR4KE8wrG7vGcNSo4N45ZjiyaZF+s4XH5vSsegPratw724ynw9UO
Oz3fpkjTUo1VAIqZSyX4CqOWu9G0hxbpRq53tDRyMLUle+CGGCb41nFmasGDCd+t
RmPCTrE6VQ5+Ecc8NbDjtrcPG/TWGgLCEP3neBUPZhiLrYdXZWaxEPj7juS/U5hQ
gdkRi15BHOh0hMcxoWoftxQYXNyOCer2txjy+dgPf2LGARJpMsuY57Js2V1fblI5
DZojxHMooNELtdfA7LNAIQReO+WGE1Bq5DsurW32DiWZ99isp1PlZrenT0+WOb34
n95YVqeoMywzsfawnPSmSos4a0D2DPkYUVQ8pBfL9NmcQ4h94oujiBo7DleZf1L0
dqlOsLtlfCWc8Y2KapbK3jnmPDTuUF77N6nIzafI3c4RK9YzBo4FhxRiInN4K2VC
A8SEsF+h9otCOvEGZqEJu+OoANcNMKaYVBlYSQImJiR6Ix9dq4G2y6rmb1PsjImW
qgMWakN8/YoifSnV/Eh/TP31CnJxYBAuAS/K8HeUCHOLOigz1LU=
=CXs0
-----END PGP SIGNATURE-----

--Sig_/Xg3p=tKbDKpfKnHRvKiLWYt--

