Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D22026D64EB
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 16:12:49 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjhNc-0002Uy-5U; Tue, 04 Apr 2023 10:11:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <erdnaxe@crans.org>)
 id 1pja4d-0008AN-NU; Tue, 04 Apr 2023 02:23:19 -0400
Received: from redisdead.crans.org ([185.230.79.39])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <erdnaxe@crans.org>)
 id 1pja4b-0003Fh-K7; Tue, 04 Apr 2023 02:23:19 -0400
Received: from [192.168.1.21] (41.169.89.92.rev.sfr.net [92.89.169.41])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by redisdead.crans.org (Postfix) with ESMTPSA id D137A218;
 Tue,  4 Apr 2023 08:23:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=crans.org; s=mail;
 t=1680589385; bh=Fj25J7vboI1OAuzqs9WhgF682ENnfIJoNrbt8d/MnxE=;
 h=Date:To:Cc:References:From:Subject:In-Reply-To:From;
 b=ecYjFCGc3DBazoiEb15I8gy5+4YHd8q8TN1c2xeA/mD3fmhUWTUdv/lIqy2xuqOzx
 2kcefe/Qkk/JfshIuZGahqpL9RAa2+mQVs1ECTxCp5qWZPYOk6Y/oH04LtRtg3GW+s
 CdEk4Dev2Co/DAQZD7xI36qFCNs/kIIaHnDSqg+JjetniS6e6L3i7fzdrksUVkjgKI
 +Tu4DkBvGQlup3N+guduui+5qASBiMHjacBcSPwddmcu2/oTulweUlDTTw+WozPyxQ
 QboYHF/VZEnavLJnzPp3/zwikQHrF/517TVCmOg/KaQfPu1e9YXciS1cflked0kPMY
 oFAsUh7HPefKAcNIZ/KoDX3ozrWdBlguKcRXBcxbP0/K++F6iLBfg0Z5LYwd6Q7VGz
 wWFNXOGga9fhOEola6Gn6K5Dwos/xcyXGzZ9ZuxgFwOcVz+Xl/+E6Lozib2Nq6R2U/
 UkDRPiodOZIT7Y+8eUGI9gbu8g4oakrG6gjUI1os3CA/af2E8campwP9SGuZ9dRA79
 o+8SWLLR48qE3Ny9KY36q+KJ2pl9T+Pqnk3DE+IlO9lhuAiz5VFKcMpqqYabG2nrRw
 Wg+5zT0VypajeNH8UtbkLNdXcatLgmcPTPB01a3F5VWylRh5rMrh96MPCsItl2wrJb
 flDkG/LRih+pjoumSl7pJoko=
Message-ID: <3c2d07b5-ef07-998a-df15-9dc38a4e474e@crans.org>
Date: Tue, 4 Apr 2023 08:22:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
To: "Lucas C. Villa Real" <lucas@osdyne.com>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: Lucas Villa Real <lucasvr@gmail.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230403121537.71320-1-lucas@osdyne.com>
 <CAFEAcA9ERb4a8kwcgtr3VAxnjaCuOVnKFJ56FfkNx=F73a0o-A@mail.gmail.com>
 <CAL+Dfo6ysWqeKCR5p4_JMazjgdwqq5+kdYxTXVpHE0oZNMVpOQ@mail.gmail.com>
From: Alexandre IOOSS <erdnaxe@crans.org>
Organization: Crans
Subject: Re: [PATCH] stm32vldiscovery: allow overriding of RAM size
In-Reply-To: <CAL+Dfo6ysWqeKCR5p4_JMazjgdwqq5+kdYxTXVpHE0oZNMVpOQ@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------tX0bH3ZA9cAGF3U44ywBdPca"
Received-SPF: pass client-ip=185.230.79.39; envelope-from=erdnaxe@crans.org;
 helo=redisdead.crans.org
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.349,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 04 Apr 2023 10:11:21 -0400
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
--------------tX0bH3ZA9cAGF3U44ywBdPca
Content-Type: multipart/mixed; boundary="------------UZ4pqPR89vgxN08KixPcU1us";
 protected-headers="v1"
From: Alexandre IOOSS <erdnaxe@crans.org>
To: "Lucas C. Villa Real" <lucas@osdyne.com>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: Lucas Villa Real <lucasvr@gmail.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Message-ID: <3c2d07b5-ef07-998a-df15-9dc38a4e474e@crans.org>
Subject: Re: [PATCH] stm32vldiscovery: allow overriding of RAM size
References: <20230403121537.71320-1-lucas@osdyne.com>
 <CAFEAcA9ERb4a8kwcgtr3VAxnjaCuOVnKFJ56FfkNx=F73a0o-A@mail.gmail.com>
 <CAL+Dfo6ysWqeKCR5p4_JMazjgdwqq5+kdYxTXVpHE0oZNMVpOQ@mail.gmail.com>
In-Reply-To: <CAL+Dfo6ysWqeKCR5p4_JMazjgdwqq5+kdYxTXVpHE0oZNMVpOQ@mail.gmail.com>

--------------UZ4pqPR89vgxN08KixPcU1us
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gNC8zLzIzIDE2OjQ4LCBMdWNhcyBDLiBWaWxsYSBSZWFsIHdyb3RlOg0KPiBPbiBNb24s
IEFwciAzLCAyMDIzIGF0IDEwOjU04oCvQU0gUGV0ZXIgTWF5ZGVsbCA8cGV0ZXIubWF5ZGVs
bEBsaW5hcm8ub3JnIA0KPiA8bWFpbHRvOnBldGVyLm1heWRlbGxAbGluYXJvLm9yZz4+IHdy
b3RlOg0KPiANCj4gICAgIE9uIE1vbiwgMyBBcHIgMjAyMyBhdCAxMzo1MSwgTHVjYXMgVmls
bGEgUmVhbCA8bHVjYXN2ckBnbWFpbC5jb20NCj4gICAgIDxtYWlsdG86bHVjYXN2ckBnbWFp
bC5jb20+PiB3cm90ZToNCj4gICAgICA+DQo+ICAgICAgPiBzdG0zMnZsZGlzY292ZXJ5IGNv
bWVzIHdpdGggOEtCIG9mIFNSQU0sIHdoaWNoIG1heSBiZSB0b28gbG93IHdoZW4NCj4gICAg
ICA+IHJ1bm5pbmcgc29tZSB3b3JrbG9hZHMgb24gUUVNVS4gVGhlIGNvbW1hbmQgbGluZSBh
cmd1bWVudCAiLW0NCj4gICAgIG1lbV9zaXplIg0KPiAgICAgID4gaXMgbm90IHJlY29nbml6
ZWQgYnkgdGhlIGN1cnJlbnQgaW1wbGVtZW50YXRpb24sIHRob3VnaCwgc28gb25lDQo+ICAg
ICBjYW5ub3QNCj4gICAgICA+IGVhc2lseSBvdmVycmlkZSB0aGUgZGVmYXVsdCBtZW1vcnkg
c2l6ZS4NCj4gICAgICA+DQo+ICAgICAgPiBUaGlzIHBhdGNoIGZpeGVzIHRoYXQgYnkgYWRk
aW5nIGEgbWVtb3J5IHN1YnJlZ2lvbiBhY2NvcmRpbmcgdG8gdGhlDQo+ICAgICAgPiB2YWx1
ZSBwcm92aWRlZCBvbiB0aGF0IGNvbW1hbmQgbGluZSBhcmd1bWVudC4gSWYgYWJzZW50LCB0
aGUgZGVmYXVsdA0KPiAgICAgID4gdmFsdWUgb2YgOEtCIHN0aWxsIGFwcGxpZXMuDQo+ICAg
ICAgPg0KPiAgICAgID4gU2lnbmVkLW9mZi1ieTogTHVjYXMgVmlsbGEgUmVhbCA8bHVjYXNA
b3NkeW5lLmNvbQ0KPiAgICAgPG1haWx0bzpsdWNhc0Bvc2R5bmUuY29tPj4NCj4gDQo+ICAg
ICBEb2VzIHRoZSByZWFsIGhhcmR3YXJlIGhhdmUgKG9wdGlvbnMgZm9yKSBtb3JlIHRoYW4g
OEsgb2YgU1JBTSBoZXJlID8NCj4gDQo+ICAgICB0aGFua3MNCj4gICAgIC0tIFBNTQ0KPiAN
Cj4gDQo+IFllcywgaXQncyBwb3NzaWJsZSB0byBhZGQgbW9yZSAocClTUkFNIHZpYSB0aGUg
U1RNMzJGMTB4eHgncyBGU01DIA0KPiAoZmxleGlibGUgc3RhdGljIG1lbW9yeSBjb250cm9s
bGVyKS4gVGhlIG5ldyBtZW1vcnkgaXMgbWFwcGVkIHRvIEZTTUMgDQo+IGJhbmsgMSBhdCAw
eDYwMDBfMDAwMCwgdGhvdWdoIChhcyBvcHBvc2VkIHRvIHRoZSBlbWJlZGRlZCBTUkFNJ3Mg
Zml4ZWQgDQo+IGFkZHJlc3MgYXQgMHgyMDAwXzAwMDApLCBhcyBJIGhhdmUgbm93IHJlYWxp
emVkLiBJJ20gaGFwcHkgdG8gc2VuZCBhbiANCj4gdXBkYXRlZCBwYXRjaCBzbyB0aGF0ICIt
bSBtZW1fc2l6ZSIgY3JlYXRlcyBhIG1lbW9yeSBzdWJyZWdpb24gYXQgDQo+IDB4NjAwMF8w
MDAwIGluc3RlYWQuDQo+IA0KPiBCZXN0IHJlZ2FyZHMsDQo+IEx1Y2FzDQo+IA0KDQpMb29r
aW5nIGF0IHRoZSBTVE0zMkYxMDB4eCByZWZlcmVuY2UgbWFudWFsIHBhZ2UgNDk0IA0KKGh0
dHBzOi8vd3d3LnN0LmNvbS9yZXNvdXJjZS9lbi9yZWZlcmVuY2VfbWFudWFsL3JtMDA0MS1z
dG0zMmYxMDB4eC1hZHZhbmNlZC1hcm1iYXNlZC0zMmJpdC1tY3VzLXN0bWljcm9lbGVjdHJv
bmljcy5wZGYpLCANCkZTTUMgaXMgb25seSBwcmVzZW50IG9uIGhpZ2gtZGVuc2l0eSB2YWx1
ZSBsaW5lIGRldmljZXMgb25seS4gVGhpcyBpcyANCm5vdCB0aGUgY2FzZSBvZiB0aGUgU1RN
MzJWTERJU0NPVkVSWSB3aGljaCB1c2VzIGEgU1RNMzJGMTAwUkIgDQoobG93L21lZGl1bS1k
ZW5zaXR5IHZhbHVlIGxpbmUpLg0KDQpDb3JyZWN0IG1lIGlmIEknbSB3cm9uZywgYnV0IEkg
YmVsaWV2ZSB5b3UgY2Fubm90IGJ1eSBhIFNUTTMyVkxESVNDT1ZFUlkgDQp0aGF0IGNvdWxk
IHN1cHBvcnQgRlNNQyBvciBoYXZlIG1vcmUgdGhhbiA4S0Igb2Ygb24tY2hpcCBTUkFNLg0K
DQpIb3dldmVyLCBjb3VsZCBpdCBiZSBhIGdvb2QgaWRlYSB0byBpbXBsZW1lbnQgYSBnZW5l
cmljIFNUTTMyRjEwMHh4IA0KbWFjaGluZSBpbiBRRU1VIHRoYXQgaXMgImhpZ2gtZGVuc2l0
eSIgYnkgZGVmYXVsdCBhbmQgdGhhdCBjb3VsZCBiZSANCmNvbmZpZ3VyZWQgdXNpbmcgY29t
bWFuZCBsaW5lIG9wdGlvbnMgPyBUaGlzIGNvdWxkIGNvdmVyIGEgd2lkZSByYW5nZSBvZiAN
CmNhc2VzIHdpdGggYSBzaW5nbGUgbWFjaGluZS4NCg0KVGhhbmtzLA0KLS0gDQpBbGV4YW5k
cmUNCg==

--------------UZ4pqPR89vgxN08KixPcU1us--

--------------tX0bH3ZA9cAGF3U44ywBdPca
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEELTca0n4rvHeX4bdZbHknjz/NzAIFAmQrwkMFAwAAAAAACgkQbHknjz/NzAKH
6hAAj0fFC0AbOd9epjFsXrc48B461Mmgx+XsK/1b0cdoFQc67g5HVTAV+ZKu4TDIDawQRld60xVr
HqkY8ojbgrvrGHJxhNmyKdfL1TYicMTAMbKa+LbJ/SvnQTBSbsDsROzMubzUjjCmE7dVB1sO4l6F
yqFTSoSeE96L9f3fEB0s6BOQuNErM94qERfJj1mwiJoe53aCkE28ms6e+eXfA7JHLMN3DehHupYy
iIls4kV2puFplgtWod1XFt9S/p7XzczyBPCWatO7X0YA00CZKsk9hVFW6ZGhTW4uJe9wqnHlbHJA
3E76UEEYUro+4wPeR/K8vPoUckpW4u3g6as5zqQlaZRfrXIA4rxk7Zvo4wswv90t0AwN3EPjHf/V
uZs4/astBZIkIEgEr8hPQppYCG9ot5WNFusJ/V+4AHOnuyz2C/+ZfE49jnz6mD7l8L4ihyxp3vmx
qpM/8cUVyJL1cJGdG15kCF40kahZjDNBbQgbrfGX1zhfjNZqwhms0i862lIWgW0eXbPG75hubWPk
kJLEFAg9vQEQaKx0X4BFFD2p4BuqjUqoDwNWtLCh4jdvlgI3hcj/pOGZNHDjjGa3zL3PZbPz3AX3
TZD5OPzedWrzmHXKZyimOlu4QOE19YxNNl28JEpI4tk2xvH8na+174RgbiAUnR5GoFLt2uj/EEYE
xoY=
=Apdd
-----END PGP SIGNATURE-----

--------------tX0bH3ZA9cAGF3U44ywBdPca--

