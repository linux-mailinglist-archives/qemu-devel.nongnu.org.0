Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 969234DB63A
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 17:32:01 +0100 (CET)
Received: from localhost ([::1]:44670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUWZ5-0005Ln-QH
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 12:31:59 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vladislav.yaroshchuk@jetbrains.com>)
 id 1nUWWT-0003hy-Iw
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 12:29:17 -0400
Received: from [2607:f8b0:4864:20::112b] (port=38405
 helo=mail-yw1-x112b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <vladislav.yaroshchuk@jetbrains.com>)
 id 1nUWWQ-00039f-P5
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 12:29:17 -0400
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-2e592e700acso29548267b3.5
 for <qemu-devel@nongnu.org>; Wed, 16 Mar 2022 09:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jetbrains.com; s=googleapps;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6SL/n9GxbkAIGQUx/1ry31Y9Y2Y2Yho54qZ5pQoHo/c=;
 b=YPGy56w6gNXMKL6f0T35W+m2bVAFwN7tC8SDnJvHoSHPS0C+NJghxjn9PU6MAYeGHv
 HJjGt/ex8pfvUi1XgtMljH5NNtD5kB7M2J7Q9iqyX9MXW/f0ClY321m2YD5J00igzeor
 VS60gYe6O5EjQ/hNfMIqeF9ivdUn8mX9eRiKk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6SL/n9GxbkAIGQUx/1ry31Y9Y2Y2Yho54qZ5pQoHo/c=;
 b=yQGuhygD74fmzoMvBKClbfz98WEGMdqg3KE5E+sC1cmazxZ+tMjqptrm9tPiWqanyq
 vxDxCUwgRwrlr7bGO1gnjG+SDaskw3+Vnvspo4yC49vvvFoYRvprJ/ATbrFTUPmqVHXC
 r0PDIVcl9Yj+azKcEpmBocf40osmwG4cTX1FG2gu0doWr0zNItkq0Z4zkizL71/Tfn+i
 YM3wd+xp6/Rty2/VmfY8oe9mNdeNdd9xXQWN2usino2RNWGUUgyiiG1l29jJK1vnXX0q
 Qx2jurR3/6HX0Weh3TeBoobd5lZO/cm2LOKLQgqQwy5l/EHLEgslZP6u9T1gONAoKtqx
 QfxA==
X-Gm-Message-State: AOAM532tvnlKvcUN88GJwK5NwFt+a6sgXFtsXko8odh+5kbksxZvg5MQ
 C4jt9LQ4523Gi92jw3VWApEbuCS0aWYjSvai5WOAxA==
X-Google-Smtp-Source: ABdhPJzQupxBIyC/bK6W4OrK1C4MFv+mWrxvappZLRZxAjCBXTEy7WEj+ycchDweTZBl+bu7C5QTE6Xvn/FuqSCZegg=
X-Received: by 2002:a81:78c4:0:b0:2e5:95f7:613e with SMTP id
 t187-20020a8178c4000000b002e595f7613emr954336ywc.89.1647448152657; Wed, 16
 Mar 2022 09:29:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220315230741.21578-1-Vladislav.Yaroshchuk@jetbrains.com>
 <20220315230741.21578-3-Vladislav.Yaroshchuk@jetbrains.com>
 <87v8weuhi6.fsf@pond.sub.org>
In-Reply-To: <87v8weuhi6.fsf@pond.sub.org>
From: Vladislav Yaroshchuk <vladislav.yaroshchuk@jetbrains.com>
Date: Wed, 16 Mar 2022 19:29:01 +0300
Message-ID: <CAGmdLqQveMzYzsiWT4gBYoAAL1k2aZ1_KgoXNDCHLnWwLLO2dQ@mail.gmail.com>
Subject: Re: [PATCH v20 2/7] net/vmnet: add vmnet backends to qapi/net
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu Developers <qemu-devel@nongnu.org>, Jason Wang <jasowang@redhat.com>, 
 Roman Bolshakov <r.bolshakov@yadro.com>, Eric Blake <eblake@redhat.com>,
 phillip.ennen@gmail.com, 
 Phillip Tennen <phillip@axleos.com>, Akihiko Odaki <akihiko.odaki@gmail.com>, 
 Howard Spoelstra <hsp.cat7@gmail.com>, Alessio Dionisi <hello@adns.io>,
 Roman Bolshakov <roman@roolebo.dev>, 
 Peter Maydell <peter.maydell@linaro.org>, Cameron Esfahani <dirty@apple.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Alexander Graf <agraf@csgraf.de>, Gerd Hoffmann <kraxel@redhat.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Christian Schoenebeck <qemu_oss@crudebyte.com>
Content-Type: multipart/alternative; boundary="000000000000ecfbf205da586904"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::112b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=vladislav.yaroshchuk@jetbrains.com;
 helo=mail-yw1-x112b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000ecfbf205da586904
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 16, 2022 at 4:58 PM Markus Armbruster <armbru@redhat.com> wrote:

> Vladislav Yaroshchuk <vladislav.yaroshchuk@jetbrains.com> writes:
>
> > Create separate netdevs for each vmnet operating mode:
> > - vmnet-host
> > - vmnet-shared
> > - vmnet-bridged
> >
> > Signed-off-by: Vladislav Yaroshchuk <Vladislav.Yaroshchuk@jetbrains.com>
>
> Any QAPI schema changes since v15?  I'm asking because I acked v8, v13,
> and v15, but each time you neglected to carry my Acked-by lines in later
> revisions.
>
>
QAPI is not changed, but the "Since" statement was updated
for new netdevs (7.0 -> 7.1). That's the reason why I dropped
your Acked-by. I've also mentioned this in cover letter:

v15 -> v16
[...]
 - QAPI: change version to 7.1 (cause 7.0 feature freeze
   happened). This is the only change in QAPI, Markus Armbruster,
   please confirm if you can (decided to drop your Acked-by due
   to this change)
[...]

Best Regards,
Vladislav Yaroshchuk

--000000000000ecfbf205da586904
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Mar 16, 2022 at 4:58 PM Marku=
s Armbruster &lt;<a href=3D"mailto:armbru@redhat.com">armbru@redhat.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Vlad=
islav Yaroshchuk &lt;<a href=3D"mailto:vladislav.yaroshchuk@jetbrains.com" =
target=3D"_blank">vladislav.yaroshchuk@jetbrains.com</a>&gt; writes:<br>
<br>
&gt; Create separate netdevs for each vmnet operating mode:<br>
&gt; - vmnet-host<br>
&gt; - vmnet-shared<br>
&gt; - vmnet-bridged<br>
&gt;<br>
&gt; Signed-off-by: Vladislav Yaroshchuk &lt;<a href=3D"mailto:Vladislav.Ya=
roshchuk@jetbrains.com" target=3D"_blank">Vladislav.Yaroshchuk@jetbrains.co=
m</a>&gt;<br>
<br>
Any QAPI schema changes since v15?=C2=A0 I&#39;m asking because I acked v8,=
 v13,<br>
and v15, but each time you neglected to carry my Acked-by lines in later<br=
>
revisions.<br>
<br></blockquote><div><br>QAPI is not changed, but the &quot;Since&quot; st=
atement was updated<br>for new netdevs (7.0 -&gt; 7.1). That&#39;s the reas=
on why I dropped <br>your Acked-by. I&#39;ve also mentioned this in cover l=
etter:<br><br>v15 -&gt; v16<br>[...]<br>=C2=A0- QAPI: change version to 7.1=
 (cause 7.0 feature freeze<br>=C2=A0 =C2=A0happened). This is the only chan=
ge in QAPI, Markus Armbruster,<br>=C2=A0 =C2=A0please confirm if you can (d=
ecided to drop your Acked-by due<br>=C2=A0 =C2=A0to this change)<br>[...]<b=
r><br>Best Regards,</div><div>Vladislav Yaroshchuk<br><br><br></div></div><=
/div>

--000000000000ecfbf205da586904--

