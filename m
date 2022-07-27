Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12B8B5822E8
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 11:17:14 +0200 (CEST)
Received: from localhost ([::1]:38844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGdAG-0002ZY-Ra
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 05:17:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1oGd4j-0007QE-I5
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 05:11:29 -0400
Received: from mail-ua1-x92c.google.com ([2607:f8b0:4864:20::92c]:39890)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1oGd4h-0000RB-4n
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 05:11:29 -0400
Received: by mail-ua1-x92c.google.com with SMTP id c19so1414553uat.6
 for <qemu-devel@nongnu.org>; Wed, 27 Jul 2022 02:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc;
 bh=04m2rcn/nvfZv9Y8PqJ//gcpYfMN7BBq/yuseDwFZhM=;
 b=Bpc3QYN/nBnrS/cOnKXukTkqTcH4ggc6RVDGic/freczfAe/wiJDSxO97nmHDUGc7g
 ADwR9ZOp6XwWG+DS/QWkFI61aUbe2aLfxD2ZyNQhKC7t8PaEFeqjaHBSfHBeqhdcRE4C
 2uU9hxXVf0oU582EE2j9Rzvf60RBwn5qnxst52n1f+eg4RRd4PCCw5ejxVfMrqu5RkKX
 qoCL9eOhAn/4YbrloMuKrTtTAb5TT2ei/L99vXWMCabWCeAzq36m+kgdokhG9HvVmkjh
 xwgZMirnUPASCX3d5sDUxEOpXmxKLL7kn0a1Padr2w8oaA75Ve2QUglyWLzaWRSRKHfx
 3k0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=04m2rcn/nvfZv9Y8PqJ//gcpYfMN7BBq/yuseDwFZhM=;
 b=QnqwMoUQ8TD6/mcQhr2ET8R1bHU4cUkqdo/yQb8OVRs0l5C5QplUsC0kAdoU5DiFqa
 O1xYLe/4Dbwsqqn7XYJRVbDd9veV4ytBY4Jw23GHE5eDzje3S6qa9j2Sw/5disO00ufi
 np5BAcMlB/x+J4L3qjZtxgFlIoCpWTAfxqrwYHu+RnNRxUMGdWyD/8E6ALueoitL9LoB
 emrgXE/jOINKpOrzrtWoKRSFuI6wI/3Sx0k1/AFOllFo+vL5aHW47SKKH+jKnhYv7c8R
 26mFxHD0UrEYeDlnprgl+EMWLLa5zfvYVr1Vg5iBA6FWZpmDO0QlXnxR3n724J5PCT6g
 KK7Q==
X-Gm-Message-State: AJIora+jljiYoIItD9rN9Z1CmtqKiV9C8dALZcLACNMMkiYZWmOZ7Ahe
 DoLi//Cs+EL+tV8j9xwY4RONuktVZn5zKkIaQac=
X-Google-Smtp-Source: AGRyM1tG8LWlt+Fxg/hM3TAFia033XFsNkdMs/EARJT7FSwFPPdj+efiOEWnM4BajPVtHjtlczCfuTkKV4Zz1iAgZqc=
X-Received: by 2002:a9f:37e4:0:b0:383:57a9:5757 with SMTP id
 q91-20020a9f37e4000000b0038357a95757mr6399840uaq.0.1658913085853; Wed, 27 Jul
 2022 02:11:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220725123000.807608-1-bmeng.cn@gmail.com>
 <874jz5i9qr.fsf@linaro.org>
 <CAEUhbmWBaCrODGY_KMncAmTy53gmid4R=OKDMTi1T1fR0PUBMw@mail.gmail.com>
 <CAEUhbmWkVfjEgkg6uQ8cVVO7ipdiKuKeuco+fGNQ4zZdCnrA4Q@mail.gmail.com>
 <YuD9YuSbmCbzo9kB@redhat.com>
 <d90aa096-352a-fce4-4931-523cbea406d3@redhat.com>
In-Reply-To: <d90aa096-352a-fce4-4931-523cbea406d3@redhat.com>
From: =?UTF-8?B?572X5YuH5YiaKFlvbmdnYW5nIEx1byk=?= <luoyonggang@gmail.com>
Date: Wed, 27 Jul 2022 17:11:14 +0800
Message-ID: <CAE2XoE-A5S=P0nCzPvi4cxKnT3oG1kbxfNfHaBaj58xh=9pmiw@mail.gmail.com>
Subject: Re: [PATCH] .gitlab-ci.d/windows.yml: Enable native Windows symlink
To: Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bin Meng <bin.meng@windriver.com>
Content-Type: multipart/alternative; boundary="00000000000032194605e4c5cde1"
Received-SPF: pass client-ip=2607:f8b0:4864:20::92c;
 envelope-from=luoyonggang@gmail.com; helo=mail-ua1-x92c.google.com
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
Reply-To: luoyonggang@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000032194605e4c5cde1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I've seen the cirrus ci always succeed, maybe using cirrus instead?

On Wed, Jul 27, 2022 at 5:03 PM Thomas Huth <thuth@redhat.com> wrote:
>
> On 27/07/2022 10.54, Daniel P. Berrang=C3=A9 wrote:
> > On Wed, Jul 27, 2022 at 02:02:48PM +0800, Bin Meng wrote:
> >> On Tue, Jul 26, 2022 at 9:38 AM Bin Meng <bmeng.cn@gmail.com> wrote:
> >>>
> >>> On Mon, Jul 25, 2022 at 9:48 PM Alex Benn=C3=A9e <alex.bennee@linaro.=
org>
wrote:
> >>>>
> >>>>
> >>>> Bin Meng <bmeng.cn@gmail.com> writes:
> >>>>
> >>>>> From: Bin Meng <bin.meng@windriver.com>
> >>>>>
> >>>>> The following error message was seen during the configure:
> >>>>>
> >>>>>    "ln: failed to create symbolic link
> >>>>>    'x86_64-softmmu/qemu-system-x86_64.exe': No such file or
directory"
> >>>>>
> >>>>> By default the MSYS environment variable is not defined, so the
runtime
> >>>>> behavior of winsymlinks is: if <target> does not exist, 'ln -s'
fails.
> >>>>> At the configure phase, the qemu-system-x86_64.exe has not been
built
> >>>>> so creation of the symbolic link fails hence the error message.
> >>>>>
> >>>>> Set winsymlinks to 'native' whose behavior is most similar to the
> >>>>> behavior of 'ln -s' on *nix, that is:
> >>>>>
> >>>>>    a) if native symlinks are enabled, and whether <target> exists
> >>>>>       or not, creates <destination> as a native Windows symlink;
> >>>>>    b) else if native symlinks are not enabled, and whether <target>
> >>>>>       exists or not, 'ln -s' creates as a Windows shortcut file.
> >>>>>
> >>>>> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> >>>>
> >>>> I'm still seeing Windows build failures such as:
> >>>>
> >>>>    https://gitlab.com/stsquad/qemu/-/jobs/2765579269
> >>>
> >>> I've seen this one before. Looks like this one can be easily
reproduced.
> >>>
> >>>>
> >>>> and
> >>>>
> >>>>    https://gitlab.com/stsquad/qemu/-/jobs/2765579267
> >>>
> >>> This one seems to be a random failure?
> >>>
> >>
> >> Saw another random failure today in the msys2-32bit build in CI.
> >>
> >> [313/1788] Generating texture-blit-vert.h with a custom command
> >> (wrapped by meson to capture output)
> >> FAILED: ui/shader/texture-blit-vert.h
> >> "C:/GitLab-Runner/builds/lbmeng/qemu/msys64/mingw32/bin/python3.exe"
> >> "C:/GitLab-Runner/builds/lbmeng/qemu/meson/meson.py" "--internal"
> >> "exe" "--capture" "ui/shader/texture-blit-vert.h" "--" "perl"
> >> "C:/GitLab-Runner/builds/lbmeng/qemu/scripts/shaderinclude.pl"
> >> "../ui/shader/texture-blit.vert"
> >> [314/1788] Generating texture-blit-flip-vert.h with a custom command
> >> (wrapped by meson to capture output)
> >> ninja: build stopped: subcommand failed.
> >> make: *** [Makefile:162: run-ninja] Error 1
> >
> > IMHO we need to just drop the msys jobs from GitLab. They are too
> > unreliable and causing frequent failed pipelines.
>
> IIRC they were working way more reliable 'till two or three months ago?
> Maybe this was introduced by the bump to the newest level of MSYS2 in
commit
> 5c570ef2f154 ? Maybe we should upgrade or downgrade the MSYS2 version
again?
>
>   Thomas
>


--
         =E6=AD=A4=E8=87=B4
=E7=A4=BC
=E7=BD=97=E5=8B=87=E5=88=9A
Yours
    sincerely,
Yonggang Luo

--00000000000032194605e4c5cde1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I&#39;ve seen the cirrus ci always succeed, maybe using ci=
rrus instead?<br><br>On Wed, Jul 27, 2022 at 5:03 PM Thomas Huth &lt;<a hre=
f=3D"mailto:thuth@redhat.com">thuth@redhat.com</a>&gt; wrote:<br>&gt;<br>&g=
t; On 27/07/2022 10.54, Daniel P. Berrang=C3=A9 wrote:<br>&gt; &gt; On Wed,=
 Jul 27, 2022 at 02:02:48PM +0800, Bin Meng wrote:<br>&gt; &gt;&gt; On Tue,=
 Jul 26, 2022 at 9:38 AM Bin Meng &lt;<a href=3D"mailto:bmeng.cn@gmail.com"=
>bmeng.cn@gmail.com</a>&gt; wrote:<br>&gt; &gt;&gt;&gt;<br>&gt; &gt;&gt;&gt=
; On Mon, Jul 25, 2022 at 9:48 PM Alex Benn=C3=A9e &lt;<a href=3D"mailto:al=
ex.bennee@linaro.org">alex.bennee@linaro.org</a>&gt; wrote:<br>&gt; &gt;&gt=
;&gt;&gt;<br>&gt; &gt;&gt;&gt;&gt;<br>&gt; &gt;&gt;&gt;&gt; Bin Meng &lt;<a=
 href=3D"mailto:bmeng.cn@gmail.com">bmeng.cn@gmail.com</a>&gt; writes:<br>&=
gt; &gt;&gt;&gt;&gt;<br>&gt; &gt;&gt;&gt;&gt;&gt; From: Bin Meng &lt;<a hre=
f=3D"mailto:bin.meng@windriver.com">bin.meng@windriver.com</a>&gt;<br>&gt; =
&gt;&gt;&gt;&gt;&gt;<br>&gt; &gt;&gt;&gt;&gt;&gt; The following error messa=
ge was seen during the configure:<br>&gt; &gt;&gt;&gt;&gt;&gt;<br>&gt; &gt;=
&gt;&gt;&gt;&gt; =C2=A0 =C2=A0&quot;ln: failed to create symbolic link<br>&=
gt; &gt;&gt;&gt;&gt;&gt; =C2=A0 =C2=A0&#39;x86_64-softmmu/qemu-system-x86_6=
4.exe&#39;: No such file or directory&quot;<br>&gt; &gt;&gt;&gt;&gt;&gt;<br=
>&gt; &gt;&gt;&gt;&gt;&gt; By default the MSYS environment variable is not =
defined, so the runtime<br>&gt; &gt;&gt;&gt;&gt;&gt; behavior of winsymlink=
s is: if &lt;target&gt; does not exist, &#39;ln -s&#39; fails.<br>&gt; &gt;=
&gt;&gt;&gt;&gt; At the configure phase, the qemu-system-x86_64.exe has not=
 been built<br>&gt; &gt;&gt;&gt;&gt;&gt; so creation of the symbolic link f=
ails hence the error message.<br>&gt; &gt;&gt;&gt;&gt;&gt;<br>&gt; &gt;&gt;=
&gt;&gt;&gt; Set winsymlinks to &#39;native&#39; whose behavior is most sim=
ilar to the<br>&gt; &gt;&gt;&gt;&gt;&gt; behavior of &#39;ln -s&#39; on *ni=
x, that is:<br>&gt; &gt;&gt;&gt;&gt;&gt;<br>&gt; &gt;&gt;&gt;&gt;&gt; =C2=
=A0 =C2=A0a) if native symlinks are enabled, and whether &lt;target&gt; exi=
sts<br>&gt; &gt;&gt;&gt;&gt;&gt; =C2=A0 =C2=A0 =C2=A0 or not, creates &lt;d=
estination&gt; as a native Windows symlink;<br>&gt; &gt;&gt;&gt;&gt;&gt; =
=C2=A0 =C2=A0b) else if native symlinks are not enabled, and whether &lt;ta=
rget&gt;<br>&gt; &gt;&gt;&gt;&gt;&gt; =C2=A0 =C2=A0 =C2=A0 exists or not, &=
#39;ln -s&#39; creates as a Windows shortcut file.<br>&gt; &gt;&gt;&gt;&gt;=
&gt;<br>&gt; &gt;&gt;&gt;&gt;&gt; Signed-off-by: Bin Meng &lt;<a href=3D"ma=
ilto:bin.meng@windriver.com">bin.meng@windriver.com</a>&gt;<br>&gt; &gt;&gt=
;&gt;&gt;<br>&gt; &gt;&gt;&gt;&gt; I&#39;m still seeing Windows build failu=
res such as:<br>&gt; &gt;&gt;&gt;&gt;<br>&gt; &gt;&gt;&gt;&gt; =C2=A0 =C2=
=A0<a href=3D"https://gitlab.com/stsquad/qemu/-/jobs/2765579269">https://gi=
tlab.com/stsquad/qemu/-/jobs/2765579269</a><br>&gt; &gt;&gt;&gt;<br>&gt; &g=
t;&gt;&gt; I&#39;ve seen this one before. Looks like this one can be easily=
 reproduced.<br>&gt; &gt;&gt;&gt;<br>&gt; &gt;&gt;&gt;&gt;<br>&gt; &gt;&gt;=
&gt;&gt; and<br>&gt; &gt;&gt;&gt;&gt;<br>&gt; &gt;&gt;&gt;&gt; =C2=A0 =C2=
=A0<a href=3D"https://gitlab.com/stsquad/qemu/-/jobs/2765579267">https://gi=
tlab.com/stsquad/qemu/-/jobs/2765579267</a><br>&gt; &gt;&gt;&gt;<br>&gt; &g=
t;&gt;&gt; This one seems to be a random failure?<br>&gt; &gt;&gt;&gt;<br>&=
gt; &gt;&gt;<br>&gt; &gt;&gt; Saw another random failure today in the msys2=
-32bit build in CI.<br>&gt; &gt;&gt;<br>&gt; &gt;&gt; [313/1788] Generating=
 texture-blit-vert.h with a custom command<br>&gt; &gt;&gt; (wrapped by mes=
on to capture output)<br>&gt; &gt;&gt; FAILED: ui/shader/texture-blit-vert.=
h<br>&gt; &gt;&gt; &quot;C:/GitLab-Runner/builds/lbmeng/qemu/msys64/mingw32=
/bin/python3.exe&quot;<br>&gt; &gt;&gt; &quot;C:/GitLab-Runner/builds/lbmen=
g/qemu/meson/meson.py&quot; &quot;--internal&quot;<br>&gt; &gt;&gt; &quot;e=
xe&quot; &quot;--capture&quot; &quot;ui/shader/texture-blit-vert.h&quot; &q=
uot;--&quot; &quot;perl&quot;<br>&gt; &gt;&gt; &quot;C:/GitLab-Runner/build=
s/lbmeng/qemu/scripts/<a href=3D"http://shaderinclude.pl">shaderinclude.pl<=
/a>&quot;<br>&gt; &gt;&gt; &quot;../ui/shader/texture-blit.vert&quot;<br>&g=
t; &gt;&gt; [314/1788] Generating texture-blit-flip-vert.h with a custom co=
mmand<br>&gt; &gt;&gt; (wrapped by meson to capture output)<br>&gt; &gt;&gt=
; ninja: build stopped: subcommand failed.<br>&gt; &gt;&gt; make: *** [Make=
file:162: run-ninja] Error 1<br>&gt; &gt;<br>&gt; &gt; IMHO we need to just=
 drop the msys jobs from GitLab. They are too<br>&gt; &gt; unreliable and c=
ausing frequent failed pipelines.<br>&gt;<br>&gt; IIRC they were working wa=
y more reliable &#39;till two or three months ago?<br>&gt; Maybe this was i=
ntroduced by the bump to the newest level of MSYS2 in commit<br>&gt; 5c570e=
f2f154 ? Maybe we should upgrade or downgrade the MSYS2 version again?<br>&=
gt;<br>&gt; =C2=A0 Thomas<br>&gt;<br><br><br>--<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0=E6=AD=A4=E8=87=B4<br>=E7=A4=BC<br>=E7=BD=97=E5=8B=87=E5=88=9A<br=
>Yours<br>=C2=A0 =C2=A0 sincerely,<br>Yonggang Luo</div>

--00000000000032194605e4c5cde1--

