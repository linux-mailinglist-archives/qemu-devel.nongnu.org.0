Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E9EA4C719D
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 17:21:30 +0100 (CET)
Received: from localhost ([::1]:53222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOim8-00062H-8j
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 11:21:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nOikT-0004cQ-6r
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 11:19:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40697)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nOikM-0005Xv-NA
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 11:19:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646065177;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=oa4zgdUr3PRXXZ5ucCTuhLhLYm5HvHGGkwakSHJQRdQ=;
 b=LQMhB+q/GFeQxSNm2s6JtcjrzxrVx+uvTf3tMAXn7elyMO2o4YCSumIrK2TehLXHKtXPaz
 RlHpgLUeKfz2WcMwhDaS4P0O0MbujRYzScw06uIaqc+lS7yCSjxO8AqtS5rkEbBjfzqphW
 a7ztSaK8HWGgkZDaDx/9x3aWNIMF6Oo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-572-vsxRNAIkOfC2P43tUR6d6g-1; Mon, 28 Feb 2022 11:19:32 -0500
X-MC-Unique: vsxRNAIkOfC2P43tUR6d6g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A675E1854E21;
 Mon, 28 Feb 2022 16:19:31 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.149])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AE2DD2B5B3;
 Mon, 28 Feb 2022 16:19:30 +0000 (UTC)
Date: Mon, 28 Feb 2022 16:19:27 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Simeon Schaub <schaub@mit.edu>
Subject: Re: [PATCH] allow disabling tests
Message-ID: <Yhz2D07IHv/uekoi@redhat.com>
References: <a8bdb3e7-a877-070c-3ef5-6d14086a7f9b@mit.edu>
MIME-Version: 1.0
In-Reply-To: <a8bdb3e7-a877-070c-3ef5-6d14086a7f9b@mit.edu>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 28, 2022 at 10:59:24AM -0500, Simeon Schaub wrote:
> From b6ec17a85a8fb2431545f9c5093dbce9a090b522 Mon Sep 17 00:00:00 2001
> From: Simeon David Schaub <schaub@mit.edu>
> Date: Mon, 28 Feb 2022 10:51:04 -0500
> Subject: [PATCH] allow disabling tests
> 
> Adds an option to avoid running tests as part of the build process.

We don't run tests as part of the build process

We /compile/ tests, but running them requires an explicit call
to 'make check'.

Can you give more info on the problem you had ? Presumably it
was related to compilation rather than running tests ?

>                                                                     I
> ran `make update-buildoptions` to update the meson options, but this
> seemed to also change the `qga-vss` option. I assume this isn't intended
> to happen, any ideas what's going on there?
> 
> Signed-off-by: Simeon David Schaub <schaub@mit.edu>
> ---
>  meson.build                   | 4 +++-
>  meson_options.txt             | 3 +++
>  scripts/meson-buildoptions.sh | 5 ++++-
>  3 files changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/meson.build b/meson.build
> index 8df40bfac4..8b5935447a 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -3308,7 +3308,9 @@ subdir('scripts')
>  subdir('tools')
>  subdir('pc-bios')
>  subdir('docs')
> -subdir('tests')
> +if get_option('tests')
> +  subdir('tests')
> +endif
>  if gtk.found()
>    subdir('po')
>  endif
> diff --git a/meson_options.txt b/meson_options.txt
> index 52b11cead4..6527a5a368 100644
> --- a/meson_options.txt
> +++ b/meson_options.txt
> @@ -270,3 +270,6 @@ option('profiler', type: 'boolean', value: false,
>         description: 'profiler support')
>  option('slirp_smbd', type : 'feature', value : 'auto',
>         description: 'use smbd (at path --smbd=*) in slirp networking')
> +
> +option('tests', type : 'boolean', value : true,
> +       description: 'run QEMU tests as part of the build process')
> diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
> index 9ee684ef03..9271324c6a 100644
> --- a/scripts/meson-buildoptions.sh
> +++ b/scripts/meson-buildoptions.sh
> @@ -20,7 +20,6 @@ meson_options_help() {
>    printf "%s\n" '  --enable-malloc=CHOICE   choose memory allocator to
> use [system] (choices:'
>    printf "%s\n" '                           jemalloc/system/tcmalloc)'
>    printf "%s\n" '  --enable-profiler        profiler support'
> -  printf "%s\n" '  --enable-qga-vss         build QGA VSS support'
>    printf "%s\n" '  --enable-qom-cast-debug  cast debugging support'
>    printf "%s\n" '  --enable-rng-none        dummy RNG, avoid using
> /dev/(u)random and'
>    printf "%s\n" '                           getrandom()'
> @@ -28,6 +27,7 @@ meson_options_help() {
>    printf "%s\n" '                           (choices:
> auto/disabled/enabled/internal/system)'
>    printf "%s\n" '  --enable-strip           Strip targets on install'
>    printf "%s\n" '  --enable-tcg-interpreter TCG with bytecode
> interpreter (slow)'
> +  printf "%s\n" '  --disable-tests          run QEMU tests as part of
> the build process'
>    printf "%s\n" '  --enable-trace-backends=CHOICE'
>    printf "%s\n" '                           Set available tracing
> backends [log] (choices:'
>    printf "%s\n" '
> dtrace/ftrace/log/nop/simple/syslog/ust)'
> @@ -97,6 +97,7 @@ meson_options_help() {
>    printf "%s\n" '  parallels       parallels image format support'
>    printf "%s\n" '  qcow1           qcow1 image format support'
>    printf "%s\n" '  qed             qed image format support'
> +  printf "%s\n" '  qga-vss         build QGA VSS support (broken with
> MinGW)'
>    printf "%s\n" '  rbd             Ceph block device driver'
>    printf "%s\n" '  replication     replication support'
>    printf "%s\n" '  sdl             SDL user interface'
> @@ -322,6 +323,8 @@ _meson_option_parse() {
>      --disable-tcg) printf "%s" -Dtcg=disabled ;;
>      --enable-tcg-interpreter) printf "%s" -Dtcg_interpreter=true ;;
>      --disable-tcg-interpreter) printf "%s" -Dtcg_interpreter=false ;;
> +    --enable-tests) printf "%s" -Dtests=true ;;
> +    --disable-tests) printf "%s" -Dtests=false ;;
>      --enable-tools) printf "%s" -Dtools=enabled ;;
>      --disable-tools) printf "%s" -Dtools=disabled ;;
>      --enable-tpm) printf "%s" -Dtpm=enabled ;;
> -- 
> 2.35.1
> 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


