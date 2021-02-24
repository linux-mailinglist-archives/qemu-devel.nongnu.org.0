Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48DDE3244DB
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 21:04:32 +0100 (CET)
Received: from localhost ([::1]:50476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lF0Oc-0002PS-SE
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 15:04:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nieklinnenbank@gmail.com>)
 id 1lF0NG-0001h6-FV; Wed, 24 Feb 2021 15:03:06 -0500
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c]:35495)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nieklinnenbank@gmail.com>)
 id 1lF0ND-0006S5-Uw; Wed, 24 Feb 2021 15:03:06 -0500
Received: by mail-il1-x12c.google.com with SMTP id h18so2857721ils.2;
 Wed, 24 Feb 2021 12:03:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CVSIvFlDusvg2c26u9csSyazTAKiUKkemREoEpivFgQ=;
 b=J7xvfI23FLHqSOHxa6Ar5HNOj/OSEm54GEEe+jae1I+8MiA1noAcXDLSAf3gwyMTHL
 5H1a5zNMEeiy5qtcSQ1gOMMiyIZnM1yLxSZ1hvGCBysmhX7y2UQZlC4ovvBRdXe6MMFK
 zTJz9QzDBz4CamX0sF5ZwgbcTFMTGupH776jvix8T0XyyVblkT3ZfWgsKtauTBmjRZGp
 22EdM2Ho8VHAxfHWYaK1jqtHRI+7dVFyTn4yYarOn0PB3UI78vVLWwvRyTE2MOO57ck2
 twAsK8YqJpW4i5XPLA4Dk3VarNasHFyZ+7rDx59CBHge1uaPuGv8ILOzIMbjvfAWTc2k
 iIvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CVSIvFlDusvg2c26u9csSyazTAKiUKkemREoEpivFgQ=;
 b=aYoFvYaBMdTKfEW9X5n/FMMIpB06miBtwk18u67Ik5y9Ff5bOM/LSSnWphBZ891vq2
 DvIEmlOawHYhT60jD0ARSAvsd9Eu/fcPMGpQ0j0fHXpGxsYw9igNtlrVW2A0Mho5LNeP
 uCwT2Pcx++YGqEeSwofyujP8iZO5Yq8JhO2J3anXvrCCQVrDHcCn73+PtQDBLfjY5Z3z
 DIeQYqNTGSLM1P/ZZCvQcTNGbb/OD/H17C3E2QZi92eUEn0gv8zV6ehg4mGpE0DhG+az
 acqlO+jkyFy/QDkrzimWiok/7Szh41FtyfeG3JmBgauK6XzrhkKeJj8FVtzByOiHAL6y
 hRbQ==
X-Gm-Message-State: AOAM5307oifffyh4Ie99B0IgnPeu3grPOGFPYLORE9AJGAZ/EmnVAX4s
 0T5qBuHn77zxdO94AUkay9VZ/hI2vHXws5n20TM=
X-Google-Smtp-Source: ABdhPJz9dLyxpfG3C8Wk/aW+4MHUfv9dZgO5D7Tr21h8vi6K2vYTJvjTEpmo6ifPga2D7gWmrBJC11VU+Tyk+9u+AyY=
X-Received: by 2002:a92:6b04:: with SMTP id g4mr7116240ilc.223.1614196982468; 
 Wed, 24 Feb 2021 12:03:02 -0800 (PST)
MIME-Version: 1.0
References: <20210223225327.26700-1-nieklinnenbank@gmail.com>
 <20210223225327.26700-2-nieklinnenbank@gmail.com>
 <5556626c-0b4f-0de3-9cb8-d174cd210b5c@amsat.org>
 <20210224191341.GC1074102@amachine.somewhere>
In-Reply-To: <20210224191341.GC1074102@amachine.somewhere>
From: Niek Linnenbank <nieklinnenbank@gmail.com>
Date: Wed, 24 Feb 2021 21:02:51 +0100
Message-ID: <CAPan3WqXre=Rau4-jOSE2u=GGRO8hSKzuuWFSN4xP3wbpvQ-Dg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] tests/acceptance: replace unstable apt.armbian.com
 URLs for orangepi-pc, cubieboard
To: Cleber Rosa <crosa@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000bcd59505bc1a85e7"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12c;
 envelope-from=nieklinnenbank@gmail.com; helo=mail-il1-x12c.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Beniamino Galvani <b.galvani@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Pavel.Dovgaluk@ispras.ru, Willian Rampazzo <willianr@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000bcd59505bc1a85e7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Philippe, Cleber,

On Wed, Feb 24, 2021 at 8:14 PM Cleber Rosa <crosa@redhat.com> wrote:

> On Wed, Feb 24, 2021 at 10:12:10AM +0100, Philippe Mathieu-Daud=C3=A9 wro=
te:
> > Hi Niek,
> >
> > On 2/23/21 11:53 PM, Niek Linnenbank wrote:
> > > Currently the automated acceptance tests for the Orange Pi PC and
> cubieboard
> > > machines are disabled by default. The tests for both machines require
> artifacts
> > > that are stored on the apt.armbian.com domain. Unfortunately, some of
> these artifacts
> > > have been removed from apt.armbian.com and it is uncertain whether
> more will be removed.
> > >
> > > This commit moves the artifacts previously stored on apt.armbian.com
> to github
> > > and retrieves them using the path: '/<machine>/<artifact>'.
> > >
> > > Signed-off-by: Niek Linnenbank <nieklinnenbank@gmail.com>
> > > Reviewed-by: Willian Rampazzo <willianr@redhat.com>
> > > Reviewed-by: Cleber Rosa <crosa@redhat.com>
> >
> > > Tested-by: Cleber Rosa <crosa@redhat.com>
> >
> > Did Cleber test this new version?
> >
>

You're right, it was the previous version (v1) that Cleber tested using my
own machine URL's.

I was actually not sure whether I should or should not have added the
Tested-by/Reviewed-by tags in such scenario.
The content had to be changed due to the outcome of our discussion but also
I thought I don't want to silently drop
the tags since Cleber invested his time into it too.

What should I do here, next time?



>
> Nope, and I'm having issues with those URLs.  For instance:
>
>    $ curl -L
> https://github.com/nieklinnenbank/QemuArtifacts/raw/master/cubieboard/lin=
ux-image-dev-sunxi_5.75_armhf.deb
>    version https://git-lfs.github.com/spec/v1
>    oid
> sha256:a4b765c851de76592f55023b1ff4104f7fd29bf90937e6054e0a64fdda56380b
>    size 20331524
>
> Looks like it has to do with GitHub's behavior wrt quota.
>

Indeed. Just this morning I received an e-mail from github with the
following text:

"[GitHub] Git LFS disabled for nieklinnenbank

Git LFS has been disabled on your personal account nieklinnenbank because
you=E2=80=99ve exceeded your data plan by at least 150%.
Please purchase additional data packs to cover your bandwidth and storage
usage:

  https://github.com/account/billing/data/upgrade

Current usage as of 24 Feb 2021 09:49AM UTC:

  Bandwidth: 1.55 GB / 1 GB (155%)
  Storage: 0.48 GB / 1 GB (48%)"

I wasn't aware of it but it appears that Github has these quota's for the
Large File Storage (LFS). I uploaded the files in the git LFS
because single files are also limited to 100MiB each on the regular Git
repositories.

With those strict limits, in my opinion Github isn't really a solution
since the bandwidth limit will be reached very quickly. At least for the
LFS part that is. I don't know yet if there is any limit for regular access=
.

My current ideas:
  - we can try to splitup the larger files into sizes < 100MiB in order to
use github regular storage. and then download each part to combine into the
final image.
    im not really in favour of this but it can work, if github doesnt have
any other limit/quota. the cost is that we have to add more complexity to
the acceptance test code.
  - we can try to just update the URLs to armbian that are working now
(with the risk of breaking again in the near future). Ive also found this
link, which may be more stable:
     https://archive.armbian.com/orangepipc/archive/
  - or use the server that im hosting - and i don't mind to add the license
files on it if needed (should be GPLv2 right?)

I'd be interested to hear your opinion and suggestions.

Kind regards,
Niek


>
> Regards,
> - Cleber.
>


--=20
Niek Linnenbank

--000000000000bcd59505bc1a85e7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>Hi Philippe, Cleber,</div><div><br><=
/div></div><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr"=
>On Wed, Feb 24, 2021 at 8:14 PM Cleber Rosa &lt;<a href=3D"mailto:crosa@re=
dhat.com">crosa@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">On Wed, Feb 24, 2021 at 10:12:10AM +0100, Philipp=
e Mathieu-Daud=C3=A9 wrote:<br>
&gt; Hi Niek,<br>
&gt; <br>
&gt; On 2/23/21 11:53 PM, Niek Linnenbank wrote:<br>
&gt; &gt; Currently the automated acceptance tests for the Orange Pi PC and=
 cubieboard<br>
&gt; &gt; machines are disabled by default. The tests for both machines req=
uire artifacts<br>
&gt; &gt; that are stored on the <a href=3D"http://apt.armbian.com" rel=3D"=
noreferrer" target=3D"_blank">apt.armbian.com</a> domain. Unfortunately, so=
me of these artifacts<br>
&gt; &gt; have been removed from <a href=3D"http://apt.armbian.com" rel=3D"=
noreferrer" target=3D"_blank">apt.armbian.com</a> and it is uncertain wheth=
er more will be removed.<br>
&gt; &gt; <br>
&gt; &gt; This commit moves the artifacts previously stored on <a href=3D"h=
ttp://apt.armbian.com" rel=3D"noreferrer" target=3D"_blank">apt.armbian.com=
</a> to github<br>
&gt; &gt; and retrieves them using the path: &#39;/&lt;machine&gt;/&lt;arti=
fact&gt;&#39;.<br>
&gt; &gt; <br>
&gt; &gt; Signed-off-by: Niek Linnenbank &lt;<a href=3D"mailto:nieklinnenba=
nk@gmail.com" target=3D"_blank">nieklinnenbank@gmail.com</a>&gt;<br>
&gt; &gt; Reviewed-by: Willian Rampazzo &lt;<a href=3D"mailto:willianr@redh=
at.com" target=3D"_blank">willianr@redhat.com</a>&gt;<br>
&gt; &gt; Reviewed-by: Cleber Rosa &lt;<a href=3D"mailto:crosa@redhat.com" =
target=3D"_blank">crosa@redhat.com</a>&gt;<br>
&gt; <br>
&gt; &gt; Tested-by: Cleber Rosa &lt;<a href=3D"mailto:crosa@redhat.com" ta=
rget=3D"_blank">crosa@redhat.com</a>&gt;<br>
&gt; <br>
&gt; Did Cleber test this new version?<br>
&gt;<br></blockquote><div><br></div><div>You&#39;re right, it was the previ=
ous version (v1) that Cleber tested using my own machine URL&#39;s.</div><d=
iv><br></div><div>I was actually not sure whether I should or should not ha=
ve added the Tested-by/Reviewed-by tags in such scenario.</div><div>The con=
tent had to be changed due to the outcome of our discussion but also I thou=
ght I don&#39;t want to silently drop</div><div>the tags since Cleber inves=
ted his time into it too.<br></div><div><br></div><div>What should I do her=
e, next time? <br></div><div><br></div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
<br>
Nope, and I&#39;m having issues with those URLs.=C2=A0 For instance:<br>
<br>
=C2=A0 =C2=A0$ curl -L <a href=3D"https://github.com/nieklinnenbank/QemuArt=
ifacts/raw/master/cubieboard/linux-image-dev-sunxi_5.75_armhf.deb" rel=3D"n=
oreferrer" target=3D"_blank">https://github.com/nieklinnenbank/QemuArtifact=
s/raw/master/cubieboard/linux-image-dev-sunxi_5.75_armhf.deb</a><br>
=C2=A0 =C2=A0version <a href=3D"https://git-lfs.github.com/spec/v1" rel=3D"=
noreferrer" target=3D"_blank">https://git-lfs.github.com/spec/v1</a><br>
=C2=A0 =C2=A0oid sha256:a4b765c851de76592f55023b1ff4104f7fd29bf90937e6054e0=
a64fdda56380b<br>
=C2=A0 =C2=A0size 20331524<br>
<br>
Looks like it has to do with GitHub&#39;s behavior wrt quota.<br></blockquo=
te><div><br></div><div>Indeed. Just this morning I received an e-mail from =
github with the following text:</div><div><br></div><div>&quot;[GitHub] Git=
 LFS disabled for nieklinnenbank<br><br>Git LFS has been disabled on your p=
ersonal account nieklinnenbank because you=E2=80=99ve exceeded your data pl=
an by at least 150%. <br>Please purchase additional data packs to cover you=
r bandwidth and storage usage:<br><br>=C2=A0 <a href=3D"https://github.com/=
account/billing/data/upgrade">https://github.com/account/billing/data/upgra=
de</a><br><br>Current usage as of 24 Feb 2021 09:49AM UTC:<br><br>=C2=A0 Ba=
ndwidth: 1.55 GB / 1 GB (155%)<br>=C2=A0 Storage: 0.48 GB / 1 GB (48%)&quot=
; <br>=C2=A0</div><div>I wasn&#39;t aware of it but it appears that Github =
has these quota&#39;s for the Large File Storage (LFS). I uploaded the file=
s in the git LFS</div><div>because single files are also limited to 100MiB =
each on the regular Git repositories.</div><div><br></div><div>With those s=
trict limits, in my opinion Github isn&#39;t really a solution since the ba=
ndwidth limit will be reached very quickly. At least for the</div><div>LFS =
part that is. I don&#39;t know yet if there is any limit for regular access=
.</div><div><br></div><div>My current ideas:</div><div>=C2=A0 - we can try =
to splitup the larger files into sizes &lt; 100MiB in order to use github r=
egular storage. and then download each part to combine into the final image=
.</div><div>=C2=A0=C2=A0=C2=A0 im not really in favour of this but it can w=
ork, if github doesnt have any other limit/quota. the cost is that we have =
to add more complexity to the acceptance test code.</div><div>=C2=A0 - we c=
an try to just update the URLs to armbian that are working now (with the ri=
sk of breaking again in the near future). Ive also found this link, which m=
ay be more stable:</div><div>=C2=A0=C2=A0=C2=A0=C2=A0 <a href=3D"https://ar=
chive.armbian.com/orangepipc/archive/">https://archive.armbian.com/orangepi=
pc/archive/</a></div><div>=C2=A0 - or use the server that im hosting - and =
i don&#39;t mind to add the license files on it if needed (should be GPLv2 =
right?)</div><div><br></div><div>I&#39;d be interested to hear your opinion=
 and suggestions.<br></div><div><br></div><div>Kind regards,</div><div>Niek=
<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">
<br>
Regards,<br>
- Cleber.<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature"><div dir=3D"ltr"><div>Niek Linnenbank<br><br></div></div></=
div></div>

--000000000000bcd59505bc1a85e7--

