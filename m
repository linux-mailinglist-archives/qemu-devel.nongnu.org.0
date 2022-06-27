Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6791B55B7FA
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 08:43:57 +0200 (CEST)
Received: from localhost ([::1]:50494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5iTU-0007ul-48
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 02:43:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kennethadammiller@gmail.com>)
 id 1o5iQq-0006aK-LN
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 02:41:12 -0400
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31]:36648)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kennethadammiller@gmail.com>)
 id 1o5iQo-0005Ua-UD
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 02:41:12 -0400
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-101ec2d6087so11813564fac.3
 for <qemu-devel@nongnu.org>; Sun, 26 Jun 2022 23:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=G9kQeL/Mh39CYag+X4e7NLidIrXZolRD/d3yZ2a9OMc=;
 b=gNiqzIQbDWKROYstMWiNLoxhfVYXafc6LKJfZ7tzdDzws46LW7n7XRYGCwo2k74Xzb
 hwRUFo2COT+9qgOMoYJrC8z82kd1Zm+80/RSDnD3JPSTjGBiQg+xbG9OlAO8FI6Ek6dB
 kX47Fg4uaL+YmGRVIiZSTl1qvAxMlpeuN2OcCorgqnmavDQ1snPCOpmCzI/+LNitovKm
 X5yRsE6xaN6/DypQm66JvIsSL/t9tFx/1/9TvoyIQG8GLPZNL1LXIJrvKzlM3sPjaKv2
 3bYDUvoF6qJXovOGXuyokNt4XMMDSnYhiyM7UzGZWZGI3nQNndl9+n8clYpIwsXeHwdQ
 yhNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=G9kQeL/Mh39CYag+X4e7NLidIrXZolRD/d3yZ2a9OMc=;
 b=ERlIoBPW4rU4teyxQjKkXmc07DnVHSKZxhxxj9ukN51n8jMAD1PbVBJA1FtO3K5vE5
 4r96JNfrD/7gziSiHLujgSHYDEr3LtVMriOAHfKr0YgQLJWOhBdk6Ih8ZsizvijA4LVQ
 WlpAPftW8ln18txUx9FCBxKD8nYc9hDj4Sk0AOfP8W+kFI6hQNt1G95QyPx0CC1rQv5z
 PqEbynlOs4VZYwFgWLXYYnUuUB4JdMnP7xisZ9rdF2BgVDo1K6etAEu7PDYrf2v8dwYG
 ENciPNtI+kdIvCm3oOpg2N061abAkQd1tRFlg/jjqWmb/qWukmsW8U6TtiLyLfiojRAw
 U1NQ==
X-Gm-Message-State: AJIora83FmnAXJP1yeji3+QRg6z0tx+rSIWfhaa6CeCuk2Y31cryy8KY
 ZXTc+uKt4hVPcdWiHqwaotBZSR96itKwCQmWptA+XRiQNN0=
X-Google-Smtp-Source: AGRyM1uZutJWn5/chSDzNrtYjvMu7LEqLHN40GABaGrPqomIlicy3I5cBOYKzTX68L2rd6Q54XAoYQqymo7+9zEZrOo=
X-Received: by 2002:a05:6870:3d94:b0:106:9d09:2fa5 with SMTP id
 lm20-20020a0568703d9400b001069d092fa5mr6570965oab.82.1656312069497; Sun, 26
 Jun 2022 23:41:09 -0700 (PDT)
MIME-Version: 1.0
References: <CAK7rcp-2qVkc_G_OsfF=nCp2VfpOHjvRZR=tevN0fOSsgFpZYw@mail.gmail.com>
In-Reply-To: <CAK7rcp-2qVkc_G_OsfF=nCp2VfpOHjvRZR=tevN0fOSsgFpZYw@mail.gmail.com>
From: Kenneth Adam Miller <kennethadammiller@gmail.com>
Date: Mon, 27 Jun 2022 02:40:58 -0400
Message-ID: <CAK7rcp_qq1GC-Mtp8FW9KhVbtUKehweLCOTv-sB8deODrbBgfQ@mail.gmail.com>
Subject: Re: QEMU Disassembler
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="0000000000008a28fa05e268340f"
Received-SPF: pass client-ip=2001:4860:4864:20::31;
 envelope-from=kennethadammiller@gmail.com; helo=mail-oa1-x31.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

--0000000000008a28fa05e268340f
Content-Type: text/plain; charset="UTF-8"

Actually, I have gotten the QEMU disassembler to run with some short
customization. But I am having trouble understanding the output. I see lots
of lines like this:
|
OBJD-H: 06040102a83507000cd8027620272573004c000004c0000d20c100782244038c

On Sun, Jun 26, 2022 at 11:00 PM Kenneth Adam Miller <
kennethadammiller@gmail.com> wrote:

> Hello all,
>
> How can I call the QEMU disassembler to run on an argument set of bytes?
>

--0000000000008a28fa05e268340f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Actually, I have gotten the QEMU disassembler to run with =
some short customization. But I am having trouble understanding the output.=
 I see lots of lines like this:=C2=A0<br>|<br>OBJD-H: 06040102a83507000cd80=
27620272573004c000004c0000d20c100782244038c<br></div><br><div class=3D"gmai=
l_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Jun 26, 2022 at 11:0=
0 PM Kenneth Adam Miller &lt;<a href=3D"mailto:kennethadammiller@gmail.com"=
>kennethadammiller@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex"><div dir=3D"ltr">Hello all,<br><br>How can I ca=
ll the QEMU disassembler to run on an argument set of bytes?</div>
</blockquote></div>

--0000000000008a28fa05e268340f--

