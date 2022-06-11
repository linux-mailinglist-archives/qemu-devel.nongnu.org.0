Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 449DF54707B
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Jun 2022 02:18:14 +0200 (CEST)
Received: from localhost ([::1]:39714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzopQ-0006kv-Gx
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 20:18:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nzooE-00063N-32
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 20:16:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35033)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nzonu-0004I1-WA
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 20:16:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654906585;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=/z0G3M4mhEH7+er2aHzhEHJ+xm4bTW6B7HJe4kSgnN0=;
 b=HadVGJ2YyCVcSAmcaoEf0NPHVtC+9v+lLUiXLWPGyD59HkobMJigd9uwB1OAoxEyX3fpGj
 FFDEACdMPAFAJKT1nbID73MCkMgJaVP95+WVnwTIIhtwNL+TIGQcUIahZKKX2m/g1VBAb+
 Bqc7w3SJcbLxESa5807hy0kMUxPSDKg=
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-553-k8qOSJAMP42fDmICZHWuMw-1; Fri, 10 Jun 2022 20:16:23 -0400
X-MC-Unique: k8qOSJAMP42fDmICZHWuMw-1
Received: by mail-vk1-f198.google.com with SMTP id
 p129-20020a1fa687000000b00356d94ba0a5so29684vke.6
 for <qemu-devel@nongnu.org>; Fri, 10 Jun 2022 17:16:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=/z0G3M4mhEH7+er2aHzhEHJ+xm4bTW6B7HJe4kSgnN0=;
 b=B8dQwyp9USsET5uH8AoCdYuAC+pjdc0nM5Bc3MObcvkRAyB9rmxcyPvdlJawjZnmd8
 Pr16E7ufPoNsE9XOPfZ96k4F2FEtcXgkVhRQd/tMONAecsEfBb4rCKsW86C1YBRowNaY
 FZjvbaqti6OvKCEJB/mpFLUx+o7k3LX/WxM/VN+fjUFkEcLYcNpWTP2BY11laBWGUbVc
 W7GfsrMYAmBAb/R7eRJVUwF7t8x82/pwIWyL6cL3CEgtugjmtPIHXyq0pE9rNFmMWQL5
 hkM4Tl5ijlpT7pK5jOjLOoi7UjxlnzNl3dNhB+FtNAnt7SO9yQvDq3Gh7/14EeZXReQJ
 K6Zw==
X-Gm-Message-State: AOAM533Ly+ZDf8wHlGk++Ko7v6YNFBWkcTojPAqAskSiTXpmLKyH0xCc
 Z2fh2X4BKRXamN144H0ziAvxiRUHEkLYT+xvCbEcJWRc64CBlzA8rbbtjB06CxPw8sJ42bpYXfc
 nCXelPrxhK9d8HdsFH2JnzIwbIeYo6xI=
X-Received: by 2002:a67:d094:0:b0:34a:c990:cf78 with SMTP id
 s20-20020a67d094000000b0034ac990cf78mr20731507vsi.11.1654906583271; 
 Fri, 10 Jun 2022 17:16:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwSMltRNNIgK6zpKcSFOmD8Q87X9HmHfB299LSSZfcQKkGHUOJvJukQlSZHXH+H+NVDNO8mv+piYhEKITm/xks=
X-Received: by 2002:a67:d094:0:b0:34a:c990:cf78 with SMTP id
 s20-20020a67d094000000b0034ac990cf78mr20731501vsi.11.1654906583070; Fri, 10
 Jun 2022 17:16:23 -0700 (PDT)
MIME-Version: 1.0
From: John Snow <jsnow@redhat.com>
Date: Fri, 10 Jun 2022 20:16:12 -0400
Message-ID: <CAFn=p-bmPm7xA0R4r4RahWQmOMUd=zr4x5nEAnk4aCZHkPXiAA@mail.gmail.com>
Subject: vm-build-haiku.x86_64 failures
To: Alexander von Gluck IV <kallisti5@unixzen.com>
Cc: qemu-devel <qemu-devel@nongnu.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

on today's upstream of b3cd3b5a66f0dddfe3d5ba2bef13cd4f5b89cde9, I am
seeing failures with the Haiku VM building test:

FAILED: libqemuutil.a.p/util_cutils.c.o
cc -m64 -mcx16 -Ilibqemuutil.a.p -I. -I../src -Iqapi -Itrace -Iui
-Iui/shader -I/packages/glib2-2.68.4-2/.self/develop/headers
-I/packages/zlib-1.2.11-4/.self/develop/headers
-I/packages/libffi-3.4.2-1/.self/develop/headers
-I/packages/glib2-2.68.4-2/.self/develop/headers/glib-2.0
-I/packages/glib2-2.68.4-2/.self/develop/lib/glib-2.0/include
-I/packages/libpcre-8.45-2/.self/develop/headers
-I/packages/glib2-2.68.4-2/.self/develop/headers/gio-unix-2.0
-I/packages/gnutls-3.7.4-1/.self/develop/headers
-I/packages/nettle-3.7.3-1/.self/develop/headers
-I/packages/libtasn1-4.18.0-1/.self/develop/headers
-I/packages/libidn2-2.0.5-2/.self/develop/headers
-I/packages/p11_kit-0.23.18.1-2/.self/develop/headers/p11-kit-1
-I/packages/pixman-0.38.4-1/.self/develop/headers/pixman-1
-fdiagnostics-color=auto -Wall -Winvalid-pch -std=gnu11 -O2 -g -iquote
. -iquote /boot/system/cache/tmp/qemu-test.ivmase/src -iquote
/boot/system/cache/tmp/qemu-test.ivmase/src/include -iquote
/boot/system/cache/tmp/qemu-test.ivmase/src/disas/libvixl -iquote
/boot/system/cache/tmp/qemu-test.ivmase/src/tcg/i386 -U_FORTIFY_SOURCE
-D_FORTIFY_SOURCE=2 -DB_USE_POSITIVE_POSIX_ERRORS -D_BSD_SOURCE -fPIC
-D_GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE
-Wstrict-prototypes -Wredundant-decls -Wundef -Wwrite-strings
-Wmissing-prototypes -fno-strict-aliasing -fno-common -fwrapv
-Wold-style-declaration -Wold-style-definition -Wtype-limits
-Wformat-security -Wformat-y2k -Winit-self -Wignored-qualifiers
-Wempty-body -Wnested-externs -Wendif-labels -Wexpansion-to-defined
-Wimplicit-fallthrough=2 -Wno-missing-include-dirs
-Wno-shift-negative-value -Wno-psabi -fstack-protector-strong -MD -MQ
libqemuutil.a.p/util_cutils.c.o -MF libqemuutil.a.p/util_cutils.c.o.d
-o libqemuutil.a.p/util_cutils.c.o -c ../src/util/cutils.c
../src/util/cutils.c: In function 'qemu_init_exec_dir':
../src/util/cutils.c:1019:9: error: unknown type name 'image_info';
did you mean 'g_info'?
 1019 |         image_info ii;
      |         ^~~~~~~~~~
      |         g_info
../src/util/cutils.c:1023:16: warning: implicit declaration of
function 'get_next_image_info' [-Wimplicit-function-declaration]
 1023 |         while (get_next_image_info(0, &c, &ii) == B_OK) {
      |                ^~~~~~~~~~~~~~~~~~~
../src/util/cutils.c:1023:16: warning: nested extern declaration of
'get_next_image_info' [-Wnested-externs]
../src/util/cutils.c:1024:19: error: request for member 'type' in
something not a structure or union
 1024 |             if (ii.type == B_APP_IMAGE) {
      |                   ^
../src/util/cutils.c:1024:28: error: 'B_APP_IMAGE' undeclared (first
use in this function)
 1024 |             if (ii.type == B_APP_IMAGE) {
      |                            ^~~~~~~~~~~
../src/util/cutils.c:1024:28: note: each undeclared identifier is
reported only once for each function it appears in
../src/util/cutils.c:1025:32: error: request for member 'name' in
something not a structure or union
 1025 |                 strncpy(buf, ii.name, sizeof(buf));
      |                                ^
[596/6467] Compiling C object libqemuutil.a.p/util_aio-posix.c.o
[597/6467] Compiling C object libqemuutil.a.p/qobject_block-qdict.c.o
[598/6467] Compiling C object libqemuutil.a.p/util_osdep.c.o
[599/6467] Compiling C object libqemuutil.a.p/qobject_json-streamer.c.o
[600/6467] Compiling C object libqemuutil.a.p/qobject_json-lexer.c.o
[601/6467] Compiling C object libqemuutil.a.p/qobject_json-parser.c.o
[602/6467] Compiling C object libqemuutil.a.p/qobject_qobject.c.o
[603/6467] Compiling C object libqemuutil.a.p/qobject_json-writer.c.o
[604/6467] Compiling C object libqemuutil.a.p/qobject_qjson.c.o
[605/6467] Compiling C object libqemuutil.a.p/qobject_qbool.c.o
[606/6467] Compiling C object libqemuutil.a.p/qobject_qlit.c.o
[607/6467] Compiling C object libqemuutil.a.p/qobject_qstring.c.o
[608/6467] Compiling C object libqemuutil.a.p/qobject_qlist.c.o
[609/6467] Compiling C object libqemuutil.a.p/qobject_qnull.c.o
[610/6467] Compiling C object libqemuutil.a.p/qobject_qnum.c.o
[611/6467] Compiling C object libqemuutil.a.p/qapi_qmp-registry.c.o
[612/6467] Compiling C object libqemuutil.a.p/qobject_qdict.c.o
ninja: build stopped: subcommand failed.
Makefile:162: recipe for target 'run-ninja' failed
make: *** [run-ninja] Error 1
make: *** [/home/nago/src/qemu/tests/vm/Makefile.include:106:
vm-build-haiku.x86_64] Error 3

I can't seemingly get older versions of QEMU to build right now in
order to do a bisect, and I can't find a version of the QEMU tree
where this test actually works.

Alexander, do you have any information on this test right now?

--js


