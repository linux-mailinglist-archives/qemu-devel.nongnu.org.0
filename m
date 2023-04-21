Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A56996EB511
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Apr 2023 00:41:07 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppzQs-0002C8-Dn; Fri, 21 Apr 2023 18:40:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kariem.taha2.7@gmail.com>)
 id 1ppzQl-00029e-E6
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 18:40:42 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kariem.taha2.7@gmail.com>)
 id 1ppzQh-0000jK-GK
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 18:40:38 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 98e67ed59e1d1-244a5ccf13eso1842775a91.2
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 15:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682116833; x=1684708833;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=a92KYxwX7ZPg3cJhVFbagfAQm8HDzHwFlcMzHpBaHEM=;
 b=IkoEVPsQvfSJggBaQSadlr3aQgFikMnwRkVvQUi9IT/ki7Ue8Icqb4UGmQ+23nMhHd
 Re3Mk6+dZyDYiDpwIAs1IHRu2RJmwGXEvhXFhj1qWAyjRQxZC7gC99J4xa3muowhNl59
 nIzv9KfijKueCTElvPBjewQ2BFyLwkmQ6OJxg2Mk6WOU4y1+TGRT5j0kF2euOE7bsBNA
 UiC7Pyffz7SYVfER7D3VuIYIlSboZHUABdmEPvA9W0mgjSzHsi9ELFtpGmBOAIisYI7W
 LHubYjudiF0OP7ikH/GDD0ajmrqtJGTFWeS4K6yVvUcNXhDbvMtBLkOautgkBIY6Ywin
 Vn3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682116833; x=1684708833;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=a92KYxwX7ZPg3cJhVFbagfAQm8HDzHwFlcMzHpBaHEM=;
 b=FMX8Q69i1GlpbenVQPJAm0hg5JZTIdEtBiLLqE/f7SIbJj+9+jI5ypB3FJkusdf/11
 aiQsntSnkOeex6SRvBt61Arjaue/a4pvrE2EcJz9go7FG+IRD9/X4+dQSrdaIQPKykiU
 GqosRxSaLZ3UrMpIbUim4YQryW3mXoSLWFRd5kqnEL2xXPMJQQGMvSXBn4ZQ57spfBHp
 lONdGMcdqCEOz9gQw0HP5V+oD9MKZfHgeXxILXgOlAsEzJAFMGl+1kxiZoWlx/cxUmP0
 ld3ycStv+nVBIz7WL2ygnFKgGq0mPEasLR2apj9S8jMs+JvR7PpD+yxXRVQrQVyz5VP3
 8Z/A==
X-Gm-Message-State: AAQBX9ewkTFsuSEeUWmQDfvgCDnU236E59HpXi05Eb/RjyCdy7bX9AE1
 1bwUaz9CLgVovk0hlz/z/3tApen1s8z6k6ms5dI=
X-Google-Smtp-Source: AKy350Z+1ePGWVPLk1ss3FeUW8MAsvRNrnKyDD6uQobsnChN9nafLJFo/U1aj59kB8g327t5uMaty+PwKwRv7aXJKLs=
X-Received: by 2002:a17:90a:cf8b:b0:23d:15d8:1bc3 with SMTP id
 i11-20020a17090acf8b00b0023d15d81bc3mr6281260pju.39.1682116832527; Fri, 21
 Apr 2023 15:40:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230421052255.5603-1-krm.taha@outlook.com>
 <20230421052255.5603-2-krm.taha@outlook.com>
 <ZEI4jQvHfU+JGFH9@redhat.com>
 <CAHNti2dQnbmAO5hTyb6krd8tSMCqXDp80BEcd0ZUHXmk0LZS-w@mail.gmail.com>
 <87sfct9mm6.fsf@linaro.org>
In-Reply-To: <87sfct9mm6.fsf@linaro.org>
From: Karim Taha <kariem.taha2.7@gmail.com>
Date: Sat, 22 Apr 2023 00:40:03 +0200
Message-ID: <CAHNti2d5JH9EupsOLs0e2o-2ifeEumR5XUqPkbG1u2x6QtOCqg@mail.gmail.com>
Subject: Re: [PATCH 01/11] Signed-off-by: Karim Taha <kariem.taha2.7@gmail.com>
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000460a9b05f9e05864"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=kariem.taha2.7@gmail.com; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--000000000000460a9b05f9e05864
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

It was sent with git-publish, what do you mean by pointing to a branch?

On Fri, Apr 21, 2023 at 7:22=E2=80=AFPM Alex Benn=C3=A9e <alex.bennee@linar=
o.org> wrote:

>
> Karim Taha <kariem.taha2.7@gmail.com> writes:
>
> > On Fri, Apr 21, 2023 at 9:17=E2=80=AFAM Daniel P. Berrang=C3=A9 <berran=
ge@redhat.com>
> wrote:
> >
> >  On Fri, Apr 21, 2023 at 07:22:45AM +0200, Karim Taha wrote:
> >  > From: Warner Losh <imp@bsdimp.com>
> >  >
> >  > Allow guest_base to be initialized on 64-bit hosts, the initial valu=
e
> is used by g2h_untagged function
> >  defined in include/exec/cpu_ldst.h
> >
> >  This commit message is all incorrectly structured I'm afraid.
> >
> >  There needs to a short 1 line summary, then a blank line,
> >  then the full commit description text, then a blank line,
> >  then the Signed-off-by tag(s).
> >
> >  Also if you're sending work done by Warner (as the From
> >  tag suggests), then we would expect to see Warner's own
> >  Signed-off-by tag, in addition to your own Signed-off-by.
> <snip>
> >
> > Alright, thanks for the commit formatting tips, I resent the patch
> series, with my signed off by tag and the
> > author signed off by tags as well.
>
> Hmm something has gone wrong. Was this sent with a plain git-send-email
> or using a tool like git-publish?
>
> Can you point to a branch?
>
> >
> > Best regards,
> > Karim
>
>
> --
> Alex Benn=C3=A9e
> Virtualisation Tech Lead @ Linaro
>

--000000000000460a9b05f9e05864
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">It was sent with git-publish, what do you mean by pointing=
 to a branch?<br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" clas=
s=3D"gmail_attr">On Fri, Apr 21, 2023 at 7:22=E2=80=AFPM Alex Benn=C3=A9e &=
lt;<a href=3D"mailto:alex.bennee@linaro.org">alex.bennee@linaro.org</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
Karim Taha &lt;<a href=3D"mailto:kariem.taha2.7@gmail.com" target=3D"_blank=
">kariem.taha2.7@gmail.com</a>&gt; writes:<br>
<br>
&gt; On Fri, Apr 21, 2023 at 9:17=E2=80=AFAM Daniel P. Berrang=C3=A9 &lt;<a=
 href=3D"mailto:berrange@redhat.com" target=3D"_blank">berrange@redhat.com<=
/a>&gt; wrote:<br>
&gt;<br>
&gt;=C2=A0 On Fri, Apr 21, 2023 at 07:22:45AM +0200, Karim Taha wrote:<br>
&gt;=C2=A0 &gt; From: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.com" tar=
get=3D"_blank">imp@bsdimp.com</a>&gt;<br>
&gt;=C2=A0 &gt; <br>
&gt;=C2=A0 &gt; Allow guest_base to be initialized on 64-bit hosts, the ini=
tial value is used by g2h_untagged function<br>
&gt;=C2=A0 defined in include/exec/cpu_ldst.h<br>
&gt;<br>
&gt;=C2=A0 This commit message is all incorrectly structured I&#39;m afraid=
.<br>
&gt;<br>
&gt;=C2=A0 There needs to a short 1 line summary, then a blank line,<br>
&gt;=C2=A0 then the full commit description text, then a blank line,<br>
&gt;=C2=A0 then the Signed-off-by tag(s).<br>
&gt;<br>
&gt;=C2=A0 Also if you&#39;re sending work done by Warner (as the From<br>
&gt;=C2=A0 tag suggests), then we would expect to see Warner&#39;s own<br>
&gt;=C2=A0 Signed-off-by tag, in addition to your own Signed-off-by.<br>
&lt;snip&gt;<br>
&gt;<br>
&gt; Alright, thanks for the commit formatting tips, I resent the patch ser=
ies, with my signed off by tag and the<br>
&gt; author signed off by tags as well.<br>
<br>
Hmm something has gone wrong. Was this sent with a plain git-send-email<br>
or using a tool like git-publish?<br>
<br>
Can you point to a branch?<br>
<br>
&gt;<br>
&gt; Best regards,<br>
&gt; Karim<br>
<br>
<br>
-- <br>
Alex Benn=C3=A9e<br>
Virtualisation Tech Lead @ Linaro<br>
</blockquote></div>

--000000000000460a9b05f9e05864--

