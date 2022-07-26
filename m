Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AF2E580F5F
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 10:46:56 +0200 (CEST)
Received: from localhost ([::1]:34692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGGDO-0006lO-VG
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 04:46:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oGGBA-0004nJ-2L
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 04:44:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40056)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oGGB6-0008Cx-EI
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 04:44:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658825071;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jqedxUlUnrbHMRPpLrfcDt66W0YkSUCxzzENrK/g79s=;
 b=Tub0pS7jsMEyrRxaY2cCSO2Cl3+CEST0NGtfv1VoiJPACAmc/h1x9t1lkRgxnHPHLGSxqu
 gOPnCvuej+se/vTOWxt9Tm4HIew/mFLrIch6/KhVd/jNBQL1o6841lkgivc9f1cc25VxS8
 +OjQNjoyqC92cLrWzjS8Urcm+y887Ro=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-333-D5htmdXaNN-GkSXaR85Hjw-1; Tue, 26 Jul 2022 04:44:30 -0400
X-MC-Unique: D5htmdXaNN-GkSXaR85Hjw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1CC9C1C06ED5
 for <qemu-devel@nongnu.org>; Tue, 26 Jul 2022 08:44:30 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.211])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 01972400F8F0;
 Tue, 26 Jul 2022 08:44:27 +0000 (UTC)
Date: Tue, 26 Jul 2022 09:44:25 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org,
 "reviewer:Incompatible changes" <libvir-list@redhat.com>,
 kraxel@redhat.com, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] RFC: char: deprecate usage of bidirectional pipe
Message-ID: <Yt+pabvylcNdh0wL@redhat.com>
References: <20220726083232.2567756-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220726083232.2567756-1-marcandre.lureau@redhat.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jul 26, 2022 at 12:32:32PM +0400, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> As Ed Swierk explained back in 2006:
> https://lists.nongnu.org/archive/html/qemu-devel/2006-12/msg00160.html
> 
> "When qemu writes into the pipe, it immediately reads back what it just
> wrote and treats it as a monitor command, endlessly breathing its own
> exhaust."
> 
> This is similarly confusing when using the chardev with a serial device,
> as reported in https://bugzilla.redhat.com/show_bug.cgi?id=2106975.
> 
> It seems we have kept the support for bidirectional pipes for historical
> reasons and odd systems, however it's not documented in qemu -chardev
> options. I suggest to stop supporting it, for portability reasons.

Hmm, I always assumed that in this scenario the pipe was operating
in output-only mode. Obviously not the case with the code as it
exists, but perhaps this would be useful ?  eg its good as a serial
console logging mechanism at least.

> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>  docs/about/deprecated.rst | 6 ++++++
>  chardev/char-pipe.c       | 4 ++++
>  2 files changed, 10 insertions(+)
> 
> diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
> index 7ee26626d5cf..dd5ca30d527b 100644
> --- a/docs/about/deprecated.rst
> +++ b/docs/about/deprecated.rst
> @@ -45,6 +45,12 @@ transmit audio through the VNC protocol.
>  ``tty`` and ``parport`` are aliases that will be removed. Instead, the
>  actual backend names ``serial`` and ``parallel`` should be used.
>  
> +``-chardev pipe`` support for bidirectional pipes (since 7.1)
> +''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
> +
> +For portability reasons, the support for bidirectional ``pipe`` will
> +be removed. Instead, use ``file.in`` & ``file.out`` unidirectional pipes.
> +
>  Short-form boolean options (since 6.0)
>  ''''''''''''''''''''''''''''''''''''''
>  
> diff --git a/chardev/char-pipe.c b/chardev/char-pipe.c
> index 66d3b8509183..7db963035e7d 100644
> --- a/chardev/char-pipe.c
> +++ b/chardev/char-pipe.c
> @@ -27,6 +27,7 @@
>  #include "qemu/main-loop.h"
>  #include "qemu/module.h"
>  #include "qemu/option.h"
> +#include "qemu/error-report.h"
>  #include "chardev/char.h"
>  
>  #ifdef _WIN32
> @@ -142,6 +143,9 @@ static void qemu_chr_open_pipe(Chardev *chr,
>          if (fd_out >= 0) {
>              close(fd_out);
>          }
> +        warn_report("Support for bidirectional pipe is deprecated,");
> +        warn_report("please use portable one-way pipes instead (%s.in & %s.out).",
> +                    filename, filename);
>          TFR(fd_in = fd_out = qemu_open_old(filename, O_RDWR | O_BINARY));
>          if (fd_in < 0) {
>              error_setg_file_open(errp, errno, filename);
> -- 
> 2.37.0.rc0
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


