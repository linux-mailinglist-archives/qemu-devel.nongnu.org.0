Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F02AB606221
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 15:47:21 +0200 (CEST)
Received: from localhost ([::1]:52452 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olVsx-00078H-RD
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 09:47:00 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olVjF-0004ob-IU
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 09:37:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1olTbL-0001Wy-IO
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 07:20:41 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:33552)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1olTbJ-00031I-Qz
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 07:20:39 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 n16-20020a05600c4f9000b003c17bf8ddecso2323075wmq.0
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 04:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9AKfW1OUl6IVvhKHx6nJlHKq3zd67ntMW1dov1zxRho=;
 b=FMotvRwwEiFz1GxmIERePaKPM5upqrmqPcTullTf9hS3/aU7g5iTHQHJIL+w65Y86g
 j21yM8XI2m7gv3PjNalhgUmf9CB6HpkOZa+odEipHSB/5A7LR7yJ2SzmWasAXpQMqM3X
 P5CIVcRmoOTJscvptAjsXltXMnMihamN0mBL/y9NcBKh6GOIyZpFzgIhA5/zvPbjRpfS
 hc24RWM7MPJzROqC1WqVpZE7amibHvx294sFNuhJ2b7lLAnD4pZosvw2LVUsybAdR96u
 jYXiSX7FRizBydH9ocMQQenJCuH5FidZAFMZrZF6tg1EtqCyvmnLkU+eMiHAWUO867cs
 BwMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9AKfW1OUl6IVvhKHx6nJlHKq3zd67ntMW1dov1zxRho=;
 b=jb5dpGPED51xs8pINtDULRgwteBrscGwQepFT2S/B4E3K3Aplq1RBRW+jCC6iCOBno
 QXdYUyR/eBGzloKIo7V9rP28n0UW1Bdejbubz0LdP4q5M5v5BH/IJjKaVjs/PrYUtSu9
 hJX9D8A+eUvJlGTFNcyW/wekdsvO3GG87W7HoltSv3+scV0BaiE++SVJKv85CMv+e0ga
 /v+hokp+HlwVVQSzOZgzhK+3QUO3imoPwgdWfuWChXmr68Jpbt4IA9PmLT+xPAG9oaVR
 bWDnuKEK8vL5ArXQezy4JN4hHAF09yEPVAEmFIuOJ4PxRNdqX6bbfno1DZEOF5qqJzWI
 tc6w==
X-Gm-Message-State: ACrzQf3YoQ+1yWYjWTi0yiU2Y4/alc2QdWdKM1ekXiBhRvzKvJtyeSkI
 dtjiu8wAKaKkQFjCisL1oCsF/A==
X-Google-Smtp-Source: AMsMyM4QDDxP5/5Q9nlSXHAonkPSNRZL2wP8LdhUoluTBCjES4Xd2hEjKZvm/R4uC3EI9C5UphPzrA==
X-Received: by 2002:a05:600c:1906:b0:3c6:db8a:2178 with SMTP id
 j6-20020a05600c190600b003c6db8a2178mr27121822wmq.7.1666264836321; 
 Thu, 20 Oct 2022 04:20:36 -0700 (PDT)
Received: from [10.50.0.10]
 (ec2-54-194-108-71.eu-west-1.compute.amazonaws.com. [54.194.108.71])
 by smtp.gmail.com with ESMTPSA id
 t67-20020a1c4646000000b003b505d26776sm2545599wma.5.2022.10.20.04.20.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Oct 2022 04:20:34 -0700 (PDT)
Message-ID: <50b6debc-97e1-b827-098b-aa34f772e685@linaro.org>
Date: Thu, 20 Oct 2022 13:20:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: [PATCH v12 17/17] net: stream: add QAPI events to report
 connection state
Content-Language: en-US
To: Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org
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
 <20221020091624.48368-18-lvivier@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221020091624.48368-18-lvivier@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
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

On 20/10/22 11:16, Laurent Vivier wrote:
> The netdev reports NETDEV_STREAM_CONNECTED event when the backend
> is connected, and NETDEV_STREAM_DISCONNECTED when it is disconnected.
> 
> The NETDEV_STREAM_CONNECTED event includes the URI of the destination
> address.
> 
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> Acked-by: Michael S. Tsirkin <mst@redhat.com>
> ---
>   net/stream.c  | 11 +++++++++--
>   qapi/net.json | 46 ++++++++++++++++++++++++++++++++++++++++++++++
>   2 files changed, 55 insertions(+), 2 deletions(-)
> 
> diff --git a/net/stream.c b/net/stream.c
> index 95d6b910407d..8ad757cefbdf 100644
> --- a/net/stream.c
> +++ b/net/stream.c
> @@ -38,6 +38,7 @@
>   #include "io/channel.h"
>   #include "io/channel-socket.h"
>   #include "io/net-listener.h"
> +#include "qapi/qapi-events-net.h"
>   
>   typedef struct NetStreamState {
>       NetClientState nc;
> @@ -168,6 +169,8 @@ static gboolean net_stream_send(QIOChannel *ioc,
>           s->nc.link_down = true;
>           qemu_set_info_str(&s->nc, "");
>   
> +        qapi_event_send_netdev_stream_disconnected(s->nc.name);
> +
>           return G_SOURCE_REMOVE;
>       }
>       buf = buf1;
> @@ -243,9 +246,10 @@ static void net_stream_listen(QIONetListener *listener,
>       g_assert(addr != NULL);
>       uri = socket_uri(addr);
>       qemu_set_info_str(&s->nc, uri);
> -    g_free(uri);
>       qapi_free_SocketAddress(addr);
>   
> +    qapi_event_send_netdev_stream_connected(s->nc.name, uri);
> +    g_free(uri);

Maybe worth converting to g_autofree.

>   }
>   
>   static void net_stream_server_listening(QIOTask *task, gpointer opaque)
> @@ -317,12 +321,12 @@ static void net_stream_client_connected(QIOTask *task, gpointer opaque)
>       g_assert(addr != NULL);
>       uri = socket_uri(addr);
>       qemu_set_info_str(&s->nc, uri);
> -    g_free(uri);
>   
>       ret = qemu_socket_try_set_nonblock(sioc->fd);
>       if (addr->type == SOCKET_ADDRESS_TYPE_FD && ret < 0) {
>           qemu_set_info_str(&s->nc, "can't use file descriptor %s (errno %d)",
>                             addr->u.fd.str, -ret);
> +        g_free(uri);
>           qapi_free_SocketAddress(addr);
>           goto error;
>       }
> @@ -338,6 +342,9 @@ static void net_stream_client_connected(QIOTask *task, gpointer opaque)
>                                               s, NULL);
>       s->nc.link_down = false;
>   
> +    qapi_event_send_netdev_stream_connected(s->nc.name, uri);
> +    g_free(uri);
> +
>       return;
>   error:
>       object_unref(OBJECT(s->ioc));
> diff --git a/qapi/net.json b/qapi/net.json
> index 39388b1b6c41..569ab7fd37e3 100644
> --- a/qapi/net.json
> +++ b/qapi/net.json
> @@ -895,3 +895,49 @@
>   ##
>   { 'event': 'FAILOVER_NEGOTIATED',
>     'data': {'device-id': 'str'} }
> +
> +##
> +# @NETDEV_STREAM_CONNECTED:
> +#
> +# Emitted when the netdev stream backend is connected
> +#
> +# @netdev-id: QEMU netdev id that is connected
> +# @uri: The Uniform Resource Identifier identifying the destination address
> +#
> +# Since: 7.2
> +#
> +# Example:
> +#
> +# <- { 'event': 'NETDEV_STREAM_CONNECTED',
> +#      'data': {'uri': 'tcp:::1:1234', 'netdev-id': 'netdev0'},

Unrelated, but interesting. The URI should be 'tcp:[::1]:1234', we miss
this IPv6 case when parsing SOCKET_ADDRESS_TYPE_INET in socket_uri().

> +#      'timestamp': {'seconds': 1663330564, 'microseconds': 804317} }
> +#
> +# or
> +#
> +# <- { 'event': 'NETDEV_STREAM_CONNECTED',
> +#      'data': {'uri': ''unix:/tmp/qemu0', 'netdev-id': 'netdev0'},
> +#      'timestamp': {'seconds': 1663330564, 'microseconds': 804317} }
> +#
> +##
> +{ 'event': 'NETDEV_STREAM_CONNECTED',
> +  'data': { 'netdev-id': 'str',
> +            'uri': 'str' } }
> +
> +##
> +# @NETDEV_STREAM_DISCONNECTED:
> +#
> +# Emitted when the netdev stream backend is disconnected
> +#
> +# @netdev-id: QEMU netdev id that is disconnected
> +#
> +# Since: 7.2
> +#
> +# Example:
> +#
> +# <- { 'event': 'NETDEV_STREAM_DISCONNECTED',
> +#      'data': {'netdev-id': 'netdev0'},
> +#      'timestamp': {'seconds': 1663330937, 'microseconds': 526695} }
> +#
> +##
> +{ 'event': 'NETDEV_STREAM_DISCONNECTED',
> +  'data': { 'netdev-id': 'str' } }


