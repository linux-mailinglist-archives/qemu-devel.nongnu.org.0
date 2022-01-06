Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E18A1486309
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 11:39:18 +0100 (CET)
Received: from localhost ([::1]:38600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5QAw-0002DT-0q
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 05:39:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stevie.lavern@gmail.com>)
 id 1n5Q7g-0008KN-OM
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 05:35:56 -0500
Received: from [2607:f8b0:4864:20::12a] (port=36752
 helo=mail-il1-x12a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stevie.lavern@gmail.com>)
 id 1n5Q7f-0003K1-7b
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 05:35:56 -0500
Received: by mail-il1-x12a.google.com with SMTP id v10so1731132ilj.3
 for <qemu-devel@nongnu.org>; Thu, 06 Jan 2022 02:35:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=oLE7Y5HZPNOSCx7gzcgnu+XUl+njQJZs9Mxh4w2QmXo=;
 b=PghNGt9KDyTEdAiAdZvj2xs5tlDHlPJ9sJhdaBfj1pfLaGOOVz7GewcRFSQ+BQM1Bi
 9ljpO/PvNcrZv2ZZnpRPj0zZLgPAgDGM+gkFfpmqjk6Z9P0JPnGSlJwpmyzFojH27O4M
 bVzCTz844LrwMD3l7rKSWt5LEDAB6xQ8J8Ge6P4Xr3ryw4RZ4iPqQ9HuejTgWzA85c1L
 2qR+hMvORTEpCV0TBYbOZcoaUOBvh+FOxYFOcajSo+uMek2vMnyQjsbQfDktpBIKmkUa
 +cOx+Ljt7h1N4BzUatquPy4mLT7VodX2IBFitp+8Xf6cIxC4+7Hmpp+hZxTpDbLLTxqe
 nNsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=oLE7Y5HZPNOSCx7gzcgnu+XUl+njQJZs9Mxh4w2QmXo=;
 b=FCRh2cB9eD/L93l52hd1g8O3q1UL7zBGJWxLiUveIizFecuaqIMtZYytg4K7BJZOWQ
 +iDo+JzpU2s7n43wlPGABlQh3JM5OFP/5t/y8pjrBmc37o+nufaqDhDpiHaRbu+osjuN
 ER1SaiZ5HtireSoaUO2dCpXr13kbmNqMVu80O9EEOqIfq2z/oSCk8o5ZHbq0Hb7n3qVx
 0QRV8d3xGphWLJ31AMHxF8+7HBtpXPTEf9C4BVVSmo4I6NGUoEtQ/m19bm0zsBFyj5qK
 VnBd/fYF55Ih2U6WCRHI3Bje2PYrJO+xv9LA+XlfRkSKYGbzxUIJ2ie0g7XQOxkR0AUh
 H3ng==
X-Gm-Message-State: AOAM532K/xG7O5Vs2uWO8wo7NW0y46cHSlzbqkcRznkBwGyJXa4VSZyV
 fWuzFJ3yvPB8ziEsC2cOhMK3j7A2WbMKEMs8tK4F3cbJWpY=
X-Google-Smtp-Source: ABdhPJyXp+nzbaIiSmLby0Zw5FEzheXhoF/8h/BWUbTR8IZ1W29Kn2o4xa4ZUXgx8e46McSrwIjW19ArAlkHi9ZSO/k=
X-Received: by 2002:a92:1e0a:: with SMTP id e10mr27981318ile.28.1641465353984; 
 Thu, 06 Jan 2022 02:35:53 -0800 (PST)
MIME-Version: 1.0
From: Stevie Lavern <stevie.lavern@gmail.com>
Date: Thu, 6 Jan 2022 11:35:42 +0100
Message-ID: <CADV2EAuttJSjXMc1CHmyJ9ApjOFLJ8CKxa81LLQp3DAYn2A2ZA@mail.gmail.com>
Subject: [PATCH] i386/tcg: generate an illegal op when translating AVX
 instructions
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="00000000000055dfa305d4e76f9b"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::12a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::12a;
 envelope-from=stevie.lavern@gmail.com; helo=mail-il1-x12a.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: eduardo@habkost.net, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, stevie.lavern@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000055dfa305d4e76f9b
Content-Type: text/plain; charset="UTF-8"

The AVX instruction set is not supported by Qemu.
However, some AVX instructions are properly decoded and emulated as their
legacy SSE version.
This patch prevent this by generating an illegal_op instead of a bogus SSE
instruction.

Signed-off-by: Stevie Lavern <stevie.lavern@gmail.com>
---
 target/i386/tcg/translate.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 05f9336c9b..996fce65b2 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -4706,6 +4706,11 @@ static target_ulong disas_insn(DisasContext *s,
CPUState *cpu)
         }
     }

+    if (s->vex_l & 1) {
+        /* If set, registers are 256bits.
+           Fail as AVX extension is not supported. */
+        goto illegal_op;
+    }
     s->prefix = prefixes;
     s->aflag = aflag;
     s->dflag = dflag;
--

--00000000000055dfa305d4e76f9b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">The AVX instruction set is not supported by Qemu.<br>Howev=
er, some AVX instructions are properly decoded and emulated as their<br>leg=
acy SSE version.<br>This patch prevent this by generating an illegal_op ins=
tead of a bogus SSE<br>instruction.<br><br>Signed-off-by: Stevie Lavern &lt=
;<a href=3D"mailto:stevie.lavern@gmail.com">stevie.lavern@gmail.com</a>&gt;=
<br>---<br>=C2=A0target/i386/tcg/translate.c | 5 +++++<br>=C2=A01 file chan=
ged, 5 insertions(+)<br><br>diff --git a/target/i386/tcg/translate.c b/targ=
et/i386/tcg/translate.c<br>index 05f9336c9b..996fce65b2 100644<br>--- a/tar=
get/i386/tcg/translate.c<br>+++ b/target/i386/tcg/translate.c<br>@@ -4706,6=
 +4706,11 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)=
<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>=C2=A0 =C2=A0 =C2=A0}<br>=C2=A0<=
br>+ =C2=A0 =C2=A0if (s-&gt;vex_l &amp; 1) {<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=
=A0/* If set, registers are 256bits.<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 Fail as AVX extension is not supported. */<br>+ =C2=A0 =C2=A0 =C2=A0 =
=C2=A0goto illegal_op;<br>+ =C2=A0 =C2=A0}<br>=C2=A0 =C2=A0 =C2=A0s-&gt;pre=
fix =3D prefixes;<br>=C2=A0 =C2=A0 =C2=A0s-&gt;aflag =3D aflag;<br>=C2=A0 =
=C2=A0 =C2=A0s-&gt;dflag =3D dflag;<br>--=C2=A0<br></div>

--00000000000055dfa305d4e76f9b--

