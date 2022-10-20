Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3F91606755
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 19:54:27 +0200 (CEST)
Received: from localhost ([::1]:59916 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olZGW-00076b-Fn
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 13:23:32 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olYsE-0006IC-El
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 12:58:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1olXOG-0004qW-Vl
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 11:23:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54935)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1olXOE-0007oT-WE
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 11:23:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666279402;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zMafXDcBqKdvZpHSUPYR6MPcYJqX4ipPzdBK8RxDOKw=;
 b=IJiYk2/towOBpdYR2Gt+mV0A4zR6Tai4K6ojOWjdqLcsMpPpbOepmKuQihC0jHQEHO692z
 BeWv6M8VvK3ZsvBx8sIbrCbAaTgfJxwWG5FSJc7EY5Spdu/bjq87t10lHp0Gk5XVATOOSA
 /6aDC/5/UtDG9Wq3Utvzy7MHDN4xtmc=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-642-dzwFUn_ENi2kdhdb8WXYtg-1; Thu, 20 Oct 2022 11:23:20 -0400
X-MC-Unique: dzwFUn_ENi2kdhdb8WXYtg-1
Received: by mail-qt1-f197.google.com with SMTP id
 d25-20020ac847d9000000b0039d0dd90182so1331028qtr.3
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 08:23:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zMafXDcBqKdvZpHSUPYR6MPcYJqX4ipPzdBK8RxDOKw=;
 b=THloS0z4g2dyh/fkxNOv8ZBtjZxYys1NknGbfhT+w49VVWbpIfFymxuCgCBxlmhz4F
 ySm3tnWpeP4XU9Jhfb8qkHI1tPGzXtQKfmv+5Y93Zgd42PihcCR6YkAXSGH3NVz2dsD0
 suIpaSQ8o5BCOoSqSuhC7R+4c6XE7ee5t0pDXeQi1KIrs8PB54ug84HDWQrmNkmQSQh7
 n6IVvZr6Rl7PBb6ID4hfshXEupju0XmbtF2p+LVn6r0OMAiWl5NOcKaXHAkBGpq2M227
 xg1eULTxCh4CZiG8ZDVWijmByspWI/CR4MpUk1lOf4qGFp47rTtueS49cw/NsYyD0dBb
 VdkA==
X-Gm-Message-State: ACrzQf3ZrHvAB2xOVXSDd1aO6lZsl5lbib4pyvgyB6b6rDY31ApkxVDx
 ZTZ2bikls4DJB0yky7Sx3JckGRQOoYfKN3VASfN+BymwExyNlcp3CjCtnbDoccO4Mep14naFGoe
 kdMLvJ/JyE1eKzHw=
X-Received: by 2002:a05:620a:f11:b0:6cf:be4e:e953 with SMTP id
 v17-20020a05620a0f1100b006cfbe4ee953mr9747473qkl.437.1666279400422; 
 Thu, 20 Oct 2022 08:23:20 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5IAM5fKOIcH08J7hWh9Ggvk8a/9IWJQskowqJlbJBxrjSIfRgNk1w/mWkvaP3l64jsbd26/A==
X-Received: by 2002:a05:620a:f11:b0:6cf:be4e:e953 with SMTP id
 v17-20020a05620a0f1100b006cfbe4ee953mr9747449qkl.437.1666279400159; 
 Thu, 20 Oct 2022 08:23:20 -0700 (PDT)
Received: from [192.168.100.30] ([82.142.8.70])
 by smtp.gmail.com with ESMTPSA id
 bk18-20020a05620a1a1200b006ec771d8f89sm7645948qkb.112.2022.10.20.08.23.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Oct 2022 08:23:19 -0700 (PDT)
Message-ID: <b1fd6fdf-fd91-b3af-978c-b50c3b1c8763@redhat.com>
Date: Thu, 20 Oct 2022 17:23:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v12 15/17] net: stream: move to QIO to enable additional
 parameters
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 xen-devel@lists.xenproject.org, Eric Blake <eblake@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Greg Kurz <groug@kaod.org>,
 Jason Wang <jasowang@redhat.com>, Anthony Perard
 <anthony.perard@citrix.com>, Thomas Huth <thuth@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Paul Durrant <paul@xen.org>,
 Stefan Weil <sw@weilnetz.de>, Markus Armbruster <armbru@redhat.com>
References: <20221020091624.48368-1-lvivier@redhat.com>
 <20221020091624.48368-16-lvivier@redhat.com>
 <6fa6b9e5-fede-0f68-752f-0c0d8fa3494f@linaro.org>
From: Laurent Vivier <lvivier@redhat.com>
In-Reply-To: <6fa6b9e5-fede-0f68-752f-0c0d8fa3494f@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/20/22 15:09, Philippe Mathieu-Daudé wrote:
> On 20/10/22 11:16, Laurent Vivier wrote:
>> Use QIOChannel, QIOChannelSocket and QIONetListener.
>> This allows net/stream to use all the available parameters provided by
>> SocketAddress.
>>
>> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
>> Acked-by: Michael S. Tsirkin <mst@redhat.com>
>> ---
>>   meson           |   2 +-
>>   net/stream.c    | 493 +++++++++++++++++-------------------------------
>>   qemu-options.hx |   4 +-
>>   3 files changed, 180 insertions(+), 319 deletions(-)
> 
>>   static int net_stream_server_init(NetClientState *peer,
>> @@ -283,105 +287,61 @@ static int net_stream_server_init(NetClientState *peer,
>>   {
>>       NetClientState *nc;
>>       NetStreamState *s;
>> -    int fd, ret;
>> -
>> -    switch (addr->type) {
>> -    case SOCKET_ADDRESS_TYPE_INET: {
>> -        struct sockaddr_in saddr_in;
>> -
>> -        if (convert_host_port(&saddr_in, addr->u.inet.host, addr->u.inet.port,
>> -                              errp) < 0) {
>> -            return -1;
>> -        }
>> +    QIOChannelSocket *listen_sioc = qio_channel_socket_new();
>> -        fd = qemu_socket(PF_INET, SOCK_STREAM, 0);
>> -        if (fd < 0) {
>> -            error_setg_errno(errp, errno, "can't create stream socket");
>> -            return -1;
>> -        }
>> -        qemu_socket_set_nonblock(fd);
>> +    nc = qemu_new_net_client(&net_stream_info, peer, model, name);
>> +    s = DO_UPCAST(NetStreamState, nc, nc);
>> -        socket_set_fast_reuse(fd);
>> +    s->listen_ioc = QIO_CHANNEL(listen_sioc);
>> +    qio_channel_socket_listen_async(listen_sioc, addr, 0,
>> +                                    net_stream_server_listening, s,
>> +                                    NULL, NULL);
>> -        ret = bind(fd, (struct sockaddr *)&saddr_in, sizeof(saddr_in));
>> -        if (ret < 0) {
>> -            error_setg_errno(errp, errno, "can't bind ip=%s to socket",
>> -                             inet_ntoa(saddr_in.sin_addr));
>> -            closesocket(fd);
>> -            return -1;
>> -        }
>> -        break;
>> -    }
>> -    case SOCKET_ADDRESS_TYPE_UNIX: {
>> -        struct sockaddr_un saddr_un;
>> -
>> -        ret = unlink(addr->u.q_unix.path);
>> -        if (ret < 0 && errno != ENOENT) {
>> -            error_setg_errno(errp, errno, "failed to unlink socket %s",
>> -                             addr->u.q_unix.path);
>> -            return -1;
>> -        }
>> +    return 0;
>> +}
>> -        saddr_un.sun_family = PF_UNIX;
>> -        ret = snprintf(saddr_un.sun_path, sizeof(saddr_un.sun_path), "%s",
>> -                       addr->u.q_unix.path);
>> -        if (ret < 0 || ret >= sizeof(saddr_un.sun_path)) {
>> -            error_setg(errp, "UNIX socket path '%s' is too long",
>> -                       addr->u.q_unix.path);
>> -            error_append_hint(errp, "Path must be less than %zu bytes\n",
>> -                              sizeof(saddr_un.sun_path));
>> -            return -1;
>> -        }
>> +static void net_stream_client_connected(QIOTask *task, gpointer opaque)
>> +{
>> +    NetStreamState *s = opaque;
>> +    QIOChannelSocket *sioc = QIO_CHANNEL_SOCKET(s->ioc);
>> +    SocketAddress *addr;
>> +    gchar *uri;
>> +    int ret;
>> -        fd = qemu_socket(PF_UNIX, SOCK_STREAM, 0);
>> -        if (fd < 0) {
>> -            error_setg_errno(errp, errno, "can't create stream socket");
>> -            return -1;
>> -        }
>> -        qemu_socket_set_nonblock(fd);
>> -
>> -        ret = bind(fd, (struct sockaddr *)&saddr_un, sizeof(saddr_un));
>> -        if (ret < 0) {
>> -            error_setg_errno(errp, errno, "can't create socket with path: %s",
>> -                             saddr_un.sun_path);
>> -            closesocket(fd);
>> -            return -1;
>> -        }
>> -        break;
>> -    }
>> -    case SOCKET_ADDRESS_TYPE_FD:
>> -        fd = monitor_fd_param(monitor_cur(), addr->u.fd.str, errp);
>> -        if (fd == -1) {
>> -            return -1;
>> -        }
>> -        ret = qemu_socket_try_set_nonblock(fd);
>> -        if (ret < 0) {
>> -            error_setg_errno(errp, -ret, "%s: Can't use file descriptor %d",
>> -                             name, fd);
>> -            return -1;
>> -        }
>> -        break;
>> -    default:
>> -        error_setg(errp, "only support inet or fd type");
>> -        return -1;
>> +    if (sioc->fd < 0) {
>> +        qemu_set_info_str(&s->nc, "connection error");
>> +        goto error;
>>       }
>> -    ret = listen(fd, 0);
>> -    if (ret < 0) {
>> -        error_setg_errno(errp, errno, "can't listen on socket");
>> -        closesocket(fd);
>> -        return -1;
>> +    addr = qio_channel_socket_get_remote_address(sioc, NULL);
>> +    g_assert(addr != NULL);
> 
> Please use:
> 
>         addr = qio_channel_socket_get_remote_address(sioc, &error_fatal);
> 
> Which is more verbose in case of error, i.e.:
> 
>    qemu-system-x86_64: socket family 0 unsupported
> 
> Instead of:
> 
>    ERROR:../../net/stream.c:321:net_stream_client_connected: assertion failed: (addr != NULL)
> 

I put an assert() here because I consider to have NULL here is a programming error, not an 
user error.

"It should not happen".

Thanks,
Laurent


