Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F08508BEC
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 17:18:26 +0200 (CEST)
Received: from localhost ([::1]:54068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhC66-0007R8-2g
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 11:18:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nhBsm-00020S-83
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 11:04:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52809)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nhBsk-0003yw-6j
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 11:04:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650467077;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=46KrGqWF/s1E924aBvGAsjMZwFmVptuuRBcgtmLmCQw=;
 b=HPUeo1XO0vXI7e5H7aqncAz03PqCYq1hJODmgmSKfwiNXfXfsOhPmSbl03fSQV5vSAcVAG
 X+3X4W/IhXyl4kzEOaYSjAIYWepKjJRxnQqmYNsUWaKmypmc3e/77qqdPKgYhF9sHKaZaj
 +b4YIRk28JAFP1kG2JgdgZd12CtB5hU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-172-9vpHocPJOpKBxh3ncq-eWQ-1; Wed, 20 Apr 2022 11:04:34 -0400
X-MC-Unique: 9vpHocPJOpKBxh3ncq-eWQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 607AE18A6583;
 Wed, 20 Apr 2022 15:04:33 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.162])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 38B60C44AE1;
 Wed, 20 Apr 2022 15:04:30 +0000 (UTC)
Date: Wed, 20 Apr 2022 16:04:27 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: marcandre.lureau@redhat.com
Subject: Re: [PATCH 06/41] include: rename qemu-common.h qemu/copyright.h
Message-ID: <YmAg+9GExN7wn6Yb@redhat.com>
References: <20220420132624.2439741-1-marcandre.lureau@redhat.com>
 <20220420132624.2439741-7-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220420132624.2439741-7-marcandre.lureau@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>, Kyle Evans <kevans@freebsd.org>,
 qemu-devel@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 "open list:virtiofs" <virtio-fs@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Akihiko Odaki <akihiko.odaki@gmail.com>,
 Michael Roth <michael.roth@amd.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>, Warner Losh <imp@bsdimp.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Apr 20, 2022 at 05:25:49PM +0400, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>

Could use a commit message explaining why this is a good
idea.

I see it contains QEMU_COPYRIGHT macro, but it also then
contains QEMU_HELP_BOTTOM which is about bug reporting
not copyright.

IMHO something like 'qemu-cli.h' could be a better match

> 
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>  include/{qemu-common.h => qemu/copyright.h} | 0
>  bsd-user/main.c                             | 2 +-
>  linux-user/main.c                           | 2 +-
>  qemu-img.c                                  | 2 +-
>  qemu-io.c                                   | 2 +-
>  qemu-nbd.c                                  | 2 +-
>  qga/main.c                                  | 2 +-
>  scsi/qemu-pr-helper.c                       | 2 +-
>  softmmu/vl.c                                | 2 +-
>  storage-daemon/qemu-storage-daemon.c        | 2 +-
>  tools/virtiofsd/passthrough_ll.c            | 2 +-
>  ui/cocoa.m                                  | 2 +-
>  12 files changed, 11 insertions(+), 11 deletions(-)
>  rename include/{qemu-common.h => qemu/copyright.h} (100%)
> 
> diff --git a/include/qemu-common.h b/include/qemu/copyright.h
> similarity index 100%
> rename from include/qemu-common.h
> rename to include/qemu/copyright.h
> diff --git a/bsd-user/main.c b/bsd-user/main.c
> index 88d347d05ebf..aaab3f278534 100644
> --- a/bsd-user/main.c
> +++ b/bsd-user/main.c
> @@ -24,7 +24,7 @@
>  #include <sys/sysctl.h>
>  
>  #include "qemu/osdep.h"
> -#include "qemu-common.h"
> +#include "qemu/copyright.h"
>  #include "qemu/units.h"
>  #include "qemu/accel.h"
>  #include "sysemu/tcg.h"
> diff --git a/linux-user/main.c b/linux-user/main.c
> index fbc9bcfd5f5f..744d216b1e8e 100644
> --- a/linux-user/main.c
> +++ b/linux-user/main.c
> @@ -18,7 +18,7 @@
>   */
>  
>  #include "qemu/osdep.h"
> -#include "qemu-common.h"
> +#include "qemu/copyright.h"
>  #include "qemu/units.h"
>  #include "qemu/accel.h"
>  #include "sysemu/tcg.h"
> diff --git a/qemu-img.c b/qemu-img.c
> index 116e05867558..a2b1d3653a1e 100644
> --- a/qemu-img.c
> +++ b/qemu-img.c
> @@ -25,7 +25,7 @@
>  #include "qemu/osdep.h"
>  #include <getopt.h>
>  
> -#include "qemu-common.h"
> +#include "qemu/copyright.h"
>  #include "qemu/qemu-progress.h"
>  #include "qemu-version.h"
>  #include "qapi/error.h"
> diff --git a/qemu-io.c b/qemu-io.c
> index eb8afc8b413b..952a36643b0c 100644
> --- a/qemu-io.c
> +++ b/qemu-io.c
> @@ -15,7 +15,7 @@
>  #include <termios.h>
>  #endif
>  
> -#include "qemu-common.h"
> +#include "qemu/copyright.h"
>  #include "qapi/error.h"
>  #include "qemu-io.h"
>  #include "qemu/error-report.h"
> diff --git a/qemu-nbd.c b/qemu-nbd.c
> index 713e7557a9eb..f4d121c0c40e 100644
> --- a/qemu-nbd.c
> +++ b/qemu-nbd.c
> @@ -21,7 +21,7 @@
>  #include <libgen.h>
>  #include <pthread.h>
>  
> -#include "qemu-common.h"
> +#include "qemu/copyright.h"
>  #include "qapi/error.h"
>  #include "qemu/cutils.h"
>  #include "sysemu/block-backend.h"
> diff --git a/qga/main.c b/qga/main.c
> index ac63d8e47802..8994f73e4735 100644
> --- a/qga/main.c
> +++ b/qga/main.c
> @@ -18,7 +18,7 @@
>  #include <syslog.h>
>  #include <sys/wait.h>
>  #endif
> -#include "qemu-common.h"
> +#include "qemu/copyright.h"
>  #include "qapi/qmp/json-parser.h"
>  #include "qapi/qmp/qdict.h"
>  #include "qapi/qmp/qjson.h"
> diff --git a/scsi/qemu-pr-helper.c b/scsi/qemu-pr-helper.c
> index f281daeced8d..e7549ffb3bc9 100644
> --- a/scsi/qemu-pr-helper.c
> +++ b/scsi/qemu-pr-helper.c
> @@ -36,7 +36,7 @@
>  #include <mpath_persist.h>
>  #endif
>  
> -#include "qemu-common.h"
> +#include "qemu/copyright.h"
>  #include "qapi/error.h"
>  #include "qemu/cutils.h"
>  #include "qemu/main-loop.h"
> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index 46aba6a039c4..b0bf16e16aaa 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -23,7 +23,7 @@
>   */
>  
>  #include "qemu/osdep.h"
> -#include "qemu-common.h"
> +#include "qemu/copyright.h"
>  #include "qemu/datadir.h"
>  #include "qemu/units.h"
>  #include "exec/cpu-common.h"
> diff --git a/storage-daemon/qemu-storage-daemon.c b/storage-daemon/qemu-storage-daemon.c
> index eb724072579a..a4415e8c995b 100644
> --- a/storage-daemon/qemu-storage-daemon.c
> +++ b/storage-daemon/qemu-storage-daemon.c
> @@ -42,7 +42,7 @@
>  #include "qapi/qmp/qstring.h"
>  #include "qapi/qobject-input-visitor.h"
>  
> -#include "qemu-common.h"
> +#include "qemu/copyright.h"
>  #include "qemu-version.h"
>  #include "qemu/config-file.h"
>  #include "qemu/error-report.h"
> diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
> index 028dacdd8f5a..8af28f5fb823 100644
> --- a/tools/virtiofsd/passthrough_ll.c
> +++ b/tools/virtiofsd/passthrough_ll.c
> @@ -38,7 +38,7 @@
>  #include "qemu/osdep.h"
>  #include "qemu/timer.h"
>  #include "qemu-version.h"
> -#include "qemu-common.h"
> +#include "qemu/copyright.h"
>  #include "fuse_virtio.h"
>  #include "fuse_log.h"
>  #include "fuse_lowlevel.h"
> diff --git a/ui/cocoa.m b/ui/cocoa.m
> index 839ae4f58a69..a2a74656fabf 100644
> --- a/ui/cocoa.m
> +++ b/ui/cocoa.m
> @@ -27,7 +27,7 @@
>  #import <Cocoa/Cocoa.h>
>  #include <crt_externs.h>
>  
> -#include "qemu-common.h"
> +#include "qemu/copyright.h"
>  #include "qemu-main.h"
>  #include "ui/clipboard.h"
>  #include "ui/console.h"
> -- 
> 2.35.1.693.g805e0a68082a
> 
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


