Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3386D5FD82C
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 13:14:36 +0200 (CEST)
Received: from localhost ([::1]:35344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiwAd-0007On-8n
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 07:14:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oiw4S-0000yT-0x
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 07:08:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55782)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oiw4N-0005hI-1q
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 07:08:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665659284;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=/kJPiBZ5zfxdxSwquLFhM/7N7AYGkTbgX77zyoGtj9E=;
 b=Fq6sKJhjrNdlf07rnE/8tDaIxwBzEcvZmDWj0hLvuD1BvzVVpIyMFbzmO3gZNZ8tTHkQmT
 lnUBkXDHI+Cc39XVsdTf84M7vrpGiuX6BXuRWtOPc/NX0UEh744Qv+LYPNlRh6Oy0vt/3s
 sBt6WPGW2IqoCvcoHuVWc5CyO4QEfCM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-357-vaHzrHTzPZCLsVSmBR044Q-1; Thu, 13 Oct 2022 07:08:03 -0400
X-MC-Unique: vaHzrHTzPZCLsVSmBR044Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1EDC93811F28;
 Thu, 13 Oct 2022 11:08:03 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.27])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4365040C6F9F;
 Thu, 13 Oct 2022 11:08:02 +0000 (UTC)
Date: Thu, 13 Oct 2022 12:07:58 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Michal Privoznik <mprivozn@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] configure: Avoid using strings binary
Message-ID: <Y0fxjk5zaeDYCPIo@redhat.com>
References: <83824abdddf124d76f9f265f77808e859dc094a8.1665650275.git.mprivozn@redhat.com>
 <CAFEAcA_U_mXy5haEZjEKbH_qS_oi38LK4RMD-z42QC5h2Z67cA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAFEAcA_U_mXy5haEZjEKbH_qS_oi38LK4RMD-z42QC5h2Z67cA@mail.gmail.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

On Thu, Oct 13, 2022 at 11:39:34AM +0100, Peter Maydell wrote:
> On Thu, 13 Oct 2022 at 09:47, Michal Privoznik <mprivozn@redhat.com> wrote:
> >
> > When determining the endiandness of the target architecture we're
> > building for a small program is compiled, which in an obfuscated
> > way declares two strings. Then, we look which string is in
> > correct order (using strings binary) and deduct the endiandness.
> > But using the strings binary is problematic, because it's part of
> > toolchain (strings is just a symlink to
> > x86_64-pc-linux-gnu-strings or llvm-strings). And when
> > (cross-)compiling, it requires users to set the symlink to the
> > correct toolchain.
> >
> > Fortunately, we have a better alternative anyways. Since we
> > require either clang or gcc we can rely on macros they declare.
> >
> > Bug: https://bugs.gentoo.org/876933
> > Signed-off-by: Michal Privoznik <mprivozn@redhat.com>
> 
> If we can determine this just by looking at C macros, does
> this really need to be a configure test at all ? Paolo?

We don't need to rely on CLang / GCC macros either, as this
is exposed by GLib 

$ grep BYTE_ORDER /usr/lib64/glib-2.0/include/glibconfig.h
#define G_BYTE_ORDER G_LITTLE_ENDIAN

IOW, any code that needs to know can do one of:

  #if G_BYTE_ORDER == G_LITTLE_ENDIAN

  #if G_BYTE_ORDER == G_BIG_ENDIAN


The only thing 'configure' seems to be doing with the 'bigendian'
env var it sets, is to construct a meson cross compiler spec

  if test "$cross_compile" = "yes"; then
    cross_arg="--cross-file config-meson.cross"
    echo "[host_machine]" >> $cross
    echo "system = '$targetos'" >> $cross
    case "$cpu" in
        i386)
            echo "cpu_family = 'x86'" >> $cross
            ;;
        *)
            echo "cpu_family = '$cpu'" >> $cross
            ;;
    esac
    echo "cpu = '$cpu'" >> $cross
    if test "$bigendian" = "yes" ; then
        echo "endian = 'big'" >> $cross
    else
        echo "endian = 'little'" >> $cross
    fi

so we do need a compile time test in configure, but I'd suggest
using G_BYTE_ORDER

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


