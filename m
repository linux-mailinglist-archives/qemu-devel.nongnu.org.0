Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7AA75F9EF6
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 14:56:37 +0200 (CEST)
Received: from localhost ([::1]:34964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohsKh-0005Gz-TS
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 08:56:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ohsIf-0003lV-46
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 08:54:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24100)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ohsIb-0006Yo-0w
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 08:54:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665406463;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ssLyrtoroDf3IZbVnhPqccpeEAN2QQ3s45MmbcoWkD0=;
 b=jONKiTVmvnNm8Mzc1WdJ0egi2X/d0HNDGSRCDMgn/C1rjsmdwI3uxmXtH/IH/MKhcsrhJn
 nojuTbCvjngWxuHedXxcKUFAIQBnhanWgTiV3AM4sInD3w/+EXNh27cUR5EAwdhLVgy7fL
 xRfRb1AlJBDEuYnWl0JX7Kvoh3XNMmA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-664-tXboxYgSMZqPEa2xDDO46A-1; Mon, 10 Oct 2022 08:54:20 -0400
X-MC-Unique: tXboxYgSMZqPEa2xDDO46A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5AB9529AB443;
 Mon, 10 Oct 2022 12:54:20 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.132])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E1684414A809;
 Mon, 10 Oct 2022 12:54:18 +0000 (UTC)
Date: Mon, 10 Oct 2022 13:54:16 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, stefanha@redhat.com,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PULL 28/54] configure: build ROMs with container-based cross
 compilers
Message-ID: <Y0QV+B+Wz6fxceh1@redhat.com>
References: <20221004130138.2299307-1-alex.bennee@linaro.org>
 <20221004130138.2299307-29-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221004130138.2299307-29-alex.bennee@linaro.org>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 04, 2022 at 02:01:12PM +0100, Alex Bennée wrote:
> From: Paolo Bonzini <pbonzini@redhat.com>
> 
> s390-ccw remains a bit more complex, because the -march=z900 test is done
> only for the native cross compiler.  Otherwise, all that is needed is
> to pass the (now mandatory) target argument to write_target_makefile.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20220929114231.583801-29-alex.bennee@linaro.org>

I'm not at all convinced this change was/is a good idea.

First of all, it causes 'make' to now download about 1 GB of
container images

  $ ./configure --target-list=x86_64-softmmu
  $ make
  ...snip...
  BUILD   debian-powerpc-test-cross
  Trying to pull registry.gitlab.com/qemu-project/qemu/qemu/debian-powerpc-test-cross:latest...
  Getting image source signatures
  Copying blob 2a205c8a1d36 [=>------------------------------------] 12.4MiB / 257.2MiB

  ...
  ...snip...
  
Despite downloading this image, it then proceeded to rebuild the
image from scratch, requiring another few 100MBs of downloads
of dpkgs. This time the download was without progress information
until it entirely failed due to a dead Debia mirror server, needing
a retry.

It then went on to download an s390x image which seems to have
two layers, each with 360 MB.

  BUILD   debian-s390x-cross
Trying to pull registry.gitlab.com/qemu-project/qemu/qemu/debian-s390x-cross:latest...
Getting image source signatures
Copying blob fc8d65e34cd5 [>-------------------------------------] 12.0MiB / 360.2MiB
Copying blob bd159e379b3b skipped: already exists  
Copying blob 13224e2971af [>-------------------------------------] 12.2MiB / 366.5MiB

So overall it was more than 1 GB of downloads when typing 'make'

I wasn't too amuzed by seeing this downloaded data , given that
I'm usually running off a 4G mobile connection, and it took a
very long time.


The progress information printed by docker when downloading
the images splatters all over the output meson displays, when
doing a parallel make making everything unintelligible.


Finally, I had requested only building x86_64, so we shouldn't
be doing anything related to ppc or s390 at all, but even if

AFAICT, it enables this downloading unconditionally merely by
having 'docker'/'podman' binaries installed, if you don't
otherwise have cross compuilers present.

I'd really not want to see any of this stuff downloaded without
an explicit opt-in choice at configure time.

I'm also a little concerned at what happens if we have to stop
publishing the containers at registry.gitlab.com in future. Are
we going to break the default 'make' for existing released QEMU
tarballs ?

Generally we've only relied on the gitlab infra for our CI
testing, so we have been free to change infra or alter the
way we publish images at any time, without risk of impact on
the released tarballs.

This isn't a theoretical problem, because GitLab has announced
their intention to limit storage usage in gitlab.com, and even
having joined the Open Source Program, our quota is only increased
from 5 GB to 25 GB.  I'd be concerned we're at risk of exceeding
that 25 GB limit, when they start to enforce it, requiring us to
move container image host to somewhere else such as quay.io


> diff --git a/configure b/configure
> index c175650eb9..a54e17aca9 100755
> --- a/configure
> +++ b/configure
> @@ -2152,7 +2152,7 @@ probe_target_compiler() {
>      target_ranlib=
>      target_strip=
>    fi
> -  test -n "$target_cc"
> +  test -n "$target_cc" || test -n "$container_image"
>  }
>  
>  write_target_makefile() {
> @@ -2307,7 +2307,7 @@ if test "$targetos" != "darwin" && test "$targetos" != "sunos" && \
>      config_mak=pc-bios/optionrom/config.mak
>      echo "# Automatically generated by configure - do not modify" > $config_mak
>      echo "TOPSRC_DIR=$source_path" >> $config_mak
> -    write_target_makefile >> $config_mak
> +    write_target_makefile pc-bios/optionrom/all >> $config_mak
>  fi
>  
>  if test "$softmmu" = yes && probe_target_compiler ppc-softmmu; then
> @@ -2315,25 +2315,31 @@ if test "$softmmu" = yes && probe_target_compiler ppc-softmmu; then
>      config_mak=pc-bios/vof/config.mak
>      echo "# Automatically generated by configure - do not modify" > $config_mak
>      echo "SRC_DIR=$source_path/pc-bios/vof" >> $config_mak
> -    write_target_makefile >> $config_mak
> +    write_target_makefile pc-bios/vof/all >> $config_mak
>  fi
>  
>  # Only build s390-ccw bios if the compiler has -march=z900 or -march=z10
>  # (which is the lowest architecture level that Clang supports)
>  if test "$softmmu" = yes && probe_target_compiler s390x-softmmu; then
> -  write_c_skeleton
> -  do_compiler "$target_cc" $target_cc_cflags -march=z900 -o $TMPO -c $TMPC
> -  has_z900=$?
> -  if [ $has_z900 = 0 ] || do_compiler "$target_cc" $target_cc_cflags -march=z10 -msoft-float -Werror -o $TMPO -c $TMPC; then
> -    if [ $has_z900 != 0 ]; then
> -      echo "WARNING: Your compiler does not support the z900!"
> -      echo "         The s390-ccw bios will only work with guest CPUs >= z10."
> +  got_cross_cc=no
> +  if test -n "$target_cc"; then
> +    write_c_skeleton
> +    do_compiler "$target_cc" $target_cc_cflags -march=z900 -o $TMPO -c $TMPC
> +    has_z900=$?
> +    if [ $has_z900 = 0 ] || do_compiler "$target_cc" $target_cc_cflags -march=z10 -msoft-float -Werror -o $TMPO -c $TMPC; then
> +      if [ $has_z900 != 0 ]; then
> +        echo "WARNING: Your compiler does not support the z900!"
> +        echo "         The s390-ccw bios will only work with guest CPUs >= z10."
> +      fi
> +      got_cross_cc=yes
>      fi
> +  fi
> +  if test "$got_cross_cc" = yes || test -n "$container_image"; then
>      roms="$roms pc-bios/s390-ccw"
>      config_mak=pc-bios/s390-ccw/config-host.mak
>      echo "# Automatically generated by configure - do not modify" > $config_mak
>      echo "SRC_PATH=$source_path/pc-bios/s390-ccw" >> $config_mak
> -    write_target_makefile >> $config_mak
> +    write_target_makefile pc-bios/s390-ccw/all >> $config_mak
>      # SLOF is required for building the s390-ccw firmware on s390x,
>      # since it is using the libnet code from SLOF for network booting.
>      git_submodules="${git_submodules} roms/SLOF"
> @@ -2554,7 +2560,7 @@ for target in $target_list; do
>        ;;
>    esac
>  
> -  if probe_target_compiler $target || test -n "$container_image"; then
> +  if probe_target_compiler $target; then
>        test -n "$container_image" && build_static=y
>        mkdir -p "tests/tcg/$target"
>        config_target_mak=tests/tcg/$target/config-target.mak
> -- 
> 2.34.1
> 
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


