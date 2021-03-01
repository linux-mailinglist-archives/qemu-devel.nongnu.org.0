Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53068329013
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 21:07:46 +0100 (CET)
Received: from localhost ([::1]:53394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGopU-0004Cu-QS
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 15:07:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vit9696@protonmail.com>)
 id 1lGoo5-0003LR-Qf
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 15:06:17 -0500
Received: from mail1.protonmail.ch ([185.70.40.18]:53407)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vit9696@protonmail.com>)
 id 1lGoo3-0008JC-G0
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 15:06:17 -0500
Date: Mon, 01 Mar 2021 20:06:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail; t=1614629171;
 bh=RAS+6z1JOX2HTBO6bg/WEgQnY8fsZm5vbKr08TgV7M8=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=Cfl24GSGFOmcfhmf6rK2j1j75Gpr2M8iKA5PAATYopWyTLnhWqhPOGTjHavGfdclw
 r+kDqXxJ0eSsrdlfv5s4bu3EkFlk3qiOcvZjBEFYFKs0PqOxjJ5T1j1tVIfISUgdJo
 7qNlz/rnj6EKcAaMgpyfi6nfpPGu+ZlyY30X6E34=
To: "Michael S. Tsirkin" <mst@redhat.com>,
 Thomas Lamprecht <t.lamprecht@proxmox.com>
From: vit9696 <vit9696@protonmail.com>
Cc: Laszlo Ersek <lersek@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Stefan Reiter <s.reiter@proxmox.com>, qemu devel list <qemu-devel@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Subject: Re: [PATCH 1/2] i386/acpi: fix inconsistent QEMU/OVMF device paths
Message-ID: <44747FC8-51F7-420D-B6B0-8CBEBF668B7E@protonmail.com>
In-Reply-To: <20210301200834.2def369a@redhat.com>
References: <20200730155755.188845-1-mst@redhat.com>
 <5b40e1ac-03ca-7954-4d50-f5f96c339772@proxmox.com>
 <20210228154208-mutt-send-email-mst@kernel.org>
 <20210301142819.66b94a4e@redhat.com>
 <20210301111254-mutt-send-email-mst@kernel.org>
 <14c5dafe-ac7c-d1c9-ba51-325a3a0252a7@redhat.com>
 <20210301200834.2def369a@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg=pgp-sha256;
 boundary="---------------------fee1e582d221190900416a64b20e0190";
 charset=utf-8
Received-SPF: pass client-ip=185.70.40.18; envelope-from=vit9696@protonmail.com;
 helo=mail1.protonmail.ch
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 FREEMAIL_REPLYTO_END_DIGIT=0.25, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: vit9696 <vit9696@protonmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
-----------------------fee1e582d221190900416a64b20e0190
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.60.0.2.21\))
Subject: Re: [PATCH 1/2] i386/acpi: fix inconsistent QEMU/OVMF device paths
From: vit9696 <vit9696@protonmail.com>
In-Reply-To: <20210301200834.2def369a@redhat.com>
Date: Mon, 1 Mar 2021 23:04:54 +0300
Cc: Laszlo Ersek <lersek@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Stefan Reiter <s.reiter@proxmox.com>,
 qemu devel list <qemu-devel@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Message-Id: <44747FC8-51F7-420D-B6B0-8CBEBF668B7E@protonmail.com>
References: <20200730155755.188845-1-mst@redhat.com>
 <5b40e1ac-03ca-7954-4d50-f5f96c339772@proxmox.com>
 <20210228154208-mutt-send-email-mst@kernel.org>
 <20210301142819.66b94a4e@redhat.com>
 <20210301111254-mutt-send-email-mst@kernel.org>
 <14c5dafe-ac7c-d1c9-ba51-325a3a0252a7@redhat.com>
 <SBAa1fsGiwSIyDQ7pfUk7MDdSxnH73ir1zTEhOY3bh9fjdJet-gyYOO8cG1pSWSoc6mw_dWBcHCTyVnhokwyUw==@protonmail.internalid>
 <20210301200834.2def369a@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>,
 Thomas Lamprecht <t.lamprecht@proxmox.com>
X-Mailer: Apple Mail (2.3654.60.0.2.21)

SSBwcm92aWRlZCB0aGUgaW5pdGlhbCB2ZXJzaW9uIG9mIHRoZSBwYXRjaCB0byB0aGUgbWFpbGlu
ZyBsaXN0Og0KW1BBVENIXSBpMzg2L2FjcGk6IHJlc3RvcmUgZGV2aWNlIHBhdGhzIGZvciBwcmUt
NS4xIHZtcw0KDQpVbmZvcnR1bmF0ZWx5IEkgZG8gbm90IGhhdmUgZWFzeSBhY2Nlc3MgdG8gYSBW
TSB3aGVyZSBJIGNhbiB0ZXN0IGl0IGF0IHRoZSBtb21lbnQuIFBsZWFzZSBtYWtlIHN1cmUgdGhh
dCBpdCB3b3JrcyBmb3IgeW91IGFuZCByZXBseSB3aXRoIGBUZXN0ZWQtYnlgLg0KDQpUaGFua3Ms
DQpWaXRhbHkNCg0KPiAxINC80LDRgNGC0LAgMjAyMSDQsy4sINCyIDIyOjA4LCBJZ29yIE1hbW1l
ZG92IDxpbWFtbWVkb0ByZWRoYXQuY29tPiDQvdCw0L/QuNGB0LDQuyjQsCk6DQo+IA0KPiANCj4g
T24gTW9uLCAxIE1hciAyMDIxIDE3OjI4OjA1ICswMTAwDQo+IExhc3psbyBFcnNlayA8bGVyc2Vr
QHJlZGhhdC5jb20+IHdyb3RlOg0KPiANCj4+IE9uIDAzLzAxLzIxIDE3OjE0LCBNaWNoYWVsIFMu
IFRzaXJraW4gd3JvdGU6DQo+Pj4gT24gTW9uLCBNYXIgMDEsIDIwMjEgYXQgMDI6Mjg6MTlQTSAr
MDEwMCwgSWdvciBNYW1tZWRvdiB3cm90ZToNCj4+IA0KPj4+PiBIb3cgYWJvdXQ6DQo+Pj4+ICog
YnVnZ3kgQUNQSSBmb3IgNS4xIG1hY2hpbmUgdHlwZXMgYW5kIG9sZGVyDQo+Pj4+ICogZml4ZWQg
QUNQSSBmb3IgNS4yIGFuZCBuZXdlcj8NCj4+PiANCj4+PiBFeGFjdGx5Lg0KPj4gDQo+PiBTb3Vu
ZHMgT0sgdG8gbWUgYXMgd2VsbCAoZXZlbiB0aG91Z2ggaXQncyBxdWl0ZSB1bmZvcnR1bmF0ZSB0
aGF0IHRoaXMgaXMNCj4+IG9uZSBvZiB0aG9zZSBleGNlcHRpb25zIHRoYXQgcmVxdWlyZSB1cyB0
byB2ZXJzaW9uIHRoZSBBQ1BJIGdlbmVyYXRvcikuDQo+IGl0IGlzIHVuZm9ydHVuYXRlLCBhbmQg
SSBkbyByZXNpc3QgdG8gc3VjaCBjaGFuZ2VzIHVzdWFsbHkuDQo+IGluIHRoaXMgY2FzZSwgSSBm
aWxsIGF2b2lkaW5nIGNvbXBsYWludHMvYnVnIHJlcG9ydHMganVzdGlmaWVzIHN1Y2ggZXhjZXB0
aW9uLg0KPiANCj4gDQo+PiBUaGFua3MNCj4+IExhc3psbw0KPj4gDQo+PiANCj4gDQoNCg==
-----------------------fee1e582d221190900416a64b20e0190
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: ProtonMail

wsCUBAEBCAAnBQJgPUkkCRBPsoxt7Hy0xRYhBERSlkTqW1Te3v1Bj0+yjG3s
fLTFACEJEE+yjG3sfLTFFiEERFKWROpbVN7e/UGPT7KMbex8tMXW1wf+OQth
8kZHDuAv1ifRtGT2ulhybjHU6Y/Ffb6dPRtTnEvQ7LJqo5CRq6zjUiceIpqo
CQTd7MJiLhnkt4qbA7+LaKl1xbtxsD6twupM8D9DU6DH8yCM2pu8mnHJ6PPd
3/u+sgu3XT33qcyG+2st341wC0dDkvllmlumA2ZHplu76MDN85wzcBa/yzTq
+S4y0HxfiYrHl5ibllNWZMVY0B9R6+ZTAEZV19YfGbYEkpqwGkEeL2etdMqC
Y4Pzzaz90WD9rX4CX/D4qIVgz4OxzyWQ8WtpeuiAbrpvnIWTXjQSNUx7QuIP
ar6xpmzR5ujr2O7dYxEk5Y+kdEn2Hexp54Dfpw==
=CMC9
-----END PGP SIGNATURE-----


-----------------------fee1e582d221190900416a64b20e0190--


