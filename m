Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23F865139D8
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 18:29:56 +0200 (CEST)
Received: from localhost ([::1]:39712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk71e-0004Xg-Pm
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 12:29:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nk6t6-0003Fz-Pq
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 12:21:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32172)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nk6t3-00008s-1b
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 12:21:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651162860;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=38d8FzxdwRrlNl4oomLFpyAiszpK9TXHybbyE1bx+6k=;
 b=ONlwlMbyF7c7QbvuLZW4zNsENV7a440iWsZV10qHKM3cqRzSvSnBp31bhVqS0Chw600fRz
 fXBdlgA0JCTaP+ckAcIaNOLMkHV4ghdYRbTT0rxO0YevQjCAt1uvIW5DHRvAYHPsH2WavD
 F2ChiRJ01lxrcwaro2q/E3OLAqR90pY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-374-EprLNNSDNr2O9-Fyctwmuw-1; Thu, 28 Apr 2022 12:20:59 -0400
X-MC-Unique: EprLNNSDNr2O9-Fyctwmuw-1
Received: by mail-wm1-f69.google.com with SMTP id
 n37-20020a05600c502500b0038fdc1394c6so2132462wmr.6
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 09:20:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=38d8FzxdwRrlNl4oomLFpyAiszpK9TXHybbyE1bx+6k=;
 b=cHYKBoCyJgw63mmXxf0wwFTDtC4VwwilPdLPPxjbTnVKAZSsOLzVuREwLc7PUDaB00
 kaoFF9H+cQzixTGqwf+2rF5PolGtz/pzm+xF8SD+m3PODIgWlvX0TzupM0OrGrD9z9Kj
 gfiUK+Fru9sgIm+j+qhO+SKcJs3p1aIiOjOz0sMSsUY0dU/Yh72UYxxTdqfz1REGVscR
 5QVDjZrs7F/iBpG7zQW4vLH2kuXzMVv+84ZjfMa+Hyj7nQbIo4W9zUDj3p92FBcuJhb/
 yAAOCqg9sFziawUtPDpfIw1n1NLD2MIXbbGRZhb5qhix66Eg2VIqaEhomgihlUydXuQE
 T/6w==
X-Gm-Message-State: AOAM530yZSdtqvQsgRuWzIkIEi9noQH8E5hgH7FZEk8hjClgltBmyWoG
 BZOYppLEEAanOF9/jnOajGiq0FO0AJS51SMtUzg8I2pn2nwJ6h/WxVloNpVUUjmOU6i+ujISLTD
 T/0R0WPa4pN1SWbuIprkMBFpVlZ5HgxTb4y++PkIuQW22uR9NQnnnivbOqOfyUrxJatA=
X-Received: by 2002:a05:600c:3589:b0:393:efa4:2ecd with SMTP id
 p9-20020a05600c358900b00393efa42ecdmr17038335wmq.4.1651162857267; 
 Thu, 28 Apr 2022 09:20:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxpwgL7mQMLV8mF9jC8r/SFFwKK/VKb+7sI8bssYTeSQA64AAwt+IvQSeHoL0ohWPsIDosusg==
X-Received: by 2002:a05:600c:3589:b0:393:efa4:2ecd with SMTP id
 p9-20020a05600c358900b00393efa42ecdmr17038296wmq.4.1651162856761; 
 Thu, 28 Apr 2022 09:20:56 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 k11-20020adfc70b000000b0020ad82e3ec8sm222382wrg.62.2022.04.28.09.20.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Apr 2022 09:20:56 -0700 (PDT)
Date: Thu, 28 Apr 2022 17:20:53 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, berrange@redhat.com, quintela@redhat.com,
 peterx@redhat.com
Subject: Re: [PULL 06/11] QIOChannelSocket: Implement io_writev zero copy
 flag & io_flush for CONFIG_LINUX
Message-ID: <Ymq+5bPaYTyUHF6L@work-vm>
References: <20220428144052.263382-1-dgilbert@redhat.com>
 <20220428144052.263382-7-dgilbert@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220428144052.263382-7-dgilbert@redhat.com>
User-Agent: Mutt/2.2.1 (2022-02-19)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Leo:
  Unfortunately this is failing a couple of CI tests; the MSG_ZEROCOPY
one I guess is the simpler one; I think Stefanha managed to find the
liburing fix for the __kernel_timespec case, but that looks like a bit
more fun!

Dave


Job #2390848140 ( https://gitlab.com/dagrh/qemu/-/jobs/2390848140/raw )
Name: build-system-alpine
In file included from /usr/include/linux/errqueue.h:6,
                 from ../io/channel-socket.c:29:
/usr/include/linux/time_types.h:7:8: error: redefinition of 'struct __kernel_timespec'
    7 | struct __kernel_timespec {
      |        ^~~~~~~~~~~~~~~~~
In file included from /usr/include/liburing.h:19,
                 from /builds/dagrh/qemu/include/block/aio.h:18,
                 from /builds/dagrh/qemu/include/io/channel.h:26,
                 from /builds/dagrh/qemu/include/io/channel-socket.h:24,
                 from ../io/channel-socket.c:24:
/usr/include/liburing/compat.h:9:8: note: originally defined here
    9 | struct __kernel_timespec {
      |        ^~~~~~~~~~~~~~~~~

----
Name: build-system-opensuse

https://gitlab.com/dagrh/qemu/-/jobs/2390848160/raw
../io/channel-socket.c: In function â€˜qio_channel_socket_writevâ€™:
../io/channel-socket.c:578:18: error: â€˜MSG_ZEROCOPYâ€™ undeclared (first use in this function); did you mean â€˜SO_ZEROCOPYâ€™?
         sflags = MSG_ZEROCOPY;
                  ^~~~~~~~~~~~
                  SO_ZEROCOPY
../io/channel-socket.c:578:18: note: each undeclared identifier is reported only once for each function it appears in

* Dr. David Alan Gilbert (git) (dgilbert@redhat.com) wrote:
> From: Leonardo Bras <leobras@redhat.com>
> 
> For CONFIG_LINUX, implement the new zero copy flag and the optional callback
> io_flush on QIOChannelSocket, but enables it only when MSG_ZEROCOPY
> feature is available in the host kernel, which is checked on
> qio_channel_socket_connect_sync()
> 
> qio_channel_socket_flush() was implemented by counting how many times
> sendmsg(...,MSG_ZEROCOPY) was successfully called, and then reading the
> socket's error queue, in order to find how many of them finished sending.
> Flush will loop until those counters are the same, or until some error occurs.
> 
> Notes on using writev() with QIO_CHANNEL_WRITE_FLAG_ZERO_COPY:
> 1: Buffer
> - As MSG_ZEROCOPY tells the kernel to use the same user buffer to avoid copying,
> some caution is necessary to avoid overwriting any buffer before it's sent.
> If something like this happen, a newer version of the buffer may be sent instead.
> - If this is a problem, it's recommended to call qio_channel_flush() before freeing
> or re-using the buffer.
> 
> 2: Locked memory
> - When using MSG_ZERCOCOPY, the buffer memory will be locked after queued, and
> unlocked after it's sent.
> - Depending on the size of each buffer, and how often it's sent, it may require
> a larger amount of locked memory than usually available to non-root user.
> - If the required amount of locked memory is not available, writev_zero_copy
> will return an error, which can abort an operation like migration,
> - Because of this, when an user code wants to add zero copy as a feature, it
> requires a mechanism to disable it, so it can still be accessible to less
> privileged users.
> 
> Signed-off-by: Leonardo Bras <leobras@redhat.com>
> Reviewed-by: Peter Xu <peterx@redhat.com>
> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> Reviewed-by: Juan Quintela <quintela@redhat.com>
> Message-Id: <20220426230654.637939-3-leobras@redhat.com>
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> ---
>  include/io/channel-socket.h |   2 +
>  io/channel-socket.c         | 108 ++++++++++++++++++++++++++++++++++--
>  2 files changed, 106 insertions(+), 4 deletions(-)
> 
> diff --git a/include/io/channel-socket.h b/include/io/channel-socket.h
> index e747e63514..513c428fe4 100644
> --- a/include/io/channel-socket.h
> +++ b/include/io/channel-socket.h
> @@ -47,6 +47,8 @@ struct QIOChannelSocket {
>      socklen_t localAddrLen;
>      struct sockaddr_storage remoteAddr;
>      socklen_t remoteAddrLen;
> +    ssize_t zero_copy_queued;
> +    ssize_t zero_copy_sent;
>  };
>  
>  
> diff --git a/io/channel-socket.c b/io/channel-socket.c
> index 696a04dc9c..1dd85fc1ef 100644
> --- a/io/channel-socket.c
> +++ b/io/channel-socket.c
> @@ -25,6 +25,10 @@
>  #include "io/channel-watch.h"
>  #include "trace.h"
>  #include "qapi/clone-visitor.h"
> +#ifdef CONFIG_LINUX
> +#include <linux/errqueue.h>
> +#include <bits/socket.h>
> +#endif
>  
>  #define SOCKET_MAX_FDS 16
>  
> @@ -54,6 +58,8 @@ qio_channel_socket_new(void)
>  
>      sioc = QIO_CHANNEL_SOCKET(object_new(TYPE_QIO_CHANNEL_SOCKET));
>      sioc->fd = -1;
> +    sioc->zero_copy_queued = 0;
> +    sioc->zero_copy_sent = 0;
>  
>      ioc = QIO_CHANNEL(sioc);
>      qio_channel_set_feature(ioc, QIO_CHANNEL_FEATURE_SHUTDOWN);
> @@ -153,6 +159,16 @@ int qio_channel_socket_connect_sync(QIOChannelSocket *ioc,
>          return -1;
>      }
>  
> +#ifdef CONFIG_LINUX
> +    int ret, v = 1;
> +    ret = setsockopt(fd, SOL_SOCKET, SO_ZEROCOPY, &v, sizeof(v));
> +    if (ret == 0) {
> +        /* Zero copy available on host */
> +        qio_channel_set_feature(QIO_CHANNEL(ioc),
> +                                QIO_CHANNEL_FEATURE_WRITE_ZERO_COPY);
> +    }
> +#endif
> +
>      return 0;
>  }
>  
> @@ -533,6 +549,7 @@ static ssize_t qio_channel_socket_writev(QIOChannel *ioc,
>      char control[CMSG_SPACE(sizeof(int) * SOCKET_MAX_FDS)];
>      size_t fdsize = sizeof(int) * nfds;
>      struct cmsghdr *cmsg;
> +    int sflags = 0;
>  
>      memset(control, 0, CMSG_SPACE(sizeof(int) * SOCKET_MAX_FDS));
>  
> @@ -557,15 +574,27 @@ static ssize_t qio_channel_socket_writev(QIOChannel *ioc,
>          memcpy(CMSG_DATA(cmsg), fds, fdsize);
>      }
>  
> +    if (flags & QIO_CHANNEL_WRITE_FLAG_ZERO_COPY) {
> +        sflags = MSG_ZEROCOPY;
> +    }
> +
>   retry:
> -    ret = sendmsg(sioc->fd, &msg, 0);
> +    ret = sendmsg(sioc->fd, &msg, sflags);
>      if (ret <= 0) {
> -        if (errno == EAGAIN) {
> +        switch (errno) {
> +        case EAGAIN:
>              return QIO_CHANNEL_ERR_BLOCK;
> -        }
> -        if (errno == EINTR) {
> +        case EINTR:
>              goto retry;
> +        case ENOBUFS:
> +            if (sflags & MSG_ZEROCOPY) {
> +                error_setg_errno(errp, errno,
> +                                 "Process can't lock enough memory for using MSG_ZEROCOPY");
> +                return -1;
> +            }
> +            break;
>          }
> +
>          error_setg_errno(errp, errno,
>                           "Unable to write to socket");
>          return -1;
> @@ -659,6 +688,74 @@ static ssize_t qio_channel_socket_writev(QIOChannel *ioc,
>  }
>  #endif /* WIN32 */
>  
> +
> +#ifdef CONFIG_LINUX
> +static int qio_channel_socket_flush(QIOChannel *ioc,
> +                                    Error **errp)
> +{
> +    QIOChannelSocket *sioc = QIO_CHANNEL_SOCKET(ioc);
> +    struct msghdr msg = {};
> +    struct sock_extended_err *serr;
> +    struct cmsghdr *cm;
> +    char control[CMSG_SPACE(sizeof(*serr))];
> +    int received;
> +    int ret = 1;
> +
> +    msg.msg_control = control;
> +    msg.msg_controllen = sizeof(control);
> +    memset(control, 0, sizeof(control));
> +
> +    while (sioc->zero_copy_sent < sioc->zero_copy_queued) {
> +        received = recvmsg(sioc->fd, &msg, MSG_ERRQUEUE);
> +        if (received < 0) {
> +            switch (errno) {
> +            case EAGAIN:
> +                /* Nothing on errqueue, wait until something is available */
> +                qio_channel_wait(ioc, G_IO_ERR);
> +                continue;
> +            case EINTR:
> +                continue;
> +            default:
> +                error_setg_errno(errp, errno,
> +                                 "Unable to read errqueue");
> +                return -1;
> +            }
> +        }
> +
> +        cm = CMSG_FIRSTHDR(&msg);
> +        if (cm->cmsg_level != SOL_IP &&
> +            cm->cmsg_type != IP_RECVERR) {
> +            error_setg_errno(errp, EPROTOTYPE,
> +                             "Wrong cmsg in errqueue");
> +            return -1;
> +        }
> +
> +        serr = (void *) CMSG_DATA(cm);
> +        if (serr->ee_errno != SO_EE_ORIGIN_NONE) {
> +            error_setg_errno(errp, serr->ee_errno,
> +                             "Error on socket");
> +            return -1;
> +        }
> +        if (serr->ee_origin != SO_EE_ORIGIN_ZEROCOPY) {
> +            error_setg_errno(errp, serr->ee_origin,
> +                             "Error not from zero copy");
> +            return -1;
> +        }
> +
> +        /* No errors, count successfully finished sendmsg()*/
> +        sioc->zero_copy_sent += serr->ee_data - serr->ee_info + 1;
> +
> +        /* If any sendmsg() succeeded using zero copy, return 0 at the end */
> +        if (serr->ee_code != SO_EE_CODE_ZEROCOPY_COPIED) {
> +            ret = 0;
> +        }
> +    }
> +
> +    return ret;
> +}
> +
> +#endif /* CONFIG_LINUX */
> +
>  static int
>  qio_channel_socket_set_blocking(QIOChannel *ioc,
>                                  bool enabled,
> @@ -789,6 +886,9 @@ static void qio_channel_socket_class_init(ObjectClass *klass,
>      ioc_klass->io_set_delay = qio_channel_socket_set_delay;
>      ioc_klass->io_create_watch = qio_channel_socket_create_watch;
>      ioc_klass->io_set_aio_fd_handler = qio_channel_socket_set_aio_fd_handler;
> +#ifdef CONFIG_LINUX
> +    ioc_klass->io_flush = qio_channel_socket_flush;
> +#endif
>  }
>  
>  static const TypeInfo qio_channel_socket_info = {
> -- 
> 2.35.1
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


