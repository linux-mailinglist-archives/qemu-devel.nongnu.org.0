Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C830612454
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Oct 2022 17:59:07 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oooDJ-0000oM-Dh; Sat, 29 Oct 2022 11:57:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>)
 id 1oooDH-0000n5-0k; Sat, 29 Oct 2022 11:57:35 -0400
Received: from mail.weilnetz.de ([37.120.169.71]
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>)
 id 1oooDF-0005A0-2l; Sat, 29 Oct 2022 11:57:34 -0400
Received: from [192.168.178.59] (p5b151d14.dip0.t-ipconnect.de [91.21.29.20])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTPSA id CB4F6DA0C54;
 Sat, 29 Oct 2022 17:57:29 +0200 (CEST)
Message-ID: <2945db85-c6cc-4cb6-971d-d380ceb6b944@weilnetz.de>
Date: Sat, 29 Oct 2022 17:57:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: [PATCH 5/7] block/nfs: Fix 32-bit Windows build
To: Bin Meng <bmeng.cn@gmail.com>, qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Peter Lieven <pl@kamp.de>,
 qemu-block@nongnu.org
References: <20220908132817.1831008-1-bmeng.cn@gmail.com>
 <20220908132817.1831008-6-bmeng.cn@gmail.com>
In-Reply-To: <20220908132817.1831008-6-bmeng.cn@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------xcTx2FX8P93PnGJXX6F8nABZ"
Received-SPF: pass client-ip=37.120.169.71; envelope-from=sw@weilnetz.de;
 helo=mail.v2201612906741603.powersrv.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Reply-to:  Stefan Weil <sw@weilnetz.de>
From:  Stefan Weil via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------xcTx2FX8P93PnGJXX6F8nABZ
Content-Type: multipart/mixed; boundary="------------mekadFoEQTeAx6I99V2PyStN";
 protected-headers="v1"
From: Stefan Weil <sw@weilnetz.de>
To: Bin Meng <bmeng.cn@gmail.com>, qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Peter Lieven <pl@kamp.de>,
 qemu-block@nongnu.org
Message-ID: <2945db85-c6cc-4cb6-971d-d380ceb6b944@weilnetz.de>
Subject: Re: [PATCH 5/7] block/nfs: Fix 32-bit Windows build
References: <20220908132817.1831008-1-bmeng.cn@gmail.com>
 <20220908132817.1831008-6-bmeng.cn@gmail.com>
In-Reply-To: <20220908132817.1831008-6-bmeng.cn@gmail.com>

--------------mekadFoEQTeAx6I99V2PyStN
Content-Type: multipart/mixed; boundary="------------rwrY7X0bIVKzdJwGLazh8a0M"

--------------rwrY7X0bIVKzdJwGLazh8a0M
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

QW0gMDguMDkuMjIgdW0gMTU6Mjggc2NocmllYiBCaW4gTWVuZzoNCj4gRnJvbTogQmluIE1l
bmcgPGJpbi5tZW5nQHdpbmRyaXZlci5jb20+DQo+IA0KPiBsaWJuZnMuaCBkZWNsYXJlcyBu
ZnNfZnN0YXQoKSBhcyB0aGUgZm9sbG93aW5nIGZvciB3aW4zMjoNCj4gDQo+ICAgIGludCBu
ZnNfZnN0YXQoc3RydWN0IG5mc19jb250ZXh0ICpuZnMsIHN0cnVjdCBuZnNmaCAqbmZzZmgs
DQo+ICAgICAgICAgICAgICAgICAgc3RydWN0IF9fc3RhdDY0ICpzdCk7DQo+IA0KPiBUaGUg
J3N0JyBwYXJhbWV0ZXIgc2hvdWxkIGJlIG9mIHR5cGUgJ3N0cnVjdCBfX3N0YXQ2NCcuIFRo
ZQ0KPiBjb2RlcyBoYXBwZW4gdG8gYnVpbGQgc3VjY2Vzc2Z1bGx5IGZvciA2NC1iaXQgV2lu
ZG93cywgYnV0IGl0DQo+IGRvZXMgbm90IGJ1aWxkIGZvciAzMi1iaXQgV2luZG93cy4NCj4g
DQo+IEZpeGVzOiA2NTQyYWE5Yzc1YmMgKCJibG9jazogYWRkIG5hdGl2ZSBzdXBwb3J0IGZv
ciBORlMiKQ0KPiBGaXhlczogMThhODA1NmUwYmM3ICgiYmxvY2svbmZzOiBjYWNoZSBhbGxv
Y2F0ZWQgZmlsZXNpemUgZm9yIHJlYWQtb25seSBmaWxlcyIpDQo+IFNpZ25lZC1vZmYtYnk6
IEJpbiBNZW5nIDxiaW4ubWVuZ0B3aW5kcml2ZXIuY29tPg0KPiAtLS0NCj4gDQo+ICAgYmxv
Y2svbmZzLmMgfCA4ICsrKysrKysrDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9u
cygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2Jsb2NrL25mcy5jIGIvYmxvY2svbmZzLmMNCj4g
aW5kZXggNDQ0YzQwYjQ1OC4uZDVkNjc5MzdkZCAxMDA2NDQNCj4gLS0tIGEvYmxvY2svbmZz
LmMNCj4gKysrIGIvYmxvY2svbmZzLmMNCj4gQEAgLTQxOCw3ICs0MTgsMTEgQEAgc3RhdGlj
IGludDY0X3QgbmZzX2NsaWVudF9vcGVuKE5GU0NsaWVudCAqY2xpZW50LCBCbG9ja2Rldk9w
dGlvbnNOZnMgKm9wdHMsDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGlu
dCBmbGFncywgaW50IG9wZW5fZmxhZ3MsIEVycm9yICoqZXJycCkNCj4gICB7DQo+ICAgICAg
IGludDY0X3QgcmV0ID0gLUVJTlZBTDsNCj4gKyNpZmRlZiBfV0lOMzINCj4gKyAgICBzdHJ1
Y3QgX19zdGF0NjQgc3Q7DQo+ICsjZWxzZQ0KPiAgICAgICBzdHJ1Y3Qgc3RhdCBzdDsNCj4g
KyNlbmRpZg0KPiAgICAgICBjaGFyICpmaWxlID0gTlVMTCwgKnN0cnAgPSBOVUxMOw0KPiAg
IA0KPiAgICAgICBxZW11X211dGV4X2luaXQoJmNsaWVudC0+bXV0ZXgpOw0KPiBAQCAtNzgx
LDcgKzc4NSwxMSBAQCBzdGF0aWMgaW50IG5mc19yZW9wZW5fcHJlcGFyZShCRFJWUmVvcGVu
U3RhdGUgKnN0YXRlLA0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIEJsb2Nr
UmVvcGVuUXVldWUgKnF1ZXVlLCBFcnJvciAqKmVycnApDQo+ICAgew0KPiAgICAgICBORlND
bGllbnQgKmNsaWVudCA9IHN0YXRlLT5icy0+b3BhcXVlOw0KPiArI2lmZGVmIF9XSU4zMg0K
PiArICAgIHN0cnVjdCBfX3N0YXQ2NCBzdDsNCj4gKyNlbHNlDQo+ICAgICAgIHN0cnVjdCBz
dGF0IHN0Ow0KPiArI2VuZGlmDQo+ICAgICAgIGludCByZXQgPSAwOw0KPiAgIA0KPiAgICAg
ICBpZiAoc3RhdGUtPmZsYWdzICYgQkRSVl9PX1JEV1IgJiYgYmRydl9pc19yZWFkX29ubHko
c3RhdGUtPmJzKSkgew0KDQoNClRoYW5rcyENCg0KUmV2aWV3ZWQtYnk6IFN0ZWZhbiBXZWls
IDxzd0B3ZWlsbmV0ei5kZT4NCg0K
--------------rwrY7X0bIVKzdJwGLazh8a0M
Content-Type: application/pgp-keys; name="OpenPGP_0xE08C21D5677450AD.asc"
Content-Disposition: attachment; filename="OpenPGP_0xE08C21D5677450AD.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
T7uiC0aTwAsniiln1XFlGBISNLB1HL/gUc9FJj8qmYgvUBZIzUjmm56up6er8ca9
2tARdBylQF3E9MJ/E4dVrmTyvOlddAb/MG1Ge425mjt0dRfOx8Qc7Pxs+d3UNVSu
Bm+WtuSgk+JNIT08c+WSXec8mE4hVdrKbAvCo9dcT5Gal2r6FSvRVY5kba3t280x
utLSp470k3+DO+AgVigbHr3scXlJXZe1m4luqBSkEBDNH2sAQoBrNVwVaCZqZRTN
TFN0ZWZhbiBXZWlsIChVbml2ZXJzaXTDpHRzYmlibGlvdGhlayBNYW5uaGVpbSkg
PHN0ZWZhbi53ZWlsQHVuaS1tYW5uaGVpbS5kZT7CwY4EEwEIADgWIQRJI2/qdcld
aY7Ct4rgjCHVZ3RQrQUCYlMdZAIbAwULCQgHAwUVCgkICwUWAgMBAAIeBQIXgAAK
CRDgjCHVZ3RQrRo6D/9MSqnSGOjWrcsiXbUsQmNKzI1JZOuabam3P9V/rILU7K4/
b9E6Bk5Vjo/6A4xMtC9y6L244Upn4MTdUofkBdd9dMG8eZ2oofsMGIeEmr4EFfKb
/LoZtIUJaNfiwvd3YakEmaAfd+AWIEAVYlVSxWHeCMowTNYxbSW+/M0ExGw1BErt
oFiz3Ti8iYNfgz2l9cwrKhQEnzZlHUq06AIbzch/nXFFcc3EBDz+J6x//DCclb6Y
8oLJRerrOJqpcpTYrwr+UDbh8JOqiUWUQ1BrbIZb+J5rU+DghBmNAWpd6yTbxX0T
I7g2Hu7gPdzhrLLRO+rQsDK3T+JdVQ9xyoWugFIw4YepAad5uo/2e+q38a+h57EK
Vsy4xfAEV/Mr4hl9KCY2hkiQYMKHvN1EZp72crAiPgDZxh6wTJZ979RHY2apq8XM
Y41uP5mwdHxFA1Al/5+syajNlTzsNdYB5Ucx5TwNU0TifM13exHw8lQZOaWbDZS4
QYwzeFWuEFse9ESmCQX5Pggw+ABFXOtPeqEfIO8v3QbT1vFlJ57iFBUiem967/JV
a0RQyEvAKj0T5124N8Hi1oa8TPk5oSe8id5jSgGD9twbS0HX2KcmwAF/A5MgP7hx
0X4EfhsJtDxFDy5PnoC8ADE2wcKDsTgqfDS/EQc6OeQCKceR45wyOT0Y3kbEa87B
TQRV3J49ARAAt9nArtjFnqmRHL0oY5KCrF5ONph6xm3rof74lZ/CTkG0zu9OhmbW
s6MMNsHgM7lRGIcKou7vUQE8/TEXh3+0eRdCiEYXP9jYTTXosU/+y/hOY33x9Sw/
tCEHXiz6M+rp74O1P+zqXSlmx8zzNy33dDdXUT+bF1C6Y7WEChIIjlOfLHOBeazN
dCqDxRDM/CKeI/UWx/wm0z1DNEuD8crUXIgdxY3dBAm1bBK041+3GXP8gYLN4qew
T1VoG35Ya3PrrTC/zMAumagjiF3/1NCAmH6eSOzw21EloDBR76K1noDGCfRM2dp0
78rS/BO+QtlN4+UWQLkB+crHxqXWk0u+gka2A7ZBHFYky/oUVIK1/ar6swnTRHj2
0Ga+rukzcdxQRJ2kwGeRrqLH1JO8p72ptvswMyzVPhk8sE2S9llPrbznj6fc9f5m
y5x9i5Fh4Mt2z7u+wBSdck2wV5eThEPz7UziXgtbq74Hja7tuoQxUhcpOIBXKl8b
MLtjxlO7VmH312VzfiBYqQku9fHg3E/Hi+uon2fJaifFbuViZqfZq9bKT/UWG0+0
cKc2d4os+3uwGcjraUjCFSXmGU27YqiW8jeM7pIa03QoAhWIH9ApAOVBqWF6drFz
6/oFcSl9qbY/4IneJ/eb0eyjHllegydGEuIShrXYZLiQqSX4yj/3vE8AEQEAAcLB
XwQYAQgACQUCVdyePQIbDAAKCRDgjCHVZ3RQrWEaEACTrt0WUxL1AT6BarJ3fOPV
ZjiioO+3LPhw98ci7afeScEK84cGv+KLgxawvOo7dbwEX6VceQvJ0LTZ1oYPuYeZ
MjiG7Qdf9uwgk3VwHf4S9pNxsqyVxHPotN9RPWwqoH9ihmO/ml7uC3gH0SFiU/RR
lc3c9X/u+6SbkSEUZrUrPFQKJ3dpfjnA3RCPTI3fTKr8jycA5A5A77Daba3L+MXj
c71/tn6MZCZmK7unSfpXq4rbGrIgMWnFKMBgeRONUWRFIOm5lReEjLHiABCli8t4
Txr2ATswA4atmC4JzP8J/WPWe2xDMvsOXu+bGgW5BSO053MQz1JyJf1ExClNTkYu
Vlm712JFE7Xzc2cg9P796KI3CKGbytTpaTrVx3ZajqHY1xfZy3vHolR8pfGZ8xcY
XhFtkD71/BSyqpkrPVvbGkLZOm4b/SzWCGCDYx9xBB//m25lfpZ+Du2u91pvC97Z
6Qty5nRp9kZvAeidmSunItU0Q4jKQlFnn6ZyLhPk4mwuVSUec8dGIdda8cQRaG/J
lpLUZi2cnhKAnGaAaLGycQ/NEMVjtN8z6ZHCe3eAa1bEPwSZAbRHuCZ+Iqh6gPzn
K88LhGUr/vzHYKKn25QWYQ7rJi2H1cu8BQ3lQpRunkCIithJ5gwoS0ZFSEM25FdI
hvjSVVSRyxiu/zrDuO/s6g=3D=3D
=3DumGL
-----END PGP PUBLIC KEY BLOCK-----

--------------rwrY7X0bIVKzdJwGLazh8a0M--

--------------mekadFoEQTeAx6I99V2PyStN--

--------------xcTx2FX8P93PnGJXX6F8nABZ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEESSNv6nXJXWmOwreK4Iwh1Wd0UK0FAmNdTWkFAwAAAAAACgkQ4Iwh1Wd0UK00
pQ//QWpGwQGibQpxiOlvj4K6C4g00BWXguTmCvSopHYcGoSx8EjAQHuKvgo74zGMulfZ9YZL/d5m
W8wIoPbGH0NApz45Bajj2hxAuSaLR/TrhQe20s6V1L3nuFV4qG0RNjLMMSkGbRDa7cIm4hRnrReu
vlo4a7Di9x8TT4sIHe+tJ7/qC2XKA13SuTIshy1JYf6yu3PAYhAGvVEkMlKSPvMmfeEA5oX+fgmR
Y20fLzx64slyIehgTphJScWgZLOFNplZBzuR2tSeIWLlpIg7W1Yo7gUDQYXt1H4Cy5oX0WqR36ZV
PyOUju/OLI4ruD6oEC9wwjHevsKb7FAQDNaqjV/Uf6ltZoThWkYEwfic5Xy0gjmmHwr4qLvt8cJ1
Ckyos3tXKvnCh+VE3Okh4QU8cEY/Zgph5U//k8ejV/golfr38E6b0syxAHUs1RQrHp9D6ppapF2k
5j0ZV9Tf4C1nxg4QNTWeS/BOVuCqQSjFFa74qCRfH5qZ9oLsZqYo9jyVpRCC8gIhaOi1dZ7VcGpv
PO+Bbpj1dzcPMBvMXh3fTD5TkkZ8vcaPQ77ko5idfr4rr5hsx+6ejt/38yoE6BXXuhK1jSu4I9IS
WzFenCG+hvs35EF5n3sz+BGXQLRR5W0YlJAAUdK3WmpH8PhUOOOiW2da3X9xhD4+UJPqN74RqLkI
ABg=
=Qbru
-----END PGP SIGNATURE-----

--------------xcTx2FX8P93PnGJXX6F8nABZ--

