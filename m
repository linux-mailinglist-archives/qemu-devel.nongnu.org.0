Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5457D60754E
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 12:46:25 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olpXj-0005IW-CW
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 06:46:23 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olpVf-0007k5-So
	for lists+qemu-devel@lfdr.de; Fri, 21 Oct 2022 06:44:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1olpVO-0006ti-0W
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 06:44:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1olpVL-00041Q-Ta
 for qemu-devel@nongnu.org; Fri, 21 Oct 2022 06:43:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666349035;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qlhzrGdNNXcUHQesRH8bQ4YpN+DZcGJ2lAA8SoLbHRk=;
 b=FmGC4k1DR5SBIOCciuerv9XbigIDJ5uciri7AwT9v4lSxobuUULSVpRBo/UtZqmj8ApL01
 bWNApFyp/EDPYee89cUID2Ucns2CkDv//Kbou717BMbUIZlYBxJPDzxVcApmkPdHedBCdN
 8nPvt0xTSEWJloJAaxKC6Sa+7J4CkFY=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-310-gChVw4DlO1OANqeT7aPrvA-1; Fri, 21 Oct 2022 06:43:54 -0400
X-MC-Unique: gChVw4DlO1OANqeT7aPrvA-1
Received: by mail-qv1-f72.google.com with SMTP id
 em2-20020ad44f82000000b004af5338777cso2050015qvb.4
 for <qemu-devel@nongnu.org>; Fri, 21 Oct 2022 03:43:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qlhzrGdNNXcUHQesRH8bQ4YpN+DZcGJ2lAA8SoLbHRk=;
 b=Mev+Ch8fmz65oji19PVk6QseqjDmxN8VAk93XtOWwtV5KQeam+aiwyHajahqXLOueK
 yQK/CYUFoHlomN7aQXcFf3GVxQQGpjoKUR3yzT+6mx7KpB4QuGjU6RrQGAQ7gBxoWPiU
 IijtHfdI1UYVN6c9DN2YtBkvkCsIPuBEt+jUtUd5nRX356l+oY1o/jjhuyV69ro4Z3h4
 rwZGKVoO2OrOl26iqrwFTuqPgFwCQD742dC2HgS1MnkbLRA3PA5CDK9B4J7PMfEbXirm
 8w6EMYbbn9OCC+D+YBZAZcmlCjvJP5sC+qZxWA2rQDKUzM7ZL6jdw44hMI9+nVNEgHF+
 j3TQ==
X-Gm-Message-State: ACrzQf2+WfP45WBbWW/hLqAl7fkFZxDu4gdYQz6EUd0EPO4kf/5t5n3K
 MOxTkwGM1gz5m7BbBYblyFzH/d8Bmcd6mbx+V21MIEHlsv602m8NWeDEOohc5YkzyPMdXnRMLuw
 5eLXAGxkgeHXgNL0=
X-Received: by 2002:a05:620a:178b:b0:6ee:e0a3:1f27 with SMTP id
 ay11-20020a05620a178b00b006eee0a31f27mr13228091qkb.267.1666349033810; 
 Fri, 21 Oct 2022 03:43:53 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM611EjOL522oIGakwDiiXV4Y0dKdy9c7EPJKbB8GjbY87oLC9A+yV2u/dKW1Qlv9YtxTj59wQ==
X-Received: by 2002:a05:620a:178b:b0:6ee:e0a3:1f27 with SMTP id
 ay11-20020a05620a178b00b006eee0a31f27mr13228065qkb.267.1666349033545; 
 Fri, 21 Oct 2022 03:43:53 -0700 (PDT)
Received: from [192.168.100.30] ([82.142.8.70])
 by smtp.gmail.com with ESMTPSA id
 bz12-20020a05622a1e8c00b0039a1146e0e1sm7904582qtb.33.2022.10.21.03.43.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Oct 2022 03:43:52 -0700 (PDT)
Message-ID: <881f1b6d-ac9f-a144-0e13-622981f02130@redhat.com>
Date: Fri, 21 Oct 2022 12:43:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v14 15/17] net: stream: move to QIO to enable additional
 parameters
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
 xen-devel@lists.xenproject.org, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>, Anthony Perard <anthony.perard@citrix.com>,
 Stefan Weil <sw@weilnetz.de>, David Gibson <david@gibson.dropbear.id.au>,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Eric Blake <eblake@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>, Greg Kurz <groug@kaod.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20221021090922.170074-1-lvivier@redhat.com>
 <20221021090922.170074-16-lvivier@redhat.com>
 <1f769d00-cf50-abaf-f078-f301959156b9@linaro.org>
 <87tu3x1n2m.fsf@pond.sub.org>
From: Laurent Vivier <lvivier@redhat.com>
In-Reply-To: <87tu3x1n2m.fsf@pond.sub.org>
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

On 10/21/22 12:35, Markus Armbruster wrote:
> Philippe Mathieu-Daudé <philmd@linaro.org> writes:
> 
>> On 21/10/22 11:09, Laurent Vivier wrote:
>>> Use QIOChannel, QIOChannelSocket and QIONetListener.
>>> This allows net/stream to use all the available parameters provided by
>>> SocketAddress.
>>> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
>>> Acked-by: Michael S. Tsirkin <mst@redhat.com>
>>> ---
>>>    net/stream.c    | 492 +++++++++++++++++-------------------------------
>>>    qemu-options.hx |   4 +-
>>>    2 files changed, 178 insertions(+), 318 deletions(-)
>>
>>> -static void net_stream_accept(void *opaque)
>>> +static void net_stream_server_listening(QIOTask *task, gpointer opaque)
>>>    {
>>>        NetStreamState *s = opaque;
>>> -    struct sockaddr_storage saddr;
>>> -    socklen_t len;
>>> -    int fd;
>>> -
>>> -    for (;;) {
>>> -        len = sizeof(saddr);
>>> -        fd = qemu_accept(s->listen_fd, (struct sockaddr *)&saddr, &len);
>>> -        if (fd < 0 && errno != EINTR) {
>>> -            return;
>>> -        } else if (fd >= 0) {
>>> -            qemu_set_fd_handler(s->listen_fd, NULL, NULL, NULL);
>>> -            break;
>>> -        }
>>> -    }
>>> +    QIOChannelSocket *listen_sioc = QIO_CHANNEL_SOCKET(s->listen_ioc);
>>> +    SocketAddress *addr;
>>> +    int ret;
>>>    -    s->fd = fd;
>>> -    s->nc.link_down = false;
>>> -    net_stream_connect(s);
>>> -    switch (saddr.ss_family) {
>>> -    case AF_INET: {
>>> -        struct sockaddr_in *saddr_in = (struct sockaddr_in *)&saddr;
>>> -
>>> -        qemu_set_info_str(&s->nc, "connection from %s:%d",
>>> -                          inet_ntoa(saddr_in->sin_addr),
>>> -                          ntohs(saddr_in->sin_port));
>>> -        break;
>>> +    if (listen_sioc->fd < 0) {
>>> +        qemu_set_info_str(&s->nc, "connection error");
>>> +        return;
>>>        }
>>> -    case AF_UNIX: {
>>> -        struct sockaddr_un saddr_un;
>>>    -        len = sizeof(saddr_un);
>>> -        getsockname(s->listen_fd, (struct sockaddr *)&saddr_un, &len);
>>> -        qemu_set_info_str(&s->nc, "connect from %s", saddr_un.sun_path);
>>> -        break;
>>> -    }
>>> -    default:
>>> -        g_assert_not_reached();
>>> +    addr = qio_channel_socket_get_local_address(listen_sioc, NULL);
>>> +    g_assert(addr != NULL);
>>
>> Missing propagating Error* (observed in v12).
> 
> *If* this is really a programming error: what about &error_abort?

assert() informs the compiler that following code will not use addr with a NULL value, I 
don't think &error_abort does that. This could avoid an error report in code static analyzer.

Thanks,
Laurent


