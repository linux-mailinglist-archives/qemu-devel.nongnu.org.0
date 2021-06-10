Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 266023A24DC
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 08:57:27 +0200 (CEST)
Received: from localhost ([::1]:58112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrEd4-0002aj-7r
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 02:57:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuri.benditovich@daynix.com>)
 id 1lrEbf-00010f-NF
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 02:56:03 -0400
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235]:36568)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yuri.benditovich@daynix.com>)
 id 1lrEbd-0004B3-Hu
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 02:55:59 -0400
Received: by mail-oi1-x235.google.com with SMTP id r16so695926oiw.3
 for <qemu-devel@nongnu.org>; Wed, 09 Jun 2021 23:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=F2qwPoOENcwYGoqPqN8H9+gcdPyklPLmZ2SMOwEzXZQ=;
 b=uQMxb+BMJyFL7VGK2CQrxOEjWolyD+ZL96oSFqpoJ6pZ2XIE9cr+o440SNHaPfbD7E
 7nRieeCySoScyQcXp6ZYGgaB7qOy/zNLHcUuzzMtVlhGlX0HQXxXHG4fCtbWDWwBToQS
 FYybqugn52UnYI6H64KVgWyRhnSHbcCAH9hb5+akJjm9rEjHFP17u9x2pXC+OoQQ85cX
 RrNWjvlxD1qv0YTcyUNDez2balH8Jyi5QBE0/LuwwNy+Qzd1NkxsNKZBoSBHl75bk6Vj
 IUKSn1ymUGxa8QwIwnP1dO83GK5wEePCfu/Qlzy0sAh+RDsx9fTfhgUuNvnSdrzHpZi3
 nvJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=F2qwPoOENcwYGoqPqN8H9+gcdPyklPLmZ2SMOwEzXZQ=;
 b=E+lxT3SBeUWyxzbFujBD8RGhzuf/klYhiENLV/uJVVtkJ+GLmFd4aS5VSpPzH9Dps/
 OHbfnuHtDfAOJwfnfluiwD5Jz/uI4UiVcXcrwL7HM/jo/JxgocP2rCpXarhd4QI48Swn
 p+gtR8rCydSteXUZrhtorkqx7ITVEVlsxR3cGlURWJsJ4wBOl1kUXTdO+oaP/IDCFu/c
 aOgleGasf8TxKbQBLAjQiFQda0wmYlJ60gR950pRj2z1OKjLU9k7hshI1etN/Y5ErAh6
 mEbz297d6Guv5DJvg7Pvbs+pBZMLd755KylvnlfJSo8wMqk3uGmlfh/RGCZ5Th21xNHW
 d3MA==
X-Gm-Message-State: AOAM530Gra9uCNCgbACQ9JKVSQ8q4pztC3iP8B9nr+Nb2M7pR2pIZN9G
 sUJusGf+ObWdyzB5aO/k9/nXY5tuMXWbPhgwWsJcvw==
X-Google-Smtp-Source: ABdhPJxvcp450fI9a/MtmgNYiXdpWlAaxbM+ouBah28vUCx1RzAHI358gYVuLXMA0uG0Utze6iSFc9c3Y8clY865+SM=
X-Received: by 2002:aca:dfc2:: with SMTP id w185mr2353183oig.91.1623308154838; 
 Wed, 09 Jun 2021 23:55:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210609100457.142570-1-andrew@daynix.com>
 <f81de211-57f9-9319-9735-c6b964bbdc77@redhat.com>
In-Reply-To: <f81de211-57f9-9319-9735-c6b964bbdc77@redhat.com>
From: Yuri Benditovich <yuri.benditovich@daynix.com>
Date: Thu, 10 Jun 2021 09:55:43 +0300
Message-ID: <CAOEp5OejzxEx6UAWK2iU28QKOAt8OqcFOUga+q4VHtjLU8GvWw@mail.gmail.com>
Subject: Re: [RFC PATCH 0/5] ebpf: Added ebpf helper for libvirtd.
To: Jason Wang <jasowang@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: none client-ip=2607:f8b0:4864:20::235;
 envelope-from=yuri.benditovich@daynix.com; helo=mail-oi1-x235.google.com
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
Cc: Andrew Melnychenko <andrew@daynix.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Yan Vugenfirer <yan@daynix.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 10, 2021 at 9:41 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2021/6/9 =E4=B8=8B=E5=8D=886:04, Andrew Melnychenko =E5=86=99=
=E9=81=93:
> > Libvirt usually launches qemu with strict permissions.
> > To enable eBPF RSS steering, qemu-ebpf-rss-helper was added.
>
>
> A silly question:
>
> Kernel had the following permission checks in bpf syscall:
>
>         if (sysctl_unprivileged_bpf_disabled && !bpf_capable())
>                  return -EPERM;
> ...
>
>          err =3D security_bpf(cmd, &attr, size);
>          if (err < 0)
>                  return err;
>
> So if I understand the code correctly, bpf syscall can only be done if:
>
> 1) unprivileged_bpf is enabled or
> 2) has the capability  and pass the LSM checks
>
> So I think the series is for unprivileged_bpf disabled. If I'm not
> wrong, I guess the policy is to grant CAP_BPF but do fine grain checks
> via LSM.
>
> If this is correct, need to describe it in the commit log.
>
>
> >
> > Added property "ebpf_rss_fds" for "virtio-net" that allows to
> > initialize eBPF RSS context with passed program & maps fds.
> >
> > Added qemu-ebpf-rss-helper - simple helper that loads eBPF
> > context and passes fds through unix socket.
> > Libvirt should call the helper and pass fds to qemu through
> > "ebpf_rss_fds" property.
> >
> > Added explicit target OS check for libbpf dependency in meson.
> > eBPF RSS works only with Linux TAP, so there is no reason to
> > build eBPF loader/helper for non-Linux.
> >
> > Overall, libvirt process should not be aware of the "interface"
> > of eBPF RSS, it will not be aware of eBPF maps/program "type" and
> > their quantity.
>
>
> I'm not sure this is the best. We have several examples that let libvirt
> to involve. Examples:
>
> 1) create TAP device (and the TUN_SETIFF)
>
> 2) open vhost devices
>
>
> >   That's why qemu and the helper should be from
> > the same build and be "synchronized". Technically each qemu may
> > have its own helper. That's why "query-helper-paths" qmp command
> > was added. Qemu should return the path to the helper that suits
> > and libvirt should use "that" helper for "that" emulator.
> >
> > qmp sample:
> > C: { "execute": "query-helper-paths" }
> > S: { "return": [
> >       {
> >         "name": "qemu-ebpf-rss-helper",
> >         "path": "/usr/local/libexec/qemu-ebpf-rss-helper"
> >       }
> >      ]
> >     }
>
>
> I think we need an example on the detail steps for how libvirt is
> expected to use this.

The preliminary patches for libvirt are at
https://github.com/daynix/libvirt/tree/RSSv1

>
> Thanks
>
>
> >
> > Andrew Melnychenko (5):
> >    ebpf: Added eBPF initialization by fds.
> >    virtio-net: Added property to load eBPF RSS with fds.
> >    ebpf_rss_helper: Added helper for eBPF RSS.
> >    qmp: Added qemu-ebpf-rss-path command.
> >    meson: libbpf dependency now exclusively for Linux.
> >
> >   ebpf/ebpf_rss-stub.c           |   6 ++
> >   ebpf/ebpf_rss.c                |  31 +++++++-
> >   ebpf/ebpf_rss.h                |   5 ++
> >   ebpf/qemu-ebpf-rss-helper.c    | 130 ++++++++++++++++++++++++++++++++=
+
> >   hw/net/virtio-net.c            |  77 ++++++++++++++++++-
> >   include/hw/virtio/virtio-net.h |   1 +
> >   meson.build                    |  37 ++++++----
> >   monitor/qmp-cmds.c             |  78 ++++++++++++++++++++
> >   qapi/misc.json                 |  29 ++++++++
> >   9 files changed, 374 insertions(+), 20 deletions(-)
> >   create mode 100644 ebpf/qemu-ebpf-rss-helper.c
> >
>

