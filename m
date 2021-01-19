Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E3352FB9F0
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 15:55:21 +0100 (CET)
Received: from localhost ([::1]:49720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1sPg-0003oQ-Bq
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 09:55:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuri.benditovich@daynix.com>)
 id 1l1sOH-0002fO-QK
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 09:53:55 -0500
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e]:36355)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yuri.benditovich@daynix.com>)
 id 1l1sOF-0006pT-6Q
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 09:53:53 -0500
Received: by mail-ot1-x32e.google.com with SMTP id v21so2235452otj.3
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 06:53:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=0d9vSd6x1+fmn8wryva1eKx12HtROtnLGXnKTT7tLvg=;
 b=de4WInHBCLr1ZXf+i75e7Zk3pUq1tQwNHZTGRrHeGVRY2UCBXAKivo0tt+q25bn5EG
 62chh7xeY/l/6T/VdsprTr4e4N/B3k2L0rEEUWorsr9C+tI7sK/F2IdRmf9VyykJ/EQu
 /7YGcChNboQ9JFv5k8pIR8SguShxKeFeqerhhNGRov9ywnR6GtcNur9CybUyKf08lBhf
 Bcd6BEpM+OQ+NDJ66JL5SN5fzT/yvi/s/OUiakhZcxxajxAuibvltdeKBbozHtwfJ2yf
 miUljn/jSsbahj8hRiI8eYwhBHK477hKv7iGgpuEGRQDJxgFQoxqiNxP7aEAEOinCMIz
 GuEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=0d9vSd6x1+fmn8wryva1eKx12HtROtnLGXnKTT7tLvg=;
 b=IqDmxA9+f2a9oWNFza13mEN489IEEB6IPHD5kq6F3eH3Oak9IPFqd7ea9qpZb4GLSX
 jXWoq7chx7qCnsZGmfeTapeMrzdgTOHDqkGz03BAsFXet2jZ1C1bUBDkWZlK+Mdkkrdg
 FiaLktdVg/s0g31ReJLSv8XtX5LwF+5J+lnig4aV3Sz0ziE7ynq7m9YN0HoB7IfVq/CI
 5RQWPns5dQ2r6YXjzDjNKjCgK3y2irohSbT1SJ0aKzEYnN9OreYThv0TbFVEZAqH+DxW
 1E4Fpy/VhShiuYY7r8AfYPqXNKqiuWAx/eGD1SJ1QhOI3h9HrzSpj9RXmaqJrW8HZPlD
 Gg3A==
X-Gm-Message-State: AOAM533+R3XxmT3GZPbi3eiSjcFjJzWxlgVKbukQQGzx6CoBSoZ7d4hz
 4Z7BBDvwnphRLlxqZhaild3WUpVwsFfvCMG2lwZxnQ==
X-Google-Smtp-Source: ABdhPJz9BuL9Qh4cnTdML8HTYGoDQV/gbSD9dkY8/jum9dIBQznPqrzqutnHQQw5f2o2jz9A3GAtDyKjMmhvwmzN7uw=
X-Received: by 2002:a9d:4715:: with SMTP id a21mr3872728otf.220.1611068029261; 
 Tue, 19 Jan 2021 06:53:49 -0800 (PST)
MIME-Version: 1.0
References: <20210114211612.387052-1-andrew@daynix.com>
 <20210114211612.387052-5-andrew@daynix.com>
 <909194f8-17f6-b8d6-d1b0-353866257ee2@redhat.com>
In-Reply-To: <909194f8-17f6-b8d6-d1b0-353866257ee2@redhat.com>
From: Yuri Benditovich <yuri.benditovich@daynix.com>
Date: Tue, 19 Jan 2021 16:53:37 +0200
Message-ID: <CAOEp5Odjd89aoCghFeZsuNv=G=2fJonFigm+3Whtj_zLuB2Jrg@mail.gmail.com>
Subject: Re: [RFC PATCH v3 4/6] ebpf: Added eBPF RSS loader.
To: Jason Wang <jasowang@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: none client-ip=2607:f8b0:4864:20::32e;
 envelope-from=yuri.benditovich@daynix.com; helo=mail-ot1-x32e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jan 15, 2021 at 9:02 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> On 2021/1/15 =E4=B8=8A=E5=8D=885:16, Andrew Melnychenko wrote:
> > From: Andrew <andrew@daynix.com>
> >
> > Added function that loads RSS eBPF program.
> > Added stub functions for RSS eBPF loader.
> > Added meson and configuration options.
> >
> > By default, eBPF feature enabled if libbpf is present in the build syst=
em.
> > libbpf checked in configuration shell script and meson script.
> >
> > Signed-off-by: Yuri Benditovich <yuri.benditovich@daynix.com>
> > Signed-off-by: Andrew Melnychenko <andrew@daynix.com>
> > ---
> >   configure               |  33 ++++
> >   ebpf/ebpf_rss-stub.c    |  40 ++++
> >   ebpf/ebpf_rss.c         | 165 +++++++++++++++++
> >   ebpf/ebpf_rss.h         |  44 +++++
> >   ebpf/meson.build        |   1 +
> >   ebpf/rss.bpf.skeleton.h | 397 +++++++++++++++++++++++++++++++++++++++=
+
> >   ebpf/trace-events       |   4 +
> >   ebpf/trace.h            |   2 +
> >   meson.build             |  13 ++
> >   9 files changed, 699 insertions(+)
> >   create mode 100644 ebpf/ebpf_rss-stub.c
> >   create mode 100644 ebpf/ebpf_rss.c
> >   create mode 100644 ebpf/ebpf_rss.h
> >   create mode 100644 ebpf/meson.build
> >   create mode 100644 ebpf/rss.bpf.skeleton.h
> >   create mode 100644 ebpf/trace-events
> >   create mode 100644 ebpf/trace.h
> >
> > diff --git a/configure b/configure
> > index 5860bdb77b..9d18e941f5 100755
> > --- a/configure
> > +++ b/configure
> > @@ -342,6 +342,7 @@ vhost_vsock=3D"$default_feature"
> >   vhost_user=3D"no"
> >   vhost_user_blk_server=3D"auto"
> >   vhost_user_fs=3D"$default_feature"
> > +bpf=3D""
> >   kvm=3D"auto"
> >   hax=3D"auto"
> >   hvf=3D"auto"
> > @@ -1236,6 +1237,10 @@ for opt do
> >     ;;
> >     --enable-membarrier) membarrier=3D"yes"
> >     ;;
> > +  --disable-bpf) bpf=3D"no"
> > +  ;;
> > +  --enable-bpf) bpf=3D"yes"
> > +  ;;
> >     --disable-blobs) blobs=3D"false"
> >     ;;
> >     --with-pkgversion=3D*) pkgversion=3D"$optarg"
> > @@ -1845,6 +1850,7 @@ disabled with --disable-FEATURE, default is enabl=
ed if available
> >     vhost-user      vhost-user backend support
> >     vhost-user-blk-server    vhost-user-blk server support
> >     vhost-vdpa      vhost-vdpa kernel backend support
> > +  bpf             BPF kernel support
> >     spice           spice
> >     rbd             rados block device (rbd)
> >     libiscsi        iscsi support
> > @@ -5057,6 +5063,30 @@ else
> >       membarrier=3Dno
> >   fi
> >
> > +##########################################
> > +# check for usable bpf system call
> > +if test "$bpf" =3D ""; then
>
>
> This implies the bpf is enabled by default?

Yes, assuming libbpf-devel present and bpf system call defined.

Any problem with it?

>
>
> > +    have_bpf=3Dno
> > +    if test "$linux" =3D "yes" -a "$bigendian" !=3D "yes"; then
> > +        cat > $TMPC << EOF
> > +    #include <stdlib.h>
> > +    #include <bpf/libbpf.h>
> > +    int main(void) {
> > +        struct bpf_object *obj =3D NULL;
> > +        bpf_object__load(obj);
> > +        exit(0);
> > +    }
> > +EOF
> > +        if compile_prog "" "-lbpf" ; then
> > +            have_bpf=3Dyes
> > +            bpf=3Dyes
> > +        fi
> > +    fi
> > +    if test "$have_bpf" =3D "no"; then
> > +      feature_not_found "bpf" "the libbpf is not available"
> > +    fi
> > +fi
> > +
> >   ##########################################
> >   # check if rtnetlink.h exists and is useful
> >   have_rtnetlink=3Dno
> > @@ -5905,6 +5935,9 @@ fi
> >   if test "$membarrier" =3D "yes" ; then
> >     echo "CONFIG_MEMBARRIER=3Dy" >> $config_host_mak
> >   fi
> > +if test "$bpf" =3D "yes" -a "$bigendian" !=3D "yes" -a "$linux" =3D "y=
es" ; then
> > +  echo "CONFIG_EBPF=3Dy" >> $config_host_mak
> > +fi
> >   if test "$signalfd" =3D "yes" ; then
> >     echo "CONFIG_SIGNALFD=3Dy" >> $config_host_mak
> >   fi
> > diff --git a/ebpf/ebpf_rss-stub.c b/ebpf/ebpf_rss-stub.c
> > new file mode 100644
> > index 0000000000..e71e229190
> > --- /dev/null
> > +++ b/ebpf/ebpf_rss-stub.c
> > @@ -0,0 +1,40 @@
> > +/*
> > + * eBPF RSS stub file
> > + *
> > + * Developed by Daynix Computing LTD (http://www.daynix.com)
> > + *
> > + * Authors:
> > + *  Yuri Benditovich <yuri.benditovich@daynix.com>
> > + *
> > + * This work is licensed under the terms of the GNU GPL, version 2.  S=
ee
> > + * the COPYING file in the top-level directory.
> > + */
> > +
> > +#include "qemu/osdep.h"
> > +#include "ebpf/ebpf_rss.h"
>
>
> I wonder why not simply use #ifdef #else to exclude the rss functions.

Just to make the reading easier.

>
> If I read code correctly, this stub requires rss_is_loaded called before
> ebpf_rss_set_all(), so actually ebpf_rss_is_loaded serve the same as

Can you please get into details?
I think the stub does not require it, it just converts all the
ebpf_rss calls to nop at link time.
If I miss something please let us know, we'll fix it in v4.

>
>
> > +
> > +void ebpf_rss_init(struct EBPFRSSContext *ctx)
> > +{
> > +
> > +}
> > +
> > +bool ebpf_rss_is_loaded(struct EBPFRSSContext *ctx)
> > +{
> > +    return false;
> > +}
> > +
> > +bool ebpf_rss_load(struct EBPFRSSContext *ctx)
> > +{
> > +    return false;
> > +}
> > +
> > +bool ebpf_rss_set_all(struct EBPFRSSContext *ctx, struct EBPFRSSConfig=
 *config,
> > +                      uint16_t *indirections_table, uint8_t *toeplitz_=
key)
> > +{
> > +    return false;
> > +}
> > +
> > +void ebpf_rss_unload(struct EBPFRSSContext *ctx)
> > +{
> > +
> > +}
> > diff --git a/ebpf/ebpf_rss.c b/ebpf/ebpf_rss.c
> > new file mode 100644
> > index 0000000000..f7f7102da5
> > --- /dev/null
> > +++ b/ebpf/ebpf_rss.c
> > @@ -0,0 +1,165 @@
> > +/*
> > + * eBPF RSS loader
> > + *
> > + * Developed by Daynix Computing LTD (http://www.daynix.com)
> > + *
> > + * Authors:
> > + *  Andrew Melnychenko <andrew@daynix.com>
> > + *  Yuri Benditovich <yuri.benditovich@daynix.com>
> > + *
> > + * This work is licensed under the terms of the GNU GPL, version 2.  S=
ee
> > + * the COPYING file in the top-level directory.
> > + */
> > +
> > +#include "qemu/osdep.h"
> > +#include "qemu/error-report.h"
> > +
> > +#include <bpf/libbpf.h>
> > +#include <bpf/bpf.h>
> > +
> > +#include "hw/virtio/virtio-net.h" /* VIRTIO_NET_RSS_MAX_TABLE_LEN */
> > +
> > +#include "ebpf/ebpf_rss.h"
> > +#include "ebpf/rss.bpf.skeleton.h"
> > +#include "trace.h"
> > +
> > +void ebpf_rss_init(struct EBPFRSSContext *ctx)
> > +{
> > +    if (ctx !=3D NULL) {
> > +        ctx->obj =3D NULL;
> > +    }
> > +}
> > +
> > +bool ebpf_rss_is_loaded(struct EBPFRSSContext *ctx)
> > +{
> > +    return ctx !=3D NULL && ctx->obj !=3D NULL;
> > +}
> > +
> > +bool ebpf_rss_load(struct EBPFRSSContext *ctx)
> > +{
> > +    struct rss_bpf *rss_bpf_ctx;
> > +
> > +    if (ctx =3D=3D NULL) {
> > +        return false;
> > +    }
> > +
> > +    rss_bpf_ctx =3D rss_bpf__open();
> > +    if (rss_bpf_ctx =3D=3D NULL) {
> > +        trace_ebpf_error("eBPF RSS", "can not open eBPF RSS object");
> > +        goto l_issue;
>
>
> Nit: it's not easy to infer what did "l" mean, it's probably better to
> use "error".

ok, will be renamed, 'l' means 'load' probably

>
> Thanks
>

