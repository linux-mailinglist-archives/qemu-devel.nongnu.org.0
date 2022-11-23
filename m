Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB01635086
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Nov 2022 07:35:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxjLk-0000wt-Vu; Wed, 23 Nov 2022 01:35:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>)
 id 1oxjLi-0000vp-V0; Wed, 23 Nov 2022 01:35:11 -0500
Received: from mail.weilnetz.de ([37.120.169.71]
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>)
 id 1oxjLg-0006wq-Og; Wed, 23 Nov 2022 01:35:10 -0500
Received: from [192.168.178.59] (p5b151d14.dip0.t-ipconnect.de [91.21.29.20])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTPSA id 9EDF7DA0D81;
 Wed, 23 Nov 2022 07:35:02 +0100 (CET)
Message-ID: <cf752a2d-edb7-4b04-0b21-6e2f38112d6d@weilnetz.de>
Date: Wed, 23 Nov 2022 07:35:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH for-7.2 v2 3/4] libvhost-user: Fix two more format strings
To: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Cc: Stefan Hajnoczi <stefanha@gmail.com>, Laurent Vivier <laurent@vivier.eu>
References: <20221105102448.436469-1-sw@weilnetz.de>
 <20221105102448.436469-4-sw@weilnetz.de>
 <4a950024-4758-b328-5968-656d0e72b043@weilnetz.de>
In-Reply-To: <4a950024-4758-b328-5968-656d0e72b043@weilnetz.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------c1zlSDdUO3MRTYB7iqc8AXCn"
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
Reply-to:  Stefan Weil <sw@weilnetz.de>
From:  Stefan Weil via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------c1zlSDdUO3MRTYB7iqc8AXCn
Content-Type: multipart/mixed; boundary="------------0CDQ0DNJ5lsFKKXMNIlAzn9V";
 protected-headers="v1"
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Cc: Stefan Hajnoczi <stefanha@gmail.com>, Laurent Vivier <laurent@vivier.eu>
Message-ID: <cf752a2d-edb7-4b04-0b21-6e2f38112d6d@weilnetz.de>
Subject: Re: [PATCH for-7.2 v2 3/4] libvhost-user: Fix two more format strings
References: <20221105102448.436469-1-sw@weilnetz.de>
 <20221105102448.436469-4-sw@weilnetz.de>
 <4a950024-4758-b328-5968-656d0e72b043@weilnetz.de>
In-Reply-To: <4a950024-4758-b328-5968-656d0e72b043@weilnetz.de>

--------------0CDQ0DNJ5lsFKKXMNIlAzn9V
Content-Type: multipart/mixed; boundary="------------5FtIYPEYdbpvJ7rxoaIkE5HF"

--------------5FtIYPEYdbpvJ7rxoaIkE5HF
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

QW0gMTUuMTEuMjIgdW0gMDg6MjUgc2NocmllYiBTdGVmYW4gV2VpbDoNCj4gQW0gMDUuMTEu
MjIgdW0gMTE6MjQgc2NocmllYiBTdGVmYW4gV2VpbDoNCj4gDQo+PiBUaGlzIGZpeCBpcyBy
ZXF1aXJlZCBmb3IgMzIgYml0IGhvc3QuIFRoZSBidWcgd2FzIGRldGVjdGVkIGJ5IENJDQo+
PiBmb3IgYXJtLWxpbnV4LCBidXQgaXMgYWxzbyByZWxldmFudCBmb3IgaTM4Ni1saW51eC4N
Cj4+DQo+PiBSZXBvcnRlZC1ieTogU3RlZmFuIEhham5vY3ppIDxzdGVmYW5oYUBnbWFpbC5j
b20+DQo+PiBTaWduZWQtb2ZmLWJ5OiBTdGVmYW4gV2VpbCA8c3dAd2VpbG5ldHouZGU+DQo+
PiAtLS0NCj4+IMKgIHN1YnByb2plY3RzL2xpYnZob3N0LXVzZXIvbGlidmhvc3QtdXNlci5j
IHwgMyArKy0NCj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVs
ZXRpb24oLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvc3VicHJvamVjdHMvbGlidmhvc3QtdXNl
ci9saWJ2aG9zdC11c2VyLmMgDQo+PiBiL3N1YnByb2plY3RzL2xpYnZob3N0LXVzZXIvbGli
dmhvc3QtdXNlci5jDQo+PiBpbmRleCBkNjc5NTNhMWMzLi44MGY5OTUyZTcxIDEwMDY0NA0K
Pj4gLS0tIGEvc3VicHJvamVjdHMvbGlidmhvc3QtdXNlci9saWJ2aG9zdC11c2VyLmMNCj4+
ICsrKyBiL3N1YnByb2plY3RzL2xpYnZob3N0LXVzZXIvbGlidmhvc3QtdXNlci5jDQo+PiBA
QCAtNjUxLDcgKzY1MSw4IEBAIGdlbmVyYXRlX2ZhdWx0cyhWdURldiAqZGV2KSB7DQo+PiDC
oMKgwqDCoMKgwqDCoMKgwqAgaWYgKGlvY3RsKGRldi0+cG9zdGNvcHlfdWZkLCBVRkZESU9f
UkVHSVNURVIsICZyZWdfc3RydWN0KSkgew0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgdnVfcGFuaWMoZGV2LCAiJXM6IEZhaWxlZCB0byB1c2VyZmF1bHQgcmVnaW9uICVkICIN
Cj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCAiQCUiIFBSSXg2NCAiICsgc2l6ZTolenggb2Zmc2V0OiAleng6IA0KPj4gKHVmZD0lZCkl
c1xuIiwNCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCAiQCUiIFBSSXg2NCAiICsgc2l6ZTolIiBQUkl4NjQgIiBvZmZzZXQ6ICUiIA0K
Pj4gUFJJeDY0DQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgIjogKHVmZD0lZCklc1xuIiwNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIF9fZnVuY19fLCBpLA0KPj4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZGV2X3JlZ2lvbi0+bW1hcF9hZGRy
LA0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZGV2
X3JlZ2lvbi0+c2l6ZSwgZGV2X3JlZ2lvbi0+bW1hcF9vZmZzZXQsDQo+IA0KPiANCj4gVGhl
cmUgaXMgc3RpbGwgbm8gcmV2aWV3IGZvciB0aGlzIHBhdGNoLg0KPiANCj4gSSBhZGRlZCAi
Zm9yLTcuMiIgdG8gdGhlIHN1YmplY3QgaGVyZSBpbiBteSBhbnN3ZXIuIEhvdyBjYW4gd2Ug
Z2V0IGFsbCA0IA0KPiBwYXRjaGVzIG9mIHRoaXMgc2VyaWVzIGludG8gdGhlIG5ldyByZWxl
YXNlPw0KPiANCj4gU3RlZmFuDQoNClBpbmc/IFRob3NlIGJ1ZyBmaXhlcyBhcmUgc3RpbGwg
bWlzc2luZyBpbiAtcmMyLg0KDQpTdGVmYW4NCg==
--------------5FtIYPEYdbpvJ7rxoaIkE5HF
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

--------------5FtIYPEYdbpvJ7rxoaIkE5HF--

--------------0CDQ0DNJ5lsFKKXMNIlAzn9V--

--------------c1zlSDdUO3MRTYB7iqc8AXCn
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEESSNv6nXJXWmOwreK4Iwh1Wd0UK0FAmN9vxYFAwAAAAAACgkQ4Iwh1Wd0UK3A
kg/9FivwVzx4r+VcLGLLJ5hc93ikooXIounK50saP+CsYFsxRqgoZ5QyVAG+Wr7ZE/TzlrNeH44x
UfMKjEQ8fvyzvL94PpO1FKdSCs/r8B9UsCt/A1LU9r+LFfFAe+O7mOysTqIhLZ2AuDcznrD1brRs
75T7Pscc6m2zdZYjfmf/T6w1768dKUNqOfIX+5UR9224xDA4vvLF9dF6728pus3A9fTBEYtgGtbs
BHxHfKdfcCuxhbMASS+dAKzf1ebYwlmeX8n2z/J8OETWrK30A3aX0rPTGzBQzU6NV1IuLNO9g36q
K8o02FaKjvfmtboDFGuIFEnOpSrSslKunT5HzcvPeb/H85aZcGE6IY2X3E5ZWZgxy+9XiolBoK+m
+hDckxhwQ7RzMi7X8i7OvDH/JlcJ+Di9ioxbvuy5089qO8vVoo0X9Dlf233hQe4ujUHdMQHAgwyi
3iMhEAhisEn5grChDkTZeyAW3MDNWcvcrTk8r+diD54nUfTDcKE5D99FN2OBWw1yNcyJtKFiKLqM
vY01sFUwP+kXPJz0h3ph0GKmmNswuEPEt4wBFJaHz9Y8R5qBMKgbOYfHDTTfcmAmvVm/4I8S9t17
oOIKnd2f3fNeE3u+s60B3rRyCxpozvQMMKU56I9KBr2i92OsjSCVdonheZOvJZRLfG2HsazLSZbn
+ck=
=WB75
-----END PGP SIGNATURE-----

--------------c1zlSDdUO3MRTYB7iqc8AXCn--

