Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA813EE661
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Aug 2021 07:50:24 +0200 (CEST)
Received: from localhost ([::1]:47288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFrzT-0008HO-A4
	for lists+qemu-devel@lfdr.de; Tue, 17 Aug 2021 01:50:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mFryd-0007b6-ER
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 01:49:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mFryX-0001wG-MW
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 01:49:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629179363;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1mZUBVPIMTo/Se0WHwiXHFJ+5pdGzbFwDOBwBvOwlS4=;
 b=Bhp1M0hHzVeYqtqjfBjgIgmtcKc63QgjrTBQUEQytqRPAbe3QaDRnpXk+soOIa1BvqQas5
 ogFNLXHesBx3ytpI8uFGN1XNmEeG844XLWClkAH2r+oeCtM2x8A7Q8J55hH6sKlabm5EZI
 UM/TFzgTdEL48TEVbwwavxz0k6fAbZQ=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-480-M-T-S5RdOe-BT-jzSWkEcA-1; Tue, 17 Aug 2021 01:49:20 -0400
X-MC-Unique: M-T-S5RdOe-BT-jzSWkEcA-1
Received: by mail-lj1-f199.google.com with SMTP id
 e13-20020a05651c112db02901b29ccfa84fso6878040ljo.22
 for <qemu-devel@nongnu.org>; Mon, 16 Aug 2021 22:49:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1mZUBVPIMTo/Se0WHwiXHFJ+5pdGzbFwDOBwBvOwlS4=;
 b=lynRoSANY/Ez8bOcitrMkSmMXD5ZyeRBtz2Xx4v4xcTpY8l2GSJ7njKU2bl/UTV38N
 B6wgalkOGU5iSjGwWT4RViDb0PwBFIP53RyG+q7EpYNocGtU1+V0eonO+X5s2ygGU91+
 9YSoVB0FGfbHHiZYSL6DtAeuOmlv59kZQ2qcNEPFPCDzC8mjyUS9HJcY/v3KaRIcUKQ9
 4I8IEt0fZm6tSXo1N3IMrRfEXt9Bs12IlGZDxQ8PfU1uhoMuU6QYJV8MGi6t3e6HiKcG
 eVhEsoNVUq/p+wSmJkWnbVyxinXtH5cX/ho6EwZ8vfuLt3qRcDTa3u4VyXuV2gURY238
 anbw==
X-Gm-Message-State: AOAM533VLxx+QWT5Vj4sPDdEvvi7nv/2XHt6/Gj+CQdjLqKifCj3sCXj
 1al9M1QW8JHSJt3qtVbUajv+jSiX05LVKVApoyg5EjxPxZJpdBf6D4qGeroQhtOcwi4y00VexQX
 PlotcqzMpJRZvWCilbwHcvPsYznOLaW0=
X-Received: by 2002:a05:651c:906:: with SMTP id
 e6mr1606704ljq.385.1629179358648; 
 Mon, 16 Aug 2021 22:49:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy+3MhjoUxKcsq+iKsuCbYSJIPvHhvCKoYRKnv3B7TEFAdVJFaBA7EqkzXiheBxD3VScIDjTe5wnHSTolVB1hg=
X-Received: by 2002:a05:651c:906:: with SMTP id
 e6mr1606680ljq.385.1629179358366; 
 Mon, 16 Aug 2021 22:49:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210713153758.323614-1-andrew@daynix.com>
 <CABcq3pE=n4iPB-9cX7bRMhz=O2csAtTeYtbA1_sBnC9Fh8Pihg@mail.gmail.com>
 <CAOEp5OdpiceovWJE1pzC17dKVmbc7yLRGOjJhziuBBdF-1kDww@mail.gmail.com>
In-Reply-To: <CAOEp5OdpiceovWJE1pzC17dKVmbc7yLRGOjJhziuBBdF-1kDww@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 17 Aug 2021 13:49:07 +0800
Message-ID: <CACGkMEuwowQjgFqt8p6Hoez4VkhH2kjfkfj3LpngU+Vxj7vLRw@mail.gmail.com>
Subject: Re: [PATCH 0/5] ebpf: Added ebpf helper for libvirtd.
To: Yuri Benditovich <yuri.benditovich@daynix.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Andrew Melnichenko <andrew@daynix.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>, Yan Vugenfirer <yan@daynix.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Aug 16, 2021 at 7:58 PM Yuri Benditovich
<yuri.benditovich@daynix.com> wrote:
>
> Jason,
> Can you please review the series?

WIll do it this week.

Thanks

>
> Thanks,
> Yuri
>
> On Thu, Jul 22, 2021 at 11:38 AM Andrew Melnichenko <andrew@daynix.com> wrote:
> >
> > ping
> >
> > On Tue, Jul 13, 2021 at 6:38 PM Andrew Melnychenko <andrew@daynix.com> wrote:
> >>
> >> Libvirt usually launches qemu with strict permissions.
> >> To enable eBPF RSS steering, qemu-ebpf-rss-helper was added.
> >>
> >> Added property "ebpf_rss_fds" for "virtio-net" that allows to
> >> initialize eBPF RSS context with passed program & maps fds.
> >>
> >> Added qemu-ebpf-rss-helper - simple helper that loads eBPF
> >> context and passes fds through unix socket.
> >> Libvirt should call the helper and pass fds to qemu through
> >> "ebpf_rss_fds" property.
> >>
> >> Added explicit target OS check for libbpf dependency in meson.
> >> eBPF RSS works only with Linux TAP, so there is no reason to
> >> build eBPF loader/helper for non-Linux.
> >>
> >> Changed Qemu updates eBPF maps to array mmaping. Mmaping allows
> >> bypassing unprivileged BPF map update. Also, instead of 3 maps
> >> (config, key and indirection table) there is one map that
> >> combines everything.
> >>
> >> Added helper stamp. To check that helper was build with qemu,
> >> qemu would check helper symbols that should contain the stamp.
> >> It was done similar to qemu modules, but checking was performed
> >> by the helper's ELF parsing.
> >>
> >> Overall, libvirt process should not be aware of the "interface"
> >> of eBPF RSS, it will not be aware of eBPF maps/program "type" and
> >> their quantity. That's why qemu and the helper should be from
> >> the same build and be "synchronized". Technically each qemu may
> >> have its own helper. That's why "query-helper-paths" qmp command
> >> was added. Qemu should return the path to the helper that suits
> >> and libvirt should use "that" helper for "that" emulator.
> >>
> >> qmp sample:
> >> C: { "execute": "query-helper-paths" }
> >> S: { "return": [
> >>      {
> >>        "name": "qemu-ebpf-rss-helper",
> >>        "path": "/usr/local/libexec/qemu-ebpf-rss-helper"
> >>      }
> >>     ]
> >>    }
> >>
> >> Changes since v1:
> >> * Mmap() used instead if bpf_map_update_elem().
> >> * Added helper stamp.
> >>
> >> Andrew Melnychenko (5):
> >>   ebpf: Added eBPF initialization by fds and map update.
> >>   virtio-net: Added property to load eBPF RSS with fds.
> >>   qmp: Added the helper stamp check.
> >>   ebpf_rss_helper: Added helper for eBPF RSS.
> >>   qmp: Added qemu-ebpf-rss-path command.
> >>
> >>  ebpf/ebpf_rss-stub.c              |   6 +
> >>  ebpf/ebpf_rss.c                   | 120 ++++---
> >>  ebpf/ebpf_rss.h                   |   8 +-
> >>  ebpf/qemu-ebpf-rss-helper.c       | 130 +++++++
> >>  ebpf/rss.bpf.skeleton.h           | 557 +++++++++++++++---------------
> >>  hw/net/virtio-net.c               |  77 ++++-
> >>  include/hw/virtio/virtio-net.h    |   1 +
> >>  meson.build                       |  47 ++-
> >>  monitor/meson.build               |   1 +
> >>  monitor/qemu-helper-stamp-utils.c | 297 ++++++++++++++++
> >>  monitor/qemu-helper-stamp-utils.h |  24 ++
> >>  monitor/qmp-cmds.c                |  32 ++
> >>  qapi/misc.json                    |  33 ++
> >>  tools/ebpf/rss.bpf.c              |  67 ++--
> >>  14 files changed, 990 insertions(+), 410 deletions(-)
> >>  create mode 100644 ebpf/qemu-ebpf-rss-helper.c
> >>  create mode 100644 monitor/qemu-helper-stamp-utils.c
> >>  create mode 100644 monitor/qemu-helper-stamp-utils.h
> >>
> >> --
> >> 2.31.1
> >>
>


