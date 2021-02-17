Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30C3231E181
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 22:36:45 +0100 (CET)
Received: from localhost ([::1]:39926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCUV1-0004WD-V5
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 16:36:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nieklinnenbank@gmail.com>)
 id 1lCTsr-0001Qi-7l; Wed, 17 Feb 2021 15:57:17 -0500
Received: from mail-il1-x12a.google.com ([2607:f8b0:4864:20::12a]:43633)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nieklinnenbank@gmail.com>)
 id 1lCTsn-0008H9-Po; Wed, 17 Feb 2021 15:57:16 -0500
Received: by mail-il1-x12a.google.com with SMTP id q5so12544311ilc.10;
 Wed, 17 Feb 2021 12:57:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=x6b99QgLhF1+Xc4LPO8MubJMGCwTcVTdFVRwq42T1D4=;
 b=D7VO/wBtkTlv0wky+Gsxks6niQAhrc21amx9clr09eoAwGK2wGGb7Xkc2bZl13RK4t
 2ocRsasXwL4U+iz2CAEY14mpwHna9hJMhAVj2EXK15aUPb4/kl/k2RLiPwA1clMyxbBd
 9TJaQzMn0ir6LJcaAPj/KxOy3zXVFcZaroZVvWh6Mw+O7QZKvHZUtQDWYSB0jpiuzldB
 7pYC3Y/P+biBQe/fSuEpAF9Iw2m/fC73C9fQqd1yBj8PibgZpfKE2yn4fRTR+3UyTrRs
 1mI2KmJkicxciRmnshcfo9Qc5vpTJj57vVoA0tzleVv7fAXgO0srlxTiEVNzfZgupcdl
 nWnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=x6b99QgLhF1+Xc4LPO8MubJMGCwTcVTdFVRwq42T1D4=;
 b=fNBCkIXdphQ2RKRDaK8+m7u/2CVJ2OZ0AHLGM+clJvvcxQVAxRkiI8v93TAi6dgFfY
 5sqeF4wTq6ts1fKrh/RvthojlEmbBeCKU9G98kDUL6G5rHoSg7vf+iGzlb3YuW2W/RvT
 xSsSQBFbfwT8pbKhexhWaLic+rW95BpcmvH5YpkPpNERjJuVqictCkRX5q/4dZ3Gw3cj
 +YvcLPv19tm/JeoBkrRLE0GksD1SImSCSsHmvFtcv5U1ZftBqriaNztS+Z7jtLF/Lf+4
 LU96t63+C4bcujRLJibGD474Koummtvwy064/DcJeaLu71CnTlZnLMtD5jGIJR5x29ba
 ZMHg==
X-Gm-Message-State: AOAM533jWFjcgzNCWtfH24tl9WxYid4qwe1vnLZqnCvQJRW1eMBhMVvW
 8HjVx/VWt9CPrgUlFz6YjvdFwrZWrH0C3DXosWQ=
X-Google-Smtp-Source: ABdhPJyQ/Wv28MwIdZkWVyFnWY/PiKFoymJYMixZ4HagA0xLx/47wc3bCymJK2xi4tHxy2doQHJUXhMY32vb5z7Oje8=
X-Received: by 2002:a05:6e02:1544:: with SMTP id
 j4mr784590ilu.67.1613595431570; 
 Wed, 17 Feb 2021 12:57:11 -0800 (PST)
MIME-Version: 1.0
References: <20210211220055.19047-1-nieklinnenbank@gmail.com>
 <e2b0052c-7dd3-36a2-64b7-3d56c23d0a2d@redhat.com>
 <YCuVC4T+TFjuskhF@redhat.com>
In-Reply-To: <YCuVC4T+TFjuskhF@redhat.com>
From: Niek Linnenbank <nieklinnenbank@gmail.com>
Date: Wed, 17 Feb 2021 21:57:00 +0100
Message-ID: <CAPan3Wo+c+4F82cM+UDQu+JH9eQdqL2gjnikXmg3PZKTXCP_jg@mail.gmail.com>
Subject: Re: [PATCH 0/2] Allwinner H3 fixes for EMAC and acceptance tests
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000082934305bb8e7692"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12a;
 envelope-from=nieklinnenbank@gmail.com; helo=mail-il1-x12a.google.com
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
Cc: peter.maydell@linaro.org, Thomas Huth <thuth@redhat.com>,
 Pavel.Dovgaluk@ispras.ru,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 b.galvani@gmail.com, qemu-arm@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, crosa@redhat.com,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000082934305bb8e7692
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Daniel, Philippe,




Op di 16 feb. 2021 10:49 schreef Daniel P. Berrang=C3=A9 <berrange@redhat.c=
om>:

> On Fri, Feb 12, 2021 at 03:10:00PM +0100, Philippe Mathieu-Daud=C3=A9 wro=
te:
> > Hi Niek and QEMU community,
> >
> > On 2/11/21 11:00 PM, Niek Linnenbank wrote:
> > > The following are maintenance patches for the Allwinner H3. The first
> patch
> > > is a proposal to relocate the binary artifacts of the acceptance test=
s
> away
> > > from the apt.armbian.com domain. In the past we had problems with
> artifacts being
> > > removed, and now the recently added Armbian 20.08.1 image has been
> removed as well:
> > >
> > > $ wget
> https://dl.armbian.com/orangepipc/archive/Armbian_20.08.1_Orangepipc_bion=
ic_current_5.8.5.img.xz
> > > Connecting to dl.armbian.com (dl.armbian.com)|2605:7900:20::5|:443...
> connected.
> > > ...
> > > HTTP request sent, awaiting response... 404 Not Found
> > > 2021-02-11 22:34:45 ERROR 404: Not Found.
> > >
> > > I've now added the artifacts to a server maintained by me. The machin=
e
> has a stable
> > > uptime of several years, ~100Mbit bandwidth and plenty of available
> storage.
> > > Also for other artifacts if needed. I'm open to discuss if there is a
> proposal
> > > for a better location for these artifacts or a more generic qemu
> location.
> >
> > Thanks for trying to fix this long standing problem.
> >
> > While this works in your case, this doesn't scale to the community,
> > as not all contributors have access to such hardware and bandwidth /
> > storage.
> >
> > While your first patch is useful in showing where the artifacts are
> > stored doesn't matter - as long as we use cryptographic hashes - I
> > think it is a step in the wrong direction, so I am not keen on
> > accepting it.
> >
> > My personal view is that any contributor should have the same
> > possibilities to add tests to the project. Now I am also open to
> > discuss with the others :) I might be proven wrong, and it could
> > be better to rely on good willing contributors rather than having
> > nothing useful at all.
>
> There aren't many options here
>
>  1. Rely on a vendor to provide stable download URLs for images
>
>  2. QEMU host all images we use in testing
>
>  3. Contributor finds some site to upload images to
>
>
> For the armbian images we rely on (1), but the URLs didn't turn out to be
> stable. In fact no OS vendor seems to have guaranteed stable URLs forever=
,
> regardless of distro, though most eventually do have an archive site that
> has good life. Armbian was an exception in this respect IIUC.
>
> (2) would solve the long term stability problem as QEMU would be in full
> control, and could open it up for any images we need. The big challenge
> there is that QEMU now owns the license compliance problem. Merely
> uploading
> binary images/packages without the corresponding source is generally a
> license
> violation. QEMU could provide hosting, but we need to be clear about the
> fact
> that we now own the license compliance problem ourselves. Many sites
> hosting
> images simply ignore this problem, but that doesn't make it right.
>
>
> This series is proposing (3), with a site the contributor happens to
> control
> themselves, but using a free 3rd party hosting site is no different reall=
y.
> Again there is a the same need for license compliance, but it is now the
> responsibility of the user, not QEMU project.
>
> In this http://www.freenos.org/pub/qemu/cubieboard/ site I can't even see
> a
> directory listing, so even if corresponding source does exist in this
> server,
> I can't find it.
>
> The isn't really a problem for QEMU CI to consume the images, but as a fr=
ee
> software developer I don't like encouraging practices that are not
> compliant
> with licensing reuqirement.
>
> It is an open question whether the (3) is really better than (1) in terms
> of URL stability long term, especially if running off a user's personal
> server.
>

I understand your concerns. My goal here was to be able to re-activate the
orangepi tests, so we can capture bugs early on. So what I can do instead
is:

  - update the patch to use github to store the artifacts, and their
licenses (other tests also use github)
  - or change the patch to use updated armbian links that work (for now)

If we can agree on either of these solutions, so the orangepi tests can be
re-activated, that would be great.

Kind regards,
Niek



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

--00000000000082934305bb8e7692
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hi Daniel, Philippe,<div dir=3D"auto"><br></div><div=
 dir=3D"auto"><br></div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr"=
 class=3D"gmail_attr">Op di 16 feb. 2021 10:49 schreef Daniel P. Berrang=C3=
=A9 &lt;<a href=3D"mailto:berrange@redhat.com">berrange@redhat.com</a>&gt;:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex">On Fri, Feb 12, 2021 at 03:10:00PM=
 +0100, Philippe Mathieu-Daud=C3=A9 wrote:<br>
&gt; Hi Niek and QEMU community,<br>
&gt; <br>
&gt; On 2/11/21 11:00 PM, Niek Linnenbank wrote:<br>
&gt; &gt; The following are maintenance patches for the Allwinner H3. The f=
irst patch<br>
&gt; &gt; is a proposal to relocate the binary artifacts of the acceptance =
tests away<br>
&gt; &gt; from the <a href=3D"http://apt.armbian.com" rel=3D"noreferrer nor=
eferrer" target=3D"_blank">apt.armbian.com</a> domain. In the past we had p=
roblems with artifacts being<br>
&gt; &gt; removed, and now the recently added Armbian 20.08.1 image has bee=
n removed as well:<br>
&gt; &gt; <br>
&gt; &gt; $ wget <a href=3D"https://dl.armbian.com/orangepipc/archive/Armbi=
an_20.08.1_Orangepipc_bionic_current_5.8.5.img.xz" rel=3D"noreferrer norefe=
rrer" target=3D"_blank">https://dl.armbian.com/orangepipc/archive/Armbian_2=
0.08.1_Orangepipc_bionic_current_5.8.5.img.xz</a><br>
&gt; &gt; Connecting to <a href=3D"http://dl.armbian.com" rel=3D"noreferrer=
 noreferrer" target=3D"_blank">dl.armbian.com</a> (<a href=3D"http://dl.arm=
bian.com" rel=3D"noreferrer noreferrer" target=3D"_blank">dl.armbian.com</a=
>)|2605:7900:20::5|:443... connected.<br>
&gt; &gt; ...<br>
&gt; &gt; HTTP request sent, awaiting response... 404 Not Found<br>
&gt; &gt; 2021-02-11 22:34:45 ERROR 404: Not Found.<br>
&gt; &gt; <br>
&gt; &gt; I&#39;ve now added the artifacts to a server maintained by me. Th=
e machine has a stable<br>
&gt; &gt; uptime of several years, ~100Mbit bandwidth and plenty of availab=
le storage.<br>
&gt; &gt; Also for other artifacts if needed. I&#39;m open to discuss if th=
ere is a proposal<br>
&gt; &gt; for a better location for these artifacts or a more generic qemu =
location.<br>
&gt; <br>
&gt; Thanks for trying to fix this long standing problem.<br>
&gt; <br>
&gt; While this works in your case, this doesn&#39;t scale to the community=
,<br>
&gt; as not all contributors have access to such hardware and bandwidth /<b=
r>
&gt; storage.<br>
&gt; <br>
&gt; While your first patch is useful in showing where the artifacts are<br=
>
&gt; stored doesn&#39;t matter - as long as we use cryptographic hashes - I=
<br>
&gt; think it is a step in the wrong direction, so I am not keen on<br>
&gt; accepting it.<br>
&gt; <br>
&gt; My personal view is that any contributor should have the same<br>
&gt; possibilities to add tests to the project. Now I am also open to<br>
&gt; discuss with the others :) I might be proven wrong, and it could<br>
&gt; be better to rely on good willing contributors rather than having<br>
&gt; nothing useful at all.<br>
<br>
There aren&#39;t many options here<br>
<br>
=C2=A01. Rely on a vendor to provide stable download URLs for images<br>
<br>
=C2=A02. QEMU host all images we use in testing<br>
<br>
=C2=A03. Contributor finds some site to upload images to<br>
<br>
<br>
For the armbian images we rely on (1), but the URLs didn&#39;t turn out to =
be<br>
stable. In fact no OS vendor seems to have guaranteed stable URLs forever,<=
br>
regardless of distro, though most eventually do have an archive site that<b=
r>
has good life. Armbian was an exception in this respect IIUC.<br>
<br>
(2) would solve the long term stability problem as QEMU would be in full<br=
>
control, and could open it up for any images we need. The big challenge<br>
there is that QEMU now owns the license compliance problem. Merely uploadin=
g<br>
binary images/packages without the corresponding source is generally a lice=
nse<br>
violation. QEMU could provide hosting, but we need to be clear about the fa=
ct<br>
that we now own the license compliance problem ourselves. Many sites hostin=
g<br>
images simply ignore this problem, but that doesn&#39;t make it right.<br>
<br>
<br>
This series is proposing (3), with a site the contributor happens to contro=
l<br>
themselves, but using a free 3rd party hosting site is no different really.=
<br>
Again there is a the same need for license compliance, but it is now the<br=
>
responsibility of the user, not QEMU project.<br>
<br>
In this <a href=3D"http://www.freenos.org/pub/qemu/cubieboard/" rel=3D"nore=
ferrer noreferrer" target=3D"_blank">http://www.freenos.org/pub/qemu/cubieb=
oard/</a> site I can&#39;t even see a<br>
directory listing, so even if corresponding source does exist in this serve=
r,<br>
I can&#39;t find it. <br>
<br>
The isn&#39;t really a problem for QEMU CI to consume the images, but as a =
free<br>
software developer I don&#39;t like encouraging practices that are not comp=
liant<br>
with licensing reuqirement.<br>
<br>
It is an open question whether the (3) is really better than (1) in terms<b=
r>
of URL stability long term, especially if running off a user&#39;s personal=
<br>
server.<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D=
"auto">I understand your concerns. My goal here was to be able to re-activa=
te the orangepi tests, so we can capture bugs early on. So what I can do in=
stead is:</div><div dir=3D"auto"><br></div><div dir=3D"auto">=C2=A0 - updat=
e the patch to use github to store the artifacts, and their licenses (other=
 tests also use github)</div><div dir=3D"auto">=C2=A0 - or change the patch=
 to use updated armbian links that work (for now)</div><div dir=3D"auto"><b=
r></div><div dir=3D"auto">If we can agree on either of these solutions, so =
the orangepi tests can be re-activated, that would be great.=C2=A0</div><di=
v dir=3D"auto"><br></div><div dir=3D"auto">Kind regards,</div><div dir=3D"a=
uto">Niek</div><div dir=3D"auto"><br></div><div dir=3D"auto"><br></div><div=
 dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
Regards,<br>
Daniel<br>
-- <br>
|: <a href=3D"https://berrange.com" rel=3D"noreferrer noreferrer" target=3D=
"_blank">https://berrange.com</a>=C2=A0 =C2=A0 =C2=A0 -o-=C2=A0 =C2=A0 <a h=
ref=3D"https://www.flickr.com/photos/dberrange" rel=3D"noreferrer noreferre=
r" target=3D"_blank">https://www.flickr.com/photos/dberrange</a> :|<br>
|: <a href=3D"https://libvirt.org" rel=3D"noreferrer noreferrer" target=3D"=
_blank">https://libvirt.org</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-o-=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"https://fstop138.berrange.com=
" rel=3D"noreferrer noreferrer" target=3D"_blank">https://fstop138.berrange=
.com</a> :|<br>
|: <a href=3D"https://entangle-photo.org" rel=3D"noreferrer noreferrer" tar=
get=3D"_blank">https://entangle-photo.org</a>=C2=A0 =C2=A0 -o-=C2=A0 =C2=A0=
 <a href=3D"https://www.instagram.com/dberrange" rel=3D"noreferrer noreferr=
er" target=3D"_blank">https://www.instagram.com/dberrange</a> :|<br>
<br>
</blockquote></div></div></div>

--00000000000082934305bb8e7692--

