Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D20EB51187E
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 15:49:30 +0200 (CEST)
Received: from localhost ([::1]:50090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nji2r-0004mQ-Nt
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 09:49:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1njhvU-0008A3-RQ
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 09:41:52 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:42833)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1njhvP-0000HW-4d
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 09:41:49 -0400
Received: by mail-ej1-x62f.google.com with SMTP id i27so3464489ejd.9
 for <qemu-devel@nongnu.org>; Wed, 27 Apr 2022 06:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=27rhQWQMEANL5JrZjm8Wx80Z5jsGoMj4kC930UKomr8=;
 b=uG5jo4nkreg2k+R9373SIlO1Dj3NRoXq5Wlxb3xvP8bZs3NI2RvDp6NeKKPjj4Wkdr
 dB2S7bSJkS2153VEy2VpRExip7dPU39D8JB45gNha0SYuiQC1In8AaqE+l9J5mrvfmSs
 rtBwQqvBU1mRI3U2DzzbYK7ek3WlZ9svcRKGeW232f3LIrS/IiPG3R2c17IxcT3A2q4x
 UvGk1EVInQKXl7dIeWhweVMX/rCQlpLz/q0HEkzGgoCX1DytOBpnsFwsj8tLGt3hxwZ/
 WAM1xTOmx9YuaX4KHJTLWLtPzjO3UQf+RygnbpEqqEc/3vJBOm04NUDU5Y3qWmhk9nQG
 jIqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=27rhQWQMEANL5JrZjm8Wx80Z5jsGoMj4kC930UKomr8=;
 b=pPCuvTwfNqnnEw+Gk0Zp5xmSXaswrzIEkD/kky+3Bqyj3HDgFBQUWCvemLK67N/RZj
 odUXfwrnc24/nAZJ5tpe7VFeqXHgKqjYk0AuWWnn5dXAhsaLJ6j0lb1SEo35lJ0MpGpF
 PCeudOhCMDo+cvipBDEyHZD46YwVp1jTD3yQviBI2VIc2dxoqCd/89LWblwQDc8SJv3h
 XIioqW2fSiIuXmE94518QmidngxDJQUCQltyHqDUyE1dp4lq55q/ZjjQLw85MGV1LeTH
 1exODDa0T3wb/SbYBH8NPsseI+wcKPMWegWJyOEu9MwaC1cQnk4P3z5MyQce4tow2Hjz
 uLsQ==
X-Gm-Message-State: AOAM533M/AifSIsxOoV7Wv1Rr3HQSNTC11PtGrF3eGt3mnktKdH4HOR5
 kIcb/pru54YMuXybsGCfHUM9lvRQl6G35GZuP1tQ
X-Google-Smtp-Source: ABdhPJxQDuquTdPGDp3pzu8j1PVCuuI09+fYHGo91ip9WVhncgqzsVIxlUHZ1oNjc0YPZm49EDW85fT68FizPkn/b2A=
X-Received: by 2002:a17:907:7b8e:b0:6f3:b955:ccee with SMTP id
 ne14-20020a1709077b8e00b006f3b955cceemr6615050ejc.622.1651066905213; Wed, 27
 Apr 2022 06:41:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220406075921.105-1-xieyongji@bytedance.com>
 <20220406075921.105-5-xieyongji@bytedance.com>
 <Ymglzs0iKKUFiFNW@redhat.com>
 <CACycT3t5YJmo=zwVUF=gbfK5eczqZ1rx1ZaP6iePr7PLBJPzfQ@mail.gmail.com>
 <YmlDe5uh5NSjQT3n@redhat.com>
In-Reply-To: <YmlDe5uh5NSjQT3n@redhat.com>
From: Yongji Xie <xieyongji@bytedance.com>
Date: Wed, 27 Apr 2022 21:42:14 +0800
Message-ID: <CACycT3sONUS6f1HGReVtFf9nA2jnvzgHvu8PHpz1qHV-PeY4Pw@mail.gmail.com>
Subject: Re: [PATCH v4 4/6] vduse-blk: implements vduse-blk export
To: Kevin Wolf <kwolf@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=xieyongji@bytedance.com; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Eric Blake <eblake@redhat.com>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, mreitz@redhat.com, mlureau@redhat.com,
 Stefan Hajnoczi <stefanha@redhat.com>, jsnow@redhat.com,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Apr 27, 2022 at 9:22 PM Kevin Wolf <kwolf@redhat.com> wrote:
>
> Am 27.04.2022 um 05:11 hat Yongji Xie geschrieben:
> > On Wed, Apr 27, 2022 at 1:03 AM Kevin Wolf <kwolf@redhat.com> wrote:
> > >
> > > Am 06.04.2022 um 09:59 hat Xie Yongji geschrieben:
> > > > This implements a VDUSE block backends based on
> > > > the libvduse library. We can use it to export the BDSs
> > > > for both VM and container (host) usage.
> > > >
> > > > The new command-line syntax is:
> > > >
> > > > $ qemu-storage-daemon \
> > > >     --blockdev file,node-name=drive0,filename=test.img \
> > > >     --export vduse-blk,node-name=drive0,id=vduse-export0,writable=on
> > > >
> > > > After the qemu-storage-daemon started, we need to use
> > > > the "vdpa" command to attach the device to vDPA bus:
> > > >
> > > > $ vdpa dev add name vduse-export0 mgmtdev vduse
> > > >
> > > > Also the device must be removed via the "vdpa" command
> > > > before we stop the qemu-storage-daemon.
> > > >
> > > > Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
> > >
> > > The request handling code is almos the same as for the vhost-user-blk
> > > export. I wonder if we could share this code instead of copying.
> > >
> >
> > I think we can. Will do it v5.
> >
> > > The main difference seems to be that you chose not to support discard
> > > and write_zeroes yet. I'm curious if there is a reason why the
> > > vhost-user-blk code wouldn't work for vdpa there?
> > >
> >
> > They are different protocols. The data plane is similar, so we can
> > share some codes. But the control plane is different, e.g., vhost-user
> > can only work for guests but vdpa can work for both guests and hosts.
>
> Yes, sure, but discard/write_zeroes are part of the data plane, no?
> You're already sharing (or at the moment copying) the code for the other
> request types mostly unchanged, so I wondered what is different about
> discard/write_zeroes.
>

I get your point. There is no limitation on discard/write_zeroes
support for vduse. I will do it in v5.

Thanks,
Yongji

