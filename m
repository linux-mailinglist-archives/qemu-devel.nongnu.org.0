Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4696E2540D5
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Aug 2020 10:29:13 +0200 (CEST)
Received: from localhost ([::1]:49886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kBDHU-0001cI-Bm
	for lists+qemu-devel@lfdr.de; Thu, 27 Aug 2020 04:29:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kBDGl-0001D8-4b
 for qemu-devel@nongnu.org; Thu, 27 Aug 2020 04:28:27 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:23418
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kBDGi-0004tj-74
 for qemu-devel@nongnu.org; Thu, 27 Aug 2020 04:28:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598516903;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/NQS5QWY4+fBQ42BHQ/QIyus1BwFx075lO+8qmpb1Zo=;
 b=UiGf6w20JPJQcc4q7IpBZ4co0NqlF9e06X0Fwkz/z4EpR9qRVITZ3oz8GR77JLzBC+sWyk
 FiCltx8hLxWnlipq0Y+K25BnccTYdo4LW5u2l0QzORaCHrrS/1PrEZ4zL2xmZ+JHka8oGm
 y40tYAVp01Db007+BMwa9KRu+gu/s98=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-388--2_DtodWNg-18gqrNXFNOA-1; Thu, 27 Aug 2020 04:28:21 -0400
X-MC-Unique: -2_DtodWNg-18gqrNXFNOA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A24DF10ABDA1;
 Thu, 27 Aug 2020 08:28:20 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-56.ams2.redhat.com [10.36.112.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 697BC60FC2;
 Thu, 27 Aug 2020 08:28:19 +0000 (UTC)
Subject: Re: [PATCH] meson: move pixman detection to meson
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20200826070243.11969-1-pbonzini@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <eb719289-1d8d-45a7-1851-f6c60d47e7cc@redhat.com>
Date: Thu, 27 Aug 2020 10:28:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200826070243.11969-1-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=205.139.110.120; envelope-from=thuth@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/27 00:13:19
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.959,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.239, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Rafael Kitover <rkitover@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 26/08/2020 09.02, Paolo Bonzini wrote:
> When pixman is not installed (or too old), but virglrenderer is available
> and "configure" has been run with "--disable-system", the build currently
> aborts when trying to compile vhost-user-gpu (since it requires pixman).
> 
> Let's skip the build of vhost-user-gpu when pixman is not installed or
> too old.  Instead of adding CONFIG_PIXMAN, it is simpler to move the
> detection to pixman.
> 
> Based on a patch by Thomas Huth. <thuth@redhat.com>
> 
> Fixes: 9b52b17ba5 ("configure: Allow to build tools without pixman")
> Reported-by: Rafael Kitover <rkitover@gmail.com>
> Reported-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  configure                          | 21 ++-------------------
>  contrib/vhost-user-gpu/meson.build |  3 ++-
>  meson.build                        | 12 +++++++-----
>  3 files changed, 11 insertions(+), 25 deletions(-)
> 
> diff --git a/configure b/configure
> index a5fa472c64..51b6164f69 100755
> --- a/configure
> +++ b/configure
> @@ -3923,20 +3923,6 @@ if test "$modules" = yes; then
>      fi
>  fi
>  
> -##########################################
> -# pixman support probe
> -
> -if test "$softmmu" = "no"; then
> -  pixman_cflags=
> -  pixman_libs=
> -elif $pkg_config --atleast-version=0.21.8 pixman-1 > /dev/null 2>&1; then
> -  pixman_cflags=$($pkg_config --cflags pixman-1)
> -  pixman_libs=$($pkg_config --libs pixman-1)
> -else
> -  error_exit "pixman >= 0.21.8 not present." \
> -      "Please install the pixman devel package."
> -fi
> -
>  ##########################################
>  # libmpathpersist probe
>  
> @@ -6649,8 +6635,8 @@ echo_version() {
>      fi
>  }
>  
> -# prepend pixman and ftd flags after all config tests are done
> -QEMU_CFLAGS="$pixman_cflags $fdt_cflags $QEMU_CFLAGS"
> +# prepend ftd flags after all config tests are done
> +QEMU_CFLAGS="$fdt_cflags $QEMU_CFLAGS"
>  QEMU_LDFLAGS="$fdt_ldflags $QEMU_LDFLAGS"
>  
>  config_host_mak="config-host.mak"
> @@ -8053,9 +8039,6 @@ fi
>  
>  done # for target in $targets
>  
> -echo "PIXMAN_CFLAGS=$pixman_cflags" >> $config_host_mak
> -echo "PIXMAN_LIBS=$pixman_libs" >> $config_host_mak
> -
>  if [ "$fdt" = "git" ]; then
>    subdirs="$subdirs dtc"
>  fi
> diff --git a/contrib/vhost-user-gpu/meson.build b/contrib/vhost-user-gpu/meson.build
> index 8df4c13bc5..7d9b29da8b 100644
> --- a/contrib/vhost-user-gpu/meson.build
> +++ b/contrib/vhost-user-gpu/meson.build
> @@ -1,5 +1,6 @@
>  if 'CONFIG_TOOLS' in config_host and 'CONFIG_VIRGL' in config_host \
> -    and 'CONFIG_GBM' in config_host and 'CONFIG_LINUX' in config_host
> +    and 'CONFIG_GBM' in config_host and 'CONFIG_LINUX' in config_host \
> +    and pixman.found()
>    executable('vhost-user-gpu', files('vhost-user-gpu.c', 'virgl.c', 'vugbm.c'),
>               link_with: libvhost_user,
>               dependencies: [qemuutil, pixman, gbm, virgl],
> diff --git a/meson.build b/meson.build
> index bcd39b39da..57c2fe2b65 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -114,8 +114,11 @@ if 'CONFIG_GNUTLS' in config_host
>    gnutls = declare_dependency(compile_args: config_host['GNUTLS_CFLAGS'].split(),
>                                link_args: config_host['GNUTLS_LIBS'].split())
>  endif
> -pixman = declare_dependency(compile_args: config_host['PIXMAN_CFLAGS'].split(),
> -                            link_args: config_host['PIXMAN_LIBS'].split())
> +pixman = not_found
> +if have_system or have_tools
> +  pixman = dependency('pixman', required: have_system, version:'>=0.21.8',
> +                      static: enable_static)
> +endif

With the dependency from another patch that have_system and have_tools
are initialized earlier in this file:

Reviewed-by: Thomas Huth <thuth@redhat.com>


