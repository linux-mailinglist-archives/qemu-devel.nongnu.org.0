Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6BCC4C9568
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 21:07:51 +0100 (CET)
Received: from localhost ([::1]:60028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nP8mk-0007SR-8X
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 15:07:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dmiller423@gmail.com>)
 id 1nP8fm-0003TZ-3N; Tue, 01 Mar 2022 15:00:38 -0500
Received: from [2607:f8b0:4864:20::22c] (port=38450
 helo=mail-oi1-x22c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dmiller423@gmail.com>)
 id 1nP8fk-0008I1-1Z; Tue, 01 Mar 2022 15:00:37 -0500
Received: by mail-oi1-x22c.google.com with SMTP id y7so17237328oih.5;
 Tue, 01 Mar 2022 12:00:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eTRP/daqyh9S74mqHflAExilQIEqgmi7ARYl88Dwtfw=;
 b=PRdl7xraZYtkpLO/5NBSLFpSqxSkeFLZNnrxucYJx8qOBQELCD9NPfUWk7aVNBlt7A
 3PhawtmJkVHJ8tElrHpDeDJEx2VrEgQBqSnUAg/YrEzbauHaKZ6Qmj38UYVCvtBTGlFN
 Pr3GKGLN0Yk50OCG+cpzF+4f8l45lvQuRSOVOEOKOHGbMrhs5hEH1GJ4yAFN8WeZbo+q
 gUn1wXWDuxryNltsTir7Ab84BZM+gEKtaD/HQ4rKBEFVBuKtRBqYWg52AqMyXr5yS8+r
 SWSzeYjJKctD/X8RZH6WAKabMpwuLSGX+Q39Ej/50DeWBHqRJoC9KSdMBAAsT1nK5zIJ
 HkLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eTRP/daqyh9S74mqHflAExilQIEqgmi7ARYl88Dwtfw=;
 b=kFoN+5Mhkh1K36Mx3fckRYw+Seo8ZJwZiK/x7MofBojQj81TjEWsk/Fgt2Po4a60AC
 cJv+G16mSHfVNbmtqAothLhVr3kygR7ixz+cpk1aChvI19CbG/Pq1sFILH53EaHd9/9H
 FAvBulTY5r0HGd7PLpRrB/pq8g6bxZ/77+F5t4JqhRbyHRrG1tIc1XRBaVtKkOTHQk4a
 gM0wS5VBH2xoBW3hdhhPghv4THw8Qgn3XVjxgxpuGfc4Y9sY0IYTJXKPAMMBXKslOmMY
 iEPnt9F/1Pd6FcFqwxdQimkIdJ+4RNQr3NUWC4C+qi8aNtRzgfs7cbG5Z6kev2uHeP+Q
 hjHA==
X-Gm-Message-State: AOAM530oG2XC19Kcu/eqUmurcteJURA+h9r1TGbUmVejRhKZsFaNK032
 0j2Uk9fAx2/dgNMrjC8fRDUKldLEGWxMIFvHW0kDDaJsfWJVw2lf
X-Google-Smtp-Source: ABdhPJwCVkQgNN9qgkDXiL2HpLStnfGAFpgMIFQwP8kx214EigcLSLpecOfrwkRBH+L1K0wkSpjPgQto9ArPs2oAhqs=
X-Received: by 2002:aca:6187:0:b0:2d5:427b:50fd with SMTP id
 v129-20020aca6187000000b002d5427b50fdmr14486167oib.153.1646164834181; Tue, 01
 Mar 2022 12:00:34 -0800 (PST)
MIME-Version: 1.0
References: <20220301191455.19004-1-dmiller423@gmail.com>
In-Reply-To: <20220301191455.19004-1-dmiller423@gmail.com>
From: David Miller <dmiller423@gmail.com>
Date: Tue, 1 Mar 2022 15:00:22 -0500
Message-ID: <CAEgyohXXAsNnXasD+UzE8xWCFTdtKBNyHa5o5jkpXYeshKX-Fw@mail.gmail.com>
Subject: Re: [PATCH] tests/tcg/s390x: Cleanup of mie3 tests.
To: qemu-s390x@nongnu.org, qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000002ee78a05d92d9e91"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::22c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::22c;
 envelope-from=dmiller423@gmail.com; helo=mail-oi1-x22c.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 cohuck@redhat.com, Richard Henderson <richard.henderson@linaro.org>,
 farman@linux.ibm.com, pasic@linux.ibm.com,
 Christian Borntraeger <borntraeger@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000002ee78a05d92d9e91
Content-Type: text/plain; charset="UTF-8"

Please disregard,  v2 sent.

On Tue, Mar 1, 2022 at 2:15 PM David Miller <dmiller423@gmail.com> wrote:

> Adds clobbers and merges remaining separate asm statements.
>
> Signed-off-by: David Miller <dmiller423@gmail.com>
> ---
>  tests/tcg/s390x/mie3-compl.c | 42 +++++++++++++++++++++++-------------
>  tests/tcg/s390x/mie3-mvcrl.c | 12 +++++++----
>  tests/tcg/s390x/mie3-sel.c   | 40 ++++++++++++++++++----------------
>  3 files changed, 57 insertions(+), 37 deletions(-)
>
> diff --git a/tests/tcg/s390x/mie3-compl.c b/tests/tcg/s390x/mie3-compl.c
> index 35649f3b02..85b23a9b7a 100644
> --- a/tests/tcg/s390x/mie3-compl.c
> +++ b/tests/tcg/s390x/mie3-compl.c
> @@ -1,32 +1,44 @@
>  #include <stdint.h>
>
> +
>  #define FbinOp(S, ASM) uint64_t S(uint64_t a, uint64_t b) \
> -{ \
> -    uint64_t res = 0; \
> -    asm ("llihf %[res],801\n" ASM \
> -         : [res]"=&r"(res) : [a]"r"(a), [b]"r"(b) : "cc"); \
> -    return res; \
> +{                       \
> +    uint64_t res = 0;   \
> +asm volatile (          \
> +    "llihf %%r0,801\n"  \
> +    "lg %%r2, %[a]\n"   \
> +    "lg %%r3, %[b]\n"   \
> +    ASM                 \
> +    "stg %%r0, %[res] " \
> +    : [res] "=m" (res)  \
> +    : [a] "m" (a)       \
> +    , [b] "m" (b)       \
> +    : "r0", "r2", "r3"  \
> +);                      \
> +    return res;         \
>  }
>
> +
>  /* AND WITH COMPLEMENT */
> -FbinOp(_ncrk,  ".insn rrf, 0xB9F50000, %[res], %[b], %[a], 0\n")
> -FbinOp(_ncgrk, ".insn rrf, 0xB9E50000, %[res], %[b], %[a], 0\n")
> +FbinOp(_ncrk,  ".insn rrf, 0xB9F50000, %%r0, %%r3, %%r2, 0\n")
> +FbinOp(_ncgrk, ".insn rrf, 0xB9E50000, %%r0, %%r3, %%r2, 0\n")
>
>  /* NAND */
> -FbinOp(_nnrk,  ".insn rrf, 0xB9740000, %[res], %[b], %[a], 0\n")
> -FbinOp(_nngrk, ".insn rrf, 0xB9640000, %[res], %[b], %[a], 0\n")
> +FbinOp(_nnrk,  ".insn rrf, 0xB9740000, %%r0, %%r3, %%r2, 0\n")
> +FbinOp(_nngrk, ".insn rrf, 0xB9640000, %%r0, %%r3, %%r2, 0\n")
>
>  /* NOT XOR */
> -FbinOp(_nxrk,  ".insn rrf, 0xB9770000, %[res], %[b], %[a], 0\n")
> -FbinOp(_nxgrk, ".insn rrf, 0xB9670000, %[res], %[b], %[a], 0\n")
> +FbinOp(_nxrk,  ".insn rrf, 0xB9770000, %%r0, %%r3, %%r2, 0\n")
> +FbinOp(_nxgrk, ".insn rrf, 0xB9670000, %%r0, %%r3, %%r2, 0\n")
>
>  /* NOR */
> -FbinOp(_nork,  ".insn rrf, 0xB9760000, %[res], %[b], %[a], 0\n")
> -FbinOp(_nogrk, ".insn rrf, 0xB9660000, %[res], %[b], %[a], 0\n")
> +FbinOp(_nork,  ".insn rrf, 0xB9760000, %%r0, %%r3, %%r2, 0\n")
> +FbinOp(_nogrk, ".insn rrf, 0xB9660000, %%r0, %%r3, %%r2, 0\n")
>
>  /* OR WITH COMPLEMENT */
> -FbinOp(_ocrk,  ".insn rrf, 0xB9750000, %[res], %[b], %[a], 0\n")
> -FbinOp(_ocgrk, ".insn rrf, 0xB9650000, %[res], %[b], %[a], 0\n")
> +FbinOp(_ocrk,  ".insn rrf, 0xB9750000, %%r0, %%r3, %%r2, 0\n")
> +FbinOp(_ocgrk, ".insn rrf, 0xB9650000, %%r0, %%r3, %%r2, 0\n")
> +
>
>  int main(int argc, char *argv[])
>  {
> diff --git a/tests/tcg/s390x/mie3-mvcrl.c b/tests/tcg/s390x/mie3-mvcrl.c
> index 57b08e48d0..f749dad9c2 100644
> --- a/tests/tcg/s390x/mie3-mvcrl.c
> +++ b/tests/tcg/s390x/mie3-mvcrl.c
> @@ -1,15 +1,17 @@
>  #include <stdint.h>
>  #include <string.h>
>
> +
>  static inline void mvcrl_8(const char *dst, const char *src)
>  {
>      asm volatile (
> -    "llill %%r0, 8\n"
> -    ".insn sse, 0xE50A00000000, 0(%[dst]), 0(%[src])"
> -    : : [dst] "d" (dst), [src] "d" (src)
> -    : "memory");
> +        "llill %%r0, 8\n"
> +        ".insn sse, 0xE50A00000000, 0(%[dst]), 0(%[src])"
> +        : : [dst] "d" (dst), [src] "d" (src)
> +        : "r0", "memory");
>  }
>
> +
>  int main(int argc, char *argv[])
>  {
>      const char *alpha = "abcdefghijklmnop";
> @@ -25,3 +27,5 @@ int main(int argc, char *argv[])
>
>      return strncmp(alpha, tstr, 16ul);
>  }
> +
> +
> diff --git a/tests/tcg/s390x/mie3-sel.c b/tests/tcg/s390x/mie3-sel.c
> index b0c5c9857d..98cf4d40f5 100644
> --- a/tests/tcg/s390x/mie3-sel.c
> +++ b/tests/tcg/s390x/mie3-sel.c
> @@ -1,29 +1,32 @@
>  #include <stdint.h>
>
> +
>  #define Fi3(S, ASM) uint64_t S(uint64_t a, uint64_t b, uint64_t c) \
> -{                            \
> -    uint64_t res = 0;        \
> -    asm (                    \
> -         "lg %%r2, %[a]\n"   \
> -         "lg %%r3, %[b]\n"   \
> -         "lg %%r0, %[c]\n"   \
> -         "ltgr %%r0, %%r0\n" \
> -         ASM                 \
> -         "stg %%r0, %[res] " \
> -         : [res] "=m" (res)  \
> -         : [a] "m" (a),      \
> -           [b] "m" (b),      \
> -           [c] "m" (c)       \
> -         : "r0", "r2",       \
> -           "r3", "r4"        \
> -    );                       \
> -    return res;              \
> +{                       \
> +    uint64_t res = 0;   \
> +asm volatile (          \
> +    "lg %%r2, %[a]\n"   \
> +    "lg %%r3, %[b]\n"   \
> +    "lg %%r0, %[c]\n"   \
> +    "ltgr %%r0, %%r0\n" \
> +    ASM                 \
> +    "stg %%r0, %[res] " \
> +    : [res] "=m" (res)  \
> +    : [a] "m" (a),      \
> +      [b] "m" (b),      \
> +      [c] "m" (c)       \
> +    : "r0", "r2",       \
> +      "r3", "r4"        \
> +);                      \
> +    return res;         \
>  }
>
> +
>  Fi3 (_selre,     ".insn rrf, 0xB9F00000, %%r0, %%r3, %%r2, 8\n")
>  Fi3 (_selgrz,    ".insn rrf, 0xB9E30000, %%r0, %%r3, %%r2, 8\n")
>  Fi3 (_selfhrnz,  ".insn rrf, 0xB9C00000, %%r0, %%r3, %%r2, 7\n")
>
> +
>  int main(int argc, char *argv[])
>  {
>      uint64_t a = ~0, b = ~0, c = ~0;
> @@ -34,5 +37,6 @@ int main(int argc, char *argv[])
>      return (int) (
>          (0xFFFFFFFF00000066ull != a) ||
>          (0x0000F00D00000005ull != b) ||
> -        (0x00000654FFFFFFFFull != c));
> +        (0x00000654FFFFFFFFull != c) );
>  }
> +
> --
> 2.34.1
>
>

--0000000000002ee78a05d92d9e91
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:georgia,=
serif;font-size:small;color:#073763">Please disregard,=C2=A0 v2 sent.</div>=
</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=
On Tue, Mar 1, 2022 at 2:15 PM David Miller &lt;<a href=3D"mailto:dmiller42=
3@gmail.com">dmiller423@gmail.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">Adds clobbers and merges remaining separat=
e asm statements.<br>
<br>
Signed-off-by: David Miller &lt;<a href=3D"mailto:dmiller423@gmail.com" tar=
get=3D"_blank">dmiller423@gmail.com</a>&gt;<br>
---<br>
=C2=A0tests/tcg/s390x/mie3-compl.c | 42 +++++++++++++++++++++++------------=
-<br>
=C2=A0tests/tcg/s390x/mie3-mvcrl.c | 12 +++++++----<br>
=C2=A0tests/tcg/s390x/mie3-sel.c=C2=A0 =C2=A0| 40 ++++++++++++++++++-------=
---------<br>
=C2=A03 files changed, 57 insertions(+), 37 deletions(-)<br>
<br>
diff --git a/tests/tcg/s390x/mie3-compl.c b/tests/tcg/s390x/mie3-compl.c<br=
>
index 35649f3b02..85b23a9b7a 100644<br>
--- a/tests/tcg/s390x/mie3-compl.c<br>
+++ b/tests/tcg/s390x/mie3-compl.c<br>
@@ -1,32 +1,44 @@<br>
=C2=A0#include &lt;stdint.h&gt;<br>
<br>
+<br>
=C2=A0#define FbinOp(S, ASM) uint64_t S(uint64_t a, uint64_t b) \<br>
-{ \<br>
-=C2=A0 =C2=A0 uint64_t res =3D 0; \<br>
-=C2=A0 =C2=A0 asm (&quot;llihf %[res],801\n&quot; ASM \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0: [res]&quot;=3D&amp;r&quot;(res) : [a]&=
quot;r&quot;(a), [b]&quot;r&quot;(b) : &quot;cc&quot;); \<br>
-=C2=A0 =C2=A0 return res; \<br>
+{=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 uint64_t res =3D 0;=C2=A0 =C2=A0\<br>
+asm volatile (=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
+=C2=A0 =C2=A0 &quot;llihf %%r0,801\n&quot;=C2=A0 \<br>
+=C2=A0 =C2=A0 &quot;lg %%r2, %[a]\n&quot;=C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 &quot;lg %%r3, %[b]\n&quot;=C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 ASM=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0\<br>
+=C2=A0 =C2=A0 &quot;stg %%r0, %[res] &quot; \<br>
+=C2=A0 =C2=A0 : [res] &quot;=3Dm&quot; (res)=C2=A0 \<br>
+=C2=A0 =C2=A0 : [a] &quot;m&quot; (a)=C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 , [b] &quot;m&quot; (b)=C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 : &quot;r0&quot;, &quot;r2&quot;, &quot;r3&quot;=C2=A0 \<br>
+);=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 \<br>
+=C2=A0 =C2=A0 return res;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
=C2=A0}<br>
<br>
+<br>
=C2=A0/* AND WITH COMPLEMENT */<br>
-FbinOp(_ncrk,=C2=A0 &quot;.insn rrf, 0xB9F50000, %[res], %[b], %[a], 0\n&q=
uot;)<br>
-FbinOp(_ncgrk, &quot;.insn rrf, 0xB9E50000, %[res], %[b], %[a], 0\n&quot;)=
<br>
+FbinOp(_ncrk,=C2=A0 &quot;.insn rrf, 0xB9F50000, %%r0, %%r3, %%r2, 0\n&quo=
t;)<br>
+FbinOp(_ncgrk, &quot;.insn rrf, 0xB9E50000, %%r0, %%r3, %%r2, 0\n&quot;)<b=
r>
<br>
=C2=A0/* NAND */<br>
-FbinOp(_nnrk,=C2=A0 &quot;.insn rrf, 0xB9740000, %[res], %[b], %[a], 0\n&q=
uot;)<br>
-FbinOp(_nngrk, &quot;.insn rrf, 0xB9640000, %[res], %[b], %[a], 0\n&quot;)=
<br>
+FbinOp(_nnrk,=C2=A0 &quot;.insn rrf, 0xB9740000, %%r0, %%r3, %%r2, 0\n&quo=
t;)<br>
+FbinOp(_nngrk, &quot;.insn rrf, 0xB9640000, %%r0, %%r3, %%r2, 0\n&quot;)<b=
r>
<br>
=C2=A0/* NOT XOR */<br>
-FbinOp(_nxrk,=C2=A0 &quot;.insn rrf, 0xB9770000, %[res], %[b], %[a], 0\n&q=
uot;)<br>
-FbinOp(_nxgrk, &quot;.insn rrf, 0xB9670000, %[res], %[b], %[a], 0\n&quot;)=
<br>
+FbinOp(_nxrk,=C2=A0 &quot;.insn rrf, 0xB9770000, %%r0, %%r3, %%r2, 0\n&quo=
t;)<br>
+FbinOp(_nxgrk, &quot;.insn rrf, 0xB9670000, %%r0, %%r3, %%r2, 0\n&quot;)<b=
r>
<br>
=C2=A0/* NOR */<br>
-FbinOp(_nork,=C2=A0 &quot;.insn rrf, 0xB9760000, %[res], %[b], %[a], 0\n&q=
uot;)<br>
-FbinOp(_nogrk, &quot;.insn rrf, 0xB9660000, %[res], %[b], %[a], 0\n&quot;)=
<br>
+FbinOp(_nork,=C2=A0 &quot;.insn rrf, 0xB9760000, %%r0, %%r3, %%r2, 0\n&quo=
t;)<br>
+FbinOp(_nogrk, &quot;.insn rrf, 0xB9660000, %%r0, %%r3, %%r2, 0\n&quot;)<b=
r>
<br>
=C2=A0/* OR WITH COMPLEMENT */<br>
-FbinOp(_ocrk,=C2=A0 &quot;.insn rrf, 0xB9750000, %[res], %[b], %[a], 0\n&q=
uot;)<br>
-FbinOp(_ocgrk, &quot;.insn rrf, 0xB9650000, %[res], %[b], %[a], 0\n&quot;)=
<br>
+FbinOp(_ocrk,=C2=A0 &quot;.insn rrf, 0xB9750000, %%r0, %%r3, %%r2, 0\n&quo=
t;)<br>
+FbinOp(_ocgrk, &quot;.insn rrf, 0xB9650000, %%r0, %%r3, %%r2, 0\n&quot;)<b=
r>
+<br>
<br>
=C2=A0int main(int argc, char *argv[])<br>
=C2=A0{<br>
diff --git a/tests/tcg/s390x/mie3-mvcrl.c b/tests/tcg/s390x/mie3-mvcrl.c<br=
>
index 57b08e48d0..f749dad9c2 100644<br>
--- a/tests/tcg/s390x/mie3-mvcrl.c<br>
+++ b/tests/tcg/s390x/mie3-mvcrl.c<br>
@@ -1,15 +1,17 @@<br>
=C2=A0#include &lt;stdint.h&gt;<br>
=C2=A0#include &lt;string.h&gt;<br>
<br>
+<br>
=C2=A0static inline void mvcrl_8(const char *dst, const char *src)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0asm volatile (<br>
-=C2=A0 =C2=A0 &quot;llill %%r0, 8\n&quot;<br>
-=C2=A0 =C2=A0 &quot;.insn sse, 0xE50A00000000, 0(%[dst]), 0(%[src])&quot;<=
br>
-=C2=A0 =C2=A0 : : [dst] &quot;d&quot; (dst), [src] &quot;d&quot; (src)<br>
-=C2=A0 =C2=A0 : &quot;memory&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;llill %%r0, 8\n&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;.insn sse, 0xE50A00000000, 0(%[dst]), 0(=
%[src])&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 : : [dst] &quot;d&quot; (dst), [src] &quot;d&q=
uot; (src)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 : &quot;r0&quot;, &quot;memory&quot;);<br>
=C2=A0}<br>
<br>
+<br>
=C2=A0int main(int argc, char *argv[])<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0const char *alpha =3D &quot;abcdefghijklmnop&quot;;<br>
@@ -25,3 +27,5 @@ int main(int argc, char *argv[])<br>
<br>
=C2=A0 =C2=A0 =C2=A0return strncmp(alpha, tstr, 16ul);<br>
=C2=A0}<br>
+<br>
+<br>
diff --git a/tests/tcg/s390x/mie3-sel.c b/tests/tcg/s390x/mie3-sel.c<br>
index b0c5c9857d..98cf4d40f5 100644<br>
--- a/tests/tcg/s390x/mie3-sel.c<br>
+++ b/tests/tcg/s390x/mie3-sel.c<br>
@@ -1,29 +1,32 @@<br>
=C2=A0#include &lt;stdint.h&gt;<br>
<br>
+<br>
=C2=A0#define Fi3(S, ASM) uint64_t S(uint64_t a, uint64_t b, uint64_t c) \<=
br>
-{=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
-=C2=A0 =C2=A0 uint64_t res =3D 0;=C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
-=C2=A0 =C2=A0 asm (=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;lg %%r2, %[a]\n&quot;=C2=A0 =C2=A0=
\<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;lg %%r3, %[b]\n&quot;=C2=A0 =C2=A0=
\<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;lg %%r0, %[c]\n&quot;=C2=A0 =C2=A0=
\<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;ltgr %%r0, %%r0\n&quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ASM=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;stg %%r0, %[res] &quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0: [res] &quot;=3Dm&quot; (res)=C2=A0 \<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0: [a] &quot;m&quot; (a),=C2=A0 =C2=A0 =
=C2=A0 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[b] &quot;m&quot; (b),=C2=A0 =C2=
=A0 =C2=A0 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[c] &quot;m&quot; (c)=C2=A0 =C2=
=A0 =C2=A0 =C2=A0\<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0: &quot;r0&quot;, &quot;r2&quot;,=C2=A0 =
=C2=A0 =C2=A0 =C2=A0\<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;r3&quot;, &quot;r4&quot;=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
-=C2=A0 =C2=A0 );=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
-=C2=A0 =C2=A0 return res;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
\<br>
+{=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 uint64_t res =3D 0;=C2=A0 =C2=A0\<br>
+asm volatile (=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
+=C2=A0 =C2=A0 &quot;lg %%r2, %[a]\n&quot;=C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 &quot;lg %%r3, %[b]\n&quot;=C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 &quot;lg %%r0, %[c]\n&quot;=C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 &quot;ltgr %%r0, %%r0\n&quot; \<br>
+=C2=A0 =C2=A0 ASM=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0\<br>
+=C2=A0 =C2=A0 &quot;stg %%r0, %[res] &quot; \<br>
+=C2=A0 =C2=A0 : [res] &quot;=3Dm&quot; (res)=C2=A0 \<br>
+=C2=A0 =C2=A0 : [a] &quot;m&quot; (a),=C2=A0 =C2=A0 =C2=A0 \<br>
+=C2=A0 =C2=A0 =C2=A0 [b] &quot;m&quot; (b),=C2=A0 =C2=A0 =C2=A0 \<br>
+=C2=A0 =C2=A0 =C2=A0 [c] &quot;m&quot; (c)=C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 : &quot;r0&quot;, &quot;r2&quot;,=C2=A0 =C2=A0 =C2=A0 =C2=A0=
\<br>
+=C2=A0 =C2=A0 =C2=A0 &quot;r3&quot;, &quot;r4&quot;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 \<br>
+);=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 \<br>
+=C2=A0 =C2=A0 return res;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
=C2=A0}<br>
<br>
+<br>
=C2=A0Fi3 (_selre,=C2=A0 =C2=A0 =C2=A0&quot;.insn rrf, 0xB9F00000, %%r0, %%=
r3, %%r2, 8\n&quot;)<br>
=C2=A0Fi3 (_selgrz,=C2=A0 =C2=A0 &quot;.insn rrf, 0xB9E30000, %%r0, %%r3, %=
%r2, 8\n&quot;)<br>
=C2=A0Fi3 (_selfhrnz,=C2=A0 &quot;.insn rrf, 0xB9C00000, %%r0, %%r3, %%r2, =
7\n&quot;)<br>
<br>
+<br>
=C2=A0int main(int argc, char *argv[])<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0uint64_t a =3D ~0, b =3D ~0, c =3D ~0;<br>
@@ -34,5 +37,6 @@ int main(int argc, char *argv[])<br>
=C2=A0 =C2=A0 =C2=A0return (int) (<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(0xFFFFFFFF00000066ull !=3D a) ||<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(0x0000F00D00000005ull !=3D b) ||<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 (0x00000654FFFFFFFFull !=3D c));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 (0x00000654FFFFFFFFull !=3D c) );<br>
=C2=A0}<br>
+<br>
-- <br>
2.34.1<br>
<br>
</blockquote></div>

--0000000000002ee78a05d92d9e91--

