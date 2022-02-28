Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 086974C77E3
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 19:34:16 +0100 (CET)
Received: from localhost ([::1]:44504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOkqd-0002Y0-5F
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 13:34:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dmiller423@gmail.com>)
 id 1nOkoN-0001KY-66; Mon, 28 Feb 2022 13:31:55 -0500
Received: from [2607:f8b0:4864:20::234] (port=45785
 helo=mail-oi1-x234.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dmiller423@gmail.com>)
 id 1nOkoL-0002ka-CI; Mon, 28 Feb 2022 13:31:54 -0500
Received: by mail-oi1-x234.google.com with SMTP id 12so13981909oix.12;
 Mon, 28 Feb 2022 10:31:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ni8WGRMaTsCvFNJ5JRh/QfJhSzdPi+QFtwIVgV2n2iM=;
 b=IB2gq1rQm609sbhXnxRJ71C97S+MeYtcSo2o7tL5vH26saLikKFeXdLVDU5WHVtmkO
 TIM/Bo0DxhdrI8yEcrBNIWdAzVdwSEooDHGfQ4PUBG0EqLOtZzOu+jjAb1p+0kphLqQU
 dqAKcqdRaA7kRUUuOgweT9a9lU9YRD9aap/XpUuFx2rYyBDN+HNSLGTUacuGFyPz/OR7
 ufuUDaDXohMBZcUg61sPIvrR18dZHFrdd/6nvtU3z3oQ+Jvfu3UtOgcTLABWfBMg9zKU
 UaN6k6Hvugf4MW6mSc4n2R+F+VSNw6bu5vHK2F0kWxWTEwtGQklc5WueXi/hz0BI8lI6
 LSRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ni8WGRMaTsCvFNJ5JRh/QfJhSzdPi+QFtwIVgV2n2iM=;
 b=GJ+Ziooh5oxY5wP5fguzJ7CcXJMg/4YPKWkC3Pok6aBs+HM5upMXZ1k2VO/K1DNNJF
 hddFC+dULOy+JW43tq5qacK392Jy9rIXxXzFbNr3XVx3qn+tM1gi009AVYUC2JL+8iJ+
 7yptPiHB1nHGxcMM5zt2YkQY3nx4wcXCnI6jIKQXWfAjh1PjhwUVTBj0eqFk4zZIFi+l
 qHubmSg1xdwQMclVfU4GR4h+dt2XyPWa7VETqKxPf0l00r3VjxFLYpygZngrlx0duv0i
 DvmJKq+uLjGTSDp4WP+2OcaXmumezRwWrPYdVgp1ZkxJqhqxtNP4Smcmy5fclAKDxsuB
 FqdQ==
X-Gm-Message-State: AOAM532HXLJ3VTHHEy9FArbTmK7GM6dlIYExgjn3KD2a/ipDqKuUP8f2
 sddN0gGKTtxPayBwzoG7/ooxE1YGmbGITJ/8icQ=
X-Google-Smtp-Source: ABdhPJxulTm6do/2wnbkH/4O43fuCsR+/FQkQyQ0qYZfhHfrKvEVzru4agFJiciG/L0uMFqzBU8/YCmkim0IUnBjoqE=
X-Received: by 2002:a05:6808:3091:b0:2d4:c180:d586 with SMTP id
 bl17-20020a056808309100b002d4c180d586mr9715270oib.120.1646073109929; Mon, 28
 Feb 2022 10:31:49 -0800 (PST)
MIME-Version: 1.0
References: <20220223223117.66660-1-dmiller423@gmail.com>
 <20220223223117.66660-4-dmiller423@gmail.com>
 <382e2a24-6483-ba0d-08d3-ced00173dc1a@linaro.org>
 <3853fa79-4578-be7b-4a2f-5b31cdd5c4c7@redhat.com>
 <9aeda35f-1bce-d8eb-9dba-4993dc6a605d@linaro.org>
In-Reply-To: <9aeda35f-1bce-d8eb-9dba-4993dc6a605d@linaro.org>
From: David Miller <dmiller423@gmail.com>
Date: Mon, 28 Feb 2022 13:31:37 -0500
Message-ID: <CAEgyohW5KcOLYcYHP=oD7+6Bba6ueXv8bh136jFczwFky6BUFQ@mail.gmail.com>
Subject: Re: [PATCH v7 3/4] tests/tcg/s390x: Tests for
 Miscellaneous-Instruction-Extensions Facility 3
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000fddfef05d91842b9"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::234
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::234;
 envelope-from=dmiller423@gmail.com; helo=mail-oi1-x234.google.com
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
 farman@linux.ibm.com, cohuck@redhat.com, qemu-devel@nongnu.org,
 pasic@linux.ibm.com, qemu-s390x@nongnu.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000fddfef05d91842b9
Content-Type: text/plain; charset="UTF-8"

Had it on my TODO list for this morning, thank you.

On Mon, Feb 28, 2022 at 12:59 PM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 2/28/22 00:14, Thomas Huth wrote:
> > Full patch can be seen here:
> >
> > https://gitlab.com/thuth/qemu/-/commit/38af118ea2fef0c473
>
>
> > static inline void mvcrl_8(const char *dst, const char *src)
> > {
> >     asm volatile (
> >     "llill %%r0, 8\n"
> >     ".insn sse, 0xE50A00000000, 0(%[dst]), 0(%[src])"
> >     : : [dst] "d" (dst), [src] "d" (src)
> >     : "memory");
> > }
>
> Need clobber of r0 here.
>
> > #define Fi3(S, ASM) uint64_t S(uint64_t a, uint64_t b, uint64_t c) \
> > {                            \
> >     uint64_t res = 0;        \
> >     asm (                    \
> >          "lg %%r2, %[a]\n"   \
> >          "lg %%r3, %[b]\n"   \
> >          "lg %%r0, %[c]\n"   \
> >          "ltgr %%r0, %%r0\n" \
> >          ASM                 \
> >          "stg %%r0, %[res] " \
> >          : [res] "=m" (res)  \
> >          : [a] "m" (a),      \
> >            [b] "m" (b),      \
> >            [c] "m" (c)       \
> >          : "r0", "r2",       \
> >            "r3", "r4"        \
> >     );                       \
> >     return res;              \
> > }
> >
> > Fi3 (_selre,     ".insn rrf, 0xB9F00000, %%r0, %%r3, %%r2, 8\n")
> > Fi3 (_selgrz,    ".insn rrf, 0xB9E30000, %%r0, %%r3, %%r2, 8\n")
> > Fi3 (_selfhrnz,  ".insn rrf, 0xB9C00000, %%r0, %%r3, %%r2, 7\n")
>
> This isn't actively broken, but could use the same treatment as NCRK et al:
>
> #define Fi3(S, ASM) uint64_t S(uint64_t a, uint64_t b, uint64_t c) \
> {                            \
>      uint64_t res;            \
>      asm("ltgr %[c], %[c]\n\t" ASM
>          : [res] "=&r" (res)
>          : [a] "r" (a), [b] "r" (b), [c] "r" (c)
>          : "cc");
>      return res;
> }
>
> Fi3(_selre,   ".insn rrf, 0xB9F00000, %[res], %[a], %[b], 8")
>
> etc.
>
>
> r~
>

--000000000000fddfef05d91842b9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:georgia,=
serif;font-size:small;color:#073763">Had it on my TODO list for this mornin=
g, thank you.</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cl=
ass=3D"gmail_attr">On Mon, Feb 28, 2022 at 12:59 PM Richard Henderson &lt;<=
a href=3D"mailto:richard.henderson@linaro.org">richard.henderson@linaro.org=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
On 2/28/22 00:14, Thomas Huth wrote:<br>
&gt; Full patch can be seen here:<br>
&gt; <br>
&gt; <a href=3D"https://gitlab.com/thuth/qemu/-/commit/38af118ea2fef0c473" =
rel=3D"noreferrer" target=3D"_blank">https://gitlab.com/thuth/qemu/-/commit=
/38af118ea2fef0c473</a><br>
<br>
<br>
&gt; static inline void mvcrl_8(const char *dst, const char *src)<br>
&gt; {<br>
&gt;=C2=A0 =C2=A0 =C2=A0asm volatile (<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;llill %%r0, 8\n&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;.insn sse, 0xE50A00000000, 0(%[dst]), 0(%[src=
])&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0: : [dst] &quot;d&quot; (dst), [src] &quot;d&quot; =
(src)<br>
&gt;=C2=A0 =C2=A0 =C2=A0: &quot;memory&quot;);<br>
&gt; }<br>
<br>
Need clobber of r0 here.<br>
<br>
&gt; #define Fi3(S, ASM) uint64_t S(uint64_t a, uint64_t b, uint64_t c) \<b=
r>
&gt; {=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0uint64_t res =3D 0;=C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0asm (=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;lg %%r2, %[a]\n&quot;=C2=A0 =
=C2=A0\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;lg %%r3, %[b]\n&quot;=C2=A0 =
=C2=A0\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;lg %%r0, %[c]\n&quot;=C2=A0 =
=C2=A0\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;ltgr %%r0, %%r0\n&quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ASM=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;stg %%r0, %[res] &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 : [res] &quot;=3Dm&quot; (res)=C2=A0=
 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 : [a] &quot;m&quot; (a),=C2=A0 =C2=
=A0 =C2=A0 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [b] &quot;m&quot; (b),=C2=A0 =
=C2=A0 =C2=A0 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [c] &quot;m&quot; (c)=C2=A0 =
=C2=A0 =C2=A0 =C2=A0\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 : &quot;r0&quot;, &quot;r2&quot;,=C2=
=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;r3&quot;, &quot;r4&quot=
;=C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0);=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;=C2=A0 =C2=A0 =C2=A0return res;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 \<br>
&gt; }<br>
&gt; <br>
&gt; Fi3 (_selre,=C2=A0 =C2=A0 =C2=A0&quot;.insn rrf, 0xB9F00000, %%r0, %%r=
3, %%r2, 8\n&quot;)<br>
&gt; Fi3 (_selgrz,=C2=A0 =C2=A0 &quot;.insn rrf, 0xB9E30000, %%r0, %%r3, %%=
r2, 8\n&quot;)<br>
&gt; Fi3 (_selfhrnz,=C2=A0 &quot;.insn rrf, 0xB9C00000, %%r0, %%r3, %%r2, 7=
\n&quot;)<br>
<br>
This isn&#39;t actively broken, but could use the same treatment as NCRK et=
 al:<br>
<br>
#define Fi3(S, ASM) uint64_t S(uint64_t a, uint64_t b, uint64_t c) \<br>
{=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
=C2=A0 =C2=A0 =C2=A0uint64_t res;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
\<br>
=C2=A0 =C2=A0 =C2=A0asm(&quot;ltgr %[c], %[c]\n\t&quot; ASM<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0: [res] &quot;=3D&amp;r&quot; (res)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0: [a] &quot;r&quot; (a), [b] &quot;r&quot=
; (b), [c] &quot;r&quot; (c)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0: &quot;cc&quot;);<br>
=C2=A0 =C2=A0 =C2=A0return res;<br>
}<br>
<br>
Fi3(_selre,=C2=A0 =C2=A0&quot;.insn rrf, 0xB9F00000, %[res], %[a], %[b], 8&=
quot;)<br>
<br>
etc.<br>
<br>
<br>
r~<br>
</blockquote></div>

--000000000000fddfef05d91842b9--

