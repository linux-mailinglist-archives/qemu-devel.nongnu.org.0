Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ADB236C45C
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 12:49:50 +0200 (CEST)
Received: from localhost ([::1]:48628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbLHo-0000gk-TS
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 06:49:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1lbLG3-00008D-VC
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 06:48:00 -0400
Received: from mail-oo1-xc2b.google.com ([2607:f8b0:4864:20::c2b]:45898)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1lbLFv-0000z6-Me
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 06:47:59 -0400
Received: by mail-oo1-xc2b.google.com with SMTP id
 s1-20020a4ac1010000b02901cfd9170ce2so12960638oop.12
 for <qemu-devel@nongnu.org>; Tue, 27 Apr 2021 03:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MVCgfWptwJbg8uKu0vHS9chXSWwIeVtXN8j8v5H5Ehw=;
 b=cmseWeA5x4/zhemoxn4jnK3uqaDjtolVSSCaRIrtxg+3yU+rc9qWrinm7bGfEaTq49
 LUSiRmlaIEfPx1VT/j5r4X+883m6rXngbkF5og7IBjVSM6VK7dUlcGKltjR0+jKQXh63
 2sLYDk0UnXidAz+rFolIlyD3wApc5DsW0n3/fd8y16HaEt32UHvd7AL+K/q20RzfvDjK
 vrw4WRqh9E6YBA3t/8pdK+L9gObrW63tByZ0D+6l5p3men++2GWCkHcskWkoTa/73952
 ezdmytsSV9yX2TSjiEMpOsEyhSf8FlEDq0LpIrLd6Bytwsn0OjunfgKRffybDZLMkLuB
 OfEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MVCgfWptwJbg8uKu0vHS9chXSWwIeVtXN8j8v5H5Ehw=;
 b=g99fQ2OfX2z51npGaEPLM0ShL0T6U8sd+tf/eAweyEYVY0sJeq2hDNi8biGMWLb1hd
 L7krbKkoRod3ScLAO3ksFO1YF+yXURkZJf+SgAceg5drVzByCk91fXjjspYn0jCFqwKU
 wQsad8ZvH7rlu+92i3upbF6z0ud8xaxFa2dg4nF2CretaA9SmYLadzAH8PnqxiWa4x+s
 LJOzixhZKSNk8454UPqd3GzNyIp3wxzplu+EN2Xw5nFjB+nBd9T3KB+T9H3UTXNuuT06
 J/HnEX3Lcd0BS6HgxF8cuPUlyhJPq/eXz5WcHCQkTqHhskkO9kAemaIIN3pGkJhe5XcW
 C9cQ==
X-Gm-Message-State: AOAM530OcBI21h0SYEfdUVKneJXSqwqyHXuPKkp5jZTp2D20xlb1r1+Q
 afV/ttTO2eH0VA4qZGmDsdIXf7e6WNiRjdjc0M4yqQ==
X-Google-Smtp-Source: ABdhPJzXRiPkWnMBKagwtHiruea941yLTpTQcyVR0yds01agrlOAm417hfYF5+GB/TuUrdXjrxjcjwCxC9pDA/4ifOA=
X-Received: by 2002:a4a:e386:: with SMTP id l6mr17299522oov.81.1619520469846; 
 Tue, 27 Apr 2021 03:47:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210412082512.14998-1-andrew@daynix.com>
 <94e8d3e4-7c63-4b42-109d-2c655ac118ba@redhat.com>
In-Reply-To: <94e8d3e4-7c63-4b42-109d-2c655ac118ba@redhat.com>
From: Andrew Melnichenko <andrew@daynix.com>
Date: Tue, 27 Apr 2021 13:47:38 +0300
Message-ID: <CABcq3pE1GUCxrjo=Vj-w_e+hKhhCnQa_YC6B4cfC1qm_Wh2pNQ@mail.gmail.com>
Subject: Re: [PATCH v6 0/7] eBPF RSS support for virtio-net
To: Jason Wang <jasowang@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000004fdf7c05c0f1fe0f"
Received-SPF: none client-ip=2607:f8b0:4864:20::c2b;
 envelope-from=andrew@daynix.com; helo=mail-oo1-xc2b.google.com
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
Cc: Yan Vugenfirer <yan@daynix.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000004fdf7c05c0f1fe0f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,
I've checked the issue. Apparently, libbpf can't work with a skeleton on
Debian.
Version check would not help - versioning differs at different distros.
I've added a small check:

diff --git a/meson.build b/meson.build
> index ca551dd15d..4a51a25643 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1018,6 +1018,20 @@ endif
>
>  # libbpf
>  libbpf =3D dependency('libbpf', required: get_option('bpf'))
> +if libbpf.found() and not cc.links('''
> +   #include <bpf/libbpf.h>
> +   int main(void)
> +   {
> +     bpf_object__destroy_skeleton(NULL);
> +     return 0;
> +   }''', dependencies: libbpf)
> +  libbpf =3D not_found
> +  if get_option('bpf').enabled()
> +    error('libbpf skeleton test failed')
> +  else
> +    warning('libbpf skeleton test failed, disabling')
> +  endif
> +endif
>
>  if get_option('cfi')
>    cfi_flags=3D[]
>

Is it possible to prepare an additional patch or should I prepare new
eBPFv7 patches?


On Sun, Apr 25, 2021 at 6:32 AM Jason Wang <jasowang@redhat.com> wrote:

>
> =E5=9C=A8 2021/4/12 =E4=B8=8B=E5=8D=884:25, Andrew Melnychenko =E5=86=99=
=E9=81=93:
> > This set of patches introduces the usage of eBPF for packet steering
> > and RSS hash calculation:
> > * RSS(Receive Side Scaling) is used to distribute network packets to
> > guest virtqueues by calculating packet hash
> > * Additionally adding support for the usage of RSS with vhost
> >
> > The eBPF works on kernels 5.8+
> > On earlier kerneld it fails to load and the RSS feature is reported
> > only without vhost and implemented in 'in-qemu' software.
> >
> > Implementation notes:
> > Linux TAP TUNSETSTEERINGEBPF ioctl was used to set the eBPF program.
> > Added libbpf dependency and eBPF support.
> > The eBPF program is part of the qemu and presented as an array
> > of BPF ELF file data. The eBPF array file initially generated by bpftoo=
l.
> > The compilation of eBPF is not part of QEMU build and can be done
> > using provided Makefile.ebpf.
> > Added changes to virtio-net and vhost, primary eBPF RSS is used.
> > 'in-qemu' RSS used in the case of hash population and as a fallback
> option.
> > For vhost, the hash population feature is not reported to the guest.
> >
> > Please also see the documentation in PATCH 6/7.
> >
> > Known issues:
> > * hash population not supported by eBPF RSS: 'in-qemu' RSS used
> > as a fallback, also, hash population feature is not reported to guests
> > with vhost.
> > * IPv6 extensions still in progress.
>
>
> Want to merge but it fails to build on Debian 10.9:
>
> dpkg -l | grep libbpf
> ii  libbpf-dev:amd64              4.19.181-1 amd64        eBPF helper
> library (development files)
> ii  libbpf4.19:amd64              4.19.181-1 amd64        eBPF helper
> library (shared library)
>
> I configure use --enable-bpf --target-list=3Dx86_64-softmmu, and I get:
>
> [3/1375] Compiling C object libcommon.fa.p/ebpf_ebpf_rss.c.o
> FAILED: libcommon.fa.p/ebpf_ebpf_rss.c.o
> cc -Ilibcommon.fa.p -I. -I.. -I../slirp -I../slirp/src -I../dtc/libfdt
> -I../capstone/include/capstone -Iqapi -Itrace -Iui -Iui/shader
> -I/usr/include/libmount -I/usr/include/blkid -I/usr/include/uuid
> -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include
> -I/usr/include/gio-unix-2.0 -I/usr/include/pixman-1
> -fdiagnostics-color=3Dauto -pipe -Wall -Winvalid-pch -Werror -std=3Dgnu99
> -O2 -g -isystem /home/devel/git/qemu/linux-headers -isystem
> linux-headers -iquote . -iquote /home/devel/git/qemu -iquote
> /home/devel/git/qemu/include -iquote /home/devel/git/qemu/disas/libvixl
> -iquote /home/devel/git/qemu/tcg/i386 -iquote
> /home/devel/git/qemu/accel/tcg -pthread -U_FORTIFY_SOURCE
> -D_FORTIFY_SOURCE=3D2 -m64 -mcx16 -D_GNU_SOURCE -D_FILE_OFFSET_BITS=3D64
> -D_LARGEFILE_SOURCE -Wstrict-prototypes -Wredundant-decls -Wundef
> -Wwrite-strings -Wmissing-prototypes -fno-strict-aliasing -fno-common
> -fwrapv -Wold-style-declaration -Wold-style-definition -Wtype-limits
> -Wformat-security -Wformat-y2k -Winit-self -Wignored-qualifiers
> -Wempty-body -Wnested-externs -Wendif-labels -Wexpansion-to-defined
> -Wimplicit-fallthrough=3D2 -Wno-missing-include-dirs
> -Wno-shift-negative-value -Wno-psabi -fstack-protector-strong -fPIC -MD
> -MQ libcommon.fa.p/ebpf_ebpf_rss.c.o -MF
> libcommon.fa.p/ebpf_ebpf_rss.c.o.d -o libcommon.fa.p/ebpf_ebpf_rss.c.o
> -c ../ebpf/ebpf_rss.c
> In file included from ../ebpf/ebpf_rss.c:23:
> /home/devel/git/qemu/ebpf/rss.bpf.skeleton.h: In function
> =E2=80=98rss_bpf__destroy=E2=80=99:
> /home/devel/git/qemu/ebpf/rss.bpf.skeleton.h:32:3: error: implicit
> declaration of function =E2=80=98bpf_object__destroy_skeleton=E2=80=99; d=
id you mean
> =E2=80=98bpf_object__kversion=E2=80=99? [-Werror=3Dimplicit-function-decl=
aration]
>     bpf_object__destroy_skeleton(obj->skeleton);
>     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>     bpf_object__kversion
> /home/devel/git/qemu/ebpf/rss.bpf.skeleton.h:32:3: error: nested extern
> declaration of =E2=80=98bpf_object__destroy_skeleton=E2=80=99 [-Werror=3D=
nested-externs]
> /home/devel/git/qemu/ebpf/rss.bpf.skeleton.h: At top level:
> /home/devel/git/qemu/ebpf/rss.bpf.skeleton.h:40:33: error: =E2=80=98struc=
t
> bpf_object_open_opts=E2=80=99 declared inside parameter list will not be =
visible
> outside of this definition or declaration [-Werror]
>   rss_bpf__open_opts(const struct bpf_object_open_opts *opts)
>                                   ^~~~~~~~~~~~~~~~~~~~
> /home/devel/git/qemu/ebpf/rss.bpf.skeleton.h: In function
> =E2=80=98rss_bpf__open_opts=E2=80=99:
> /home/devel/git/qemu/ebpf/rss.bpf.skeleton.h:49:6: error: implicit
> declaration of function =E2=80=98bpf_object__open_skeleton=E2=80=99; did =
you mean
> =E2=80=98bpf_object__open_buffer=E2=80=99? [-Werror=3Dimplicit-function-d=
eclaration]
>    if (bpf_object__open_skeleton(obj->skeleton, opts))
>        ^~~~~~~~~~~~~~~~~~~~~~~~~
>        bpf_object__open_buffer
> /home/devel/git/qemu/ebpf/rss.bpf.skeleton.h:49:6: error: nested extern
> declaration of =E2=80=98bpf_object__open_skeleton=E2=80=99 [-Werror=3Dnes=
ted-externs]
> /home/devel/git/qemu/ebpf/rss.bpf.skeleton.h: In function =E2=80=98rss_bp=
f__load=E2=80=99:
> /home/devel/git/qemu/ebpf/rss.bpf.skeleton.h:67:9: error: implicit
> declaration of function =E2=80=98bpf_object__load_skeleton=E2=80=99; did =
you mean
> =E2=80=98bpf_object__load=E2=80=99? [-Werror=3Dimplicit-function-declarat=
ion]
>    return bpf_object__load_skeleton(obj->skeleton);
>           ^~~~~~~~~~~~~~~~~~~~~~~~~
>           bpf_object__load
> /home/devel/git/qemu/ebpf/rss.bpf.skeleton.h:67:9: error: nested extern
> declaration of =E2=80=98bpf_object__load_skeleton=E2=80=99 [-Werror=3Dnes=
ted-externs]
> /home/devel/git/qemu/ebpf/rss.bpf.skeleton.h: In function
> =E2=80=98rss_bpf__attach=E2=80=99:
> /home/devel/git/qemu/ebpf/rss.bpf.skeleton.h:88:9: error: implicit
> declaration of function =E2=80=98bpf_object__attach_skeleton=E2=80=99; di=
d you mean
> =E2=80=98bpf_object__for_each_safe=E2=80=99? [-Werror=3Dimplicit-function=
-declaration]
>    return bpf_object__attach_skeleton(obj->skeleton);
>           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>           bpf_object__for_each_safe
> /home/devel/git/qemu/ebpf/rss.bpf.skeleton.h:88:9: error: nested extern
> declaration of =E2=80=98bpf_object__attach_skeleton=E2=80=99 [-Werror=3Dn=
ested-externs]
> /home/devel/git/qemu/ebpf/rss.bpf.skeleton.h: In function
> =E2=80=98rss_bpf__detach=E2=80=99:
> /home/devel/git/qemu/ebpf/rss.bpf.skeleton.h:94:9: error: implicit
> declaration of function =E2=80=98bpf_object__detach_skeleton=E2=80=99; di=
d you mean
> =E2=80=98bpf_object__for_each_safe=E2=80=99? [-Werror=3Dimplicit-function=
-declaration]
>    return bpf_object__detach_skeleton(obj->skeleton);
>           ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>           bpf_object__for_each_safe
> /home/devel/git/qemu/ebpf/rss.bpf.skeleton.h:94:9: error: nested extern
> declaration of =E2=80=98bpf_object__detach_skeleton=E2=80=99 [-Werror=3Dn=
ested-externs]
> /home/devel/git/qemu/ebpf/rss.bpf.skeleton.h:94:9: error: =E2=80=98return=
=E2=80=99 with
> a value, in function returning void [-Werror]
>    return bpf_object__detach_skeleton(obj->skeleton);
>           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> /home/devel/git/qemu/ebpf/rss.bpf.skeleton.h:92:1: note: declared here
>   rss_bpf__detach(struct rss_bpf *obj)
>   ^~~~~~~~~~~~~~~
> /home/devel/git/qemu/ebpf/rss.bpf.skeleton.h: In function
> =E2=80=98rss_bpf__create_skeleton=E2=80=99:
> /home/devel/git/qemu/ebpf/rss.bpf.skeleton.h:102:53: error:
> dereferencing pointer to incomplete type =E2=80=98struct bpf_object_skele=
ton=E2=80=99
>    s =3D (struct bpf_object_skeleton *)calloc(1, sizeof(*s));
>                                                       ^~
> cc1: all warnings being treated as errors
>
> Thanks
>
>
> >
> > Changes since v1:
> > * using libbpf instead of direct 'bpf' system call.
> > * added libbpf dependency to the configure/meson scripts.
> > * changed python script for eBPF .h file generation.
> > * changed eBPF program - reading L3 proto from ethernet frame.
> > * added TUNSETSTEERINGEBPF define for TUN.
> > * changed the maintainer's info.
> > * added license headers.
> > * refactored code.
> >
> > Changes since v2:
> > * using bpftool for eBPF skeleton generation.
> > * ebpf_rss is refactored to use skeleton generated by bpftool.
> > * added/adjasted license in comment sections and in eBPF file.
> > * rss.bpf.c and Makefile.ebpf moved to the tool/ebpf folder.
> > * virtio-net eBPF rss refactored. Now eBPF initialized during realize()=
.
> >
> > Changes since v3:
> > * rebased to last master.
> > * fixed issue with failed build without libbpf.
> > * fixed ebpf loading without rss option.
> > * refactored labels in ebpf_rss.c
> >
> > Changes since v4:
> > * refactored configure/meson script.
> > * added checks for load_bytes in ebpf.
> > * documentation added to the index.
> > * refactored Makefile and rss.bpf.c.
> > * rebased to last master.
> >
> > Changes since v5:
> > * fixed issue with dstopt parsing in the eBPF program.
> > * added fragment packet parsing to skip L4.
> >
> > Andrew (7):
> >    net/tap: Added TUNSETSTEERINGEBPF code.
> >    net: Added SetSteeringEBPF method for NetClientState.
> >    ebpf: Added eBPF RSS program.
> >    ebpf: Added eBPF RSS loader.
> >    virtio-net: Added eBPF RSS to virtio-net.
> >    docs: Added eBPF documentation.
> >    MAINTAINERS: Added eBPF maintainers information.
> >
> >   MAINTAINERS                    |   8 +
> >   configure                      |   8 +-
> >   docs/devel/ebpf_rss.rst        | 125 ++++++++
> >   docs/devel/index.rst           |   1 +
> >   ebpf/ebpf_rss-stub.c           |  40 +++
> >   ebpf/ebpf_rss.c                | 165 ++++++++++
> >   ebpf/ebpf_rss.h                |  44 +++
> >   ebpf/meson.build               |   1 +
> >   ebpf/rss.bpf.skeleton.h        | 431 +++++++++++++++++++++++++
> >   ebpf/trace-events              |   4 +
> >   ebpf/trace.h                   |   2 +
> >   hw/net/vhost_net.c             |   3 +
> >   hw/net/virtio-net.c            | 115 ++++++-
> >   include/hw/virtio/virtio-net.h |   4 +
> >   include/net/net.h              |   2 +
> >   meson.build                    |   9 +
> >   meson_options.txt              |   2 +
> >   net/tap-bsd.c                  |   5 +
> >   net/tap-linux.c                |  13 +
> >   net/tap-linux.h                |   1 +
> >   net/tap-solaris.c              |   5 +
> >   net/tap-stub.c                 |   5 +
> >   net/tap.c                      |   9 +
> >   net/tap_int.h                  |   1 +
> >   net/vhost-vdpa.c               |   2 +
> >   tools/ebpf/Makefile.ebpf       |  22 ++
> >   tools/ebpf/rss.bpf.c           | 569 ++++++++++++++++++++++++++++++++=
+
> >   27 files changed, 1592 insertions(+), 4 deletions(-)
> >   create mode 100644 docs/devel/ebpf_rss.rst
> >   create mode 100644 ebpf/ebpf_rss-stub.c
> >   create mode 100644 ebpf/ebpf_rss.c
> >   create mode 100644 ebpf/ebpf_rss.h
> >   create mode 100644 ebpf/meson.build
> >   create mode 100644 ebpf/rss.bpf.skeleton.h
> >   create mode 100644 ebpf/trace-events
> >   create mode 100644 ebpf/trace.h
> >   create mode 100755 tools/ebpf/Makefile.ebpf
> >   create mode 100644 tools/ebpf/rss.bpf.c
> >
>
>

--0000000000004fdf7c05c0f1fe0f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,</div><div>I&#39;ve checked the issue. Apparently,=
 libbpf can&#39;t work with a skeleton=C2=A0on Debian.</div><div>Version ch=
eck would not help - versioning differs at different distros.</div><div>I&#=
39;ve added a small check:</div><div><br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex"><div>diff --git a/meson.build b/meson.build<br>index =
ca551dd15d..4a51a25643 100644<br>--- a/meson.build<br>+++ b/meson.build<br>=
@@ -1018,6 +1018,20 @@ endif<br>=C2=A0<br>=C2=A0# libbpf<br>=C2=A0libbpf =
=3D dependency(&#39;libbpf&#39;, required: get_option(&#39;bpf&#39;))<br>+i=
f libbpf.found() and not cc.links(&#39;&#39;&#39;<br>+ =C2=A0 #include &lt;=
bpf/libbpf.h&gt;<br>+ =C2=A0 int main(void)<br>+ =C2=A0 {<br>+ =C2=A0 =C2=
=A0 bpf_object__destroy_skeleton(NULL);<br>+ =C2=A0 =C2=A0 return 0;<br>+ =
=C2=A0 }&#39;&#39;&#39;, dependencies: libbpf)<br>+ =C2=A0libbpf =3D not_fo=
und<br>+ =C2=A0if get_option(&#39;bpf&#39;).enabled()<br>+ =C2=A0 =C2=A0err=
or(&#39;libbpf skeleton test failed&#39;)<br>+ =C2=A0else<br>+ =C2=A0 =C2=
=A0warning(&#39;libbpf skeleton test failed, disabling&#39;)<br>+ =C2=A0end=
if<br>+endif<br>=C2=A0<br>=C2=A0if get_option(&#39;cfi&#39;)<br>=C2=A0 =C2=
=A0cfi_flags=3D[]<br></div></blockquote><div><br></div><div>Is it possible =
to prepare an additional patch or should I prepare new eBPFv7 patches?<br><=
/div></div><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr" class=3D"gmail_attr">On Sun, Apr 25, 2021 at 6:32 AM Jason Wang =
&lt;<a href=3D"mailto:jasowang@redhat.com" target=3D"_blank">jasowang@redha=
t.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex"><br>
=E5=9C=A8 2021/4/12 =E4=B8=8B=E5=8D=884:25, Andrew Melnychenko =E5=86=99=E9=
=81=93:<br>
&gt; This set of patches introduces the usage of eBPF for packet steering<b=
r>
&gt; and RSS hash calculation:<br>
&gt; * RSS(Receive Side Scaling) is used to distribute network packets to<b=
r>
&gt; guest virtqueues by calculating packet hash<br>
&gt; * Additionally adding support for the usage of RSS with vhost<br>
&gt;<br>
&gt; The eBPF works on kernels 5.8+<br>
&gt; On earlier kerneld it fails to load and the RSS feature is reported<br=
>
&gt; only without vhost and implemented in &#39;in-qemu&#39; software.<br>
&gt;<br>
&gt; Implementation notes:<br>
&gt; Linux TAP TUNSETSTEERINGEBPF ioctl was used to set the eBPF program.<b=
r>
&gt; Added libbpf dependency and eBPF support.<br>
&gt; The eBPF program is part of the qemu and presented as an array<br>
&gt; of BPF ELF file data. The eBPF array file initially generated by bpfto=
ol.<br>
&gt; The compilation of eBPF is not part of QEMU build and can be done<br>
&gt; using provided Makefile.ebpf.<br>
&gt; Added changes to virtio-net and vhost, primary eBPF RSS is used.<br>
&gt; &#39;in-qemu&#39; RSS used in the case of hash population and as a fal=
lback option.<br>
&gt; For vhost, the hash population feature is not reported to the guest.<b=
r>
&gt;<br>
&gt; Please also see the documentation in PATCH 6/7.<br>
&gt;<br>
&gt; Known issues:<br>
&gt; * hash population not supported by eBPF RSS: &#39;in-qemu&#39; RSS use=
d<br>
&gt; as a fallback, also, hash population feature is not reported to guests=
<br>
&gt; with vhost.<br>
&gt; * IPv6 extensions still in progress.<br>
<br>
<br>
Want to merge but it fails to build on Debian 10.9:<br>
<br>
dpkg -l | grep libbpf<br>
ii=C2=A0 libbpf-dev:amd64=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4.19.181-1 amd64=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 eBPF helper <br>
library (development files)<br>
ii=C2=A0 libbpf4.19:amd64=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4.19.181-1 amd64=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 eBPF helper <br>
library (shared library)<br>
<br>
I configure use --enable-bpf --target-list=3Dx86_64-softmmu, and I get:<br>
<br>
[3/1375] Compiling C object libcommon.fa.p/ebpf_ebpf_rss.c.o<br>
FAILED: libcommon.fa.p/ebpf_ebpf_rss.c.o<br>
cc -Ilibcommon.fa.p -I. -I.. -I../slirp -I../slirp/src -I../dtc/libfdt <br>
-I../capstone/include/capstone -Iqapi -Itrace -Iui -Iui/shader <br>
-I/usr/include/libmount -I/usr/include/blkid -I/usr/include/uuid <br>
-I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include <br>
-I/usr/include/gio-unix-2.0 -I/usr/include/pixman-1 <br>
-fdiagnostics-color=3Dauto -pipe -Wall -Winvalid-pch -Werror -std=3Dgnu99 <=
br>
-O2 -g -isystem /home/devel/git/qemu/linux-headers -isystem <br>
linux-headers -iquote . -iquote /home/devel/git/qemu -iquote <br>
/home/devel/git/qemu/include -iquote /home/devel/git/qemu/disas/libvixl <br=
>
-iquote /home/devel/git/qemu/tcg/i386 -iquote <br>
/home/devel/git/qemu/accel/tcg -pthread -U_FORTIFY_SOURCE <br>
-D_FORTIFY_SOURCE=3D2 -m64 -mcx16 -D_GNU_SOURCE -D_FILE_OFFSET_BITS=3D64 <b=
r>
-D_LARGEFILE_SOURCE -Wstrict-prototypes -Wredundant-decls -Wundef <br>
-Wwrite-strings -Wmissing-prototypes -fno-strict-aliasing -fno-common <br>
-fwrapv -Wold-style-declaration -Wold-style-definition -Wtype-limits <br>
-Wformat-security -Wformat-y2k -Winit-self -Wignored-qualifiers <br>
-Wempty-body -Wnested-externs -Wendif-labels -Wexpansion-to-defined <br>
-Wimplicit-fallthrough=3D2 -Wno-missing-include-dirs <br>
-Wno-shift-negative-value -Wno-psabi -fstack-protector-strong -fPIC -MD <br=
>
-MQ libcommon.fa.p/ebpf_ebpf_rss.c.o -MF <br>
libcommon.fa.p/ebpf_ebpf_rss.c.o.d -o libcommon.fa.p/ebpf_ebpf_rss.c.o <br>
-c ../ebpf/ebpf_rss.c<br>
In file included from ../ebpf/ebpf_rss.c:23:<br>
/home/devel/git/qemu/ebpf/rss.bpf.skeleton.h: In function <br>
=E2=80=98rss_bpf__destroy=E2=80=99:<br>
/home/devel/git/qemu/ebpf/rss.bpf.skeleton.h:32:3: error: implicit <br>
declaration of function =E2=80=98bpf_object__destroy_skeleton=E2=80=99; did=
 you mean <br>
=E2=80=98bpf_object__kversion=E2=80=99? [-Werror=3Dimplicit-function-declar=
ation]<br>
=C2=A0=C2=A0=C2=A0 bpf_object__destroy_skeleton(obj-&gt;skeleton);<br>
=C2=A0=C2=A0=C2=A0 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~<br>
=C2=A0=C2=A0=C2=A0 bpf_object__kversion<br>
/home/devel/git/qemu/ebpf/rss.bpf.skeleton.h:32:3: error: nested extern <br=
>
declaration of =E2=80=98bpf_object__destroy_skeleton=E2=80=99 [-Werror=3Dne=
sted-externs]<br>
/home/devel/git/qemu/ebpf/rss.bpf.skeleton.h: At top level:<br>
/home/devel/git/qemu/ebpf/rss.bpf.skeleton.h:40:33: error: =E2=80=98struct =
<br>
bpf_object_open_opts=E2=80=99 declared inside parameter list will not be vi=
sible <br>
outside of this definition or declaration [-Werror]<br>
=C2=A0=C2=A0rss_bpf__open_opts(const struct bpf_object_open_opts *opts)<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~~~~~~~~~~~~~<br>
/home/devel/git/qemu/ebpf/rss.bpf.skeleton.h: In function <br>
=E2=80=98rss_bpf__open_opts=E2=80=99:<br>
/home/devel/git/qemu/ebpf/rss.bpf.skeleton.h:49:6: error: implicit <br>
declaration of function =E2=80=98bpf_object__open_skeleton=E2=80=99; did yo=
u mean <br>
=E2=80=98bpf_object__open_buffer=E2=80=99? [-Werror=3Dimplicit-function-dec=
laration]<br>
=C2=A0=C2=A0 if (bpf_object__open_skeleton(obj-&gt;skeleton, opts))<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~~~~~~~~~~~~~~~~~~<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bpf_object__open_buffer<br>
/home/devel/git/qemu/ebpf/rss.bpf.skeleton.h:49:6: error: nested extern <br=
>
declaration of =E2=80=98bpf_object__open_skeleton=E2=80=99 [-Werror=3Dneste=
d-externs]<br>
/home/devel/git/qemu/ebpf/rss.bpf.skeleton.h: In function =E2=80=98rss_bpf_=
_load=E2=80=99:<br>
/home/devel/git/qemu/ebpf/rss.bpf.skeleton.h:67:9: error: implicit <br>
declaration of function =E2=80=98bpf_object__load_skeleton=E2=80=99; did yo=
u mean <br>
=E2=80=98bpf_object__load=E2=80=99? [-Werror=3Dimplicit-function-declaratio=
n]<br>
=C2=A0=C2=A0 return bpf_object__load_skeleton(obj-&gt;skeleton);<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~~~~~~~~~~~~~=
~~~~~<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bpf_object__load<br>
/home/devel/git/qemu/ebpf/rss.bpf.skeleton.h:67:9: error: nested extern <br=
>
declaration of =E2=80=98bpf_object__load_skeleton=E2=80=99 [-Werror=3Dneste=
d-externs]<br>
/home/devel/git/qemu/ebpf/rss.bpf.skeleton.h: In function =E2=80=98rss_bpf_=
_attach=E2=80=99:<br>
/home/devel/git/qemu/ebpf/rss.bpf.skeleton.h:88:9: error: implicit <br>
declaration of function =E2=80=98bpf_object__attach_skeleton=E2=80=99; did =
you mean <br>
=E2=80=98bpf_object__for_each_safe=E2=80=99? [-Werror=3Dimplicit-function-d=
eclaration]<br>
=C2=A0=C2=A0 return bpf_object__attach_skeleton(obj-&gt;skeleton);<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~~~~~~~~~~~~~=
~~~~~~~<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bpf_object__for_each=
_safe<br>
/home/devel/git/qemu/ebpf/rss.bpf.skeleton.h:88:9: error: nested extern <br=
>
declaration of =E2=80=98bpf_object__attach_skeleton=E2=80=99 [-Werror=3Dnes=
ted-externs]<br>
/home/devel/git/qemu/ebpf/rss.bpf.skeleton.h: In function =E2=80=98rss_bpf_=
_detach=E2=80=99:<br>
/home/devel/git/qemu/ebpf/rss.bpf.skeleton.h:94:9: error: implicit <br>
declaration of function =E2=80=98bpf_object__detach_skeleton=E2=80=99; did =
you mean <br>
=E2=80=98bpf_object__for_each_safe=E2=80=99? [-Werror=3Dimplicit-function-d=
eclaration]<br>
=C2=A0=C2=A0 return bpf_object__detach_skeleton(obj-&gt;skeleton);<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~~~~~~~~~~~~~=
~~~~~~~<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bpf_object__for_each=
_safe<br>
/home/devel/git/qemu/ebpf/rss.bpf.skeleton.h:94:9: error: nested extern <br=
>
declaration of =E2=80=98bpf_object__detach_skeleton=E2=80=99 [-Werror=3Dnes=
ted-externs]<br>
/home/devel/git/qemu/ebpf/rss.bpf.skeleton.h:94:9: error: =E2=80=98return=
=E2=80=99 with <br>
a value, in function returning void [-Werror]<br>
=C2=A0=C2=A0 return bpf_object__detach_skeleton(obj-&gt;skeleton);<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~<br>
/home/devel/git/qemu/ebpf/rss.bpf.skeleton.h:92:1: note: declared here<br>
=C2=A0=C2=A0rss_bpf__detach(struct rss_bpf *obj)<br>
=C2=A0=C2=A0^~~~~~~~~~~~~~~<br>
/home/devel/git/qemu/ebpf/rss.bpf.skeleton.h: In function <br>
=E2=80=98rss_bpf__create_skeleton=E2=80=99:<br>
/home/devel/git/qemu/ebpf/rss.bpf.skeleton.h:102:53: error: <br>
dereferencing pointer to incomplete type =E2=80=98struct bpf_object_skeleto=
n=E2=80=99<br>
=C2=A0=C2=A0 s =3D (struct bpf_object_skeleton *)calloc(1, sizeof(*s));<br>
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 ^~<br>
cc1: all warnings being treated as errors<br>
<br>
Thanks<br>
<br>
<br>
&gt;<br>
&gt; Changes since v1:<br>
&gt; * using libbpf instead of direct &#39;bpf&#39; system call.<br>
&gt; * added libbpf dependency to the configure/meson scripts.<br>
&gt; * changed python script for eBPF .h file generation.<br>
&gt; * changed eBPF program - reading L3 proto from ethernet frame.<br>
&gt; * added TUNSETSTEERINGEBPF define for TUN.<br>
&gt; * changed the maintainer&#39;s info.<br>
&gt; * added license headers.<br>
&gt; * refactored code.<br>
&gt;<br>
&gt; Changes since v2:<br>
&gt; * using bpftool for eBPF skeleton generation.<br>
&gt; * ebpf_rss is refactored to use skeleton generated by bpftool.<br>
&gt; * added/adjasted license in comment sections and in eBPF file.<br>
&gt; * rss.bpf.c and Makefile.ebpf moved to the tool/ebpf folder.<br>
&gt; * virtio-net eBPF rss refactored. Now eBPF initialized during realize(=
).<br>
&gt;<br>
&gt; Changes since v3:<br>
&gt; * rebased to last master.<br>
&gt; * fixed issue with failed build without libbpf.<br>
&gt; * fixed ebpf loading without rss option.<br>
&gt; * refactored labels in ebpf_rss.c<br>
&gt;<br>
&gt; Changes since v4:<br>
&gt; * refactored configure/meson script.<br>
&gt; * added checks for load_bytes in ebpf.<br>
&gt; * documentation added to the index.<br>
&gt; * refactored Makefile and rss.bpf.c.<br>
&gt; * rebased to last master.<br>
&gt;<br>
&gt; Changes since v5:<br>
&gt; * fixed issue with dstopt parsing in the eBPF program.<br>
&gt; * added fragment packet parsing to skip L4.<br>
&gt;<br>
&gt; Andrew (7):<br>
&gt;=C2=A0 =C2=A0 net/tap: Added TUNSETSTEERINGEBPF code.<br>
&gt;=C2=A0 =C2=A0 net: Added SetSteeringEBPF method for NetClientState.<br>
&gt;=C2=A0 =C2=A0 ebpf: Added eBPF RSS program.<br>
&gt;=C2=A0 =C2=A0 ebpf: Added eBPF RSS loader.<br>
&gt;=C2=A0 =C2=A0 virtio-net: Added eBPF RSS to virtio-net.<br>
&gt;=C2=A0 =C2=A0 docs: Added eBPF documentation.<br>
&gt;=C2=A0 =C2=A0 MAINTAINERS: Added eBPF maintainers information.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0MAINTAINERS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A08 +<br>
&gt;=C2=A0 =C2=A0configure=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A08 +-<br>
&gt;=C2=A0 =C2=A0docs/devel/ebpf_rss.rst=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 125 +=
+++++++<br>
&gt;=C2=A0 =C2=A0docs/devel/index.rst=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 =C2=A0ebpf/ebpf_rss-stub.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 40 +++<br>
&gt;=C2=A0 =C2=A0ebpf/ebpf_rss.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 165 ++++++++++<br>
&gt;=C2=A0 =C2=A0ebpf/ebpf_rss.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 44 +++<br>
&gt;=C2=A0 =C2=A0ebpf/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 =C2=A0ebpf/rss.bpf.skeleton.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 431 +=
++++++++++++++++++++++++<br>
&gt;=C2=A0 =C2=A0ebpf/trace-events=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 =C2=A04 +<br>
&gt;=C2=A0 =C2=A0ebpf/trace.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +<br>
&gt;=C2=A0 =C2=A0hw/net/vhost_net.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 =C2=A03 +<br>
&gt;=C2=A0 =C2=A0hw/net/virtio-net.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 115 ++++++-<br>
&gt;=C2=A0 =C2=A0include/hw/virtio/virtio-net.h |=C2=A0 =C2=A04 +<br>
&gt;=C2=A0 =C2=A0include/net/net.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 =C2=A02 +<br>
&gt;=C2=A0 =C2=A0meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A09 +<br>
&gt;=C2=A0 =C2=A0meson_options.txt=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 =C2=A02 +<br>
&gt;=C2=A0 =C2=A0net/tap-bsd.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A05 +<br>
&gt;=C2=A0 =C2=A0net/tap-linux.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 13 +<br>
&gt;=C2=A0 =C2=A0net/tap-linux.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 =C2=A0net/tap-solaris.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 =C2=A05 +<br>
&gt;=C2=A0 =C2=A0net/tap-stub.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A05 +<br>
&gt;=C2=A0 =C2=A0net/tap.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A09 +<br>
&gt;=C2=A0 =C2=A0net/tap_int.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 =C2=A0net/vhost-vdpa.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A02 +<br>
&gt;=C2=A0 =C2=A0tools/ebpf/Makefile.ebpf=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0=
 22 ++<br>
&gt;=C2=A0 =C2=A0tools/ebpf/rss.bpf.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 569 +++++++++++++++++++++++++++++++++<br>
&gt;=C2=A0 =C2=A027 files changed, 1592 insertions(+), 4 deletions(-)<br>
&gt;=C2=A0 =C2=A0create mode 100644 docs/devel/ebpf_rss.rst<br>
&gt;=C2=A0 =C2=A0create mode 100644 ebpf/ebpf_rss-stub.c<br>
&gt;=C2=A0 =C2=A0create mode 100644 ebpf/ebpf_rss.c<br>
&gt;=C2=A0 =C2=A0create mode 100644 ebpf/ebpf_rss.h<br>
&gt;=C2=A0 =C2=A0create mode 100644 ebpf/meson.build<br>
&gt;=C2=A0 =C2=A0create mode 100644 ebpf/rss.bpf.skeleton.h<br>
&gt;=C2=A0 =C2=A0create mode 100644 ebpf/trace-events<br>
&gt;=C2=A0 =C2=A0create mode 100644 ebpf/trace.h<br>
&gt;=C2=A0 =C2=A0create mode 100755 tools/ebpf/Makefile.ebpf<br>
&gt;=C2=A0 =C2=A0create mode 100644 tools/ebpf/rss.bpf.c<br>
&gt;<br>
<br>
</blockquote></div>

--0000000000004fdf7c05c0f1fe0f--

