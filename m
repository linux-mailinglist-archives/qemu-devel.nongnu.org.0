Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 217CF5ADEFB
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 07:46:14 +0200 (CEST)
Received: from localhost ([::1]:60328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVRPZ-0001Zi-86
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 01:46:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1oVRJS-0007wS-JB
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 01:39:54 -0400
Received: from mail.weilnetz.de ([37.120.169.71]:42910
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1oVRJP-0001JT-5l
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 01:39:53 -0400
Received: from [192.168.178.59] (pd9ec32f3.dip0.t-ipconnect.de
 [217.236.50.243])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTPSA id D34DFDA0834;
 Tue,  6 Sep 2022 07:39:46 +0200 (CEST)
Message-ID: <5a6289cb-be22-ae8e-bcac-d0101edfb71b@weilnetz.de>
Date: Tue, 6 Sep 2022 07:39:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.1
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: armbru@redhat.com
References: <20220905110013.31308-1-pbonzini@redhat.com>
Subject: Re: [PATCH] tests: unit: simplify test-visitor-serialization list
 tests
In-Reply-To: <20220905110013.31308-1-pbonzini@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------HRm43aJZbqV2otvnKQLdbYUO"
Received-SPF: pass client-ip=37.120.169.71; envelope-from=sw@weilnetz.de;
 helo=mail.v2201612906741603.powersrv.de
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.716,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Stefan Weil <sw@weilnetz.de>
From:  Stefan Weil via <qemu-devel@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------HRm43aJZbqV2otvnKQLdbYUO
Content-Type: multipart/mixed; boundary="------------jx5luuy1tWg9G050ozSR88mS";
 protected-headers="v1"
From: Stefan Weil <sw@weilnetz.de>
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: armbru@redhat.com
Message-ID: <5a6289cb-be22-ae8e-bcac-d0101edfb71b@weilnetz.de>
Subject: Re: [PATCH] tests: unit: simplify test-visitor-serialization list
 tests
References: <20220905110013.31308-1-pbonzini@redhat.com>
In-Reply-To: <20220905110013.31308-1-pbonzini@redhat.com>

--------------jx5luuy1tWg9G050ozSR88mS
Content-Type: multipart/mixed; boundary="------------UY0KAGznieKyV8zGVKkOrLv5"

--------------UY0KAGznieKyV8zGVKkOrLv5
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

QW0gMDUuMDkuMjIgdW0gMTM6MDAgc2NocmllYiBQYW9sbyBCb256aW5pOg0KPiB0ZXN0LXZp
c2l0b3Itc2VyaWFsaXphdGlvbiBsaXN0IHRlc3RzIGlzIHVzaW5nIGFuICJpZiIgdG8gcGlj
ayBlaXRoZXIgdGhlIGZpcnN0DQo+IGVsZW1lbnQgb2YgdGhlIGxpc3Qgb3IgdGhlIG5leHQg
b25lLiAgVGhpcyB3YXMgZG9uZSBwcmVzdW1hYmx5IHRvIG1pbWljIHRoZQ0KPiBjb2RlIHRo
YXQgY3JlYXRlcyB0aGUgbGlzdCwgd2hpY2ggaGFzIHRvIGZpbGwgaW4gZWl0aGVyIHRoZSBo
ZWFkIHBvaW50ZXINCj4gb3IgdGhlIG5leHQgcG9pbnRlciBvZiB0aGUgbGFzdCBlbGVtZW50
LiAgSG93ZXZlciwgdGhlIGNvZGUgaW4gdGhlIGluc2VydA0KPiBwaGFzZSBpcyBhIHByZXR0
eSBzdGFuZGFyZCBzaW5nbHktbGlua2VkIGxpc3QgaW5zZXJ0aW9uLCB3aGlsZSB0aGUgb25l
DQo+IGluIHRoZSB2aXNpdCBwaGFzZSBsb29rcyB3ZWlyZCBhbmQgZXZlbiBsb29rcyBhdCB0
aGUgZmlyc3QgaXRlbSB0d2ljZToNCj4gdGhpcyBpcyBjb25mdXNpbmcgYmVjYXVzZSB0aGUg
dGVzdCBwdXRzIGluIDMyIGl0ZW1zIGFuZCBmaW5pc2hlcyB3aXRoDQo+IGFuIGFzc2VydGlv
biB0aGF0IGkgPT0gMzMuDQo+IA0KPiBTbywgbW92ZSB0aGUgImVsc2UiIHN0ZXAgaW4gYSBz
ZXBhcmF0ZSBzd2l0Y2ggc3RhdGVtZW50LCBhbmQgY2hhbmdlDQo+IHRoZSBkby4uLndoaWxl
IGxvb3AgdG8gYSB3aGlsZSwgYmVjYXVzZSBjdXJfaGVhZCBoYXMgYWxyZWFkeSBiZWVuDQo+
IGluaXRpYWxpemVkIGJlZm9yZWhhbmQuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBQYW9sbyBC
b256aW5pIDxwYm9uemluaUByZWRoYXQuY29tPg0KPiAtLS0NCj4gICB0ZXN0cy91bml0L3Rl
c3QtdmlzaXRvci1zZXJpYWxpemF0aW9uLmMgfCAxNTcgKysrKysrKysrKystLS0tLS0tLS0t
LS0tDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDY5IGluc2VydGlvbnMoKyksIDg4IGRlbGV0aW9u
cygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL3Rlc3RzL3VuaXQvdGVzdC12aXNpdG9yLXNlcmlh
bGl6YXRpb24uYyBiL3Rlc3RzL3VuaXQvdGVzdC12aXNpdG9yLXNlcmlhbGl6YXRpb24uYw0K
PiBpbmRleCA5MDcyNjNkMDMwLi42NjdlOGZlZDgyIDEwMDY0NA0KPiAtLS0gYS90ZXN0cy91
bml0L3Rlc3QtdmlzaXRvci1zZXJpYWxpemF0aW9uLmMNCj4gKysrIGIvdGVzdHMvdW5pdC90
ZXN0LXZpc2l0b3Itc2VyaWFsaXphdGlvbi5jDQo+IEBAIC00MjcsMTMxICs0MjcsMTE3IEBA
IHN0YXRpYyB2b2lkIHRlc3RfcHJpbWl0aXZlX2xpc3RzKGdjb25zdHBvaW50ZXIgb3BhcXVl
KQ0KPiAgICAgICBvcHMtPmRlc2VyaWFsaXplKCh2b2lkICoqKSZwbF9jb3B5X3B0ciwgc2Vy
aWFsaXplX2RhdGEsDQo+ICAgICAgICAgICAgICAgICAgICAgICAgdmlzaXRfcHJpbWl0aXZl
X2xpc3QsICZlcnJvcl9hYm9ydCk7DQo+ICAgDQo+IC0gICAgaSA9IDA7DQo+ICsNCj4gKyAg
ICBzd2l0Y2ggKHBsX2NvcHkudHlwZSkgew0KWy4uLl0+ICsgICAgZGVmYXVsdDoNCj4gKyAg
ICAgICAgZ19hc3NlcnRfbm90X3JlYWNoZWQoKTsNCj4gKyAgICB9DQo+ICAgDQo+ICAgICAg
IC8qIGNvbXBhcmUgb3VyIGRlc2VyaWFsaXplZCBsaXN0IG9mIHByaW1pdGl2ZXMgdG8gdGhl
IG9yaWdpbmFsICovDQo+IC0gICAgZG8gew0KPiArICAgIGkgPSAwOw0KPiArICAgIHdoaWxl
IChjdXJfaGVhZCkgew0KPiAgICAgICAgICAgc3dpdGNoIChwbF9jb3B5LnR5cGUpIHsNCj4g
ICAgICAgICAgIGNhc2UgUFRZUEVfU1RSSU5HOiB7DQpbLi4uXQ0KPiBAQCAtNTc4LDkgKzU1
OSw5IEBAIHN0YXRpYyB2b2lkIHRlc3RfcHJpbWl0aXZlX2xpc3RzKGdjb25zdHBvaW50ZXIg
b3BhcXVlKQ0KPiAgICAgICAgICAgICAgIGdfYXNzZXJ0X25vdF9yZWFjaGVkKCk7DQoNCkFz
IGJvdGggc3dpdGNoIHN0YXRlbWVudHMgaGF2ZSB0aGUgc2FtZSAxMiBjYXNlcyBwbHVzIGEg
ZGVmYXVsdCBjYXNlIA0Kd2l0aCBnX2Fzc2VydF9ub3RfcmVhY2hlZCgpLCBhIHN0YXRpYyBj
b2RlIGFuYWx5emVyIG1pZ2h0IGNvbXBsYWluIHRoYXQgDQp0aGUgMm5kIGRlZmF1bHQgY2Fz
ZSB3aWxsIGluZGVlZCBuZXZlciBiZSByZWFjaGVkIGJlY2F1c2UgdGhlIGZpcnN0IG9uZSAN
CmFscmVhZHkgcmFpc2VzIGFuIGFzc2VydGlvbi4gU28gdGhlIGNvZGUgaW4gdGhlIDJuZCBk
ZWZhdWx0IGNhc2UgY291bGQgDQpiZSByZW1vdmVkLg0KDQpSZWdhcmRzLA0KU3RlZmFuDQoN
Cj4gICAgICAgICAgIH0NCj4gICAgICAgICAgIGkrKzsNCj4gLSAgICB9IHdoaWxlIChjdXJf
aGVhZCk7DQo+ICsgICAgfQ0KDQoNCg==
--------------UY0KAGznieKyV8zGVKkOrLv5
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

--------------UY0KAGznieKyV8zGVKkOrLv5--

--------------jx5luuy1tWg9G050ozSR88mS--

--------------HRm43aJZbqV2otvnKQLdbYUO
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEESSNv6nXJXWmOwreK4Iwh1Wd0UK0FAmMW3SIFAwAAAAAACgkQ4Iwh1Wd0UK3O
ow//YTVvtOI4Ri7Nr/Sci58UFLM5cnEz0kwNg3cdjU/tiCPdYIpk1Om0wFTkRbrFsr8sayaU6iqV
L/aqA0vVjPSfYgqFU6yxGQLBuu+RjoXac2FfnzJa5DQbwPKyVngevQ8LNDysxT7nB65ED1LRdc/0
cApkiGesUqinctX1gw1h+BgkKXjAzK/27DTix3EtCOclsZllfcPdeOFVpevPkviaO4LeK9kzoqSO
akhxXMhhjx5NdtWEvZ6AzJPy/f/8J+1XYORwQTyZ0Q04gEBVKf/0wtH1WCdRD1/7Fw4omuWwQmn7
mLP8DioG7YKi0Z7wAawl+UCRGzw4X9zqko7AePwD/wGcWawBcTTY+I8NBxf3+68w8JH0SJY+U6YE
AByn1kBC42yogNOyO7Tu+6r52TPC3lPDqzNeupfwykZlnjRVhWY/Q0HpGpuvM4qYDTBz0U1auJ4+
TzPKXRQhTv4le+o3NjP07KL8Gep1jz8oJetYPkeqbXq3md6Z3yD5xkroaQVU1L2XjMVNEvudTEf8
5p6NrWF+a5dbLo0vmOy+/LrnNID2PnW5sY21ZQZ5tC/lHS/9EkSKZ8U/V4fKePmWkKkFDb4dbLXv
QCrrRGdZUTPg772igx5r7eYJzKwN/CxdTBKebQauLsseJ9hY5/TRd+1WpEpwaMn48rV2SRSLqnka
g5g=
=X/cT
-----END PGP SIGNATURE-----

--------------HRm43aJZbqV2otvnKQLdbYUO--

