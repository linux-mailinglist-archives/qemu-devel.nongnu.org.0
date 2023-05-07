Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17D1B6F9C14
	for <lists+qemu-devel@lfdr.de>; Sun,  7 May 2023 23:54:46 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pvmKm-0005VJ-NK; Sun, 07 May 2023 17:54:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1pvmKk-0005Uz-Es
 for qemu-devel@nongnu.org; Sun, 07 May 2023 17:54:22 -0400
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1pvmKi-00030h-LB
 for qemu-devel@nongnu.org; Sun, 07 May 2023 17:54:22 -0400
Received: by mail-yb1-xb2c.google.com with SMTP id
 3f1490d57ef6-b9ef06cb784so5113878276.0
 for <qemu-devel@nongnu.org>; Sun, 07 May 2023 14:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1683496459; x=1686088459;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=otMNN5G5ZhaYOkZvyp0LVCDKRh2aovG2inGErDXJgkM=;
 b=jRI5/xom6imnz3lcCJSsvB2/5BzZlQBJoHEmFCeGqUxSeRT4ermaghIBALNCraFeIo
 xsJ5c+Qys5hLJZfDMMV7+TKVhDmOcj3veZ0esZY0220p40H3J80rUJ46UOjeX0vYkMNs
 7eHDtMx0tWPcyM0Ja6l0CAmiOha517s0zxjpXz9lBoEkfz64htVlxfBIaC+PnVIFCMZF
 g1tTqCNNnoGGTeabPo1gaqzyMVnudkZscJ4Cmhvy74/vQYIySwgBpzcJNwPgNzQvRDrB
 Ty3h5NnfVmvvQe3vp9SWNquF0ftD6ek4sC1vCO6Z5aMZNdTlllup7blrBm8VKNYy8LHL
 Hqmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683496459; x=1686088459;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=otMNN5G5ZhaYOkZvyp0LVCDKRh2aovG2inGErDXJgkM=;
 b=TmqkpE12pSG9SqttC6RhMHJBF/Zi0MIfV4sSAJaiCAcOznSDntZXoBXH6vnSQYn4Sj
 RoozAuTJUfiSGFcZNxHMetOb68FGRiLg+Wf+vNXzn/gfPjIutNEmJQtFD5HHLuq4s2z4
 qvkmffbo5295BzKYkIolTuHUuzlUQBI9kEQ7qdum96013GXrKIUogh98pOcNcN/LNUik
 6QXGT/TgLFsWPzHE0gWLgwq3wj2B6KUtKoyOu+JVE+Rp2nYm/2xLG4KkDvOH6T4TLiTg
 lW0PsKQbAkhxuwlVL2t6ke56x0Ntdp4K7gQmPiWsgSiJvPd7Tx97tQ1Cno8DS7rC97qg
 L2qA==
X-Gm-Message-State: AC+VfDxZp96SPsSbFFW+gHP89id9k9KLfEb2/STEHpGdYV6xT36BtpGq
 J9iPX0fQ/Evbf87aUA9f+yxTtyIdMJ0O4hD/3OcvPg==
X-Google-Smtp-Source: ACHHUZ4v4GSDEWMA+0gUHDtSCWXZxGwJJoq4kk3zihdr4mcI3EBGS3e3GXcNud60HtE0N/pzrg6lB+PA4AWESM1vABU=
X-Received: by 2002:a25:58c3:0:b0:b9e:6912:595f with SMTP id
 m186-20020a2558c3000000b00b9e6912595fmr7586653ybb.11.1683496459546; Sun, 07
 May 2023 14:54:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230501072101.22890-1-andrew@daynix.com>
 <20230501072101.22890-3-andrew@daynix.com>
 <ZFI/cIIf6DKRwvCq@redhat.com>
In-Reply-To: <ZFI/cIIf6DKRwvCq@redhat.com>
From: Andrew Melnichenko <andrew@daynix.com>
Date: Mon, 8 May 2023 00:35:40 +0300
Message-ID: <CABcq3pF+dAj1yTr53havdXH2B0Akf9nHh9Zg18auc3aeFvMaHA@mail.gmail.com>
Subject: Re: [PATCH 2/5] virtio-net: Added property to load eBPF RSS with fds.
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: jasowang@redhat.com, mst@redhat.com, armbru@redhat.com, eblake@redhat.com, 
 qemu-devel@nongnu.org, yuri.benditovich@daynix.com, yan@daynix.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: none client-ip=2607:f8b0:4864:20::b2c;
 envelope-from=andrew@daynix.com; helo=mail-yb1-xb2c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi all,

Thank you for your comments. I'll update it in the next patch version.

On Wed, May 3, 2023 at 2:03=E2=80=AFPM Daniel P. Berrang=C3=A9 <berrange@re=
dhat.com> wrote:
>
> On Mon, May 01, 2023 at 10:20:58AM +0300, Andrew Melnychenko wrote:
> > eBPF RSS program and maps may now be passed during initialization.
> > Initially was implemented for libvirt to launch qemu without permission=
s,
> > and initialized eBPF program through the helper.
> >
> > Signed-off-by: Andrew Melnychenko <andrew@daynix.com>
> > ---
> >  hw/net/virtio-net.c            | 96 +++++++++++++++++++++++++++++++---
> >  include/hw/virtio/virtio-net.h |  1 +
> >  2 files changed, 91 insertions(+), 6 deletions(-)
> >
> > diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> > index 53e1c326433..9b3a997d872 100644
> > --- a/hw/net/virtio-net.c
> > +++ b/hw/net/virtio-net.c
> > @@ -42,6 +42,7 @@
> >  #include "sysemu/sysemu.h"
> >  #include "trace.h"
> >  #include "monitor/qdev.h"
> > +#include "monitor/monitor.h"
> >  #include "hw/pci/pci_device.h"
> >  #include "net_rx_pkt.h"
> >  #include "hw/virtio/vhost.h"
> > @@ -1305,14 +1306,96 @@ static void virtio_net_detach_epbf_rss(VirtIONe=
t *n)
> >      virtio_net_attach_ebpf_to_backend(n->nic, -1);
> >  }
> >
> > -static bool virtio_net_load_ebpf(VirtIONet *n)
> > +static int virtio_net_get_ebpf_rss_fds(char *str, char *fds[], int nfd=
s,
> > +                                       Error **errp)
> >  {
> > -    if (!virtio_net_attach_ebpf_to_backend(n->nic, -1)) {
> > -        /* backend does't support steering ebpf */
> > -        return false;
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
> > +    if (cur !=3D NULL) {
> > +        /* the string contains more arguments */
> > +        error_setg(errp,
> > +                   "Too many eBPF file descriptors for RSS provided.")=
;
> > +    } else if (i < nfds) {
> > +        error_setg(errp,
> > +                   "Not enough eBPF file descriptors for RSS were prov=
ided.");
> > +    }
> > +
> > +    return i;
> > +}
>
> This whole method could be replaced by a call to g_strsplit in
> the caller....
>
>
> > +
> > +static bool virtio_net_load_ebpf_fds(VirtIONet *n, Error **errp)
> > +{
> > +    char *fds_strs[EBPF_RSS_MAX_FDS];
>
>    g_autoptr(GStrv) fds_strs =3D g_strsplit(n->ebpf_rss_fds, ",", 0);
>
> > +    int fds[EBPF_RSS_MAX_FDS];
>
> Left as uninitialized stack memory.
>
> > +    int nfds;
> > +    int ret =3D true;
> > +    int i =3D 0;
> > +
> > +    ERRP_GUARD();
> > +
> > +    nfds =3D virtio_net_get_ebpf_rss_fds(n->ebpf_rss_fds,
> > +                                       fds_strs, EBPF_RSS_MAX_FDS, err=
p);
> > +    if (*errp) {
> > +        ret =3D false;
> > +        goto exit;
> >      }
>
> Replace with
>
>    if (g_strv_length(fds_strs) !=3D EBPF_RSS_MAX_FDS) {
>        error_setg(errp,
>                   "Expected %d file descriptors but got %d",
>                   EBPF_RSS_MAX_FDS, g_strv_length(fds_strs));
>        return false;
>    }
>
> >
> > -    return ebpf_rss_load(&n->ebpf_rss);
> > +    for (i =3D 0; i < nfds; i++) {
> > +        fds[i] =3D monitor_fd_param(monitor_cur(), fds_strs[i], errp);
> > +        if (*errp) {
> > +            ret =3D false;
> > +            goto exit;
>
> This can break out of the loop before all elements in 'fds' are
> initialized.
>
> > +        }
> > +    }
> > +
> > +    ret =3D ebpf_rss_load_fds(&n->ebpf_rss, fds[0], fds[1], fds[2], fd=
s[3]);
> > +
> > +exit:
> > +    if (!ret || *errp) {
> > +        for (i =3D 0; i < nfds; i++) {
> > +            close(fds[i]);
> > +        }
> > +    }
>
> This now calls close() on uninitialized memory, killing
> arbitary FDs QEMU has open elsewhere.
>
> > +
> > +    for (i =3D 0; i < nfds; i++) {
> > +        g_free(fds_strs[i]);
> > +    }
>
> Not required if we use g_autoptr(GStrv)
>
> > +
> > +    return ret;
> > +}
> > +
> > +static bool virtio_net_load_ebpf(VirtIONet *n, Error **errp)
> > +{
> > +    bool ret =3D false;
> > +
> > +    if (virtio_net_attach_ebpf_to_backend(n->nic, -1)) {
> > +        if (!(n->ebpf_rss_fds
> > +                && virtio_net_load_ebpf_fds(n, errp))) {
> > +            ret =3D ebpf_rss_load(&n->ebpf_rss);
> > +        }
> > +    }
> > +
> > +    return ret;
> >  }
> >
> >  static void virtio_net_unload_ebpf(VirtIONet *n)
> > @@ -3738,7 +3821,7 @@ static void virtio_net_device_realize(DeviceState=
 *dev, Error **errp)
> >      net_rx_pkt_init(&n->rx_pkt);
> >
> >      if (virtio_has_feature(n->host_features, VIRTIO_NET_F_RSS)) {
> > -        virtio_net_load_ebpf(n);
> > +        virtio_net_load_ebpf(n, errp);
> >      }
> >  }
> >
> > @@ -3900,6 +3983,7 @@ static Property virtio_net_properties[] =3D {
> >                      VIRTIO_NET_F_RSS, false),
> >      DEFINE_PROP_BIT64("hash", VirtIONet, host_features,
> >                      VIRTIO_NET_F_HASH_REPORT, false),
> > +    DEFINE_PROP_STRING("ebpf_rss_fds", VirtIONet, ebpf_rss_fds),
> >      DEFINE_PROP_BIT64("guest_rsc_ext", VirtIONet, host_features,
> >                      VIRTIO_NET_F_RSC_EXT, false),
> >      DEFINE_PROP_UINT32("rsc_interval", VirtIONet, rsc_timeout,
> > diff --git a/include/hw/virtio/virtio-net.h b/include/hw/virtio/virtio-=
net.h
> > index ef234ffe7ef..e10ce88f918 100644
> > --- a/include/hw/virtio/virtio-net.h
> > +++ b/include/hw/virtio/virtio-net.h
> > @@ -219,6 +219,7 @@ struct VirtIONet {
> >      VirtioNetRssData rss_data;
> >      struct NetRxPkt *rx_pkt;
> >      struct EBPFRSSContext ebpf_rss;
> > +    char *ebpf_rss_fds;
> >  };
> >
> >  size_t virtio_net_handle_ctrl_iov(VirtIODevice *vdev,
> > --
> > 2.39.1
> >
>
> With regards,
> Daniel
> --
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|
>

