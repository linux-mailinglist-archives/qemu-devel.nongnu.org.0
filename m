Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAA0839212D
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 21:54:56 +0200 (CEST)
Received: from localhost ([::1]:43370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llzcF-0002Bp-DC
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 15:54:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <morrell@alumni.ucsd.edu>)
 id 1llza3-0001SG-Pe
 for qemu-devel@nongnu.org; Wed, 26 May 2021 15:52:39 -0400
Received: from sonic301-22.consmr.mail.gq1.yahoo.com ([98.137.64.148]:44031)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <morrell@alumni.ucsd.edu>)
 id 1llza1-0003gf-GL
 for qemu-devel@nongnu.org; Wed, 26 May 2021 15:52:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1622058753; bh=qzWb4r5BaxRhoxDFRAO1SipQ4nciDiL1V+wBFmVCqrY=;
 h=Date:From:Reply-To:To:In-Reply-To:References:Subject:From:Subject:Reply-To;
 b=rZefaFI1pcMk+D375G4/EeJsng9kXhzixkbvHLNwFHfW2NUsg7zQasxC2BV8eeL5/GwB21hiDJ1SeebtSSjgJXYPstSgP2v1Sa2SgFf/SuXtYJzovRrO/mEh4CWCSwQ7rmJOdKuShmrvAx59sR6JYIUCtPO7nZ+vl/YL+r5kyF8AMEQ/rseFEE6FdFkY763d53DlwPVMifCTiJ/X7T00DREtDNyK4giGzpUO2UvUFGfOWZH0avKzNxrkZKlk7nUupmv2+/19B+bmYYgXCxAnTA7WZChFkQcH28dQBCfhXS1W8UxGNJAWEu+y3bpZrh9bIQYB0G7U5K1C3OOhU4MlOw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1622058753; bh=EIqwe5BJkTpznnvQCv/8RCpWGIpSnyOzYaAxeQjCx7I=;
 h=X-Sonic-MF:Date:From:To:Subject:From:Subject;
 b=SWApXLlCIEYKIhqprMhvEhZsva+n+/vvQs7T0+OYbDuN+9dmte+B6TurBkWKewb6Tm8DneNHhFhlKSSsod0k+7uz12pe2tSWpWGC3TtUssA6Dbb1B9otcW1kmfDbDTVUpSdQ49g8DRB+eCMd/MlIZ0lXXcoz6WsBOKuhD4QNPSH2dO8oc2SDqb041mfPLyIYXVVDqhBhEGxar2E1XGGDQX9iv0pW88jeLk8w0oKasno/V+Mc9uTA4L3J4vIm3n2S2QeUsqKQOGds4Mm97lLrRF8C/Jq1dTXgvjg9huXadbZc+yNyiCicgWY3dqKtjzhEinWtuIkYuFrKitJyPN0INg==
X-YMail-OSG: w3ijo7kVM1mXJ.6JjrVCkg1ysW88.yUuxx8rJnu1pkLEDhzcEobNpPCQy9gMECG
 bg9qpzVjn5RKsFkIXsvY7HSco9qbq30PjJBMBtSPMUbgFNAqNe05CVe_UwjFzotdFk8NB0q8TPD3
 6JCeNEJItaaMNPuj353XOa53XCTL0Gma0ePHQbOP.qWlXRQGF99auwrw3BlUpm8ESN2nSGFnjIlZ
 5BLzPPvpQ43EtkKzKTmRcfBIZjJ5Qh3X_RlYgg2YLnUV117jDaLRImgS7ZZsTJaeIIj4sXUqWYXD
 m8_F0JMahTx1WbL8tw2AZoGJWOAyVIEfkZdxiGsiuD2eKVL_3nIy_xkLVZ1NkGfJK4S2mgd.bmpR
 3LRUlgofqQT6KPTIrB5cGhoPIl.XjHzRiMf62NLELqN.ZDgOahRqj4EpLb9eSm8JWk7qyYyT4Ivr
 v122c_j8RPpp.U4ZMs2p8Dl0M2R68xM.Mtz4vRsprBdG9v_ZXPHjgl9h7DntGQPqNQYs8rmSq6cP
 _BGNgctps4jv3ee3QnksIvk7UqrVEE10zAhXPXun.O_1djtw6An_sKYTEYitFQpriR816ruRfWp7
 xrQe_bkWHaA3n9QJ7NuLMRVC7PlA04SE2OuAeFWraFPitttsIZPLMkS3A_44Mjbqb9.iICsakil7
 tBBPHscaoCHcws31Jl_PZFItg341yi5L_5k98UaqXBykWevuYyZ28bxhKcjq4eWxtkaxBqpZZAaV
 UsGaaZNkR4AzChd0lXWUgM3NEBWvsOUxkr5F5Nyn4NFgzslUVRlvkj84NrlaWRKouWB2Ge_vCnip
 HQsL29Ad8KkNE4SYQilkzCbAYJ2gDmD7DFeK41R0k_tlx65bfoYzP5kS51Q0FCAFgoZBHhFl4diQ
 5f0e91CKG8nJpJ6RNVg_WkV.QlKAbF8EZjf_T9IZ0Wd._ABuKyCjJgZMHq7uauSFUeS4q4per7.V
 yy6eRZfjubTbpH41MbbZpGJq1ax7028R.odsSuLSVAK30HUXUCxKRtqBg0BQoHVKAq72CNTeyIbB
 todrSU8ysRlpbLj8OBSXK3W7C_9_d8tEMD5Tab3G5oLf9zdkOep0AXGku3RdU6aG4ZvaHZImSeYj
 tZyP.OLD9uzPFx5NfJyjDukWZeL..JpOHeZ0MmHMJtpcv2GCYY7eztyBHLR6kfJGAEjINhkidu5z
 FMOjURqH5SyBHcWYYyg7nnUlAGCf_WSqIhZaxsPui96uTdAxBtmBFofzTRkB4MUpUu_1bQcSDGO6
 91AI4qYDx8mGR1TYjvaCs794Q4PatdI6ZCAzcmQAn6dw5wnXkNEdt6xaoP00QZx_nvgUx_lGVqk3
 2ZbNn9PlcUPMxwk8SroRoGaIZ5ExbgQbZyqvGY9C1mqn7aRbRah8kJuRk3Z4jwhZ.HLezRDSbt.k
 XbmL3Y.5N878x5RcxB5hXHcmI62Atm03T3VXmip4T9WlvTtqjU6T35ztaRLiS3d4iDXx43gPkNHM
 Eb1yLlY0XwuqcC1DxeW5QIRHD3hGBgs_ockbfXjFSal.T6GJLOOv1pl5nllAhH2s7mkUkMZSAP9J
 xdYb4c6Z2ZbAUJZcXsE.KFiz07Pnt4wEnLmWkbfYnDA6HanoNIOqxDCHNYVL9zs18rpQXcPg6hwG
 V6MrwxfhSeHgdk3.Tp0eWM04mlJl.wOMsQIBbuunVPhtIUNFD6zKFiyrXNWNfr8s5VlHBsszi7Xo
 nVYooYLUCmeIpDyT2FHORXy3fxz.KQSDXN.81QlBpCcE8voTsmYx8CvhCuJTscQgGdcXZND6KBtK
 wULfcqmQD1BcwUurvWpMiMxi_H5ypNNQbe_l9FnjuDStFEWm8Cki40CoJraruaQqGUpIn29Bx.jX
 Kk71sTXuyAJtimdqPFSEjP6bB1dYwXzeA3EzUvTmL.FhZQFfnpv9XyWACTkCObHArT0uSDTi.uPn
 fQzaZW5budmtpPCodWQkywwC67z1KXCMysW2tiMqi7nnl5QdAO8gHU8vC7aQXVuOQPPQTYZF8mS7
 YrdTJJv3tzaupIZyEQOOm860wlB2MTkdfM8MOElumP22CLpsDBwa7arXeItcjeL9B30JyCLnpoBn
 6IRmTYe1B3yLzDJ_hXyopE31OZUvdFf69499uEuXdKAhvgrcwXT_kLQPQza7eiB2LF9K31iKaqh2
 LC_Zz8dWZeapwGo0FFycmyGVLrItktbwccHThHPiyRauOqy8iGXTRgx.RyTVk1pXlq6uc_mHX5vS
 FaWOjcmkjltSrQnsCx7cM9PYRAyxiUlKi.FuQCgBFM5IHCQ4P2V1Z3o.bStcgDaTa_cbPXd8l_LN
 _6ccUfSwbFnT3DMC0.AHgP6QoHdTFhXF5nM0TOHt_RA_CXZR2lNZmyzKbhXnbvKHq4QiRKFjhS_9
 _zUpFviKajHbG_8R4NGbd6NwTyL5bpGekeb7EnSSajbIGHjLnO9KROSTubNOsB2zCMwi3EP0kVvt
 aC7.0rN_68Mgqdpkc6bV1fQKbBXJcDlF2CIBzbWSRoz4WJhwyjLzwG5LF.8FQJiBNbm3ww4o-
X-Sonic-MF: <morrell@alumni.ucsd.edu>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic301.consmr.mail.gq1.yahoo.com with HTTP; Wed, 26 May 2021 19:52:33 +0000
Date: Wed, 26 May 2021 19:52:29 +0000 (UTC)
To: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1098669241.332748.1622058749094@mail.yahoo.com>
In-Reply-To: <b6cc921d-afad-9b39-e13a-9789bd873f99@linaro.org>
References: <746277332.296230.1622055775751.ref@mail.yahoo.com>
 <746277332.296230.1622055775751@mail.yahoo.com>
 <4bc4444e-782a-311c-719d-091a04e20387@linaro.org>
 <b6cc921d-afad-9b39-e13a-9789bd873f99@linaro.org>
Subject: Re: Denormal input handling
MIME-Version: 1.0
Content-Type: multipart/alternative; 
 boundary="----=_Part_332747_997597827.1622058749093"
X-Mailer: WebService/1.1.18368 YMailNodin
Received-SPF: none client-ip=98.137.64.148;
 envelope-from=morrell@alumni.ucsd.edu;
 helo=sonic301-22.consmr.mail.gq1.yahoo.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  morrell@alumni.ucsd.edu
X-ACL-Warn: ,  Michael Morrell <morrell@alumni.ucsd.edu>
From:  Michael Morrell via <qemu-devel@nongnu.org>

------=_Part_332747_997597827.1622058749093
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

 Richard,

How is what I suggested wrong for x86? It matches the spec and actual behav=
ior:

=3D=3D Start quote =3D=3D
10.2.3.4 Denormals-Are-Zeros

Bit 6 (DAZ) of the MXCSR register enables the denormals-are-zeros mode, whi=
ch controls the processor=E2=80=99s response=20
to a SIMD floating-point denormal operand condition. When the denormals-are=
-zeros flag is set, the processor=20
converts all denormal source operands to a zero with the sign of the origin=
al operand before performing any=20
computations on them. The processor does not set the denormal-operand excep=
tion flag (DE), regardless of the=20
setting of the denormal-operand exception mask bit (DM); and it does not ge=
nerate a denormal-operand exception=20
if the exception is unmasked.
=3D=3D End quote =3D=3D

So, DE should not be set for a denormal input if DAZ is set (it is set only=
 when DAZ is 0 -- the default "IEEE mode").

Can you point me to the ARM documentation?

 Michael
     On Wednesday, May 26, 2021, 12:28:38 PM PDT, Richard Henderson <richar=
d.henderson@linaro.org> wrote: =20
=20
 On 5/26/21 12:23 PM, Richard Henderson wrote:
> On 5/26/21 12:02 PM, Michael Morrell via wrote:
>> I think the behavior should be for denormal inputs that if=20
>> "flush_inputs_to_zero" is true, then set the value to zero (without sett=
ing=20
>> the "input denormal" flag); and if "flush_inputs_to_zero" is false, set =
the=20
>> "input denormal" flag and normalize the input.
>>
>> This matches what x86 does (I'm not sure about other architectures).
>=20
> It is not.
>=20
> Intel Architectures SDM Vol 1, Section 11.5.2.2:
>=C2=A0 =C2=A0 The denormal operand exception is not affected by
>=C2=A0 =C2=A0 flush-to-zero mode.

Ho hum, I misread what you wrote outside the quoted context.

Both your suggestion and the current behaviour are wrong for x86.=C2=A0 The=
 current=20
behavior is correct for arm.

What we need are two separate softfloat flags, one for "any denormal seen o=
n=20
input" and another for "denormal flushed to zero on input".

The target emulation code then chooses what set of bits needs exporting to=
=20
target architecture state.


r~
 =20
------=_Part_332747_997597827.1622058749093
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div>                Richard,<br><br>How is what I suggested wrong for x86?=
  It matches the spec and actual behavior:<br><br>=3D=3D Start quote =3D=3D=
<br>10.2.3.4 Denormals-Are-Zeros<br><br>Bit 6 (DAZ) of the MXCSR register e=
nables the denormals-are-zeros mode, which controls the processor=E2=80=99s=
 response <br>to a SIMD floating-point denormal operand condition. When the=
 denormals-are-zeros flag is set, the processor <br>converts all denormal s=
ource operands to a zero with the sign of the original operand before perfo=
rming any <br>computations on them. The processor does not set the denormal=
-operand exception flag (DE), regardless of the <br>setting of the denormal=
-operand exception mask bit (DM); and it does not generate a denormal-opera=
nd exception <br>if the exception is unmasked.<br>=3D=3D End quote =3D=3D<b=
r><br>So, DE should not be set for a denormal input if DAZ is set (it is se=
t only when DAZ is 0 -- the default &quot;IEEE mode&quot;).<br><br>Can you =
point me to the ARM documentation?<br><br>   Michael<br>            </div> =
           <div class=3D"yahoo_quoted" style=3D"margin:10px 0px 0px 0.8ex;b=
order-left:1px solid #ccc;padding-left:1ex;">                        <div s=
tyle=3D"font-family:'Helvetica Neue', Helvetica, Arial, sans-serif;font-siz=
e:13px;color:#26282a;">                                <div>               =
     On Wednesday, May 26, 2021, 12:28:38 PM PDT, Richard Henderson &lt;ric=
hard.henderson@linaro.org&gt; wrote:                </div>                <=
div><br></div>                <div><br></div>                <div><div dir=
=3D"ltr">On 5/26/21 12:23 PM, Richard Henderson wrote:<br clear=3D"none">&g=
t; On 5/26/21 12:02 PM, Michael Morrell via wrote:<br clear=3D"none">&gt;&g=
t; I think the behavior should be for denormal inputs that if <br clear=3D"=
none">&gt;&gt; "flush_inputs_to_zero" is true, then set the value to zero (=
without setting <br clear=3D"none">&gt;&gt; the "input denormal" flag); and=
 if "flush_inputs_to_zero" is false, set the <br clear=3D"none">&gt;&gt; "i=
nput denormal" flag and normalize the input.<br clear=3D"none">&gt;&gt;<br =
clear=3D"none">&gt;&gt; This matches what x86 does (I'm not sure about othe=
r architectures).<br clear=3D"none">&gt; <br clear=3D"none">&gt; It is not.=
<br clear=3D"none">&gt; <br clear=3D"none">&gt; Intel Architectures SDM Vol=
 1, Section 11.5.2.2:<br clear=3D"none">&gt;&nbsp; &nbsp; The denormal oper=
and exception is not affected by<br clear=3D"none">&gt;&nbsp; &nbsp; flush-=
to-zero mode.<br clear=3D"none"><br clear=3D"none">Ho hum, I misread what y=
ou wrote outside the quoted context.<br clear=3D"none"><br clear=3D"none">B=
oth your suggestion and the current behaviour are wrong for x86.&nbsp; The =
current <br clear=3D"none">behavior is correct for arm.<br clear=3D"none"><=
br clear=3D"none">What we need are two separate softfloat flags, one for "a=
ny denormal seen on <br clear=3D"none">input" and another for "denormal flu=
shed to zero on input".<br clear=3D"none"><br clear=3D"none">The target emu=
lation code then chooses what set of bits needs exporting to <br clear=3D"n=
one">target architecture state.<div class=3D"yqt1274014776" id=3D"yqtfd5863=
5"><br clear=3D"none"><br clear=3D"none"><br clear=3D"none">r~<br clear=3D"=
none"></div></div></div>            </div>                </div>
------=_Part_332747_997597827.1622058749093--

