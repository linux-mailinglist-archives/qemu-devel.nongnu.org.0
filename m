Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 190D72C9852
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 08:43:29 +0100 (CET)
Received: from localhost ([::1]:41768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk0Jr-0001Kz-Nh
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 02:43:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuri.benditovich@daynix.com>)
 id 1kk0Hh-0000cu-6C
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 02:41:13 -0500
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:40079)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yuri.benditovich@daynix.com>)
 id 1kk0He-0001uY-0O
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 02:41:12 -0500
Received: by mail-ot1-x341.google.com with SMTP id 79so793259otc.7
 for <qemu-devel@nongnu.org>; Mon, 30 Nov 2020 23:41:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=msmfZefb7reVOc/YpWo09SwHioVVaL8Ux1QkAc9Z2eE=;
 b=q1ApCZ1mtI86YZqEIJW7uJJmV3KJNXttl5pozv91SsEjJamwD22G0egBOVKtV5HQOC
 Edke6x651XOFLvKWeYuTpjldvd4txFKmQWZenVtJ3WKAKHgQdNjlOa5tiTr6ZcchoyUa
 /G6Qx+S085tm/xpygStWIeOg48ntZjF4RGN1Nu5FOseBcPYKOcb3/rFUhaFgkGtxG+9m
 noDvibl3RpsujG+7TEtJFzvajTpp2aX/jO0WQgqYVfIbxlqVD+7wS15yD3ALw9xZk/LC
 9+cOc31KrXYYY8GSI3lLJEPPAl5/Sys3pfAPRHb/D0x/3VJRVL94kw5b105C94Zt0Jgj
 itGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=msmfZefb7reVOc/YpWo09SwHioVVaL8Ux1QkAc9Z2eE=;
 b=TqbpjldT9/YvRwvn9p0Pg1N6o5WIRgYTloozQOo3TXLHUB0LZZURo84VUI6HLUe9jp
 PimMN16NXd8HyYV/ClfW5dfEGkqxGANLaU0GFaGuR0VDvtMYpML9DRvsRt86ECZ1DbMP
 gXpuj2sAsj8nRDh4fI95vdNEquKBYW65GRc/zU+hbhBBeVxxP9/jYKUDt5BWru3TXp1N
 Q6sBCMbgX8MgBzyUaMLK1YfQg3AuMI8hFyayrr/g12Dmh7TzTCdA3uJzbEXKcMWOpQHW
 Rm2et8VKrDwlZTN0UBUwLxaS6PV1jI2Zf//Ile6O7zY6cBcB9q4ahFmSCLWoPSHLcTBn
 /58A==
X-Gm-Message-State: AOAM531QVNK9o6xGcDVjA+4KGnIzlGfxMZ6AIQf5wKNRegruMrXoxhjx
 xkKTl+D4T85bkh905b2JpoMiazpf6zcVIr/W5D/0pg==
X-Google-Smtp-Source: ABdhPJxBvGBM10oMNDx10RT+WbiqNzDmhV6hHgbX7Kzr3eCjVMX+itUHRPcS3bHeJSofyKWG9wjRoLHE+1w+esjcdvk=
X-Received: by 2002:a9d:ece:: with SMTP id 72mr919992otj.27.1606808468295;
 Mon, 30 Nov 2020 23:41:08 -0800 (PST)
MIME-Version: 1.0
References: <20201119111305.485202-1-andrew@daynix.com>
 <20201119111305.485202-5-andrew@daynix.com>
 <e3c4d907-1901-52ae-5dde-0aea4780cb35@redhat.com>
In-Reply-To: <e3c4d907-1901-52ae-5dde-0aea4780cb35@redhat.com>
From: Yuri Benditovich <yuri.benditovich@daynix.com>
Date: Tue, 1 Dec 2020 09:40:56 +0200
Message-ID: <CAOEp5OfmRUpKZ-MNDWP=-TxKkWoAPS=n3eKV989fFiiAsRaZ4w@mail.gmail.com>
Subject: Re: [RFC PATCH v2 4/5] virtio-net: Added eBPF RSS to virtio-net.
To: Jason Wang <jasowang@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000f9aa8f05b5623fdf"
Received-SPF: none client-ip=2607:f8b0:4864:20::341;
 envelope-from=yuri.benditovich@daynix.com; helo=mail-ot1-x341.google.com
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

--000000000000f9aa8f05b5623fdf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 24, 2020 at 10:49 AM Jason Wang <jasowang@redhat.com> wrote:

>
> On 2020/11/19 =E4=B8=8B=E5=8D=887:13, Andrew Melnychenko wrote:
> > From: Andrew <andrew@daynix.com>
> >
> > When RSS is enabled the device tries to load the eBPF program
> > to select RX virtqueue in the TUN. If eBPF can be loaded
> > the RSS will function also with vhost (works with kernel 5.8 and later)=
.
> > Software RSS is used as a fallback with vhost=3Doff when eBPF can't be
> loaded
> > or when hash population requested by the guest.
> >
> > Signed-off-by: Yuri Benditovich <yuri.benditovich@daynix.com>
> > Signed-off-by: Andrew Melnychenko <andrew@daynix.com>
> > ---
> >   hw/net/vhost_net.c             |   2 +
> >   hw/net/virtio-net.c            | 120 +++++++++++++++++++++++++++++++-=
-
> >   include/hw/virtio/virtio-net.h |   4 ++
> >   net/vhost-vdpa.c               |   2 +
> >   4 files changed, 124 insertions(+), 4 deletions(-)
> >
> > diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
> > index 24d555e764..16124f99c3 100644
> > --- a/hw/net/vhost_net.c
> > +++ b/hw/net/vhost_net.c
> > @@ -71,6 +71,8 @@ static const int user_feature_bits[] =3D {
> >       VIRTIO_NET_F_MTU,
> >       VIRTIO_F_IOMMU_PLATFORM,
> >       VIRTIO_F_RING_PACKED,
> > +    VIRTIO_NET_F_RSS,
> > +    VIRTIO_NET_F_HASH_REPORT,
> >
> >       /* This bit implies RARP isn't sent by QEMU out of band */
> >       VIRTIO_NET_F_GUEST_ANNOUNCE,
> > diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> > index 277289d56e..afcc3032ec 100644
> > --- a/hw/net/virtio-net.c
> > +++ b/hw/net/virtio-net.c
> > @@ -698,6 +698,19 @@ static void virtio_net_set_queues(VirtIONet *n)
> >
> >   static void virtio_net_set_multiqueue(VirtIONet *n, int multiqueue);
> >
> > +static uint64_t fix_ebpf_vhost_features(uint64_t features)
> > +{
> > +    /* If vhost=3Don & CONFIG_EBPF doesn't set - disable RSS feature *=
/
> > +    uint64_t ret =3D features;
> > +#ifndef CONFIG_EBPF
> > +    virtio_clear_feature(&ret, VIRTIO_NET_F_RSS);
> > +#endif
> > +    /* for now, there is no solution for populating the hash from eBPF
> */
> > +    virtio_clear_feature(&ret, VIRTIO_NET_F_HASH_REPORT);
>
>
> I think there's still some misunderstanding here.
>
> When "rss" is enabled via command line, qemu can't not turn it off
> silently, otherwise it may break migration. Instead, qemu should disable
> vhost-net if eBPF can't be loaded.
>
> When "hash_report" is enabled via command line, qemu should disable
> vhost-net unconditionally.
>
>
I agree in general with this requirement and I'm preparing an
implementation of such fallback.

The problem is that qemu already uses the mechanism of turning off host
features
silently if they are not supported by the current vhost in kernel:
https://github.com/qemu/qemu/blob/b0f8c22d6d4d07f3bd2307bcc62e1660ef965472/=
hw/virtio/vhost.c#L1526

Can you please comment on it and let me know how it should be modified in
future?
I've planned to use it in next work (implementing hash report in kernel)


>
> > +
> > +    return ret;
> > +}
> > +
> >   static uint64_t virtio_net_get_features(VirtIODevice *vdev, uint64_t
> features,
> >                                           Error **errp)
> >   {
> > @@ -732,9 +745,9 @@ static uint64_t virtio_net_get_features(VirtIODevic=
e
> *vdev, uint64_t features,
> >           return features;
> >       }
> >
> > -    virtio_clear_feature(&features, VIRTIO_NET_F_RSS);
> > -    virtio_clear_feature(&features, VIRTIO_NET_F_HASH_REPORT);
> > -    features =3D vhost_net_get_features(get_vhost_net(nc->peer),
> features);
> > +    features =3D fix_ebpf_vhost_features(
> > +            vhost_net_get_features(get_vhost_net(nc->peer), features))=
;
> > +
> >       vdev->backend_features =3D features;
> >
> >       if (n->mtu_bypass_backend &&
> > @@ -1169,12 +1182,75 @@ static int virtio_net_handle_announce(VirtIONet
> *n, uint8_t cmd,
> >       }
> >   }
> >
> > +static void virtio_net_unload_epbf_rss(VirtIONet *n);
> > +
> >   static void virtio_net_disable_rss(VirtIONet *n)
> >   {
> >       if (n->rss_data.enabled) {
> >           trace_virtio_net_rss_disable();
> >       }
> >       n->rss_data.enabled =3D false;
> > +
> > +    if (!n->rss_data.enabled_software_rss &&
> ebpf_rss_is_loaded(&n->ebpf_rss)) {
> > +        virtio_net_unload_epbf_rss(n);
> > +    }
> > +}
> > +
> > +static bool virtio_net_attach_steering_ebpf(NICState *nic, int prog_fd=
)
> > +{
> > +    NetClientState *nc =3D qemu_get_peer(qemu_get_queue(nic), 0);
> > +    if (nc =3D=3D NULL || nc->info->set_steering_ebpf =3D=3D NULL) {
> > +        return false;
> > +    }
> > +
> > +    return nc->info->set_steering_ebpf(nc, prog_fd);
> > +}
> > +
> > +static void rss_data_to_rss_config(struct VirtioNetRssData *data,
> > +                                   struct EBPFRSSConfig *config)
> > +{
> > +    config->redirect =3D data->redirect;
> > +    config->populate_hash =3D data->populate_hash;
> > +    config->hash_types =3D data->hash_types;
> > +    config->indirections_len =3D data->indirections_len;
> > +    config->default_queue =3D data->default_queue;
> > +}
> > +
> > +static bool virtio_net_load_epbf_rss(VirtIONet *n)
> > +{
> > +    struct EBPFRSSConfig config =3D {};
> > +
> > +    if (!n->rss_data.enabled) {
> > +        if (ebpf_rss_is_loaded(&n->ebpf_rss)) {
> > +            ebpf_rss_unload(&n->ebpf_rss);
> > +        }
> > +        return true;
> > +    }
> > +
> > +    if (!ebpf_rss_is_loaded(&n->ebpf_rss) &&
> !ebpf_rss_load(&n->ebpf_rss)) {
> > +        return false;
> > +    }
> > +
> > +    rss_data_to_rss_config(&n->rss_data, &config);
> > +
> > +    if (!ebpf_rss_set_all(&n->ebpf_rss, &config,
> > +                          n->rss_data.indirections_table,
> n->rss_data.key)) {
> > +        ebpf_rss_unload(&n->ebpf_rss);
> > +        return false;
> > +    }
> > +
> > +    if (!virtio_net_attach_steering_ebpf(n->nic,
> n->ebpf_rss.program_fd)) {
> > +        ebpf_rss_unload(&n->ebpf_rss);
> > +        return false;
> > +    }
> > +
> > +    return true;
> > +}
> > +
> > +static void virtio_net_unload_epbf_rss(VirtIONet *n)
> > +{
> > +    virtio_net_attach_steering_ebpf(n->nic, -1);
> > +    ebpf_rss_unload(&n->ebpf_rss);
> >   }
> >
> >   static uint16_t virtio_net_handle_rss(VirtIONet *n,
> > @@ -1208,6 +1284,7 @@ static uint16_t virtio_net_handle_rss(VirtIONet *=
n,
> >           err_value =3D (uint32_t)s;
> >           goto error;
> >       }
> > +    n->rss_data.enabled_software_rss =3D false;
> >       n->rss_data.hash_types =3D virtio_ldl_p(vdev, &cfg.hash_types);
> >       n->rss_data.indirections_len =3D
> >           virtio_lduw_p(vdev, &cfg.indirection_table_mask);
> > @@ -1289,9 +1366,30 @@ static uint16_t virtio_net_handle_rss(VirtIONet
> *n,
> >           goto error;
> >       }
> >       n->rss_data.enabled =3D true;
> > +
> > +    if (!n->rss_data.populate_hash) {
> > +        /* load EBPF RSS */
>
>
> The code explains itself, so the comment is no necessary.
>
>
> > +        if (!virtio_net_load_epbf_rss(n)) {
>
>
> Any reason that we load eBPF RSS here? I thought it would be easier to
> do it during set_features (e.g when RSS is negotiated but not
> HASH_REPORT) and if we do that we don't need extra care about migration.
>
>
> > +            /* EBPF mast be loaded for vhost */
>
>
> Typo.
>
>
> > +            if (get_vhost_net(qemu_get_queue(n->nic)->peer)) {
> > +                warn_report("Can't load eBPF RSS for vhost");
> > +                goto error;
> > +            }
> > +            /* fallback to software RSS */
> > +            warn_report("Can't load eBPF RSS - fallback to software
> RSS");
> > +            n->rss_data.enabled_software_rss =3D true;
> > +        }
> > +    } else {
> > +        /* use software RSS for hash populating */
> > +        /* and unload eBPF if was loaded before */
> > +        virtio_net_unload_epbf_rss(n);
> > +        n->rss_data.enabled_software_rss =3D true;
> > +    }
> > +
> >       trace_virtio_net_rss_enable(n->rss_data.hash_types,
> >                                   n->rss_data.indirections_len,
> >                                   temp.b);
> > +
>
>
> Unnecessary changes.
>
>
> >       return queues;
> >   error:
> >       trace_virtio_net_rss_error(err_msg, err_value);
> > @@ -1674,7 +1772,7 @@ static ssize_t
> virtio_net_receive_rcu(NetClientState *nc, const uint8_t *buf,
> >           return -1;
> >       }
> >
> > -    if (!no_rss && n->rss_data.enabled) {
> > +    if (!no_rss && n->rss_data.enabled &&
> n->rss_data.enabled_software_rss) {
> >           int index =3D virtio_net_process_rss(nc, buf, size);
> >           if (index >=3D 0) {
> >               NetClientState *nc2 =3D qemu_get_subqueue(n->nic, index);
> > @@ -2780,6 +2878,18 @@ static int virtio_net_post_load_device(void
> *opaque, int version_id)
> >       }
> >
> >       if (n->rss_data.enabled) {
> > +        n->rss_data.enabled_software_rss =3D n->rss_data.populate_hash=
;
> > +        if (!n->rss_data.populate_hash) {
> > +            if (!virtio_net_load_epbf_rss(n)) {
> > +                if (get_vhost_net(qemu_get_queue(n->nic)->peer)) {
> > +                    error_report("Can't post-load eBPF RSS for vhost")=
;
> > +                } else {
> > +                    warn_report("Can't post-load eBPF RSS - fallback t=
o
> software RSS");
> > +                    n->rss_data.enabled_software_rss =3D true;
> > +                }
> > +            }
> > +        }
>
>
> btw, I don't see the save and restore of bpf maps, or is it unnecessary?
>
> Thanks
>
>
> > +
> >           trace_virtio_net_rss_enable(n->rss_data.hash_types,
> >                                       n->rss_data.indirections_len,
> >                                       sizeof(n->rss_data.key));
> > @@ -3453,6 +3563,8 @@ static void virtio_net_instance_init(Object *obj)
> >       device_add_bootindex_property(obj, &n->nic_conf.bootindex,
> >                                     "bootindex", "/ethernet-phy@0",
> >                                     DEVICE(n));
> > +
> > +    ebpf_rss_init(&n->ebpf_rss);
> >   }
> >
> >   static int virtio_net_pre_save(void *opaque)
> > diff --git a/include/hw/virtio/virtio-net.h
> b/include/hw/virtio/virtio-net.h
> > index f4852ac27b..4d29a577eb 100644
> > --- a/include/hw/virtio/virtio-net.h
> > +++ b/include/hw/virtio/virtio-net.h
> > @@ -21,6 +21,8 @@
> >   #include "qemu/option_int.h"
> >   #include "qom/object.h"
> >
> > +#include "ebpf/ebpf_rss.h"
> > +
> >   #define TYPE_VIRTIO_NET "virtio-net-device"
> >   OBJECT_DECLARE_SIMPLE_TYPE(VirtIONet, VIRTIO_NET)
> >
> > @@ -130,6 +132,7 @@ typedef struct VirtioNetRscChain {
> >
> >   typedef struct VirtioNetRssData {
> >       bool    enabled;
> > +    bool    enabled_software_rss;
> >       bool    redirect;
> >       bool    populate_hash;
> >       uint32_t hash_types;
> > @@ -214,6 +217,7 @@ struct VirtIONet {
> >       Notifier migration_state;
> >       VirtioNetRssData rss_data;
> >       struct NetRxPkt *rx_pkt;
> > +    struct EBPFRSSContext ebpf_rss;
> >   };
> >
> >   void virtio_net_set_netclient_name(VirtIONet *n, const char *name,
> > diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> > index 99c476db8c..feb5fa8624 100644
> > --- a/net/vhost-vdpa.c
> > +++ b/net/vhost-vdpa.c
> > @@ -54,6 +54,8 @@ const int vdpa_feature_bits[] =3D {
> >       VIRTIO_NET_F_MTU,
> >       VIRTIO_F_IOMMU_PLATFORM,
> >       VIRTIO_F_RING_PACKED,
> > +    VIRTIO_NET_F_RSS,
> > +    VIRTIO_NET_F_HASH_REPORT,
> >       VIRTIO_NET_F_GUEST_ANNOUNCE,
> >       VIRTIO_NET_F_STATUS,
> >       VHOST_INVALID_FEATURE_BIT
>
>

--000000000000f9aa8f05b5623fdf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Nov 24, 2020 at 10:49 AM Jaso=
n Wang &lt;<a href=3D"mailto:jasowang@redhat.com">jasowang@redhat.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
On 2020/11/19 =E4=B8=8B=E5=8D=887:13, Andrew Melnychenko wrote:<br>
&gt; From: Andrew &lt;<a href=3D"mailto:andrew@daynix.com" target=3D"_blank=
">andrew@daynix.com</a>&gt;<br>
&gt;<br>
&gt; When RSS is enabled the device tries to load the eBPF program<br>
&gt; to select RX virtqueue in the TUN. If eBPF can be loaded<br>
&gt; the RSS will function also with vhost (works with kernel 5.8 and later=
).<br>
&gt; Software RSS is used as a fallback with vhost=3Doff when eBPF can&#39;=
t be loaded<br>
&gt; or when hash population requested by the guest.<br>
&gt;<br>
&gt; Signed-off-by: Yuri Benditovich &lt;<a href=3D"mailto:yuri.benditovich=
@daynix.com" target=3D"_blank">yuri.benditovich@daynix.com</a>&gt;<br>
&gt; Signed-off-by: Andrew Melnychenko &lt;<a href=3D"mailto:andrew@daynix.=
com" target=3D"_blank">andrew@daynix.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0hw/net/vhost_net.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 =C2=A02 +<br>
&gt;=C2=A0 =C2=A0hw/net/virtio-net.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 120 +++++++++++++++++++++++++++++++--<br>
&gt;=C2=A0 =C2=A0include/hw/virtio/virtio-net.h |=C2=A0 =C2=A04 ++<br>
&gt;=C2=A0 =C2=A0net/vhost-vdpa.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A02 +<br>
&gt;=C2=A0 =C2=A04 files changed, 124 insertions(+), 4 deletions(-)<br>
&gt;<br>
&gt; diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c<br>
&gt; index 24d555e764..16124f99c3 100644<br>
&gt; --- a/hw/net/vhost_net.c<br>
&gt; +++ b/hw/net/vhost_net.c<br>
&gt; @@ -71,6 +71,8 @@ static const int user_feature_bits[] =3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0VIRTIO_NET_F_MTU,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0VIRTIO_F_IOMMU_PLATFORM,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0VIRTIO_F_RING_PACKED,<br>
&gt; +=C2=A0 =C2=A0 VIRTIO_NET_F_RSS,<br>
&gt; +=C2=A0 =C2=A0 VIRTIO_NET_F_HASH_REPORT,<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* This bit implies RARP isn&#39;t sent by Q=
EMU out of band */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0VIRTIO_NET_F_GUEST_ANNOUNCE,<br>
&gt; diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c<br>
&gt; index 277289d56e..afcc3032ec 100644<br>
&gt; --- a/hw/net/virtio-net.c<br>
&gt; +++ b/hw/net/virtio-net.c<br>
&gt; @@ -698,6 +698,19 @@ static void virtio_net_set_queues(VirtIONet *n)<b=
r>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0static void virtio_net_set_multiqueue(VirtIONet *n, int mu=
ltiqueue);<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +static uint64_t fix_ebpf_vhost_features(uint64_t features)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 /* If vhost=3Don &amp; CONFIG_EBPF doesn&#39;t set - di=
sable RSS feature */<br>
&gt; +=C2=A0 =C2=A0 uint64_t ret =3D features;<br>
&gt; +#ifndef CONFIG_EBPF<br>
&gt; +=C2=A0 =C2=A0 virtio_clear_feature(&amp;ret, VIRTIO_NET_F_RSS);<br>
&gt; +#endif<br>
&gt; +=C2=A0 =C2=A0 /* for now, there is no solution for populating the has=
h from eBPF */<br>
&gt; +=C2=A0 =C2=A0 virtio_clear_feature(&amp;ret, VIRTIO_NET_F_HASH_REPORT=
);<br>
<br>
<br>
I think there&#39;s still some misunderstanding here.<br>
<br>
When &quot;rss&quot; is enabled via command line, qemu can&#39;t not turn i=
t off <br>
silently, otherwise it may break migration. Instead, qemu should disable <b=
r>
vhost-net if eBPF can&#39;t be loaded.<br>
<br>
When &quot;hash_report&quot; is enabled via command line, qemu should disab=
le <br>
vhost-net unconditionally.<br>
<br></blockquote><div><br></div><div>I agree in general with this requireme=
nt and I&#39;m preparing an implementation of such fallback.</div><div><br>=
</div><div>The problem is that qemu already uses the mechanism=C2=A0of turn=
ing off host features</div><div>silently if they are not supported by the c=
urrent vhost in kernel:</div><div><a href=3D"https://github.com/qemu/qemu/b=
lob/b0f8c22d6d4d07f3bd2307bcc62e1660ef965472/hw/virtio/vhost.c#L1526">https=
://github.com/qemu/qemu/blob/b0f8c22d6d4d07f3bd2307bcc62e1660ef965472/hw/vi=
rtio/vhost.c#L1526</a><br></div><div><br></div><div>Can you please comment =
on it and let me know how it should be modified in future?</div><div>I&#39;=
ve planned to use it in next work (implementing hash report in kernel)</div=
><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 return ret;<br>
&gt; +}<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0static uint64_t virtio_net_get_features(VirtIODevice *vdev=
, uint64_t features,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0Error **errp)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt; @@ -732,9 +745,9 @@ static uint64_t virtio_net_get_features(VirtIODevi=
ce *vdev, uint64_t features,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return features;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -=C2=A0 =C2=A0 virtio_clear_feature(&amp;features, VIRTIO_NET_F_RSS);<=
br>
&gt; -=C2=A0 =C2=A0 virtio_clear_feature(&amp;features, VIRTIO_NET_F_HASH_R=
EPORT);<br>
&gt; -=C2=A0 =C2=A0 features =3D vhost_net_get_features(get_vhost_net(nc-&g=
t;peer), features);<br>
&gt; +=C2=A0 =C2=A0 features =3D fix_ebpf_vhost_features(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 vhost_net_get_features(get_=
vhost_net(nc-&gt;peer), features));<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0vdev-&gt;backend_features =3D features;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (n-&gt;mtu_bypass_backend &amp;&amp;<br>
&gt; @@ -1169,12 +1182,75 @@ static int virtio_net_handle_announce(VirtIONe=
t *n, uint8_t cmd,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +static void virtio_net_unload_epbf_rss(VirtIONet *n);<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0static void virtio_net_disable_rss(VirtIONet *n)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (n-&gt;rss_data.enabled) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0trace_virtio_net_rss_disable()=
;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0n-&gt;rss_data.enabled =3D false;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (!n-&gt;rss_data.enabled_software_rss &amp;&amp; ebp=
f_rss_is_loaded(&amp;n-&gt;ebpf_rss)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 virtio_net_unload_epbf_rss(n);<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +}<br>
&gt; +<br>
&gt; +static bool virtio_net_attach_steering_ebpf(NICState *nic, int prog_f=
d)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 NetClientState *nc =3D qemu_get_peer(qemu_get_queue(nic=
), 0);<br>
&gt; +=C2=A0 =C2=A0 if (nc =3D=3D NULL || nc-&gt;info-&gt;set_steering_ebpf=
 =3D=3D NULL) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 return nc-&gt;info-&gt;set_steering_ebpf(nc, prog_fd);<=
br>
&gt; +}<br>
&gt; +<br>
&gt; +static void rss_data_to_rss_config(struct VirtioNetRssData *data,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct EBPFRSSConfi=
g *config)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 config-&gt;redirect =3D data-&gt;redirect;<br>
&gt; +=C2=A0 =C2=A0 config-&gt;populate_hash =3D data-&gt;populate_hash;<br=
>
&gt; +=C2=A0 =C2=A0 config-&gt;hash_types =3D data-&gt;hash_types;<br>
&gt; +=C2=A0 =C2=A0 config-&gt;indirections_len =3D data-&gt;indirections_l=
en;<br>
&gt; +=C2=A0 =C2=A0 config-&gt;default_queue =3D data-&gt;default_queue;<br=
>
&gt; +}<br>
&gt; +<br>
&gt; +static bool virtio_net_load_epbf_rss(VirtIONet *n)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 struct EBPFRSSConfig config =3D {};<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (!n-&gt;rss_data.enabled) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ebpf_rss_is_loaded(&amp;n-&gt;ebpf_rs=
s)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ebpf_rss_unload(&amp;n-&gt;=
ebpf_rss);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return true;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (!ebpf_rss_is_loaded(&amp;n-&gt;ebpf_rss) &amp;&amp;=
 !ebpf_rss_load(&amp;n-&gt;ebpf_rss)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 rss_data_to_rss_config(&amp;n-&gt;rss_data, &amp;config=
);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (!ebpf_rss_set_all(&amp;n-&gt;ebpf_rss, &amp;config,=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 n-&gt;rss_data.indirections_table, n-&gt;rss_data.key=
)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ebpf_rss_unload(&amp;n-&gt;ebpf_rss);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (!virtio_net_attach_steering_ebpf(n-&gt;nic, n-&gt;e=
bpf_rss.program_fd)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ebpf_rss_unload(&amp;n-&gt;ebpf_rss);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 return true;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void virtio_net_unload_epbf_rss(VirtIONet *n)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 virtio_net_attach_steering_ebpf(n-&gt;nic, -1);<br>
&gt; +=C2=A0 =C2=A0 ebpf_rss_unload(&amp;n-&gt;ebpf_rss);<br>
&gt;=C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0static uint16_t virtio_net_handle_rss(VirtIONet *n,<br>
&gt; @@ -1208,6 +1284,7 @@ static uint16_t virtio_net_handle_rss(VirtIONet =
*n,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0err_value =3D (uint32_t)s;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto error;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 n-&gt;rss_data.enabled_software_rss =3D false;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0n-&gt;rss_data.hash_types =3D virtio_ldl_p(v=
dev, &amp;cfg.hash_types);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0n-&gt;rss_data.indirections_len =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0virtio_lduw_p(vdev, &amp;cfg.i=
ndirection_table_mask);<br>
&gt; @@ -1289,9 +1366,30 @@ static uint16_t virtio_net_handle_rss(VirtIONet=
 *n,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto error;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0n-&gt;rss_data.enabled =3D true;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (!n-&gt;rss_data.populate_hash) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* load EBPF RSS */<br>
<br>
<br>
The code explains itself, so the comment is no necessary.<br>
<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!virtio_net_load_epbf_rss(n)) {<br>
<br>
<br>
Any reason that we load eBPF RSS here? I thought it would be easier to <br>
do it during set_features (e.g when RSS is negotiated but not <br>
HASH_REPORT) and if we do that we don&#39;t need extra care about migration=
.<br>
<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* EBPF mast be loaded for =
vhost */<br>
<br>
<br>
Typo.<br>
<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (get_vhost_net(qemu_get_=
queue(n-&gt;nic)-&gt;peer)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 warn_report(&=
quot;Can&#39;t load eBPF RSS for vhost&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto error;<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* fallback to software RSS=
 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 warn_report(&quot;Can&#39;t=
 load eBPF RSS - fallback to software RSS&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 n-&gt;rss_data.enabled_soft=
ware_rss =3D true;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 } else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* use software RSS for hash populating *=
/<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* and unload eBPF if was loaded before *=
/<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 virtio_net_unload_epbf_rss(n);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 n-&gt;rss_data.enabled_software_rss =3D t=
rue;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0trace_virtio_net_rss_enable(n-&gt;rss_data.h=
ash_types,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0n-&gt;rss_data.indir=
ections_len,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0temp.b);<br>
&gt; +<br>
<br>
<br>
Unnecessary changes.<br>
<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return queues;<br>
&gt;=C2=A0 =C2=A0error:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0trace_virtio_net_rss_error(err_msg, err_valu=
e);<br>
&gt; @@ -1674,7 +1772,7 @@ static ssize_t virtio_net_receive_rcu(NetClientS=
tate *nc, const uint8_t *buf,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -=C2=A0 =C2=A0 if (!no_rss &amp;&amp; n-&gt;rss_data.enabled) {<br>
&gt; +=C2=A0 =C2=A0 if (!no_rss &amp;&amp; n-&gt;rss_data.enabled &amp;&amp=
; n-&gt;rss_data.enabled_software_rss) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int index =3D virtio_net_proce=
ss_rss(nc, buf, size);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (index &gt;=3D 0) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NetClientState *=
nc2 =3D qemu_get_subqueue(n-&gt;nic, index);<br>
&gt; @@ -2780,6 +2878,18 @@ static int virtio_net_post_load_device(void *op=
aque, int version_id)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (n-&gt;rss_data.enabled) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 n-&gt;rss_data.enabled_software_rss =3D n=
-&gt;rss_data.populate_hash;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!n-&gt;rss_data.populate_hash) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!virtio_net_load_epbf_r=
ss(n)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (get_vhost=
_net(qemu_get_queue(n-&gt;nic)-&gt;peer)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 error_report(&quot;Can&#39;t post-load eBPF RSS for vhost&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 warn_report(&quot;Can&#39;t post-load eBPF RSS - fallback to software RSS&=
quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 n-&gt;rss_data.enabled_software_rss =3D true;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
<br>
btw, I don&#39;t see the save and restore of bpf maps, or is it unnecessary=
?<br>
<br>
Thanks<br>
<br>
<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0trace_virtio_net_rss_enable(n-=
&gt;rss_data.hash_types,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0n-&gt;=
rss_data.indirections_len,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sizeof=
(n-&gt;rss_data.key));<br>
&gt; @@ -3453,6 +3563,8 @@ static void virtio_net_instance_init(Object *obj=
)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0device_add_bootindex_property(obj, &amp;n-&g=
t;nic_conf.bootindex,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;bootind=
ex&quot;, &quot;/ethernet-phy@0&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DEVICE(n));<b=
r>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 ebpf_rss_init(&amp;n-&gt;ebpf_rss);<br>
&gt;=C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0static int virtio_net_pre_save(void *opaque)<br>
&gt; diff --git a/include/hw/virtio/virtio-net.h b/include/hw/virtio/virtio=
-net.h<br>
&gt; index f4852ac27b..4d29a577eb 100644<br>
&gt; --- a/include/hw/virtio/virtio-net.h<br>
&gt; +++ b/include/hw/virtio/virtio-net.h<br>
&gt; @@ -21,6 +21,8 @@<br>
&gt;=C2=A0 =C2=A0#include &quot;qemu/option_int.h&quot;<br>
&gt;=C2=A0 =C2=A0#include &quot;qom/object.h&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +#include &quot;ebpf/ebpf_rss.h&quot;<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0#define TYPE_VIRTIO_NET &quot;virtio-net-device&quot;<br>
&gt;=C2=A0 =C2=A0OBJECT_DECLARE_SIMPLE_TYPE(VirtIONet, VIRTIO_NET)<br>
&gt;=C2=A0 =C2=A0<br>
&gt; @@ -130,6 +132,7 @@ typedef struct VirtioNetRscChain {<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0typedef struct VirtioNetRssData {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0bool=C2=A0 =C2=A0 enabled;<br>
&gt; +=C2=A0 =C2=A0 bool=C2=A0 =C2=A0 enabled_software_rss;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0bool=C2=A0 =C2=A0 redirect;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0bool=C2=A0 =C2=A0 populate_hash;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t hash_types;<br>
&gt; @@ -214,6 +217,7 @@ struct VirtIONet {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Notifier migration_state;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0VirtioNetRssData rss_data;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct NetRxPkt *rx_pkt;<br>
&gt; +=C2=A0 =C2=A0 struct EBPFRSSContext ebpf_rss;<br>
&gt;=C2=A0 =C2=A0};<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0void virtio_net_set_netclient_name(VirtIONet *n, const cha=
r *name,<br>
&gt; diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c<br>
&gt; index 99c476db8c..feb5fa8624 100644<br>
&gt; --- a/net/vhost-vdpa.c<br>
&gt; +++ b/net/vhost-vdpa.c<br>
&gt; @@ -54,6 +54,8 @@ const int vdpa_feature_bits[] =3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0VIRTIO_NET_F_MTU,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0VIRTIO_F_IOMMU_PLATFORM,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0VIRTIO_F_RING_PACKED,<br>
&gt; +=C2=A0 =C2=A0 VIRTIO_NET_F_RSS,<br>
&gt; +=C2=A0 =C2=A0 VIRTIO_NET_F_HASH_REPORT,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0VIRTIO_NET_F_GUEST_ANNOUNCE,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0VIRTIO_NET_F_STATUS,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0VHOST_INVALID_FEATURE_BIT<br>
<br>
</blockquote></div></div>

--000000000000f9aa8f05b5623fdf--

