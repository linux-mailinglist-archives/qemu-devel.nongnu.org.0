Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B015F224F
	for <lists+qemu-devel@lfdr.de>; Sun,  2 Oct 2022 11:22:34 +0200 (CEST)
Received: from localhost ([::1]:59856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oevBB-0003OI-AN
	for lists+qemu-devel@lfdr.de; Sun, 02 Oct 2022 05:22:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <commandspider12@gmail.com>)
 id 1oev9G-0001ux-UQ
 for qemu-devel@nongnu.org; Sun, 02 Oct 2022 05:20:34 -0400
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a]:35559)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <commandspider12@gmail.com>)
 id 1oev9F-0002D3-4M
 for qemu-devel@nongnu.org; Sun, 02 Oct 2022 05:20:34 -0400
Received: by mail-qk1-x72a.google.com with SMTP id u28so5202381qku.2
 for <qemu-devel@nongnu.org>; Sun, 02 Oct 2022 02:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date;
 bh=Tpr+hsQdE7Z3tc/b1pBStw2C9eHWGD8k4gxe0LhhhdU=;
 b=kjlZQlWldMRdaUWqPHjja4mRbWBOzFUOmfdo7zXN/y+sUzSxz7tyI/vk8v5qiRe9ZT
 OBr+lPPLXcfm0bWgipWP1qNk3tpRpGF1VXcoPxW8pXfuHR2pqvW9Hn/rN9m4Xno5tTTU
 ZXN3xTT/Rt8vNlBQsNutHDJTmaD/ftaf/RVfvOVZYZvPgb/81e8yb+0OsD9tbrDuBKfD
 jFbfq+HE5BSLn6qp9E0cdsqPcvqfgELoc5KtiaB2pxAZ+fSVaxirAD2O7BQYEangVE8E
 /gZw3vQlF2xypQXFr9AOI4NFTJO7poekKV3Oz+taqwX1wkMw4BKAXiRoQQAN+6O1TNPv
 f+Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date;
 bh=Tpr+hsQdE7Z3tc/b1pBStw2C9eHWGD8k4gxe0LhhhdU=;
 b=0cKUjN/9NEqKjFj7hqjyPbChXp+8SPQuAg3GIrLIE+FwX8cgRedMMMGAr2jpe9qgR1
 KDWnVV+VX78/1nAeL7iDZ9dFKAWDzhJAJ7bzvRWdtk801yh6pXD5G+PJKrOJFIDcI7v5
 Q+doreQXu8Yv3y190BSra3OVoXteT0V8obo2AGSw8QYT6VIjjGQq0NwZYQPFWPAV2Ess
 f5O34m7KvdJO60eZ2epPOEYGaup/VwsT2iSACURI26CWAwIPg/ycJYB2oL9R+6xHpZgp
 Ag6pY2ecxurQbF7RA5WgJkP6/qn/1ctjnkqA5Nrm4sIdqME0Lb0oShSICNJzlh7JlJZF
 BxcA==
X-Gm-Message-State: ACrzQf24VOBRGOohwJANuT1ng6eBKtf4HtQI0H34PFikEbvcxBNwwL3W
 sh7Dxzx95QrT9sSYq+60V2oW+YcFsGDDfzuUD58=
X-Google-Smtp-Source: AMsMyM6ZTthRPKyZDTCCKy2TYfhZy9JoSZydyysipf92iRTxiIBaEKgIdfWonsCw6u8RPj/FIaXeMsUPromc+aUmK1A=
X-Received: by 2002:a05:620a:1254:b0:6cd:4e36:481d with SMTP id
 a20-20020a05620a125400b006cd4e36481dmr10830201qkl.661.1664702431712; Sun, 02
 Oct 2022 02:20:31 -0700 (PDT)
MIME-Version: 1.0
References: <CABVhSWP7XjNvCXUvawXLcOkP4vXQ8wbMObKbxc+jN6gv0wzawQ@mail.gmail.com>
 <3ca717d7-fbc9-b2f9-71cc-01ef459da257@linaro.org>
In-Reply-To: <3ca717d7-fbc9-b2f9-71cc-01ef459da257@linaro.org>
From: BitFriends <commandspider12@gmail.com>
Date: Sun, 2 Oct 2022 11:20:20 +0200
Message-ID: <CABVhSWNkCn-V=ZzUTEi7+hO_a4KJgfpv7N_MW_t+jKRtmTh08A@mail.gmail.com>
Subject: Re: access guest address from within instruction
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Content-Type: multipart/mixed; boundary="00000000000019b44b05ea09bdc3"
Received-SPF: pass client-ip=2607:f8b0:4864:20::72a;
 envelope-from=commandspider12@gmail.com; helo=mail-qk1-x72a.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

--00000000000019b44b05ea09bdc3
Content-Type: multipart/alternative; boundary="00000000000019b44905ea09bdc1"

--00000000000019b44905ea09bdc1
Content-Type: text/plain; charset="UTF-8"

I now came up with this code:

TCGv_i64 res = 0;
TCGv_i64 addr = (TCGv_i64)(env->regs[R_EDI]);

tcg_gen_qemu_ld_i64(res, addr, 0, MO_LEUQ);

env->regs[R_EAX] = (target_ulong)res;

However this crashes afterwards in test_bit. Maybe this is caused by an
invalid access? Anything wrong about the code? This still gives some
warnings, like TCGv_i32 expected (and when you use TCGv_i32, it says
TCGv_i64 expected) plus some casting warnings.

Am Sa., 1. Okt. 2022 um 22:23 Uhr schrieb Richard Henderson <
richard.henderson@linaro.org>:

> On 10/1/22 13:10, BitFriends wrote:
> > Hello,
> >
> > I am trying to create a custom instruction that accesses guest memory
> specified by an
> > address in a register. I specifically want to read from that address. So
> I tried to do
> > that using "tcg_gen_qemu_ld_i64(&res, env->regs[R_EDI], 0, MO_LEUQ);",
> but that doesn't
> > save any result in res.
>
> This statement should have given you compilation errors, so I don't know
> what you mean by
> "doesn't save any result".  There's clearly a disconnect between what you
> describe and
> what you actually attempted.
>
> Anyway, by the name you can see that function "gen"erates a "tcg"
> operation, which is then
> later compiled by the jit, the output of which is later executed to
> produce a result.
> Which is, in general, what you want for implementing a custom instruction.
>
>
> r~
>

--00000000000019b44905ea09bdc1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I now came up with this code:</div><div><br></div><di=
v>TCGv_i64 res =3D 0;<br>TCGv_i64 addr =3D (TCGv_i64)(env-&gt;regs[R_EDI]);=
<br><br>tcg_gen_qemu_ld_i64(res, addr, 0, MO_LEUQ);<br><br>env-&gt;regs[R_E=
AX] =3D (target_ulong)res;</div><div><br></div><div>However this crashes af=
terwards in test_bit. Maybe this is caused by an invalid access? Anything w=
rong about the code? This still gives some warnings, like TCGv_i32 expected=
 (and when you use TCGv_i32, it says TCGv_i64 expected) plus some casting w=
arnings. <br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cl=
ass=3D"gmail_attr">Am Sa., 1. Okt. 2022 um 22:23=C2=A0Uhr schrieb Richard H=
enderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.hender=
son@linaro.org</a>&gt;:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">On 10/1/22 13:10, BitFriends wrote:<br>
&gt; Hello,<br>
&gt; <br>
&gt; I am trying to create a custom instruction that accesses guest memory =
specified by an <br>
&gt; address in a register. I specifically want to read from that address. =
So I tried to do <br>
&gt; that using &quot;tcg_gen_qemu_ld_i64(&amp;res, env-&gt;regs[R_EDI], 0,=
 MO_LEUQ);&quot;, but that doesn&#39;t <br>
&gt; save any result in res.<br>
<br>
This statement should have given you compilation errors, so I don&#39;t kno=
w what you mean by <br>
&quot;doesn&#39;t save any result&quot;.=C2=A0 There&#39;s clearly a discon=
nect between what you describe and <br>
what you actually attempted.<br>
<br>
Anyway, by the name you can see that function &quot;gen&quot;erates a &quot=
;tcg&quot; operation, which is then <br>
later compiled by the jit, the output of which is later executed to produce=
 a result. <br>
Which is, in general, what you want for implementing a custom instruction.<=
br>
<br>
<br>
r~<br>
</blockquote></div>

--00000000000019b44905ea09bdc1--

--00000000000019b44b05ea09bdc3
Content-Type: application/octet-stream; name=bt
Content-Disposition: attachment; filename=bt
Content-Transfer-Encoding: base64
Content-ID: <f_l8r4qt700>
X-Attachment-Id: f_l8r4qt700

IzAgIDB4MDAwMDU1NTU1NWI1NWM5ZCBpbiB0ZXN0X2JpdCAoYWRkcj0weDdmZmZmNWZhZTUyMCwg
bnI9MHhiNmRiNmRiNmRiNmRiNmNiKSBhdCAvcHdkL215X2Z1enplci90b29scy9xZW11LTcuMS4w
L2luY2x1ZGUvcWVtdS9iaXRvcHMuaDoxMzUKIzEgIGluaXRfdHNfaW5mbyAoY3R4PWN0eEBlbnRy
eT0weDdmZmZmNWZhZTUxMCwgdHM9MHg3ZmZmZWMwMDBiNjApIGF0IC4uL3RjZy9vcHRpbWl6ZS5j
OjE1MgojMiAgMHgwMDAwNTU1NTU1YjU2M2JkIGluIGluaXRfYXJndW1lbnRzIChuYl9hcmdzPTxv
cHRpbWl6ZWQgb3V0Piwgb3A9MHg3ZmZmZWMwMGFkMzgsIGN0eD0weDdmZmZmNWZhZTUxMCkgYXQg
Li4vdGNnL29wdGltaXplLmM6NjcxCiMzICB0Y2dfb3B0aW1pemUgKHM9c0BlbnRyeT0weDdmZmZl
YzAwMGI2MCkgYXQgLi4vdGNnL29wdGltaXplLmM6MjA1NAojNCAgMHgwMDAwNTU1NTU1YjYxMDQ1
IGluIHRjZ19nZW5fY29kZSAocz0weDdmZmZlYzAwMGI2MCwgdGI9dGJAZW50cnk9MHg3ZmZmYTlj
OTAxNDAgPGNvZGVfZ2VuX2J1ZmZlcisyOTk1MDIyNz4pIGF0IC4uL3RjZy90Y2cuYzo0MjU0CiM1
ICAweDAwMDA1NTU1NTViYTBlN2UgaW4gdGJfZ2VuX2NvZGUgKGNwdT1jcHVAZW50cnk9MHg1NTU1
NTY4NDkwMTAsIHBjPXBjQGVudHJ5PTB4NDAxY2I1LCBjc19iYXNlPWNzX2Jhc2VAZW50cnk9MHgw
LCBmbGFncz1mbGFnc0BlbnRyeT0weGMwYzJiMywgY2ZsYWdzPTB4ZmYwODAwMDApIGF0MwojNiAg
MHgwMDAwNTU1NTU1YjlhYWU1IGluIGNwdV9leGVjIChjcHU9Y3B1QGVudHJ5PTB4NTU1NTU2ODQ5
MDEwKSBhdCAuLi9hY2NlbC90Y2cvY3B1LWV4ZWMuYzo5ODIKIzcgIDB4MDAwMDU1NTU1NWJiOWQ4
NCBpbiB0Y2dfY3B1c19leGVjIChjcHU9Y3B1QGVudHJ5PTB4NTU1NTU2ODQ5MDEwKSBhdCAuLi9h
Y2NlbC90Y2cvdGNnLWFjY2VsLW9wcy5jOjY3CiM4ICAweDAwMDA1NTU1NTViYjllZjMgaW4gbXR0
Y2dfY3B1X3RocmVhZF9mbiAoYXJnPWFyZ0BlbnRyeT0weDU1NTU1Njg0OTAxMCkgYXQgLi4vYWNj
ZWwvdGNnL3RjZy1hY2NlbC1vcHMtbXR0Y2cuYzo5NwojOSAgMHgwMDAwNTU1NTU1ZDE4MTEzIGlu
IHFlbXVfdGhyZWFkX3N0YXJ0IChhcmdzPTxvcHRpbWl6ZWQgb3V0PikgYXQgLi4vdXRpbC9xZW11
LXRocmVhZC1wb3NpeC5jOjUwNAojMTAgMHgwMDAwN2ZmZmY3OTkyNjA5IGluIHN0YXJ0X3RocmVh
ZCAoYXJnPTxvcHRpbWl6ZWQgb3V0PikgYXQgcHRocmVhZF9jcmVhdGUuYzo0NzcKIzExIDB4MDAw
MDdmZmZmNzhiNTEzMyBpbiBjbG9uZSAoKSBhdCAuLi9zeXNkZXBzL3VuaXgvc3lzdi9saW51eC94
ODZfNjQvY2xvbmUuUzo5NQo=
--00000000000019b44b05ea09bdc3--

