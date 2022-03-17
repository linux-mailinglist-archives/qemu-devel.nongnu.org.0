Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 778164DBCE7
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 03:17:22 +0100 (CET)
Received: from localhost ([::1]:46744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUfhZ-0006oY-J4
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 22:17:21 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1nUfgK-000601-Uv
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 22:16:04 -0400
Received: from [2a00:1450:4864:20::631] (port=33766
 helo=mail-ej1-x631.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1nUfgG-0004NE-DR
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 22:16:02 -0400
Received: by mail-ej1-x631.google.com with SMTP id pv16so7983018ejb.0
 for <qemu-devel@nongnu.org>; Wed, 16 Mar 2022 19:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KPuSpSkTV26gpCqToX03buL1Nr0M5rshLVzCkB2TMAw=;
 b=jQnrCekHXZvsFLjMtmSNGrLbSkjkWtrLplMNgPH/90wdxZsmFWRvRgY8Yl8ENtHOHx
 w9+6iVlbn82uyTafPInYRj1RoXVPuJ6yA3ydjMYJpA9hgiP+xPbO0dI/WdqX8eS6UeL2
 bYyn41eWi6xVG9jq0br7KMEQEOO9ELB2oloYaneUF1wn5Ir7OgF2baXvEeLNijnYVfy7
 sqxsJXZiZbx6iEkjLkJbZT/JwRQ3u+o6l0WNaIuCpDHB6kItW1ZDEXfXvsd07byqX/8O
 owd+1Po2zUlpuTU05r1cRQN+iqYzqxNvV0/gADKo+Y0MGD12Tjo9rxZ28r9NObOhGszy
 f3Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KPuSpSkTV26gpCqToX03buL1Nr0M5rshLVzCkB2TMAw=;
 b=UaWA1uR3becbE8RCDU66VQPvizuukF/+lYTi9vMMaeo+i832nSb7glex0W06ELMJNU
 1/Ik8VXUdNrbAad7TUvMNT4LMMJia+htGI+sHoLTZ+Qg1IPhur+rx0UhC1sUF+XDdDle
 lmtu8Nqhl76PQO9y/Dws549SPhOjloPHJAu2776RI0zmEmwre5rUoTekn0hlkEtQhVuT
 ntJx0S8DZnhV1Uo0Q7LQAA1Q6zZf7GOxTh8ggnE3QQS+Rl1XuVj5vuKLaHbzZZKrsnE1
 Z1kQwjmS5vw8RPEdXTPfGSkMdmf0dKXRjHRTkbGVCBMAtUCjqVx7toneLdTq7gj08pJw
 gzag==
X-Gm-Message-State: AOAM530ntlhivdoupjgnZQ6O/K5aKM1NDzzSVYMOfNDUo5qqPdZmPLAd
 RmFKgzRxQzUuUupmap1gSmpurqEIUr+d5h03nC8t
X-Google-Smtp-Source: ABdhPJy4P1fsSfysmu/bYJ+L8F8QMOwuv+RSukPCP85PysU3iTDzf/cZCn1EMIsIvQBVfFkz/FJCGjx6vr7bxNQkLGA=
X-Received: by 2002:a17:906:4fd3:b0:6db:d516:482b with SMTP id
 i19-20020a1709064fd300b006dbd516482bmr2309598ejw.257.1647483358277; Wed, 16
 Mar 2022 19:15:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220215105943.90-1-xieyongji@bytedance.com>
 <20220215105943.90-4-xieyongji@bytedance.com>
 <YjBg3QnSnpY2cAdL@stefanha-x1.localdomain>
 <CACycT3s7cgHBAqmpy=RZPwPZz4uptr0REzJ9fhM1qv+G_miS1Q@mail.gmail.com>
 <YjHl66pJYw45oKL9@stefanha-x1.localdomain>
 <CACycT3vpQsLG7oxeTHMs3w1qdO7fGJnjGiORfm=t1U2ehgD+bw@mail.gmail.com>
 <YjIHhP7WlXyZ9gJm@stefanha-x1.localdomain>
In-Reply-To: <YjIHhP7WlXyZ9gJm@stefanha-x1.localdomain>
From: Yongji Xie <xieyongji@bytedance.com>
Date: Thu, 17 Mar 2022 10:15:53 +0800
Message-ID: <CACycT3s-V27cCH1OXpXtYRf=sgkCWKrb9Uq_nwNbcgYe2Z5nGQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] libvduse: Add VDUSE (vDPA Device in Userspace)
 library
To: Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::631
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=xieyongji@bytedance.com; helo=mail-ej1-x631.google.com
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

On Wed, Mar 16, 2022 at 11:51 PM Stefan Hajnoczi <stefanha@redhat.com> wrote:
>
> On Wed, Mar 16, 2022 at 09:49:19PM +0800, Yongji Xie wrote:
> > On Wed, Mar 16, 2022 at 9:28 PM Stefan Hajnoczi <stefanha@redhat.com> wrote:
> > >
> > > On Tue, Mar 15, 2022 at 07:38:12PM +0800, Yongji Xie wrote:
> > > > On Tue, Mar 15, 2022 at 5:48 PM Stefan Hajnoczi <stefanha@redhat.com> wrote:
> > > > >
> > > > > On Tue, Feb 15, 2022 at 06:59:40PM +0800, Xie Yongji wrote:
> > > > > > VDUSE [1] is a linux framework that makes it possible to implement
> > > > > > software-emulated vDPA devices in userspace. This adds a library
> > > > > > as a subproject to help implementing VDUSE backends in QEMU.
> > > > > >
> > > > > > [1] https://www.kernel.org/doc/html/latest/userspace-api/vduse.html
> > > > > >
> > > > > > Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
> > > > > > ---
> > > > > >  meson.build                                 |   15 +
> > > > > >  meson_options.txt                           |    2 +
> > > > > >  scripts/meson-buildoptions.sh               |    3 +
> > > > > >  subprojects/libvduse/include/atomic.h       |    1 +
> > > > > >  subprojects/libvduse/libvduse.c             | 1152 +++++++++++++++++++
> > > > > >  subprojects/libvduse/libvduse.h             |  225 ++++
> > > > > >  subprojects/libvduse/linux-headers/linux    |    1 +
> > > > > >  subprojects/libvduse/meson.build            |   10 +
> > > > > >  subprojects/libvduse/standard-headers/linux |    1 +
> > > > > >  9 files changed, 1410 insertions(+)
> > > > > >  create mode 120000 subprojects/libvduse/include/atomic.h
> > > > > >  create mode 100644 subprojects/libvduse/libvduse.c
> > > > > >  create mode 100644 subprojects/libvduse/libvduse.h
> > > > > >  create mode 120000 subprojects/libvduse/linux-headers/linux
> > > > > >  create mode 100644 subprojects/libvduse/meson.build
> > > > > >  create mode 120000 subprojects/libvduse/standard-headers/linux
> > > > >
> > > > > Please update the ./MAINTAINERS file when adding new source files.
> > > >
> > > > OK, sure. And would you mind being one of the maintainers since I'm
> > > > not sure if I can do this job well.
> > >
> > > You're welcome to become the maintainer. It means that you will be CCed
> > > on patches affecting this code and sometimes people might send you
> > > questions about VDUSE exports.
> > >
> >
> > I see. I will try my best.
> >
> > > Is the issue lack of time?
> > >
> >
> > I think the time is enough. But since I have no experience, I'm not
> > sure if I can do this well.
>
> Great! Don't worry there will probably not be much you need to do.
>
> If someone submits a patch they'll CC you and you can post your
> "Reviewed-by:". Kevin or I can pick up the patches you've reviewed and
> send them with our pull requests to the qemu.git maintainer.
>

OK, I got it. Thank you!

Thanks,
Yongji

