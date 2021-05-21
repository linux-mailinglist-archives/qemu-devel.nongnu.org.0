Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D878A38C541
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 12:52:45 +0200 (CEST)
Received: from localhost ([::1]:45080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lk2lo-00057t-UB
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 06:52:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lk2jl-0003bQ-Qp
 for qemu-devel@nongnu.org; Fri, 21 May 2021 06:50:37 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:44706)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lk2jj-0001WK-Ul
 for qemu-devel@nongnu.org; Fri, 21 May 2021 06:50:37 -0400
Received: by mail-ed1-x52c.google.com with SMTP id t15so22828564edr.11
 for <qemu-devel@nongnu.org>; Fri, 21 May 2021 03:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jUKVAlON+TRyg78D+J4utTSwXrgEEE3UtS5N6OuFq7w=;
 b=qFdfkS14f73M+usjgi2UknfNzda8zRN2CSeIf8YsREvNaaKQiJWzuopO4bnNKw2iUA
 +jn6HV/K9YLGa151H8TfIOEk02HDGJBXHcnwMIJKtv9XZW9cBjpaP0wELI3G8LRcnm/w
 ur5qCA94ft/nBMxbIEoNOQBEomhBQG76Xi0YwO4XYMUiTYFN5qQhtjv/M6YHJzB8/uhp
 YaEneelHaTTbod5hcEFs3e0+zf0kx46OXydpE7PuVdr3Yoi+2P1FjqUTxQpHF2OyGG4b
 DbPGNgWDscULIwsAvIKrjli9LpHrS2y3OUlj+ouv131RK7aF+/pWUnhomQ5ji6Mr3ysf
 bUNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jUKVAlON+TRyg78D+J4utTSwXrgEEE3UtS5N6OuFq7w=;
 b=HL3NVr0Ll0dhHnZJw17zDtQ13dVP34dJF4OUhYCh3IBDJrYluWteRMSKTFOOB77/HR
 nud3r53nwhWvusJHVYWez0j5eXWkNxWhfPam6kbR3O/oyJzE2ZeQN+SlZMuyRK5Ooj1V
 rWfi0wRIC1Ee5bGV+zRpKcP97CnWmyeV9gUUy9/jwnmoRa4JCMQDiaU0+J/qk8ddiAKM
 mjHHaQTQA9Lw09zGGjlvP8U47x/AD/vN/xx+AU3UeWQZgsb5dynLOTVFsEeiIb1XdmzJ
 CE2ltoYH4FZ+QLL7lIewnSUkXQ+dK2S6iIZtWVuiUSOxoxIxaqOkOj+swxFFi9LHALue
 UZEA==
X-Gm-Message-State: AOAM531YFVkpplW0aAzwW+qNfsLZ/kroO/OMZb1P+JBEsoB0WAMGH6vm
 TZNjsI34sjXBET1Btqxi/QdPygRxAGUmb2E9oNE=
X-Google-Smtp-Source: ABdhPJzMIScj6o+te9oqnApnWb0e4XvkuQ+Lq5bWJKAac4Thl1srJFlUHQnEU8V57qGGOZW23xbRn9WSvlGhrjkH7/I=
X-Received: by 2002:a05:6402:1d2c:: with SMTP id
 dh12mr7127041edb.237.1621594233743; 
 Fri, 21 May 2021 03:50:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210510132051.2208563-1-kraxel@redhat.com>
 <20210510132051.2208563-13-kraxel@redhat.com>
 <a86e2a07-a803-cd00-849e-96a30e8839d3@redhat.com>
In-Reply-To: <a86e2a07-a803-cd00-849e-96a30e8839d3@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 21 May 2021 14:50:22 +0400
Message-ID: <CAJ+F1C+_wMw4YsiHdOCX-uX-ULnmJ6OSpERuPWsPjByAQnYxZg@mail.gmail.com>
Subject: Re: [PULL 12/25] virtio-gpu: move virgl realize + properties
To: =?UTF-8?B?TWljaGFsIFByw612b3puw61r?= <mprivozn@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000045ac0205c2d4d4cf"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ed1-x52c.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000045ac0205c2d4d4cf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Fri, May 21, 2021 at 1:34 PM Michal Pr=C3=ADvozn=C3=ADk <mprivozn@redhat=
.com>
wrote:

> On 5/10/21 3:20 PM, Gerd Hoffmann wrote:
> > Move device init (realize) and properties.
> >
> > Drop the virgl property, the virtio-gpu-gl-device has virgl enabled no
> > matter what.  Just use virtio-gpu-device instead if you don't want
> > enable virgl and opengl.  This simplifies the logic and reduces the tes=
t
> > matrix.
> >
> > Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> > Message-id: 20210430113547.1816178-1-kraxel@redhat.com
> > Message-Id: <20210430113547.1816178-4-kraxel@redhat.com>
> > ---
> >  include/hw/virtio/virtio-gpu.h |  1 +
> >  hw/display/virtio-gpu-gl.c     | 33 +++++++++++++++++++++++++++++++++
> >  hw/display/virtio-gpu.c        | 23 +----------------------
> >  3 files changed, 35 insertions(+), 22 deletions(-)
> >
>
> > @@ -1251,12 +1236,6 @@ static Property virtio_gpu_properties[] =3D {
> >      VIRTIO_GPU_BASE_PROPERTIES(VirtIOGPU, parent_obj.conf),
> >      DEFINE_PROP_SIZE("max_hostmem", VirtIOGPU, conf_max_hostmem,
> >                       256 * MiB),
> > -#ifdef CONFIG_VIRGL
> > -    DEFINE_PROP_BIT("virgl", VirtIOGPU, parent_obj.conf.flags,
> > -                    VIRTIO_GPU_FLAG_VIRGL_ENABLED, true),
> > -    DEFINE_PROP_BIT("stats", VirtIOGPU, parent_obj.conf.flags,
> > -                    VIRTIO_GPU_FLAG_STATS_ENABLED, false),
> > -#endif
> >      DEFINE_PROP_END_OF_LIST(),
> >  };
> >
> >
>
> Sorry for catching this a bit late, but libvirt is looking for "virgl"
> property when guest XML has 3D acceleration enabled:
>
>     <video>
>       <model type=3D'virtio' heads=3D'1' primary=3D'yes'>
>         <acceleration accel3d=3D'yes'/>
>       </model>
>       <address type=3D'pci' domain=3D'0x0000' bus=3D'0x00' slot=3D'0x02'
> function=3D'0x0'/>
>     </video>
>
> This is the corresponding part of cmd line:
>
>   -device virtio-vga,id=3Dvideo0,virgl=3Don,max_outputs=3D1,bus=3Dpci.0,a=
ddr=3D0x2
>
> The commit message suggests that virtio-gpu-gl-device should be used
> instead. Fair enough, so IIUC the cmd line should be changed to:
>
>   -device virtio-gpu-gl-device,id=3Dvideo0,max_outputs=3D1,bus=3Dpci.0,ad=
dr=3D0x2
>

Should be with virtio-vga-gl instead. And I think virtio-gpu-gl-pci for
secondary devices.

(it's not clear to me if virtio-gpu*-device should be user_creatable on x86
at least)

--=20
Marc-Andr=C3=A9 Lureau

--00000000000045ac0205c2d4d4cf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, May 21, 2021 at 1:34 PM Mic=
hal Pr=C3=ADvozn=C3=ADk &lt;<a href=3D"mailto:mprivozn@redhat.com">mprivozn=
@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">On 5/10/21 3:20 PM, Gerd Hoffmann wrote:<br>
&gt; Move device init (realize) and properties.<br>
&gt; <br>
&gt; Drop the virgl property, the virtio-gpu-gl-device has virgl enabled no=
<br>
&gt; matter what.=C2=A0 Just use virtio-gpu-device instead if you don&#39;t=
 want<br>
&gt; enable virgl and opengl.=C2=A0 This simplifies the logic and reduces t=
he test<br>
&gt; matrix.<br>
&gt; <br>
&gt; Signed-off-by: Gerd Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.com" =
target=3D"_blank">kraxel@redhat.com</a>&gt;<br>
&gt; Message-id: <a href=3D"mailto:20210430113547.1816178-1-kraxel@redhat.c=
om" target=3D"_blank">20210430113547.1816178-1-kraxel@redhat.com</a><br>
&gt; Message-Id: &lt;<a href=3D"mailto:20210430113547.1816178-4-kraxel@redh=
at.com" target=3D"_blank">20210430113547.1816178-4-kraxel@redhat.com</a>&gt=
;<br>
&gt; ---<br>
&gt;=C2=A0 include/hw/virtio/virtio-gpu.h |=C2=A0 1 +<br>
&gt;=C2=A0 hw/display/virtio-gpu-gl.c=C2=A0 =C2=A0 =C2=A0| 33 +++++++++++++=
++++++++++++++++++++<br>
&gt;=C2=A0 hw/display/virtio-gpu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 23 +-------=
---------------<br>
&gt;=C2=A0 3 files changed, 35 insertions(+), 22 deletions(-)<br>
&gt; <br>
<br>
&gt; @@ -1251,12 +1236,6 @@ static Property virtio_gpu_properties[] =3D {<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 VIRTIO_GPU_BASE_PROPERTIES(VirtIOGPU, parent_obj.c=
onf),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 DEFINE_PROP_SIZE(&quot;max_hostmem&quot;, VirtIOGP=
U, conf_max_hostmem,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0256 * MiB),<br>
&gt; -#ifdef CONFIG_VIRGL<br>
&gt; -=C2=A0 =C2=A0 DEFINE_PROP_BIT(&quot;virgl&quot;, VirtIOGPU, parent_ob=
j.conf.flags,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 VIRTIO_GPU_FLAG_VIRGL_ENABLED, true),<br>
&gt; -=C2=A0 =C2=A0 DEFINE_PROP_BIT(&quot;stats&quot;, VirtIOGPU, parent_ob=
j.conf.flags,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 VIRTIO_GPU_FLAG_STATS_ENABLED, false),<br>
&gt; -#endif<br>
&gt;=C2=A0 =C2=A0 =C2=A0 DEFINE_PROP_END_OF_LIST(),<br>
&gt;=C2=A0 };<br>
&gt;=C2=A0 <br>
&gt; <br>
<br>
Sorry for catching this a bit late, but libvirt is looking for &quot;virgl&=
quot;<br>
property when guest XML has 3D acceleration enabled:<br>
<br>
=C2=A0 =C2=A0 &lt;video&gt;<br>
=C2=A0 =C2=A0 =C2=A0 &lt;model type=3D&#39;virtio&#39; heads=3D&#39;1&#39; =
primary=3D&#39;yes&#39;&gt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;acceleration accel3d=3D&#39;yes&#39;/&gt;<b=
r>
=C2=A0 =C2=A0 =C2=A0 &lt;/model&gt;<br>
=C2=A0 =C2=A0 =C2=A0 &lt;address type=3D&#39;pci&#39; domain=3D&#39;0x0000&=
#39; bus=3D&#39;0x00&#39; slot=3D&#39;0x02&#39;<br>
function=3D&#39;0x0&#39;/&gt;<br>
=C2=A0 =C2=A0 &lt;/video&gt;<br>
<br>
This is the corresponding part of cmd line:<br>
<br>
=C2=A0 -device virtio-vga,id=3Dvideo0,virgl=3Don,max_outputs=3D1,bus=3Dpci.=
0,addr=3D0x2<br>
<br>
The commit message suggests that virtio-gpu-gl-device should be used<br>
instead. Fair enough, so IIUC the cmd line should be changed to:<br>
<br>
=C2=A0 -device virtio-gpu-gl-device,id=3Dvideo0,max_outputs=3D1,bus=3Dpci.0=
,addr=3D0x2<br></blockquote><div><br></div><div>Should be with virtio-vga-g=
l instead. And I think virtio-gpu-gl-pci for secondary devices.</div><div><=
br></div><div>(it&#39;s not clear to me if virtio-gpu*-device should be use=
r_creatable on x86 at least)</div><div>=C2=A0</div></div>-- <br><div dir=3D=
"ltr" class=3D"gmail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--00000000000045ac0205c2d4d4cf--

