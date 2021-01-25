Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC2013023E5
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 11:53:48 +0100 (CET)
Received: from localhost ([::1]:44054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3zVE-0006o5-05
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 05:53:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuri.benditovich@daynix.com>)
 id 1l3zU9-0006Lt-BR
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 05:52:41 -0500
Received: from mail-oo1-xc29.google.com ([2607:f8b0:4864:20::c29]:36184)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yuri.benditovich@daynix.com>)
 id 1l3zU6-00086l-Ns
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 05:52:41 -0500
Received: by mail-oo1-xc29.google.com with SMTP id j8so3168169oon.3
 for <qemu-devel@nongnu.org>; Mon, 25 Jan 2021 02:52:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=p/IGAQEMjIAmc9N38X0DDJS42LQpgyFnBGQ9rpuzKzk=;
 b=Uni6km1Fo8jboT6MoVaWrXmo6qqHe50PwxQItgUDjJYP0gUncetsyML8ZmlJG/YZOl
 WDYCjkC9lVFaBWkPL2+7B64nbOFMAZunsXgc+09BcFtAJfEoSk/jBWB3LYRb7fGX8bh1
 xjzsjHG7isDu5x+z+ooNaW42Rmf2OFk/pQUZiqc7iKqmT7XW7jdssvy0RAM5vVcBzQt0
 Yc2SCgcMjcDLoYfqDAy4qULPE3cYsDz9D7i3g+oSHKNKPfmh9V+W7P+w3vOOkL7W8Pe9
 XgVDOYnCglO/Er2ffEXxiUcdZKU6vfWqttXrIkRCewd7nj9DsMq4n2b/Jr0gRkjQipE4
 v9qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=p/IGAQEMjIAmc9N38X0DDJS42LQpgyFnBGQ9rpuzKzk=;
 b=SrjsVp6hU7gMy2MK5CNWYYrp65X+2+CsRIsM/8yu/LrTjkayZwsncJiGABGEp3E7B2
 q+OGIMouzV4Ie2M00ntl16NJIbNYlsnN7IPT28pyJFKf4AVLMbpt3eR15NBacvBMuzQe
 181c2N9t6tFGIQ0u5HPXAvsDIGa5H/OhwcBD5PBHUAvPGvLOLGu9j0uOQKgerXppAMFl
 kRnq07TycbQIt7Ow2mCTNU0Ut8yrczB8oCpb/fDW9o0IHNZC2sml48ZxUB54CQVbznYn
 JQ3v45iqsg7ukqnH1ZYQrWEjmyEzTSQLqIufActuLUxp8KNBtRqKlkfkA/dXv4CuKJHm
 KkDg==
X-Gm-Message-State: AOAM533H4QBDStjFV4A9+ybkTXFZ9cQ7GH6AfXdop4l74sa4Kb3IqjFb
 0wv1iAPUCUqmLiPHLj2E01LVJTPJBGOotpajsZWxEA==
X-Google-Smtp-Source: ABdhPJxM7NvilVtzmYHRcKwCsK7od8q5F//LvrGodlXtWQ3V+aUwEh6bFPngj4BdL9mL8QfNaMYw4n8xVJsMtcvpH3Y=
X-Received: by 2002:a4a:7353:: with SMTP id e19mr83993oof.55.1611571956359;
 Mon, 25 Jan 2021 02:52:36 -0800 (PST)
MIME-Version: 1.0
References: <20210114211612.387052-1-andrew@daynix.com>
 <20210114211612.387052-5-andrew@daynix.com>
 <909194f8-17f6-b8d6-d1b0-353866257ee2@redhat.com>
 <CAOEp5Odjd89aoCghFeZsuNv=G=2fJonFigm+3Whtj_zLuB2Jrg@mail.gmail.com>
 <e4577775-2ca1-ee99-9ee9-687b5840d8c3@redhat.com>
In-Reply-To: <e4577775-2ca1-ee99-9ee9-687b5840d8c3@redhat.com>
From: Yuri Benditovich <yuri.benditovich@daynix.com>
Date: Mon, 25 Jan 2021 12:52:25 +0200
Message-ID: <CAOEp5OeXrwh5zupc+AuZffa9EGuHxFi9qmu-GDCQqbQe1bJYSw@mail.gmail.com>
Subject: Re: [RFC PATCH v3 4/6] ebpf: Added eBPF RSS loader.
To: Jason Wang <jasowang@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: none client-ip=2607:f8b0:4864:20::c29;
 envelope-from=yuri.benditovich@daynix.com; helo=mail-oo1-xc29.google.com
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

On Mon, Jan 25, 2021 at 11:03 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> On 2021/1/19 =E4=B8=8B=E5=8D=8810:53, Yuri Benditovich wrote:
> > On Fri, Jan 15, 2021 at 9:02 AM Jason Wang <jasowang@redhat.com> wrote:
> >>
> >> On 2021/1/15 =E4=B8=8A=E5=8D=885:16, Andrew Melnychenko wrote:
> >>> From: Andrew <andrew@daynix.com>
> >>>
> >>> Added function that loads RSS eBPF program.
> >>> Added stub functions for RSS eBPF loader.
> >>> Added meson and configuration options.
> >>>
> >>> By default, eBPF feature enabled if libbpf is present in the build sy=
stem.
> >>> libbpf checked in configuration shell script and meson script.
> >>>
> >>> Signed-off-by: Yuri Benditovich <yuri.benditovich@daynix.com>
> >>> Signed-off-by: Andrew Melnychenko <andrew@daynix.com>
> >>> ---
> >>>    configure               |  33 ++++
> >>>    ebpf/ebpf_rss-stub.c    |  40 ++++
> >>>    ebpf/ebpf_rss.c         | 165 +++++++++++++++++
> >>>    ebpf/ebpf_rss.h         |  44 +++++
> >>>    ebpf/meson.build        |   1 +
> >>>    ebpf/rss.bpf.skeleton.h | 397 ++++++++++++++++++++++++++++++++++++=
++++
> >>>    ebpf/trace-events       |   4 +
> >>>    ebpf/trace.h            |   2 +
> >>>    meson.build             |  13 ++
> >>>    9 files changed, 699 insertions(+)
> >>>    create mode 100644 ebpf/ebpf_rss-stub.c
> >>>    create mode 100644 ebpf/ebpf_rss.c
> >>>    create mode 100644 ebpf/ebpf_rss.h
> >>>    create mode 100644 ebpf/meson.build
> >>>    create mode 100644 ebpf/rss.bpf.skeleton.h
> >>>    create mode 100644 ebpf/trace-events
> >>>    create mode 100644 ebpf/trace.h
> >>>
> >>> diff --git a/configure b/configure
> >>> index 5860bdb77b..9d18e941f5 100755
> >>> --- a/configure
> >>> +++ b/configure
> >>> @@ -342,6 +342,7 @@ vhost_vsock=3D"$default_feature"
> >>>    vhost_user=3D"no"
> >>>    vhost_user_blk_server=3D"auto"
> >>>    vhost_user_fs=3D"$default_feature"
> >>> +bpf=3D""
> >>>    kvm=3D"auto"
> >>>    hax=3D"auto"
> >>>    hvf=3D"auto"
> >>> @@ -1236,6 +1237,10 @@ for opt do
> >>>      ;;
> >>>      --enable-membarrier) membarrier=3D"yes"
> >>>      ;;
> >>> +  --disable-bpf) bpf=3D"no"
> >>> +  ;;
> >>> +  --enable-bpf) bpf=3D"yes"
> >>> +  ;;
> >>>      --disable-blobs) blobs=3D"false"
> >>>      ;;
> >>>      --with-pkgversion=3D*) pkgversion=3D"$optarg"
> >>> @@ -1845,6 +1850,7 @@ disabled with --disable-FEATURE, default is ena=
bled if available
> >>>      vhost-user      vhost-user backend support
> >>>      vhost-user-blk-server    vhost-user-blk server support
> >>>      vhost-vdpa      vhost-vdpa kernel backend support
> >>> +  bpf             BPF kernel support
> >>>      spice           spice
> >>>      rbd             rados block device (rbd)
> >>>      libiscsi        iscsi support
> >>> @@ -5057,6 +5063,30 @@ else
> >>>        membarrier=3Dno
> >>>    fi
> >>>
> >>> +##########################################
> >>> +# check for usable bpf system call
> >>> +if test "$bpf" =3D ""; then
> >>
> >> This implies the bpf is enabled by default?
> > Yes, assuming libbpf-devel present and bpf system call defined.
> >
> > Any problem with it?
>
>
> It means the configure will fail if libbpf is not installed. Consider
> libbpf is not very common at current stage. I think it's better to make
> it auto or disabled by default.
>
>
> >
> >>
> >>> +    have_bpf=3Dno
> >>> +    if test "$linux" =3D "yes" -a "$bigendian" !=3D "yes"; then
> >>> +        cat > $TMPC << EOF
> >>> +    #include <stdlib.h>
> >>> +    #include <bpf/libbpf.h>
> >>> +    int main(void) {
> >>> +        struct bpf_object *obj =3D NULL;
> >>> +        bpf_object__load(obj);
> >>> +        exit(0);
> >>> +    }
> >>> +EOF
> >>> +        if compile_prog "" "-lbpf" ; then
> >>> +            have_bpf=3Dyes
> >>> +            bpf=3Dyes
> >>> +        fi
> >>> +    fi
> >>> +    if test "$have_bpf" =3D "no"; then
> >>> +      feature_not_found "bpf" "the libbpf is not available"
> >>> +    fi

Yes, this is a mistake. These 3 lines are to be removed.
If libbpf is not installed, this should not fail the build.

> >>> +fi
> >>> +
> >>>    ##########################################
> >>>    # check if rtnetlink.h exists and is useful
> >>>    have_rtnetlink=3Dno
> >>> @@ -5905,6 +5935,9 @@ fi
> >>>    if test "$membarrier" =3D "yes" ; then
> >>>      echo "CONFIG_MEMBARRIER=3Dy" >> $config_host_mak
> >>>    fi
> >>> +if test "$bpf" =3D "yes" -a "$bigendian" !=3D "yes" -a "$linux" =3D =
"yes" ; then
> >>> +  echo "CONFIG_EBPF=3Dy" >> $config_host_mak
> >>> +fi
> >>>    if test "$signalfd" =3D "yes" ; then
> >>>      echo "CONFIG_SIGNALFD=3Dy" >> $config_host_mak
> >>>    fi
> >>> diff --git a/ebpf/ebpf_rss-stub.c b/ebpf/ebpf_rss-stub.c
> >>> new file mode 100644
> >>> index 0000000000..e71e229190
> >>> --- /dev/null
> >>> +++ b/ebpf/ebpf_rss-stub.c
> >>> @@ -0,0 +1,40 @@
> >>> +/*
> >>> + * eBPF RSS stub file
> >>> + *
> >>> + * Developed by Daynix Computing LTD (http://www.daynix.com)
> >>> + *
> >>> + * Authors:
> >>> + *  Yuri Benditovich <yuri.benditovich@daynix.com>
> >>> + *
> >>> + * This work is licensed under the terms of the GNU GPL, version 2. =
 See
> >>> + * the COPYING file in the top-level directory.
> >>> + */
> >>> +
> >>> +#include "qemu/osdep.h"
> >>> +#include "ebpf/ebpf_rss.h"
> >>
> >> I wonder why not simply use #ifdef #else to exclude the rss functions.
> > Just to make the reading easier.
> >
> >> If I read code correctly, this stub requires rss_is_loaded called befo=
re
> >> ebpf_rss_set_all(), so actually ebpf_rss_is_loaded serve the same as
> > Can you please get into details?
> > I think the stub does not require it, it just converts all the
> > ebpf_rss calls to nop at link time.
> > If I miss something please let us know, we'll fix it in v4.
>
>
> I mean the current can not be used without checking rss_is_loaded(). So
> rss_is_loaded() is somehow a guard like macro.
>
> I personally prefer #ifdef but it's not a must.
>
> Thanks
>

