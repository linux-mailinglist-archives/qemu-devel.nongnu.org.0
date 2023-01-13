Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B09B266A0D7
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 18:37:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGNvN-0002rg-Gx; Fri, 13 Jan 2023 12:33:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <unisono@quyllur.org>)
 id 1pGNvH-0002kY-8a; Fri, 13 Jan 2023 12:32:59 -0500
Received: from quyllur.org ([185.247.226.42])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim 4.90_1) (envelope-from <unisono@quyllur.org>)
 id 1pGNvE-0004ym-Bi; Fri, 13 Jan 2023 12:32:58 -0500
Received: from quyllur.org (localhost [127.0.0.1])
 by quyllur.org (OpenSMTPD) with ESMTP id 0cc3a2e8;
 Fri, 13 Jan 2023 19:32:49 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=quyllur.org; h=message-id
 :date:mime-version:to:cc:references:from:subject:in-reply-to
 :content-type; s=dkimselector; bh=BSmWfKKNoutZ92Rvb/gIBfzo1nE=; b=
 PNxaUk+aoc7KdVj4k7lnb8eofs8MkIA1b7cmarAVFixiUAz5U4FEb+5SIlvNBD3O
 sGkUTwVNP02du+3g9VsOMPbXUoh/PAp3w8qhAeyevr6/JCqPrLU+Q4/f7xEgo01u
 Kl5C1O4qHBI4HcJ53cDRMUQoG4/NQEpEWmkWpPwuK7U=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=quyllur.org; h=message-id
 :date:mime-version:to:cc:references:from:subject:in-reply-to
 :content-type; q=dns; s=dkimselector; b=aSB5do4q5g/JfOFdXyLfxFCe
 T4BaBA+ERVYUYwWLLiuIkXJf1suDusP5g2YEDESnEY94hQ8Phz/bc1m3WJpU0zNR
 bltMfDZPF6C3rj6z/bowY0ZOqVnih29StNhLPtVOZntz5gtgEKPdZm9e3mEiBOPC
 SA+A8fNMHON0EH6FqIY=
Received: from [10.137.0.52] (h-217.114.218.21.keyweb.de [217.114.218.21])
 by quyllur.org (OpenSMTPD) with ESMTPSA id 5dbb51ff
 (TLSv1.3:TLS_CHACHA20_POLY1305_SHA256:256:NO); 
 Fri, 13 Jan 2023 19:32:49 +0200 (EET)
Message-ID: <6efd38a4-8a2a-fbd1-c706-fccc380eb00d@quyllur.org>
Date: Fri, 13 Jan 2023 12:32:38 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-arm <qemu-arm@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 capstone-users@lists.sourceforge.net
References: <c4ec12d4-e07c-ada9-5cec-744dae7c069b@quyllur.org>
 <f1c34dd3-7e90-ff40-a1e0-b35f031b3a15@redhat.com>
From: Rot127 <unisono@quyllur.org>
Subject: Re: [Capstone] Feedback request for new architecture updater
In-Reply-To: <f1c34dd3-7e90-ff40-a1e0-b35f031b3a15@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------jjJM0K3dYGHpxkqEu0AcHlB0"
Received-SPF: pass client-ip=185.247.226.42; envelope-from=unisono@quyllur.org;
 helo=quyllur.org
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------jjJM0K3dYGHpxkqEu0AcHlB0
Content-Type: multipart/mixed; boundary="------------wx0sqlpqWV9kaEg0GURsuiTl";
 protected-headers="v1"
From: Rot127 <unisono@quyllur.org>
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-arm <qemu-arm@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 capstone-users@lists.sourceforge.net
Message-ID: <6efd38a4-8a2a-fbd1-c706-fccc380eb00d@quyllur.org>
Subject: Re: [Capstone] Feedback request for new architecture updater
References: <c4ec12d4-e07c-ada9-5cec-744dae7c069b@quyllur.org>
 <f1c34dd3-7e90-ff40-a1e0-b35f031b3a15@redhat.com>
In-Reply-To: <f1c34dd3-7e90-ff40-a1e0-b35f031b3a15@redhat.com>

--------------wx0sqlpqWV9kaEg0GURsuiTl
Content-Type: multipart/mixed; boundary="------------sHFoms6nzlXg0j96YWuhqxxg"

--------------sHFoms6nzlXg0j96YWuhqxxg
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkhDQoNCiA+IERvIHlvdSBoYXZlIGFueSBwbGFucyB0byB3b3JrIG9uIFNwYXJjIGFuZCBN
aXBzIGFueSB0aW1lIHNvb24/DQoNClRoZSBwbGFuIGlzIHRvIHVwZGF0ZSBBUk0gYW5kIFBQ
QyBmaXJzdCwgYmVjYXVzZSB0aGV5IHNlZW1lZCB0byBiZSB0aGUgDQptb3N0IGNvbXBsaWNh
dGVkIG9uZXMuDQpBZnRlcndhcmRzIG90aGVyIGFyY2hpdGVjdHVyZXMgKE1pcHMgYW5kIFNw
YXJjIGFzIHdlbGwpLg0KSSBjYW4ndCBzYXkgd2hlbiBleGFjdGx5IEFSTSB3aWxsIGJlIHJl
YWR5IChJIGhvcGUgYXQgbGF0ZXN0IGVuZCBvZiANCkZlYnJ1YXJ5LCBidXQgSSBjYW4ndCBw
cm9taXNlIGl0KS4NClVwZGF0aW5nIHRoZSBvdGhlciBhcmNoaXRlY3R1cmVzIGlzIHRoZW4g
d2F5IHNpbXBsZXIsIGJlY2F1c2UgdGhlIA0KcmVmYWN0b3JlZCBMTFZNIGJhY2tlbmRzIHdv
bid0IG5lZWQgbXVjaCB3b3JrLg0KDQogPiBJZiBub3QsIGRvIHlvdSBoYXZlIHNvbWUgc2hv
cnQgKHNoZWxsKSBpbnN0cnVjdGlvbnMgaG93IHRoZSB1cGRhdGUgDQpwcm9jZXNzIHRoZW9y
ZXRpY2FsbHkgd29ya3MNCg0KSW4gdGhlIFBSIGRlc2NyaXB0aW9uIEkgbWVudGlvbiBhIFJF
QURNRSB3aGVyZSB5b3UgY2FuIHN0YXJ0LiBJdCBzaG91bGQgDQpleHBsYWluIHRoZSBvdmVy
YWxsIHByb2Nlc3MuDQpJZiBub3QsIHBsZWFzZSBsZXQgbWUga25vdyBzbyBJIGNhbiBpbXBy
b3ZlIHRoZSBkb2N1bWVudGF0aW9uLg0KDQpPbiAxLzEzLzIzIDA0OjI3LCBUaG9tYXMgSHV0
aCB3cm90ZToNCj4gT24gMTIvMDEvMjAyMyAxNy4yNCwgUm90MTI3IHdyb3RlOg0KPj4gSSBj
dXJyZW50bHkgd29yayBvbiBhIG5ldyB1cGRhdGVyIGZvciBhcmNoaXRlY3R1cmUgbW9kdWxl
cyBpbiBDYXBzdG9uZS4NCj4+DQo+PiBUaGUgY3VycmVudCB1cGRhdGUgcHJvY2VzcyBoYXMg
dGhlIHByb2JsZW0gdGhhdCBpdCBpcyBhIGxvdCBvZiBtYW51YWwgDQo+PiB3b3JrLg0KPj4g
U3luY2luZyB0aGUgaW5mb3JtYXRpb24gZnJvbSBMTFZNIHRvIENhcHN0b25lIHJlcXVpcmVz
IGEgb25lIHRvIA0KPj4gdHJhbnNsYXRlIGEgbG90IG9mIEMrKyB0byBDIGNvZGUgYW5kIGZp
eCBhIHRvbiBvZiBidWlsZCBlcnJvcnMuDQo+PiBUaGlzIGxlYWQgdG8gYXJjaGl0ZWN0dXJl
IG1vZHVsZXMgbm90IGdldHRpbmcgdXBkYXRlZC4gU28gdGhlcmUgYXJlIA0KPj4gbWFueSBu
ZXcgaW5zdHJ1Y3Rpb25zIGluIENhcHN0b25lIHdoaWNoIGFyZSBub3Qgc3VwcG9ydGVkLg0K
Pj4NCj4+IFRoZSBuZXcgdXBkYXRlciB3aWxsIHRha2UgYXdheSBhcyBtdWNoIG1hbnVhbCB3
b3JrIGFzIHBvc3NpYmxlLg0KPj4gSXQgZG9lcyB0aGlzIGJ5IHRyYW5zbGF0aW5nIG1vc3Qg
QysrIHRvIEMgdmlhIGEgbGl0dGxlIHRyYW5zbGF0aW9uIA0KPj4gdG9vbCBhbmQgdXNlcyBy
ZWZhY3RvcmVkIExMVk0tVGFibGVHZW4gYmFja2VuZHMgd2hpY2ggZW1pdCBkaXJlY3RseSAN
Cj4+IHRoZSBjb2RlIENhcHN0b25lIG5lZWRzLg0KPj4gQ3VycmVudGx5IGl0IGlzIGluIGEg
ZWFybHkgc3RhZ2UgYnV0IGl0IGlzIHJlYWR5IHRvIHJlY2VpdmUgc29tZSANCj4+IGZlZWRi
YWNrLg0KPj4NCj4+IElmIGFueW9uZSBmaW5kcyB0aGUgdGltZSB0byB0YWtlIGEgbG9vayBh
dCBpdCBhbmQgd3JpdGUgZG93biB0aGVpciANCj4+IHRob3VnaHRzLCBzdWdnZXN0aW9ucyBv
ciBpbXByb3ZlbWVudCBpZGVhcywgSSB3b3VsZCBiZSB2ZXJ5IGdyYXRlZnVsLg0KPj4NCj4+
IENhcHN0b25lIGRyYWZ0IFBSOiBodHRwczovL2dpdGh1Yi5jb20vY2Fwc3RvbmUtZW5naW5l
L2NhcHN0b25lL3B1bGwvMTk0OQ0KPg0KPiDCoEhpIQ0KPg0KPiBUaGFua3MgZm9yIHRoZSBo
ZWFkcyB1cCEgSSBzZWUgeW91ciBwdWxsIHJlcXVlc3QgYWRkcmVzc2VzIHRoZSBBUk0gDQo+
IHBhcnQgb2YgQ2Fwc3RvbmUsIHNvIEkgQ0M6LWVkIHFlbXUtYXJtQG5vbmdudS5vcmcgaW4g
Y2FzZSBhbnlib2R5IA0KPiB0aGVyZSB3YW50cyB0byBnaXZlIGl0IGEgdHJ5Lg0KPg0KPiBG
cm9tIG15IHBlcnNvbmFsIHBvaW50IG9mIHZpZXcsIHdoYXQgSSByZWFsbHkgd291bGQgbG92
ZSB0byBzZWUgaXMgYW4gDQo+IHVwZGF0ZSBmb3Igc3BhcmMgYW5kIG1pcHMgaW4gdGhlIG5l
eHQgdmVyc2lvbiBvZiBDYXBzdG9uZSwgc28gd2UgY291bGQgDQo+IGZpbmFsbHkgZ2V0IG9m
IHRoZSBvbGQgZGlzYXMvc3BhcmMuYyBhbmQgZGlzYXMvbWlwcy5jIGZpbGVzIGluIFFFTVUg
DQo+ICh3aGljaCB3ZXJlIHN0aWxsIGRpc2Fzc2VtYmxpbmcgbW9yZSBpbnN0cnVjdGlvbnMg
dGhhbiBDYXBzdG9uZSA0LjAsIA0KPiBzbyB3ZSBrZXB0IHRoZW0gLi4uIGJ1dCBBRkFJSyB0
aGUgdXBzdHJlYW0gTExWTSBjb2RlIGltcGxlbWVudGVkIG1hbnkgDQo+IG1pc3NpbmcgaW5z
dHJ1Y3Rpb25zIGluIHRoZSBwYXN0IHllYXJzLCBzbyBpZiBDYXBzdG9uZSBnZXRzIHJlZnJl
c2hlZCwgDQo+IGl0IHNob3VsZCBiZSBnb29kIGVub3VnaCB0byByZXBsYWNlIHRoZSBvbGQg
Y29kZSBub3cpLg0KPg0KPiBEbyB5b3UgaGF2ZSBhbnkgcGxhbnMgdG8gd29yayBvbiBTcGFy
YyBhbmQgTWlwcyBhbnkgdGltZSBzb29uPyBJZiBub3QsIA0KPiBkbyB5b3UgaGF2ZSBzb21l
IHNob3J0IChzaGVsbCkgaW5zdHJ1Y3Rpb25zIGhvdyB0aGUgdXBkYXRlIHByb2Nlc3MgDQo+
IHRoZW9yZXRpY2FsbHkgd29ya3MgLSBtYXliZSBzb21lb25lIGVsc2UgY2FuIGhlbHA/DQo+
DQo+IMKgVGhhbmtzLA0KPiDCoCBUaG9tYXMNCj4NCg==
--------------sHFoms6nzlXg0j96YWuhqxxg
Content-Type: application/pgp-keys; name="OpenPGP_0xC7A9CFBEECA2EF5A.asc"
Content-Disposition: attachment; filename="OpenPGP_0xC7A9CFBEECA2EF5A.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
okajPmaG6RWWMtgL
=3DJky5
-----END PGP PUBLIC KEY BLOCK-----

--------------sHFoms6nzlXg0j96YWuhqxxg--

--------------wx0sqlpqWV9kaEg0GURsuiTl--

--------------jjJM0K3dYGHpxkqEu0AcHlB0
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

iQGzBAEBCAAdFiEEaHL1DWKPrLF6BbPeOBK4JYgQr2cFAmPBlbcACgkQOBK4JYgQ
r2c3gQwApoufd85IDQetp3HcAsX1ORsNyCifCX/jeDSW66Z0NqIcadGcFW+f6kfl
xUyyhU4BOT+m7TqNDGDJDRVAoJVbbq9s54ilHShl6IZN+vf4ZqGAIKWKZffLpSyN
KDjaK1LGmNPKMni8v7xepFaPE2PDim0Gb4Z+o1GNgkZEfD8jKF2Pz6hA06Eu1SYt
UjJxrptpt/ewFNKQIw3ZBD4RwvDFMFCi9bg1UCNSOeeulpQaCsqw14WJb1fv3YaN
YV02cepXPNMHU6DGcm3l7IhIfTuljU1ZZV4FDpr0f419u1bV7V08AVXQI6BSYxUG
HQPlBaYMB6Oqx8JYnp2ajShpuLxfOZ3/J+YaZav4+FnFQljyigrwRIoa3FcWTdpd
aRtsht4IpIV6kmIa93r4UliS4aiM2U5DWLltpKn5PtLnYbLUimUvlV3oUfM0kXjc
xJlFlTexaYQahACFbfN7JAnvqfq4DCk/Pc5y/ZCzVtKG80fx6hTL7Wr9YSYgXFzf
bSqFx/Gz
=6JI5
-----END PGP SIGNATURE-----

--------------jjJM0K3dYGHpxkqEu0AcHlB0--

