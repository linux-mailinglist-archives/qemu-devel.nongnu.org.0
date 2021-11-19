Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 187A1456C5B
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 10:30:18 +0100 (CET)
Received: from localhost ([::1]:58304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo0Dp-0007MM-8D
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 04:30:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mo02w-0000Vt-Rj
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 04:19:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25334)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mo02u-0004EG-74
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 04:19:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637313539;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FzE95J34nOogUHBGEv7y8h2se2CbRNPn7EDoYI09n9Y=;
 b=iOypme2iTXgQIt7ysWLtf56oq1JE/efLQzOmYxX5AXUZJUckivbtIeUH6gQy0onkFSQeYA
 j6w5DErSV8ADxNBl0XsVNYh8YOyp3l/WywQPA1T5Ka3xwgXxgkTyNIS4Khh0fS2dR0t9gj
 Ig7WA+m4p5R8nwFpypwP3J6fsJQBxfA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-49-Zdo8efZgOuaNd2iIA63wEg-1; Fri, 19 Nov 2021 04:18:56 -0500
X-MC-Unique: Zdo8efZgOuaNd2iIA63wEg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D691C9F931;
 Fri, 19 Nov 2021 09:18:54 +0000 (UTC)
Received: from [10.39.194.192] (unknown [10.39.194.192])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7020210016F4;
 Fri, 19 Nov 2021 09:18:45 +0000 (UTC)
Message-ID: <3fa0e1e3-43a3-f3d3-5dd3-d40bbafb0e69@redhat.com>
Date: Fri, 19 Nov 2021 10:18:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 for-6.2] meson.build: Support ncurses on MacOS and
 OpenBSD
To: Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Brad Smith <brad@comstyle.com>
References: <20211117205355.1392292-1-sw@weilnetz.de>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20211117205355.1392292-1-sw@weilnetz.de>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.727, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/17/21 21:53, Stefan Weil wrote:
> MacOS provides header files for curses 5.7 with support
> for wide characters, but requires _XOPEN_SOURCE_EXTENDED=1
> to activate that.
> 
> By default those old header files are used even if there
> is a newer Homebrew installation of ncurses 6.2 available.
> 
> Change also the old macro definition of NCURSES_WIDECHAR
> and set it to 1 like it is done in newer versions of
> curses.h when _XOPEN_SOURCE_EXTENDED=1 is defined.
> 
> OpenBSD has the same version of ncurses and needs the same fix.
> 
> Suggested-by: Daniel P. Berrangé <berrange@redhat.com>
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---

Queued, thanks.

Paolo

> v2:
> - Only define _XOPEN_SOURCE_EXTENDED when curses.h is used.
> - Extended to fix OpenBSD, too (untested!)
> 
>   meson.build | 5 ++++-
>   ui/curses.c | 4 ++++
>   2 files changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/meson.build b/meson.build
> index e2d38a43e6..16b3f748f4 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -681,6 +681,9 @@ iconv = not_found
>   curses = not_found
>   if have_system and not get_option('curses').disabled()
>     curses_test = '''
> +    #if defined(__APPLE__) || defined(__OpenBSD__)
> +    #define _XOPEN_SOURCE_EXTENDED 1
> +    #endif
>       #include <locale.h>
>       #include <curses.h>
>       #include <wchar.h>
> @@ -704,7 +707,7 @@ if have_system and not get_option('curses').disabled()
>       endif
>     endforeach
>     msg = get_option('curses').enabled() ? 'curses library not found' : ''
> -  curses_compile_args = ['-DNCURSES_WIDECHAR']
> +  curses_compile_args = ['-DNCURSES_WIDECHAR=1']
>     if curses.found()
>       if cc.links(curses_test, args: curses_compile_args, dependencies: [curses])
>         curses = declare_dependency(compile_args: curses_compile_args, dependencies: [curses])
> diff --git a/ui/curses.c b/ui/curses.c
> index e4f9588c3e..861d63244c 100644
> --- a/ui/curses.c
> +++ b/ui/curses.c
> @@ -38,6 +38,10 @@
>   #include "ui/input.h"
>   #include "sysemu/sysemu.h"
>   
> +#if defined(__APPLE__) || defined(__OpenBSD__)
> +#define _XOPEN_SOURCE_EXTENDED 1
> +#endif
> +
>   /* KEY_EVENT is defined in wincon.h and in curses.h. Avoid redefinition. */
>   #undef KEY_EVENT
>   #include <curses.h>
> 


