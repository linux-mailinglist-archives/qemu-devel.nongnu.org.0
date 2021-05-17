Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14182383634
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 17:32:58 +0200 (CEST)
Received: from localhost ([::1]:37270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lifEm-000346-T9
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 11:32:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuri.benditovich@daynix.com>)
 id 1lifD5-0001kT-FJ
 for qemu-devel@nongnu.org; Mon, 17 May 2021 11:31:11 -0400
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233]:41833)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yuri.benditovich@daynix.com>)
 id 1lifD0-0005G2-QF
 for qemu-devel@nongnu.org; Mon, 17 May 2021 11:31:11 -0400
Received: by mail-oi1-x233.google.com with SMTP id c3so6824318oic.8
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 08:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RiJi8j5JqjNX5gUbIItUi3OLP5rZu4hCYC8eAqYc9uU=;
 b=lgh5DCMLuWnORclurdaYUf5YstZ6kNfnf6OzbHz1rafBeS5Xw3x/UgulYYXiYIr4jD
 +n6fOzxPMPywGAgj9Yi+WtZywCXLEYjxxD48Ix9M6HI1dMSsFHHtxqifnw3r4nwnC/CH
 I2A4JMfOBSJn32BfEsLOMajmBpLyg96mnG12Zkx6DT5bKPAjnjlFGQEE2Z6eRyNUiHug
 ZOqHXFkVlXhyEaDKQdThBismWYxZ5B9xkV9YjhUbkeD1+6Ga2O9jJj42UEXUhXdBvAcX
 fZ9t5bePS82lg3c6jNPGh5KNvQ39LLm5J5W0gQ71Be4KBUtS9DavPQ7xfu6UKnoDsgMc
 a08w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RiJi8j5JqjNX5gUbIItUi3OLP5rZu4hCYC8eAqYc9uU=;
 b=CvmwBq1s4u7Zl7AbrcUswiTAHsXAQ3K9mBrxHMogds51pL6ewOf6hBlR2Cqdy9C8z7
 Fbb+SBe8mtnkgIlOOAeqsQPop4BpxHuVuaoRAmweLGBWgJ34DZw/0WqiCfQ3OUu0k30u
 mY8cxaDuajZ/hJ4aTzL/2ay6mJ+Wj5JGpmKYpOuDyVJJ+NV5k4S1IbI2CGHugVlcqZAe
 io7Ow0JV/NGUXI13ywg5ljdE2hXsGgjdmoLVONXuGUIpxpASjh1N+I23UlgH02lvyVG0
 NqenjNaGaDGmcZue9nbxrhtD4s3m90Hm+J2fV+Lb35uVKVNZRFx1VqRncMRHGl7qKkbQ
 aXHw==
X-Gm-Message-State: AOAM532RoZcRtpYxGySimNglhvQFyQGjjMtxNJ53FdELGphzuzrOXFnH
 dulXxB4chPlC00jHOxN+z1maiZJUYJQPMnitktnx9A==
X-Google-Smtp-Source: ABdhPJzyoshbY/r1D8JDYQvO7TbmyAtYgVXR1WDQhPaWFyRrTt2ntWIhYvuRGiiVS1HxKvwzSV4Syj4zxaxDjEOqx8M=
X-Received: by 2002:aca:f156:: with SMTP id p83mr249766oih.91.1621265465151;
 Mon, 17 May 2021 08:31:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210325153529.75831-1-andrew@daynix.com>
 <20210514094235-mutt-send-email-mst@kernel.org>
In-Reply-To: <20210514094235-mutt-send-email-mst@kernel.org>
From: Yuri Benditovich <yuri.benditovich@daynix.com>
Date: Mon, 17 May 2021 18:30:51 +0300
Message-ID: <CAOEp5Ofz5Hr1x6r272BxPs7bYUs8oN_tFkCPbkJb=LQq384cug@mail.gmail.com>
Subject: Re: [PATCH v5 0/7] eBPF RSS support for virtio-net
To: "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2607:f8b0:4864:20::233;
 envelope-from=yuri.benditovich@daynix.com; helo=mail-oi1-x233.google.com
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
 Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, May 14, 2021 at 4:43 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Thu, Mar 25, 2021 at 05:35:22PM +0200, Andrew Melnychenko wrote:
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
> > of BPF ELF file data. The eBPF array file initially generated by bpftool.
> > The compilation of eBPF is not part of QEMU build and can be done
> > using provided Makefile.ebpf.
> > Added changes to virtio-net and vhost, primary eBPF RSS is used.
> > 'in-qemu' RSS used in the case of hash population and as a fallback option.
> > For vhost, the hash population feature is not reported to the guest.
> >
> > Please also see the documentation in PATCH 6/7.
>
> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
>
> > Known issues:
> > * hash population not supported by eBPF RSS: 'in-qemu' RSS used
> > as a fallback, also, hash population feature is not reported to guests
> > with vhost.
>
> Could we instead fail init when RSS is requested and vhost is
> enabled? we can't do it for on by default features but we can
> for off by default ones ...
>
Of course this is possible.
I hope we do not need to stop the merge (it is in progress) and this
can be done in a separate patch and after some discussion.
Notes for the discussion:
1. We are not talking about RSS (it does not contradict with vhost
anymore), this is about "hash report".
2. Linux guest does not acknowledge this feature and for Linux VM
there is no motivation to enable it at all. So it looks like the issue
is minor, if any.
3. Currently we clear this feature with vhost but there is nothing
specific to the "hash report" feature; we clear it during a check of
vhost features (as well as other features dependent on vhost). If/when
this feature will be supported by the kernel - we'll not disable it
automatically. You suggest to fail the init for "hash + vhost"
explicitly without any special reason.
4. In general I think failing init is not the best behavior of qemu,
it is typically used in case of a really significant problem. Absence
of this feature is not something that leads to unexpected behavior or
significant performance loss.  Maybe a warning is enough?




> > * IPv6 extensions still in progress.
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
> > * virtio-net eBPF rss refactored. Now eBPF initialized during realize().
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
> > Andrew (7):
> >   net/tap: Added TUNSETSTEERINGEBPF code.
> >   net: Added SetSteeringEBPF method for NetClientState.
> >   ebpf: Added eBPF RSS program.
> >   ebpf: Added eBPF RSS loader.
> >   virtio-net: Added eBPF RSS to virtio-net.
> >   docs: Added eBPF documentation.
> >   MAINTAINERS: Added eBPF maintainers information.
> >
> >  MAINTAINERS                    |   8 +
> >  configure                      |   8 +-
> >  docs/devel/ebpf_rss.rst        | 125 ++++++++
> >  docs/devel/index.rst           |   1 +
> >  ebpf/ebpf_rss-stub.c           |  40 +++
> >  ebpf/ebpf_rss.c                | 165 ++++++++++
> >  ebpf/ebpf_rss.h                |  44 +++
> >  ebpf/meson.build               |   1 +
> >  ebpf/rss.bpf.skeleton.h        | 423 +++++++++++++++++++++++++
> >  ebpf/trace-events              |   4 +
> >  ebpf/trace.h                   |   2 +
> >  hw/net/vhost_net.c             |   3 +
> >  hw/net/virtio-net.c            | 115 ++++++-
> >  include/hw/virtio/virtio-net.h |   4 +
> >  include/net/net.h              |   2 +
> >  meson.build                    |   9 +
> >  meson_options.txt              |   2 +
> >  net/tap-bsd.c                  |   5 +
> >  net/tap-linux.c                |  13 +
> >  net/tap-linux.h                |   1 +
> >  net/tap-solaris.c              |   5 +
> >  net/tap-stub.c                 |   5 +
> >  net/tap.c                      |   9 +
> >  net/tap_int.h                  |   1 +
> >  net/vhost-vdpa.c               |   2 +
> >  tools/ebpf/Makefile.ebpf       |  22 ++
> >  tools/ebpf/rss.bpf.c           | 552 +++++++++++++++++++++++++++++++++
> >  27 files changed, 1567 insertions(+), 4 deletions(-)
> >  create mode 100644 docs/devel/ebpf_rss.rst
> >  create mode 100644 ebpf/ebpf_rss-stub.c
> >  create mode 100644 ebpf/ebpf_rss.c
> >  create mode 100644 ebpf/ebpf_rss.h
> >  create mode 100644 ebpf/meson.build
> >  create mode 100644 ebpf/rss.bpf.skeleton.h
> >  create mode 100644 ebpf/trace-events
> >  create mode 100644 ebpf/trace.h
> >  create mode 100755 tools/ebpf/Makefile.ebpf
> >  create mode 100644 tools/ebpf/rss.bpf.c
> >
> > --
> > 2.31.0
>

