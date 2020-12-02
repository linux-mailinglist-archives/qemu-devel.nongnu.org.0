Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 134122CB5BD
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 08:21:51 +0100 (CET)
Received: from localhost ([::1]:51086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkMST-0000BS-BM
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 02:21:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuri.benditovich@daynix.com>)
 id 1kkMNj-00072h-Ll
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 02:16:57 -0500
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:35287)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yuri.benditovich@daynix.com>)
 id 1kkMNY-000239-IP
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 02:16:51 -0500
Received: by mail-oi1-x243.google.com with SMTP id t9so626479oic.2
 for <qemu-devel@nongnu.org>; Tue, 01 Dec 2020 23:16:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sHTrQMW5EzSVXGL3cspKrA6posnwJ79VZ0JyQ2wVbLE=;
 b=p73ZzIk2CsEJg5Fkun+fibcdrJTRdvfheAYgtlLYkt3e89kgx3UyJLoA8Ldi9O3ChX
 7yMfmcQE4ey5W2S30uNJ2Y1JQBPdqUHLfzLGEuMvJ01LjxEPEJ+BRIj6581GgQqGzE4B
 FA0ZXic+GG7uhTuJ71TAsTEApiZbu+RapftceRpIy1EimIOBCzD7dBl2SnVsKt1yr14X
 3cV6Birjq9s9bwtjgIH0t3bHFnVGQHEUsE+VKwJkQD5Jdt/iNmL2rzn/3MyZW0+N56Fm
 4jCz9K8MfFdNBDvcWNi0JygeR0AynIgBo++RS/GtOsWaW+mM17UrkimFV9oHQ+X1OSLI
 aK8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sHTrQMW5EzSVXGL3cspKrA6posnwJ79VZ0JyQ2wVbLE=;
 b=KfzN1QCYOTdxrReVT3TA+al0LG5QpxnevKhS7oXwtyBar8JV3qUlBxZkJ6euSJhPUH
 M0cvWAhSYheH63Kh3g/JJh3ea47DoReX5LsQgpzIgm/0eylhni5GGKj3WvMliaqIpfw1
 fTlxWGesPaIFAqNo3hvmoghw3OC6DaO9tCk+59OEf7XTUWmBZAdZH5AcyFvf6npA/oZb
 ySQLFPvvYhVmGTxWwF/K+FDFprhKl9e/shgUtn+dx6q6n5RLI5N1J3wfGOWP23+mn0kG
 Ia1f+PRMHABYbxxQfb1yKfnIGm5gO0u0hnoygeHZP/azCjjY71Ta7SJAH9SGrm3dboCe
 JFTQ==
X-Gm-Message-State: AOAM532JVLkN90XQK/ydR8Z3q/FH6i9FO/zygQoj2+kiNSzQwh52hRR3
 nBidvmjdEOdMguleI8/w8iuhDtMrwijzarQwJB6kxw==
X-Google-Smtp-Source: ABdhPJzOPSiMo6bbwWezaamARaythifP/LFTXSBIhRGFd5iy2zt+/jE26K1BgWbMnpLU+Ck3KKV03Kk50GQBTFAbNWg=
X-Received: by 2002:aca:1211:: with SMTP id 17mr660935ois.137.1606893402379;
 Tue, 01 Dec 2020 23:16:42 -0800 (PST)
MIME-Version: 1.0
References: <20201119111305.485202-1-andrew@daynix.com>
 <20201119111305.485202-5-andrew@daynix.com>
 <e3c4d907-1901-52ae-5dde-0aea4780cb35@redhat.com>
 <CAOEp5OfmRUpKZ-MNDWP=-TxKkWoAPS=n3eKV989fFiiAsRaZ4w@mail.gmail.com>
 <9b400fa7-a597-ba44-b661-802d8b2d105c@redhat.com>
In-Reply-To: <9b400fa7-a597-ba44-b661-802d8b2d105c@redhat.com>
From: Yuri Benditovich <yuri.benditovich@daynix.com>
Date: Wed, 2 Dec 2020 09:16:30 +0200
Message-ID: <CAOEp5OdYtkasECGopea6byYyWbyaXMcEoWAVaB5sz_z2=zqQow@mail.gmail.com>
Subject: Re: [RFC PATCH v2 4/5] virtio-net: Added eBPF RSS to virtio-net.
To: Jason Wang <jasowang@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000070e72605b57606ea"
Received-SPF: none client-ip=2607:f8b0:4864:20::243;
 envelope-from=yuri.benditovich@daynix.com; helo=mail-oi1-x243.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Yan Vugenfirer <yan@daynix.com>, Andrew Melnychenko <andrew@daynix.com>,
 qemu-devel@nongnu.org, "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000070e72605b57606ea
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 2, 2020 at 6:06 AM Jason Wang <jasowang@redhat.com> wrote:

>
> On 2020/12/1 =E4=B8=8B=E5=8D=883:40, Yuri Benditovich wrote:
> >
> >
> > On Tue, Nov 24, 2020 at 10:49 AM Jason Wang <jasowang@redhat.com
> > <mailto:jasowang@redhat.com>> wrote:
> >
> >
> >     On 2020/11/19 =E4=B8=8B=E5=8D=887:13, Andrew Melnychenko wrote:
> >     > From: Andrew <andrew@daynix.com <mailto:andrew@daynix.com>>
> >     >
> >     > When RSS is enabled the device tries to load the eBPF program
> >     > to select RX virtqueue in the TUN. If eBPF can be loaded
> >     > the RSS will function also with vhost (works with kernel 5.8 and
> >     later).
> >     > Software RSS is used as a fallback with vhost=3Doff when eBPF
> >     can't be loaded
> >     > or when hash population requested by the guest.
> >     >
> >     > Signed-off-by: Yuri Benditovich <yuri.benditovich@daynix.com
> >     <mailto:yuri.benditovich@daynix.com>>
> >     > Signed-off-by: Andrew Melnychenko <andrew@daynix.com
> >     <mailto:andrew@daynix.com>>
> >     > ---
> >     >   hw/net/vhost_net.c             |   2 +
> >     >   hw/net/virtio-net.c            | 120
> >     +++++++++++++++++++++++++++++++--
> >     >   include/hw/virtio/virtio-net.h |   4 ++
> >     >   net/vhost-vdpa.c               |   2 +
> >     >   4 files changed, 124 insertions(+), 4 deletions(-)
> >     >
> >     > diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
> >     > index 24d555e764..16124f99c3 100644
> >     > --- a/hw/net/vhost_net.c
> >     > +++ b/hw/net/vhost_net.c
> >     > @@ -71,6 +71,8 @@ static const int user_feature_bits[] =3D {
> >     >       VIRTIO_NET_F_MTU,
> >     >       VIRTIO_F_IOMMU_PLATFORM,
> >     >       VIRTIO_F_RING_PACKED,
> >     > +    VIRTIO_NET_F_RSS,
> >     > +    VIRTIO_NET_F_HASH_REPORT,
> >     >
> >     >       /* This bit implies RARP isn't sent by QEMU out of band */
> >     >       VIRTIO_NET_F_GUEST_ANNOUNCE,
> >     > diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> >     > index 277289d56e..afcc3032ec 100644
> >     > --- a/hw/net/virtio-net.c
> >     > +++ b/hw/net/virtio-net.c
> >     > @@ -698,6 +698,19 @@ static void virtio_net_set_queues(VirtIONet
> *n)
> >     >
> >     >   static void virtio_net_set_multiqueue(VirtIONet *n, int
> >     multiqueue);
> >     >
> >     > +static uint64_t fix_ebpf_vhost_features(uint64_t features)
> >     > +{
> >     > +    /* If vhost=3Don & CONFIG_EBPF doesn't set - disable RSS
> >     feature */
> >     > +    uint64_t ret =3D features;
> >     > +#ifndef CONFIG_EBPF
> >     > +    virtio_clear_feature(&ret, VIRTIO_NET_F_RSS);
> >     > +#endif
> >     > +    /* for now, there is no solution for populating the hash
> >     from eBPF */
> >     > +    virtio_clear_feature(&ret, VIRTIO_NET_F_HASH_REPORT);
> >
> >
> >     I think there's still some misunderstanding here.
> >
> >     When "rss" is enabled via command line, qemu can't not turn it off
> >     silently, otherwise it may break migration. Instead, qemu should
> >     disable
> >     vhost-net if eBPF can't be loaded.
> >
> >     When "hash_report" is enabled via command line, qemu should disable
> >     vhost-net unconditionally.
> >
> >
> > I agree in general with this requirement and I'm preparing an
> > implementation of such fallback.
> >
> > The problem is that qemu already uses the mechanism of turning off
> > host features
> > silently if they are not supported by the current vhost in kernel:
> >
> https://github.com/qemu/qemu/blob/b0f8c22d6d4d07f3bd2307bcc62e1660ef96547=
2/hw/virtio/vhost.c#L1526
> >
> > Can you please comment on it and let me know how it should be modified
> > in future?
> > I've planned to use it in next work (implementing hash report in kernel=
)
>
>
> This looks like a bug that needs to be solved. Otherwise we break
> migration from rss=3Don, vhost=3Doff to rss=3Don,vhost=3Don.
>
> I think I need to fill the gap in my understanding of migration's
prerequisites.
According to
https://github.com/qemu/qemu/blob/b0f8c22d6d4d07f3bd2307bcc62e1660ef965472/=
docs/devel/migration.rst
"... QEMU has to be launched with the same arguments the two times ..." and
we test the migration during development
according to this statement.
What are the real requirements and prerequisites of the migration?


> I think you can keep the current code as is and I will try to seek a way
> to solve the issue.
>
> Thanks
>
>

--00000000000070e72605b57606ea
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Dec 2, 2020 at 6:06 AM Jason =
Wang &lt;<a href=3D"mailto:jasowang@redhat.com">jasowang@redhat.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
On 2020/12/1 =E4=B8=8B=E5=8D=883:40, Yuri Benditovich wrote:<br>
&gt;<br>
&gt;<br>
&gt; On Tue, Nov 24, 2020 at 10:49 AM Jason Wang &lt;<a href=3D"mailto:jaso=
wang@redhat.com" target=3D"_blank">jasowang@redhat.com</a> <br>
&gt; &lt;mailto:<a href=3D"mailto:jasowang@redhat.com" target=3D"_blank">ja=
sowang@redhat.com</a>&gt;&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0On 2020/11/19 =E4=B8=8B=E5=8D=887:13, Andrew Melnyc=
henko wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; From: Andrew &lt;<a href=3D"mailto:andrew@dayn=
ix.com" target=3D"_blank">andrew@daynix.com</a> &lt;mailto:<a href=3D"mailt=
o:andrew@daynix.com" target=3D"_blank">andrew@daynix.com</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; When RSS is enabled the device tries to load t=
he eBPF program<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; to select RX virtqueue in the TUN. If eBPF can=
 be loaded<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; the RSS will function also with vhost (works w=
ith kernel 5.8 and<br>
&gt;=C2=A0 =C2=A0 =C2=A0later).<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Software RSS is used as a fallback with vhost=
=3Doff when eBPF<br>
&gt;=C2=A0 =C2=A0 =C2=A0can&#39;t be loaded<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; or when hash population requested by the guest=
.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Signed-off-by: Yuri Benditovich &lt;<a href=3D=
"mailto:yuri.benditovich@daynix.com" target=3D"_blank">yuri.benditovich@day=
nix.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:yuri.benditovich@dayni=
x.com" target=3D"_blank">yuri.benditovich@daynix.com</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Signed-off-by: Andrew Melnychenko &lt;<a href=
=3D"mailto:andrew@daynix.com" target=3D"_blank">andrew@daynix.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:andrew@daynix.com" tar=
get=3D"_blank">andrew@daynix.com</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; ---<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0hw/net/vhost_net.c=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0hw/net/virtio-net.c=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 120<br>
&gt;=C2=A0 =C2=A0 =C2=A0+++++++++++++++++++++++++++++++--<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0include/hw/virtio/virtio-net.h |=
=C2=A0 =C2=A04 ++<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0net/vhost-vdpa.c=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A04 files changed, 124 insertions(+)=
, 4 deletions(-)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; diff --git a/hw/net/vhost_net.c b/hw/net/vhost=
_net.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; index 24d555e764..16124f99c3 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; --- a/hw/net/vhost_net.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +++ b/hw/net/vhost_net.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; @@ -71,6 +71,8 @@ static const int user_featur=
e_bits[] =3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0VIRTIO_NET_F_MTU,<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0VIRTIO_F_IOMMU_PLATF=
ORM,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0VIRTIO_F_RING_PACKED=
,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 VIRTIO_NET_F_RSS,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 VIRTIO_NET_F_HASH_REPORT,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* This bit implies =
RARP isn&#39;t sent by QEMU out of band */<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0VIRTIO_NET_F_GUEST_A=
NNOUNCE,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; diff --git a/hw/net/virtio-net.c b/hw/net/virt=
io-net.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; index 277289d56e..afcc3032ec 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; --- a/hw/net/virtio-net.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +++ b/hw/net/virtio-net.c<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; @@ -698,6 +698,19 @@ static void virtio_net_se=
t_queues(VirtIONet *n)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;=C2=A0 =C2=A0static void virtio_net_set_multiqu=
eue(VirtIONet *n, int<br>
&gt;=C2=A0 =C2=A0 =C2=A0multiqueue);<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +static uint64_t fix_ebpf_vhost_features(uint6=
4_t features)<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +{<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 /* If vhost=3Don &amp; CONFIG_E=
BPF doesn&#39;t set - disable RSS<br>
&gt;=C2=A0 =C2=A0 =C2=A0feature */<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 uint64_t ret =3D features;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +#ifndef CONFIG_EBPF<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 virtio_clear_feature(&amp;ret, =
VIRTIO_NET_F_RSS);<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +#endif<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 /* for now, there is no solutio=
n for populating the hash<br>
&gt;=C2=A0 =C2=A0 =C2=A0from eBPF */<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 virtio_clear_feature(&amp;ret, =
VIRTIO_NET_F_HASH_REPORT);<br>
&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0I think there&#39;s still some misunderstanding her=
e.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0When &quot;rss&quot; is enabled via command line, q=
emu can&#39;t not turn it off<br>
&gt;=C2=A0 =C2=A0 =C2=A0silently, otherwise it may break migration. Instead=
, qemu should<br>
&gt;=C2=A0 =C2=A0 =C2=A0disable<br>
&gt;=C2=A0 =C2=A0 =C2=A0vhost-net if eBPF can&#39;t be loaded.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0When &quot;hash_report&quot; is enabled via command=
 line, qemu should disable<br>
&gt;=C2=A0 =C2=A0 =C2=A0vhost-net unconditionally.<br>
&gt;<br>
&gt;<br>
&gt; I agree in general with this requirement and I&#39;m preparing an <br>
&gt; implementation of such fallback.<br>
&gt;<br>
&gt; The problem is that qemu already uses the mechanism=C2=A0of turning of=
f <br>
&gt; host features<br>
&gt; silently if they are not supported by the current vhost in kernel:<br>
&gt; <a href=3D"https://github.com/qemu/qemu/blob/b0f8c22d6d4d07f3bd2307bcc=
62e1660ef965472/hw/virtio/vhost.c#L1526" rel=3D"noreferrer" target=3D"_blan=
k">https://github.com/qemu/qemu/blob/b0f8c22d6d4d07f3bd2307bcc62e1660ef9654=
72/hw/virtio/vhost.c#L1526</a><br>
&gt;<br>
&gt; Can you please comment on it and let me know how it should be modified=
 <br>
&gt; in future?<br>
&gt; I&#39;ve planned to use it in next work (implementing hash report in k=
ernel)<br>
<br>
<br>
This looks like a bug that needs to be solved. Otherwise we break <br>
migration from rss=3Don, vhost=3Doff to rss=3Don,vhost=3Don.<br>
<br></blockquote><div>I think I need to fill the gap in my understanding of=
 migration&#39;s prerequisites.</div><div>According to=C2=A0=C2=A0<a href=
=3D"https://github.com/qemu/qemu/blob/b0f8c22d6d4d07f3bd2307bcc62e1660ef965=
472/docs/devel/migration.rst">https://github.com/qemu/qemu/blob/b0f8c22d6d4=
d07f3bd2307bcc62e1660ef965472/docs/devel/migration.rst</a></div><div>&quot;=
... QEMU has to be launched with the same arguments the two times ...&quot;=
 and we test the migration during development</div><div>according to this s=
tatement.</div><div>What are the real requirements and prerequisites of the=
 migration?</div><div>=C2=A0<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">
I think you can keep the current code as is and I will try to seek a way <b=
r>
to solve the issue.<br>
<br>
Thanks<br>
<br>
</blockquote></div></div>

--00000000000070e72605b57606ea--

