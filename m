Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 670CF3AFB66
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 05:31:35 +0200 (CEST)
Received: from localhost ([::1]:57790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvX8Q-0006zZ-1B
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 23:31:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuri.benditovich@daynix.com>)
 id 1lvX78-0006Dc-Ex
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 23:30:14 -0400
Received: from mail-oo1-xc29.google.com ([2607:f8b0:4864:20::c29]:40470)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yuri.benditovich@daynix.com>)
 id 1lvX75-00007i-4l
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 23:30:14 -0400
Received: by mail-oo1-xc29.google.com with SMTP id
 r9-20020a4a37090000b029024b15d2fef9so4791025oor.7
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 20:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=2Bq+aJS0dtdc0k+3OSNpDWY0uVnTYQXkatWlL+aPpYU=;
 b=OtUzBuixvIF0Ua1gLoanapJ0rpAOvcElIBY4qnfrLWSOIMVMjGnB3LE0L5aYburJFs
 ULuJtOm6iZefYQ9D9h6w3+b3dhe6rCSjdwWvp69HuziXujBfi6B3f9/9Rj0QyRPe7yMv
 rCftTcXEp8bWXSlyPbd0L2C1vjznATyyKCGhnYqtkQG0H3RYUmcEC2NTtucfOMsrKGaa
 evXQa0Ye+fe8usCWlZJS1zXHkZNfF/YdkqfrF14D6xOkk74/3+teVQlS/uhT7ZQ9Vm9l
 vX1dZkl8/s6Wnw1pmEe0X+fZzNMt/nHQhqjmLVrcDcYF8xzBTPCalNATCUfrAlhsTI0F
 Fqcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=2Bq+aJS0dtdc0k+3OSNpDWY0uVnTYQXkatWlL+aPpYU=;
 b=X5VSM/nXFUtGkO5L9TO3HJZIeokRBtdP7kN50MdKUIdlU81WOxMDQBskp5W5dIaXYA
 o4t+NIFdVwPMSSrctyDcXRs2M7QSryhH30TDFBT0bJs5bRcE2pYmEcimbmsGnYHHKx05
 9SLdFuG9nDwn64bxPP/4KPml2r+vxMJ0nWZDPmOmiND7cESWjNkoOtUZGrMgM7O0pN8t
 XBucgKhsLEcwBi7TAjkb82SLGQUhk36u5BbZA8pGbbCmvI0XxM4JHoZBVvhoYsgSPT4q
 HZVFhURWhkuM1lQMqUt3kToswQ9lnGwXUI+ccn+TwN3TZxwAo2oA9WKRKCpuJx2PtAN+
 uFMw==
X-Gm-Message-State: AOAM533X1gk3SCNxkR5OnnwsrfJWKb1c6LXnISoL8KlcZABJopuxTCFn
 NGVABebqpFcn+A0awNHSnUMb+MkER2IaSmKOqicZEQ==
X-Google-Smtp-Source: ABdhPJzmVk9lJP5c1lZFEgWInB0H+NypTohAfTox20hKdjohwl6mcyPY3Zbjqoh6gEJ4axc2NnoKjOB+yW+huvEGFQU=
X-Received: by 2002:a4a:b203:: with SMTP id d3mr1295971ooo.55.1624332609141;
 Mon, 21 Jun 2021 20:30:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210609100457.142570-1-andrew@daynix.com>
 <f81de211-57f9-9319-9735-c6b964bbdc77@redhat.com>
 <CAOEp5OejzxEx6UAWK2iU28QKOAt8OqcFOUga+q4VHtjLU8GvWw@mail.gmail.com>
 <3da88930-439c-1892-29b4-4977ddbb0b0a@redhat.com>
 <CABcq3pE7Rx4r_H7qtpXAwqyiWzXCT_u1zp4X1Hc-pgMrW=9haA@mail.gmail.com>
 <d51a7c1f-0df8-342e-219d-c9b3b36a1371@redhat.com>
 <CABcq3pEec6f+ohA6SCn7iFAbromrvWgyS8Tjz6+iHZ-fa2OQxw@mail.gmail.com>
 <CABcq3pEXZGoRPGQPB1b1Tb_rDEg5aMFCB+CELAyOjDCyTS1FTQ@mail.gmail.com>
 <07a81543-c262-f153-6414-3d967dde02b2@redhat.com>
In-Reply-To: <07a81543-c262-f153-6414-3d967dde02b2@redhat.com>
From: Yuri Benditovich <yuri.benditovich@daynix.com>
Date: Tue, 22 Jun 2021 06:29:56 +0300
Message-ID: <CAOEp5OeEkJh=5hMKveanMRdR2Mf93SWRuuktVbY6+=BKj6jVLA@mail.gmail.com>
Subject: Re: [RFC PATCH 0/5] ebpf: Added ebpf helper for libvirtd.
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
Cc: Andrew Melnichenko <andrew@daynix.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Yan Vugenfirer <yan@daynix.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jun 21, 2021 at 12:20 PM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2021/6/19 =E4=B8=8A=E5=8D=884:03, Andrew Melnichenko =E5=86=99=
=E9=81=93:
> > Hi Jason,
> > I've checked "kernel.unprivileged_bpf_disabled=3D0" on Fedora,  Ubuntu,
> > and Debian - no need permissions to update BPF maps.
>
>
> How about RHEL :) ?

If I'm not mistaken, the RHEL releases do not use modern kernels yet
(for BPF we need 5.8+).
So this will be (probably) relevant for RHEL 9. Please correct me if I'm wr=
ong.


>
> Thanks
>
>
> >
> > On Wed, Jun 16, 2021 at 1:18 AM Andrew Melnichenko <andrew@daynix.com
> > <mailto:andrew@daynix.com>> wrote:
> >
> >     Hi,
> >
> >         I may miss something.
> >
> >         But RSS requires to update the map. This won't work if you
> >         don't grant
> >         any permission to qemu.
> >
> >         Thanks
> >
> >
> >     Partly - with "kernel.unprivileged_bpf_disabled=3D0" capabilities i=
s
> >     not required to update maps.
> >     With "kernel.unprivileged_bpf_disabled=3D1" - setting maps will
> >     fail(without CAP_BPF) and "in-qemu" RSS will be used.
> >
> >     On Tue, Jun 15, 2021 at 12:13 PM Jason Wang <jasowang@redhat.com
> >     <mailto:jasowang@redhat.com>> wrote:
> >
> >
> >         =E5=9C=A8 2021/6/12 =E4=B8=8A=E5=8D=8812:49, Andrew Melnichenko=
 =E5=86=99=E9=81=93:
> >         > Hi,
> >         >
> >         >     So I think the series is for unprivileged_bpf disabled.
> >         If I'm not
> >         >     wrong, I guess the policy is to grant CAP_BPF but do
> >         fine grain
> >         >     checks
> >         >     via LSM.
> >         >
> >         >
> >         > The main idea is to run eBPF RSS with qemu without any
> >         permission.
> >         > Libvirt should handle everything and pass proper eBPF file
> >         descriptors.
> >         > For current eBPF RSS, CAP_SYS_ADMIN(bypass some limitations)
> >         > also required, and in the future may be other permissions.
> >
> >
> >         I may miss something.
> >
> >         But RSS requires to update the map. This won't work if you
> >         don't grant
> >         any permission to qemu.
> >
> >         Thanks
> >
> >
> >         >
> >         >     I'm not sure this is the best. We have several examples
> >         that let
> >         >     libvirt
> >         >     to involve. Examples:
> >         >
> >         >     1) create TAP device (and the TUN_SETIFF)
> >         >
> >         >     2) open vhost devices
> >         >
> >         >
> >         > Technically TAP/vhost not related to a particular qemu
> >         emulator. So common
> >         > TAP creation should fit any modern qemu. eBPF fds(program
> >         and maps) should
> >         > suit the interface for current qemu, g.e. some qemu builds
> >         may have
> >         > different map
> >         > structures or their count. It's necessary that the qemu got f=
ds
> >         > prepared by the helper
> >         > that was built with the qemu.
> >         >
> >         >     I think we need an example on the detail steps for how
> >         libvirt is
> >         >     expected to use this.
> >         >
> >         >
> >         > The simplified workflow looks like this:
> >         >
> >         >  1. Libvirt got "emulator" from domain document.
> >         >  2. Libvirt queries for qemu capabilities.
> >         >  3. One of the capabilities is "qemu-ebpf-rss-helper"
> >         path(if present).
> >         >  4. On NIC preparation Libvirt checks for virtio-net + rss
> >         configurations.
> >         >  5. If required, the "qemu-ebpf-rss-helper" called and fds ar=
e
> >         >     received through unix fd.
> >         >  6. Those fds are for eBPF RSS, which passed to child
> >         process - qemu.
> >         >  7. Qemu launched with virtio-net-pci property "rss" and
> >         "ebpf_rss_fds".
> >         >
> >         >
> >         > On Fri, Jun 11, 2021 at 8:36 AM Jason Wang
> >         <jasowang@redhat.com <mailto:jasowang@redhat.com>
> >         > <mailto:jasowang@redhat.com <mailto:jasowang@redhat.com>>>
> >         wrote:
> >         >
> >         >
> >         >     =E5=9C=A8 2021/6/10 =E4=B8=8B=E5=8D=882:55, Yuri Benditov=
ich =E5=86=99=E9=81=93:
> >         >     > On Thu, Jun 10, 2021 at 9:41 AM Jason
> >         Wang<jasowang@redhat.com <mailto:jasowang@redhat.com>
> >         >     <mailto:jasowang@redhat.com
> >         <mailto:jasowang@redhat.com>>> wrote:
> >         >     >> =E5=9C=A8 2021/6/9 =E4=B8=8B=E5=8D=886:04, Andrew Meln=
ychenko =E5=86=99=E9=81=93:
> >         >     >>> Libvirt usually launches qemu with strict permissions=
.
> >         >     >>> To enable eBPF RSS steering, qemu-ebpf-rss-helper
> >         was added.
> >         >     >> A silly question:
> >         >     >>
> >         >     >> Kernel had the following permission checks in bpf
> >         syscall:
> >         >     >>
> >         >     >>          if (sysctl_unprivileged_bpf_disabled &&
> >         !bpf_capable())
> >         >     >>                   return -EPERM;
> >         >     >> ...
> >         >     >>
> >         >     >>           err =3D security_bpf(cmd, &attr, size);
> >         >     >>           if (err < 0)
> >         >     >>                   return err;
> >         >     >>
> >         >     >> So if I understand the code correctly, bpf syscall
> >         can only be
> >         >     done if:
> >         >     >>
> >         >     >> 1) unprivileged_bpf is enabled or
> >         >     >> 2) has the capability  and pass the LSM checks
> >         >     >>
> >         >     >> So I think the series is for unprivileged_bpf
> >         disabled. If I'm not
> >         >     >> wrong, I guess the policy is to grant CAP_BPF but do
> >         fine grain
> >         >     checks
> >         >     >> via LSM.
> >         >     >>
> >         >     >> If this is correct, need to describe it in the commit
> >         log.
> >         >     >>
> >         >     >>
> >         >     >>> Added property "ebpf_rss_fds" for "virtio-net" that
> >         allows to
> >         >     >>> initialize eBPF RSS context with passed program &
> >         maps fds.
> >         >     >>>
> >         >     >>> Added qemu-ebpf-rss-helper - simple helper that
> >         loads eBPF
> >         >     >>> context and passes fds through unix socket.
> >         >     >>> Libvirt should call the helper and pass fds to qemu
> >         through
> >         >     >>> "ebpf_rss_fds" property.
> >         >     >>>
> >         >     >>> Added explicit target OS check for libbpf dependency
> >         in meson.
> >         >     >>> eBPF RSS works only with Linux TAP, so there is no
> >         reason to
> >         >     >>> build eBPF loader/helper for non-Linux.
> >         >     >>>
> >         >     >>> Overall, libvirt process should not be aware of the
> >         "interface"
> >         >     >>> of eBPF RSS, it will not be aware of eBPF
> >         maps/program "type" and
> >         >     >>> their quantity.
> >         >     >> I'm not sure this is the best. We have several
> >         examples that
> >         >     let libvirt
> >         >     >> to involve. Examples:
> >         >     >>
> >         >     >> 1) create TAP device (and the TUN_SETIFF)
> >         >     >>
> >         >     >> 2) open vhost devices
> >         >     >>
> >         >     >>
> >         >     >>>    That's why qemu and the helper should be from
> >         >     >>> the same build and be "synchronized". Technically
> >         each qemu may
> >         >     >>> have its own helper. That's why "query-helper-paths"
> >         qmp command
> >         >     >>> was added. Qemu should return the path to the helper
> >         that suits
> >         >     >>> and libvirt should use "that" helper for "that"
> >         emulator.
> >         >     >>>
> >         >     >>> qmp sample:
> >         >     >>> C: { "execute": "query-helper-paths" }
> >         >     >>> S: { "return": [
> >         >     >>>        {
> >         >     >>>          "name": "qemu-ebpf-rss-helper",
> >         >     >>>          "path":
> >         "/usr/local/libexec/qemu-ebpf-rss-helper"
> >         >     >>>        }
> >         >     >>>       ]
> >         >     >>>      }
> >         >     >> I think we need an example on the detail steps for
> >         how libvirt is
> >         >     >> expected to use this.
> >         >     > The preliminary patches for libvirt are at
> >         >     > https://github.com/daynix/libvirt/tree/RSSv1
> >         <https://github.com/daynix/libvirt/tree/RSSv1>
> >         >     <https://github.com/daynix/libvirt/tree/RSSv1
> >         <https://github.com/daynix/libvirt/tree/RSSv1>>
> >         >
> >         >
> >         >     Will have a look but it would be better if the
> >         assumption of the
> >         >     management is detailed here to ease the reviewers.
> >         >
> >         >     Thanks
> >         >
> >         >
> >         >     >
> >         >
> >
>

