Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A80783D96E5
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Jul 2021 22:39:29 +0200 (CEST)
Received: from localhost ([::1]:51908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8qKt-00082i-TF
	for lists+qemu-devel@lfdr.de; Wed, 28 Jul 2021 16:39:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m8qJf-0007CB-FT
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 16:38:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47930)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m8qJa-0007nY-VF
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 16:38:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627504684;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8QtIWw8IVScfzlsQ16y9dqVS02oXO0XEmVy61N+YY/I=;
 b=HXEfUQJ6vJQ/eYKABCbKGoFIwd67uU6r+A+ThbuPkB3T3ELM3qwF7UAddYd5MVhW4ataSh
 +rqIaU9U9uHde6sRJOJqYF8h1Fyqn4/Ms7DpxWB/Cry4Bgg0tVBFHOz46DQMNdAo16imX9
 eyCTRu5tuzG9a9xRwL3IitKYXHSdcAs=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-89-zcVo7NBGOnqRlzuock67QA-1; Wed, 28 Jul 2021 16:38:02 -0400
X-MC-Unique: zcVo7NBGOnqRlzuock67QA-1
Received: by mail-qk1-f197.google.com with SMTP id
 t191-20020a37aac80000b02903b9402486c5so2360599qke.13
 for <qemu-devel@nongnu.org>; Wed, 28 Jul 2021 13:38:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Fgf9sDHgBlCU3F2id1fTgaKA5jg4ZrKbs4svr0/v/qA=;
 b=E3qEmvaOelKA26PhvFTTDxS5EPrTPfkIt4fWHCmfzd+RdW0rIkHcZuAUiUP55cTeZg
 RuGj1TimL+lzWzGIc3r50XDqD235YQBX9F6F0/j/z5DjF1AXEl8fOhQDwH9lKz9Gd2cS
 Wbls/GZ6f35sLExSle123DWKO9vQtlUvZk047VUbNk8EYNarMqVlAbV1K+4Pb8VzKPMW
 NugD9NNUEFELu1TIHfBwkqq1d2gGL5yGMHeHmNfhrM0nRCCXLYBezV2tVtNLPZ1nJ7DH
 27hZ2TN52bJsaEAy4qAdng+D6kYoeOqP8Qte2vsjZyL0Da4UBnv+z+jEZcwdJhQ5yg32
 G53A==
X-Gm-Message-State: AOAM532sBP7ezKzs0pnV3rJs3BwzBZ2y5zo4uSB4f6bnr4LsYPtiisQ3
 UXVFlIdJ27e9M8+axGcVTeQbTGo7tfmdtORDL4tULJL+c836xEM+6GRx+Ask1lHOb/5qE/Nt3L/
 xBocvAL6JNUJcVf4=
X-Received: by 2002:a05:620a:5f6:: with SMTP id
 z22mr1591636qkg.195.1627504681879; 
 Wed, 28 Jul 2021 13:38:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyU5KUTfjH0RP3iVnJ10jIuCn05hkUndivNP/rXvVDAxnERR41mqOpaXyHFeDha/FGPfxwHDQ==
X-Received: by 2002:a05:620a:5f6:: with SMTP id
 z22mr1591624qkg.195.1627504681667; 
 Wed, 28 Jul 2021 13:38:01 -0700 (PDT)
Received: from t490s
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id a3sm375195qtx.56.2021.07.28.13.38.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jul 2021 13:38:00 -0700 (PDT)
Date: Wed, 28 Jul 2021 16:37:59 -0400
From: Peter Xu <peterx@redhat.com>
To: Richard Henderson <rth@twiddle.net>
Subject: Re: [PATCH v2 2/2] tests: migration-test: Add dirty ring test
Message-ID: <YQHAJy8lX0vt+yl2@t490s>
References: <20210615175523.439830-1-peterx@redhat.com>
 <20210615175523.439830-3-peterx@redhat.com>
 <9b93e149-3147-3dca-83ce-474af99ccd2e@twiddle.net>
MIME-Version: 1.0
In-Reply-To: <9b93e149-3147-3dca-83ce-474af99ccd2e@twiddle.net>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="5b3U+Rs2z0no4DFn"
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-devel@nongnu.org, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--5b3U+Rs2z0no4DFn
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Jul 28, 2021 at 09:37:48AM -1000, Richard Henderson wrote:
> On 6/15/21 7:55 AM, Peter Xu wrote:
> > Add dirty ring test if kernel supports it.  Add the dirty ring parameter on
> > source should be mostly enough, but let's change the dest too to make them
> > match always.
> > 
> > Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> > Signed-off-by: Peter Xu <peterx@redhat.com>
> > ---
> >   tests/qtest/migration-test.c | 58 ++++++++++++++++++++++++++++++++++--
> >   1 file changed, 55 insertions(+), 3 deletions(-)
> > 
> > diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
> > index d9225f58d4d..9ef6b471353 100644
> > --- a/tests/qtest/migration-test.c
> > +++ b/tests/qtest/migration-test.c
> > @@ -27,6 +27,10 @@
> >   #include "migration-helpers.h"
> >   #include "tests/migration/migration-test.h"
> > +#if defined(__linux__)
> > +#include "linux/kvm.h"
> > +#endif
> 
> This breaks the build for hosts that do not support kvm, e.g. sparc:
> 
> 
> [2/3] Compiling C object tests/qtest/migration-test.p/migration-test.c.o
> FAILED: tests/qtest/migration-test.p/migration-test.c.o
> cc -Itests/qtest/migration-test.p -Itests/qtest -I../qemu/tests/qtest -I.
> -Iqapi -Itrace -Iui -Iui/shader -I/usr/include/glib-2.0
> -I/usr/lib/sparc64-linux-gnu/glib-2.0/include -fdiagnostics-color=auto -pipe
> -Wall -Winvalid-pch -Werror -std=gnu11 -O2 -g -isystem
> /home/rth/qemu/qemu/linux-headers -isystem linux-headers -iquote . -iquote
> /home/rth/qemu/qemu -iquote /home/rth/qemu/qemu/include -iquote
> /home/rth/qemu/qemu/disas/libvixl -iquote /home/rth/qemu/qemu/tcg/sparc
> -pthread -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=2 -m64 -mcpu=ultrasparc
> -D_GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -Wstrict-prototypes
> -Wredundant-decls -Wundef -Wwrite-strings -Wmissing-prototypes
> -fno-strict-aliasing -fno-common -fwrapv -Wold-style-declaration
> -Wold-style-definition -Wtype-limits -Wformat-security -Wformat-y2k
> -Winit-self -Wignored-qualifiers -Wempty-body -Wnested-externs
> -Wendif-labels -Wexpansion-to-defined -Wimplicit-fallthrough=2
> -Wno-missing-include-dirs -Wno-shift-negative-value -Wno-psabi -fPIE -MD -MQ
> tests/qtest/migration-test.p/migration-test.c.o -MF
> tests/qtest/migration-test.p/migration-test.c.o.d -o
> tests/qtest/migration-test.p/migration-test.c.o -c
> ../qemu/tests/qtest/migration-test.c
> In file included from ../qemu/tests/qtest/migration-test.c:31:
> /home/rth/qemu/qemu/linux-headers/linux/kvm.h:15:10: fatal error: asm/kvm.h:
> No such file or directory
>    15 | #include <asm/kvm.h>
>       |          ^~~~~~~~~~~
> compilation terminated.

Hi, Richard,

Sorry for that.  It's very weird that linux/kvm.h exists for all archs while
it's not conditionally including asm/kvm.h only for the 5 supported archs, so
any user app trying to include linux/kvm.h will fail for the rest.

(while all references needed in this test is actually KVM_CHECK_EXTENSION,
 KVM_CAP_DIRTY_LOG_RING and both of them exist in linux/kvm.h not the asm one)

A quick fix attached; would that work for us?

Thanks,

-- 
Peter Xu

--5b3U+Rs2z0no4DFn
Content-Type: text/plain; charset=utf-8
Content-Disposition: attachment;
	filename="0001-tests-Fix-migration-test-build-failure-for-sparc.patch"

From 888ab46c44284738d222edc87e9fc86a49ae2f51 Mon Sep 17 00:00:00 2001
From: Peter Xu <peterx@redhat.com>
Date: Wed, 28 Jul 2021 16:32:00 -0400
Subject: [PATCH] tests: Fix migration-test build failure for sparc

Even if <linux/kvm.h> seems to exist for all archs on linux, however including
it with __linux__ defined seems to be not working yet as it'll try to include
asm/kvm.h and that can be missing for archs that do not support kvm.

To fix this (instead of any attempt to fix linux headers..), we can mark the
header to be x86_64 only, because it's so far only service for adding the kvm
dirty ring test.

Reported-by: Richard Henderson <rth@twiddle.net>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 tests/qtest/migration-test.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index 1e8b7784ef..cc5e83d98a 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -27,7 +27,8 @@
 #include "migration-helpers.h"
 #include "tests/migration/migration-test.h"
 
-#if defined(__linux__)
+/* For dirty ring test; so far only x86_64 is supported */
+#if defined(__linux__) && defined(HOST_X86_64)
 #include "linux/kvm.h"
 #endif
 
@@ -1395,7 +1396,7 @@ static void test_multifd_tcp_cancel(void)
 
 static bool kvm_dirty_ring_supported(void)
 {
-#if defined(__linux__)
+#if defined(__linux__) && defined(HOST_X86_64)
     int ret, kvm_fd = open("/dev/kvm", O_RDONLY);
 
     if (kvm_fd < 0) {
-- 
2.31.1


--5b3U+Rs2z0no4DFn--


