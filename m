Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C501E4D3F5B
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 03:48:30 +0100 (CET)
Received: from localhost ([::1]:55358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nS8qr-0004MI-R6
	for lists+qemu-devel@lfdr.de; Wed, 09 Mar 2022 21:48:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nS8ic-0004Dd-1z
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 21:39:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28212)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nS8ia-00043b-3G
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 21:39:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646879995;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=B/9t/H8DzRMrFanmuGlC+foP651WTUNbxnogvkqKQxo=;
 b=Y8BJ+c/vXVrDPrxPR06hEGQdrbHdvRyGX2KHjG9pNtCOx32Rnj7aMYJNwJQuG66xOxPijq
 D2+jM7YKqWXPrASrbaldtf/ebHA+nlQxQcOzjMj47nsiaWnv5FfOep8Y5b9ynaTXAQV4CI
 2TGHVAM8WwBFpUSMBSJMKWfY/9NIFio=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-589-UHUnPSLPOeCtCxptw9lPCQ-1; Wed, 09 Mar 2022 21:39:54 -0500
X-MC-Unique: UHUnPSLPOeCtCxptw9lPCQ-1
Received: by mail-lf1-f72.google.com with SMTP id
 y23-20020a0565123f1700b00448221b91e5so1370119lfa.13
 for <qemu-devel@nongnu.org>; Wed, 09 Mar 2022 18:39:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=B/9t/H8DzRMrFanmuGlC+foP651WTUNbxnogvkqKQxo=;
 b=IS7Cbv+GRfltOghJBBi4us6cgtbOZbntSbaoa8rdIKxrH2p0K8CbqjkpQ1/5YutJhm
 CvJi+i8RsU3WM/+5DrmKMbzFVBGNEf2iqYeOQ/g3CEhcAK7VC2/82DQBqPdBDn2mf5qZ
 0PlZ9l7hMx7zkf9rhPzU1IBGzJ657rbbeQ0N8KOfeoMOcRMe+PzkKDORv6RoGmcq3aNe
 BNMimN/P6i/GlGzXhUMq3Y9g3ALwKuoa4k2/yENaSi7+WYjqL9uvodEBvmYVCSTuUCeb
 MA3OY158xwCvpkwtz/EecslwSSsXHI4e6UCv00ictJNvxBgTHj+8bFrmh+rjTLrkjf7w
 i0pw==
X-Gm-Message-State: AOAM530tUYWiTE0aA3iK+t6sN/7y/r4CgXuCt10RhtQUEGbb1+XLa5JP
 LMSiQxRx7giFo9o8ntIHQpbwJvCh0IYSZfgbEVJK17Soujyx1HYxRCSiOWsWBFojaWKqajuFOYz
 btFaxzuo5OUMZ8LgiMkQoIL+uDtiocB8=
X-Received: by 2002:a05:6512:3d08:b0:43f:8f45:d670 with SMTP id
 d8-20020a0565123d0800b0043f8f45d670mr1640373lfv.587.1646879992428; 
 Wed, 09 Mar 2022 18:39:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzT55HNQvAQz4iDa2g9CIZ4m8w+wzJZlwYlWf97kPxJ9VyxGS098Y7tmzevGgCEStllLXmdzr7BpVwrGvT8A9Y=
X-Received: by 2002:a05:6512:3d08:b0:43f:8f45:d670 with SMTP id
 d8-20020a0565123d0800b0043f8f45d670mr1640359lfv.587.1646879992121; Wed, 09
 Mar 2022 18:39:52 -0800 (PST)
MIME-Version: 1.0
References: <20220308133451.25378-1-jasowang@redhat.com>
 <CAFEAcA_bvJY5DMe6bibsTaJKW4X-J82PBVYiHHUtKy3s4-ondw@mail.gmail.com>
In-Reply-To: <CAFEAcA_bvJY5DMe6bibsTaJKW4X-J82PBVYiHHUtKy3s4-ondw@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 10 Mar 2022 10:39:40 +0800
Message-ID: <CACGkMEsCV1CK8pk23GAgu6Cee5=JynT7Xm=cQR-PjttjdSbg6A@mail.gmail.com>
Subject: Re: [PULL 00/15] Net patches
To: Peter Maydell <peter.maydell@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000eb387705d9d420ad"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000eb387705d9d420ad
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 10, 2022 at 4:01 AM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Tue, 8 Mar 2022 at 13:35, Jason Wang <jasowang@redhat.com> wrote:
> >
> > The following changes since commit
> f45cc81911adc7726e8a2801986b6998b91b816e:
> >
> >   Merge remote-tracking branch
> 'remotes/cschoenebeck/tags/pull-9p-20220307' into staging (2022-03-08
> 09:06:57 +0000)
> >
> > are available in the git repository at:
> >
> >   https://github.com/jasowang/qemu.git tags/net-pull-request
> >
> > for you to fetch changes up to a10dd1e279fc56cebc7e738925e0db85d0cea089:
> >
> >   vdpa: Expose VHOST_F_LOG_ALL on SVQ (2022-03-08 21:18:41 +0800)
> >
> > ----------------------------------------------------------------
> >
> > ----------------------------------------------------------------
>
> Fails to build:
>
> ../../hw/virtio/vhost-shadow-virtqueue.c: In function 'vhost_svq_start':
> ../../hw/virtio/vhost-shadow-virtqueue.c:537:23: error: implicit
> declaration of function 'qemu_memalign'
> [-Werror=implicit-function-declaration]
>   537 |     svq->vring.desc = qemu_memalign(qemu_real_host_page_size,
> driver_size);
>       |                       ^~~~~~~~~~~~~
> ../../hw/virtio/vhost-shadow-virtqueue.c:537:23: error: nested extern
> declaration of 'qemu_memalign' [-Werror=nested-externs]
> ../../hw/virtio/vhost-shadow-virtqueue.c:537:21: error: assignment to
> 'vring_desc_t *' {aka 'struct vring_desc *'} from 'int' makes pointer
> from i
> nteger without a cast [-Werror=int-conversion]
>   537 |     svq->vring.desc = qemu_memalign(qemu_real_host_page_size,
> driver_size);
>       |                     ^
> ../../hw/virtio/vhost-shadow-virtqueue.c:541:21: error: assignment to
> 'vring_used_t *' {aka 'struct vring_used *'} from 'int' makes pointer
> from i
> nteger without a cast [-Werror=int-conversion]
>   541 |     svq->vring.used = qemu_memalign(qemu_real_host_page_size,
> device_size);
>       |                     ^
> ../../hw/virtio/vhost-shadow-virtqueue.c: In function 'vhost_svq_stop':
> ../../hw/virtio/vhost-shadow-virtqueue.c:579:5: error: implicit
> declaration of function 'qemu_vfree'
> [-Werror=implicit-function-declaration]
>   579 |     qemu_vfree(svq->vring.desc);
>       |     ^~~~~~~~~~
> ../../hw/virtio/vhost-shadow-virtqueue.c:579:5: error: nested extern
> declaration of 'qemu_vfree' [-Werror=nested-externs]
>
>
> qemu_memalign/qemu_vfree have just moved to their own header file;
> you need to rebase and add #include <qemu/memalign.h> in the
> appropriate files.
>

Yes, V2 is sent.

Thanks


>
> thanks
> -- PMM
>
>

--000000000000eb387705d9d420ad
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Mar 10, 2022 at 4:01 AM Peter=
 Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@lina=
ro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">On Tue, 8 Mar 2022 at 13:35, Jason Wang &lt;<a href=3D"mailto:jasowan=
g@redhat.com" target=3D"_blank">jasowang@redhat.com</a>&gt; wrote:<br>
&gt;<br>
&gt; The following changes since commit f45cc81911adc7726e8a2801986b6998b91=
b816e:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0Merge remote-tracking branch &#39;remotes/cschoenebeck/tag=
s/pull-9p-20220307&#39; into staging (2022-03-08 09:06:57 +0000)<br>
&gt;<br>
&gt; are available in the git repository at:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0<a href=3D"https://github.com/jasowang/qemu.git" rel=3D"no=
referrer" target=3D"_blank">https://github.com/jasowang/qemu.git</a> tags/n=
et-pull-request<br>
&gt;<br>
&gt; for you to fetch changes up to a10dd1e279fc56cebc7e738925e0db85d0cea08=
9:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0vdpa: Expose VHOST_F_LOG_ALL on SVQ (2022-03-08 21:18:41 +=
0800)<br>
&gt;<br>
&gt; ----------------------------------------------------------------<br>
&gt;<br>
&gt; ----------------------------------------------------------------<br>
<br>
Fails to build:<br>
<br>
../../hw/virtio/vhost-shadow-virtqueue.c: In function &#39;vhost_svq_start&=
#39;:<br>
../../hw/virtio/vhost-shadow-virtqueue.c:537:23: error: implicit<br>
declaration of function &#39;qemu_memalign&#39;<br>
[-Werror=3Dimplicit-function-declaration]<br>
=C2=A0 537 |=C2=A0 =C2=A0 =C2=A0svq-&gt;vring.desc =3D qemu_memalign(qemu_r=
eal_host_page_size,<br>
driver_size);<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~~~~~~~~~~<br>
../../hw/virtio/vhost-shadow-virtqueue.c:537:23: error: nested extern<br>
declaration of &#39;qemu_memalign&#39; [-Werror=3Dnested-externs]<br>
../../hw/virtio/vhost-shadow-virtqueue.c:537:21: error: assignment to<br>
&#39;vring_desc_t *&#39; {aka &#39;struct vring_desc *&#39;} from &#39;int&=
#39; makes pointer<br>
from i<br>
nteger without a cast [-Werror=3Dint-conversion]<br>
=C2=A0 537 |=C2=A0 =C2=A0 =C2=A0svq-&gt;vring.desc =3D qemu_memalign(qemu_r=
eal_host_page_size,<br>
driver_size);<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0^<br>
../../hw/virtio/vhost-shadow-virtqueue.c:541:21: error: assignment to<br>
&#39;vring_used_t *&#39; {aka &#39;struct vring_used *&#39;} from &#39;int&=
#39; makes pointer<br>
from i<br>
nteger without a cast [-Werror=3Dint-conversion]<br>
=C2=A0 541 |=C2=A0 =C2=A0 =C2=A0svq-&gt;vring.used =3D qemu_memalign(qemu_r=
eal_host_page_size,<br>
device_size);<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0^<br>
../../hw/virtio/vhost-shadow-virtqueue.c: In function &#39;vhost_svq_stop&#=
39;:<br>
../../hw/virtio/vhost-shadow-virtqueue.c:579:5: error: implicit<br>
declaration of function &#39;qemu_vfree&#39;<br>
[-Werror=3Dimplicit-function-declaration]<br>
=C2=A0 579 |=C2=A0 =C2=A0 =C2=A0qemu_vfree(svq-&gt;vring.desc);<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0^~~~~~~~~~<br>
../../hw/virtio/vhost-shadow-virtqueue.c:579:5: error: nested extern<br>
declaration of &#39;qemu_vfree&#39; [-Werror=3Dnested-externs]<br>
<br>
<br>
qemu_memalign/qemu_vfree have just moved to their own header file;<br>
you need to rebase and add #include &lt;qemu/memalign.h&gt; in the<br>
appropriate files.<br></blockquote><div><br></div><div>Yes, V2 is sent.</di=
v><div><br></div><div>Thanks</div><div>=C2=A0</div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">
<br>
thanks<br>
-- PMM<br>
<br>
</blockquote></div></div>

--000000000000eb387705d9d420ad--


