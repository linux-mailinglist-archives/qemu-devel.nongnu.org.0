Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBCBF3F7C1F
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 20:19:29 +0200 (CEST)
Received: from localhost ([::1]:44378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIxUm-00032U-Td
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 14:19:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1mIxTj-0002OI-Bz
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 14:18:23 -0400
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b]:46074)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1mIxTh-0002DC-8w
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 14:18:22 -0400
Received: by mail-oi1-x22b.google.com with SMTP id q39so550186oiw.12
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 11:18:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=J+h/jPg7EAgs0Ji/YG0lsAwZ8lkWI6laJfXqsEeKObA=;
 b=yIFiF7/RT0sPxlYCpH6v1hCMQepoyUb0QmMFpcK5m2FfM3UmPk+TSbl9Gwz9+9TmFx
 GiC5dhSV7tXRAC5mCxu+BH8MQT9ah2EQETQfrur/BC4hsR+Bm9zIk54JVuZgYva4aG0e
 Zim24qEG3leYPQsawpbgQp4tzfaR3PTiGjQqGikKDMz3gudFyY7hcxc3kGToFPv3VW9c
 c8kwrac3P7PvN4BLAY8KufKDTC+LvTulQ4S+Gbfhry0HSdbXmmizCKz/s7I2XtleE6Ol
 kDrnsvl1osOemSZOHNaIZqGXLjFpXztRKVVWSatPVHYne1QXGgtz4Kr+t7oQYOw2HvvH
 QZmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=J+h/jPg7EAgs0Ji/YG0lsAwZ8lkWI6laJfXqsEeKObA=;
 b=hiixgrVob48hsNQI2YumE38ktdkEold6BgLtKSejM7bLew7p6OiclvQWUNM/QxyPvb
 lYfdMKaOzULXyqVmTUbMVK3LFXfwwY9Z76QfPQwNURvG4aRWwiK+L/78milDazB8XMD6
 I9xyZJPNBJPeTFgYrYOf/fHA6wd5Cb3r2y7vLdmFyp/sAhwv2lmjZbBFfjyZhgiVUCLK
 2H2x/b9YVCsxncOP4RwWwSIpyvpUlElig2DYbtyB+PXSWzNrQ7R3PdOOIsfRobFT7k+l
 oFzGvwq5sbB75iUSwA6O3KUBHDh6IDkjll9XZq9ZQssXZHcu52Zrf7K1M7KvAi+Pi436
 v5Lw==
X-Gm-Message-State: AOAM533akEWEGOAnvAuFKiDRx6yxkbHxtRNrDYdipzxW6XDdC+nRP10F
 2oZQ/8BgXms4f4XT63+wVSmW2dVn29b4bD3wc+DZzQ==
X-Google-Smtp-Source: ABdhPJw4Z98stlr62ISOsehITcGufEzpPsf+gs1pA1yDVQ8oBMyZwcS7M+UPydyXNJj4MohpqTgn+4nywecCauA0qd4=
X-Received: by 2002:a05:6808:201c:: with SMTP id
 q28mr6051834oiw.18.1629915500086; 
 Wed, 25 Aug 2021 11:18:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210713153758.323614-1-andrew@daynix.com>
 <20210713153758.323614-3-andrew@daynix.com>
 <76ba645f-b34b-e63e-8116-0a1dd80fbbae@redhat.com>
In-Reply-To: <76ba645f-b34b-e63e-8116-0a1dd80fbbae@redhat.com>
From: Andrew Melnichenko <andrew@daynix.com>
Date: Wed, 25 Aug 2021 21:18:09 +0300
Message-ID: <CABcq3pEViPNVhBAxRcz5j6yMgm8CVUaWkusRTj=FnhC_Oh0yvQ@mail.gmail.com>
Subject: Re: [PATCH 2/5] virtio-net: Added property to load eBPF RSS with fds.
To: Jason Wang <jasowang@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000065975b05ca664611"
Received-SPF: none client-ip=2607:f8b0:4864:20::22b;
 envelope-from=andrew@daynix.com; helo=mail-oi1-x22b.google.com
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
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Yan Vugenfirer <yan@daynix.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000065975b05ca664611
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

> I wonder if it's better to use separated properties instead of implying
> an order here?
>
Not really, technically RSS BPF interface may be changed (it's already
changed after RFC).
And libvirt should use something unified, so it's better to use fd array.
If any changes occur - those changes will be applied only for qemu and the
helper.
Also, now all maps are combined in one configuration map.

On Fri, Aug 20, 2021 at 6:36 AM Jason Wang <jasowang@redhat.com> wrote:

>
> =E5=9C=A8 2021/7/13 =E4=B8=8B=E5=8D=8811:37, Andrew Melnychenko =E5=86=99=
=E9=81=93:
> > eBPF RSS program and maps now may be passed during initialization.
> > Initially was implemented for libvirt to launch qemu without permission=
s.
> >
> > Signed-off-by: Andrew Melnychenko <andrew@daynix.com>
> > ---
> >   hw/net/virtio-net.c            | 77 ++++++++++++++++++++++++++++++++-=
-
> >   include/hw/virtio/virtio-net.h |  1 +
> >   2 files changed, 74 insertions(+), 4 deletions(-)
> >
> > diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> > index bd7958b9f0..0602b1772e 100644
> > --- a/hw/net/virtio-net.c
> > +++ b/hw/net/virtio-net.c
> > @@ -41,6 +41,7 @@
> >   #include "sysemu/sysemu.h"
> >   #include "trace.h"
> >   #include "monitor/qdev.h"
> > +#include "monitor/monitor.h"
> >   #include "hw/pci/pci.h"
> >   #include "net_rx_pkt.h"
> >   #include "hw/virtio/vhost.h"
> > @@ -1223,14 +1224,81 @@ static void virtio_net_detach_epbf_rss(VirtIONe=
t
> *n)
> >       virtio_net_attach_ebpf_to_backend(n->nic, -1);
> >   }
> >
> > -static bool virtio_net_load_ebpf(VirtIONet *n)
> > +static int virtio_net_get_ebpf_rss_fds(char *str, char *fds[], int nfd=
s)
> >   {
> > -    if (!virtio_net_attach_ebpf_to_backend(n->nic, -1)) {
> > -        /* backend does't support steering ebpf */
> > +    char *ptr =3D str;
> > +    char *cur =3D NULL;
> > +    size_t len =3D strlen(str);
> > +    int i =3D 0;
> > +
> > +    for (; i < nfds && ptr < str + len;) {
> > +        cur =3D strchr(ptr, ':');
> > +
> > +        if (cur =3D=3D NULL) {
> > +            fds[i] =3D g_strdup(ptr);
> > +        } else {
> > +            fds[i] =3D g_strndup(ptr, cur - ptr);
> > +        }
> > +
> > +        i++;
> > +        if (cur =3D=3D NULL) {
> > +            break;
> > +        } else {
> > +            ptr =3D cur + 1;
> > +        }
> > +    }
> > +
> > +    return i;
> > +}
> > +
> > +static bool virtio_net_load_ebpf_fds(VirtIONet *n)
> > +{
> > +    char *fds_strs[EBPF_RSS_MAX_FDS];
> > +    int fds[EBPF_RSS_MAX_FDS];
> > +    int nfds;
> > +    int ret =3D false;
> > +    Error *errp;
> > +    int i =3D 0;
> > +
> > +    if (n =3D=3D NULL || !n->ebpf_rss_fds) {
> >           return false;
> >       }
> >
> > -    return ebpf_rss_load(&n->ebpf_rss);
> > +    nfds =3D virtio_net_get_ebpf_rss_fds(n->ebpf_rss_fds,
> > +                                       fds_strs, EBPF_RSS_MAX_FDS);
> > +    for (i =3D 0; i < nfds; i++) {
> > +        fds[i] =3D monitor_fd_param(monitor_cur(), fds_strs[i], &errp)=
;
> > +    }
> > +
> > +    if (nfds =3D=3D EBPF_RSS_MAX_FDS) {
> > +        ret =3D ebpf_rss_load_fds(&n->ebpf_rss, fds[0], fds[1], fds[2]=
,
> fds[3]);
> > +    }
> > +
> > +    if (!ret) {
> > +        for (i =3D 0; i < nfds; i++) {
> > +            close(fds[i]);
> > +        }
> > +    }
> > +
> > +    for (i =3D 0; i < nfds; i++) {
> > +        g_free(fds_strs[i]);
> > +    }
> > +
> > +    return ret;
> > +}
> > +
> > +static bool virtio_net_load_ebpf(VirtIONet *n)
> > +{
> > +    bool ret =3D true;
> > +
> > +    if (virtio_net_attach_ebpf_to_backend(n->nic, -1)) {
> > +        if (!(n->ebpf_rss_fds
> > +                && virtio_net_load_ebpf_fds(n))) {
> > +            ret =3D ebpf_rss_load(&n->ebpf_rss);
> > +        }
> > +    }
> > +
> > +    return ret;
> >   }
> >
> >   static void virtio_net_unload_ebpf(VirtIONet *n)
> > @@ -3605,6 +3673,7 @@ static Property virtio_net_properties[] =3D {
> >                       VIRTIO_NET_F_RSS, false),
> >       DEFINE_PROP_BIT64("hash", VirtIONet, host_features,
> >                       VIRTIO_NET_F_HASH_REPORT, false),
> > +    DEFINE_PROP_STRING("ebpf_rss_fds", VirtIONet, ebpf_rss_fds),
> >       DEFINE_PROP_BIT64("guest_rsc_ext", VirtIONet, host_features,
> >                       VIRTIO_NET_F_RSC_EXT, false),
> >       DEFINE_PROP_UINT32("rsc_interval", VirtIONet, rsc_timeout,
> > diff --git a/include/hw/virtio/virtio-net.h
> b/include/hw/virtio/virtio-net.h
> > index 824a69c23f..993f2f3036 100644
> > --- a/include/hw/virtio/virtio-net.h
> > +++ b/include/hw/virtio/virtio-net.h
> > @@ -213,6 +213,7 @@ struct VirtIONet {
> >       VirtioNetRssData rss_data;
> >       struct NetRxPkt *rx_pkt;
> >       struct EBPFRSSContext ebpf_rss;
> > +    char *ebpf_rss_fds;
>
>
> I wonder if it's better to use separated properties instead of implying
> an order here?
>
> E.g "program_fd", "key_map_fd", "indirection_table_map_fd" etc.
>
> Thanks
>
>
> >   };
> >
> >   void virtio_net_set_netclient_name(VirtIONet *n, const char *name,
>
>

--00000000000065975b05ca664611
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,</div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex"><div>I wonder if it&#39;s better to use separated properties instead =
of implying <br>
an order here?</div></blockquote><div>Not really, technically RSS BPF inter=
face may be changed (it&#39;s already changed after RFC).</div><div>And lib=
virt should use something unified, so it&#39;s better to use fd array.</div=
><div>If any changes occur - those changes will be applied only for qemu an=
d the helper.</div><div>Also, now all maps are combined in one configuratio=
n map.<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Fri, Aug 20, 2021 at 6:36 AM Jason Wang &lt;<a href=3D"m=
ailto:jasowang@redhat.com">jasowang@redhat.com</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex"><br>
=E5=9C=A8 2021/7/13 =E4=B8=8B=E5=8D=8811:37, Andrew Melnychenko =E5=86=99=
=E9=81=93:<br>
&gt; eBPF RSS program and maps now may be passed during initialization.<br>
&gt; Initially was implemented for libvirt to launch qemu without permissio=
ns.<br>
&gt;<br>
&gt; Signed-off-by: Andrew Melnychenko &lt;<a href=3D"mailto:andrew@daynix.=
com" target=3D"_blank">andrew@daynix.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0hw/net/virtio-net.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 77 ++++++++++++++++++++++++++++++++--<br>
&gt;=C2=A0 =C2=A0include/hw/virtio/virtio-net.h |=C2=A0 1 +<br>
&gt;=C2=A0 =C2=A02 files changed, 74 insertions(+), 4 deletions(-)<br>
&gt;<br>
&gt; diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c<br>
&gt; index bd7958b9f0..0602b1772e 100644<br>
&gt; --- a/hw/net/virtio-net.c<br>
&gt; +++ b/hw/net/virtio-net.c<br>
&gt; @@ -41,6 +41,7 @@<br>
&gt;=C2=A0 =C2=A0#include &quot;sysemu/sysemu.h&quot;<br>
&gt;=C2=A0 =C2=A0#include &quot;trace.h&quot;<br>
&gt;=C2=A0 =C2=A0#include &quot;monitor/qdev.h&quot;<br>
&gt; +#include &quot;monitor/monitor.h&quot;<br>
&gt;=C2=A0 =C2=A0#include &quot;hw/pci/pci.h&quot;<br>
&gt;=C2=A0 =C2=A0#include &quot;net_rx_pkt.h&quot;<br>
&gt;=C2=A0 =C2=A0#include &quot;hw/virtio/vhost.h&quot;<br>
&gt; @@ -1223,14 +1224,81 @@ static void virtio_net_detach_epbf_rss(VirtION=
et *n)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0virtio_net_attach_ebpf_to_backend(n-&gt;nic,=
 -1);<br>
&gt;=C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -static bool virtio_net_load_ebpf(VirtIONet *n)<br>
&gt; +static int virtio_net_get_ebpf_rss_fds(char *str, char *fds[], int nf=
ds)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt; -=C2=A0 =C2=A0 if (!virtio_net_attach_ebpf_to_backend(n-&gt;nic, -1)) =
{<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* backend does&#39;t support steering eb=
pf */<br>
&gt; +=C2=A0 =C2=A0 char *ptr =3D str;<br>
&gt; +=C2=A0 =C2=A0 char *cur =3D NULL;<br>
&gt; +=C2=A0 =C2=A0 size_t len =3D strlen(str);<br>
&gt; +=C2=A0 =C2=A0 int i =3D 0;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 for (; i &lt; nfds &amp;&amp; ptr &lt; str + len;) {<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 cur =3D strchr(ptr, &#39;:&#39;);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (cur =3D=3D NULL) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fds[i] =3D g_strdup(ptr);<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fds[i] =3D g_strndup(ptr, c=
ur - ptr);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 i++;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (cur =3D=3D NULL) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ptr =3D cur + 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 return i;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static bool virtio_net_load_ebpf_fds(VirtIONet *n)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 char *fds_strs[EBPF_RSS_MAX_FDS];<br>
&gt; +=C2=A0 =C2=A0 int fds[EBPF_RSS_MAX_FDS];<br>
&gt; +=C2=A0 =C2=A0 int nfds;<br>
&gt; +=C2=A0 =C2=A0 int ret =3D false;<br>
&gt; +=C2=A0 =C2=A0 Error *errp;<br>
&gt; +=C2=A0 =C2=A0 int i =3D 0;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (n =3D=3D NULL || !n-&gt;ebpf_rss_fds) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return false;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -=C2=A0 =C2=A0 return ebpf_rss_load(&amp;n-&gt;ebpf_rss);<br>
&gt; +=C2=A0 =C2=A0 nfds =3D virtio_net_get_ebpf_rss_fds(n-&gt;ebpf_rss_fds=
,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fds_s=
trs, EBPF_RSS_MAX_FDS);<br>
&gt; +=C2=A0 =C2=A0 for (i =3D 0; i &lt; nfds; i++) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 fds[i] =3D monitor_fd_param(monitor_cur()=
, fds_strs[i], &amp;errp);<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (nfds =3D=3D EBPF_RSS_MAX_FDS) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D ebpf_rss_load_fds(&amp;n-&gt;ebpf=
_rss, fds[0], fds[1], fds[2], fds[3]);<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (!ret) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i &lt; nfds; i++) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 close(fds[i]);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 for (i =3D 0; i &lt; nfds; i++) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_free(fds_strs[i]);<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 return ret;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static bool virtio_net_load_ebpf(VirtIONet *n)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 bool ret =3D true;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (virtio_net_attach_ebpf_to_backend(n-&gt;nic, -1)) {=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!(n-&gt;ebpf_rss_fds<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;&amp; vi=
rtio_net_load_ebpf_fds(n))) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D ebpf_rss_load(&amp;=
n-&gt;ebpf_rss);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 return ret;<br>
&gt;=C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0static void virtio_net_unload_ebpf(VirtIONet *n)<br>
&gt; @@ -3605,6 +3673,7 @@ static Property virtio_net_properties[] =3D {<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0VIRTIO_NET_F_RSS, false),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0DEFINE_PROP_BIT64(&quot;hash&quot;, VirtIONe=
t, host_features,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0VIRTIO_NET_F_HASH_REPORT, false),<br>
&gt; +=C2=A0 =C2=A0 DEFINE_PROP_STRING(&quot;ebpf_rss_fds&quot;, VirtIONet,=
 ebpf_rss_fds),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0DEFINE_PROP_BIT64(&quot;guest_rsc_ext&quot;,=
 VirtIONet, host_features,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0VIRTIO_NET_F_RSC_EXT, false),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0DEFINE_PROP_UINT32(&quot;rsc_interval&quot;,=
 VirtIONet, rsc_timeout,<br>
&gt; diff --git a/include/hw/virtio/virtio-net.h b/include/hw/virtio/virtio=
-net.h<br>
&gt; index 824a69c23f..993f2f3036 100644<br>
&gt; --- a/include/hw/virtio/virtio-net.h<br>
&gt; +++ b/include/hw/virtio/virtio-net.h<br>
&gt; @@ -213,6 +213,7 @@ struct VirtIONet {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0VirtioNetRssData rss_data;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct NetRxPkt *rx_pkt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct EBPFRSSContext ebpf_rss;<br>
&gt; +=C2=A0 =C2=A0 char *ebpf_rss_fds;<br>
<br>
<br>
I wonder if it&#39;s better to use separated properties instead of implying=
 <br>
an order here?<br>
<br>
E.g &quot;program_fd&quot;, &quot;key_map_fd&quot;, &quot;indirection_table=
_map_fd&quot; etc.<br>
<br>
Thanks<br>
<br>
<br>
&gt;=C2=A0 =C2=A0};<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0void virtio_net_set_netclient_name(VirtIONet *n, const cha=
r *name,<br>
<br>
</blockquote></div>

--00000000000065975b05ca664611--

