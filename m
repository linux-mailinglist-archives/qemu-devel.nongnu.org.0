Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1921B10165
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Apr 2019 23:06:50 +0200 (CEST)
Received: from localhost ([127.0.0.1]:53443 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hLZxh-0004gh-4G
	for lists+qemu-devel@lfdr.de; Tue, 30 Apr 2019 17:06:49 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58625)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1hLZur-0002iX-Cz
	for qemu-devel@nongnu.org; Tue, 30 Apr 2019 17:03:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1hLZjb-0002zA-DY
	for qemu-devel@nongnu.org; Tue, 30 Apr 2019 16:52:16 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:52161)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1hLZjb-0002t5-2v; Tue, 30 Apr 2019 16:52:15 -0400
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
	1N7hrw-1giPTE0YUc-014i6N; Tue, 30 Apr 2019 22:51:54 +0200
To: Eric Blake <eblake@redhat.com>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <cover.1556650594.git.alistair.francis@wdc.com>
	<66295a3d9e21f52d777e6354d6c0f98b0bcb0c26.1556650594.git.alistair.francis@wdc.com>
	<8a53bfff-9b16-7dcf-1626-5b93a44e8dfc@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Openpgp: preference=signencrypt
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
	mQINBFYFJhkBEAC2me7w2+RizYOKZM+vZCx69GTewOwqzHrrHSG07MUAxJ6AY29/+HYf6EY2
	WoeuLWDmXE7A3oJoIsRecD6BXHTb0OYS20lS608anr3B0xn5g0BX7es9Mw+hV/pL+63EOCVm
	SUVTEQwbGQN62guOKnJJJfphbbv82glIC/Ei4Ky8BwZkUuXd7d5NFJKC9/GDrbWdj75cDNQx
	UZ9XXbXEKY9MHX83Uy7JFoiFDMOVHn55HnncflUncO0zDzY7CxFeQFwYRbsCXOUL9yBtqLer
	Ky8/yjBskIlNrp0uQSt9LMoMsdSjYLYhvk1StsNPg74+s4u0Q6z45+l8RAsgLw5OLtTa+ePM
	JyS7OIGNYxAX6eZk1+91a6tnqfyPcMbduxyBaYXn94HUG162BeuyBkbNoIDkB7pCByed1A7q
	q9/FbuTDwgVGVLYthYSfTtN0Y60OgNkWCMtFwKxRaXt1WFA5ceqinN/XkgA+vf2Ch72zBkJL
	RBIhfOPFv5f2Hkkj0MvsUXpOWaOjatiu0fpPo6Hw14UEpywke1zN4NKubApQOlNKZZC4hu6/
	8pv2t4HRi7s0K88jQYBRPObjrN5+owtI51xMaYzvPitHQ2053LmgsOdN9EKOqZeHAYG2SmRW
	LOxYWKX14YkZI5j/TXfKlTpwSMvXho+efN4kgFvFmP6WT+tPnwARAQABtCJMYXVyZW50IFZp
	dmllciA8bGF1cmVudEB2aXZpZXIuZXU+iQI4BBMBAgAiBQJWBTDeAhsDBgsJCAcDAgYVCAIJ
	CgsEFgIDAQIeAQIXgAAKCRDzDDi9Py++PCEdD/oD8LD5UWxhQrMQCsUgLlXCSM7sxGLkwmmF
	ozqSSljEGRhffxZvO35wMFcdX9Z0QOabVoFTKrT04YmvbjsErh/dP5zeM/4EhUByeOS7s6Yl
	HubMXVQTkak9Wa9Eq6irYC6L41QNzz/oTwNEqL1weV1+XC3TNnht9B76lIaELyrJvRfgsp9M
	rE+PzGPo5h7QHWdL/Cmu8yOtPLa8Y6l/ywEJ040IoiAUfzRoaJs2csMXf0eU6gVBhCJ4bs91
	jtWTXhkzdl4tdV+NOwj3j0ukPy+RjqeL2Ej+bomnPTOW8nAZ32dapmu7Fj7VApuQO/BSIHyO
	NkowMMjB46yohEepJaJZkcgseaus0x960c4ua/SUm/Nm6vioRsxyUmWd2nG0m089pp8LPopq
	WfAk1l4GciiMepp1Cxn7cnn1kmG6fhzedXZ/8FzsKjvx/aVeZwoEmucA42uGJ3Vk9TiVdZes
	lqMITkHqDIpHjC79xzlWkXOsDbA2UY/P18AtgJEZQPXbcrRBtdSifCuXdDfHvI+3exIdTpvj
	BfbgZAar8x+lcsQBugvktlQWPfAXZu4Shobi3/mDYMEDOE92dnNRD2ChNXg2IuvAL4OW40wh
	gXlkHC1ZgToNGoYVvGcZFug1NI+vCeCFchX+L3bXyLMg3rAfWMFPAZLzn42plIDMsBs+x2yP
	+bkCDQRWBSYZARAAvFJBFuX9A6eayxUPFaEczlMbGXugs0mazbOYGlyaWsiyfyc3PStHLFPj
	rSTaeJpPCjBJErwpZUN4BbpkBpaJiMuVO6egrC8Xy8/cnJakHPR2JPEvmj7Gm/L9DphTcE15
	92rxXLesWzGBbuYxKsj8LEnrrvLyi3kNW6B5LY3Id+ZmU8YTQ2zLuGV5tLiWKKxc6s3eMXNq
	wrJTCzdVd6ThXrmUfAHbcFXOycUyf9vD+s+WKpcZzCXwKgm7x1LKsJx3UhuzT8ier1L363RW
	ZaJBZ9CTPiu8R5NCSn9V+BnrP3wlFbtLqXp6imGhazT9nJF86b5BVKpF8Vl3F0/Y+UZ4gUwL
	d9cmDKBcmQU/JaRUSWvvolNu1IewZZu3rFSVgcpdaj7F/1aC0t5vLdx9KQRyEAKvEOtCmP4m
	38kU/6r33t3JuTJnkigda4+Sfu5kYGsogeYG6dNyjX5wpK5GJIJikEhdkwcLM+BUOOTi+I9u
	tX03BGSZo7FW/J7S9y0l5a8nooDs2gBRGmUgYKqQJHCDQyYut+hmcr+BGpUn9/pp2FTWijrP
	inb/Pc96YDQLQA1q2AeAFv3Rx3XoBTGl0RCY4KZ02c0kX/dm3eKfMX40XMegzlXCrqtzUk+N
	8LeipEsnOoAQcEONAWWo1HcgUIgCjhJhBEF0AcELOQzitbJGG5UAEQEAAYkCHwQYAQIACQUC
	VgUmGQIbDAAKCRDzDDi9Py++PCD3D/9VCtydWDdOyMTJvEMRQGbx0GacqpydMEWbE3kUW0ha
	US5jz5gyJZHKR3wuf1En/3z+CEAEfP1M3xNGjZvpaKZXrgWaVWfXtGLoWAVTfE231NMQKGoB
	w2Dzx5ivIqxikXB6AanBSVpRpoaHWb06tPNxDL6SVV9lZpUn03DSR6gZEZvyPheNWkvz7bE6
	FcqszV/PNvwm0C5Ju7NlJA8PBAQjkIorGnvN/vonbVh5GsRbhYPOc/JVwNNr63P76rZL8Gk/
	hb3xtcIEi5CCzab45+URG/lzc6OV2nTj9Lg0SNcRhFZ2ILE3txrmI+aXmAu26+EkxLLfqCVT
	ohb2SffQha5KgGlOSBXustQSGH0yzzZVZb+HZPEvx6d/HjQ+t9sO1bCpEgPdZjyMuuMp9N1H
	ctbwGdQM2Qb5zgXO+8ZSzwC+6rHHIdtcB8PH2j+Nd88dVGYlWFKZ36ELeZxD7iJflsE8E8yg
	OpKgu3nD0ahBDqANU/ZmNNarBJEwvM2vfusmNnWm3QMIwxNuJghRyuFfx694Im1js0ZY3LEU
	JGSHFG4ZynA+ZFUPA6Xf0wHeJOxGKCGIyeKORsteIqgnkINW9fnKJw2pgk8qHkwVc3Vu+wGS
	ZiJK0xFusPQehjWTHn9WjMG1zvQ5TQQHxau/2FkP45+nRPco6vVFQe8JmgtRF8WFJA==
Message-ID: <af35033d-657f-dde0-418d-3019e7fc3282@vivier.eu>
Date: Tue, 30 Apr 2019 22:51:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <8a53bfff-9b16-7dcf-1626-5b93a44e8dfc@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="RGjiCx9lbdc4bGu5GZ6CLlU7KiDG9QW7L"
X-Provags-ID: V03:K1:nH6AOl5OpT3ntsHc5R49kgHkToafXnDqu0tq4IFtg2e8g5erjYh
	Q481XIaf74BDThM6qUGRvAxANbuNdXD/fiZAFZKiE+hnH/Pxe4wiRB5IHWGyZ/0KlQmfLYQ
	mHkS+J7noAvI+SsnpX2gXcmbbulydo9bCQz5HzKzWlr7sob05u11fp56lHCbgpXYQXUW1PM
	oXoZeIKGlVaBbdgKjp/qw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:hOOdaE/iSWc=:pUimyOCMnjq/MDeEMvYQdK
	2PURttDgs4l+Ru41Hk26fwTFPiQEvTNaWmB6Pi1uMsk/fgrZSnhks1EwcoeAkwk4sAsE9y/hx
	7jSMUOMOOILj4jJzjqRANt6NiZMf+1LhJ+YcGoGnlJvQtdKEsy5xTrOuzLk6d7VfFXAWf6Z51
	mxuL6QVVuQz3bQWv3e/AgyR5lNgIT4iqVmu7lakou/H0aB/VItgvyRsIigw5nZWzdO2G5Dk+h
	SCNYEApw/SCwm9vrsrnF6gzINjyZlaY423kN2H3/Cs2onY1HqjdGc6LOS7hMaFUAbeY3S+LGH
	06Eir2k9iHceUu2tYh8iDAxIl93TgoaR8w1cMekApdeY5EK4NEDDiZdzJldGVnxg7xDEljX+L
	kSVq6i6j+yrUP2Aky0+k2keKl+VWDBy3qBB5gH1WJ4HrzEA3VtAcXKuedW+BCXLl9KTeYaxz1
	st1QcKLYGuI3s+fYGKtjlcDADFVfqKGp2/HZaKKltdjfMfMRxhIoPCMs51/dHaDLOmJxS2doH
	ilKDy4PdE6UzqStNZ57yueqmM81b52GAauNrwLTfkIATdwo+XeOFM3O7GYLRs/Wmc+pi3RNnh
	BcetBNxn3eRNwbT3LBUJiv7usz4kNN6qplnJcekJRYL5HaX06E2jtf4hDo6iauNfY7/CK/ebK
	8aGxfrAxX+NRhJdYyfbamRue2iL8mC7Z77t4OuhzpBeXtfJdys382RBb+Nte81DA/qqgO5a8U
	34n8Ggm6Hn5HLS9Yk3pbzpRCWRksKaZs8oSzBg==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 217.72.192.75
X-Content-Filtered-By: Mailman/MimeDel 2.1.21
Subject: Re: [Qemu-devel] [PATCH v1 4/5] linux-user/uname: Fix GCC 9 build
 warnings
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	"alistair23@gmail.com" <alistair23@gmail.com>,
	"riku.voipio@iki.fi" <riku.voipio@iki.fi>,
	"kraxel@redhat.com" <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--RGjiCx9lbdc4bGu5GZ6CLlU7KiDG9QW7L
From: Laurent Vivier <laurent@vivier.eu>
To: Eric Blake <eblake@redhat.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
 "riku.voipio@iki.fi" <riku.voipio@iki.fi>,
 "kraxel@redhat.com" <kraxel@redhat.com>,
 "alistair23@gmail.com" <alistair23@gmail.com>
Message-ID: <af35033d-657f-dde0-418d-3019e7fc3282@vivier.eu>
Subject: Re: [Qemu-devel] [PATCH v1 4/5] linux-user/uname: Fix GCC 9 build
 warnings
References: <cover.1556650594.git.alistair.francis@wdc.com>
 <66295a3d9e21f52d777e6354d6c0f98b0bcb0c26.1556650594.git.alistair.francis@wdc.com>
 <8a53bfff-9b16-7dcf-1626-5b93a44e8dfc@redhat.com>
In-Reply-To: <8a53bfff-9b16-7dcf-1626-5b93a44e8dfc@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 30/04/2019 =C3=A0 22:40, Eric Blake a =C3=A9crit=C2=A0:
> On 4/30/19 3:09 PM, Alistair Francis wrote:
>> Fix this warning when building with GCC9 on Fedora 30:
>> In function =E2=80=98strncpy=E2=80=99,
>>     inlined from =E2=80=98sys_uname=E2=80=99 at /home/alistair/qemu/li=
nux-user/uname.c:94:3:
>> /usr/include/bits/string_fortified.h:106:10: error: =E2=80=98__builtin=
_strncpy=E2=80=99 output may be truncated copying 64 bytes from a string =
of length 64 [-Werror=3Dstringop-truncation]
>>   106 |   return __builtin___strncpy_chk (__dest, __src, __len, __bos =
(__dest));
>>       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~
>>
>> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
>> ---
>>  linux-user/uname.c | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>>
>> diff --git a/linux-user/uname.c b/linux-user/uname.c
>> index 313b79dbad..293b2238f2 100644
>> --- a/linux-user/uname.c
>> +++ b/linux-user/uname.c
>> @@ -90,6 +90,11 @@ int sys_uname(struct new_utsname *buf)
>>     * struct linux kernel uses).
>>     */
>> =20
>> +#if defined(CONFIG_PRAGMA_DIAGNOSTIC_AVAILABLE) && QEMU_GNUC_PREREQ(9=
, 0)
>> +#pragma GCC diagnostic push
>> +#pragma GCC diagnostic ignored "-Wstringop-truncation"
>> +#endif
>=20
> Why do we need the pragma?
>=20
>> +
>>    memset(buf, 0, sizeof(*buf));
>=20
> We are prezeroing the entire field, at which point...
>=20
>>    COPY_UTSNAME_FIELD(buf->sysname, uts_buf.sysname);
>>    COPY_UTSNAME_FIELD(buf->nodename, uts_buf.nodename);
>=20
> ...using strncpy() for a shorter string is wasteful (we're writing the
> tail end twice), and for a long string is warning-prone.  Why not
> rewrite COPY_UTSNAME_FIELD() to use memcpy() for the MIN(strlen(src),
> __NEW_UTS_LEN) and drop the write of the trailing NUL, since it will
> already be NUL from your memset()?
>=20

We must modify this very carefully because I think there is some magic
in COPY_UTSNAME_FIELD() we could miss.

#define COPY_UTSNAME_FIELD(dest, src) \
  do { \
      /* __NEW_UTS_LEN doesn't include terminating null */ \
      (void) strncpy((dest), (src), __NEW_UTS_LEN); \
      (dest)[__NEW_UTS_LEN] =3D '\0'; \
  } while (0)

Thanks,
Laurent


--RGjiCx9lbdc4bGu5GZ6CLlU7KiDG9QW7L
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEzS913cjjpNwuT1Fz8ww4vT8vvjwFAlzItWgACgkQ8ww4vT8v
vjzunA/9GYWUUTpHkjAtHkCO+bSXM1k2ZH1XpzFtTmtH+PPyfJAvzOkIUiKiOLJj
lbq7pSjEoxGgEF3vi/Qq+xmOh99f7EZKw/L9ulpxjet/wWiC8vkYBQYKruvEO3Rv
wp71BVs8gE4eYteZL1unIYKckEsRaKlLedZa8z87YaA+4I8FM7LIhAydAMDuciR5
3Gq0tcvBPlwlGH02Vzrup/1bARwvZ4RhJ8PTib6aJmskWXXNlrr+bKrtGfc8OybZ
XU5h7lFGHt0HysAahZdM7ojbggu3F7BTJkxjpv/fXHOD6K9MjxUSnPMs+jfXlL28
taf9Miyy/N7kgAevH8vi5eWKgF/Qxu6ckisHGu5qL6Ze+ENy+r5bJKWEKkoKiV8i
guE1T0H2MlbgHJYul6SHGbc/1TKvYNob6JAnclNXDrgqZbXj3oV3CElKfZj04SEh
7NTHud5FpcH6RnJAYuplvy3IYglqCvHXJkG8hvpP631pzrCpjDSw/WyDRwAvc5+4
QeTUbRdFK9Nl0Renk/clekIr5fFmPADk/5dZsmq5+mvDAsRw5nFVTKmslHtAj85K
m3+HFMoTymRAZVwYm+RkfZWjLicGrTxzakzyetZGmfaIybY8YVAlkuJo0YP/+CqQ
cLAwX0Z9FjoLl7v0jafk/RlOcZ+QcDKZrjJ6BoENMDAAOmvocqk=
=6B+P
-----END PGP SIGNATURE-----

--RGjiCx9lbdc4bGu5GZ6CLlU7KiDG9QW7L--

