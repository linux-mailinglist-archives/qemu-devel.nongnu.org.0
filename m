Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C43113510DF
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 10:30:41 +0200 (CEST)
Received: from localhost ([::1]:52752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRsit-0000HP-LP
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 04:30:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lRsgn-0007TD-LF
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 04:28:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58791)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lRsgk-0008Oe-6C
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 04:28:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617265704;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=94VmdTYFROzON/xP74H1knomA32jh8AvedhQ1RoNrHI=;
 b=JrhPXFHCxz9yjkn2tNDarUR5aP7eMA/A7CCe8Zy8YS9kLCT3q8b+4GsKyFMNIkNP5WJAL0
 dF8HBt7sPFagF65UgNn+RDz3neRl8UPUUmLi0hHldxw9l8JzEYz6q0jtFl5m0d2sOzzrQ7
 SW8bQo0uUzKmMbKq8UWJvDE7o8lDBCA=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-172-7BMNe1TBPi-OU92wVgHFXQ-1; Thu, 01 Apr 2021 04:28:22 -0400
X-MC-Unique: 7BMNe1TBPi-OU92wVgHFXQ-1
Received: by mail-ej1-f71.google.com with SMTP id r26so1911976eja.22
 for <qemu-devel@nongnu.org>; Thu, 01 Apr 2021 01:28:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=94VmdTYFROzON/xP74H1knomA32jh8AvedhQ1RoNrHI=;
 b=SsNO84oyvZtgAEt43NnrBvPKLAACIG5hbsUnIZ5nAliTw2VgSM7EeyPQY+0bkx0HgJ
 fc8q30umESaXPYdEfXC6CRaIqwx9jBq5yy439CdP8PRl0z2MhEQDj/wngRi6OkvfAzwg
 KhTcCcfOZEfJ3wQ4qn51RzjcjEt1I5z1wcAUy5SKTY+FIhky9NGutwIYURmZqYciO2i9
 4PPEdy5H7AJYSuxoKvgWikOyq3KmdiP3J+OUxpUEAUQ2L0jBIj524e+xU/4lnLvjczbJ
 vHcDUuPIjg1sie9WWa2hpWHgzWnPbqhs4V/XnsG1YUyBpsllUkB5loiz8ffxu8vLokz1
 ty1Q==
X-Gm-Message-State: AOAM533p2SwiIVi1Y6/429DENc6D8zZfEWVFZbIXypLr8LmWH/Lt2HKs
 62g7Ul0Cok+dIo2mfwrCtSS6MKmg5F+pHb3w7hZTeNNvnVxr5ibteFJXFj3tZZpA8+um7JLdmPB
 SZ0xSvM/A71aitsM=
X-Received: by 2002:a05:6402:10c9:: with SMTP id
 p9mr8619985edu.268.1617265700901; 
 Thu, 01 Apr 2021 01:28:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzjor5urFWky2NNGcmh5egMzLelGFkkwL58pirze1/dJ4uKqx2kfXs/FJVXKIcytFatvEdJQA==
X-Received: by 2002:a05:6402:10c9:: with SMTP id
 p9mr8619972edu.268.1617265700660; 
 Thu, 01 Apr 2021 01:28:20 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id 90sm3626130edr.69.2021.04.01.01.28.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Apr 2021 01:28:20 -0700 (PDT)
Subject: Re: [PATCH v6 1/4] Add NVMM accelerator: configure and build logic
To: Reinoud Zandijk <reinoud@NetBSD.org>, qemu-devel@nongnu.org
References: <20210331200800.24168-1-reinoud@NetBSD.org>
 <20210331200800.24168-2-reinoud@NetBSD.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <5251852d-19ac-11d1-6343-6e1156d81f3e@redhat.com>
Date: Thu, 1 Apr 2021 10:28:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210331200800.24168-2-reinoud@NetBSD.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kamil Rytarowski <kamil@NetBSD.org>, Ryo ONODERA <ryoon@netbsd.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 31/03/21 22:07, Reinoud Zandijk wrote:
> Signed-off-by: Reinoud Zandijk <reinoud@NetBSD.org>
> Signed-off-by: Kamil Rytarowski <kamil@NetBSD.org>

Incorrect order for the S-o-b headers, you should be last.

> ---
> @@ -886,7 +887,7 @@ for opt do
>     ;;
>     --python=*) python="$optarg" ; explicit_python=yes
>     ;;
> -  --sphinx-build=*) sphinx_build="$optarg"
> +  --sphinx-build-3.8-3.8=*) sphinx_build="$optarg"

Oops. :)  Another occurrence later.

> diff --git a/meson.build b/meson.build
> index c6f4b0cf5e..e33face775 100644
> --- a/meson.build
> +++ b/meson.build

The meson.build parts can be simplified by applying this patch:

diff --git a/meson.build b/meson.build
index e33face775..c4600a46a6 100644
--- a/meson.build
+++ b/meson.build
@@ -171,7 +171,7 @@ version_res = []
  coref = []
  iokit = []
  emulator_link_args = []
-nvmm = []
+nvmm = not_found
  hvf = not_found
  if targetos == 'windows'
    socket = cc.find_library('ws2_32')
@@ -197,12 +197,6 @@ elif targetos == 'openbsd'
      # Disable OpenBSD W^X if available
      emulator_link_args = 
cc.get_supported_link_arguments('-Wl,-z,wxneeded')
    endif
-elif targetos == 'netbsd'
-  if not get_option('nvmm').disabled()
-    if cc.has_header('nvmm.h')
-      nvmm = cc.find_library('nvmm')
-    endif
-  endif
  endif

  accelerators = []
@@ -235,8 +229,11 @@ if not get_option('hax').disabled()
      accelerators += 'CONFIG_HAX'
    endif
  endif
-if not get_option('nvmm').disabled()
+if targetos == 'netbsd'
    if cc.has_header('nvmm.h', required: get_option('nvmm'))
+    nvmm = cc.find_library('nvmm', required: get_option('nvmm'))
+  endif
+  if nvmm.found()
      accelerators += 'CONFIG_NVMM'
    endif
  endif
@@ -2242,7 +2239,7 @@ foreach target : target_dirs
        'name': 'qemu-system-' + target_name,
        'gui': false,
        'sources': files('softmmu/main.c'),
-      'dependencies': [nvmm]
+      'dependencies': []
      }]
      if targetos == 'windows' and (sdl.found() or gtk.found())
        execs += [{


> @@ -607,7 +623,7 @@ if have_system and not get_option('curses').disabled()
>         has_curses_h = cc.has_header('curses.h', args: curses_compile_args)
>       endif
>       if has_curses_h
> -      curses_libname_list = (targetos == 'windows' ? ['pdcurses'] : ['ncursesw', 'cursesw'])
> +      curses_libname_list = (targetos == 'windows' ? ['pdcurses'] : ['ncursesw', 'cursesw', 'curses'])
>         foreach curses_libname : curses_libname_list
>           libcurses = cc.find_library(curses_libname,
>                                       required: false,
> @@ -625,7 +641,7 @@ if have_system and not get_option('curses').disabled()
>       endif
>     endif
>     if not get_option('iconv').disabled()
> -    foreach link_args : [ ['-liconv'], [] ]
> +    foreach link_args : [ [], ['-liconv'] ]
>         # Programs will be linked with glib and this will bring in libiconv on FreeBSD.
>         # We need to use libiconv if available because mixing libiconv's headers with
>         # the system libc does not work.

Independent changes, should be posted separately.

> @@ -2226,7 +2242,7 @@ foreach target : target_dirs
>         'name': 'qemu-system-' + target_name,
>         'gui': false,
>         'sources': files('softmmu/main.c'),
> -      'dependencies': []
> +      'dependencies': [nvmm]
>       }]
>       if targetos == 'windows' and (sdl.found() or gtk.found())
>         execs += [{

Not needed yet, should be added together with the nvmm sources to the 
sourceset.

Paolo


