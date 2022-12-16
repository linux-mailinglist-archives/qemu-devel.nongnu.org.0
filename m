Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6272564EE04
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 16:37:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6Ckx-00009g-8b; Fri, 16 Dec 2022 10:36:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1p6Cku-00008R-Vs
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 10:36:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1p6Cks-0004Jp-BL
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 10:36:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671204967;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=M9/CAShddBkioXM1ZrjyWsUeXPyrgOoTnf6XYUABC7Q=;
 b=YiQ66tKlTSVeSLIm8c+zqLoSH9MZPkDt1uL9NiRv0RrpeMVfp9PWG/NeGyRF0dnVl/9W+A
 1xHRK7pHo/AZN3MaahB2kx6L4L68GSfGpMbxJmzDwl+XWsiZXVu0WWzJCAn25YxdEPWgNh
 Az8xZodeXkz+PjQuIyGPC5EeKf6oIgY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-673-CYEoVXHBNPeYSENqY9W3Hg-1; Fri, 16 Dec 2022 10:36:06 -0500
X-MC-Unique: CYEoVXHBNPeYSENqY9W3Hg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 10A7E101A521
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 15:36:06 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.128])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5BF65492C18;
 Fri, 16 Dec 2022 15:36:05 +0000 (UTC)
Date: Fri, 16 Dec 2022 15:35:56 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH for-8.0 00/30] Meson changes for QEMU 8.0
Message-ID: <Y5yQXFxgf+12G153@redhat.com>
References: <20221209112409.184703-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221209112409.184703-1-pbonzini@redhat.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, Dec 09, 2022 at 12:23:39PM +0100, Paolo Bonzini wrote:
> The final bout of conversions removes the remaining compiler tests
> for emulators, applies a few cleanups that are enabled by version 0.63
> of Meson, and updates the documentation.
> 
> Committing this however requires first a libvirt-ci update, in order to
> enable using Python 3.8/3.9 on CentOS 8 and SLES 15.  I am still working
> on it but the review can start early for these patches.
> 
> A final comparison for the effort has a net negative of around 4000
> lines of code, despite the growth of QEMU itself in the meanwhile:
> 
>       before                             after
> --------------------------------------------------------------------------
>  8647 configure                     4240 meson.build
>  1296 Makefile                      1970 configure                            
>   985 tests/Makefile.include         337 Makefile
>   440 rules.mak                      224 scripts/meson-buildoptions.py
>   379 scripts/tap-driver.pl          171 tests/Makefile.include
>   287 Makefile.target                129 scripts/nsis.py
>   263 tests/tcg/configure.sh         113 scripts/mtest2make.py
>   129 scripts/create_config           48 scripts/undefsym.py
> ~5500 various Makefile fragments   ~6500 various meson.build files
> --------------------------------------------------------------------------
> 17926 total                        13732 total

So after applying this series, at least on Fedora, I barely needed
configure at all, in so muc as the following successfully built AFAICT:

$ mkdir build
$ cat > build/config-host.mak <<EOF
all:
GIT=git
GIT_SUBMODULES=ui/keycodemapdb tests/fp/berkeley-testfloat-3 tests/fp/berkeley-softfloat-3 dtc
GIT_SUBMODULES_ACTION=update
CONFIG_POSIX=y
CONFIG_LINUX=y
SRC_PATH=/home/berrange/src/virt/qemu
TARGET_DIRS=x86_64-softmmu
CONFIG_PLUGIN=y
HAVE_GDB_BIN=/usr/bin/gdb
ENGINE=podman
ROMS=pc-bios/optionrom
MAKE=make
PYTHON=/usr/bin/python3 -B
GENISOIMAGE=/usr/bin/genisoimage
MESON=/usr/bin/meson
NINJA=/usr/bin/ninja
PKG_CONFIG=
CC=cc
EXESUF=
TCG_TESTS_TARGETS= x86_64-softmmu
EOF
$ meson build
$ ninja -C build

Out of the things in config-host.mak there, a few meson already knows,
like CC, SRC_PATH, 50% would be just a meson find_program() command,
a couple would need meson args (eg TARGET_DIRS), and some just look
redundant, eg CONFIG_LINUX largely duplicates __linux__, and
CONFIG_POSIX is effectively  !_WIN32.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


