Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B36237BCA7
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 14:38:32 +0200 (CEST)
Received: from localhost ([::1]:40696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgo8F-0000ou-AL
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 08:38:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lgo6Q-0007dF-9E
 for qemu-devel@nongnu.org; Wed, 12 May 2021 08:36:38 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:40466)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lgo6O-0008Lq-GC
 for qemu-devel@nongnu.org; Wed, 12 May 2021 08:36:38 -0400
Received: by mail-ej1-x632.google.com with SMTP id n2so34735738ejy.7
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 05:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=w0AKHWJ+tfkb0x80o+KDlZftvQMhfVLt/AARxlnsBao=;
 b=oU25LKIc595vM34QKF+qPvkzGctPBO0mExCirks7o4zCviGI8UBBBaP0SllQtLY0Fp
 RrdggwYh5dVHxz0QCmElTLrVtjYhp07tife+3S6peKj2/xTyy9wjW+kmbC/9eLV3Z2N2
 /jUL3+2e2KLg20rqrTgC6E6n8E2Q2Y+bys/6b488MLOjTAUaoJU+eIQsAOAuIhHrOfxB
 jTszryql91Kkcgx1/swzWdqMK+G8ulBHC3rtia2Kc0S6+dmVUMPpN2FSnht7hZhZzc1z
 doIzw3d9eEcksbBxkF3u9gRIxUXyjbiXrHlrBTMqockcZ/X+Cg3wrbz39CSAhqVD9ACr
 zN2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=w0AKHWJ+tfkb0x80o+KDlZftvQMhfVLt/AARxlnsBao=;
 b=k+eDSGBfPhSGHC5eqMqHhyN9EdpEF4o/UWbLt7g6rTBVXw78fIX9Am1n8Phd597Axo
 3Pb5vBxc59X2YhgJtgQuKnHHhTvemqdOXDo7ac7HYWOYNN4zhSl7OibzWnz1uzFgx8HD
 pb43DsXLCdftHW6iR64x6ad6Q7JqnjNhetkbnnAqzqBaC1KVRubPmiMVMMSi4xBOXDKF
 wtI+KuoDuxKa60EQI192OtPaat71cz3uxKhiJb+7+7aWFjbN++xUvEiLUYFle3x2aR8i
 NBvHTIfvIYx8KOSL5pfnVOuyIfKxLrgttzmFZVSRHR/xJ/nRF+nxeTMjkZWCz0Z2nLok
 wDUQ==
X-Gm-Message-State: AOAM531u74CAQJlhnaLBlYjzPRhtrnvStrsOxsxmfdW9P6Fp1qLV6YC8
 cpOp/TMJX2oMTyHWFvih9ECiVGXk1vrGc7Xe4PA=
X-Google-Smtp-Source: ABdhPJzyrCR/796lZ/EcEMRw2PR/NLWCcG/tzZm4LQ0IRz7n9jmGGMfQsr9ewDcsL6X76o74AgI+MQbOyMPdEdpiK9Y=
X-Received: by 2002:a17:906:80cd:: with SMTP id
 a13mr37135761ejx.109.1620822994226; 
 Wed, 12 May 2021 05:36:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210429134032.1125111-1-marcandre.lureau@redhat.com>
 <20210429134032.1125111-3-marcandre.lureau@redhat.com>
 <YJqzVkWfOo3MPzj2@stefanha-x1.localdomain>
In-Reply-To: <YJqzVkWfOo3MPzj2@stefanha-x1.localdomain>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 12 May 2021 16:36:22 +0400
Message-ID: <CAJ+F1CLvnv=NDMPQKqoQR1y4GgrfFn2p=_H8n87mS6MwpWb1fw@mail.gmail.com>
Subject: Re: [PATCH v3 2/9] qapi: move gen_if/gen_endif to QAPISchemaIfCond
To: Stefan Hajnoczi <stefanha@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000d092be05c2214239"
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x632.google.com
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
Cc: jsnow@redhat.com, qemu-devel@nongnu.org, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000d092be05c2214239
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Tue, May 11, 2021 at 8:42 PM Stefan Hajnoczi <stefanha@gmail.com> wrote:

> On Thu, Apr 29, 2021 at 05:40:25PM +0400, marcandre.lureau@redhat.com
> wrote:
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > Move the generating function to the QAPISchemaIfCond class.
>
> I'm not familiar enough with the QAPI code generator to know whether
> schema.py is supposed to generate C code directly. Otherwise this
> refactoring makes sense.
>

I made the QAPISchemaIfCond simple enough so it can generate C or
doc-friendly conditions in a couple of lines. So it has both data and
generation in its current form. We could make it use a visitor pattern for
the generation, but that's overkill at this point.

thanks for the review!

--=20
Marc-Andr=C3=A9 Lureau

--000000000000d092be05c2214239
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, May 11, 2021 at 8:42 PM Ste=
fan Hajnoczi &lt;<a href=3D"mailto:stefanha@gmail.com">stefanha@gmail.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On=
 Thu, Apr 29, 2021 at 05:40:25PM +0400, <a href=3D"mailto:marcandre.lureau@=
redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a> wrote:<br>
&gt; From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@re=
dhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
&gt; <br>
&gt; Move the generating function to the QAPISchemaIfCond class.<br>
<br>
I&#39;m not familiar enough with the QAPI code generator to know whether<br=
>
schema.py is supposed to generate C code directly. Otherwise this<br>
refactoring makes sense.<br>
</blockquote></div><div><br></div><div>I made the QAPISchemaIfCond simple e=
nough so it can generate C or doc-friendly conditions in a couple of lines.=
 So it has both data and generation in its current form. We could make it u=
se a visitor pattern for the generation, but that&#39;s overkill at this po=
int.</div><div><br></div><div>thanks for the review!</div><br>-- <br><div d=
ir=3D"ltr" class=3D"gmail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000d092be05c2214239--

