Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6103D5ADB07
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 00:00:07 +0200 (CEST)
Received: from localhost ([::1]:42758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVK8T-0007Nh-PQ
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 18:00:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oVK7K-00062O-11
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 17:58:54 -0400
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b]:41824)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oVK7I-00014k-1q
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 17:58:53 -0400
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-334dc616f86so79748137b3.8
 for <qemu-devel@nongnu.org>; Mon, 05 Sep 2022 14:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=4bOPDayyae1tSKPPcZYxk3k38KlvnZtnMYBArJXg/M0=;
 b=ioA1IaCaC5JgMCE4mGEFTFCtttwmy7ibbplZp446k4tFXAGhcHpfQke37iLIYa6Vkv
 E/cVBTe5C43tuxdIzm5UhGLy9XD5F1KlXRZGVAz46Vqvf8/yMnmg3n5OGHsK5FzovFFt
 3dY0JfOVkrS/d0tCnCchoR6otrrvk7GnChvlBXgaMR8nNKME7DUQHqk2nTXp5P8onMcT
 Ft6kH/dh8nqGszo7vu+Yaa4EuI9vEDWICAYgvnNUb9OuwLHw4veHXp1a37ObjSpmikgm
 4K2pqFlzHmm4K7SOthx8qqHmGT+uYGynyVIYOUmCatQuk9pjn4bItp4snPgGWYUCrKOh
 KCEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=4bOPDayyae1tSKPPcZYxk3k38KlvnZtnMYBArJXg/M0=;
 b=zYeBRP6JFxv23ayaxZOOOfIdPleBkYSL6e2EkE9seRotSe0f1q3cFYqDOlPsWwDvlo
 /m7SuzPoBKc1XJVpIhbnPomaxkRGCVYvqyTK+FsRJUZFgnzK7pgIQwcdyYQjEOEiGt7B
 ipO2n+yLB7lzNQAzhEYpwfGaBPLDJ7r7koJ9FnuhqW5s0ssPMYae/TbMQ280A0044+JS
 /SHP/yrUHB4R52zK7DhR4NMSh5Vo1iWds+u2H46BoQgdw7OCM5n2ZVFP84lM7r9z6DUE
 YGhUTGlkZVBzUoTECRDhstP4AICAQBLAe11TYj872XPZ3ieaTso6XNMIcS9FJ2Wzc/qk
 vmoQ==
X-Gm-Message-State: ACgBeo3v5GpTLpT9aGyHSq9bJhqo58PMsYI0jVlUXrT9N02TEbpiJ0Lx
 8rdrVqVOxUnyzyUgIcy6o8STD4xo5J0lVgZ7oy4=
X-Google-Smtp-Source: AA6agR4hv23qz7lvljWh5wuYkKG13wpIlGCxSBu74qCYFhF+rWmAGNgfAWOy3LbCezAwACVafG2chZrMSPKB2VRwCCs=
X-Received: by 2002:a81:6a54:0:b0:345:4292:4dfe with SMTP id
 f81-20020a816a54000000b0034542924dfemr5378863ywc.62.1662415130783; Mon, 05
 Sep 2022 14:58:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220904002317.60158-1-richard.henderson@linaro.org>
In-Reply-To: <20220904002317.60158-1-richard.henderson@linaro.org>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Mon, 5 Sep 2022 17:58:38 -0400
Message-ID: <CAJSP0QVBxkF1tQBetg8vtntppn=CduvDFHSGWapjAtq=XObsGA@mail.gmail.com>
Subject: Re: [PULL v2 00/20] tcg patch queue
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=stefanha@gmail.com; helo=mail-yw1-x112b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The tsan (clang) build is broken:
https://gitlab.com/qemu-project/qemu/-/jobs/2982480773

clang-10 -m64 -mcx16 -Ilibqemu-x86_64-linux-user.fa.p -I. -I..
-Itarget/i386 -I../target/i386 -I../common-user/host/x86_64
-I../linux-user/include/host/x86_64 -I../linux-user/include
-Ilinux-user -I../linux-user -Ilinux-user/x86_64
-I../linux-user/x86_64 -Iqapi -Itrace -Iui -Iui/shader
-I/usr/include/capstone -I/usr/include/glib-2.0
-I/usr/lib/x86_64-linux-gnu/glib-2.0/include -fcolor-diagnostics -Wall
-Winvalid-pch -Werror -std=gnu11 -O2 -g -isystem
/builds/qemu-project/qemu/linux-headers -isystem linux-headers -iquote
. -iquote /builds/qemu-project/qemu -iquote
/builds/qemu-project/qemu/include -iquote
/builds/qemu-project/qemu/tcg/i386 -pthread -fsanitize=thread
-D_GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE
-Wstrict-prototypes -Wredundant-decls -Wundef -Wwrite-strings
-Wmissing-prototypes -fno-strict-aliasing -fno-common -fwrapv
-Wold-style-definition -Wtype-limits -Wformat-security -Wformat-y2k
-Winit-self -Wignored-qualifiers -Wempty-body -Wnested-externs
-Wendif-labels -Wexpansion-to-defined -Wno-initializer-overrides
-Wno-missing-include-dirs -Wno-shift-negative-value
-Wno-string-plus-int -Wno-typedef-redefinition
-Wno-tautological-type-limit-compare -fstack-protector-strong -fPIE
-isystem../linux-headers -isystemlinux-headers -DNEED_CPU_H
'-DCONFIG_TARGET="x86_64-linux-user-config-target.h"'
'-DCONFIG_DEVICES="x86_64-linux-user-config-devices.h"' -MD -MQ
libqemu-x86_64-linux-user.fa.p/linux-user_elfload.c.o -MF
libqemu-x86_64-linux-user.fa.p/linux-user_elfload.c.o.d -o
libqemu-x86_64-linux-user.fa.p/linux-user_elfload.c.o -c
../linux-user/elfload.c
../linux-user/elfload.c:198:18: error: integer overflow in
preprocessor expression [-Werror]
#if ULONG_MAX >= TARGET_VSYSCALL_PAGE
^~~~~~~~~~~~~~~~~~~~
../target/i386/cpu.h:2386:47: note: expanded from macro 'TARGET_VSYSCALL_PAGE'
# define TARGET_VSYSCALL_PAGE (UINT64_C(-10) << 20)
~~~~~~~~~~~~~ ^ ~~

