Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 035686074E2
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 12:19:06 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olp7H-0000r5-O7
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 06:19:04 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olour-00080i-Oi
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 06:06:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1olouX-0007af-9y
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 06:05:59 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1olouT-00076y-Gc
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 06:05:53 -0400
Received: by mail-wr1-x433.google.com with SMTP id bk15so3984160wrb.13
 for <qemu-devel@nongnu.org>; Fri, 21 Oct 2022 03:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GB+pI3kGAuzpQoXTGpIpiRRFsRdWt5+i8pDVrDo5vB4=;
 b=CzmN+f1TmY8uBHSiAVNQ6zxNfaxGebmiadC1wQAKTZhLYj4FiEtIhMWq0tQPVm0SLK
 XacWht1NGqaR6Y2jUwfAX6IhcpakVK5I5Ftql2ljjangwJsABF4wCMYf/+1KhfnO8qeN
 +nXSa8G/ckLYCwIq5ePsKdGZU2tzFcH1uNhkaHxhtFOVnnTCpJMGdOS9MeubZtkYvuAG
 priGcqXsO1s7WMpoaZIqaQD3k1Rr6tmYW3Cht+70sThqlFsHIdS0KmJ9BG3/PuTq2vzq
 cTibJzhhXONM9xOhAM6lWBPZb3cKY0M1XDdOM33WnNtrOtlwJBh7x8n6Gg9EpsEBfjbl
 h33w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GB+pI3kGAuzpQoXTGpIpiRRFsRdWt5+i8pDVrDo5vB4=;
 b=Wg5lgGRg1uhanb57ptUYJvtmhVIsM1nJFJ4iidv3jmXx8H7ImQyTSov6zbMluJaO09
 KodEzOCJ9lvSQKvKSPvYRKtFPy2BOHTbIMs8rF8BDs+X4DgjdXoN/cFSfOBbpvtgrMIJ
 phEx81FH+N1IBPynwajW581AxU/Z/ZmySZwou43xkftNqHIwtgrqJFAE0nGt+35ErhBR
 cdLIgcopxTM6kC4mxvgHF21zMQajTkI144+NKxxBP/ftY9lkHdk74YhTbpVOMv8hCpvE
 gA11UT1KApxaWubYXw5WKHeKHCuAL6CKOLhEUkbq3S73lR5Fju8ZQnvYxdLwDYhSxf+H
 AS9g==
X-Gm-Message-State: ACrzQf1cJaqD3o+Jfu5AIwh/kDIoQ+CURV7A0ocrL7MKDNwy443YfHfZ
 RixLfPqYY1Vs4whR2BrlwFCv3Q==
X-Google-Smtp-Source: AMsMyM56sq1HIy0HWbcR0IYJtQwp46T1S4N7uaKz29DxhotsSlDQw6YPcANPVrmEUULyqMfgiJqRig==
X-Received: by 2002:adf:ee84:0:b0:22c:d1fd:71d4 with SMTP id
 b4-20020adfee84000000b0022cd1fd71d4mr11781164wro.350.1666346745235; 
 Fri, 21 Oct 2022 03:05:45 -0700 (PDT)
Received: from [10.50.0.10]
 (ec2-54-194-108-71.eu-west-1.compute.amazonaws.com. [54.194.108.71])
 by smtp.gmail.com with ESMTPSA id
 l24-20020a1c7918000000b003b50428cf66sm2082907wme.33.2022.10.21.03.05.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Oct 2022 03:05:44 -0700 (PDT)
Message-ID: <1f769d00-cf50-abaf-f078-f301959156b9@linaro.org>
Date: Fri, 21 Oct 2022 12:05:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: [PATCH v14 15/17] net: stream: move to QIO to enable additional
 parameters
Content-Language: en-US
To: Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, xen-devel@lists.xenproject.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, Stefan Weil <sw@weilnetz.de>,
 David Gibson <david@gibson.dropbear.id.au>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Eric Blake <eblake@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>, Greg Kurz <groug@kaod.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20221021090922.170074-1-lvivier@redhat.com>
 <20221021090922.170074-16-lvivier@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221021090922.170074-16-lvivier@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 21/10/22 11:09, Laurent Vivier wrote:
> Use QIOChannel, QIOChannelSocket and QIONetListener.
> This allows net/stream to use all the available parameters provided by
> SocketAddress.
> 
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> Acked-by: Michael S. Tsirkin <mst@redhat.com>
> ---
>   net/stream.c    | 492 +++++++++++++++++-------------------------------
>   qemu-options.hx |   4 +-
>   2 files changed, 178 insertions(+), 318 deletions(-)

> -static void net_stream_accept(void *opaque)
> +static void net_stream_server_listening(QIOTask *task, gpointer opaque)
>   {
>       NetStreamState *s = opaque;
> -    struct sockaddr_storage saddr;
> -    socklen_t len;
> -    int fd;
> -
> -    for (;;) {
> -        len = sizeof(saddr);
> -        fd = qemu_accept(s->listen_fd, (struct sockaddr *)&saddr, &len);
> -        if (fd < 0 && errno != EINTR) {
> -            return;
> -        } else if (fd >= 0) {
> -            qemu_set_fd_handler(s->listen_fd, NULL, NULL, NULL);
> -            break;
> -        }
> -    }
> +    QIOChannelSocket *listen_sioc = QIO_CHANNEL_SOCKET(s->listen_ioc);
> +    SocketAddress *addr;
> +    int ret;
>   
> -    s->fd = fd;
> -    s->nc.link_down = false;
> -    net_stream_connect(s);
> -    switch (saddr.ss_family) {
> -    case AF_INET: {
> -        struct sockaddr_in *saddr_in = (struct sockaddr_in *)&saddr;
> -
> -        qemu_set_info_str(&s->nc, "connection from %s:%d",
> -                          inet_ntoa(saddr_in->sin_addr),
> -                          ntohs(saddr_in->sin_port));
> -        break;
> +    if (listen_sioc->fd < 0) {
> +        qemu_set_info_str(&s->nc, "connection error");
> +        return;
>       }
> -    case AF_UNIX: {
> -        struct sockaddr_un saddr_un;
>   
> -        len = sizeof(saddr_un);
> -        getsockname(s->listen_fd, (struct sockaddr *)&saddr_un, &len);
> -        qemu_set_info_str(&s->nc, "connect from %s", saddr_un.sun_path);
> -        break;
> -    }
> -    default:
> -        g_assert_not_reached();
> +    addr = qio_channel_socket_get_local_address(listen_sioc, NULL);
> +    g_assert(addr != NULL);

Missing propagating Error* (observed in v12).

> +    ret = qemu_socket_try_set_nonblock(listen_sioc->fd);
> +    if (addr->type == SOCKET_ADDRESS_TYPE_FD && ret < 0) {
> +        qemu_set_info_str(&s->nc, "can't use file descriptor %s (errno %d)",
> +                          addr->u.fd.str, -ret);
> +        return;
>       }
> +    g_assert(ret == 0);
> +    qapi_free_SocketAddress(addr);
> +
> +    s->nc.link_down = true;
> +    s->listener = qio_net_listener_new();
> +
> +    net_socket_rs_init(&s->rs, net_stream_rs_finalize, false);
> +    qio_net_listener_set_client_func(s->listener, net_stream_listen, s, NULL);
> +    qio_net_listener_add(s->listener, listen_sioc);
>   }
>   
>   static int net_stream_server_init(NetClientState *peer,
> @@ -283,105 +286,61 @@ static int net_stream_server_init(NetClientState *peer,
>   {
>       NetClientState *nc;
>       NetStreamState *s;
> -    int fd, ret;
> +    QIOChannelSocket *listen_sioc = qio_channel_socket_new();
>   
> -    switch (addr->type) {
> -    case SOCKET_ADDRESS_TYPE_INET: {
> -        struct sockaddr_in saddr_in;
> -
> -        if (convert_host_port(&saddr_in, addr->u.inet.host, addr->u.inet.port,
> -                              errp) < 0) {
> -            return -1;
> -        }
> -
> -        fd = qemu_socket(PF_INET, SOCK_STREAM, 0);
> -        if (fd < 0) {
> -            error_setg_errno(errp, errno, "can't create stream socket");
> -            return -1;
> -        }
> -        qemu_socket_set_nonblock(fd);
> +    nc = qemu_new_net_client(&net_stream_info, peer, model, name);
> +    s = DO_UPCAST(NetStreamState, nc, nc);
>   
> -        socket_set_fast_reuse(fd);
> +    s->listen_ioc = QIO_CHANNEL(listen_sioc);
> +    qio_channel_socket_listen_async(listen_sioc, addr, 0,
> +                                    net_stream_server_listening, s,
> +                                    NULL, NULL);
>   
> -        ret = bind(fd, (struct sockaddr *)&saddr_in, sizeof(saddr_in));
> -        if (ret < 0) {
> -            error_setg_errno(errp, errno, "can't bind ip=%s to socket",
> -                             inet_ntoa(saddr_in.sin_addr));
> -            closesocket(fd);
> -            return -1;
> -        }
> -        break;
> -    }
> -    case SOCKET_ADDRESS_TYPE_UNIX: {
> -        struct sockaddr_un saddr_un;
> -
> -        ret = unlink(addr->u.q_unix.path);
> -        if (ret < 0 && errno != ENOENT) {
> -            error_setg_errno(errp, errno, "failed to unlink socket %s",
> -                             addr->u.q_unix.path);
> -            return -1;
> -        }
> +    return 0;
> +}
>   
> -        saddr_un.sun_family = PF_UNIX;
> -        ret = snprintf(saddr_un.sun_path, sizeof(saddr_un.sun_path), "%s",
> -                       addr->u.q_unix.path);
> -        if (ret < 0 || ret >= sizeof(saddr_un.sun_path)) {
> -            error_setg(errp, "UNIX socket path '%s' is too long",
> -                       addr->u.q_unix.path);
> -            error_append_hint(errp, "Path must be less than %zu bytes\n",
> -                              sizeof(saddr_un.sun_path));
> -            return -1;
> -        }
> +static void net_stream_client_connected(QIOTask *task, gpointer opaque)
> +{
> +    NetStreamState *s = opaque;
> +    QIOChannelSocket *sioc = QIO_CHANNEL_SOCKET(s->ioc);
> +    SocketAddress *addr;
> +    gchar *uri;
> +    int ret;
>   
> -        fd = qemu_socket(PF_UNIX, SOCK_STREAM, 0);
> -        if (fd < 0) {
> -            error_setg_errno(errp, errno, "can't create stream socket");
> -            return -1;
> -        }
> -        qemu_socket_set_nonblock(fd);
> -
> -        ret = bind(fd, (struct sockaddr *)&saddr_un, sizeof(saddr_un));
> -        if (ret < 0) {
> -            error_setg_errno(errp, errno, "can't create socket with path: %s",
> -                             saddr_un.sun_path);
> -            closesocket(fd);
> -            return -1;
> -        }
> -        break;
> -    }
> -    case SOCKET_ADDRESS_TYPE_FD:
> -        fd = monitor_fd_param(monitor_cur(), addr->u.fd.str, errp);
> -        if (fd == -1) {
> -            return -1;
> -        }
> -        ret = qemu_socket_try_set_nonblock(fd);
> -        if (ret < 0) {
> -            error_setg_errno(errp, -ret, "%s: Can't use file descriptor %d",
> -                             name, fd);
> -            return -1;
> -        }
> -        break;
> -    default:
> -        error_setg(errp, "only support inet or fd type");
> -        return -1;
> +    if (sioc->fd < 0) {
> +        qemu_set_info_str(&s->nc, "connection error");
> +        goto error;
>       }
>   
> -    ret = listen(fd, 0);
> -    if (ret < 0) {
> -        error_setg_errno(errp, errno, "can't listen on socket");
> -        closesocket(fd);
> -        return -1;
> +    addr = qio_channel_socket_get_remote_address(sioc, NULL);
> +    g_assert(addr != NULL);

Ditto (Error*).

> +    uri = socket_uri(addr);
> +    qemu_set_info_str(&s->nc, uri);
> +    g_free(uri);
> +
> +    ret = qemu_socket_try_set_nonblock(sioc->fd);
> +    if (addr->type == SOCKET_ADDRESS_TYPE_FD && ret < 0) {
> +        qemu_set_info_str(&s->nc, "can't use file descriptor %s (errno %d)",
> +                          addr->u.fd.str, -ret);
> +        qapi_free_SocketAddress(addr);
> +        goto error;
>       }
> +    g_assert(ret == 0);
>   
> -    nc = qemu_new_net_client(&net_stream_info, peer, model, name);
> -    s = DO_UPCAST(NetStreamState, nc, nc);
> -    s->fd = -1;
> -    s->listen_fd = fd;
> -    s->nc.link_down = true;
>       net_socket_rs_init(&s->rs, net_stream_rs_finalize, false);
>   
> -    qemu_set_fd_handler(s->listen_fd, net_stream_accept, NULL, s);
> -    return 0;
> +    /* Disable Nagle algorithm on TCP sockets to reduce latency */
> +    qio_channel_set_delay(s->ioc, false);
> +
> +    s->ioc_read_tag = qio_channel_add_watch(s->ioc, G_IO_IN, net_stream_send,
> +                                            s, NULL);
> +    s->nc.link_down = false;
> +    qapi_free_SocketAddress(addr);
> +
> +    return;
> +error:
> +    object_unref(OBJECT(s->ioc));
> +    s->ioc = NULL;
>   }


