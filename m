Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F02A4446163
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Nov 2021 10:31:58 +0100 (CET)
Received: from localhost ([::1]:49592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mivZl-0008E8-JY
	for lists+qemu-devel@lfdr.de; Fri, 05 Nov 2021 05:31:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mivYr-0007T7-Ug
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 05:31:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20978)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mivYp-00038C-IG
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 05:31:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636104658;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=S40txURDasiJJWK5QGWqk60ZThSLZi2FHhfMBNJI77o=;
 b=dxMuQQyyUao04RiIaS57o8Y05eXhn50XemsT/LAKKtgs0nUzlkjyBA4U4N+zPyY5kp2YrP
 uJ01lqtEm0f32AHwInbyq1biv7N6X/u34u91TZqfh+6SXpYZq1nAs23PsuSnsT9/TVUl0p
 F3Fnyye2gsG0IJqMZwkR8LelLLkg6SI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-418-A-9A1aTwMnevF6kBVDl_8w-1; Fri, 05 Nov 2021 05:30:47 -0400
X-MC-Unique: A-9A1aTwMnevF6kBVDl_8w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7E58C1006AA5;
 Fri,  5 Nov 2021 09:30:46 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.115])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C8C8E5D9DE;
 Fri,  5 Nov 2021 09:30:45 +0000 (UTC)
Date: Fri, 5 Nov 2021 09:30:43 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: Re: [PATCH] configure: Support modules for Windows
Message-ID: <YYT5w9fAh6EJY3Ku@redhat.com>
References: <20211105032002.83792-1-zhiwei_liu@c-sky.com>
MIME-Version: 1.0
In-Reply-To: <20211105032002.83792-1-zhiwei_liu@c-sky.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.648,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Nov 05, 2021 at 11:20:02AM +0800, LIU Zhiwei wrote:

Generally we expect a commit message describing what is being solved
and any reasons for the approach taken.

> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> ---
>  configure   |  7 +------
>  meson.build | 34 ++++++++++++++++++++++++----------
>  2 files changed, 25 insertions(+), 16 deletions(-)
> 
> diff --git a/configure b/configure
> index 33682cb971..6280e412a9 100755
> --- a/configure
> +++ b/configure
> @@ -1422,7 +1422,7 @@ cat << EOF
>    bsd-user        all BSD usermode emulation targets
>    guest-agent     build the QEMU Guest Agent
>    pie             Position Independent Executables
> -  modules         modules support (non-Windows)
> +  modules         modules support
>    module-upgrades try to load modules from alternate paths for upgrades
>    debug-tcg       TCG debugging (default is disabled)
>    debug-info      debugging information
> @@ -1698,11 +1698,6 @@ else
>    QEMU_CFLAGS="$QEMU_CFLAGS -Wno-missing-braces"
>  fi
>  
> -# Our module code doesn't support Windows
> -if test "$modules" = "yes" && test "$mingw32" = "yes" ; then
> -  error_exit "Modules are not available for Windows"
> -fi
> -
>  # module_upgrades is only reasonable if modules are enabled
>  if test "$modules" = "no" && test "$module_upgrades" = "yes" ; then
>    error_exit "Can't enable module-upgrades as Modules are not enabled"
> diff --git a/meson.build b/meson.build
> index 47df10afc2..26195cb24f 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -2625,7 +2625,7 @@ block_mods = []
>  softmmu_mods = []
>  foreach d, list : modules
>    foreach m, module_ss : list
> -    if enable_modules and targetos != 'windows'
> +    if enable_modules
>        module_ss = module_ss.apply(config_all, strict: false)
>        sl = static_library(d + '-' + m, [genh, module_ss.sources()],
>                            dependencies: [modulecommon, module_ss.dependencies()], pic: true)
> @@ -2658,7 +2658,7 @@ endforeach
>  
>  foreach d, list : target_modules
>    foreach m, module_ss : list
> -    if enable_modules and targetos != 'windows'
> +    if enable_modules
>        foreach target : target_dirs
>          if target.endswith('-softmmu')
>            config_target = config_target_mak[target]
> @@ -2800,14 +2800,15 @@ common_ss.add(hwcore)
>  ###########
>  # Targets #
>  ###########
> -
> -foreach m : block_mods + softmmu_mods
> -  shared_module(m.name(),
> -                name_prefix: '',
> -                link_whole: m,
> -                install: true,
> -                install_dir: qemu_moddir)
> -endforeach
> +if targetos != 'windows'
> +  foreach m : block_mods + softmmu_mods
> +    shared_module(m.name(),
> +                  name_prefix: '',
> +                  link_whole: m,
> +                  install: true,
> +                  install_dir: qemu_moddir)
> +  endforeach
> +endif
>  
>  softmmu_ss.add(authz, blockdev, chardev, crypto, io, qmp)
>  common_ss.add(qom, qemuutil)
> @@ -2826,6 +2827,7 @@ common_all = static_library('common',
>  feature_to_c = find_program('scripts/feature_to_c.sh')
>  
>  emulators = {}
> +emulator = 0
>  foreach target : target_dirs
>    config_target = config_target_mak[target]
>    target_name = config_target['TARGET_NAME']
> @@ -2966,6 +2968,7 @@ foreach target : target_dirs
>                 link_language: link_language,
>                 link_depends: [block_syms, qemu_syms] + exe.get('link_depends', []),
>                 link_args: link_args,
> +               implib: true,
>                 win_subsystem: exe['win_subsystem'])
>  
>      if targetos == 'darwin'
> @@ -3023,6 +3026,17 @@ foreach target : target_dirs
>      endif
>    endforeach
>  endforeach
> +if (targetos == 'windows')
> +  foreach m : block_mods + softmmu_mods
> +    shared_module(m.name(),
> +	    name_prefix: '',
> +	    link_whole: m,
> +	    install: true,
> +	    dependencies: glib,
> +	    link_with: emulator,

AFAIK from the docs meson wants "link_with" to be a list of
libraries. This is passing a literal '0' which doesn't
make sense. Is this really needed ?

What is the reason for the "dependencies" addition ?

Can we not just use the existing shared_module() rules
we already have. It might be ok to just add dependencies
to the existing rule even for non-windows.

> +	    install_dir: qemu_moddir)
> +  endforeach
> +endif



Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


