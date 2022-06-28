Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C346A55BDFA
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 06:17:06 +0200 (CEST)
Received: from localhost ([::1]:46048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o62ev-0008IU-Ea
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 00:17:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1o62dr-0007Zb-Ri
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:15:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57813)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1o62do-00033o-8l
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:15:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656389754;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LeqbfFO/5dooSYhB9AjszRvmhq2igkbReJZJQeDWbDw=;
 b=KaP/avh2sdP48WJxO119n+ooyIz0bqLaZiUW8WlAOuXZwFaAAbIyVgckLgEATnZHX9sq7R
 eAN7T4i6NMDaEUF4p4ZCL2JK0ljOzDMB7/AMoKI2OUm+QPxpWiyJ3uC5dMPJoLeRQzdVnm
 9+WRXAerO4ilC/2G0XBvGywhlPFnP2k=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-159-3sr_wjPaNeC5h-ZPNui0og-1; Tue, 28 Jun 2022 00:15:52 -0400
X-MC-Unique: 3sr_wjPaNeC5h-ZPNui0og-1
Received: by mail-pf1-f198.google.com with SMTP id
 n21-20020a056a000d5500b005251893308cso4696410pfv.6
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 21:15:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=LeqbfFO/5dooSYhB9AjszRvmhq2igkbReJZJQeDWbDw=;
 b=G3nzcQixpT1FSXHLd4Ix/LhrO/cmyx1D7nN1FEBf68qP92Gl3+OnqgqqOShaOLBA5n
 oQrp+xeXnDEcPizfv3u9w9v0KfdGx42DWZGaU6GMrY55TsnNn5PNj6UjnBVrCCxYoXx7
 mYSkLenLPKEl8YCO+WDxjR6+i4AE4MdXM5KjS36cWsjZ/AF9I+lH9XSyNU4f1Ya8TJUl
 ICyoH6ueOJIlwABQSX90EYmhGXnUDLgm189cvrQYmrlo+6bNPJ9+EsgRuNwPukXsZSwB
 3aAGUCZD8j7VhpkuFGg8E6SZCUG3JeHSEMt/oi0NOKodAePgXcJHLNQz4+7Dm918FaHN
 vXug==
X-Gm-Message-State: AJIora8v7aTzADAPQoBeTh68qO7CwHjYQPey5cqz4gcocWtnrIFa+OZz
 yp6VuMOMCIcQ2IX9iUezcpP8QiqXUdnGti9R5nFd1vY5xqqnrFsVL7pTUzDFPIMXS49RFQFiSET
 PHXwtjzpqwcoj6yU=
X-Received: by 2002:a05:6a00:16c7:b0:520:6ede:2539 with SMTP id
 l7-20020a056a0016c700b005206ede2539mr2608144pfc.46.1656389751540; 
 Mon, 27 Jun 2022 21:15:51 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vE/SAajPsXY0Q7+k5wBoi0H0YN6mxW5vCxY8/chCK80bKq9uUxiq7rUyJd5yWA54+Jy+sxcw==
X-Received: by 2002:a05:6a00:16c7:b0:520:6ede:2539 with SMTP id
 l7-20020a056a0016c700b005206ede2539mr2608127pfc.46.1656389751252; 
 Mon, 27 Jun 2022 21:15:51 -0700 (PDT)
Received: from [10.72.14.30] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 m20-20020aa78a14000000b00518950bfc82sm8435276pfa.10.2022.06.27.21.15.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jun 2022 21:15:50 -0700 (PDT)
Message-ID: <a607ebc5-e518-7b0d-722c-1bebcb18bb41@redhat.com>
Date: Tue, 28 Jun 2022 12:15:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [PATCH 2/2] tap: initialize TAPState->enabled according to the
 actual state of queue
Content-Language: en-US
To: Andrey Ryabinin <arbn@yandex-team.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, yc-core@yandex-team.ru
References: <20220614111843.24960-1-arbn@yandex-team.com>
 <20220614112144.25324-1-arbn@yandex-team.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <20220614112144.25324-1-arbn@yandex-team.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2022/6/14 19:21, Andrey Ryabinin 写道:
> Currently TAPState->enabled initialized as true. If fd was passed to qemu
> in a disabled state it will cause an assert at the attempt to detach queue
> in virtio_net_set_queues():
>
> virtio_net_set_queues() :
>              r = peer_detach() -> tap_disable():
>                                      if (s->enabled == 0) {
>                                         return 0;
> 				    } else {
> 				       //Will return an error.
>                                         ret = tap_fd_disable(s->fd);
>                                         ...
> 				       return ret;
>              assert(!r);
>
> Initialize ->enabled according to the actual state of fd to fix this.
>
> Signed-off-by: Andrey Ryabinin <arbn@yandex-team.com>
> ---
>   net/tap-bsd.c     |  5 +++++
>   net/tap-linux.c   | 12 ++++++++++++
>   net/tap-solaris.c |  5 +++++
>   net/tap.c         |  2 +-
>   net/tap_int.h     |  1 +
>   5 files changed, 24 insertions(+), 1 deletion(-)
>
> diff --git a/net/tap-bsd.c b/net/tap-bsd.c
> index 005ce05c6e0..8c21f058c8c 100644
> --- a/net/tap-bsd.c
> +++ b/net/tap-bsd.c
> @@ -217,6 +217,11 @@ int tap_probe_vnet_hdr_len(int fd, int len)
>       return 0;
>   }
>   
> +bool tap_probe_enabled(int fd)
> +{
> +    return true;
> +}
> +
>   void tap_fd_set_vnet_hdr_len(int fd, int len)
>   {
>   }
> diff --git a/net/tap-linux.c b/net/tap-linux.c
> index 304ff45071d..6078ba03af6 100644
> --- a/net/tap-linux.c
> +++ b/net/tap-linux.c
> @@ -193,6 +193,18 @@ int tap_probe_vnet_hdr_len(int fd, int len)
>       return 1;
>   }
>   
> +bool tap_probe_enabled(int fd)
> +{
> +    struct ifreq ifr;
> +
> +    if (ioctl(fd, TUNGETIFF, &ifr) != 0) {
> +        error_report("TUNGETIFF ioctl() failed: %s",
> +                     strerror(errno));
> +        return false;
> +    }
> +    return !(ifr.ifr_flags & IFF_DETACH_QUEUE);


Is it better to check IFF_MULT_QUEUE before this to unbreak the old host?

Thanks


> +}
> +
>   void tap_fd_set_vnet_hdr_len(int fd, int len)
>   {
>       if (ioctl(fd, TUNSETVNETHDRSZ, &len) == -1) {
> diff --git a/net/tap-solaris.c b/net/tap-solaris.c
> index a44f8805c23..ccaa3334882 100644
> --- a/net/tap-solaris.c
> +++ b/net/tap-solaris.c
> @@ -221,6 +221,11 @@ int tap_probe_vnet_hdr_len(int fd, int len)
>       return 0;
>   }
>   
> +bool tap_probe_enabled(int fd)
> +{
> +    return true;
> +}
> +
>   void tap_fd_set_vnet_hdr_len(int fd, int len)
>   {
>   }
> diff --git a/net/tap.c b/net/tap.c
> index b3ddfd4a74b..799f8ec7c76 100644
> --- a/net/tap.c
> +++ b/net/tap.c
> @@ -399,7 +399,7 @@ static TAPState *net_tap_fd_init(NetClientState *peer,
>       s->host_vnet_hdr_len = vnet_hdr ? sizeof(struct virtio_net_hdr) : 0;
>       s->using_vnet_hdr = false;
>       s->has_ufo = tap_probe_has_ufo(s->fd);
> -    s->enabled = true;
> +    s->enabled = tap_probe_enabled(s->fd);
>       tap_set_offload(&s->nc, 0, 0, 0, 0, 0);
>       /*
>        * Make sure host header length is set correctly in tap:
> diff --git a/net/tap_int.h b/net/tap_int.h
> index 547f8a5a28f..b8fc3dfbfa7 100644
> --- a/net/tap_int.h
> +++ b/net/tap_int.h
> @@ -37,6 +37,7 @@ void tap_set_sndbuf(int fd, const NetdevTapOptions *tap, Error **errp);
>   int tap_probe_vnet_hdr(int fd, Error **errp);
>   int tap_probe_vnet_hdr_len(int fd, int len);
>   int tap_probe_has_ufo(int fd);
> +bool tap_probe_enabled(int fd);
>   void tap_fd_set_offload(int fd, int csum, int tso4, int tso6, int ecn, int ufo);
>   void tap_fd_set_vnet_hdr_len(int fd, int len);
>   int tap_fd_set_vnet_le(int fd, int vnet_is_le);


