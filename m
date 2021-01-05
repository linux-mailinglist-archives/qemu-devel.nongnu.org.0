Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B7B92EB020
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 17:34:43 +0100 (CET)
Received: from localhost ([::1]:41470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwpIA-0007Ag-8R
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 11:34:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kwp75-0007JI-Ia
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 11:23:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:57280)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kwp71-0000FZ-UZ
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 11:23:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609863791;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=EW4/yTsaYp/HwmyDbkL4o65VU5s51o6ns4f0UOu0tm4=;
 b=RZ6R6uoTH75p5LqsKed2sQKThMjGJnvj2nxk+LN3b2fCeqj55beeh+JJM0KjQ0MfyDTeoP
 u0FGf61YflERM2UbgJ5WnwtpJQpKNygRAgo5kVndHGRZPHoovZF0MK7JFeogjhMW5IQ9wT
 XvOuIecWG2gPTQIlxSvC1tsTIdNNusA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-428-AkLlYfHiMkeso6UBOQC_RA-1; Tue, 05 Jan 2021 11:23:06 -0500
X-MC-Unique: AkLlYfHiMkeso6UBOQC_RA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C5C6115723;
 Tue,  5 Jan 2021 16:23:04 +0000 (UTC)
Received: from redhat.com (ovpn-114-197.ams2.redhat.com [10.36.114.197])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5C39860BFA;
 Tue,  5 Jan 2021 16:22:47 +0000 (UTC)
Date: Tue, 5 Jan 2021 16:22:43 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Steve Sistare <steven.sistare@oracle.com>
Subject: Re: [PATCH V2 18/22] chardev: cpr for sockets
Message-ID: <20210105162243.GG724458@redhat.com>
References: <1609861330-129855-1-git-send-email-steven.sistare@oracle.com>
 <1609861330-129855-19-git-send-email-steven.sistare@oracle.com>
MIME-Version: 1.0
In-Reply-To: <1609861330-129855-19-git-send-email-steven.sistare@oracle.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Jason Zeng <jason.zeng@linux.intel.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jan 05, 2021 at 07:42:06AM -0800, Steve Sistare wrote:
> Define qio_channel_socket_reuse to initialize a channel based on an existing
> socket fd.  Save accepted socket fds in the environment before cprsave, and
> look for fds in the environment after cprload.  Reject cprsave if a socket
> enables the TLS or websocket option.
> 
> Signed-off-by: Mark Kanda <mark.kanda@oracle.com>
> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
> ---
>  chardev/char-socket.c       | 30 ++++++++++++++++++++++++++++++
>  include/io/channel-socket.h | 12 ++++++++++++
>  io/channel-socket.c         |  9 +++++++++
>  stubs/Makefile.objs         |  1 +
>  stubs/cpr.c                 |  3 +++
>  5 files changed, 55 insertions(+)
>  create mode 100644 stubs/cpr.c
> 

> diff --git a/include/io/channel-socket.h b/include/io/channel-socket.h
> index 777ff59..e425a01 100644
> --- a/include/io/channel-socket.h
> +++ b/include/io/channel-socket.h
> @@ -260,5 +260,17 @@ QIOChannelSocket *
>  qio_channel_socket_accept(QIOChannelSocket *ioc,
>                            Error **errp);
>  
> +/**
> + * qio_channel_socket_reuse:
> + * @fd: existing client socket descriptor
> + * @errp: pointer to a NULL-initialized error object
> + *
> + * Construct a client channel using @fd.
> + *
> + * Returns: the new client channel, or NULL on error
> + */
> +QIOChannelSocket *
> +qio_channel_socket_reuse(int fd,
> +                         Error **errp);
>  
>  #endif /* QIO_CHANNEL_SOCKET_H */
> diff --git a/io/channel-socket.c b/io/channel-socket.c
> index de49880..07981be 100644
> --- a/io/channel-socket.c
> +++ b/io/channel-socket.c
> @@ -400,6 +400,15 @@ qio_channel_socket_accept(QIOChannelSocket *ioc,
>      return NULL;
>  }
>  
> +QIOChannelSocket *
> +qio_channel_socket_reuse(int fd,
> +                         Error **errp)
> +{
> +    QIOChannelSocket *cioc = qio_channel_socket_new();
> +    cioc->fd = fd;
> +    return qio_channel_socket_post_accept(cioc, errp) ? 0 : cioc;
> +}

Why do we need to add this new API when we already have

 qio_channel_socket_new_fd(int fd, Error **errp)

which accepts a pre-opened socket FD ?


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


