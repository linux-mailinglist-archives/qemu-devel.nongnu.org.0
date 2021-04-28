Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E3F36D7E2
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 15:02:46 +0200 (CEST)
Received: from localhost ([::1]:60544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbjq0-0005kY-JA
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 09:02:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.montesel.revng@gmail.com>)
 id 1lbhcu-0000oO-LM
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 06:41:04 -0400
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31]:36642)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.montesel.revng@gmail.com>)
 id 1lbhcs-0001JL-QW
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 06:41:04 -0400
Received: by mail-yb1-xb31.google.com with SMTP id t94so20019504ybi.3
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 03:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ORjwMFQcKcBoCagVHz+qegsxCqDGel6Rd1J1Urh9NYE=;
 b=ONfMcLrHIonOQPknP0Ls4nnuCFlkIPyzlwlC9AhJp7KeVWa2nz6RtZqkkyfJtMMV5O
 rmEn2icH9R5YgU/j+LYRP3H2xBzViHre+KljIjqzqufL5lx8cYKvVZL1bWHResnw3q0o
 jsWgHhr50I10WOze2X9Pq4NzW1nFIiW54lHFTrV8ELxwdSWmXNxqUpbwdKnuTxDBNnc1
 mPxeAU8tZhZJFQd+CRiiW2JvOYRY7tIv0DUthlW0OaZlQTumoYVHL6R7EZGXitzAi4uX
 sOTihUGidBSbbQWkwgly5s1aEyl7g7cogtZtoSmSbkBF8ZUiG5j4eVW/W2f5pBqKsB2Z
 vm4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ORjwMFQcKcBoCagVHz+qegsxCqDGel6Rd1J1Urh9NYE=;
 b=HqQ7Wn1ed7Rr9kcPDFJG274bW8M9g/bi6OrfqM+Fio9wtzLmjPOvfIdmvhIRDTd2M9
 OQEfjQ84E/Ge9yCTuD1RbNMAY6Jsa2jHQcfQeJQkHsiw4JwVoyY46qORQy289gJUQUzS
 ditvCx1HUUl76nhTwFLFUTwXS81Aqej69FcL4+LKCYSGVlqujeNZN8UDl4cHUk2+hRoI
 uvVbuC0Um9Vk5TbhDBKF1L++AX411EwAn2VMzE838lc2r4DkGxrBisnpx15Thv5PNB3h
 27DbnHVvJ8k7BH9FcYD+6DwB1gB1zoNi2SQ5pbYFnnHTbVCAe/TT8xGYTdpa8EYld+YN
 cX6A==
X-Gm-Message-State: AOAM531l9QrbK8e490RUfLc/8EjM6YQKAVMZ16qX2aTv2ypRI4BjAJPM
 swcnY1eUXU5+wx85is4IxxUrNWl2bMkL+k3o28o=
X-Google-Smtp-Source: ABdhPJxl0kvUPv7ejPEoCyoGiMBHHQFWo3GHf97NTBsKZiAo1tpjSQ+gx7GBoKgP0t6M5NFvFa9kEzch3fGWd38Pddg=
X-Received: by 2002:a05:6902:703:: with SMTP id
 k3mr35206032ybt.382.1619606457981; 
 Wed, 28 Apr 2021 03:40:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210330143750.3037824-1-ale.qemu@rev.ng>
 <20210330143750.3037824-10-ale.qemu@rev.ng>
 <BYAPR02MB488623DCA2A3E942BE196E4EDE419@BYAPR02MB4886.namprd02.prod.outlook.com>
In-Reply-To: <BYAPR02MB488623DCA2A3E942BE196E4EDE419@BYAPR02MB4886.namprd02.prod.outlook.com>
From: Paolo Montesel <paolo.montesel.revng@gmail.com>
Date: Wed, 28 Apr 2021 12:40:47 +0200
Message-ID: <CANnx7NPRY98VDqD7EXd6tWT3Nc5Z42pgq6oLRMATRtCc5NoxRA@mail.gmail.com>
Subject: Re: [PATCH v3 09/12] target/hexagon: import lexer for idef-parser
To: Taylor Simpson <tsimpson@quicinc.com>
Content-Type: multipart/alternative; boundary="0000000000009a9daf05c106033f"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=paolo.montesel.revng@gmail.com; helo=mail-yb1-xb31.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 28 Apr 2021 08:57:40 -0400
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
Cc: Alessandro Di Federico <ale@rev.ng>, Brian Cain <bcain@quicinc.com>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Alessandro Di Federico <ale.qemu@rev.ng>, "nizzo@rev.ng" <nizzo@rev.ng>,
 "philmd@redhat.com" <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000009a9daf05c106033f
Content-Type: text/plain; charset="UTF-8"

>
> > +"fLSBNEW(P"{LOWER_PRE}"N)" { yylval->rvalue.type = PREDICATE;
> > +                           yylval->rvalue.pre.id = yytext[9];
> > +                           yylval->rvalue.bit_width = 32;
> > +                           yylval->rvalue.is_dotnew = true;
> > +                           return PRE; }
> > +"fLSBNEW0"               { yylval->rvalue.type = PREDICATE;
> > +                           yylval->rvalue.pre.id = '0';
> > +                           yylval->rvalue.bit_width = 32;
> > +                           yylval->rvalue.is_dotnew = true;
> > +                           return PRE; }
> > +"fLSBNEW1"               { yylval->rvalue.type = PREDICATE;
> > +                           yylval->rvalue.pre.id = '1';
> > +                           yylval->rvalue.bit_width = 32;
> > +                           yylval->rvalue.is_dotnew = true;
> > +                           return PRE; }
> > +"fLSBNEW1NOT"            { yylval->rvalue.type = PREDICATE;
> > +                           yylval->rvalue.pre.id = '1';
> > +                           yylval->rvalue.bit_width = 32;
> > +                           yylval->rvalue.is_dotnew = true;
> > +                           return PRE; }
>
> These represent the least significant bit of the operand.  Perhaps you
> should set the bit_width to 1?  Or do tcg_gen_andi_tl(..., 1)?
>

What I ended up doing is reworking how LSB* are handled.
Now there's a special token `LSBNEW` that's implemented as a `tcg_gen_andi`
in the parser, and it's used only for `fLSBNEW`.
The other cases are expanded in the preprocessing part like this:

/* Least significant bit operations */
#define fLSBNEW0 fLSBNEW(P0N)
#define fLSBNEW1 fLSBNEW(P1N)
#define fLSBOLDNOT(VAL) fGETBIT(0, ~VAL)
#define fLSBNEWNOT(PRED) (fLSBNEW(~PRED))
#define fLSBNEW0NOT fLSBNEW(~P0N)
#define fLSBNEW1NOT fLSBNEW(~P1N)

Let me know what you think.

~Paolo

--0000000000009a9daf05c106033f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_quot=
e"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; +&quot;fLSBNEW(P&quot;{LOWER_PRE}&quot;N)&quot; { yylval-&gt;rvalue.ty=
pe =3D PREDICATE;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0yylval-&gt;<a href=3D"http://rvalue.pre.id" rel=
=3D"noreferrer" target=3D"_blank">rvalue.pre.id</a> =3D yytext[9];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0yylval-&gt;rvalue.bit_width =3D 32;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0yylval-&gt;rvalue.is_dotnew =3D true;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0return PRE; }<br>
&gt; +&quot;fLSBNEW0&quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0{ yylval-&gt;rvalue.type =3D PREDICATE;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0yylval-&gt;<a href=3D"http://rvalue.pre.id" rel=
=3D"noreferrer" target=3D"_blank">rvalue.pre.id</a> =3D &#39;0&#39;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0yylval-&gt;rvalue.bit_width =3D 32;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0yylval-&gt;rvalue.is_dotnew =3D true;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0return PRE; }<br>
&gt; +&quot;fLSBNEW1&quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0{ yylval-&gt;rvalue.type =3D PREDICATE;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0yylval-&gt;<a href=3D"http://rvalue.pre.id" rel=
=3D"noreferrer" target=3D"_blank">rvalue.pre.id</a> =3D &#39;1&#39;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0yylval-&gt;rvalue.bit_width =3D 32;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0yylval-&gt;rvalue.is_dotnew =3D true;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0return PRE; }<br>
&gt; +&quot;fLSBNEW1NOT&quot;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 { yy=
lval-&gt;rvalue.type =3D PREDICATE;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0yylval-&gt;<a href=3D"http://rvalue.pre.id" rel=
=3D"noreferrer" target=3D"_blank">rvalue.pre.id</a> =3D &#39;1&#39;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0yylval-&gt;rvalue.bit_width =3D 32;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0yylval-&gt;rvalue.is_dotnew =3D true;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0return PRE; }<br>
<br>
These represent the least significant bit of the operand.=C2=A0 Perhaps you=
 should set the bit_width to 1?=C2=A0 Or do tcg_gen_andi_tl(..., 1)?<br></b=
lockquote><div><br></div><div>What I ended up doing is reworking how LSB* a=
re handled.</div><div>Now there&#39;s a special token `LSBNEW` that&#39;s i=
mplemented as a `tcg_gen_andi` in the parser, and it&#39;s used only for `f=
LSBNEW`.</div><div>The other cases are expanded in the preprocessing part l=
ike this:</div><div><br></div><div>/* Least significant bit operations */<b=
r>#define fLSBNEW0 fLSBNEW(P0N)<br>#define fLSBNEW1 fLSBNEW(P1N)<br>#define=
 fLSBOLDNOT(VAL) fGETBIT(0, ~VAL)<br>#define fLSBNEWNOT(PRED) (fLSBNEW(~PRE=
D))<br>#define fLSBNEW0NOT fLSBNEW(~P0N)<br>#define fLSBNEW1NOT fLSBNEW(~P1=
N)</div><div><br></div><div>Let me know what you think.</div><div><br></div=
><div>~Paolo<br></div></div></div></div></div>

--0000000000009a9daf05c106033f--

