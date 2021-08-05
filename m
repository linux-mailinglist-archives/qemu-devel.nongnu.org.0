Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 836743E145F
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 14:03:22 +0200 (CEST)
Received: from localhost ([::1]:51244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBc5o-0003X2-QG
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 08:03:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mBc4w-0002pf-BE
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 08:02:26 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:42582)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mBc4u-0007fF-Qv
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 08:02:26 -0400
Received: by mail-ej1-x634.google.com with SMTP id e19so9119948ejs.9
 for <qemu-devel@nongnu.org>; Thu, 05 Aug 2021 05:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=I3gNBJN+ljdU8rGqqbqeWNnD4bpTBkKglsbHJNvuang=;
 b=YxJRwuYkyqDq/OTgU7TauKUjIt8MidqdewmmV0rpDV8bb8tA5wXXxg5KBltaZXIO7J
 XPh5WRokzIOF7P3fqQViaoVFo7btKXEJ8X3dnhp57cHG0EjqtB8NN796eCf8pWnpYnqr
 TMfXhK9qrdlpd9/d0cqrztJHHPegRdVI+6bqp38N2cGB+HvcaI+Ow4G0Q4yt/4DYVoQ+
 07PL4AUyFo100B/qqOTNrRgdtZIT/fKcBbyIBNApoLXXuF7pvrDK945Tlwh6ajJ3vmD2
 fiwfS2nnZcbxt+jqibyKBtSuloDiSUAepPyjUiqTnzosLSn+M0aWQT/xTBdLZb9VdhBM
 pMtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=I3gNBJN+ljdU8rGqqbqeWNnD4bpTBkKglsbHJNvuang=;
 b=IKhoD7ckCMorsNi04yyiJCkDTW//b2XIgIHb5Z/tmVeUj5e6sTEqKGZFDAyvoShC0Q
 Z8sNFRhGZJX6pvnlD9BAnepBR/npYF9/zHrCQSLOHPrjJjpXirvW2DD4Ec07IoCOYX/z
 mStIArYGS9uXdhaTdx38e13GuqDxL+eJho8PRMhbDJr0w5jpJ3Cd+Kw+ahe2Oan0FxKz
 UttSoUuEOf6Y68ec5zHIH7aIONQHEGrq2+zaD79vu5aGhF6zE4JxkAGlZH3/xpBcqRmO
 numSHgG4k/gCUpPoNSAFQxVBTwIrdyoEFWuW9qzqDVisb5fljThdeDlVhcpiNbDDF5Po
 jTKA==
X-Gm-Message-State: AOAM531KueJ9rV7MpQpD0ValVwe3pd1z05hf5haHJBfbNjUVSQjy5q6H
 lJAeVcQBUZanE50FMA8jqT8dN4Gcehl3g8yMK/A=
X-Google-Smtp-Source: ABdhPJwL33R7tbr84PRv4qH3UCh5dCld1276nfFLO/G3IOVK4fV39zggP2CvzLs3IJH/pXuXGclH53tmzKWtedTk3Iw=
X-Received: by 2002:a17:906:70a:: with SMTP id
 y10mr4376633ejb.381.1628164942100; 
 Thu, 05 Aug 2021 05:02:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210804083105.97531-1-marcandre.lureau@redhat.com>
 <20210804083105.97531-6-marcandre.lureau@redhat.com>
 <87im0k9kct.fsf@dusky.pond.sub.org>
In-Reply-To: <87im0k9kct.fsf@dusky.pond.sub.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 5 Aug 2021 16:02:09 +0400
Message-ID: <CAJ+F1CKRwWQn9njZ+iKifCHsEHJKTxFV4T+sAh88NT0SiQL=2g@mail.gmail.com>
Subject: Re: [PATCH v7 05/10] qapidoc: introduce QAPISchemaIfCond.docgen()
To: Markus Armbruster <armbru@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000027c4305c8ceb1e0"
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: John Snow <jsnow@redhat.com>, QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000027c4305c8ceb1e0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Thu, Aug 5, 2021 at 3:55 PM Markus Armbruster <armbru@redhat.com> wrote:

> marcandre.lureau@redhat.com writes:
>
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > Instead of building the condition documentation from a list of string,
> > use the result generated from QAPISchemaIfCond.docgen().
> >
> > This changes the generated documentation from:
> > - COND1, COND2... (where COND1, COND2 are Literal nodes, and ',' is Tex=
t)
> > to:
> > - COND1 and COND2 (the whole string as a Literal node)
> >
> > This will allow us to generate more complex conditions in the following
> > patches, such as "(COND1 and COND2) or COND3".
> >
> > Adding back the differentiated formatting is left to the wish list.
>
> What about a TODO comment?   you suggest a suitable spot?
>

I don't think this matters much, it will never be a user-friendly text. But
we can leave a comment in the docgen() function to say that the sphinx
build could benefit from a formatted string.



> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000027c4305c8ceb1e0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Aug 5, 2021 at 3:55 PM Mark=
us Armbruster &lt;<a href=3D"mailto:armbru@redhat.com">armbru@redhat.com</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><a =
href=3D"mailto:marcandre.lureau@redhat.com" target=3D"_blank">marcandre.lur=
eau@redhat.com</a> writes:<br>
<br>
&gt; From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@re=
dhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
&gt;<br>
&gt; Instead of building the condition documentation from a list of string,=
<br>
&gt; use the result generated from QAPISchemaIfCond.docgen().<br>
&gt;<br>
&gt; This changes the generated documentation from:<br>
&gt; - COND1, COND2... (where COND1, COND2 are Literal nodes, and &#39;,&#3=
9; is Text)<br>
&gt; to:<br>
&gt; - COND1 and COND2 (the whole string as a Literal node)<br>
&gt;<br>
&gt; This will allow us to generate more complex conditions in the followin=
g<br>
&gt; patches, such as &quot;(COND1 and COND2) or COND3&quot;.<br>
&gt;<br>
&gt; Adding back the differentiated formatting is left to the wish list.<br=
>
<br>
What about a TODO comment?=C2=A0 =C2=A0you suggest a suitable spot?<br></bl=
ockquote><div><br></div><div>I don&#39;t think this matters much, it will n=
ever be a user-friendly text. But we can leave a comment in the docgen() fu=
nction to say that the sphinx build could benefit from a formatted string.<=
br></div><div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">
&gt;<br>
&gt; Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.=
lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br=
>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000027c4305c8ceb1e0--

