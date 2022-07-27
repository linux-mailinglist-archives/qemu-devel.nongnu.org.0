Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F4825822A0
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 11:02:42 +0200 (CEST)
Received: from localhost ([::1]:50530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGcwD-0007Xg-8B
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 05:02:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yvugenfi@redhat.com>)
 id 1oGcmF-0007QO-HV
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 04:52:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49488)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yvugenfi@redhat.com>)
 id 1oGcmB-0005Ss-PJ
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 04:52:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658911938;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PvZuKCwNL4f7LCBloHwWbxnjBNQE4TyRwpoch8SYEq8=;
 b=Yb7yFKeS7iAh+Bo8kMHK1RIr8vL9g6BgpT5WBd7Qg8cp8f31vApE9e3AhaQv6X6HNrefF0
 EWFAoYhzRJHb16r9C7h4cnmcDQgVCa2WHtl3OIeupJozo19AP+klHX58sPIFkYHjg9WDXw
 tC3N1OI5pHUG9J7pW6W8Z3qhk5UDymo=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-493-Zioz8ZloO2efBycoxjcvHQ-1; Wed, 27 Jul 2022 04:51:11 -0400
X-MC-Unique: Zioz8ZloO2efBycoxjcvHQ-1
Received: by mail-lj1-f198.google.com with SMTP id
 g25-20020a2eb0d9000000b0025e20d6afffso305094ljl.3
 for <qemu-devel@nongnu.org>; Wed, 27 Jul 2022 01:51:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=PvZuKCwNL4f7LCBloHwWbxnjBNQE4TyRwpoch8SYEq8=;
 b=x/yIYBXX+In1JrwtjQw6f5gL2h6CDAfRlBMMyBs+4UZdEOtcXyy2NAg+kZVYIgbvVP
 11kSBP9DPm/1e6nVodHW1ukGxmWShjFPkzVrnQyEeK1QVRdSPCrOMqVv0ptZINSHkG6w
 1dJRxeDCSTg7WNCFMm0tMcQwQpolkXRB7vPveQRg28xOLkhNi6xxYZkqD9tRK3scPZLr
 8CKwkz9Wd63R9U8xHQiJu3/AIu6Lp05acdDEwsHY2DwxG5i++uw0i7ukE8RnkW+6Mua8
 DvPMsOPK1LwhQfrt/kfU71gaVJ5ZAgq1efiGO9gsPs+16tcN7ci6vG6fAMZH6FTb7zLY
 7/XQ==
X-Gm-Message-State: AJIora9BMo4d4Uta28oFQ7vY8RGLoq1xCWB5Pbyic5g651h/NCNaaqo8
 s3l6YAXYxzCrBuNz0i4xoYNtZ77Xr+RX0HRFo4RTZbgMW7Q82EIf7X9kkiPpvN18mFaUVwZeVkC
 1D62zZV4JcHSk5zhrTs0XgSp2ZNxZ1E4=
X-Received: by 2002:a05:651c:102d:b0:25d:fd30:bf34 with SMTP id
 w13-20020a05651c102d00b0025dfd30bf34mr6319766ljm.59.1658911869729; 
 Wed, 27 Jul 2022 01:51:09 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1saJ0z10EYAbU+7D8Wx7o2wwAf9arVFsbg+1oTVURxGxOYXO7uZpIFCCxZkOwQDOdwtW7ixM7ocJI7EqwpuUBc=
X-Received: by 2002:a05:651c:102d:b0:25d:fd30:bf34 with SMTP id
 w13-20020a05651c102d00b0025dfd30bf34mr6319755ljm.59.1658911869271; Wed, 27
 Jul 2022 01:51:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220727073542.811420-1-bmeng.cn@gmail.com>
 <20220727073542.811420-5-bmeng.cn@gmail.com>
In-Reply-To: <20220727073542.811420-5-bmeng.cn@gmail.com>
From: Yan Vugenfirer <yvugenfi@redhat.com>
Date: Wed, 27 Jul 2022 11:50:58 +0300
Message-ID: <CAGoVJZyoG3y831NPTxi1eDozKbr9Z5DVOaGpHthoWkTsbf-rsA@mail.gmail.com>
Subject: Re: [PATCH 4/5] util/qemu-sockets: Enable unix socket support on
 Windows
To: Bin Meng <bmeng.cn@gmail.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Bin Meng <bin.meng@windriver.com>,
 Xuzhou Cheng <xuzhou.cheng@windriver.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=yvugenfi@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Wed, Jul 27, 2022 at 10:46 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> Support for the unix socket has existed both in BSD and Linux for the
> longest time, but not on Windows. Since Windows 10 build 17063 [1],
> the native support for the unix socket has came to Windows. Starting
> this build, two Win32 processes can use the AF_UNIX address family
> over Winsock API to communicate with each other.
>
> Introduce a new build time config option CONFIG_AF_UNIX when the build
> host has such a capability, and a run-time check afunix_available() for
> Windows host in the QEMU sockets util codes.
>
> [1] https://devblogs.microsoft.com/commandline/af_unix-comes-to-windows/
>
> Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
>
>  meson.build         |  6 ++++++
>  util/qemu-sockets.c | 48 ++++++++++++++++++++++++++++++++++++++-------
>  2 files changed, 47 insertions(+), 7 deletions(-)
>
> diff --git a/meson.build b/meson.build
> index 75aaca8462..73e5de5957 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -2327,6 +2327,12 @@ have_afalg = get_option('crypto_afalg') \
>    '''), error_message: 'AF_ALG requested but could not be detected').allowed()
>  config_host_data.set('CONFIG_AF_ALG', have_afalg)
>
> +if targetos != 'windows'
> +  config_host_data.set('CONFIG_AF_UNIX', true)
> +else
> +  config_host_data.set('CONFIG_AF_UNIX', cc.has_header('afunix.h'))
> +endif
> +
>  config_host_data.set('CONFIG_AF_VSOCK', cc.has_header_symbol(
>    'linux/vm_sockets.h', 'AF_VSOCK',
>    prefix: '#include <sys/socket.h>',
> diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
> index 0e2298278f..d85f3ea3ee 100644
> --- a/util/qemu-sockets.c
> +++ b/util/qemu-sockets.c
> @@ -17,6 +17,15 @@
>   */
>  #include "qemu/osdep.h"
>
> +#if defined(CONFIG_WIN32) && defined(CONFIG_AF_UNIX)
> +# include <afunix.h>
> +/*
> + * AF_UNIX support is available since Windows 10 build 17063
> + * See https://devblogs.microsoft.com/commandline/af_unix-comes-to-windows/
> + */
> +# define WIN_BUILD_AF_UNIX 17063
> +#endif /* CONFIG_WIN32 && CONFIG_AF_UNIX */
> +
>  #ifdef CONFIG_AF_VSOCK
>  #include <linux/vm_sockets.h>
>  #endif /* CONFIG_AF_VSOCK */
> @@ -880,7 +889,7 @@ static int vsock_parse(VsockSocketAddress *addr, const char *str,
>  }
>  #endif /* CONFIG_AF_VSOCK */
>
> -#ifndef _WIN32
> +#ifdef CONFIG_AF_UNIX
>
>  static bool saddr_is_abstract(UnixSocketAddress *saddr)
>  {
> @@ -900,6 +909,17 @@ static bool saddr_is_tight(UnixSocketAddress *saddr)
>  #endif
>  }
>
> +#ifdef CONFIG_WIN32
> +static bool afunix_available(void)
> +{
> +    OSVERSIONINFOEXW os_version = { 0 };
> +
> +    os_get_win_version(&os_version);
> +
> +    return os_version.dwBuildNumber >= WIN_BUILD_AF_UNIX;
It can be that CONFIG_WIN32 is defined,but CONFIG_AF_UNIX is not. In
this case WIN_BUILD_AF_UNIX will be undefined.
Also, WIN_BUILD_AF_UNIX is just a build constant, why not define it
always under CONFIG_WIN32?

Best regards,
Yan.


> +}
> +#endif
> +
>  static int unix_listen_saddr(UnixSocketAddress *saddr,
>                               int num,
>                               Error **errp)
> @@ -912,6 +932,13 @@ static int unix_listen_saddr(UnixSocketAddress *saddr,
>      size_t pathlen;
>      size_t addrlen;
>
> +#ifdef CONFIG_WIN32
> +    if (!afunix_available()) {
> +        error_setg(errp, "AF_UNIX is not available on your Windows");
> +        return -1;
> +    }
> +#endif
> +
>      sock = qemu_socket(PF_UNIX, SOCK_STREAM, 0);
>      if (sock < 0) {
>          error_setg_errno(errp, errno, "Failed to create Unix socket");
> @@ -1004,6 +1031,13 @@ static int unix_connect_saddr(UnixSocketAddress *saddr, Error **errp)
>          return -1;
>      }
>
> +#ifdef CONFIG_WIN32
> +    if (!afunix_available()) {
> +        error_setg(errp, "AF_UNIX is not available on your Windows");
> +        return -1;
> +    }
> +#endif
> +
>      sock = qemu_socket(PF_UNIX, SOCK_STREAM, 0);
>      if (sock < 0) {
>          error_setg_errno(errp, errno, "Failed to create socket");
> @@ -1060,14 +1094,14 @@ static int unix_listen_saddr(UnixSocketAddress *saddr,
>                               int num,
>                               Error **errp)
>  {
> -    error_setg(errp, "unix sockets are not available on windows");
> +    error_setg(errp, "unix sockets are not available on your host");
>      errno = ENOTSUP;
>      return -1;
>  }
>
>  static int unix_connect_saddr(UnixSocketAddress *saddr, Error **errp)
>  {
> -    error_setg(errp, "unix sockets are not available on windows");
> +    error_setg(errp, "unix sockets are not available on your host");
>      errno = ENOTSUP;
>      return -1;
>  }
> @@ -1335,7 +1369,7 @@ socket_sockaddr_to_address_inet(struct sockaddr_storage *sa,
>  }
>
>
> -#ifndef WIN32
> +#ifdef CONFIG_AF_UNIX
>  static SocketAddress *
>  socket_sockaddr_to_address_unix(struct sockaddr_storage *sa,
>                                  socklen_t salen,
> @@ -1362,7 +1396,7 @@ socket_sockaddr_to_address_unix(struct sockaddr_storage *sa,
>      addr->u.q_unix.path = g_strndup(su->sun_path, salen);
>      return addr;
>  }
> -#endif /* WIN32 */
> +#endif /* CONFIG_AF_UNIX */
>
>  #ifdef CONFIG_AF_VSOCK
>  static SocketAddress *
> @@ -1394,10 +1428,10 @@ socket_sockaddr_to_address(struct sockaddr_storage *sa,
>      case AF_INET6:
>          return socket_sockaddr_to_address_inet(sa, salen, errp);
>
> -#ifndef WIN32
> +#ifdef CONFIG_AF_UNIX
>      case AF_UNIX:
>          return socket_sockaddr_to_address_unix(sa, salen, errp);
> -#endif /* WIN32 */
> +#endif
>
>  #ifdef CONFIG_AF_VSOCK
>      case AF_VSOCK:
> --
> 2.34.1
>
>


