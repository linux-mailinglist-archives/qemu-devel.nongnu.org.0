Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03219702B30
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 13:14:09 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyW8K-0006N8-2i; Mon, 15 May 2023 07:12:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1pyW7z-0006Id-Oa
 for qemu-devel@nongnu.org; Mon, 15 May 2023 07:12:32 -0400
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1pyW7p-0000Sg-Ts
 for qemu-devel@nongnu.org; Mon, 15 May 2023 07:12:29 -0400
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-55a79671a4dso187062647b3.2
 for <qemu-devel@nongnu.org>; Mon, 15 May 2023 04:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1684149140; x=1686741140;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pJoecxgB3i8PpI2Txiuka5HziNc9goHOhFa89qElHWo=;
 b=VBl23os8D6A86cWaUOvO8BzjLUiG25cnWNemy84nhdrwY3wxOgk4shssnD8Ig567OV
 EMJtOLtfbN8g8Q+WjHfEvC4B380IS/ZDhPxlxauLBE8Ush4puAKOab+TDbzK3/aKP18t
 ufOZn0xMzxTsZ7qPxgDX+0sc8iBBD5NgTsv81MyqCce5zaNMkSMwZ0ZwbkkxQBbjTPmq
 gMFQqJ+F6EXE9W8XKzPA3Ie5A0piQsbBAUh9xr6wSv8otP095Hjh5yKdiedEBkhNqWts
 Yh4AQ6XB3PkPBkYVGn77o6wU8AbT2FTfz3pQFEKhlqrqO1OueBcKgQp4XBapuydTGBUq
 eziw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684149140; x=1686741140;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pJoecxgB3i8PpI2Txiuka5HziNc9goHOhFa89qElHWo=;
 b=fFCx9Q44V+49109QcMhobIysVtt1Ht9dUR1kErxWtwl07cHeMjdkGt3o49vyMGTdSv
 +fwjVhBh7Jy/M087PYnqsW1F4cgATCzbUpJpCpyDjP6gE3c9jA0MP0UqAPIXsyqVYqLU
 9l8uNy9EHxRhLgwsPPKiFt9lUA0NvxSpNZhPWDNAsDR+sCYFawfRHp6XbxLgDL2HuYo4
 mXQaG3hRCfgT3AHRZ1tDH60wJ5YUNcYDepqrYM9u3sfaLu0SaA6naB9ojtPlnkfpW6jZ
 aqAwJPJMWuZ2GmG2Sjhd0ZVnKeZcifCkGqF271H7YZFRgPMhfrSIxBR0eSr92sf4hR1L
 4nIg==
X-Gm-Message-State: AC+VfDzw7VMC/ktoRVM3BdYY9puTrk1GyVGmH+yKu37HHgYqRBg1YMtC
 /JlxqhMDE6a8NHkbID9rbCKKoLdei7HbYMhmGpaXVw==
X-Google-Smtp-Source: ACHHUZ5Vr02iccjBEFM98Kp5ckmSjVVO771wFgkER045CRklTW0nO3Xj8nJY8LMJ+B/VMe2woNXkga6F9ht1m0whYTo=
X-Received: by 2002:a0d:e241:0:b0:55a:85c2:6486 with SMTP id
 l62-20020a0de241000000b0055a85c26486mr29409725ywe.46.1684149140522; Mon, 15
 May 2023 04:12:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230512122902.34345-1-andrew@daynix.com>
 <20230512122902.34345-4-andrew@daynix.com>
 <ZGH9pBm08TzJgUfJ@redhat.com>
In-Reply-To: <ZGH9pBm08TzJgUfJ@redhat.com>
From: Andrew Melnichenko <andrew@daynix.com>
Date: Mon, 15 May 2023 13:53:32 +0300
Message-ID: <CABcq3pGVyCBuv_0c6=1nd=4NVC=vyumw5k6Et3YBJfYFC+JufA@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] virtio-net: Added property to load eBPF RSS with
 fds.
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: jasowang@redhat.com, mst@redhat.com, armbru@redhat.com, eblake@redhat.com, 
 qemu-devel@nongnu.org, yuri.benditovich@daynix.com, yan@daynix.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: none client-ip=2607:f8b0:4864:20::1131;
 envelope-from=andrew@daynix.com; helo=mail-yw1-x1131.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi all,

On Mon, May 15, 2023 at 12:38=E2=80=AFPM Daniel P. Berrang=C3=A9 <berrange@=
redhat.com> wrote:
>
> On Fri, May 12, 2023 at 03:28:59PM +0300, Andrew Melnychenko wrote:
> > eBPF RSS program and maps may now be passed during initialization.
> > Initially was implemented for libvirt to launch qemu without permission=
s,
> > and initialized eBPF program through the helper.
> >
> > Signed-off-by: Andrew Melnychenko <andrew@daynix.com>
> > ---
> >  hw/net/virtio-net.c            | 55 ++++++++++++++++++++++++++++++----
> >  include/hw/virtio/virtio-net.h |  1 +
> >  2 files changed, 50 insertions(+), 6 deletions(-)
> >
> > diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> > index 53e1c326433..a62d7936948 100644
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
> > @@ -1305,14 +1306,55 @@ static void virtio_net_detach_epbf_rss(VirtIONe=
t *n)
> >      virtio_net_attach_ebpf_to_backend(n->nic, -1);
> >  }
> >
> > -static bool virtio_net_load_ebpf(VirtIONet *n)
> > +static bool virtio_net_load_ebpf_fds(VirtIONet *n, Error **errp)
> >  {
> > -    if (!virtio_net_attach_ebpf_to_backend(n->nic, -1)) {
> > -        /* backend does't support steering ebpf */
> > -        return false;
> > +    int fds[EBPF_RSS_MAX_FDS] =3D { [0 ... EBPF_RSS_MAX_FDS - 1] =3D -=
1};
>
> Interesting, I didn't realize this initialization syntax was possible !
>
> > +    int nfds =3D 0;
> > +    int ret =3D true;
> > +    int i =3D 0;
> > +    g_autofree char **fds_strs =3D g_strsplit(n->ebpf_rss_fds, ":", 0)
>
> You can't use 'g_autofree' with 'char **' I'm afraid, as that'll
> merely g_free() the array, but not the individual strings.
>
> Needs to be
>
>    g_auto(GStrv) fds_strs
>
> GStrv is a typedef for "char **" which gets g_strfreev() attached
> as its destructor.

Oh yeah, I've missed that! Thank you.
>
>
> > +
> > +    ERRP_GUARD();
> > +
> > +    if (g_strv_length(fds_strs) !=3D EBPF_RSS_MAX_FDS) {
> > +        error_setg(errp,
> > +                  "Expected %d file descriptors but got %d",
> > +                  EBPF_RSS_MAX_FDS, g_strv_length(fds_strs));
> > +       return false;
> > +   }
> > +
> > +    for (i =3D 0; i < nfds; i++) {
> > +        fds[i] =3D monitor_fd_param(monitor_cur(), fds_strs[i], errp);
> > +        if (*errp) {
> > +            ret =3D false;
> > +            goto exit;
> > +        }
> > +    }
> > +
> > +    ret =3D ebpf_rss_load_fds(&n->ebpf_rss, fds[0], fds[1], fds[2], fd=
s[3]);
> > +
> > +exit:
> > +    if (!ret || *errp) {
> > +        for (i =3D 0; i < nfds && fds[i] !=3D -1; i++) {
> > +            close(fds[i]);
> > +        }
> >      }
> >
> > -    return ebpf_rss_load(&n->ebpf_rss);
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
> > @@ -3738,7 +3780,7 @@ static void virtio_net_device_realize(DeviceState=
 *dev, Error **errp)
> >      net_rx_pkt_init(&n->rx_pkt);
> >
> >      if (virtio_has_feature(n->host_features, VIRTIO_NET_F_RSS)) {
> > -        virtio_net_load_ebpf(n);
> > +        virtio_net_load_ebpf(n, errp);
> >      }
> >  }
> >
> > @@ -3900,6 +3942,7 @@ static Property virtio_net_properties[] =3D {
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

