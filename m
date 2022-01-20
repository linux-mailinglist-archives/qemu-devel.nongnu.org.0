Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D244494844
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 08:29:57 +0100 (CET)
Received: from localhost ([::1]:54632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nARtL-0003CL-LS
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 02:29:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <roman@roolebo.dev>) id 1nARef-0000wK-Ik
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 02:14:49 -0500
Received: from [2a00:1450:4864:20::136] (port=36400
 helo=mail-lf1-x136.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <roman@roolebo.dev>) id 1nARed-0001WN-O4
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 02:14:45 -0500
Received: by mail-lf1-x136.google.com with SMTP id b14so18113391lff.3
 for <qemu-devel@nongnu.org>; Wed, 19 Jan 2022 23:14:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=roolebo.dev; s=mail;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=DXXzur62PlKEMT36kgGnWCDfU5ePhZ/vLpE6oeCBDCE=;
 b=giyT9a7/QT8Np1jkWFnNuNTQ80sA/ctKkG4zlrR6RV/xUf9wDK+OlKWBIG8DK2QPTO
 3+03k6acNYd+FLnN/Qs5amsCwC80f0hWw1od/DI9lLa+ZEsA7jaIhCRddQpQY4rfh64B
 byMa/N4yS918rcSpHsiyxxChVK1LX/d+gOucu/IDT0a18DJzITk9sHevs165MFWz/sFj
 /2Id6olP5ALzlyK9+Q4k7gOh6dMdiTD7ie1TpPyWF6j1zHtkQ0s2OEQ8PdLuEQOmCroY
 h3ZkMdqDV1Lp9mVbPNxtZlabYZ7Vdy8MCVcP/ro8Gpf8a9rswbpgIRDanpwK9IA2+zOr
 I7BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=DXXzur62PlKEMT36kgGnWCDfU5ePhZ/vLpE6oeCBDCE=;
 b=fhadqCcaW+/N63Y3rHTDBMGwMyzfXghys1Jx5is4ah9Kbo9lO0gVFC/GQgVuvzLxGb
 yamtN3kRMxuSd8UpkJAYx4KX/s4bI+ewaBozd3LYBekr3XHsMeOJtBb0Eutlb9fXINnO
 nQripKgHHWFAUOdveX3I/fMicMNxa9qy2ErrPKe6D/mDw/vyae+OdBiy1xf4qaAY121a
 p4HU5NXcffZZh8EeM0K1fjrbo33sm6d+GcPm3ZaMrrDWgYa2HEpxiWUFWR8t5k88on6e
 uP3iNufXoIWQpCALML3wsdzDkOeKzAkP49egyiD/Z6OTq6wxopSGHIQrMgV6BxhQ3xL/
 ze+Q==
X-Gm-Message-State: AOAM533zUwQFStFfWlqIqLXGuabOxgMlkU359OaiEAZsSTHp2ShILKKR
 4qxVISTlvT3MhvC8cNZT6uAmug==
X-Google-Smtp-Source: ABdhPJwqM1o7YBmg34qlZfNXuZLg/LHru3GNDh978azCZknGsO5fz9YKv7T30ndeeo85iHoHoaSlYA==
X-Received: by 2002:a05:6512:3341:: with SMTP id
 y1mr12382459lfd.90.1642662879131; 
 Wed, 19 Jan 2022 23:14:39 -0800 (PST)
Received: from localhost (ip-185-108-208-32.ip.asarta.ru. [185.108.208.32])
 by smtp.gmail.com with ESMTPSA id p6sm187199lja.106.2022.01.19.23.14.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jan 2022 23:14:38 -0800 (PST)
Date: Thu, 20 Jan 2022 10:14:35 +0300
From: Roman Bolshakov <roman@roolebo.dev>
To: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
Subject: Re: [PATCH v13 1/7] net/vmnet: add vmnet dependency and customizable
 option
Message-ID: <YekL2+aM/vpC7LKy@roolebo.dev>
References: <20220113172219.66372-1-yaroshchuk2000@gmail.com>
 <20220113172219.66372-2-yaroshchuk2000@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220113172219.66372-2-yaroshchuk2000@gmail.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::136
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::136;
 envelope-from=roman@roolebo.dev; helo=mail-lf1-x136.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org, kraxel@redhat.com, alex.bennee@linaro.org,
 jasowang@redhat.com, phillip.ennen@gmail.com, qemu-devel@nongnu.org,
 dirty@apple.com, armbru@redhat.com, r.bolshakov@yadro.com, agraf@csgraf.de,
 phillip@axleos.com, akihiko.odaki@gmail.com, hsp.cat7@gmail.com, hello@adns.io,
 qemu_oss@crudebyte.com, eblake@redhat.com, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jan 13, 2022 at 08:22:13PM +0300, Vladislav Yaroshchuk wrote:
> vmnet.framework dependency is added with 'vmnet' option
> to enable or disable it. Default value is 'auto'.
> 
> vmnet features to be used are available since macOS 11.0,

Hi Vladislav,

I'm not sure if the comment belongs here. Perhaps you mean that bridged
mode is available from 10.15:

        VMNET_BRIDGED_MODE API_AVAILABLE(macos(10.15))  = 1002

This means vmnet.framework is supported on all macbooks starting from 2012.

With this fixed,
Tested-by: Roman Bolshakov <roman@roolebo.dev>
Reviewed-by: Roman Bolshakov <roman@roolebo.dev>

The other two modes - shared and host are supported on earlier versions
of macOS (from 10.10). But port forwarding is only available from macOS
10.15.

Theoretically it should possible to support the framework on the earlier
models from 2010 or 2007 on Yosemite up to High Sierra with less
features using MacPorts but I don't think it'd be reasonable to ask
that.

Thanks,
Roman

> corresponding probe is created into meson.build.
> 
> Signed-off-by: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
> ---
>  meson.build                   | 16 +++++++++++++++-
>  meson_options.txt             |  2 ++
>  scripts/meson-buildoptions.sh |  3 +++
>  3 files changed, 20 insertions(+), 1 deletion(-)
> 
> diff --git a/meson.build b/meson.build
> index c1b1db1e28..285fb7bc41 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -496,6 +496,18 @@ if cocoa.found() and get_option('gtk').enabled()
>    error('Cocoa and GTK+ cannot be enabled at the same time')
>  endif
>  
> +vmnet = dependency('appleframeworks', modules: 'vmnet', required: get_option('vmnet'))
> +if vmnet.found() and not cc.has_header_symbol('vmnet/vmnet.h',
> +                                              'VMNET_BRIDGED_MODE',
> +                                              dependencies: vmnet)
> +  vmnet = not_found
> +  if get_option('vmnet').enabled()
> +    error('vmnet.framework API is outdated')
> +  else
> +    warning('vmnet.framework API is outdated, disabling')
> +  endif
> +endif
> +
>  seccomp = not_found
>  if not get_option('seccomp').auto() or have_system or have_tools
>    seccomp = dependency('libseccomp', version: '>=2.3.0',
> @@ -1492,6 +1504,7 @@ config_host_data.set('CONFIG_SECCOMP', seccomp.found())
>  config_host_data.set('CONFIG_SNAPPY', snappy.found())
>  config_host_data.set('CONFIG_USB_LIBUSB', libusb.found())
>  config_host_data.set('CONFIG_VDE', vde.found())
> +config_host_data.set('CONFIG_VMNET', vmnet.found())
>  config_host_data.set('CONFIG_VHOST_USER_BLK_SERVER', have_vhost_user_blk_server)
>  config_host_data.set('CONFIG_VNC', vnc.found())
>  config_host_data.set('CONFIG_VNC_JPEG', jpeg.found())
> @@ -3406,7 +3419,8 @@ summary(summary_info, bool_yn: true, section: 'Crypto')
>  # Libraries
>  summary_info = {}
>  if targetos == 'darwin'
> -  summary_info += {'Cocoa support':   cocoa}
> +  summary_info += {'Cocoa support':           cocoa}
> +  summary_info += {'vmnet.framework support': vmnet}
>  endif
>  summary_info += {'SDL support':       sdl}
>  summary_info += {'SDL image support': sdl_image}
> diff --git a/meson_options.txt b/meson_options.txt
> index 921967eddb..701e1381f9 100644
> --- a/meson_options.txt
> +++ b/meson_options.txt
> @@ -151,6 +151,8 @@ option('netmap', type : 'feature', value : 'auto',
>         description: 'netmap network backend support')
>  option('vde', type : 'feature', value : 'auto',
>         description: 'vde network backend support')
> +option('vmnet', type : 'feature', value : 'auto',
> +       description: 'vmnet.framework network backend support')
>  option('virglrenderer', type : 'feature', value : 'auto',
>         description: 'virgl rendering support')
>  option('vnc', type : 'feature', value : 'auto',
> diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
> index 50bd7bed4d..cdcece4b05 100644
> --- a/scripts/meson-buildoptions.sh
> +++ b/scripts/meson-buildoptions.sh
> @@ -84,6 +84,7 @@ meson_options_help() {
>    printf "%s\n" '  u2f             U2F emulation support'
>    printf "%s\n" '  usb-redir       libusbredir support'
>    printf "%s\n" '  vde             vde network backend support'
> +  printf "%s\n" '  vmnet           vmnet.framework network backend support'
>    printf "%s\n" '  vhost-user-blk-server'
>    printf "%s\n" '                  build vhost-user-blk server'
>    printf "%s\n" '  virglrenderer   virgl rendering support'
> @@ -248,6 +249,8 @@ _meson_option_parse() {
>      --disable-usb-redir) printf "%s" -Dusb_redir=disabled ;;
>      --enable-vde) printf "%s" -Dvde=enabled ;;
>      --disable-vde) printf "%s" -Dvde=disabled ;;
> +    --enable-vmnet) printf "%s" -Dvmnet=enabled ;;
> +    --disable-vmnet) printf "%s" -Dvmnet=disabled ;;
>      --enable-vhost-user-blk-server) printf "%s" -Dvhost_user_blk_server=enabled ;;
>      --disable-vhost-user-blk-server) printf "%s" -Dvhost_user_blk_server=disabled ;;
>      --enable-virglrenderer) printf "%s" -Dvirglrenderer=enabled ;;
> -- 
> 2.23.0
> 

