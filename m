Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 810CF3256DD
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 20:41:21 +0100 (CET)
Received: from localhost ([::1]:49468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFMVk-00033z-1o
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 14:41:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nieklinnenbank@gmail.com>)
 id 1lFMUQ-0002Qo-B5; Thu, 25 Feb 2021 14:39:58 -0500
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134]:38566)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nieklinnenbank@gmail.com>)
 id 1lFMUO-0001im-3A; Thu, 25 Feb 2021 14:39:58 -0500
Received: by mail-il1-x134.google.com with SMTP id f10so5428353ilq.5;
 Thu, 25 Feb 2021 11:39:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=x8DQ1n/1E8K07VrAGtc1E9VO+ZJ+gwVbBIbaWMI5kTk=;
 b=sScSFaso/PVyP5ULeWxITxx45tckXvIAlg87UIKctK+OOogIE5/XLvdhrWmLKCLd8r
 +oyQeUOldBPC1ENwddeP+2QI7Ro6GYfAZUMBVvg5zGFek3OhKCBQlArxiV+m18e7iQFw
 imIYepWEVcvwPGOlgQy0w283yIQhJlnCRaDJtOGbk0rKHMCojKv/jbJgMnAK/gcVMnd9
 lsSTNE0YhdM37fNPC/wXVXnFpcWv2pPsCzg7Ev+H6HeCZw26qL9UtsTASffzz64JTsed
 s/PCTr0X6QNK+FxMxZBfRUVImSoSBIejopQjhGUVMyNHtfPDDjuGDjg+J/VlDvxeCUuC
 pOYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=x8DQ1n/1E8K07VrAGtc1E9VO+ZJ+gwVbBIbaWMI5kTk=;
 b=J1Nq5V8N5Jv92+k1HRd9LzyWRv2Zom4InH1ZKkJY2/XdMutd2+Ho+eJHmUFdB64yiP
 TtW6NS6C28U7oWQKBBoeJRA4oRYvOPgDniAqfRh0tanCMVSXa06UjymLsJ+L/VUl2qhP
 F24TfTQxNdKri7S1fq3WEta7HA3aK2Gd5x+ZmdPuX2s1CHi34orLrSfw6LOQktBAKiHq
 jKVDahhbzRYYMz5uctH6EyIXNbRgY76ntnrFLraENY0lg2TAtSv7xd88CI6GG+nJg5vT
 vtTRXzIcfmCYegkn+kV0le/yh4XNg9zws88lLSogNkBBINpHlqEne3xQdP/5yiz15Viw
 Su2Q==
X-Gm-Message-State: AOAM531yJzL6QETTYqvyxPSgsNOK0BCtp+mOZdtWIjXRJWwZUT2Dmvq0
 AjvTI0hr07N2hhKw+d1oLuDu3WqBH3SB9LQrIW8=
X-Google-Smtp-Source: ABdhPJycxzgzKOMDxwdKIlx90Qop3bOut0lR8n5fT2JFtEQS7HpJ/Bg3cEp2cYPodC4HoeojUCsVtcH7UsNnNmVyrEk=
X-Received: by 2002:a05:6e02:1544:: with SMTP id
 j4mr3707731ilu.67.1614281994068; 
 Thu, 25 Feb 2021 11:39:54 -0800 (PST)
MIME-Version: 1.0
References: <20210223225327.26700-1-nieklinnenbank@gmail.com>
 <20210223225327.26700-2-nieklinnenbank@gmail.com>
 <5556626c-0b4f-0de3-9cb8-d174cd210b5c@amsat.org>
 <20210224191341.GC1074102@amachine.somewhere>
 <CAPan3WqXre=Rau4-jOSE2u=GGRO8hSKzuuWFSN4xP3wbpvQ-Dg@mail.gmail.com>
 <YDdx9N0Wtv8F47Ka@redhat.com>
In-Reply-To: <YDdx9N0Wtv8F47Ka@redhat.com>
From: Niek Linnenbank <nieklinnenbank@gmail.com>
Date: Thu, 25 Feb 2021 20:39:42 +0100
Message-ID: <CAPan3Wp-4Ey+vmMfw2F_yynC_un+byCcYh1U4HuMQYypOJp3GA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] tests/acceptance: replace unstable apt.armbian.com
 URLs for orangepi-pc, cubieboard
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000d2ea2f05bc2e50fb"
Received-SPF: pass client-ip=2607:f8b0:4864:20::134;
 envelope-from=nieklinnenbank@gmail.com; helo=mail-il1-x134.google.com
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
 QEMU Developers <qemu-devel@nongnu.org>,
 Beniamino Galvani <b.galvani@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Pavel.Dovgaluk@ispras.ru, Cleber Rosa <crosa@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000d2ea2f05bc2e50fb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Philippe, Thomas, Daniel,

Thank you all. Then I'll just prepare a new version of the patch that uses
currently working archive.armbian.com links.

Kind regards,
Niek

On Thu, Feb 25, 2021 at 10:46 AM Daniel P. Berrang=C3=A9 <berrange@redhat.c=
om>
wrote:

> On Wed, Feb 24, 2021 at 09:02:51PM +0100, Niek Linnenbank wrote:
> > Hi Philippe, Cleber,
> >
> > On Wed, Feb 24, 2021 at 8:14 PM Cleber Rosa <crosa@redhat.com> wrote:
> >
> > > On Wed, Feb 24, 2021 at 10:12:10AM +0100, Philippe Mathieu-Daud=C3=A9=
 wrote:
> > > > Hi Niek,
> > > >
> > > > On 2/23/21 11:53 PM, Niek Linnenbank wrote:
> > > > > Currently the automated acceptance tests for the Orange Pi PC and
> > > cubieboard
> > > > > machines are disabled by default. The tests for both machines
> require
> > > artifacts
> > > > > that are stored on the apt.armbian.com domain. Unfortunately,
> some of
> > > these artifacts
> > > > > have been removed from apt.armbian.com and it is uncertain whethe=
r
> > > more will be removed.
> > > > >
> > > > > This commit moves the artifacts previously stored on
> apt.armbian.com
> > > to github
> > > > > and retrieves them using the path: '/<machine>/<artifact>'.
> > > > >
> > > > > Signed-off-by: Niek Linnenbank <nieklinnenbank@gmail.com>
> > > > > Reviewed-by: Willian Rampazzo <willianr@redhat.com>
> > > > > Reviewed-by: Cleber Rosa <crosa@redhat.com>
> > > >
> > > > > Tested-by: Cleber Rosa <crosa@redhat.com>
> > > >
> > > > Did Cleber test this new version?
> > > >
> > >
> >
> > You're right, it was the previous version (v1) that Cleber tested using
> my
> > own machine URL's.
> >
> > I was actually not sure whether I should or should not have added the
> > Tested-by/Reviewed-by tags in such scenario.
> > The content had to be changed due to the outcome of our discussion but
> also
> > I thought I don't want to silently drop
> > the tags since Cleber invested his time into it too.
> >
> > What should I do here, next time?
> >
> >
> >
> > >
> > > Nope, and I'm having issues with those URLs.  For instance:
> > >
> > >    $ curl -L
> > >
> https://github.com/nieklinnenbank/QemuArtifacts/raw/master/cubieboard/lin=
ux-image-dev-sunxi_5.75_armhf.deb
> > >    version https://git-lfs.github.com/spec/v1
> > >    oid
> > > sha256:a4b765c851de76592f55023b1ff4104f7fd29bf90937e6054e0a64fdda5638=
0b
> > >    size 20331524
> > >
> > > Looks like it has to do with GitHub's behavior wrt quota.
> > >
> >
> > Indeed. Just this morning I received an e-mail from github with the
> > following text:
> >
> > "[GitHub] Git LFS disabled for nieklinnenbank
> >
> > Git LFS has been disabled on your personal account nieklinnenbank becau=
se
> > you=E2=80=99ve exceeded your data plan by at least 150%.
> > Please purchase additional data packs to cover your bandwidth and stora=
ge
> > usage:
> >
> >   https://github.com/account/billing/data/upgrade
> >
> > Current usage as of 24 Feb 2021 09:49AM UTC:
> >
> >   Bandwidth: 1.55 GB / 1 GB (155%)
> >   Storage: 0.48 GB / 1 GB (48%)"
> >
> > I wasn't aware of it but it appears that Github has these quota's for t=
he
> > Large File Storage (LFS). I uploaded the files in the git LFS
> > because single files are also limited to 100MiB each on the regular Git
> > repositories.
> >
> > With those strict limits, in my opinion Github isn't really a solution
> > since the bandwidth limit will be reached very quickly. At least for th=
e
> > LFS part that is. I don't know yet if there is any limit for regular
> access.
> >
> > My current ideas:
>
> >   - we can try to just update the URLs to armbian that are working now
> > (with the risk of breaking again in the near future). Ive also found th=
is
> > link, which may be more stable:
> >      https://archive.armbian.com/orangepipc/archive/
>
> Just do this, as it is the simplest option that gets things working. We
> have already spent far too long talking about the problem instead of
> just fixing the URLs.
>
>
> Regards,
> Daniel
> --
> |: https://berrange.com      -o-
> https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-
> https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-
> https://www.instagram.com/dberrange :|
>
>

--=20
Niek Linnenbank

--000000000000d2ea2f05bc2e50fb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Philippe, Thomas, Daniel,</div><div><br></div><div=
>Thank you all. Then I&#39;ll just prepare a new version of the patch that =
uses currently working <a href=3D"http://archive.armbian.com">archive.armbi=
an.com</a> links.</div><div><br></div><div>Kind regards,</div><div>Niek<br>=
</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_=
attr">On Thu, Feb 25, 2021 at 10:46 AM Daniel P. Berrang=C3=A9 &lt;<a href=
=3D"mailto:berrange@redhat.com">berrange@redhat.com</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">On Wed, Feb 24, 2021 at =
09:02:51PM +0100, Niek Linnenbank wrote:<br>
&gt; Hi Philippe, Cleber,<br>
&gt; <br>
&gt; On Wed, Feb 24, 2021 at 8:14 PM Cleber Rosa &lt;<a href=3D"mailto:cros=
a@redhat.com" target=3D"_blank">crosa@redhat.com</a>&gt; wrote:<br>
&gt; <br>
&gt; &gt; On Wed, Feb 24, 2021 at 10:12:10AM +0100, Philippe Mathieu-Daud=
=C3=A9 wrote:<br>
&gt; &gt; &gt; Hi Niek,<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; On 2/23/21 11:53 PM, Niek Linnenbank wrote:<br>
&gt; &gt; &gt; &gt; Currently the automated acceptance tests for the Orange=
 Pi PC and<br>
&gt; &gt; cubieboard<br>
&gt; &gt; &gt; &gt; machines are disabled by default. The tests for both ma=
chines require<br>
&gt; &gt; artifacts<br>
&gt; &gt; &gt; &gt; that are stored on the <a href=3D"http://apt.armbian.co=
m" rel=3D"noreferrer" target=3D"_blank">apt.armbian.com</a> domain. Unfortu=
nately, some of<br>
&gt; &gt; these artifacts<br>
&gt; &gt; &gt; &gt; have been removed from <a href=3D"http://apt.armbian.co=
m" rel=3D"noreferrer" target=3D"_blank">apt.armbian.com</a> and it is uncer=
tain whether<br>
&gt; &gt; more will be removed.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; This commit moves the artifacts previously stored on <a=
 href=3D"http://apt.armbian.com" rel=3D"noreferrer" target=3D"_blank">apt.a=
rmbian.com</a><br>
&gt; &gt; to github<br>
&gt; &gt; &gt; &gt; and retrieves them using the path: &#39;/&lt;machine&gt=
;/&lt;artifact&gt;&#39;.<br>
&gt; &gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Signed-off-by: Niek Linnenbank &lt;<a href=3D"mailto:ni=
eklinnenbank@gmail.com" target=3D"_blank">nieklinnenbank@gmail.com</a>&gt;<=
br>
&gt; &gt; &gt; &gt; Reviewed-by: Willian Rampazzo &lt;<a href=3D"mailto:wil=
lianr@redhat.com" target=3D"_blank">willianr@redhat.com</a>&gt;<br>
&gt; &gt; &gt; &gt; Reviewed-by: Cleber Rosa &lt;<a href=3D"mailto:crosa@re=
dhat.com" target=3D"_blank">crosa@redhat.com</a>&gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; &gt; Tested-by: Cleber Rosa &lt;<a href=3D"mailto:crosa@redh=
at.com" target=3D"_blank">crosa@redhat.com</a>&gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Did Cleber test this new version?<br>
&gt; &gt; &gt;<br>
&gt; &gt;<br>
&gt; <br>
&gt; You&#39;re right, it was the previous version (v1) that Cleber tested =
using my<br>
&gt; own machine URL&#39;s.<br>
&gt; <br>
&gt; I was actually not sure whether I should or should not have added the<=
br>
&gt; Tested-by/Reviewed-by tags in such scenario.<br>
&gt; The content had to be changed due to the outcome of our discussion but=
 also<br>
&gt; I thought I don&#39;t want to silently drop<br>
&gt; the tags since Cleber invested his time into it too.<br>
&gt; <br>
&gt; What should I do here, next time?<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; &gt;<br>
&gt; &gt; Nope, and I&#39;m having issues with those URLs.=C2=A0 For instan=
ce:<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 $ curl -L<br>
&gt; &gt; <a href=3D"https://github.com/nieklinnenbank/QemuArtifacts/raw/ma=
ster/cubieboard/linux-image-dev-sunxi_5.75_armhf.deb" rel=3D"noreferrer" ta=
rget=3D"_blank">https://github.com/nieklinnenbank/QemuArtifacts/raw/master/=
cubieboard/linux-image-dev-sunxi_5.75_armhf.deb</a><br>
&gt; &gt;=C2=A0 =C2=A0 version <a href=3D"https://git-lfs.github.com/spec/v=
1" rel=3D"noreferrer" target=3D"_blank">https://git-lfs.github.com/spec/v1<=
/a><br>
&gt; &gt;=C2=A0 =C2=A0 oid<br>
&gt; &gt; sha256:a4b765c851de76592f55023b1ff4104f7fd29bf90937e6054e0a64fdda=
56380b<br>
&gt; &gt;=C2=A0 =C2=A0 size 20331524<br>
&gt; &gt;<br>
&gt; &gt; Looks like it has to do with GitHub&#39;s behavior wrt quota.<br>
&gt; &gt;<br>
&gt; <br>
&gt; Indeed. Just this morning I received an e-mail from github with the<br=
>
&gt; following text:<br>
&gt; <br>
&gt; &quot;[GitHub] Git LFS disabled for nieklinnenbank<br>
&gt; <br>
&gt; Git LFS has been disabled on your personal account nieklinnenbank beca=
use<br>
&gt; you=E2=80=99ve exceeded your data plan by at least 150%.<br>
&gt; Please purchase additional data packs to cover your bandwidth and stor=
age<br>
&gt; usage:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0<a href=3D"https://github.com/account/billing/data/upgrade=
" rel=3D"noreferrer" target=3D"_blank">https://github.com/account/billing/d=
ata/upgrade</a><br>
&gt; <br>
&gt; Current usage as of 24 Feb 2021 09:49AM UTC:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0Bandwidth: 1.55 GB / 1 GB (155%)<br>
&gt;=C2=A0 =C2=A0Storage: 0.48 GB / 1 GB (48%)&quot;<br>
&gt; <br>
&gt; I wasn&#39;t aware of it but it appears that Github has these quota&#3=
9;s for the<br>
&gt; Large File Storage (LFS). I uploaded the files in the git LFS<br>
&gt; because single files are also limited to 100MiB each on the regular Gi=
t<br>
&gt; repositories.<br>
&gt; <br>
&gt; With those strict limits, in my opinion Github isn&#39;t really a solu=
tion<br>
&gt; since the bandwidth limit will be reached very quickly. At least for t=
he<br>
&gt; LFS part that is. I don&#39;t know yet if there is any limit for regul=
ar access.<br>
&gt; <br>
&gt; My current ideas:<br>
<br>
&gt;=C2=A0 =C2=A0- we can try to just update the URLs to armbian that are w=
orking now<br>
&gt; (with the risk of breaking again in the near future). Ive also found t=
his<br>
&gt; link, which may be more stable:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 <a href=3D"https://archive.armbian.com/orangepipc/=
archive/" rel=3D"noreferrer" target=3D"_blank">https://archive.armbian.com/=
orangepipc/archive/</a><br>
<br>
Just do this, as it is the simplest option that gets things working. We<br>
have already spent far too long talking about the problem instead of<br>
just fixing the URLs.<br>
<br>
<br>
Regards,<br>
Daniel<br>
-- <br>
|: <a href=3D"https://berrange.com" rel=3D"noreferrer" target=3D"_blank">ht=
tps://berrange.com</a>=C2=A0 =C2=A0 =C2=A0 -o-=C2=A0 =C2=A0 <a href=3D"http=
s://www.flickr.com/photos/dberrange" rel=3D"noreferrer" target=3D"_blank">h=
ttps://www.flickr.com/photos/dberrange</a> :|<br>
|: <a href=3D"https://libvirt.org" rel=3D"noreferrer" target=3D"_blank">htt=
ps://libvirt.org</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-o-=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"https://fstop138.berrange.com" rel=3D"n=
oreferrer" target=3D"_blank">https://fstop138.berrange.com</a> :|<br>
|: <a href=3D"https://entangle-photo.org" rel=3D"noreferrer" target=3D"_bla=
nk">https://entangle-photo.org</a>=C2=A0 =C2=A0 -o-=C2=A0 =C2=A0 <a href=3D=
"https://www.instagram.com/dberrange" rel=3D"noreferrer" target=3D"_blank">=
https://www.instagram.com/dberrange</a> :|<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature"><div dir=3D"ltr"><div>Niek Linnenbank<br><br></div></div></=
div>

--000000000000d2ea2f05bc2e50fb--

