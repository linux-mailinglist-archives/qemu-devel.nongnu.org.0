Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7316493F08
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 18:27:06 +0100 (CET)
Received: from localhost ([::1]:56420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAEji-0004UR-0V
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 12:27:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1nAELc-0005kC-RJ
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 12:02:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28579)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1nAELa-0000QE-VW
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 12:02:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642611729;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=513dqejFlKQ+O6dw9Qi3Q1Ms/ZM/Vp3IH403/92RSO8=;
 b=QgWs70N3hlV23Od9G3Lidpt0RIYkWWeHTEz71XSeYiVwqgwFEpj4jrHLJKaaJQeiniqAov
 NcGIGQ9CFi1P3tJWOfHBu/Y9Hzc/bGFOWW9mN2X0pE9TtB1V5VD4740vAYrMo0Wg/7oYBM
 OhZ/cTQPOFuS/zQNi/GX3yFmm6JvfrE=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-631-TmLdBR4HNHea-WQ9zG8c6A-1; Wed, 19 Jan 2022 12:02:08 -0500
X-MC-Unique: TmLdBR4HNHea-WQ9zG8c6A-1
Received: by mail-ed1-f72.google.com with SMTP id
 j10-20020a05640211ca00b003ff0e234fdfso3196521edw.0
 for <qemu-devel@nongnu.org>; Wed, 19 Jan 2022 09:02:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=513dqejFlKQ+O6dw9Qi3Q1Ms/ZM/Vp3IH403/92RSO8=;
 b=lrLdPw6GPcO6zmi3eiTOtTfJNdUsigO7CkhS0tB9b1fYMiTs5pseHeaT7Vgs64b+ZZ
 800/zBGa6Fx8fTTVVH+soBwxkb2lEO1jmEZDfdanBbQP72srAC9jJc13F3EGBdu/yxat
 erSKY0+YPqgyfc+ppov+0Te4D3mUy4CsTwd2uuzj8AFVcXK6om53s9aLfcY0pdcV0h+f
 6jieKORTrWJGAn3qduUOOE42zwcHoibV1BbsVfz3uVLuMWvcvhCmM+zPGdhE/FB6TGW/
 rRo6rwQNmtDJDUTpMbB5QTkQlXN9AHWKs3NCS2wXcZ1J7Hlz7kJjhHKYIb/YUsR07dQN
 7yEQ==
X-Gm-Message-State: AOAM530Wn0Vs+dJakc8JyHTeglfTuNwUE0CeQ/PQiuZfpsC19KywZnwM
 ZCGtWYrc8bJD6GuQSqZynWrIKPcog0bqY+oJZ9kr5eMe2aavrdYQkuhc0puy3LJ9YNHtbkZJEBs
 dJzR1+S0h9cSPJXrf4wxq9zuzqbHr0sA=
X-Received: by 2002:a05:651c:2106:: with SMTP id
 a6mr11250068ljq.472.1642611727221; 
 Wed, 19 Jan 2022 09:02:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzrBCYX8cUBrv9LwbxjpOOLU+cL9MmVOtF7+jnPK180y4Qil81pUYpJkk4AI4muuB4sGucIUw4X9Z5PNOcTz9U=
X-Received: by 2002:a05:651c:2106:: with SMTP id
 a6mr11250040ljq.472.1642611726987; 
 Wed, 19 Jan 2022 09:02:06 -0800 (PST)
MIME-Version: 1.0
References: <20220106221341.8779-1-leobras@redhat.com>
 <20220106221341.8779-3-leobras@redhat.com>
 <Yd/LLxNCItAIX3eN@xz-m1.local>
In-Reply-To: <Yd/LLxNCItAIX3eN@xz-m1.local>
From: Leonardo Bras Soares Passos <leobras@redhat.com>
Date: Wed, 19 Jan 2022 14:01:55 -0300
Message-ID: <CAJ6HWG5WKfWGVvpF-ZseNKk9b+J3LxXMnUAWajCKKeR21v+JZw@mail.gmail.com>
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
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
> a "break" here?

Here I followed the standard of the EAGAIN error, that's why I just returned -1.

IIUC A break here would cause the errp to be re-set to the default
message, after the switch.
Another option would be to add a 'default' clause, and move the
default error msg there, and return the -1
after the switch.

In the end I thought the current way was simpler, but it's no issue
to change if you think the 'default' idea would be better.

>  If you agree and with that fixed, feel free to add:
>
> Reviewed-by: Peter Xu <peterx@redhat.com>
>

Thanks!

> I also wonder whether you hit ENOBUFS in any of the environments.  On Fedora
> here it's by default unlimited, but just curious when we should keep an eye.

It's unlimited if you run as root IIRC.

>
> Thanks,
>
> --
> Peter Xu
>


