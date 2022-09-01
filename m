Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C555AA185
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 23:32:24 +0200 (CEST)
Received: from localhost ([::1]:41768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTrnS-0004Vr-Vp
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 17:32:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oTrk7-0002Wy-5n
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 17:28:55 -0400
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133]:45581)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oTrk4-0002Xf-PM
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 17:28:54 -0400
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-33dba2693d0so348745297b3.12
 for <qemu-devel@nongnu.org>; Thu, 01 Sep 2022 14:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=KvU7ty+/1ntzPjvguN+GzX45oGkrWD0id1GgCYki6/I=;
 b=JCmhrDSfFbOYfBJx2zHz3zONf7jeAGRn1CCSABXIkujB5tUYjeU1ZVdaxVkRehNVqe
 EL4XYUNtx++fNCtsNFeuDpc/z3YZkvVLQKh4pw86+GIybx4DD0SHb6ESZkp+kHDwCwF6
 QByX4bn5Nq7iGAVmUUdUTyzktwIgkYMpkAeF4L5h9jMuKw1pYzjlbj8Kb5O+yop/QC7n
 wC6XE8fEGWvB2/aAy23u/2S3AuzR+4aMxm3A7Tt/iy9KQwLEo/9rfz8IGmavkfGmtoBC
 yvsDbjbfP7/Z80S4+y07yWeAnourKLW1Eaf/bE1M1UXoGQYVaoU/j9Vao9jVyS9TCwTX
 xDUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=KvU7ty+/1ntzPjvguN+GzX45oGkrWD0id1GgCYki6/I=;
 b=Y4sWuWOJEuVF3GD6QyBsy7Tevz+CNYewlGzCA6OZEfwed6pHurdbQwWMEjSNvBxgFI
 BKGrAoPF+WlPLcisRl0sXK09OjAdw/Qd027h1HlezQmX3geDgZTOmLY+ebrFuHtiBRrT
 4hfaVjR5PpHKzPruC0ua7Lg4IPbG/joCpqPJuJYUJ5xmKz4z++N42pqGK+BrTRj4T33I
 AA399yf9AF5WvMptXWJGD09g5/KhIvQQXex3qkBSn8c5yyZhz4lycd6tsTdNYZCOKc95
 19PZTEmoohTdfGAZspRTRy1N6HQJYIgzKys/SYOwQMR3DaE1FLED9/phalKulLBgt2zJ
 13bA==
X-Gm-Message-State: ACgBeo0uNT/jGxPGmqKefR2CM6Jd64/SFafy7kfuGMYxjHvyRAJ//QB1
 4djMERCpaPTlPnVuV8A+OV+uSV7dpcbLBU0zWcY=
X-Google-Smtp-Source: AA6agR7albOZWaJxxEVrOxNYNg5x/ns8/TyNsBqzpyeDS+6QMSM5vrxLZiig7Oq9QjbhFWda0QjzQTMCBC27RpAeYsg=
X-Received: by 2002:a81:4e85:0:b0:33d:bff0:61d5 with SMTP id
 c127-20020a814e85000000b0033dbff061d5mr24692407ywb.111.1662067731142; Thu, 01
 Sep 2022 14:28:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220901065210.117081-1-richard.henderson@linaro.org>
In-Reply-To: <20220901065210.117081-1-richard.henderson@linaro.org>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Thu, 1 Sep 2022 17:28:39 -0400
Message-ID: <CAJSP0QWdQC-Vv0bqOVDmdtfrs8+_VGi8gk=H4Go5nJxwyyjmdw@mail.gmail.com>
Subject: Re: [PULL 00/20] tcg patch queue
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1133;
 envelope-from=stefanha@gmail.com; helo=mail-yw1-x1133.google.com
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

clang builds are failing:

clang -m64 -mcx16 -Ilibqemu-alpha-softmmu.fa.p -I. -I.. -Itarget/alpha
-I../target/alpha -Iqapi -Itrace -Iui -Iui/shader
-I/usr/include/pixman-1 -I/usr/include/capstone
-I/usr/include/spice-server -I/usr/include/spice-1
-I/usr/include/cacard -I/usr/include/glib-2.0
-I/usr/lib64/glib-2.0/include -I/usr/include/sysprof-4
-I/usr/include/nss3 -I/usr/include/nspr4 -I/usr/include/PCSC
-fcolor-diagnostics -Wall -Winvalid-pch -Werror -std=gnu11 -O2 -g
-isystem /builds/qemu-project/qemu/linux-headers -isystem
linux-headers -iquote . -iquote /builds/qemu-project/qemu -iquote
/builds/qemu-project/qemu/include -iquote
/builds/qemu-project/qemu/tcg/i386 -pthread -D_GNU_SOURCE
-D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -Wstrict-prototypes
-Wredundant-decls -Wundef -Wwrite-strings -Wmissing-prototypes
-fno-strict-aliasing -fno-common -fwrapv -Wold-style-definition
-Wtype-limits -Wformat-security -Wformat-y2k -Winit-self
-Wignored-qualifiers -Wempty-body -Wnested-externs -Wendif-labels
-Wexpansion-to-defined -Wno-initializer-overrides
-Wno-missing-include-dirs -Wno-shift-negative-value
-Wno-string-plus-int -Wno-typedef-redefinition
-Wno-tautological-type-limit-compare -Wno-psabi
-fstack-protector-strong -fsanitize=undefined
-fno-sanitize-recover=undefined -fPIE -isystem../linux-headers
-isystemlinux-headers -DNEED_CPU_H
'-DCONFIG_TARGET="alpha-softmmu-config-target.h"'
'-DCONFIG_DEVICES="alpha-softmmu-config-devices.h"' -MD -MQ
libqemu-alpha-softmmu.fa.p/target_alpha_translate.c.o -MF
libqemu-alpha-softmmu.fa.p/target_alpha_translate.c.o.d -o
libqemu-alpha-softmmu.fa.p/target_alpha_translate.c.o -c
../target/alpha/translate.c
In file included from ../target/alpha/translate.c:30:
/builds/qemu-project/qemu/include/exec/translator.h:206:1: error: all
paths through this function will call itself
[-Werror,-Winfinite-recursion]

https://gitlab.com/qemu-project/qemu/-/jobs/2968573429#L2247

Stefan

