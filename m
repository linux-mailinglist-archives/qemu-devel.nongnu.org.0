Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB436D028D
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 13:07:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phq72-0003df-AT; Thu, 30 Mar 2023 07:06:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1phq70-0003dW-G8
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 07:06:34 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1phq6y-00030u-Fg
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 07:06:34 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 qe8-20020a17090b4f8800b0023f07253a2cso19160915pjb.3
 for <qemu-devel@nongnu.org>; Thu, 30 Mar 2023 04:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112; t=1680174391;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yf0749x+d5b7hMKbg8TtoPEa5bMft3KXNgBRnlmakTU=;
 b=1axS0SrXb3R2pM4UUBfLyI7jcDKb0Tt87FUwpwtmA48KYNLjHYW4SDSYMgIB+ioQVe
 6k7nCGDPW38tbDfryG5kJa1K8Y2NU50MHMaHOrL/JUJAiUN2Q59NleArQlZh45YZGqRw
 kyBjpB7uwPlbFrne7DQek9N7U2tNt0EvuLzmOuEBjP/ecph1/X9K8gSDSykjoykygUWv
 0Q1UT+qHrDqSGAEX75qUWi/a5MMSQm1X7mSkMlEgGq78N1o4ikc28Uy1HmFjpesWMmw5
 s1xJp+YiZddiv6DPcHRFT91raoVeGFQ9EWdm8kHkYPpgxvkHlG5bJbmXSYWp0VHOa2P+
 4zTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680174391;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yf0749x+d5b7hMKbg8TtoPEa5bMft3KXNgBRnlmakTU=;
 b=4OJkYOQxhcaofpjRiD5izNiRJhQA/YP6B32gWP+7bWCUqwxuy5viFtzdNgRCvOXn78
 Y/0QWYmhcdVnSVY75zAM/SKcIS8CsFewVyRwGzQACTheyy1PL3dETLXIE2nWMMYmLIbb
 dX1/VPVZsDbDgfZ6mL7OA7FQk9TMKr152c5bsLHPOX1FKNiQG08j/PMVKzKmt4yQyanj
 2eQgrpWmAfPclBhaul7adtE0z+iR1JlIhwumGMoFUmW3N6qHayvoerQl9eEp2C+NYG9/
 HQ6w1E70JoZYds5KOyFbdjAp25ldYxbvYoFVXIc7hM3LxUnqxPnLUe7a1MOqOMDftEW2
 +dew==
X-Gm-Message-State: AAQBX9ep8lXMWD2GbXA84DSZWqWP5JRzsznWvAT6rkFH/ZNTkXmMqfgv
 4xJgAB1RLW09rbSm5vAcIwLPX/WgV0cieFg8mxZ2hg==
X-Google-Smtp-Source: AKy350aOeA8OWDQDMtBH/eu12J2JpXpX8u+iXl8d8Uukp+W64ENNtnjVBQEPGRLiF+vQhdvj5GrU/P3uHJ5RfszF2b8=
X-Received: by 2002:a17:90a:d245:b0:23d:19cf:f9d4 with SMTP id
 o5-20020a17090ad24500b0023d19cff9d4mr7327486pjw.6.1680174390753; Thu, 30 Mar
 2023 04:06:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230330001522.120774-1-andrew@daynix.com>
 <CACGkMEvN=bS8L=oz=Kniij_wSsLT38njSwpzioZCZ09aTCuERg@mail.gmail.com>
In-Reply-To: <CACGkMEvN=bS8L=oz=Kniij_wSsLT38njSwpzioZCZ09aTCuERg@mail.gmail.com>
From: Andrew Melnichenko <andrew@daynix.com>
Date: Thu, 30 Mar 2023 13:48:38 +0300
Message-ID: <CABcq3pFosL=5EBHGY3pmFeVqqT-1YwNLzcnrXGMgMF=+ynyGyA@mail.gmail.com>
Subject: Re: [RFC PATCH 0/4] eBPF RSS through QMP support.
To: Jason Wang <jasowang@redhat.com>
Cc: mst@redhat.com, pbonzini@redhat.com, marcandre.lureau@redhat.com, 
 berrange@redhat.com, thuth@redhat.com, philmd@linaro.org, armbru@redhat.com, 
 eblake@redhat.com, qemu-devel@nongnu.org, toke@redhat.com, 
 mprivozn@redhat.com, yuri.benditovich@daynix.com, yan@daynix.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: none client-ip=2607:f8b0:4864:20::1031;
 envelope-from=andrew@daynix.com; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

On Thu, Mar 30, 2023 at 9:57=E2=80=AFAM Jason Wang <jasowang@redhat.com> wr=
ote:
>
> On Thu, Mar 30, 2023 at 8:33=E2=80=AFAM Andrew Melnychenko <andrew@daynix=
.com> wrote:
> >
> > This series of patches provides the ability to retrieve eBPF program
> > through qmp, so management application may load bpf blob with proper ca=
pabilities.
> > Now, virtio-net devices can accept eBPF programs and maps through prope=
rties
> > as external file descriptors. Access to the eBPF map is direct through =
mmap()
> > call, so it should not require additional capabilities to bpf* calls.
> > eBPF file descriptors can be passed to QEMU from parent process or by u=
nix
> > socket with sendfd() qmp command.
> >
> > Overall, the basic scenario of using the helper looks like this:
> >  * Libvirt checks for ebpf_fds property.
> >  * Libvirt requests eBPF blob through QMP.
> >  * Libvirt loads blob for virtio-net.
> >  * Libvirt launches the QEMU with eBPF fds passed.
>
> Is there a libvirt side draft that can be used as a reference?
>
> Thanks
>

I'm working on it. This is why it's RFC.
I have a small script that checks that eBPF retrieved through QMP can be lo=
aded.
Also, please check the eBPF blob declaration/initialization routine
and qmp commands.
So, this API should be implemented once and right.

> >
> > Andrew Melnychenko (4):
> >   ebpf: Added eBPF initialization by fds and map update.
> >   virtio-net: Added property to load eBPF RSS with fds.
> >   ebpf: Added declaration/initialization routines.
> >   qmp: Added new command to retrieve eBPF blob.
> >
> >  ebpf/ebpf.c                    |  48 +++++++++++++
> >  ebpf/ebpf.h                    |  25 +++++++
> >  ebpf/ebpf_rss-stub.c           |   6 ++
> >  ebpf/ebpf_rss.c                | 124 +++++++++++++++++++++++++++------
> >  ebpf/ebpf_rss.h                |  10 +++
> >  ebpf/meson.build               |   1 +
> >  hw/net/virtio-net.c            |  77 ++++++++++++++++++--
> >  include/hw/virtio/virtio-net.h |   1 +
> >  monitor/qmp-cmds.c             |  17 +++++
> >  qapi/misc.json                 |  25 +++++++
> >  10 files changed, 307 insertions(+), 27 deletions(-)
> >  create mode 100644 ebpf/ebpf.c
> >  create mode 100644 ebpf/ebpf.h
> >
> > --
> > 2.39.1
> >
>

