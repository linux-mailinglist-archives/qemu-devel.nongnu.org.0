Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E124DB230
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 15:09:54 +0100 (CET)
Received: from localhost ([::1]:41986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUULY-0003zS-UK
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 10:09:52 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1nUU1u-00056U-QB
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 09:49:35 -0400
Received: from [2a00:1450:4864:20::62d] (port=35523
 helo=mail-ej1-x62d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1nUU1o-00085X-Dp
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 09:49:30 -0400
Received: by mail-ej1-x62d.google.com with SMTP id yy13so4345132ejb.2
 for <qemu-devel@nongnu.org>; Wed, 16 Mar 2022 06:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=G7uH8bJxhcEID+lfx2mSTgcCmCVHYoXzerhjNUOX344=;
 b=VuLMCtCAkmvJuGs08g6GmeHNEaLSojOBLoL98/SSJLpFnyCaieEO0kXV8m/q2q6QnF
 P7u4+sqxpaJrhhQpkWpAUL/2gjwx6sAk5D9nMNzFNt/jKBsJC/jDBmmYO+jZaIMTuPBl
 gbkVUwaS8ZDU+uRGFy59/upLS0mdZEBLOX7xOxeCBrmQXWj6K+FuGCsDYgPZPm/kHsnN
 aQ2VYqEaLlEPM6zQMob4Ks1Newb3w4eQpivb/KM46UnAKYL/DH55weB/kNGBwdSc4tpv
 NheWuVpIPXm39R/mm3L46Alo4u50q9rwBfafVws6Q9Knh01GswMV7b0Ce+JIMC0IQn/w
 rehA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=G7uH8bJxhcEID+lfx2mSTgcCmCVHYoXzerhjNUOX344=;
 b=OTG22yOMmeKVuDRiz5q8sJ15bnAz+Wgb7AlWc61yG/sl0cC6VwwpvPveFfHN/q4H9o
 FtXZIE8UOMJTFeioSEZDajyzdCVeYMOLnOCHB/os5giJCb31KROHfq2fCIYBJKDoOSjB
 eL8xM+ujTeGzaLsgAMZ+ocW+bE+4V+Shz7BqEVkgs83FxwV/0kzc6sFyFaymiGaL11Zn
 2DWmug8lwlq/Ns45brLwd5dA1+llb208fVaYQjn4y9n9dvTddqqX08/HnsIQFBpkuaf1
 faxm6XZzkSlq3VifbkzGeM1Tqvl3R9uEz0crmNt3egHJRY6kjzAzrkymoPHE82eQkj4T
 Nr8Q==
X-Gm-Message-State: AOAM531BgVM9F5SdEn6YfyxjJtcQlZ/f9cMjlhkVEObrUZLySpjcbenk
 AQ+HSZajr0TSJ9s0rxvO60vMv3bE+SW7vvYVRlCW
X-Google-Smtp-Source: ABdhPJzI0erDVwv5jLcmCvx92MKVXdtWnwA9vXEL4FhgqAozNavNIeXpJxPmOS/8L/59cdoJOK8JEbZ9bpIFya8As7Y=
X-Received: by 2002:a17:907:c05:b0:6db:f118:8834 with SMTP id
 ga5-20020a1709070c0500b006dbf1188834mr77854ejc.536.1647438566253; Wed, 16 Mar
 2022 06:49:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220215105943.90-1-xieyongji@bytedance.com>
 <20220215105943.90-4-xieyongji@bytedance.com>
 <YjBg3QnSnpY2cAdL@stefanha-x1.localdomain>
 <CACycT3s7cgHBAqmpy=RZPwPZz4uptr0REzJ9fhM1qv+G_miS1Q@mail.gmail.com>
 <YjHl66pJYw45oKL9@stefanha-x1.localdomain>
In-Reply-To: <YjHl66pJYw45oKL9@stefanha-x1.localdomain>
From: Yongji Xie <xieyongji@bytedance.com>
Date: Wed, 16 Mar 2022 21:49:19 +0800
Message-ID: <CACycT3vpQsLG7oxeTHMs3w1qdO7fGJnjGiORfm=t1U2ehgD+bw@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] libvduse: Add VDUSE (vDPA Device in Userspace)
 library
To: Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=xieyongji@bytedance.com; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, mreitz@redhat.com, mlureau@redhat.com,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 16, 2022 at 9:28 PM Stefan Hajnoczi <stefanha@redhat.com> wrote:
>
> On Tue, Mar 15, 2022 at 07:38:12PM +0800, Yongji Xie wrote:
> > On Tue, Mar 15, 2022 at 5:48 PM Stefan Hajnoczi <stefanha@redhat.com> wrote:
> > >
> > > On Tue, Feb 15, 2022 at 06:59:40PM +0800, Xie Yongji wrote:
> > > > VDUSE [1] is a linux framework that makes it possible to implement
> > > > software-emulated vDPA devices in userspace. This adds a library
> > > > as a subproject to help implementing VDUSE backends in QEMU.
> > > >
> > > > [1] https://www.kernel.org/doc/html/latest/userspace-api/vduse.html
> > > >
> > > > Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
> > > > ---
> > > >  meson.build                                 |   15 +
> > > >  meson_options.txt                           |    2 +
> > > >  scripts/meson-buildoptions.sh               |    3 +
> > > >  subprojects/libvduse/include/atomic.h       |    1 +
> > > >  subprojects/libvduse/libvduse.c             | 1152 +++++++++++++++++++
> > > >  subprojects/libvduse/libvduse.h             |  225 ++++
> > > >  subprojects/libvduse/linux-headers/linux    |    1 +
> > > >  subprojects/libvduse/meson.build            |   10 +
> > > >  subprojects/libvduse/standard-headers/linux |    1 +
> > > >  9 files changed, 1410 insertions(+)
> > > >  create mode 120000 subprojects/libvduse/include/atomic.h
> > > >  create mode 100644 subprojects/libvduse/libvduse.c
> > > >  create mode 100644 subprojects/libvduse/libvduse.h
> > > >  create mode 120000 subprojects/libvduse/linux-headers/linux
> > > >  create mode 100644 subprojects/libvduse/meson.build
> > > >  create mode 120000 subprojects/libvduse/standard-headers/linux
> > >
> > > Please update the ./MAINTAINERS file when adding new source files.
> >
> > OK, sure. And would you mind being one of the maintainers since I'm
> > not sure if I can do this job well.
>
> You're welcome to become the maintainer. It means that you will be CCed
> on patches affecting this code and sometimes people might send you
> questions about VDUSE exports.
>

I see. I will try my best.

> Is the issue lack of time?
>

I think the time is enough. But since I have no experience, I'm not
sure if I can do this well.

Thanks,
Yongji

