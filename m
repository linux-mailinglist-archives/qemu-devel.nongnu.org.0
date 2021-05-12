Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C088637B6F4
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 09:34:48 +0200 (CEST)
Received: from localhost ([::1]:45010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgjOJ-0000D7-BK
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 03:34:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lgjMQ-0007Be-6P
 for qemu-devel@nongnu.org; Wed, 12 May 2021 03:32:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30153)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lgjML-0002ct-3a
 for qemu-devel@nongnu.org; Wed, 12 May 2021 03:32:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620804764;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PSQhXjdBhsdbUY4niGzdrXD9LD3nc6hjpETsyRt7y+0=;
 b=I4d699o7yDVX356qCJUPYwGS8cVwiwRYAZQj8KgCcoEYu9MQ6582rygBVVMi8erqcWIuqd
 /t/89aPKXPK2n1gLjCU0vjlSoUzhkTQacHDjZK1ou/p2AKb7ZjB6ONVMi5NoiDE/jYe8TW
 ChjE9ZTNuTme2XOliB/6LV4kzA3jK74=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-553-waBmlrtfOwyQGPTvYfd6ZQ-1; Wed, 12 May 2021 03:32:42 -0400
X-MC-Unique: waBmlrtfOwyQGPTvYfd6ZQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 y17-20020a0564023591b02903886c26ada4so12369655edc.5
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 00:32:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PSQhXjdBhsdbUY4niGzdrXD9LD3nc6hjpETsyRt7y+0=;
 b=EOtNY1wlfoN+99ktbYZu0nwBe4iHhQ5eHF7fvjWuH90EIprREtA7Nf/Jey3RG4S50A
 6bWz0mfT/kESN+Qq1rpByqLx95+GSqicFDcnfT/7tJM+XudReZsrEjn9xW20jzFVmgIC
 jP5Cbi8NLLCpmH7Yk4hzuj54lbQXIHQMCNIdS3QEKJwItSxUXgWhKdminxgCyNZ/kJpw
 DVmqF8gITF7Dkm0deSdz6gpp8fh1t32x5TtkERt/pfUOhkFollbjruuhMc2wNOPVUM10
 jdcYi3N6QmzwOmo43KnWSq4+pp9WXXbHakE6Joc2bnRjzNkS7/SpmrQNkuNUaHQNqCpV
 5BYg==
X-Gm-Message-State: AOAM530m9E70ijv//YmRfwJu73CR8VxgeY8Fuao4Pl2fG30kot0IiOH3
 +m/cicPtR40M5zZ7UUqxv1Zo3oQ977z1mw7mBsBdrAbTU0huNpDqhck2kqzZVK2lSz9PTiC2kag
 bV76ElHpF+vqmBE4=
X-Received: by 2002:a17:906:4d02:: with SMTP id
 r2mr35850305eju.464.1620804761340; 
 Wed, 12 May 2021 00:32:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwSeodEZbym37+kWrYawdJeQPgcYSKTPW+AgCz9m1cJcU5cZhmD4Y48mRScEYAw5Mhk8NkXDQ==
X-Received: by 2002:a17:906:4d02:: with SMTP id
 r2mr35850276eju.464.1620804761056; 
 Wed, 12 May 2021 00:32:41 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id r10sm13601931ejd.112.2021.05.12.00.32.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 May 2021 00:32:40 -0700 (PDT)
Subject: Re: [RFC PATCH 5/5] meson: Do not use internal fdt library if user
 asked for the system one
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210511155354.3069141-1-philmd@redhat.com>
 <20210511155354.3069141-6-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <977f3fb8-3835-0cb3-aa73-bf4147a8ca58@redhat.com>
Date: Wed, 12 May 2021 09:32:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210511155354.3069141-6-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Thomas Huth <thuth@redhat.com>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 Greg Kurz <groug@kaod.org>, qemu-ppc@nongnu.org,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/05/21 17:53, Philippe Mathieu-Daudé wrote:
> diff --git a/meson.build b/meson.build
> index 0b41ff41188..1ffb4bccdb2 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1612,7 +1612,7 @@
>          int main(void) { fdt_check_full(NULL, 0); return 0; }''',
>            dependencies: fdt)
>         fdt_opt = 'system'
> -    elif have_internal
> +    elif have_internal and fdt_opt in ['enabled', 'auto']
>         fdt_opt = 'internal'
>       else

This will disable FDT silently for --enable-fdt=system instead of failing
the build.  What about:

diff --git a/meson.build b/meson.build
index 60040cd7cf..efb38ca780 100644
--- a/meson.build
+++ b/meson.build
@@ -1610,11 +1610,18 @@ if have_system
      fdt = cc.find_library('fdt', kwargs: static_kwargs,
                            required: fdt_opt == 'system' or
                                      fdt_opt == 'enabled' and not have_internal)
-    if fdt.found() and cc.links('''
+    if fdt.found() and not cc.links('''
         #include <libfdt.h>
         #include <libfdt_env.h>
         int main(void) { fdt_check_full(NULL, 0); return 0; }''',
           dependencies: fdt)
+      if fdt_opt == 'system' or
+         fdt_opt == 'enabled' and not have_internal then
+        error('libfdt is too old, version 1.5.1 required')
+      endif
+      fdt = not_found
+    endif
+    if fdt.found()
        fdt_opt = 'system'
      elif have_internal
        fdt_opt = 'internal'


Paolo


