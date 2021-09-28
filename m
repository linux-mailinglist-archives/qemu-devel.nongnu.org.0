Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79CD341ADFB
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 13:43:09 +0200 (CEST)
Received: from localhost ([::1]:44924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVBVr-0001Ug-Tc
	for lists+qemu-devel@lfdr.de; Tue, 28 Sep 2021 07:43:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pjp@fedoraproject.org>)
 id 1mVBSS-0008Df-IQ
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 07:39:36 -0400
Received: from sonic302-20.consmr.mail.sg3.yahoo.com ([106.10.242.140]:45961)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pjp@fedoraproject.org>)
 id 1mVBSK-0000fZ-QE
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 07:39:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1632829157; bh=ig9a+GEMENDbq6RaHsP6jNzuSOjps6RB21m4qLU3NP8=;
 h=Date:From:Reply-To:To:Cc:In-Reply-To:References:Subject:From:Subject:Reply-To;
 b=GpGydf3G3UBZu3hS4/pdykRd3vtdl3cpTLkM6myxVHltaV7AiGGF0pBZ690eRHao3HqEBdfLnxxjtbxsrWO+Rql8vUgBqXlWqsUKNd9vfng/hGuJ0ljT720QryQi+EqcowRCi9WehI8vwSiood7P73NK4IWg3CtcY4DovIMnBY+10s1rAb0ebEI7caMeeVnpA2gMYfqF2UJL58PndStnsdlOQfh+nTftQ8Z1dCsMPbY4waGVKHmbXoYpDNFcqiAeTfPY7aOacHtaUAwwOxOOHPTc3V7p+fwSQ2TumCq2tYWh98EapTL+rW5NfJD3Su8iwShtl0MTbNBIN/kRv4Rziw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1632829157; bh=Yg0XwtaKmUI6Bqcl2pWhfgps3zqqwrtClGAMnyJ69t5=;
 h=X-Sonic-MF:Date:From:To:Subject:From:Subject;
 b=qBAUw+PbjatOWOht0Lb7FiZhmDguQtCgmdW6VfGiGKp9YmtwxcVKKroN8TcRzaHjrxwed/HykuDV527SJMl6p3ezxISsUzmwiYre9ERom9KgvHoPlYFpoNNKDOB70ulHZZGoQt1E7JkkFNflRSrJ9vJfK24keZpApAYu8uxJB9nwY5kWKdcaa1uchvOCLTq7JWAj7VJm0VowO78uyMGa12yweRKE+DggDT/rHHu3Pkl2kYqbmZbvPl1MyJ1yCkiw8cTX/6JojwxkG23qc125RJQuIggnLgUxZ6iW/NEpkPUc2dC9ui8L2+B2/9X7FG0JX4GszbKQ4bjzOlTj7B2Ljg==
X-YMail-OSG: 21yWVssVM1kZyBR0FJLTAYMpSYh9i7Xcwb8QaoZNQ3.ia14XfQPOB6d_lTzWhwd
 72N.kLvH.HRDGZlio_Hx0qX6HXOuk.M70qrJWGO.E.62LCNNgrtNS7v8LHGEAo9bvTBnDSQVRPbb
 fGrtXI9y2ZQpoPYLj1mj6jyToJju4f2jbsIVjxCPcJYnSCiyVrI3zbSBNtIkQf_3Ek6lL96KsVto
 tIEJ4R6eMvS7XmCB_jC6HgyFcqK9sZzM2VMoekL8_Ljae2JJ7Nle3ROLvXat5ZNz0KhUc_X2V6I.
 fZLv_JdRcMxNH6a8G7iY4qUmhQALx7W2iVLLDoNNz6xmgB_QnBjY1JVgpDdjlzW6eT4IPdJAUHBV
 vto1O.X4UOIgWYtYYzxjDDMTBo_0B6zjF5W9EOm3Ht.ecGaEpNMKsTz4f0qR0KrfOw_Ml3UD39xW
 KiLcWWsfxdXzSS2zSJnNuEdnX8hymcfxe38GvCVhlO66Zgm93sIIFii.DlZ8cYgnLBl.8YeM1IYC
 bwuSBNLZoynElC1YLsxEtYK4pGIzDzlWCS1UUsHybbyQeck2aU2HijsxY0nVinM4facUuQuyfcOv
 K45b3jzRr5TD1LtkqgZdTFwegXHP82pLRyid73iyxEeF1jfN1XleYefcl5lOg6p_NAJwYHpQ.kZz
 ZDo4RFmTjZtO4Dg4f6VXgcqkeFd_3UFPfZ7Ec_F1IJJLTUmxiaxIzjCzL4dw5NX4DVuQUX9p.def
 66SfrzTflyQWut0DewStrY2O714KUrH2LIyJhko1ghZgP2UX122w2NKLSSIJmE.UlT_mC4nB4gES
 1Xju08aR6TefB6Awqq8o6kZxSJTYnhuuM4khU_Cgodl6TNqHwrvwokpmPQFh2Svp_UiTYzaQLjIT
 RKYlJb364egGH0FI_1Q2pZAfjzF8rOI3ErFdOtIoFwYoEv8Wzg8WVZcMcNh4cSq3SUjUNyBztEdG
 l9jXtZ3uqYODhqziGo_nHNZegv134qOdFYivND4KD7IouHBMzcz8LUFfFImhLlc6RNYqxpbcUZ2i
 K6cVXtkQKeQ3n.UFC8FiOBT6rjC_u5ia4GE.DWomAs1hnVEPcPQnE650dSgiO48RYHpO4YY94RIZ
 3IpUwWfIM2BhchoE.j1Gs9B81DzTBOEoaowZDF_BVCLe1caDR1UWANzp5I1eoQwjAIz__PEiVm.l
 DXAVqzZkFc7kzYrCPlFdKQ4gwTTlx5hi.J01b4Tw_CuOewxHtv6dNbtEKvZYKG5KckmFnYUf1aml
 n4GaXVrxLnrey0fZKiDlKAlsz1MIlR58xCv8fwrD0JvvRdb.vQ8kO4M0RnK6QfGpij4GnLZzICjJ
 1v6CXoUDGztyX2E.VlpWHmc2Jh3bl1nloqIthXFV87GHzQdgS1N4ptKmPszcfi4Khy672e3pKC2y
 ftiT5Vy9SCfLIQBTatpwcY2fjBfNIMIoK.0Ih78C0Gu.uS_n7ZDEPum9cGsWDWzVBdq.E9.0YUBA
 bPT7AohTbvAnzWYvgoDWXPenEK8QFdnWN7F0QCbCKlLCL1mlp6eI89_NsoPAkOLj6yEd1g9vAT2W
 ecaxmfHWn72hdCFKqnrf_qZkFWx9R0TmRE4IzBTtxonn_UJTunbmfTPdAqJV_LTEWQVd1BTcDOSz
 3xs6NlAgaMZ2qrxPtboBrBjE.9SsPj.NNF1M.TOuZdhH7LTVagSAGAKBfjxXhogaQR0UJjRUY0uQ
 I0GfNcNFsVWSZJhT4O.l8BGQHtajaiQXX4JJDW52EooyUouErBc59Q3gDwsGVzaCqvH6cpsc03ON
 I5HFlFBLx6JWv4rWmIALiZ1R9rmRYDZmcwSHS_D31QsrFOHg6KDIhS6yyEsljRknGztf5Yc_nqZt
 5EPGzxab1EawskzQA7im_9TNvgW8t1vsuBlsxUZ.3Vss0GrtuseZAGUWyJx0uCc4U.QWGbfIS7mZ
 lc4hxlLhKw6VA3FVb8SSGtezv4vhfIWmXQyxax_MxhbwqSssKbUug3zZXr_XuIgHaSqqnYSqm6L9
 g2d2V24Noljs9MBOVOiHRt2Lk1KwZe_6Vc381gXgggAeAMY6YArS0Hp0ETnSK6VLJoNGZ5MlhK4B
 iAiJ9c_URdKmuuihfgb3I7o2gD5vA25qSjh_j8tfc.jbu0xpXXUW8LwBqJ__44DRIG.e3kBFTcgD
 uN8ecKQcMXkW3gg4BCqvZQj6V0hvljHWRk9rcj4tWLnv1OKxJ6Xk.rFRzymUpl7Y.ZhyDoLbdVhj
 DQ8rv1SxbKJuoh3QaYs7u0xtUynrSeg7lDMJbzaSc5f1uPbcPBW5g50v0r0ClmFnFRJdQHuao_Nn
 ZAnEXA1UMEMLsc3VtUKixgqhqpzTEZoHbwgMdb8pSVemCcHEbsGS_N2UfZb62ivHbJcNOnT0XKA-
 -
X-Sonic-MF: <pjp@fedoraproject.org>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic302.consmr.mail.sg3.yahoo.com with HTTP; Tue, 28 Sep 2021 11:39:17 +0000
Date: Tue, 28 Sep 2021 11:39:16 +0000 (UTC)
From: P J P <pjp@fedoraproject.org>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@redhat.com>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Message-ID: <1043465112.1767719.1632829156550@mail.yahoo.com>
In-Reply-To: <798304472.4432617.1631626227208@mail.yahoo.com>
References: <20210908232024.2399215-1-philmd@redhat.com>
 <YTnhy/Wo5M1qVs1k@redhat.com>
 <798304472.4432617.1631626227208@mail.yahoo.com>
Subject: Re: [RFC PATCH 00/10] security: Introduce
 qemu_security_policy_taint() API
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Mailer: WebService/1.1.19043 YMailNorrin
Received-SPF: neutral client-ip=106.10.242.140;
 envelope-from=pjp@fedoraproject.org;
 helo=sonic302-20.consmr.mail.sg3.yahoo.com
X-Spam_score_int: 10
X-Spam_score: 1.0
X-Spam_bar: +
X-Spam_report: (1.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 FREEMAIL_FORGED_REPLYTO=2.095, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NEUTRAL=0.779 autolearn=no autolearn_force=no
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
Reply-To: P J P <pj.pandit@yahoo.co.in>
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tuesday, 14 September, 2021, 07:00:27 pm IST, P J P <pjp@fedoraproject.o=
rg> wrote:
>* Thanks so much for restarting this thread. I've been at it intermittentl=
y last few
> months, thinking about how could we annotate the source/module objects.
>
> -> [*] https://lists.gnu.org/archive/html/qemu-devel/2020-07/msg04642.htm=
l
>
>* Last time we discussed about having both compile and run time options fo=
r users
> to be able to select the qualified objects/backends/devices as desired.
>
>* To confirm: How/Where is the security policy defined? Is it device/modul=
e specific OR QEMU project wide?
>
>>> it feels like we need
>> 'secure': 'bool'
>
>* Though we started the (above [*]) discussion with '--security' option in=
 mind,
> =C2=A0I wonder if 'secure' annotation is much specific. And if we could w=
iden its scope.
>
>
>Source annotations: I've been thinking over following approaches
>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
>1) Segregate the QEMU sources under
>
> =C2=A0../staging/ <=3D devel/experimental, not for production usage
> =C2=A0../src/ <=3D good for production usage, hence security relevant
> =C2=A0../deprecated/ <=3D Bad for production usage, not security relevant
>
> =C2=A0- This is similar to Linux staging drivers' tree.
> =C2=A0- Staging drivers are not considered for production usage and hence=
 CVE allocation.
> =C2=A0- At build time by default we only build sources under ../src/ tree=
.
> =C2=A0- But we can still have options to build /staging/ and /deprecated/=
 trees.
> =C2=A0- It's readily understandable to end users.
>
>2) pkgconfig(1) way:
> =C2=A0- If we could define per device/backend a configuration (.pc) file =
which is then used
> =C2=A0at build/run time to decide which sources are suitable for the buil=
d or usage.
>
> =C2=A0- I'm trying to experiment with this.
>
>3) We annotate QEMU devices/backends/modules with macros which define its =
status.
> =C2=A0It can then be used at build/run times to decide if it's suitable f=
or usage.
> =C2=A0For ex:
>
> =C2=A0$ cat annotsrc.h
>
> =C2=A0#include <inttypes.h>
>
> =C2=A0enum SRCSTATUS {
> =C2=A0DEVEL =3D 0,
> =C2=A0STAGING,
> =C2=A0PRODUCTION,
> =C2=A0DEPRECATED
> =C2=A0};
>
...
>
>
>* Approach 3) above is similar to the _security_policy_taint() API,
> =C2=A0but works at the source/object file level, rather than specific 'st=
ruct type' field.
>=C2=A0
>* Does adding a field to struct type (ex. DeviceClass) scale to all object=
s/modules/backends etc?
> =C2=A0Does it have any limitations to include/cover other sources/objects=
?
>
>* I'd really appreciate your feedback/inputs/suggestions.


Ping...!?
---
=C2=A0 -P J P
http://feedmug.com

