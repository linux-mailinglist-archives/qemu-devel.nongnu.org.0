Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A4D04E228E
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 09:52:09 +0100 (CET)
Received: from localhost ([::1]:43610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWDlo-0008P6-Df
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 04:52:08 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lw945lw945@yahoo.com>)
 id 1nWDkK-0006vS-Tm
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 04:50:36 -0400
Received: from sonic315-35.consmr.mail.gq1.yahoo.com ([98.137.65.59]:43009)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <lw945lw945@yahoo.com>)
 id 1nWDkI-0000LH-V3
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 04:50:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1647852632; bh=mkLq6uqS3HyAkTKIkNeLEneRedOTz1YCwGVmokdhq0s=;
 h=Date:From:Reply-To:To:Cc:In-Reply-To:References:Subject:From:Subject:Reply-To;
 b=SRVRk7X9JladxJwKGH2TegvqMBjpRYo3vIBU5kNw/beHMwTiBTYX6FyjghK9Sh8pqzzJfqQ6NqkteBkzY6ox0RZrRDonWFJYkrl3GAiUTjICZLlpGe3o8I5cKd4lmYDnK8hYSrLE8uhdEnPzMj/2VOA9HMm1WH9pxRvl3TMChjKRyQkCWCU/opMeXyYjZ4EujGIVQe6tavZAL4R2b1ihYUZGypO4bUksima62ljADYnzcqUvbNUM2RfWTb040LNDG2Cpti0VotMCXwmnuJJApjWEivL5MWRsAlCt6lQJKU/fJwoCiNPgbG6D2wn58iqFlOukt23/mXakGC/WY/G+tw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1647852632; bh=SXb8pymrjI8MD2mK8HNwyrJ0RbkVU2IVc1WizS2KS+N=;
 h=X-Sonic-MF:Date:From:To:Subject:From:Subject;
 b=Hp26EzWcg3AR5gkVXCph7HlEJWUx7ifcebJVIGMwNMtqXdjoYECeTriY24T0n+9YkIxdzp+m9PqpZB2ebJB5Qr4fCRAxlDNIHAm/jpVKwLNPEqVdiOnZ3ZQpyfyO7zpFzvSfTqI2Hxnfp/Qsr4jKAV4RcQDGXYcDdtHqTi7t2LBZw48UzXkpoIzZE2icLBb0DMN6ouSUiQ6dRL9ixnbwPoX4ckGCEWdSpwKrf8CQJvFL59c34sgOkjboMndsUZoLP2rjWVAx6Gs/29JbK683Mih8DNqYqD68eCORQau32sB4DDyycwBltF90IBdYyMgYLwnO8OONkp/KJvaoUwqHpA==
X-YMail-OSG: mzIPjZoVM1ndDgewz7D2BPG4X7HXC8Xx8lZozbyxig3Z3TSZXTGrAMMWLGoHaZo
 DdEy8XG39MpMWrVRgNX2uEcGDuTS4_ghkJ8Cy3KWyA2dq012v3FICRrcSWGTJaZkaTlPMk73umbo
 iKFXCdg2h4Z5wylsk664mHCk_PhllayFtq4IPziaty3UBolqR1NY2XcxoQPj1STaU_1WWGOZychu
 8i_m5s_Q0Q.I07sGIg7.hCf3g9LD_D_dM18jTnKKBb6DjSXZ9O4mueFTPi_9n0ghVW.0OiWUhRBG
 pLCK3YNWQJe.FTBmDJPkWWtHmvlKReqf793NgWQ1VBvd3iCY1raM_CSfUV7hWm_0rbEt80RMou3I
 tn55Albv7luy1skH_mOysLs_D77l5H_aYoiRuETPit8r3.d9DmO_SEfqUj0VKLkSn7A559qDlZ_u
 Rc5a8LjD_aKPIMwn1gRfcdt2BGyKSY3YLv6UnZSD0gVpbH7mAMKKK43_6IpL.s1h2wkM9498v7dX
 uNeD4T93nTiYCacPC1iykmqSRf.TpXI_W0XKJsmekv8dUWFu3cHCAzUxptIXQzm8DqyM2qCtEGNB
 2KyqiEyILbTo8Ha0BId4FznqaznKu1RlkQ3ulEfO3_cDmEYZdfwcnK9UdVknwjo.wwd1mcOe1ERR
 UhXMSzkx0ZP.plFOzII3nyyv6GlIDkM7aADAFICguH3MjiyWlYpY3AQHnex1OqCa0vF6lqtxXq2k
 gUiJ.Gde4P9rWpXf3F0KlZviC_UHFmQ0f2OhhDORXYkCw1JgIaYCOAu4GzhgMg0sf9tqAALM70t7
 XcO5hATfSSnf2_zq5sjZOgtvbH8ICrnWC57RmK7UPoqMB0vbwomyvd5N2zkVB0LeiHoozUdSoN2Y
 zYNXt7QGDGbFuiMCIyJKcmfTprv01X1zZklL_2ZXmzpH4Gj6OeiGIe1ioh94CY6Wu2rT.3r.rm80
 _eufY9t0d1NgJ3nvCpTCXPJ3iHirxVL_AFSXekgfjoW4XTI1rfoemWpBuA9ouusp365p051sY70i
 ME1d9liETUlfpozLy.4igYIAUMvqiizUF9yMKbebOEsrUefzKBDUsR03aDTrpftU01Q67avCNNYx
 OYPA.3ePt.FzQ5qKjRcSsPkku1NWBKCPYjFfsN2pB2TqAzvEIUkALwIWjxquF7W.EroD.ihM1Eyi
 HYQiK8bXdLPCS1kyV2x_HuVZ8bfaQYUB3hHwzvHs_Zg2ckLprElB8TTiRNRA1wYOSFVLzYm5gkyQ
 Tkl_iIrMrKIx6SOxA7JGrCVlzTOsVaiuR1Q.50wKTv5d2Vmqgvhxw_lXLbacupkc77QGB2csKq.P
 ZWL45cG7Qxp2cqPtS_8a5YSDzbEBwaYkMbD3trsVJBuAtNx3A0PeJFNDmDnawKxTweAe04JQnAE1
 eJEhFUZxMauXaEUvDLk.N5ddD9Vv0eYlVyTSwInMlPDP03wmx05KEDY.SCsljnJiBoMKQeODx4at
 n9B1ruC.bmCUiGLjNJnxfwb.JJCDG_JufEvhcLvPMHbzv9ZUuDS_oY.lVIxkHAnk2xJMJ7r__4C5
 IEvgc5YHsB_drqfdGoFAs5I8MHoD2RBPsIKeZfKdBY24M5hWJAevo2HV9ODM4Yvzs.cYgIbGMXkN
 Ov66LiulwGxmkNcMq49_6YxnBXPiaR.1VPIms3Tx3I9mTL.293ugfUPTcQMV2vD8I5NuQR_tS6LO
 m3yz..9GPwSNMCCL1V.8tlOGhDB2Ynr.loqGTX8OahWp0bYkXW83oV8mKjdNjAfWu2dJKwa0lmvY
 nEFLDDC68t1RBc8AXjyLWUVZkXdOaqa4Snx7NmhymRTiIL5y2HHIpjP8WfEz_HWhRcmFqD0q3pHk
 NcoTyaM2qazLAY8WoX1cvOt8wqu9r0DVW.iXRqIDI1FIIOFEdfZv0dTmNjxC99ZT1VFubhhQ6QoA
 hq3lebTR93ikak3nrrtVyd0PdcArTJ85bKWE7tdsQWssk1u0oZ0XobJTNRKFRNKWsT2oM7Qz6siV
 1WwgrwD4Kox6tO_MlCbEkUZw7YN6iJuz2p_oAXoaApJTdqut3tIV8Jc3WyQ_lTgVNP99JX6TOxIC
 PPVOYILadA0UwbePphxn3vbmkP7E7.uVO5qVQzLT_vNDoIiiAO6M3cJvsmZ._27DTYo0FZ0kciC6
 yZybI3vNKy.CYgYHsNZc.b1qNjoUCdb806PTTx9UV_K32W8CFcND1BGoS5NgCPyU.sU09s4Mz6dY
 zR52JNPsOBlGxF89OLCpaOvDXNROPumwaVdGL1R3wNBk.V2TPx4zQJ7OzJY99AvSq
X-Sonic-MF: <lw945lw945@yahoo.com>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic315.consmr.mail.gq1.yahoo.com with HTTP; Mon, 21 Mar 2022 08:50:32 +0000
Date: Mon, 21 Mar 2022 08:50:32 +0000 (UTC)
From: Wei Li <lw945lw945@yahoo.com>
To: "pbonzini@redhat.com" <pbonzini@redhat.com>, 
 "eduardo@habkost.net" <eduardo@habkost.net>, 
 Richard Henderson <richard.henderson@linaro.org>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Message-ID: <37170609.693719.1647852632111@mail.yahoo.com>
In-Reply-To: <413ffde7-9e24-8047-7d77-f14769808d73@linaro.org>
References: <20220319160658.336882-1-lw945lw945@yahoo.com>
 <20220319160658.336882-3-lw945lw945@yahoo.com>
 <413ffde7-9e24-8047-7d77-f14769808d73@linaro.org>
Subject: Re: [PATCH 2/2] fix lock cmpxchg instruction
MIME-Version: 1.0
Content-Type: multipart/alternative; 
 boundary="----=_Part_693718_642274804.1647852632109"
X-Mailer: WebService/1.1.19894 YMailNorrin
Received-SPF: pass client-ip=98.137.65.59; envelope-from=lw945lw945@yahoo.com;
 helo=sonic315-35.consmr.mail.gq1.yahoo.com
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

------=_Part_693718_642274804.1647852632109
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

>This is better addressed with a movcond:
OK. a movcond is better than a branch. : )=C2=A0I will update in patch v2.
Wei Li=20

    On Monday, March 21, 2022, 03:21:27 AM GMT+8, Richard Henderson <richar=
d.henderson@linaro.org> wrote: =20
=20
 On 3/19/22 09:06, Wei Li wrote:
> For lock cmpxchg, the situation is more complex. After the instruction
> is completed by tcg_gen_atomic_cmpxchg_tl, it needs a branch to judge
> if oldv =3D=3D cmpv or not. The instruction only touches accumulator when
> oldv !=3D cmpv.
>=20
> Signed-off-by: Wei Li <lw945lw945@yahoo.com>
> ---
>=C2=A0 target/i386/tcg/translate.c | 5 +++++
>=C2=A0 1 file changed, 5 insertions(+)
>=20
> diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
> index 05be8d08e6..4fd9c03cb7 100644
> --- a/target/i386/tcg/translate.c
> +++ b/target/i386/tcg/translate.c
> @@ -5360,7 +5360,12 @@ static target_ulong disas_insn(DisasContext *s, CP=
UState *cpu)
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gen_lea_mod=
rm(env, s, modrm);
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_ato=
mic_cmpxchg_tl(oldv, s->A0, cmpv, newv,
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 s->mem_index, ot | MO_LE);
> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 label1 =3D gen_n=
ew_label();
> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gen_extu(ot, old=
v);
> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gen_extu(ot, cmp=
v);
> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tcg_gen_brcond_t=
l(TCG_COND_EQ, oldv, cmpv, label1);
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gen_op_mov_=
reg_v(s, ot, R_EAX, oldv);

This is better addressed with a movcond:

=C2=A0 =C2=A0 TCGv temp =3D tcg_temp_new();
=C2=A0 =C2=A0 tcg_gen_mov_tl(temp, cpu_regs[R_EAX]);
=C2=A0 =C2=A0 /* Perform the merge into %al or %ax as required by ot. */
=C2=A0 =C2=A0 gen_op_mov_reg_v(s, ot, R_EAX, oldv);
=C2=A0 =C2=A0 /* Undo the entire modification to %rax if comparison equal. =
*/
=C2=A0 =C2=A0 tcg_gen_movcond_tl(TCG_COND_EQ, cpu_regs[R_EAX], oldv, cmpv,
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 cpu_regs[R_EAX], temp);
=C2=A0 =C2=A0 tcg_temp_free(temp);


r~
 =20
------=_Part_693718_642274804.1647852632109
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html><head></head><body><div class=3D"ydp602e34d1yahoo-style-wrap" style=
=3D"font-family:Helvetica Neue, Helvetica, Arial, sans-serif;font-size:13px=
;"><div><div dir=3D"ltr" data-setdir=3D"false"><span><span style=3D"font-fa=
mily: Helvetica Neue, Helvetica, Arial, sans-serif;">&gt;This is better add=
ressed with a movcond:</span></span><br></div><div dir=3D"ltr" data-setdir=
=3D"false">OK. a movcond is better than a branch. : )&nbsp;</div><div dir=
=3D"ltr" data-setdir=3D"false">I will update in patch v2.</div><div class=
=3D"ydp602e34d1signature"><br><div>Wei Li</div></div></div>
        <div><br></div><div><br></div>
       =20
        </div><div id=3D"yahoo_quoted_8797121459" class=3D"yahoo_quoted">
            <div style=3D"font-family:'Helvetica Neue', Helvetica, Arial, s=
ans-serif;font-size:13px;color:#26282a;">
               =20
                <div>
                    On Monday, March 21, 2022, 03:21:27 AM GMT+8, Richard H=
enderson &lt;richard.henderson@linaro.org&gt; wrote:
                </div>
                <div><br></div>
                <div><br></div>
                <div><div dir=3D"ltr">On 3/19/22 09:06, Wei Li wrote:<br cl=
ear=3D"none">&gt; For lock cmpxchg, the situation is more complex. After th=
e instruction<br clear=3D"none">&gt; is completed by tcg_gen_atomic_cmpxchg=
_tl, it needs a branch to judge<br clear=3D"none">&gt; if oldv =3D=3D cmpv =
or not. The instruction only touches accumulator when<br clear=3D"none">&gt=
; oldv !=3D cmpv.<br clear=3D"none">&gt; <br clear=3D"none">&gt; Signed-off=
-by: Wei Li &lt;<a shape=3D"rect" ymailto=3D"mailto:lw945lw945@yahoo.com" h=
ref=3D"mailto:lw945lw945@yahoo.com">lw945lw945@yahoo.com</a>&gt;<br clear=
=3D"none">&gt; ---<br clear=3D"none">&gt;&nbsp;  target/i386/tcg/translate.=
c | 5 +++++<br clear=3D"none">&gt;&nbsp;  1 file changed, 5 insertions(+)<b=
r clear=3D"none">&gt; <br clear=3D"none">&gt; diff --git a/target/i386/tcg/=
translate.c b/target/i386/tcg/translate.c<br clear=3D"none">&gt; index 05be=
8d08e6..4fd9c03cb7 100644<br clear=3D"none">&gt; --- a/target/i386/tcg/tran=
slate.c<br clear=3D"none">&gt; +++ b/target/i386/tcg/translate.c<br clear=
=3D"none">&gt; @@ -5360,7 +5360,12 @@ static target_ulong disas_insn(DisasC=
ontext *s, CPUState *cpu)<br clear=3D"none">&gt;&nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  gen_lea_modrm(env, s, modrm);<br clear=
=3D"none">&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
;  tcg_gen_atomic_cmpxchg_tl(oldv, s-&gt;A0, cmpv, newv,<br clear=3D"none">=
&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp;  s-&gt;mem_index, ot | MO_LE);<br clear=3D"none">&gt; +&nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; label1 =3D gen_new_label();<br =
clear=3D"none">&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; gen_extu(ot, oldv);<br clear=3D"none">&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; gen_extu(ot, cmpv);<br clear=3D"none">&gt; +&nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; tcg_gen_brcond_tl(TCG_C=
OND_EQ, oldv, cmpv, label1);<br clear=3D"none">&gt;&nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  gen_op_mov_reg_v(s, ot, R_EAX, oldv=
);<br clear=3D"none"><br clear=3D"none">This is better addressed with a mov=
cond:<br clear=3D"none"><br clear=3D"none">&nbsp; &nbsp;  TCGv temp =3D tcg=
_temp_new();<br clear=3D"none">&nbsp; &nbsp;  tcg_gen_mov_tl(temp, cpu_regs=
[R_EAX]);<br clear=3D"none">&nbsp; &nbsp;  /* Perform the merge into %al or=
 %ax as required by ot. */<br clear=3D"none">&nbsp; &nbsp;  gen_op_mov_reg_=
v(s, ot, R_EAX, oldv);<br clear=3D"none">&nbsp; &nbsp;  /* Undo the entire =
modification to %rax if comparison equal. */<br clear=3D"none">&nbsp; &nbsp=
;  tcg_gen_movcond_tl(TCG_COND_EQ, cpu_regs[R_EAX], oldv, cmpv,<br clear=3D=
"none">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; cpu_regs[R_EAX], temp);<br clear=3D"none">&nbsp; &nbsp;  tc=
g_temp_free(temp);<div class=3D"yqt9388598598" id=3D"yqtfd90513"><br clear=
=3D"none"><br clear=3D"none"><br clear=3D"none">r~<br clear=3D"none"></div>=
</div></div>
            </div>
        </div></body></html>
------=_Part_693718_642274804.1647852632109--

