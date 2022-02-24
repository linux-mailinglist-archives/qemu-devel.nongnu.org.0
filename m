Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0316F4C35E3
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 20:27:42 +0100 (CET)
Received: from localhost ([::1]:35826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNJmA-0007y1-2X
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 14:27:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1nNJF1-00011f-Uq
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 13:53:27 -0500
Received: from [2607:f8b0:4864:20::929] (port=41953
 helo=mail-ua1-x929.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1nNJEz-0005fo-Bs
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 13:53:27 -0500
Received: by mail-ua1-x929.google.com with SMTP id p33so1346650uap.8
 for <qemu-devel@nongnu.org>; Thu, 24 Feb 2022 10:53:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sxbecDWTldQJfZSWILXPWbTuhYQKtcnyt0EPg5HjEpk=;
 b=pixN94ku/AgY5XMTXOupVqld6oAC3MJGDlxYpUHxuqAXPComsdjliQ/RECQir6E0vV
 cCOjUDGfJWU0p6IYkXem8cWQ2EKr39aJu6WuFDbgGlNue8WDNkPgtdPEwDq8tQ2HohPe
 r1WMthtCwq+VLo4Ebusu1aVzeslSBXUDL+ZgE8K0qt0mtPD83OCaLoggbGfMTKA0UJUd
 PHQLduhlwa046MZTbMhSGM44KSkre/Zt451oStle63n4PGidkZWFiPaCgS6kRkF/6XI7
 iEGm0CCF3MZ2IZtLHpiWrSb3OyKdUeT0J1ZtuoF008vXCxznXnke24wzE0S0xIk/TUfL
 wuyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sxbecDWTldQJfZSWILXPWbTuhYQKtcnyt0EPg5HjEpk=;
 b=SaY0nSkM1cCmKXUuvQv0Mq2AsguBWZ+nCAthgMyXlou06226JnrNNXj6SuiPGpxe7u
 eRjndEWXcLTvTf9DIbAcxO5wy1Ycd+Ttawh8SuzuDBmt2Lb9ZOHBQ1ocobeS282/IFvf
 CVUgMw5ZAz3K+4NxABslj7qfsZ3uzvqbob9yLD5rx/epFsvGkU9ST8o7VZvtjcCXWFDR
 XwLJzjm79nMNdOjzSblMigByJPVWWQqcr5J0j3LS5uqP9lc6d0sLKsE74pURffVHj35F
 r2s3CsfiYTMOB7SShrZYE12qGTaenEfOdDLgWPX82Fv8bmdg7vqWmdo6Cr1twTHfitgE
 WWDg==
X-Gm-Message-State: AOAM531wywRZfQO104D9dMvwg0pbDIy0aoWgjMzo9NmCPeBwD6VEOaCh
 3KZq8/5O+p1j/ESZ251c0PuSgy3ebe5W6/SpmjKsNw==
X-Google-Smtp-Source: ABdhPJyAvaSC2/DzJUewKfS7GEfJ/UOzm0/MCAdQhoWiWGDnjtRzoyhrPBw1WFHW6X+YM3lCzkVc9VRqkgganOj6zPU=
X-Received: by 2002:ab0:3046:0:b0:33c:7679:3141 with SMTP id
 x6-20020ab03046000000b0033c76793141mr1754591ual.15.1645728783616; Thu, 24 Feb
 2022 10:53:03 -0800 (PST)
MIME-Version: 1.0
References: <20220202164533.1283668-1-venture@google.com>
 <CAFEAcA8gV5_cAyh9UVuN06tj5+0QietF-aDMAbvY-eW3kmFy0A@mail.gmail.com>
In-Reply-To: <CAFEAcA8gV5_cAyh9UVuN06tj5+0QietF-aDMAbvY-eW3kmFy0A@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Thu, 24 Feb 2022 10:52:52 -0800
Message-ID: <CAO=notxEN9ZC0iLtHa5uvs_3cFQKYZGoMxBLkH7f0svsx4kLkQ@mail.gmail.com>
Subject: Re: [PATCH v2] hw/i2c: flatten pca954x mux device
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Corey Minyard <cminyard@mvista.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 QEMU Developers <qemu-devel@nongnu.org>, Hao Wu <wuhaotsh@google.com>
Content-Type: multipart/alternative; boundary="0000000000008bd9d705d8c81783"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::929
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::929;
 envelope-from=venture@google.com; helo=mail-ua1-x929.google.com
X-Spam_score_int: -161
X-Spam_score: -16.2
X-Spam_bar: ----------------
X-Spam_report: (-16.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=no autolearn_force=no
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

--0000000000008bd9d705d8c81783
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 24, 2022 at 2:56 AM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Wed, 2 Feb 2022 at 17:57, Patrick Venture <venture@google.com> wrote:
> >
> > Previously this device created N subdevices which each owned an i2c bus=
.
> > Now this device simply owns the N i2c busses directly.
> >
> > Tested: Verified devices behind mux are still accessible via qmp and i2=
c
> > from within an arm32 SoC.
> >
> > Reviewed-by: Hao Wu <wuhaotsh@google.com>
> > Signed-off-by: Patrick Venture <venture@google.com>
> > Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> > Tested-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> > ---
> > v2: explicitly create an incrementing name for the i2c busses (channels=
).
> > ---
>
> Applied to target-arm.next, thanks.
>
> Apologies for not picking this up earlier, the v2 got lost in the
> side-conversation about spam filtering. (Blame gmail for not
> doing email threading properly if you like :-))
>

Thanks, and no problem.  This v2 is what we have downstream for this.

I'm working on a further improvement to it (separate feature change)
that'll allow setting an id on the device so that all its channels have
that the id embedded in them.  This'll handle some of the situations we're
observing where the qdev paths aren't great for command line added i2c
devices.  There's a side conversation going on about how best to accomplish
this.


>
> -- PMM
>

--0000000000008bd9d705d8c81783
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Feb 24, 2022 at 2:56 AM Peter=
 Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@lina=
ro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">On Wed, 2 Feb 2022 at 17:57, Patrick Venture &lt;<a href=3D"mailto:ve=
nture@google.com" target=3D"_blank">venture@google.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Previously this device created N subdevices which each owned an i2c bu=
s.<br>
&gt; Now this device simply owns the N i2c busses directly.<br>
&gt;<br>
&gt; Tested: Verified devices behind mux are still accessible via qmp and i=
2c<br>
&gt; from within an arm32 SoC.<br>
&gt;<br>
&gt; Reviewed-by: Hao Wu &lt;<a href=3D"mailto:wuhaotsh@google.com" target=
=3D"_blank">wuhaotsh@google.com</a>&gt;<br>
&gt; Signed-off-by: Patrick Venture &lt;<a href=3D"mailto:venture@google.co=
m" target=3D"_blank">venture@google.com</a>&gt;<br>
&gt; Reviewed-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@a=
msat.org" target=3D"_blank">f4bug@amsat.org</a>&gt;<br>
&gt; Tested-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@ams=
at.org" target=3D"_blank">f4bug@amsat.org</a>&gt;<br>
&gt; ---<br>
&gt; v2: explicitly create an incrementing name for the i2c busses (channel=
s).<br>
&gt; ---<br>
<br>
Applied to target-arm.next, thanks.<br>
<br>
Apologies for not picking this up earlier, the v2 got lost in the<br>
side-conversation about spam filtering. (Blame gmail for not<br>
doing email threading properly if you like :-))<br></blockquote><div><br></=
div><div>Thanks, and no problem.=C2=A0 This v2 is what we have downstream f=
or this.</div><div><br></div><div>I&#39;m working on a further improvement =
to it (separate feature change) that&#39;ll allow setting an id on the devi=
ce so that all its channels have that the id embedded in them.=C2=A0 This&#=
39;ll handle some of the situations we&#39;re observing where the qdev path=
s aren&#39;t great for command line added i2c devices.=C2=A0 There&#39;s a =
side conversation going on about how best to accomplish this.</div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
-- PMM<br>
</blockquote></div></div>

--0000000000008bd9d705d8c81783--

