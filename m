Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 366D3299323
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Oct 2020 17:58:33 +0100 (CET)
Received: from localhost ([::1]:58150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kX5pI-000190-8U
	for lists+qemu-devel@lfdr.de; Mon, 26 Oct 2020 12:58:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kX5no-0000P5-TP
 for qemu-devel@nongnu.org; Mon, 26 Oct 2020 12:57:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29636)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kX5nk-0005LN-Uj
 for qemu-devel@nongnu.org; Mon, 26 Oct 2020 12:57:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603731415;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cRSimjyOi/6kAM12mbBL/oZAz/eFJJ+/dnk1LRb53R4=;
 b=Ki3oeEQmNP2y/jLNV0HHa19eNl58G7AA6/RJtdi/C4AuhuHlWrapwvl4bynSy/nBBvW/ug
 MM1nEvmzp0wy9rkUp3bNMnYLwSM1sDKWUTjJF9JwydRzU5FDZM0bqxNCqIJsTcTvDJxneR
 c+U9LoNRiQZyV34NkSVSLgF2cNwcsF8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-541-n_gsNJ0_PGCZTnsa3w5r0w-1; Mon, 26 Oct 2020 12:56:52 -0400
X-MC-Unique: n_gsNJ0_PGCZTnsa3w5r0w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1AFB2192C96E;
 Mon, 26 Oct 2020 16:56:51 +0000 (UTC)
Received: from work-vm (ovpn-112-208.ams2.redhat.com [10.36.112.208])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F10C860C13;
 Mon, 26 Oct 2020 16:56:46 +0000 (UTC)
Date: Mon, 26 Oct 2020 16:56:44 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Misono Tomohiro <misono.tomohiro@jp.fujitsu.com>
Subject: Re: [PATCH v2] configure: add option for virtiofsd
Message-ID: <20201026165644.GA152260@work-vm>
References: <20201008103133.2722903-1-misono.tomohiro@jp.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <20201008103133.2722903-1-misono.tomohiro@jp.fujitsu.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/26 02:39:09
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: virtio-fs@redhat.com, pbonzini@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Misono Tomohiro (misono.tomohiro@jp.fujitsu.com) wrote:
> Currently it is unknown whether virtiofsd will be built at
> configuration time. It will be automatically built when dependency
> is met. Also, required libraries are not clear.
> 
> To make this clear, add configure option --{enable,disable}-virtiofsd.
> The default is the same as current (enabled if available) like many
> other options. When --enable-virtiofsd is given and dependency is not
> met, we get:
> 
>   ERROR: Problem encountered: virtiofsd requires libcap-ng-devel and seccomp-devel
> or
>   ERROR: Problem encountered: virtiofsd needs tools and vhost-user support
> 
> In addition, configuration summary now includes virtiofsd entry:
> 
>   build virtiofs daemon: YES/NO
> 
> Signed-off-by: Misono Tomohiro <misono.tomohiro@jp.fujitsu.com>
> ---
> This patch is based on current master branch
> 
> v1 ... https://lore.kernel.org/qemu-devel/20201007092913.1524199-1-misono.tomohiro@jp.fujitsu.com/
> v1 -> v2: Update to follow the current meson build style

Queued

> 
>  configure         |  8 +++++++-
>  meson.build       |  1 +
>  meson_options.txt |  2 ++
>  tools/meson.build | 17 +++++++++++++++--
>  4 files changed, 25 insertions(+), 3 deletions(-)
> 
> diff --git a/configure b/configure
> index 28df227db5..2bd8419b1f 100755
> --- a/configure
> +++ b/configure
> @@ -302,6 +302,7 @@ netmap="no"
>  sdl="auto"
>  sdl_image="auto"
>  virtfs=""
> +virtiofsd="auto"
>  mpath="auto"
>  vnc="enabled"
>  sparse="auto"
> @@ -1004,6 +1005,10 @@ for opt do
>    ;;
>    --enable-virtfs) virtfs="yes"
>    ;;
> +  --disable-virtiofsd) virtiofsd="disabled"
> +  ;;
> +  --enable-virtiofsd) virtiofsd="enabled"
> +  ;;
>    --disable-mpath) mpath="disabled"
>    ;;
>    --enable-mpath) mpath="enabled"
> @@ -1761,6 +1766,7 @@ disabled with --disable-FEATURE, default is enabled if available:
>    vnc-png         PNG compression for VNC server
>    cocoa           Cocoa UI (Mac OS X only)
>    virtfs          VirtFS
> +  virtiofsd       build virtiofs daemon (virtiofsd)
>    mpath           Multipath persistent reservation passthrough
>    xen             xen backend driver support
>    xen-pci-passthrough    PCI passthrough support for Xen
> @@ -7215,7 +7221,7 @@ NINJA=${ninja:-$PWD/ninjatool} $meson setup \
>  	-Dxen=$xen -Dxen_pci_passthrough=$xen_pci_passthrough -Dtcg=$tcg \
>  	-Dcocoa=$cocoa -Dmpath=$mpath -Dsdl=$sdl -Dsdl_image=$sdl_image \
>  	-Dvnc=$vnc -Dvnc_sasl=$vnc_sasl -Dvnc_jpeg=$vnc_jpeg -Dvnc_png=$vnc_png \
> -	-Dgettext=$gettext -Dxkbcommon=$xkbcommon -Du2f=$u2f \
> +	-Dgettext=$gettext -Dxkbcommon=$xkbcommon -Du2f=$u2f -Dvirtiofsd=$virtiofsd \
>  	-Dcapstone=$capstone -Dslirp=$slirp -Dfdt=$fdt \
>          $cross_arg \
>          "$PWD" "$source_path"
> diff --git a/meson.build b/meson.build
> index 17c89c87c6..a087239009 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1843,6 +1843,7 @@ summary_info += {'Audio drivers':     config_host['CONFIG_AUDIO_DRIVERS']}
>  summary_info += {'Block whitelist (rw)': config_host['CONFIG_BDRV_RW_WHITELIST']}
>  summary_info += {'Block whitelist (ro)': config_host['CONFIG_BDRV_RO_WHITELIST']}
>  summary_info += {'VirtFS support':    config_host.has_key('CONFIG_VIRTFS')}
> +summary_info += {'build virtiofs daemon': have_virtiofsd}
>  summary_info += {'Multipath support': mpathpersist.found()}
>  summary_info += {'VNC support':       vnc.found()}
>  if vnc.found()
> diff --git a/meson_options.txt b/meson_options.txt
> index 1d3c94840a..80637ada63 100644
> --- a/meson_options.txt
> +++ b/meson_options.txt
> @@ -48,6 +48,8 @@ option('vnc_sasl', type : 'feature', value : 'auto',
>         description: 'SASL authentication for VNC server')
>  option('xkbcommon', type : 'feature', value : 'auto',
>         description: 'xkbcommon support')
> +option('virtiofsd', type: 'feature', value: 'auto',
> +       description: 'build virtiofs daemon (virtiofsd)')
>  
>  option('capstone', type: 'combo', value: 'auto',
>         choices: ['disabled', 'enabled', 'auto', 'system', 'internal'],
> diff --git a/tools/meson.build b/tools/meson.build
> index 513bd2ff4f..76bf84df52 100644
> --- a/tools/meson.build
> +++ b/tools/meson.build
> @@ -1,10 +1,23 @@
> -have_virtiofsd = (have_system and
> +have_virtiofsd = (targetos == 'linux' and
>      have_tools and
> -    'CONFIG_LINUX' in config_host and 
>      'CONFIG_SECCOMP' in config_host and
>      'CONFIG_LIBCAP_NG' in config_host and
>      'CONFIG_VHOST_USER' in config_host)
>  
> +if get_option('virtiofsd').enabled()
> +  if not have_virtiofsd
> +    if targetos != 'linux'
> +      error('virtiofsd requires Linux')
> +    elif 'CONFIG_SECCOMP' not in config_host or 'CONFIG_LIBCAP_NG' not in config_host
> +      error('virtiofsd requires libcap-ng-devel and seccomp-devel')
> +    elif not have_tools or 'CONFIG_VHOST_USER' not in config_host
> +      error('virtiofsd needs tools and vhost-user support')
> +    endif
> +  endif
> +elif get_option('virtiofsd').disabled() or not have_system
> +  have_virtiofsd = false
> +endif
> +
>  if have_virtiofsd
>    subdir('virtiofsd')
>  endif
> -- 
> 2.25.4
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


