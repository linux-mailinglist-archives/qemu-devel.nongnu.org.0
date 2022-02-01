Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94BA84A55E0
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 05:24:17 +0100 (CET)
Received: from localhost ([::1]:38616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEkiG-0005Ah-Mr
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 23:24:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1nEkhV-0004Uu-Kh
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 23:23:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35602)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1nEkhT-0006f5-8o
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 23:23:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643689406;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jXkE8LbIS35z1bJnVclUZ0x6Mmb/5/jXZMxgRkX26Rg=;
 b=JbqQh7RICfAl2xsq2AJ79QvEOSsmNKLVVe/1hlLYfeQ9U2GyNdGN3BXQ2LLVMuxEUn/YYn
 UQDIMNhAMLGJl1sA9VsyIJPikjiIerqUtDbzSvIoHlSgD6aTdFEMgJYY5jhUPqxbm+npF0
 PxrcbiDyc+yzq6efw6/yCdDGfkHkQ18=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-189-Pmnge_D-MJy4D_N0b-OCNg-1; Mon, 31 Jan 2022 23:23:24 -0500
X-MC-Unique: Pmnge_D-MJy4D_N0b-OCNg-1
Received: by mail-lf1-f69.google.com with SMTP id
 n6-20020ac242c6000000b00439ec721d28so5392786lfl.6
 for <qemu-devel@nongnu.org>; Mon, 31 Jan 2022 20:23:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jXkE8LbIS35z1bJnVclUZ0x6Mmb/5/jXZMxgRkX26Rg=;
 b=QUCq/jKyu4CV5ffTz4517yvUt0aIGavfJQ8axqxRF0Oo/xHCL0Tuq2t/WYMUUOQ70h
 +4D3PojxKYR85EmmZRW8YFGB/IqvnJ9uTGoprUksJy1AQWrsNqTmrt+uk4UxLOXm505Y
 MM2Z+z5a0GaIXy5ZffpFgdBgC8yVXYzxB81GwIs9K0Djm3/Q4haRjpFenYzap06pdYYT
 zMUAVL/wcLLXA95Adw667/Y/8vbQ0mQ9tFOKgytIF1xBTMUq0zC9XA1RxfTNFcDWmh/B
 W26T9IuRH24xOP382aChy3Z+iMPOxhDVAaj5YxeznwamJYGtp9YrAkASMm32Xt0jJJWj
 dxCA==
X-Gm-Message-State: AOAM532h1Wn+PpxNsfnNQRw6DLCCjER4fIUnmeCev2SGXsgbS/j6v+dr
 jdwRAbTpRPHVG6iTJoRFKdMmwTGumszrs6MhC82lTKZUkcp3pYaSNPoQgoYAYovDJlKNsPJpbVi
 3eGbiy+y/IQPyKJiNqR62D+/qak1yTsM=
X-Received: by 2002:a05:6512:33d2:: with SMTP id
 d18mr13086526lfg.370.1643689403007; 
 Mon, 31 Jan 2022 20:23:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyYdYzQF5Y6fQI/vZ6O1dMhk1M/vhZRX/EyLi+zrtQyHAT8GvXO9t/b7SwfEkyNhalvbo7n6jEwXdVMzRoI0H0=
X-Received: by 2002:a05:6512:33d2:: with SMTP id
 d18mr13086508lfg.370.1643689402777; 
 Mon, 31 Jan 2022 20:23:22 -0800 (PST)
MIME-Version: 1.0
References: <20220106221341.8779-1-leobras@redhat.com>
 <20220106221341.8779-3-leobras@redhat.com>
 <Yd/LLxNCItAIX3eN@xz-m1.local>
In-Reply-To: <Yd/LLxNCItAIX3eN@xz-m1.local>
From: Leonardo Bras Soares Passos <leobras@redhat.com>
Date: Tue, 1 Feb 2022 01:23:11 -0300
Message-ID: <CAJ6HWG4_gN5btsKwLkfGUCwP5jEQw8SeG6hModQWeZReadK9_w@mail.gmail.com>
Subject: Re: [PATCH v7 2/5] QIOChannelSocket: Implement io_writev zero copy
 flag & io_flush for CONFIG_LINUX
To: Peter Xu <peterx@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lsoaresp@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lsoaresp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.088,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello Peter,

Re-reading everything before submitting the next version.
I think I finally got that you are suggesting to just add a break at
the end of the case, after the if :)

Sorry I misunderstand that before,

Best regards,
Leo

On Thu, Jan 13, 2022 at 3:48 AM Peter Xu <peterx@redhat.com> wrote:
>
> On Thu, Jan 06, 2022 at 07:13:39PM -0300, Leonardo Bras wrote:
> > @@ -558,15 +575,26 @@ static ssize_t qio_channel_socket_writev(QIOChannel *ioc,
> >          memcpy(CMSG_DATA(cmsg), fds, fdsize);
> >      }
> >
> > +    if (flags & QIO_CHANNEL_WRITE_FLAG_ZERO_COPY) {
> > +        sflags = MSG_ZEROCOPY;
> > +    }
> > +
> >   retry:
> > -    ret = sendmsg(sioc->fd, &msg, 0);
> > +    ret = sendmsg(sioc->fd, &msg, sflags);
> >      if (ret <= 0) {
> > -        if (errno == EAGAIN) {
> > +        switch (errno) {
> > +        case EAGAIN:
> >              return QIO_CHANNEL_ERR_BLOCK;
> > -        }
> > -        if (errno == EINTR) {
> > +        case EINTR:
> >              goto retry;
> > +        case ENOBUFS:
> > +            if (sflags & MSG_ZEROCOPY) {
> > +                error_setg_errno(errp, errno,
> > +                                 "Process can't lock enough memory for using MSG_ZEROCOPY");
> > +                return -1;
> > +            }
>
> I have no idea whether it'll make a real differnece, but - should we better add
> a "break" here?  If you agree and with that fixed, feel free to add:
>
> Reviewed-by: Peter Xu <peterx@redhat.com>
>
> I also wonder whether you hit ENOBUFS in any of the environments.  On Fedora
> here it's by default unlimited, but just curious when we should keep an eye.
>
> Thanks,
>
> --
> Peter Xu
>


