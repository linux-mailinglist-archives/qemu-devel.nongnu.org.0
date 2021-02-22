Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 542BE321415
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 11:24:57 +0100 (CET)
Received: from localhost ([::1]:58870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lE8Oe-000064-CO
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 05:24:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lE8Nv-000876-Dn
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 05:24:11 -0500
Received: from mail-oi1-f177.google.com ([209.85.167.177]:33071)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lE8Nt-0000lz-RO
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 05:24:11 -0500
Received: by mail-oi1-f177.google.com with SMTP id w1so13487172oic.0
 for <qemu-devel@nongnu.org>; Mon, 22 Feb 2021 02:24:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jS24Y8XOy/4EAOR/KwdZJstvpvONXE39gU6A0j1l9Fk=;
 b=LYVTBjJZaL042Jf/rFhBsJvcTBUpSfyuP0q9f05R7Nn5AogK8QgrrDlfTIDDbmznpO
 WVrmUA2+5TtNuewbQHqnDJIkm8+uUET8oYI/M2sNoK5m9RNc501G2VduCCbhbh0LQu5r
 oxecwbZHFQL0KBRHh+HrJ8BF75vK0j+8B/ezWhJiqU8D/vS62xiFLo3JZS4R1M3fJWMW
 t3CYINbBV3yBxWjJR+2X5NDDsAnGmhLdBc9/iMogbwBzDmfSUCWudbr4W4R4O0CPUO2M
 FUu3vVdif2tro9hDDSsgmBIlli2o4ClUZxGv0dBayT3GNev/TMvFgRhRFj/HB3O1BbVt
 gSrA==
X-Gm-Message-State: AOAM532kQZRwH0epfayJxSnBSDIgUi/VaPUvm/N5Oq6XJZ9CAPS9Pc7s
 5PYCZIizAOyltIdQxspmd1oE/kVlvYxeVcWU3FE=
X-Google-Smtp-Source: ABdhPJziKOTAmB7Hm/w9LBQssDZagiv0UtX0jX4kOCjowrxkRbV1eKEnNO2I/ChBTiiEuI/qW1XecSo7obwBFhs4pog=
X-Received: by 2002:aca:1a0a:: with SMTP id a10mr15235613oia.46.1613989448435; 
 Mon, 22 Feb 2021 02:24:08 -0800 (PST)
MIME-Version: 1.0
References: <20210222083324.331908-1-edgar.iglesias@gmail.com>
 <20210222083324.331908-4-edgar.iglesias@gmail.com>
 <39885acc-a692-cd6c-c0bf-46e3193a4d7b@amsat.org>
 <022FADE0-9DE7-4DA3-B864-2CE5B97F26F4@axis.com> <20210222101912.GC22843@toto>
In-Reply-To: <20210222101912.GC22843@toto>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Mon, 22 Feb 2021 11:23:57 +0100
Message-ID: <CAAdtpL4WJUW4k8ML-n6q8-O7my=25H=8uCRrJv4zs3kkM=PdNA@mail.gmail.com>
Subject: Re: [PULL v1 3/3] target/cris: Plug leakage of TCG temporaries
To: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
Content-Type: multipart/alternative; boundary="000000000000beca8605bbea338f"
Received-SPF: pass client-ip=209.85.167.177;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-oi1-f177.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Stefan_Sandstr=C3=B6m?= <Stefan.Sandstrom@axis.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000beca8605bbea338f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lun. 22 f=C3=A9vr. 2021 11:19, Edgar E. Iglesias <edgar.iglesias@xilinx.=
com>
a =C3=A9crit :

> On Mon, Feb 22, 2021 at 08:50:46AM +0000, Stefan Sandstr=C3=B6m wrote:
> > Hi,
> >
> > > On 22 Feb 2021, at 09:41, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g>
> wrote:
> > >
> > > Hi Edgar,
> > >
> > > On 2/22/21 9:33 AM, Edgar E. Iglesias wrote:
> > >> From: Stefan Sandstrom <stefans@axis.com>
> > >>
> > >> Add and fix deallocation of temporary TCG registers in CRIS code
> > >> generation.
> > >>
> > >> Tested-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> > >> Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> > >> Change-Id: I17fce5d95bdc4418337ba885d53ba97afb1bafcc
> > > Out of curiosity, what is this Change-Id?
> >
> > It is used by the Gerrit Code Review tool (
> https://gerrit-review.googlesource.com/Documentation/user-changeid.html).
> > When using Gerrit as a git-server, you install a git hook that always
> adds this, so it is an artifact from storing a clone of the QEMU repos on=
 a
> gerrit server.
>

I see, thanks.

> I'll try to remember to remove it if I end up posting more patches.
> >
>
>
> Thanks,
>
> Peter, do you need an updated PR without the tag or can you handle it whe=
n
> merging?
>

I don't think this single line is important enough to justify another pull
request ;)

Best regards,
> Edgar
>

--000000000000beca8605bbea338f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">Le lun. 22 f=C3=A9vr. 2021 11:19, Edgar E. Iglesias &lt;<a hre=
f=3D"mailto:edgar.iglesias@xilinx.com">edgar.iglesias@xilinx.com</a>&gt; a =
=C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Mon, Feb 22, 2=
021 at 08:50:46AM +0000, Stefan Sandstr=C3=B6m wrote:<br>
&gt; Hi,<br>
&gt; <br>
&gt; &gt; On 22 Feb 2021, at 09:41, Philippe Mathieu-Daud=C3=A9 &lt;<a href=
=3D"mailto:f4bug@amsat.org" target=3D"_blank" rel=3D"noreferrer">f4bug@amsa=
t.org</a>&gt; wrote:<br>
&gt; &gt; <br>
&gt; &gt; Hi Edgar,<br>
&gt; &gt; <br>
&gt; &gt; On 2/22/21 9:33 AM, Edgar E. Iglesias wrote:<br>
&gt; &gt;&gt; From: Stefan Sandstrom &lt;<a href=3D"mailto:stefans@axis.com=
" target=3D"_blank" rel=3D"noreferrer">stefans@axis.com</a>&gt;<br>
&gt; &gt;&gt; <br>
&gt; &gt;&gt; Add and fix deallocation of temporary TCG registers in CRIS c=
ode<br>
&gt; &gt;&gt; generation.<br>
&gt; &gt;&gt; <br>
&gt; &gt;&gt; Tested-by: Edgar E. Iglesias &lt;<a href=3D"mailto:edgar.igle=
sias@xilinx.com" target=3D"_blank" rel=3D"noreferrer">edgar.iglesias@xilinx=
.com</a>&gt;<br>
&gt; &gt;&gt; Reviewed-by: Edgar E. Iglesias &lt;<a href=3D"mailto:edgar.ig=
lesias@xilinx.com" target=3D"_blank" rel=3D"noreferrer">edgar.iglesias@xili=
nx.com</a>&gt;<br>
&gt; &gt;&gt; Change-Id: I17fce5d95bdc4418337ba885d53ba97afb1bafcc<br>
&gt; &gt; Out of curiosity, what is this Change-Id?<br>
&gt; <br>
&gt; It is used by the Gerrit Code Review tool (<a href=3D"https://gerrit-r=
eview.googlesource.com/Documentation/user-changeid.html" rel=3D"noreferrer =
noreferrer" target=3D"_blank">https://gerrit-review.googlesource.com/Docume=
ntation/user-changeid.html</a>).<br>
&gt; When using Gerrit as a git-server, you install a git hook that always =
adds this, so it is an artifact from storing a clone of the QEMU repos on a=
 gerrit server.<br></blockquote></div></div><div dir=3D"auto"><br></div><di=
v dir=3D"auto">I see, thanks.=C2=A0</div><div dir=3D"auto"><br></div><div d=
ir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
&gt; I&#39;ll try to remember to remove it if I end up posting more patches=
.<br>
&gt; <br>
<br>
<br>
Thanks,<br>
<br>
Peter, do you need an updated PR without the tag or can you handle it when =
merging?<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=
=3D"auto">I don&#39;t think this single line is important enough to justify=
 another pull request ;)</div><div dir=3D"auto"><br></div><div dir=3D"auto"=
><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
Best regards,<br>
Edgar<br>
</blockquote></div></div></div>

--000000000000beca8605bbea338f--

