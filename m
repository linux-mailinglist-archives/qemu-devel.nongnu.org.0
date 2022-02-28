Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 320904C6E9C
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 14:52:46 +0100 (CET)
Received: from localhost ([::1]:53740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOgSD-0004YQ-9b
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 08:52:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nOgJY-0004Js-1C
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 08:43:48 -0500
Received: from [2a00:1450:4864:20::233] (port=44880
 helo=mail-lj1-x233.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nOgJW-00067O-9f
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 08:43:47 -0500
Received: by mail-lj1-x233.google.com with SMTP id f11so17420311ljq.11
 for <qemu-devel@nongnu.org>; Mon, 28 Feb 2022 05:43:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rANkiUGatzm7KD1uC8GnYsFDx3/dvoEcIIorcJ4WmbA=;
 b=fGSMm5T2Ewx2e0Wmy2IWVWMBp6uU6dkptiiy5uM9uh6voElAV600/sUpn4nEMxWXNa
 0r6nQKU0qtQdfJF8foxONfrsz7AjLFhMKOeSlPaabAXXMCsYDJplUnOg57FFh5zFkuYD
 swc69NN1W11uC9zy2t5+xmaqg5UeVaWV+6i/RTB/0q+zpHQzCwYiehhbk/vt1EDUx9g7
 GUA8BPQRMf1SuZmO4VR+qaoFTz3I+ZXK9hsTt/1mwG0FfqJfmf/yDk2Eb5/TRrCJ3BlE
 CXZA+I4VgSWByASv1QXTRUSz2PUb/EthXjl/PRvZXKk1oVqRKefK4XEqB7gCCk/G1hp8
 YD4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rANkiUGatzm7KD1uC8GnYsFDx3/dvoEcIIorcJ4WmbA=;
 b=GP3lbmQNfLI+pMvf/yKe0jHRyq5LpfYWs+8YBSzyn2qN7KUjgkCgDeQz9pObYVgQHE
 Wbdim4MnDDMNCPaE3lOLWxdd2FVC0rH8eALX1ABx7VEpGuLv0qEeAOTjR+rELVcpC/P+
 83xq+QoOCv6vb6x36/ofWgJEpzI3BHVBMsIxBd+Oz25CDkKamP0ddxXs+SIaxhM3uX8P
 4DhnlTwP4MLIEvjGow1GTO7WTtAjdn2WwC1s7Omrr6wPOvQyyrnxv3MHpPfSZ2JFs45o
 Okif4c+8wYkhvOelld23OaNKzi6SWaBnt9Z35T++cDPfYTSWmDxt28cW6/TXhT7Qb2UQ
 F4Wg==
X-Gm-Message-State: AOAM5326oocjHh1CRlNRfK1penNpfxrss0LsBlMpd63X+oVOPPK3qpf9
 +0ErkX52sLP8Qy0n3IbqNZyyrIbn15/RzzM1jus=
X-Google-Smtp-Source: ABdhPJwEHLdafiCukboEgcw7ZRmRXabCes8Fs5hzIXidZqM5t7G9WVAfu4lBcUgXrpCg2ox9so7V9XRiAEMAzbG4aM0=
X-Received: by 2002:a2e:a4b4:0:b0:246:2930:53d7 with SMTP id
 g20-20020a2ea4b4000000b00246293053d7mr13813617ljm.74.1646055824605; Mon, 28
 Feb 2022 05:43:44 -0800 (PST)
MIME-Version: 1.0
References: <20220227223522.91937-1-wwcohen@gmail.com>
 <20220227223522.91937-12-wwcohen@gmail.com>
 <2695789.GFM3nsWq8U@silver>
In-Reply-To: <2695789.GFM3nsWq8U@silver>
From: Will Cohen <wwcohen@gmail.com>
Date: Mon, 28 Feb 2022 08:43:33 -0500
Message-ID: <CAB26zV3wxzz4xana+MKpicVGyFg18sm7Ps8pgSdPcxO6-N8Dyg@mail.gmail.com>
Subject: Re: [PATCH v9 11/11] 9p: darwin: meson: Allow VirtFS on Darwin
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Content-Type: multipart/alternative; boundary="000000000000b4c5be05d9143c2b"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::233
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::233;
 envelope-from=wwcohen@gmail.com; helo=mail-lj1-x233.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Keno Fischer <keno@juliacomputing.com>,
 Michael Roitzsch <reactorcontrol@icloud.com>,
 Paolo Bonzini <pbonzini@redhat.com>, hi@alyssa.is
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000b4c5be05d9143c2b
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 28, 2022 at 8:11 AM Christian Schoenebeck <
qemu_oss@crudebyte.com> wrote:

> On Sonntag, 27. Februar 2022 23:35:22 CET Will Cohen wrote:
> > From: Keno Fischer <keno@juliacomputing.com>
> >
> > To allow VirtFS on darwin, we need to check that pthread_fchdir_np is
> > available, which has only been available since macOS 10.12.
> >
> > Additionally, virtfs_proxy_helper is disabled on Darwin. This patch
> > series does not currently provide an implementation of the proxy-helper,
> > but this functionality could be implemented later on.
> >
> > Signed-off-by: Keno Fischer <keno@juliacomputing.com>
> > [Michael Roitzsch: - Rebase for NixOS]
> > Signed-off-by: Michael Roitzsch <reactorcontrol@icloud.com>
> > [Will Cohen: - Rebase to master]
> > Signed-off-by: Will Cohen <wwcohen@gmail.com>
> > Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
>
> Paolo, could you have a look at this patch, please? It has changed quite a
> bit
> since your review.
>
> Best regards,
> Christian Schoenebeck


Yes. I probably should have noted that in the cover letter. The code style
itself totally changed in this last version as well, but now conforms to
the other changes made to HEAD during this last rebase.


>
> > [Will Cohen: - Add check for pthread_fchdir_np to virtfs
> >              - Add comments to patch commit
> >              - Note that virtfs_proxy_helper does not work
> >                on macOS
> >              - Fully adjust meson virtfs error note to specify
> >                macOS
> >              - Rebase to master]
> > Signed-off-by: Will Cohen <wwcohen@gmail.com>
> > ---
> >  fsdev/meson.build |  1 +
> >  meson.build       | 12 +++++++-----
> >  2 files changed, 8 insertions(+), 5 deletions(-)
> >
> > diff --git a/fsdev/meson.build b/fsdev/meson.build
> > index adf57cc43e..b632b66348 100644
> > --- a/fsdev/meson.build
> > +++ b/fsdev/meson.build
> > @@ -7,6 +7,7 @@ fsdev_ss.add(when: ['CONFIG_FSDEV_9P'], if_true: files(
> >    'qemu-fsdev.c',
> >  ), if_false: files('qemu-fsdev-dummy.c'))
> >  softmmu_ss.add_all(when: 'CONFIG_LINUX', if_true: fsdev_ss)
> > +softmmu_ss.add_all(when: 'CONFIG_DARWIN', if_true: fsdev_ss)
> >
> >  if have_virtfs_proxy_helper
> >    executable('virtfs-proxy-helper',
> > diff --git a/meson.build b/meson.build
> > index 3f8dca2c7a..ba52ed9e9a 100644
> > --- a/meson.build
> > +++ b/meson.build
> > @@ -1450,14 +1450,16 @@ dbus_display = get_option('dbus_display') \
> >    .allowed()
> >
> >  have_virtfs = get_option('virtfs') \
> > -    .require(targetos == 'linux',
> > -             error_message: 'virtio-9p (virtfs) requires Linux') \
> > -    .require(libattr.found() and libcap_ng.found(),
> > -             error_message: 'virtio-9p (virtfs) requires
> libcap-ng-devel and libattr-devel') \
> > +    .require(targetos == 'linux' or targetos == 'darwin',
> > +             error_message: 'virtio-9p (virtfs) requires Linux or
> macOS') \
> > +    .require(targetos == 'linux' or
> cc.has_function('pthread_fchdir_np'),
> > +             error_message: 'virtio-9p (virtfs) on macOS requires the
> presence of pthread_fchdir_np') \
> > +    .require(targetos == 'darwin' or (libattr.found() and
> libcap_ng.found()),
> > +             error_message: 'virtio-9p (virtfs) on Linux requires
> libcap-ng-devel and libattr-devel') \
> >      .disable_auto_if(not have_tools and not have_system) \
> >      .allowed()
> >
> > -have_virtfs_proxy_helper = have_virtfs and have_tools
> > +have_virtfs_proxy_helper = targetos != 'darwin' and have_virtfs and
> have_tools
> >
> >  foreach k : get_option('trace_backends')
> >    config_host_data.set('CONFIG_TRACE_' + k.to_upper(), true)
>
>
>

--000000000000b4c5be05d9143c2b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div>On Mon, Feb 28, 2022 at 8:11 AM Christian Schoenebeck &lt;<a href=3D"m=
ailto:qemu_oss@crudebyte.com">qemu_oss@crudebyte.com</a>&gt; wrote:<br></di=
v><div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;=
padding-left:1ex;border-left-color:rgb(204,204,204)">On Sonntag, 27. Februa=
r 2022 23:35:22 CET Will Cohen wrote:<br>
&gt; From: Keno Fischer &lt;<a href=3D"mailto:keno@juliacomputing.com" targ=
et=3D"_blank">keno@juliacomputing.com</a>&gt;<br>
&gt; <br>
&gt; To allow VirtFS on darwin, we need to check that pthread_fchdir_np is<=
br>
&gt; available, which has only been available since macOS 10.12.<br>
&gt; <br>
&gt; Additionally, virtfs_proxy_helper is disabled on Darwin. This patch<br=
>
&gt; series does not currently provide an implementation of the proxy-helpe=
r,<br>
&gt; but this functionality could be implemented later on.<br>
&gt; <br>
&gt; Signed-off-by: Keno Fischer &lt;<a href=3D"mailto:keno@juliacomputing.=
com" target=3D"_blank">keno@juliacomputing.com</a>&gt;<br>
&gt; [Michael Roitzsch: - Rebase for NixOS]<br>
&gt; Signed-off-by: Michael Roitzsch &lt;<a href=3D"mailto:reactorcontrol@i=
cloud.com" target=3D"_blank">reactorcontrol@icloud.com</a>&gt;<br>
&gt; [Will Cohen: - Rebase to master]<br>
&gt; Signed-off-by: Will Cohen &lt;<a href=3D"mailto:wwcohen@gmail.com" tar=
get=3D"_blank">wwcohen@gmail.com</a>&gt;<br>
&gt; Reviewed-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" =
target=3D"_blank">pbonzini@redhat.com</a>&gt;<br>
<br>
Paolo, could you have a look at this patch, please? It has changed quite a =
bit<br>
since your review.<br>
<br>
Best regards,<br>
Christian Schoenebeck</blockquote><div dir=3D"auto"><br></div><div dir=3D"a=
uto">Yes. I probably should have noted that in the cover letter. The code s=
tyle itself totally changed in this last version as well, but now conforms =
to the other changes made to HEAD during this last rebase.</div><div dir=3D=
"auto"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;bo=
rder-left-color:rgb(204,204,204)" dir=3D"auto"><br>
<br>
&gt; [Will Cohen: - Add check for pthread_fchdir_np to virtfs<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - Add comments to patc=
h commit<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - Note that virtfs_pro=
xy_helper does not work<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 on macOS<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - Fully adjust meson v=
irtfs error note to specify<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 macOS<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 - Rebase to master]<br=
>
&gt; Signed-off-by: Will Cohen &lt;<a href=3D"mailto:wwcohen@gmail.com" tar=
get=3D"_blank">wwcohen@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 fsdev/meson.build |=C2=A0 1 +<br>
&gt;=C2=A0 meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0| 12 +++++++-----<br>
&gt;=C2=A0 2 files changed, 8 insertions(+), 5 deletions(-)<br>
&gt; <br>
&gt; diff --git a/fsdev/meson.build b/fsdev/meson.build<br>
&gt; index adf57cc43e..b632b66348 100644<br>
&gt; --- a/fsdev/meson.build<br>
&gt; +++ b/fsdev/meson.build<br>
&gt; @@ -7,6 +7,7 @@ fsdev_ss.add(when: [&#39;CONFIG_FSDEV_9P&#39;], if_tru=
e: files(<br>
&gt;=C2=A0 =C2=A0 &#39;qemu-fsdev.c&#39;,<br>
&gt;=C2=A0 ), if_false: files(&#39;qemu-fsdev-dummy.c&#39;))<br>
&gt;=C2=A0 softmmu_ss.add_all(when: &#39;CONFIG_LINUX&#39;, if_true: fsdev_=
ss)<br>
&gt; +softmmu_ss.add_all(when: &#39;CONFIG_DARWIN&#39;, if_true: fsdev_ss)<=
br>
&gt; <br>
&gt;=C2=A0 if have_virtfs_proxy_helper<br>
&gt;=C2=A0 =C2=A0 executable(&#39;virtfs-proxy-helper&#39;,<br>
&gt; diff --git a/meson.build b/meson.build<br>
&gt; index 3f8dca2c7a..ba52ed9e9a 100644<br>
&gt; --- a/meson.build<br>
&gt; +++ b/meson.build<br>
&gt; @@ -1450,14 +1450,16 @@ dbus_display =3D get_option(&#39;dbus_display&=
#39;) \<br>
&gt;=C2=A0 =C2=A0 .allowed()<br>
&gt; <br>
&gt;=C2=A0 have_virtfs =3D get_option(&#39;virtfs&#39;) \<br>
&gt; -=C2=A0 =C2=A0 .require(targetos =3D=3D &#39;linux&#39;,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_message: &#39;v=
irtio-9p (virtfs) requires Linux&#39;) \<br>
&gt; -=C2=A0 =C2=A0 .require(libattr.found() and libcap_ng.found(),<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_message: &#39;v=
irtio-9p (virtfs) requires libcap-ng-devel and libattr-devel&#39;) \<br>
&gt; +=C2=A0 =C2=A0 .require(targetos =3D=3D &#39;linux&#39; or targetos =
=3D=3D &#39;darwin&#39;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_message: &#39;v=
irtio-9p (virtfs) requires Linux or macOS&#39;) \<br>
&gt; +=C2=A0 =C2=A0 .require(targetos =3D=3D &#39;linux&#39; or cc.has_func=
tion(&#39;pthread_fchdir_np&#39;),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_message: &#39;v=
irtio-9p (virtfs) on macOS requires the presence of pthread_fchdir_np&#39;)=
 \<br>
&gt; +=C2=A0 =C2=A0 .require(targetos =3D=3D &#39;darwin&#39; or (libattr.f=
ound() and libcap_ng.found()),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_message: &#39;v=
irtio-9p (virtfs) on Linux requires libcap-ng-devel and libattr-devel&#39;)=
 \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 .disable_auto_if(not have_tools and not have_syste=
m) \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 .allowed()<br>
&gt; <br>
&gt; -have_virtfs_proxy_helper =3D have_virtfs and have_tools<br>
&gt; +have_virtfs_proxy_helper =3D targetos !=3D &#39;darwin&#39; and have_=
virtfs and have_tools<br>
&gt; <br>
&gt;=C2=A0 foreach k : get_option(&#39;trace_backends&#39;)<br>
&gt;=C2=A0 =C2=A0 config_host_data.set(&#39;CONFIG_TRACE_&#39; + k.to_upper=
(), true)<br>
<br>
<br>
</blockquote></div></div>

--000000000000b4c5be05d9143c2b--

