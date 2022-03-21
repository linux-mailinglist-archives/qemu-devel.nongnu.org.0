Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BA6F4E226C
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 09:47:10 +0100 (CET)
Received: from localhost ([::1]:38272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWDgy-0004YL-LA
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 04:47:08 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lw945lw945@yahoo.com>)
 id 1nWDfE-0003rf-KS
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 04:45:21 -0400
Received: from sonic302-20.consmr.mail.gq1.yahoo.com ([98.137.68.146]:41700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <lw945lw945@yahoo.com>)
 id 1nWDfC-0007B1-Ay
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 04:45:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1647852314; bh=chv8/AGYhp6AbIy75VuzFR0g2DufR9g+Ej2h/BMKCYM=;
 h=Date:From:Reply-To:To:Cc:In-Reply-To:References:Subject:From:Subject:Reply-To;
 b=gD09vrktv+TPHds/yVEomBVRZV5gREwjuSrVM4E9wZAjcszl75ls2yXnnhQnksvpYHB8knkIB0TMfkvAHNyZZLP62PtPDaoa/5HLuuX+ZxfvFYRfyFaOtZqwhrFjzXo2JXi8oL4anVbyLrzjjP26UMo9+LGtcJCV1r5mlv61J70/yKwwhAAR8+XipHC7Zpjw0lba40tZSomtIjZ6DzBfhBQGtschJWIc7xqSLNkMwSyBDogOdloiepHSncNec4Hk0z8c6GHjs5kkKIER2Uo94CFqgR+WDyK5+EmTS4WM/pFiTpGruMBYvaDFTUIXoBKqwDGLvNgNDZfh8XJ4OhQSIw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1647852314; bh=nlMgF40nDZ2s58aWD4tmwSKWeON7WBI9e/bu0z4SB9J=;
 h=X-Sonic-MF:Date:From:To:Subject:From:Subject;
 b=EMjEyc+XaabE6Dgehylhk7IMPkhvNSjIJFjMjApUAXtqZwq1TPMsIprQfn2Ud9hyJgqTxFhbLY7HhhAEwL9emjEmtRRys4KaUBD4lHruBJGJznapCFy5OS5Vnxr3SrDKOE7/aUjVl1DM9ek/9T3mj6/TdewPd1MqfmErl/nR9vzB9x/EJCzSiwRB37rmbajmR6IXh+5JC31Muqj6DsBleqEwdtDwM1WqNDvvQChyItbPYomzvHzgAZ4XoiqA3VRagRTf7qrNkrgroGIbRfD43/NvDYZRmhpPEyZUd907ut+XnaLWXBzl/CVK8QQcmLN5yCGLFjUQs3shyrRjUc211Q==
X-YMail-OSG: QrH6L_EVM1mLwtTQly5GfbCNPoqHxACCui1bKs3J5uQa_apk1VfzuCboqDQX9c9
 ST398EIiwBi7Ec9HbseIh4LUz.pRFs7gPDCAPXr2VGp.u8KWmvtPQUFIn2ngNWfMGXJc5FIKb1Tx
 SVEyO0jsyRqWrg7t_C0s5hMCykQoTwK3iiA6dXY6UMmjTDGmqHuM4vKDNXaCUkq37Qv8XyaIePu7
 UADhRglj.D70UYBsX_qSnzz9L1aYaZCXbgVoV_mtrngkR3QV8MWBAx1j_lkAsuTran9UBUOza4tN
 4_9CU4lvrK80jovIF.lYshp1HPdPCDG.M3vYrTM62iM4v2cVWMNH4Jh0LTjCuOFrwV2sILk3larJ
 PL_gglw5ygE7DhJzsxjW3iwpDWQ4a4JLdOm8Z_TFl3h8rkl34Dsyka05d00jFb7UA.hlxFmB1UJl
 TktbzZsmSHZQCccRW99hj8OlUD8gBuBRkXTpJbXFAGTZyfsls0Ujt2_zb8b5RCfR5uZ8rwHGCfmw
 FUAGE1qs0DF5Fsu24vuNdn5Pj0.AC9IFv.DLRbwbRSAnPp.WTsDdDbVHnyHiFUDcC1e7L.UJFSck
 KbXATac8GCwM2qREht.fmXv6zjFAQAvyWAugaV7MIIEVlBmrN7Nb9xSNW_Oewy5d18UmMIdzR0aI
 fbILo2gI8UOrP7qTpIrsgAAXD1RwaPtuPP06GysDD2OQgq..EMD2c8W6NRla56RQbxgCwXlFfAOq
 5vJAFwILCKSpWwr9UfcfGtBLDEwO8Y8nXENnGrm4NGDlpyyWDUCTEbpqsaptl1EJSeYbiSxdfBor
 1ViWnvEcdWMLyrzCHOBqazNJBsLZMLYDH_fD0rOiIxpmURpj.kAGC53hxzZeqiXX5.oXRjtCmWsK
 4u72KwH8X1n3bmk9wf9lpO3kPND_OifEHTgYBw9LJKaI4Rcu.aN6xojDIkOmrXcpKViTdB58GUg3
 d266ILZ7z.2DLwc6pKSykxMoc6.EEHSHkCQa6u_80RTHKl3yWOQMdNPWhzMI1PFkoHJ1GSFe_7WB
 a9vUuslVNjVrUTs.YCSmmlN7njOemy_sEMR.uhepHjA27IdXzAbi7hn7j5lAUI7nUldsD3i841bO
 WQ4iO1BJVoM.hg_ZSKyJz_IoZlH8IPjNeEhHBmcGigf5PHjKi36aly7jO.mrQFnMf0qhn8UZGR9R
 .Z3gMSytZUukvNcXjLDdfA_2Ysoh5VAMxIUttUlyxaR8mTfsFuBGxeBlYa8yqocqOgu0aaPqFGUK
 dA1cyagiwH1hhksWSsMQcxK60Nsfi_hIjpGXLN16MzguNhO7bM3YMbmugkl9xRBP_bJzqjX.rioj
 zcf0A7Hje9uO4.Uc8Tz7S6Xpzg8KdfU4GsFhKuvT0MCQta5YRUK2wo7iFHatKUCyABeR_oEoMkub
 n5UJ7WqtT4b6d4ixo3Sv4FZNnHcgyebgrdjLmuFZVRBtiBAD_q5zeXs3_CbD7O5RonwMfQTJ37hb
 j917GbH0T.t9Es2LfxT8TBjAfV82oYKj1r_258wxX8gNgpeIHdIzeihkGfp6ihKq67Y8uT9NKSpI
 84WmqkI61rsCzKksg22jVm5kH2FryWA0ad2CpSfN8lIaH1iH4_7_g0cNpPNeJUFG9jtlJzGM3BNR
 f9cncKrI3sri2cLtezLPMDVLKWAtTYFcqn6BCj6OnBjvjeaQcyddXnqWhC5f.4d_B3DJZkEIiELt
 kn1JyT6mXJH7m5rlWSa.jdaveP2KRc6DmrVEtgp1OxN6FX9yJGmePzpEhUtFYNt2OJ2gKIFqjkpN
 eriqEYH09UILCGOgDev2T0Qd13o.izl3YDX1q7RIP96qhzQE3Smj8bpA5eanWt0NyodmBi.vpahA
 XWUU3WzkF2v_2o1IdELDECh2m4Rm9dxwJx0yCcWK2QoBnc3qLp65HEvGJwYr1F8blMxRiqSDDg3.
 rTXPn32Lb.GV6PjNVSXtLuStN0RIxRISy_aXPp0a5UgYMjVL5FyQJ.pVQItBWArzWc7eQyEpkKMM
 PwZwilfOrh9iwYM3KVB5KqMLaLutkOKGKWx1RpggfYc7pM9jD4MEMuUN0m4Hxuy2XIBUyvSDrS1B
 PUrwaYLgeYtFyQmHqFRXMTM6_wBKVy87kyUo3ZCJZfM7GSL0iaj_lnRyV8Et1EwLDHilhSNStha6
 O6TAPJQFa5hA9IspKOgIeUtLYavafmHQuAkRvAaeSEbNlBJtMF9VzeVbljg_CFhFYjjNTeCZDuxd
 Z7xdPJSpYjBTKWQf4QhgeDgSHg.CUiVTOHAxgKP_JTDxVj7OZe6hiRehwr_rUWcfi4Q--
X-Sonic-MF: <lw945lw945@yahoo.com>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic302.consmr.mail.gq1.yahoo.com with HTTP; Mon, 21 Mar 2022 08:45:14 +0000
Date: Mon, 21 Mar 2022 08:44:23 +0000 (UTC)
From: Wei Li <lw945lw945@yahoo.com>
To: "pbonzini@redhat.com" <pbonzini@redhat.com>, 
 "eduardo@habkost.net" <eduardo@habkost.net>, 
 Richard Henderson <richard.henderson@linaro.org>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Message-ID: <813174543.699529.1647852263395@mail.yahoo.com>
In-Reply-To: <5389600e-2bce-3db4-3826-1d46221dddb0@linaro.org>
References: <20220319160658.336882-1-lw945lw945@yahoo.com>
 <20220319160658.336882-2-lw945lw945@yahoo.com>
 <5389600e-2bce-3db4-3826-1d46221dddb0@linaro.org>
Subject: Re: [PATCH 1/2] fix cmpxchg instruction
MIME-Version: 1.0
Content-Type: multipart/alternative; 
 boundary="----=_Part_699528_513786592.1647852263393"
X-Mailer: WebService/1.1.19894 YMailNorrin
Received-SPF: pass client-ip=98.137.68.146; envelope-from=lw945lw945@yahoo.com;
 helo=sonic302-20.consmr.mail.gq1.yahoo.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 FREEMAIL_REPLYTO_END_DIGIT=0.25, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reply-To: Wei Li <lw945lw945@yahoo.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

------=_Part_699528_513786592.1647852263393
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

>There is no branch in movcond -- this expands to cmov.Thanks. I get it.
>Your branch invalidates the comment -- the store becomes conditional, and =
we no longer get
>a write fault on read-only pages when the comparison fails.=C2=A0 OTOH, we=
're already getting
>the incorrect SIGSEGV behaviour, since we get a read fault on an unmapped =
page instead of
>a write fault.I cannot get the point. Here is my understanding.when the co=
mparison fails, program executes=C2=A0gen_op_st_v(s, ot, oldv, a0). Then we=
 will get theincorrect SIGSEGV behaviour that a read fault instead of a wri=
te fault. But why the SIGSEGVbehaviour is a read fault not a write fault? T=
he memory operation is a write operation.
>Alternately, we can use the tcg_gen_atomic_cmpxchg_tl path whenever mod !=
=3D 3.=C2=A0 While an>unlocked cmpxchg need not be atomic, it is not requir=
ed to be non-atomic either, and it>would reduce code duplication.A good adv=
ice to implement. I will update in patch v2.

Wei Li=20

    On Monday, March 21, 2022, 03:07:50 AM GMT+8, Richard Henderson <richar=
d.henderson@linaro.org> wrote: =20
=20
 On 3/19/22 09:06, Wei Li wrote:
> We need a branch to determine when the instruction can touch the
> accumulator. But there is a branch provided by movcond.

There is no branch in movcond -- this expands to cmov.

> -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* store value =
=3D (old =3D=3D cmp ? new : old);=C2=A0 */
> -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_movcond_=
tl(TCG_COND_EQ, newv, oldv, cmpv, newv, oldv);
> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_brcond_t=
l(TCG_COND_EQ, oldv, cmpv, label1);
...
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 /* Perform an unconditional store cycle like physical cpu;
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 must be before changing accumulator to ensure
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 idempotency if the store faults and the instruction
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 is restarted */

Your branch invalidates the comment -- the store becomes conditional, and w=
e no longer get=20
a write fault on read-only pages when the comparison fails.=C2=A0 OTOH, we'=
re already getting=20
the incorrect SIGSEGV behaviour, since we get a read fault on an unmapped p=
age instead of=20
a write fault.

The faulting behaviour could be addressed with a write_probe prior to the o=
riginal load.=20
Alternately, we can use the tcg_gen_atomic_cmpxchg_tl path whenever mod !=
=3D 3.=C2=A0 While an=20
unlocked cmpxchg need not be atomic, it is not required to be non-atomic ei=
ther, and it=20
would reduce code duplication.


r~
 =20
------=_Part_699528_513786592.1647852263393
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html><head></head><body><div class=3D"ydpbf9bf775yahoo-style-wrap" style=
=3D"font-family:Helvetica Neue, Helvetica, Arial, sans-serif;font-size:13px=
;"><div><div dir=3D"ltr" data-setdir=3D"false">&gt;<span><span style=3D"fon=
t-family: Helvetica Neue, Helvetica, Arial, sans-serif;">There is no branch=
 in movcond -- this expands to cmov.</span></span></div><div dir=3D"ltr" da=
ta-setdir=3D"false">Thanks. I get it.</div><div dir=3D"ltr" data-setdir=3D"=
false"><br></div><div dir=3D"ltr" data-setdir=3D"false"><div><span style=3D=
"font-family: Helvetica Neue, Helvetica, Arial, sans-serif;">&gt;Your branc=
h invalidates the comment -- the store becomes conditional, and we no longe=
r get</span><br clear=3D"none" style=3D"font-family: Helvetica Neue, Helvet=
ica, Arial, sans-serif;"><span style=3D"font-family: Helvetica Neue, Helvet=
ica, Arial, sans-serif;">&gt;a write fault on read-only pages when the comp=
arison fails.&nbsp; OTOH, we're already getting</span><br clear=3D"none" st=
yle=3D"font-family: Helvetica Neue, Helvetica, Arial, sans-serif;"><span st=
yle=3D"font-family: Helvetica Neue, Helvetica, Arial, sans-serif;">&gt;the =
incorrect SIGSEGV behaviour, since we get a read fault on an unmapped page =
instead of</span><br clear=3D"none" style=3D"font-family: Helvetica Neue, H=
elvetica, Arial, sans-serif;"><span style=3D"font-family: Helvetica Neue, H=
elvetica, Arial, sans-serif;">&gt;a write fault.</span></div>I cannot get t=
he point. Here is my understanding.</div><div dir=3D"ltr" data-setdir=3D"fa=
lse">when the comparison fails, program executes&nbsp;<span>gen_op_st_v(s, =
ot, oldv, a0). Then we will get the</span></div><div dir=3D"ltr" data-setdi=
r=3D"false"><span><span>incorrect SIGSEGV behaviour that a read fault inste=
ad of a write fault. But why the SIGSEGV</span></span></div><div dir=3D"ltr=
" data-setdir=3D"false"><span><span>behaviour is a read fault not a write f=
ault? The memory operation is a write operation.</span></span></div><div di=
r=3D"ltr" data-setdir=3D"false"><span><span><br></span></span></div><div di=
r=3D"ltr" data-setdir=3D"false"><span><div><div>&gt;Alternately, we can use=
 the tcg_gen_atomic_cmpxchg_tl path whenever mod !=3D 3.&nbsp; While an</di=
v><div>&gt;unlocked cmpxchg need not be atomic, it is not required to be no=
n-atomic either, and it</div><div>&gt;would reduce code duplication.</div><=
/div><div>A good advice to implement. I will update in patch v2.</div></spa=
n></div><div><br></div><div class=3D"ydpbf9bf775signature"><br><div>Wei Li<=
/div></div></div>
        <div><br></div><div><br></div>
       =20
        </div><div id=3D"ydpc5b12434yahoo_quoted_8763604967" class=3D"ydpc5=
b12434yahoo_quoted">
            <div style=3D"font-family:'Helvetica Neue', Helvetica, Arial, s=
ans-serif;font-size:13px;color:#26282a;">
               =20
                <div>
                    On Monday, March 21, 2022, 03:07:50 AM GMT+8, Richard H=
enderson &lt;richard.henderson@linaro.org&gt; wrote:
                </div>
                <div><br></div>
                <div><br></div>
                <div><div dir=3D"ltr">On 3/19/22 09:06, Wei Li wrote:<br cl=
ear=3D"none">&gt; We need a branch to determine when the instruction can to=
uch the<br clear=3D"none">&gt; accumulator. But there is a branch provided =
by movcond.<br clear=3D"none"><br clear=3D"none">There is no branch in movc=
ond -- this expands to cmov.<br clear=3D"none"><br clear=3D"none">&gt; -&nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /* store value =3D (ol=
d =3D=3D cmp ? new : old);&nbsp; */<br clear=3D"none">&gt; -&nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; tcg_gen_movcond_tl(TCG_COND_EQ, ne=
wv, oldv, cmpv, newv, oldv);<br clear=3D"none">&gt; +&nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; tcg_gen_brcond_tl(TCG_COND_EQ, oldv, cmpv=
, label1);<br clear=3D"none">...<br clear=3D"none">&gt;&nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  /* Perform an unc=
onditional store cycle like physical cpu;<br clear=3D"none">&gt;&nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; must be before changing accumulator to ensure<br clear=3D"none">&gt;&n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; idempotency if the store faults and the instruction<br clear=
=3D"none">&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; is restarted */<br clear=3D"none"><br clear=
=3D"none">Your branch invalidates the comment -- the store becomes conditio=
nal, and we no longer get <br clear=3D"none">a write fault on read-only pag=
es when the comparison fails.&nbsp; OTOH, we're already getting <br clear=
=3D"none">the incorrect SIGSEGV behaviour, since we get a read fault on an =
unmapped page instead of <br clear=3D"none">a write fault.<br clear=3D"none=
"><br clear=3D"none">The faulting behaviour could be addressed with a write=
_probe prior to the original load. <br clear=3D"none">Alternately, we can u=
se the tcg_gen_atomic_cmpxchg_tl path whenever mod !=3D 3.&nbsp; While an <=
br clear=3D"none">unlocked cmpxchg need not be atomic, it is not required t=
o be non-atomic either, and it <br clear=3D"none">would reduce code duplica=
tion.<div class=3D"ydpc5b12434yqt9761350354" id=3D"ydpc5b12434yqtfd39038"><=
br clear=3D"none"><br clear=3D"none"><br clear=3D"none">r~<br clear=3D"none=
"></div></div></div>
            </div>
        </div></body></html>
------=_Part_699528_513786592.1647852263393--

