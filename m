Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9FE4352667
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Apr 2021 07:26:33 +0200 (CEST)
Received: from localhost ([::1]:38416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lSCKG-00022E-Se
	for lists+qemu-devel@lfdr.de; Fri, 02 Apr 2021 01:26:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuri.benditovich@daynix.com>)
 id 1lSCJD-0001WU-JS
 for qemu-devel@nongnu.org; Fri, 02 Apr 2021 01:25:28 -0400
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333]:42850)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yuri.benditovich@daynix.com>)
 id 1lSCJB-0005Hu-Ki
 for qemu-devel@nongnu.org; Fri, 02 Apr 2021 01:25:27 -0400
Received: by mail-ot1-x333.google.com with SMTP id
 c24-20020a9d6c980000b02902662e210895so3616748otr.9
 for <qemu-devel@nongnu.org>; Thu, 01 Apr 2021 22:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=h9iXpowPl0gaaoGgnJar/8eJ0KAT4e3ZSwJYwooBcD8=;
 b=hzgvFn+0fmgJxBWkGMJWLygAhC+HCC/4yZV8kh0cGNuNR7UWCqAEKxjrpJXHDYnUVC
 NXbeO7DKu7bsmOwFWYm479LaONkey4dwHqMT5xTm/p/PSV8yRXwZh1z3ktrHX4+B2lLk
 pqZhmdxCxn58i6fCZtQYJKOZnRYkGpI2rgU1MYb8jtGHYxA6l3ckY+6Eye8cUoOlbBQb
 bE6PgzlB9tIsxaDrQma7VeGhwnZtkhCEKIVOub6vrcXbbSkpgJ4X5y3X7Lj7K+qjzmtO
 c9n+WdDGkiZ3mRsQyE0t60XZFEaojkq9HmlBQD7rX8s50tb744xY3PdUWwVebn+zf532
 26+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=h9iXpowPl0gaaoGgnJar/8eJ0KAT4e3ZSwJYwooBcD8=;
 b=GIBv+OPrIzb6LMpqAzaq1MNDL7hqXIpMQ0RbaW7tDhlwhfxLsHezsfLm0Ei/rLx7Fd
 S155DPO4NIt6lQTixgMROa/qSkoYOkxw75mkALppWRQ6oPj2xe2f2I6PrcJy+26b6PHa
 o8wUATebp04nCTufVKrdfb5wepEV4WPlG+0OyPsmnlOjen4FcLWvCdp+B2ZIr50u7OYs
 bcr7Ug36AuC9GqeBMDKMdm9RB0TwrJSI/tsdVlv/z6gDTAB+vTMOakbO0jrP5+sSiA/8
 B3rlm9R/+pjZgsKUnBwp9y/LWek1mo4gTkHAbTbYYVYlVh5wTVPXlq+2xG3omssUAp1R
 QdDg==
X-Gm-Message-State: AOAM533AQpxKpoFSOSwjC8E1yUJBqhE5VQzj3ASEiUYh7rPx1FBmp/2R
 wMQbChlFpHrmNaQ9z7hva8ZwF7jWUG1WxQipte36ug==
X-Google-Smtp-Source: ABdhPJxd3w8KE5jNEmV0GrsQfAuIio46fEKG2I6I3WG5Cq7Kh0vXWii/gaa+tH8mMkNfLk5JK8uLMwBx3KUZc0PAUwI=
X-Received: by 2002:a9d:3c2:: with SMTP id f60mr10263970otf.220.1617341124178; 
 Thu, 01 Apr 2021 22:25:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210325153529.75831-1-andrew@daynix.com>
 <9046e35b-5487-c644-5186-d019255ccc70@redhat.com>
 <CAOEp5Ofwu_U_g1Hq678SV8eH2UpLEpTAHDYHtYcBPk71uzN52g@mail.gmail.com>
In-Reply-To: <CAOEp5Ofwu_U_g1Hq678SV8eH2UpLEpTAHDYHtYcBPk71uzN52g@mail.gmail.com>
From: Yuri Benditovich <yuri.benditovich@daynix.com>
Date: Fri, 2 Apr 2021 08:25:13 +0300
Message-ID: <CAOEp5Of-B261FE6-XrdcG-XT2nj0nMgPGux5qjZvH6U5qVfjEg@mail.gmail.com>
Subject: Re: [PATCH v5 0/7] eBPF RSS support for virtio-net
To: Jason Wang <jasowang@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: none client-ip=2607:f8b0:4864:20::333;
 envelope-from=yuri.benditovich@daynix.com; helo=mail-ot1-x333.google.com
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

More correctly, https://bugzilla.redhat.com/show_bug.cgi?id=3D1865786

On Fri, Apr 2, 2021 at 8:21 AM Yuri Benditovich
<yuri.benditovich@daynix.com> wrote:
>
> Hi Jason,
>
> Yes, the work to support RSS in the Linux virtio-net driver is in progres=
s.
> https://bugzilla.redhat.com/show_bug.cgi?id=3D1912082
>
> On Fri, Apr 2, 2021 at 5:57 AM Jason Wang <jasowang@redhat.com> wrote:
> >
> >
> > =E5=9C=A8 2021/3/25 =E4=B8=8B=E5=8D=8811:35, Andrew Melnychenko =E5=86=
=99=E9=81=93:
> > > This set of patches introduces the usage of eBPF for packet steering
> > > and RSS hash calculation:
> > > * RSS(Receive Side Scaling) is used to distribute network packets to
> > > guest virtqueues by calculating packet hash
> > > * Additionally adding support for the usage of RSS with vhost
> > >
> > > The eBPF works on kernels 5.8+
> > > On earlier kerneld it fails to load and the RSS feature is reported
> > > only without vhost and implemented in 'in-qemu' software.
> > >
> > > Implementation notes:
> > > Linux TAP TUNSETSTEERINGEBPF ioctl was used to set the eBPF program.
> > > Added libbpf dependency and eBPF support.
> > > The eBPF program is part of the qemu and presented as an array
> > > of BPF ELF file data. The eBPF array file initially generated by bpft=
ool.
> > > The compilation of eBPF is not part of QEMU build and can be done
> > > using provided Makefile.ebpf.
> > > Added changes to virtio-net and vhost, primary eBPF RSS is used.
> > > 'in-qemu' RSS used in the case of hash population and as a fallback o=
ption.
> > > For vhost, the hash population feature is not reported to the guest.
> > >
> > > Please also see the documentation in PATCH 6/7.
> > >
> > > Known issues:
> > > * hash population not supported by eBPF RSS: 'in-qemu' RSS used
> > > as a fallback, also, hash population feature is not reported to guest=
s
> > > with vhost.
> > > * IPv6 extensions still in progress.
> >
> >
> > Hi Andrew:
> >
> > The patch looks good at a glance. I tend to queue it for 6.1.
> >
> > One issue is that, there's no easy way for testing it without a windows
> > guest.
> >
> > Do you have plan to extend Linux driver to support RSS (e.g via ethtool=
?).
> >
> > Thanks
> >
> >
> > >
> > > Changes since v1:
> > > * using libbpf instead of direct 'bpf' system call.
> > > * added libbpf dependency to the configure/meson scripts.
> > > * changed python script for eBPF .h file generation.
> > > * changed eBPF program - reading L3 proto from ethernet frame.
> > > * added TUNSETSTEERINGEBPF define for TUN.
> > > * changed the maintainer's info.
> > > * added license headers.
> > > * refactored code.
> > >
> > > Changes since v2:
> > > * using bpftool for eBPF skeleton generation.
> > > * ebpf_rss is refactored to use skeleton generated by bpftool.
> > > * added/adjasted license in comment sections and in eBPF file.
> > > * rss.bpf.c and Makefile.ebpf moved to the tool/ebpf folder.
> > > * virtio-net eBPF rss refactored. Now eBPF initialized during realize=
().
> > >
> > > Changes since v3:
> > > * rebased to last master.
> > > * fixed issue with failed build without libbpf.
> > > * fixed ebpf loading without rss option.
> > > * refactored labels in ebpf_rss.c
> > >
> > > Changes since v4:
> > > * refactored configure/meson script.
> > > * added checks for load_bytes in ebpf.
> > > * documentation added to the index.
> > > * refactored Makefile and rss.bpf.c.
> > > * rebased to last master.
> > >
> > > Andrew (7):
> > >    net/tap: Added TUNSETSTEERINGEBPF code.
> > >    net: Added SetSteeringEBPF method for NetClientState.
> > >    ebpf: Added eBPF RSS program.
> > >    ebpf: Added eBPF RSS loader.
> > >    virtio-net: Added eBPF RSS to virtio-net.
> > >    docs: Added eBPF documentation.
> > >    MAINTAINERS: Added eBPF maintainers information.
> > >
> > >   MAINTAINERS                    |   8 +
> > >   configure                      |   8 +-
> > >   docs/devel/ebpf_rss.rst        | 125 ++++++++
> > >   docs/devel/index.rst           |   1 +
> > >   ebpf/ebpf_rss-stub.c           |  40 +++
> > >   ebpf/ebpf_rss.c                | 165 ++++++++++
> > >   ebpf/ebpf_rss.h                |  44 +++
> > >   ebpf/meson.build               |   1 +
> > >   ebpf/rss.bpf.skeleton.h        | 423 +++++++++++++++++++++++++
> > >   ebpf/trace-events              |   4 +
> > >   ebpf/trace.h                   |   2 +
> > >   hw/net/vhost_net.c             |   3 +
> > >   hw/net/virtio-net.c            | 115 ++++++-
> > >   include/hw/virtio/virtio-net.h |   4 +
> > >   include/net/net.h              |   2 +
> > >   meson.build                    |   9 +
> > >   meson_options.txt              |   2 +
> > >   net/tap-bsd.c                  |   5 +
> > >   net/tap-linux.c                |  13 +
> > >   net/tap-linux.h                |   1 +
> > >   net/tap-solaris.c              |   5 +
> > >   net/tap-stub.c                 |   5 +
> > >   net/tap.c                      |   9 +
> > >   net/tap_int.h                  |   1 +
> > >   net/vhost-vdpa.c               |   2 +
> > >   tools/ebpf/Makefile.ebpf       |  22 ++
> > >   tools/ebpf/rss.bpf.c           | 552 ++++++++++++++++++++++++++++++=
+++
> > >   27 files changed, 1567 insertions(+), 4 deletions(-)
> > >   create mode 100644 docs/devel/ebpf_rss.rst
> > >   create mode 100644 ebpf/ebpf_rss-stub.c
> > >   create mode 100644 ebpf/ebpf_rss.c
> > >   create mode 100644 ebpf/ebpf_rss.h
> > >   create mode 100644 ebpf/meson.build
> > >   create mode 100644 ebpf/rss.bpf.skeleton.h
> > >   create mode 100644 ebpf/trace-events
> > >   create mode 100644 ebpf/trace.h
> > >   create mode 100755 tools/ebpf/Makefile.ebpf
> > >   create mode 100644 tools/ebpf/rss.bpf.c
> > >
> >

