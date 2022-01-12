Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD98348C8FF
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 18:02:15 +0100 (CET)
Received: from localhost ([::1]:60382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7h0o-0007ms-Sk
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 12:02:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <roman@roolebo.dev>) id 1n7gs2-0008Ij-UE
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 11:53:11 -0500
Received: from [2a00:1450:4864:20::143] (port=44953
 helo=mail-lf1-x143.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <roman@roolebo.dev>) id 1n7gs0-0001YF-RK
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 11:53:10 -0500
Received: by mail-lf1-x143.google.com with SMTP id o15so10197135lfo.11
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 08:53:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=roolebo.dev; s=mail;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=W7FwlCkj8vtXgaMpC4kFnqQxBok7yOWYfvoDdEMoshg=;
 b=R1ysGK0pixvIunRT2F07sUeADR0XtXmYvRlxFLGqwfVF+kQRJkqJESaK3ywHU0bLBf
 N2TtqtUHXkRXnANWWLx1GcyrC16cIV553NNV1RnDvMc3Gi8b7EI2cdL1QU3O8bZBx86d
 Gly03bExbKJ2dEM52FR3H6Az/oS0HPkBTfwTQPtKx2LmSS4Rz78LJrn/692Rcf/uDLsp
 WNJnDHADn2uOr79sU68EJe2tUlE8r5iIyLsVzYBuevDE7JIxj8eFapzbVmZrbr2RXXtm
 dAOTcjWGOPr/XD37ZhWyJQrPx2wSkRc/J1+CMT1ChN9qph9soupJdnVW8QZnbGW/bTom
 tLhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=W7FwlCkj8vtXgaMpC4kFnqQxBok7yOWYfvoDdEMoshg=;
 b=PBMBrmIcFOOTpt7X3UOkAUy0WMsqHMDYkmCWDEWgLbE8AKr5CiuzMEAonowGMIqGN3
 Q0JmSR2atJGfYFCgYTN6wq1sD88yH7dLnEKzFh4EYNyEdKy3KEx7imu/wnwRjGrGLpht
 ZmIHSQ8ocu4kKG3KnWIPrMUX6ci9bp4kbS1ZZDKHkSojfAN97hkPQ6ulfZYT72n4rI9r
 XkxRBqVTU8tCzfFaNoJRwijTabmAlr3CywLkI+a0IkvSQ1MHYHZd21B5CqU2FZ8V4ZcO
 lpVACMOv6zqLKLDBkofz5oKpt2qPpjuTqmYTqihgkNS0Jxl6vlOVruj5QGCSjPGcfqsK
 rQZw==
X-Gm-Message-State: AOAM5334ZSCU8gaJFRa9JdY6cu+9AeTqMvnZjjlOzQwcoQpxUKcNtaue
 FEj+4+UzjaJVaBH7GDyIEibUGeM3WZ0gD6dP5Wmdsw==
X-Google-Smtp-Source: ABdhPJz0rGfZk0jHPJLAXjcUfUX6ma+pJaXClKksFkXUlBXCedaMto3+kDiMUw4uzCqBpf7VNQZdfQ==
X-Received: by 2002:ac2:4c46:: with SMTP id o6mr413259lfk.373.1642006386380;
 Wed, 12 Jan 2022 08:53:06 -0800 (PST)
Received: from localhost (ip-185-108-208-32.ip.asarta.ru. [185.108.208.32])
 by smtp.gmail.com with ESMTPSA id n7sm38803lfu.66.2022.01.12.08.53.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jan 2022 08:53:05 -0800 (PST)
Date: Wed, 12 Jan 2022 19:53:05 +0300
From: Roman Bolshakov <roman@roolebo.dev>
To: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
Subject: Re: [PATCH v11 1/7] net/vmnet: add vmnet dependency and customizable
 option
Message-ID: <Yd8HcSVcuJB7C7Hg@roolebo.dev>
References: <20220112122150.37049-1-yaroshchuk2000@gmail.com>
 <20220112122150.37049-2-yaroshchuk2000@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220112122150.37049-2-yaroshchuk2000@gmail.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::143
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::143;
 envelope-from=roman@roolebo.dev; helo=mail-lf1-x143.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: jasowang@redhat.com, phillip.ennen@gmail.com, qemu-devel@nongnu.org,
 armbru@redhat.com, r.bolshakov@yadro.com, phillip@axleos.com,
 akihiko.odaki@gmail.com, hsp.cat7@gmail.com, hello@adns.io, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jan 12, 2022 at 03:21:44PM +0300, Vladislav Yaroshchuk wrote:
> vmnet.framework dependency is added with 'vmnet' option
> to enable or disable it. Default value is 'auto'.
> 
> vmnet features to be used are available since macOS 11.0,
> corresponding probe is created into meson.build.
> 
> Signed-off-by: Vladislav Yaroshchuk <yaroshchuk2000@gmail.com>
> ---
>  meson.build                   | 23 ++++++++++++++++++++++-
>  meson_options.txt             |  2 ++
>  scripts/meson-buildoptions.sh |  3 +++
>  3 files changed, 27 insertions(+), 1 deletion(-)
> 
> diff --git a/meson.build b/meson.build
> index c1b1db1e28..b912c9cb91 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -496,6 +496,24 @@ if cocoa.found() and get_option('gtk').enabled()
>    error('Cocoa and GTK+ cannot be enabled at the same time')
>  endif
>  
> +vmnet = dependency('appleframeworks', modules: 'vmnet', required: get_option('vmnet'))
> +vmnet_11_0_api = false
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
> +if vmnet.found() and cc.has_header_symbol('vmnet/vmnet.h',
> +                                          'VMNET_SHARING_SERVICE_BUSY',
> +                                          dependencies: vmnet)
> +  vmnet_11_0_api = true
> +endif
> +
>  seccomp = not_found
>  if not get_option('seccomp').auto() or have_system or have_tools
>    seccomp = dependency('libseccomp', version: '>=2.3.0',
> @@ -1492,6 +1510,8 @@ config_host_data.set('CONFIG_SECCOMP', seccomp.found())
>  config_host_data.set('CONFIG_SNAPPY', snappy.found())
>  config_host_data.set('CONFIG_USB_LIBUSB', libusb.found())
>  config_host_data.set('CONFIG_VDE', vde.found())
> +config_host_data.set('CONFIG_VMNET', vmnet.found())
> +config_host_data.set('CONFIG_VMNET_11_0_API', vmnet_11_0_api)

Hi Vladislav,

There might be more functionality coming in the next macOS versions but
we likely don't want to add them as extra CONFIG defines. Instead we
wrap new symbols/functions/code that are avaialble above Big Sur in the
code as:

#if defined(MAC_OS_VERSION_11_0) && \
    MAC_OS_X_VERSION_MAX_ALLOWED >= MAC_OS_VERSION_11_0

    xpc_dictionary_set_bool(
        if_desc,
        vmnet_enable_isolation_key,
        options->isolated
    );

#endif

Please see similar thread here:
https://lists.gnu.org/archive/html/qemu-devel/2022-01/msg01915.html

Thanks,
Roman

>  config_host_data.set('CONFIG_VHOST_USER_BLK_SERVER', have_vhost_user_blk_server)
>  config_host_data.set('CONFIG_VNC', vnc.found())
>  config_host_data.set('CONFIG_VNC_JPEG', jpeg.found())
> @@ -3406,7 +3426,8 @@ summary(summary_info, bool_yn: true, section: 'Crypto')
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
> 

