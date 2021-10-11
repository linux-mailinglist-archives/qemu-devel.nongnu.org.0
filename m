Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D374297C1
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Oct 2021 21:47:19 +0200 (CEST)
Received: from localhost ([::1]:56228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ma1GX-0000bv-MZ
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 15:47:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1ma1EI-0008Ka-Ox
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 15:44:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40377)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1ma1EH-0003FM-2K
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 15:44:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633981495;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NNwVTPQkzc9Z3ca1/aAzM3fPTLI2rZc4Wp8wuFHdwPQ=;
 b=cd3BXRsivJ8e5dYWrC3y++tNtMefUUdbLkKDXiPtGLioLrsUARsTXr+tNRRG2E0irUH1al
 Gk3NmtZq2kLLPpvsdk1Zx3p3gmyk6AWzRRaytedUt71wKfVyW5kClNt050APxEb1WsuvaM
 E8jbG/MdZwO4SNVpNC0ez6fLokDE57o=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-451-GhMRlwVlPWWFGOfqAo7Wcg-1; Mon, 11 Oct 2021 15:44:53 -0400
X-MC-Unique: GhMRlwVlPWWFGOfqAo7Wcg-1
Received: by mail-lf1-f69.google.com with SMTP id
 g9-20020a0565123b8900b003f33a027130so13488122lfv.18
 for <qemu-devel@nongnu.org>; Mon, 11 Oct 2021 12:44:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NNwVTPQkzc9Z3ca1/aAzM3fPTLI2rZc4Wp8wuFHdwPQ=;
 b=lVeDy39Er9/MxQYhW/bTq6GERbeY4lcQwVGdPCWSdS4FOpK4JtpOvuUWuAhmSwBrpe
 HfWqfWwYffyVo4mgiiD8Lj3klcEtrouX69m6Hrv5b8TGMms7Hv5dhiqv1qkTd4Kp54P4
 XsCBiHTV6sxKHmlaNPJJNWZ08wXsPYkL3axka7FUVWQyFZW+7rjA0LYaevje8rtcIKMY
 ZdIBWMC5PIQAQbZsNwgn6xPrY3+Hvvs03BZLbDR1EN/31/0F8XJ3zDhltUyhSfTam+w6
 yZl53tdp6zTa9qERI35VXYLj3TeFP7h8bJ0uZo0y92ezKipLb/r8Pju4taxxLlsGut0P
 r5oQ==
X-Gm-Message-State: AOAM530ohpDvdcAC/XxdZczLYcVhaToTanJ/7smu6NzKRvl+Yg18wghk
 RrXMzaAiPo9yBGjhdgbVc7gxJSLh/5jihARKsieYp/Ek8qpkyUVbCPc5yPB+rPg+5GVD3NTH5Ye
 wYeTEeOKDGbNw+VOKmP/Bv1oNqHsLPxk=
X-Received: by 2002:a19:7508:: with SMTP id y8mr9243256lfe.669.1633981491856; 
 Mon, 11 Oct 2021 12:44:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzBUUYmUAjhfXZpmr6WJp4Xz7jUC6k8Af/yRPflT+gixYKoawcPfIjTaQrAfqKuGujLvsA3uSUaY0MMfIe+PW8=
X-Received: by 2002:a19:7508:: with SMTP id y8mr9243228lfe.669.1633981491562; 
 Mon, 11 Oct 2021 12:44:51 -0700 (PDT)
MIME-Version: 1.0
References: <20211009075612.230283-1-leobras@redhat.com>
 <20211009075612.230283-3-leobras@redhat.com>
 <20211011192710.vu7yhmtit5uo4m4j@redhat.com>
In-Reply-To: <20211011192710.vu7yhmtit5uo4m4j@redhat.com>
From: Leonardo Bras Soares Passos <leobras@redhat.com>
Date: Mon, 11 Oct 2021 16:44:52 -0300
Message-ID: <CAJ6HWG6g7eRaQx-HZJdPPuPZJnZsU_C=R=CCd+bp4W6dmYWa8Q@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] QIOChannelSocket: Implement io_writev_zerocopy &
 io_flush_zerocopy for CONFIG_LINUX
To: Eric Blake <eblake@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lsoaresp@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=lsoaresp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
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
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Jason Wang <jasowang@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Peter Xu <peterx@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello Eric,

On Mon, Oct 11, 2021 at 4:28 PM Eric Blake <eblake@redhat.com> wrote:
>
> On Sat, Oct 09, 2021 at 04:56:12AM -0300, Leonardo Bras wrote:
> > For CONFIG_LINUX, implement the new optional callbacks io_write_zerocopy and
> > io_flush_zerocopy on QIOChannelSocket, but enables it only when MSG_ZEROCOPY
> > feature is available in the host kernel, which is checked on
> > qio_channel_socket_connect_sync()
> >
> > qio_channel_socket_writev() contents were moved to a helper function
> > qio_channel_socket_writev_flags() which accepts an extra argument for flags.
> > (This argument is passed directly to sendmsg().
> >
> > The above helper function is used to implement qio_channel_socket_writev(),
> > with flags = 0, keeping it's behavior unchanged, and
>
> its (remember, "it's" is shorthand for "it is", which does not fit here)
>
> > qio_channel_socket_writev_zerocopy() with flags = MSG_ZEROCOPY.
> >
> > qio_channel_socket_flush_zerocopy() was implemented by counting how many times
> > sendmsg(...,MSG_ZEROCOPY) was sucessfully called, and then reading the
> > socket's error queue, in order to find how many of them finished sending.
> > Flush will loop until those counters are the same, or until some error ocurs.
>
> occurs

Thanks!
(I will check if my codespell is enabled in this setup)

>
> >
> > A new function qio_channel_socket_poll() was also created in order to avoid
> > busy-looping recvmsg() in qio_channel_socket_flush_zerocopy() while waiting for
> > updates in socket's error queue.
> >
> > Notes on using writev_zerocopy():
> > 1: Buffer
> > - As MSG_ZEROCOPY tells the kernel to use the same user buffer to avoid copying,
> > some caution is necessary to avoid overwriting any buffer before it's sent.
> > If something like this happen, a newer version of the buffer may be sent instead.
> > - If this is a problem, it's recommended to call flush_zerocopy() before freeing
> > or re-using the buffer.
> >
> > 2: Locked memory
> > - When using MSG_ZERCOCOPY, the buffer memory will be locked after queued, and
> > unlocked after it's sent.
> > - Depending on the size of each buffer, and how often it's sent, it may require
> > a larger amount of locked memory than usually available to non-root user.
> > - If the required amount of locked memory is not available, writev_zerocopy
> > will return an error, which can abort an operation like migration,
> > - Because of this, when an user code wants to add zerocopy as a feature, it
> > requires a mechanism to disable it, so it can still be acessible to less
> > privileged users.
> >
> > Signed-off-by: Leonardo Bras <leobras@redhat.com>
> > ---
> >  include/io/channel-socket.h |   2 +
> >  include/io/channel.h        |   1 +
> >  io/channel-socket.c         | 180 ++++++++++++++++++++++++++++++++++--
> >  3 files changed, 173 insertions(+), 10 deletions(-)
> >
> > +static int qio_channel_socket_flush_zerocopy(QIOChannel *ioc,
> > +                                             Error **errp)
> > +{
>
> > +
> > +        /* No errors, count sucessfully finished sendmsg()*/
>
> Space before */

Thanks!
Also, typo on 'successfully'.

>
> > +        sioc->zerocopy_sent += serr->ee_data - serr->ee_info + 1;
> > +    }
> > +    return 0;
> > +}
> > +
> > +#endif /* CONFIG_LINUX */
> > +
> >  static int
> >  qio_channel_socket_set_blocking(QIOChannel *ioc,
> >                                  bool enabled,
> > @@ -787,6 +943,10 @@ static void qio_channel_socket_class_init(ObjectClass *klass,
> >      ioc_klass->io_set_delay = qio_channel_socket_set_delay;
> >      ioc_klass->io_create_watch = qio_channel_socket_create_watch;
> >      ioc_klass->io_set_aio_fd_handler = qio_channel_socket_set_aio_fd_handler;
> > +#ifdef CONFIG_LINUX
> > +    ioc_klass->io_writev_zerocopy = qio_channel_socket_writev_zerocopy;
> > +    ioc_klass->io_flush_zerocopy = qio_channel_socket_flush_zerocopy;
> > +#endif
> >  }
>
> I did a high-level look at the code, rather than an in-depth review of
> whether zero-copy was being used correctly.

It's so far been very helpful. Thanks!

Best regards,
Leo


