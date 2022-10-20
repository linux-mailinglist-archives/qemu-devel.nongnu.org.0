Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38707606076
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 14:42:17 +0200 (CEST)
Received: from localhost ([::1]:41300 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olUsI-0000mE-Un
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 08:42:15 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olUkz-0002FS-N4
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 08:34:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1olTYj-00057m-Bi
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 07:18:02 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:40533)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1olTYg-00017U-UZ
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 07:17:57 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 v130-20020a1cac88000000b003bcde03bd44so2048841wme.5
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 04:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=aji4vbaAsAZUvQBuxSvdAC7h4FHkKHnOC3DlhOWZEd0=;
 b=moo5qfDu/Ser6hNax3oFsOlv+Dpkmcdt1iwnOv9cljJVLF1IDg0B0DBVqK28e23eVn
 sabAfeMgV5d791gjcbb2ExVERO1ipRXCb2MvhDnDPFv9xy8kGiNy5cTYIWztDmzrj051
 6ImKulsnmgwr4JnCz3vJoI+YbEX7tA0sU3VI56Noq4n/Q679uoiR6SHTqapYGpJtW+3l
 DIx54ZuXspT0Mh6mpEdkdyjEwZZkNTDg7WJs64CgaiSfpnCXLOyQUbG3gW6iQYtsKqiZ
 d1YSwfwZcESrk5FeXn8vi3Bcv5Me7oDCtwNNfpzL6OtuaOtbXJAgvKkcf8L+zFSCGrMh
 WDNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aji4vbaAsAZUvQBuxSvdAC7h4FHkKHnOC3DlhOWZEd0=;
 b=1tOZPgsrwY8QFReNCPtwvYOMeBcDxh4Dm1QBVOX9jpUIIsID83Ksw2vfHbatwLruiW
 m453/LChUf3LGxzemwUzs2kSxIxAJF+mbDsdj4uTb5lfkvYgnPhSFXGzV9Fr98BJJgR3
 KpEFY7KnKIkf/R+r4JM9y29QfVr2B4l5SdpgCtmNtWPNN7njmIGVFiYmd5e/2In15RbA
 zs9idsc7vVaa21tg53VkSVsKWvHD03/rwXOHg6GVKTZuPp4W81CviGEQOJLL6cBjJtEU
 2F6iZa+Ncr+nVIbVnXbUU/PT2uGN/J3UBeF3+pylx2WsNGthEZkj15Zjawv4K6wy4am9
 3sPQ==
X-Gm-Message-State: ACrzQf18iWU5KGPVlYw7wr+bUjeOm4ha8gUL3V20A4kcQQfyDVLk14wD
 emXQsRjdCkZbHKgayx+dM4CAZA==
X-Google-Smtp-Source: AMsMyM5yjZYeFyMUFDsrwK9W8Au6afb9js5tIWn4HVsweRZFCfALDEiJuOLfDDfch4uFJFt/Dl8Q8Q==
X-Received: by 2002:a05:600c:34d4:b0:3c6:f695:b5f8 with SMTP id
 d20-20020a05600c34d400b003c6f695b5f8mr8951954wmq.203.1666264672833; 
 Thu, 20 Oct 2022 04:17:52 -0700 (PDT)
Received: from [10.50.0.10]
 (ec2-54-194-108-71.eu-west-1.compute.amazonaws.com. [54.194.108.71])
 by smtp.gmail.com with ESMTPSA id
 k33-20020a05600c1ca100b003c6cd82596esm2672545wms.43.2022.10.20.04.17.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Oct 2022 04:17:52 -0700 (PDT)
Message-ID: <15217f04-d689-7579-1501-320761b2f6e7@linaro.org>
Date: Thu, 20 Oct 2022 13:17:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: [PATCH v12 10/17] net: dgram: make dgram_dst generic
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
 Stefan Weil <sw@weilnetz.de>, Markus Armbruster <armbru@redhat.com>,
 Stefano Brivio <sbrivio@redhat.com>
References: <20221020091624.48368-1-lvivier@redhat.com>
 <20221020091624.48368-11-lvivier@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221020091624.48368-11-lvivier@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
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
> dgram_dst is a sockaddr_in structure. To be able to use it with
> unix socket, use a pointer to a generic sockaddr structure.
> 
> Rename it dest_addr, and store socket length in dest_len.
> 
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> Reviewed-by: Stefano Brivio <sbrivio@redhat.com>
> Acked-by: Michael S. Tsirkin <mst@redhat.com>
> ---
>   net/dgram.c | 82 ++++++++++++++++++++++++++++++++++-------------------
>   1 file changed, 53 insertions(+), 29 deletions(-)

>   static NetClientInfo net_dgram_socket_info = {
> @@ -260,7 +263,7 @@ static NetDgramState *net_dgram_fd_init(NetClientState *peer,
>                                           SocketAddress *mcast,
>                                           Error **errp)
>   {
> -    struct sockaddr_in saddr;
> +    struct sockaddr_in *saddr = NULL;

Preferrably g_autofree.

>       int newfd;
>       NetClientState *nc;
>       NetDgramState *s;
> @@ -275,31 +278,32 @@ static NetDgramState *net_dgram_fd_init(NetClientState *peer,
>       qapi_free_SocketAddress(sa);
>   
>       /*
> -     * fd passed: multicast: "learn" dgram_dst address from bound address and
> +     * fd passed: multicast: "learn" dest_addr address from bound address and
>        * save it. Because this may be "shared" socket from a "master" process,
>        * datagrams would be recv() by ONLY ONE process: we must "clone" this
>        * dgram socket --jjo
>        */
>   
>       if (is_fd && mcast != NULL) {
> -            if (convert_host_port(&saddr, mcast->u.inet.host,
> -                                  mcast->u.inet.port, errp) < 0) {
> +            saddr = g_new(struct sockaddr_in, 1);
> +
> +            if (convert_host_port(saddr, mcast->u.inet.host, mcast->u.inet.port,
> +                                  errp) < 0) {
>                   goto err;
>               }
>               /* must be bound */
> -            if (saddr.sin_addr.s_addr == 0) {
> +            if (saddr->sin_addr.s_addr == 0) {
>                   error_setg(errp, "can't setup multicast destination address");
>                   goto err;
>               }
>               /* clone dgram socket */
> -            newfd = net_dgram_mcast_create(&saddr, NULL, errp);
> +            newfd = net_dgram_mcast_create(saddr, NULL, errp);
>               if (newfd < 0) {
>                   goto err;
>               }
>               /* clone newfd to fd, close newfd */
>               dup2(newfd, fd);
>               close(newfd);
> -
>       }
>   
>       nc = qemu_new_net_client(&net_dgram_socket_info, peer, model, name);
> @@ -311,21 +315,20 @@ static NetDgramState *net_dgram_fd_init(NetClientState *peer,
>       net_dgram_read_poll(s, true);
>   
>       /* mcast: save bound address as dst */
> -    if (is_fd && mcast != NULL) {
> -        s->dgram_dst = saddr;
> +    if (saddr) {
> +        g_assert(s->dest_addr == NULL);
> +        s->dest_addr = (struct sockaddr *)saddr;
> +        s->dest_len = sizeof(*saddr);
>           qemu_set_info_str(nc, "fd=%d (cloned mcast=%s:%d)", fd,
> -                          inet_ntoa(saddr.sin_addr), ntohs(saddr.sin_port));
> +                          inet_ntoa(saddr->sin_addr), ntohs(saddr->sin_port));
>       } else {
> -        if (sa_type == SOCKET_ADDRESS_TYPE_UNIX) {
> -            s->dgram_dst.sin_family = AF_UNIX;
> -        }
> -
>           qemu_set_info_str(nc, "fd=%d %s", fd, SocketAddressType_str(sa_type));
>       }
>   
>       return s;
>   
>   err:
> +    g_free(saddr);
>       closesocket(fd);
>       return NULL;
>   }
> @@ -339,21 +342,24 @@ static int net_dgram_mcast_init(NetClientState *peer,
>   {
>       NetDgramState *s;
>       int fd, ret;
> -    struct sockaddr_in saddr;
> +    struct sockaddr_in *saddr;

Preferrably:

   g_autofree struct sockaddr_in *saddr = NULL.

>   
>       if (remote->type != SOCKET_ADDRESS_TYPE_INET) {
>           error_setg(errp, "multicast only support inet type");
>           return -1;
>       }
>   
> -    if (convert_host_port(&saddr, remote->u.inet.host, remote->u.inet.port,
> +    saddr = g_new(struct sockaddr_in, 1);
> +    if (convert_host_port(saddr, remote->u.inet.host, remote->u.inet.port,
>                             errp) < 0) {
> +        g_free(saddr);
>           return -1;
>       }
>   
>       if (!local) {
> -        fd = net_dgram_mcast_create(&saddr, NULL, errp);
> +        fd = net_dgram_mcast_create(saddr, NULL, errp);
>           if (fd < 0) {
> +            g_free(saddr);
>               return -1;
>           }
>       } else {
> @@ -362,13 +368,15 @@ static int net_dgram_mcast_init(NetClientState *peer,
>               struct in_addr localaddr;
>   
>               if (inet_aton(local->u.inet.host, &localaddr) == 0) {
> +                g_free(saddr);
>                   error_setg(errp, "localaddr '%s' is not a valid IPv4 address",
>                              local->u.inet.host);
>                   return -1;
>               }
>   
> -            fd = net_dgram_mcast_create(&saddr, &localaddr, errp);
> +            fd = net_dgram_mcast_create(saddr, &localaddr, errp);
>               if (fd < 0) {
> +                g_free(saddr);
>                   return -1;
>               }
>               break;
> @@ -376,16 +384,19 @@ static int net_dgram_mcast_init(NetClientState *peer,
>           case SOCKET_ADDRESS_TYPE_FD:
>               fd = monitor_fd_param(monitor_cur(), local->u.fd.str, errp);
>               if (fd == -1) {
> +                g_free(saddr);
>                   return -1;
>               }
>               ret = qemu_socket_try_set_nonblock(fd);
>               if (ret < 0) {
> +                g_free(saddr);
>                   error_setg_errno(errp, -ret, "%s: Can't use file descriptor %d",
>                                    name, fd);
>                   return -1;
>               }
>               break;
>           default:
> +            g_free(saddr);
>               error_setg(errp, "only support inet or fd type for local");
>               return -1;
>           }
> @@ -395,13 +406,17 @@ static int net_dgram_mcast_init(NetClientState *peer,
>                             local->type == SOCKET_ADDRESS_TYPE_FD,
>                             remote, errp);
>       if (!s) {
> +        g_free(saddr);
>           return -1;
>       }
>   
> -    s->dgram_dst = saddr;
> +    g_assert(s->dest_addr == NULL);
> +    s->dest_addr = (struct sockaddr *)saddr;
> +    s->dest_len = sizeof(*saddr);
> +
> +    qemu_set_info_str(&s->nc, "mcast=%s:%d", inet_ntoa(saddr->sin_addr),
> +                      ntohs(saddr->sin_port));
>   
> -    qemu_set_info_str(&s->nc, "mcast=%s:%d", inet_ntoa(saddr.sin_addr),
> -                      ntohs(saddr.sin_port));
>       return 0;
>   
>   }
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


