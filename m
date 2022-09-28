Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F7CF5EE66D
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 22:08:58 +0200 (CEST)
Received: from localhost ([::1]:45652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oddMW-0007CM-UC
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 16:08:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oddHz-00047R-HW
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 16:04:15 -0400
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33]:39463)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oddHx-0002Nw-Hh
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 16:04:15 -0400
Received: by mail-yb1-xb33.google.com with SMTP id 65so9803128ybp.6
 for <qemu-devel@nongnu.org>; Wed, 28 Sep 2022 13:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=O2WN74zKX4XIf/UsDRlLzDiDXyKDU3VWes91m9J2Xxk=;
 b=Y41ZNPEGvUrt8MWGkF7WDNaDIGqqEkemwvqDCLjyZpFx5jVpKGFIqVj+novsbhtwMZ
 v5ScmukoZ7db2O6cyOCkfU5z7ilDa8SQWnxnfbrd7p9wQQz3ybvls7ts0C6z8YkoO3Z9
 70boiO+kycwc13/VS1HQlOlFoYwHhmk99BIGXa4zG7TSAhwnrmv9Q4HVcsco0hw6+zFC
 4POeddYsT/nS669Uu7CjGSLk62bBWHNGx+AnwWs2T70NZubw/PXEnlHCzpqQp95LAZqe
 uBcbg3mKLswCOWmn3of0uv3p0imaNv2r24E70hkYRU/Qc5+aC8+cuIroDCbzTMTiRbVU
 cWYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=O2WN74zKX4XIf/UsDRlLzDiDXyKDU3VWes91m9J2Xxk=;
 b=TQR4I4YW3bkRuy9H9kJbZQaI0yAYC2WMXLJV1DibaIxZJ3iE+fRPZQPogiyYSIT6j+
 I47QpJ5qQBvmTIN5JOEWujRYXmOI5Ht0qpz05SKzZSxzhdEsdSEkFTWoQrjwpBCx1GNq
 RNYD8tU1etAKH9ax+is9XOY9PPWDFJQeInbueEEHsFIes2bLKBCsmCpmYzgOQQHhKlc7
 Mi3DdMb4L02OjxPcaveYicOfeyLQUxF88TdI2xPEy4vvSAwDqVLkOou3a4c4uvTEykhd
 ZSvC5hujeIMdXDdKUO813APZl4llZyg/uOcPA3g1buctMLep3TAdUOiGduIvjv4HZb2N
 7Unw==
X-Gm-Message-State: ACrzQf31gsHPqAyhBcoT/Z6Juoyj8Gjn/UEy93/bwKhntHwwgjhMgp39
 wUPwZ0AQ6Jxnfqo0o8iG4jAtA7SKlxW1Q0cEQ4HZdn1cqSQ=
X-Google-Smtp-Source: AMsMyM6UDMRLWVek26xhQe+qyIOctsjs4oGhq1Bhdl8SSlc9Bq8aTmYI+8zdPsF0O45XueiWH7cwEv82H2hX+uBci/w=
X-Received: by 2002:a05:6902:1142:b0:6af:61be:ab53 with SMTP id
 p2-20020a056902114200b006af61beab53mr35447364ybu.118.1664395452076; Wed, 28
 Sep 2022 13:04:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220928081517.734954-1-laurent@vivier.eu>
In-Reply-To: <20220928081517.734954-1-laurent@vivier.eu>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Wed, 28 Sep 2022 16:04:00 -0400
Message-ID: <CAJSP0QV7A+w4WCsj7Gi=7532kO5d=Oc4SSLTcHx_1a2MOeUc3w@mail.gmail.com>
Subject: Re: [PULL 00/38] Linux user for 7.2 patches
To: Laurent Vivier <laurent@vivier.eu>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b33;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb33.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Laurent,
There is a build failure for hexagon linux-user. Please take a look (I
didn't verify whether it's caused by your pull request, but I think
the chance is high):

cc -m64 -mcx16 -Ilibqemu-hexagon-linux-user.fa.p -I. -I..
-Itarget/hexagon -I../target/hexagon -I../common-user/host/x86_64
-I../linux-user/include/host/x86_64 -I../linux-user/include
-Ilinux-user -I../linux-user -I../linux-user/hexagon -Iqapi -Itrace
-Iui/shader -I/usr/include/capstone -I/usr/include/glib-2.0
-I/usr/lib/x86_64-linux-gnu/glib-2.0/include -fdiagnostics-color=auto
-Wall -Winvalid-pch -Werror -std=gnu11 -O2 -g -isystem
/builds/qemu-project/qemu/linux-headers -isystem linux-headers -iquote
. -iquote /builds/qemu-project/qemu -iquote
/builds/qemu-project/qemu/include -iquote
/builds/qemu-project/qemu/tcg/i386 -pthread -U_FORTIFY_SOURCE
-D_FORTIFY_SOURCE=2 -D_GNU_SOURCE -D_FILE_OFFSET_BITS=64
-D_LARGEFILE_SOURCE -Wstrict-prototypes -Wredundant-decls -Wundef
-Wwrite-strings -Wmissing-prototypes -fno-strict-aliasing -fno-common
-fwrapv -Wold-style-declaration -Wold-style-definition -Wtype-limits
-Wformat-security -Wformat-y2k -Winit-self -Wignored-qualifiers
-Wempty-body -Wnested-externs -Wendif-labels -Wexpansion-to-defined
-Wimplicit-fallthrough=2 -Wno-missing-include-dirs
-Wno-shift-negative-value -Wno-psabi -fstack-protector-strong -fPIE
-isystem../linux-headers -isystemlinux-headers -DNEED_CPU_H
'-DCONFIG_TARGET="hexagon-linux-user-config-target.h"'
'-DCONFIG_DEVICES="hexagon-linux-user-config-devices.h"' -MD -MQ
libqemu-hexagon-linux-user.fa.p/linux-user_strace.c.o -MF
libqemu-hexagon-linux-user.fa.p/linux-user_strace.c.o.d -o
libqemu-hexagon-linux-user.fa.p/linux-user_strace.c.o -c
../linux-user/strace.c
../linux-user/strace.c: In function 'print_syscall':
../linux-user/strace.c:3931:23: error: implicit declaration of
function 'gettid'; did you mean 'getgid'?
[-Werror=implicit-function-declaration]
fprintf(f, "%d ", gettid());
^~~~~~
getgid
../linux-user/strace.c:3931:23: error: nested extern declaration of
'gettid' [-Werror=nested-externs]

https://gitlab.com/qemu-project/qemu/-/jobs/3100018258

