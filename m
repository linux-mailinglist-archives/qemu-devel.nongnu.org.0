Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DD16397566
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 16:26:03 +0200 (CEST)
Received: from localhost ([::1]:49338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo5LG-0004Ln-AR
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 10:26:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1lo5K8-00034v-Jg; Tue, 01 Jun 2021 10:24:52 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:39910)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1lo5K6-0003cX-QT; Tue, 01 Jun 2021 10:24:52 -0400
Received: by mail-pg1-x536.google.com with SMTP id v14so10826476pgi.6;
 Tue, 01 Jun 2021 07:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HhYSfI+QPQnPm76A5iC5aR58yw6gRQkObuaWZQUUTJw=;
 b=EePR9kdrHQ+qgi0p+goS+NKl/L93hxGOEe0sQQ0UdQVGKbrXTtznZo+b2R29FUrEaQ
 grqCMrzTxKAO9T30KbVo0hjsjUo45vUDt6MteN7fWF2YCiQGame6lL/FQvoK36MDhjIe
 lTuVC4VSKIItCvd8quLuiLOb6Z3GnIteIfNSJxOsPbSBJNAaQ/7tTQbC6QtyL5yud2wO
 YSePl3RJdtljodDP2X9jY+hPGlGnHomePtvb5DYdVynvQQkKkQkqaTjm4VfcS5M4rXqA
 j4/y0mbSOwmCXjbo/qjPTvefuwAZ5oZi95oPhMz9397NN6oy45+V2me/HY4Wp+fivgm2
 ev4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HhYSfI+QPQnPm76A5iC5aR58yw6gRQkObuaWZQUUTJw=;
 b=pBZJiUlhJ5EulAXnT7FAU3iKCcaHI+w28x+uJ5u1MlMxZHMLudiG8T2nRAlxUsk8P8
 D8i++lDTerIijiVAwhyakijTsNlnuIv+iR+nJeFQWllvrzgv8DlCR8J3DV/pt5N8xjwZ
 BNnFVAb52RBFdFpoYwdo8ZTf8G5trPXWfaCRooEtJg6dHA48PCQXb0kOrKvcfVD4H3Ov
 UTT1RiOSZQSV8/OIhwiR40v6PnlgvrA2C8H/8qg0UDkx5DLnBZZtSqdqVwWWJCMam85g
 iUxTz5MYbM9Hi6P6Is+f6uIaOKphqJNwcKWCn3hIe0SFWkq3U2hMQ06P3Arpp4Ea7GIr
 PBtQ==
X-Gm-Message-State: AOAM531LQbROsAjW+LzSo1EBKl3MejQ5uKDiCcgeqdxPQdsy68ClX9cY
 drHkCfoxi94wa34Z5gLAlZFzg600EhJWEIepL1A=
X-Google-Smtp-Source: ABdhPJzZ9Ew+EFUhPUbB/wnQB8VRDA/mo7Z/VcQ7ML8J2bex096OmLaGkoHk0kB1lMQ8xiP3cEbj9UUvkG/jLxA+pS8=
X-Received: by 2002:a65:6899:: with SMTP id e25mr11815192pgt.393.1622557488788; 
 Tue, 01 Jun 2021 07:24:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210310173004.420190-1-stefanha@redhat.com>
In-Reply-To: <20210310173004.420190-1-stefanha@redhat.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Tue, 1 Jun 2021 15:24:37 +0100
Message-ID: <CAJSP0QUq8fxHfxxVPh_icNYAuhdZuEDOxh3hFoxNY0K6Gi0AJw@mail.gmail.com>
Subject: Re: [PATCH] sockets: update SOCKET_ADDRESS_TYPE_FD listen(2) backlog
To: michael.roth@amd.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=stefanha@gmail.com; helo=mail-pg1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
 Juan Quintela <quintela@redhat.com>, qemu-stable <qemu-stable@nongnu.org>,
 "Richard W . M . Jones" <rjones@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Please consider this patch for the QEMU 6.0 stable release. The bug
was introduced in QEMU 6.0.

Thanks,
Stefan

On Wed, Mar 10, 2021 at 5:54 PM Stefan Hajnoczi <stefanha@redhat.com> wrote:
>
> socket_get_fd() fails with the error "socket_get_fd: too many
> connections" if the given listen backlog value is not 1.
>
> Not all callers set the backlog to 1. For example, commit
> 582d4210eb2f2ab5baac328fe4b479cd86da1647 ("qemu-nbd: Use SOMAXCONN for
> socket listen() backlog") uses SOMAXCONN. This will always fail with in
> socket_get_fd().
>
> This patch calls listen(2) on the fd to update the backlog value. The
> socket may already be in the listen state. I have tested that this works
> on Linux 5.10 and macOS Catalina.
>
> As a bonus this allows us to detect when the fd cannot listen. Now we'll
> be able to catch unbound or connected fds in socket_listen().
>
> Drop the num argument from socket_get_fd() since this function is also
> called by socket_connect() where a listen backlog value does not make
> sense.
>
> Fixes: e5b6353cf25c99c3f08bf51e29933352f7140e8f ("socket: Add backlog parameter to socket_listen")
> Reported-by: Richard W.M. Jones <rjones@redhat.com>
> Cc: Juan Quintela <quintela@redhat.com>
> Cc: Eric Blake <eblake@redhat.com>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  util/qemu-sockets.c | 29 ++++++++++++++++++++++-------
>  1 file changed, 22 insertions(+), 7 deletions(-)
>
> diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
> index 8af0278f15..2463c49773 100644
> --- a/util/qemu-sockets.c
> +++ b/util/qemu-sockets.c
> @@ -1116,14 +1116,10 @@ fail:
>      return NULL;
>  }
>
> -static int socket_get_fd(const char *fdstr, int num, Error **errp)
> +static int socket_get_fd(const char *fdstr, Error **errp)
>  {
>      Monitor *cur_mon = monitor_cur();
>      int fd;
> -    if (num != 1) {
> -        error_setg_errno(errp, EINVAL, "socket_get_fd: too many connections");
> -        return -1;
> -    }
>      if (cur_mon) {
>          fd = monitor_get_fd(cur_mon, fdstr, errp);
>          if (fd < 0) {
> @@ -1159,7 +1155,7 @@ int socket_connect(SocketAddress *addr, Error **errp)
>          break;
>
>      case SOCKET_ADDRESS_TYPE_FD:
> -        fd = socket_get_fd(addr->u.fd.str, 1, errp);
> +        fd = socket_get_fd(addr->u.fd.str, errp);
>          break;
>
>      case SOCKET_ADDRESS_TYPE_VSOCK:
> @@ -1187,7 +1183,26 @@ int socket_listen(SocketAddress *addr, int num, Error **errp)
>          break;
>
>      case SOCKET_ADDRESS_TYPE_FD:
> -        fd = socket_get_fd(addr->u.fd.str, num, errp);
> +        fd = socket_get_fd(addr->u.fd.str, errp);
> +        if (fd < 0) {
> +            return -1;
> +        }
> +
> +        /*
> +         * If the socket is not yet in the listen state, then transition it to
> +         * the listen state now.
> +         *
> +         * If it's already listening then this updates the backlog value as
> +         * requested.
> +         *
> +         * If this socket cannot listen because it's already in another state
> +         * (e.g. unbound or connected) then we'll catch the error here.
> +         */
> +        if (listen(fd, num) != 0) {
> +            error_setg_errno(errp, errno, "Failed to listen on fd socket");
> +            closesocket(fd);
> +            return -1;
> +        }
>          break;
>
>      case SOCKET_ADDRESS_TYPE_VSOCK:
> --
> 2.29.2
>

