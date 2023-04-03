Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE456D52D6
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 22:49:22 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjR6t-0005gk-L5; Mon, 03 Apr 2023 16:49:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1pjR6r-0005gD-3K
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 16:49:01 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1pjR6p-0007gI-AD
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 16:49:00 -0400
Received: by mail-ed1-x530.google.com with SMTP id cn12so122466331edb.4
 for <qemu-devel@nongnu.org>; Mon, 03 Apr 2023 13:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112; t=1680554937;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=vVOtEO/QMukwBBsypx39+522l4mW5B+0ax6P67gnT+g=;
 b=GQ5KED/uboCuccDQ7TtV8xUsVHLILPbDdmqnC4DZ859CitFpFLO4aYo2BD+HBwQWEJ
 sRzvzVSg0xAb/1JNjGvBn6kYN1n6gH9XdTHRnR0B8u94cDlDP1FVMlA7FwRUlFDsWYHj
 CuzX+G2UKP+6bWUnX6GqlPWfgHZ8OVDCZUr08PhUJgWDJIPt51egsCxB/BzgfpEbViwQ
 Cty/PHQQIQHOSPmS7XakyUX1OVE3LR6SG6qQr/KK6D+QkN4iNiKIM6iim5GXw6kDGcE7
 XRSaSeraHX/OLOGzx4uaSi/WaqH6lXMngrEeyfiPhhPtTTyZ+YHLmfB1GyV6pIMry4iz
 7KIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680554937;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vVOtEO/QMukwBBsypx39+522l4mW5B+0ax6P67gnT+g=;
 b=exV0aCl93E+TnoGIXuDE/nZdYyB6sWNw5zlm4PDBWtiwzjpOzGq7dDA+I5PtLdiU6d
 hOsi8yQj9DWBqlC8BOaZ8ZlztnlgNWR0NdveRAuEAum9bsXF5AVBwlRyjo6ZNy+9laGW
 QMVN82EfrZp6dQr3u2BSMOzTGOw2QlNj+rMG4mVjGP6DkdKFCX3BAwoo3nB9DyLmsH1u
 YB4+6a8+QVRnKt4/VVQVB8IlpwiKrh3Q0Bntri+5ygxQESMuUKoiFF8ERZf1M4ThSQp8
 jqd6jKbewzFRl+GQ562NzXV3CQEB1d77Rb74L/xkyWHJJCSt8ZwOinGfxIFcqxoE5vZm
 B63Q==
X-Gm-Message-State: AAQBX9e9bPUOW9Qq+A89JV4grAERDjkJPdETPCYlrsEPp4hcY60gPprA
 DpRw4XuydPnNzhPOmHKTD3qKPVjCaVZ6DUeIWeUbAA==
X-Google-Smtp-Source: AKy350YS8Zx83Ki5eS1yp8MpzSkHDXGdSDIFtifnT6/lCQyDz/TUWSbHC8R/MjP/UFUcebK3LLb361hLb4/wUN3Xa/0=
X-Received: by 2002:a17:907:a0c:b0:8b1:3298:c587 with SMTP id
 bb12-20020a1709070a0c00b008b13298c587mr23114ejc.2.1680554937328; Mon, 03 Apr
 2023 13:48:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230403144637.2949366-1-peter.maydell@linaro.org>
 <20230403144637.2949366-5-peter.maydell@linaro.org>
 <441b74d5-2f13-6166-ec5c-e96b0d0c7de6@linaro.org>
In-Reply-To: <441b74d5-2f13-6166-ec5c-e96b0d0c7de6@linaro.org>
From: Warner Losh <imp@bsdimp.com>
Date: Mon, 3 Apr 2023 14:48:45 -0600
Message-ID: <CANCZdfq24u5Njga0P-mmnd7cNNVXszx7rhHY37dsWnQTiPgmQg@mail.gmail.com>
Subject: Re: [PATCH v2 04/10] linux-user: Add '-one-insn-per-tb' option
 equivalent to '-singlestep'
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org, 
 Kyle Evans <kevans@freebsd.org>, libvir-list@redhat.com, 
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, 
 Laurent Vivier <laurent@vivier.eu>, Eric Blake <eblake@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000010ba7105f874b09e"
Received-SPF: none client-ip=2a00:1450:4864:20::530;
 envelope-from=wlosh@bsdimp.com; helo=mail-ed1-x530.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

--00000000000010ba7105f874b09e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 3, 2023 at 12:35=E2=80=AFPM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 4/3/23 07:46, Peter Maydell wrote:
> > The '-singlestep' option is confusing, because it doesn't actually
> > have anything to do with single-stepping the CPU. What it does do
> > is force TCG emulation to put one guest instruction in each TB,
> > which can be useful in some situations.
> >
> > Create a new command line argument -one-insn-per-tb, so we can
> > document that -singlestep is just a deprecated synonym for it,
> > and eventually perhaps drop it.
> >
> > Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> > ---
> >   docs/user/main.rst | 7 ++++++-
> >   linux-user/main.c  | 9 ++++++---
> >   2 files changed, 12 insertions(+), 4 deletions(-)
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>

Reviewed-by: Warner Losh <imp@bsdimp.com>


> r~
>

--00000000000010ba7105f874b09e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Apr 3, 2023 at 12:35=E2=80=AF=
PM Richard Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">ri=
chard.henderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">On 4/3/23 07:46, Peter Maydell wrote:<br>
&gt; The &#39;-singlestep&#39; option is confusing, because it doesn&#39;t =
actually<br>
&gt; have anything to do with single-stepping the CPU. What it does do<br>
&gt; is force TCG emulation to put one guest instruction in each TB,<br>
&gt; which can be useful in some situations.<br>
&gt; <br>
&gt; Create a new command line argument -one-insn-per-tb, so we can<br>
&gt; document that -singlestep is just a deprecated synonym for it,<br>
&gt; and eventually perhaps drop it.<br>
&gt; <br>
&gt; Signed-off-by: Peter Maydell&lt;<a href=3D"mailto:peter.maydell@linaro=
.org" target=3D"_blank">peter.maydell@linaro.org</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0docs/user/main.rst | 7 ++++++-<br>
&gt;=C2=A0 =C2=A0linux-user/main.c=C2=A0 | 9 ++++++---<br>
&gt;=C2=A0 =C2=A02 files changed, 12 insertions(+), 4 deletions(-)<br>
<br>
Reviewed-by: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@lina=
ro.org" target=3D"_blank">richard.henderson@linaro.org</a>&gt;<br></blockqu=
ote><div><br></div><div>Reviewed-by: Warner Losh &lt;<a href=3D"mailto:imp@=
bsdimp.com">imp@bsdimp.com</a>&gt;<br></div><div>=C2=A0</div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">
r~<br>
</blockquote></div></div>

--00000000000010ba7105f874b09e--

