Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE09B60E3BB
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 16:50:53 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onhit-00016q-28; Wed, 26 Oct 2022 10:49:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1onhiq-0000ri-P5
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 10:49:37 -0400
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1onhip-00060n-1l
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 10:49:36 -0400
Received: by mail-yb1-xb31.google.com with SMTP id 63so19167882ybq.4
 for <qemu-devel@nongnu.org>; Wed, 26 Oct 2022 07:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ZZVqDD1MYd4J8DN+U8fkHXCgyWl2miujWdW+OA3wxbs=;
 b=m5W/rx+H9HBR0U1Et1sXaunCb3wQUXE1IEqC0WlSmi8AF4A2BKmuQbtQd7HjJrnQx2
 OULGOtj5rZMOEhiK81gOCo5Z3Qe/c66HYl0qCTvV8of+rmAeH/ZagJqggtX5tbNZa/5J
 B04h/EHjUllyVH8tt75DzeNL+e063pLYM1qzmU1lSI49LjptiEtaAVHXScScX7NDGRS2
 9EhRGORnAWrgv/Hw3maWazsXatNdAa3txqZFkv+3X1D6kX9OU30fNxFSTTjrWnFfBVCB
 YxK0I9t4ZQ14BY42D1ueDOI1n9E0psm0vaHSwNEtBF0SpQcvvK01zIxBC4jkzultkn/s
 8eng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZZVqDD1MYd4J8DN+U8fkHXCgyWl2miujWdW+OA3wxbs=;
 b=d1VQCR9nxMpAfi38VIIzG2ULSj/Ozvif0UK93OsSY8VImcyiyxStwMCYpoB+UX6OoZ
 sz227jEeC4Y/b6iS1GTa4IZUInB5nCFI+2vnVgrvKb9kpaM0P2Ja2118P6KcL4Nal1c8
 pcFn6OzE3rf3aIKovGiB5k+hRMwP/aFefJg0srB5Tcbfy9EoMPPQW2QkgHtQBK9K7DqD
 vV39d+ih1PKlzXu/X1FA5i7b1ML0Yny0yjQi6vzl4d7q17ANM2erW9DE9wOgPaEZDxRb
 vLuarJBCClj3O8UW4Eg5glmkV78qdN82AYWVJsBG+k/3tOCtdSywabId1hIOh28Un7qC
 oEBQ==
X-Gm-Message-State: ACrzQf12pxPwD1/H696zSYmEFfUHEMQEaTOqzu0v5oOVbszg4NbpHWXP
 xx0AOG86OgbDqH0HSBpYJ0BOCx/10vX4MFriRY0=
X-Google-Smtp-Source: AMsMyM4aKzVDG4OKcDMgqRaHP0p0uCCyhqm8doa0p1iXjdF+iUaZ+UeVivQPVLyd48vBP+tr0A34Vqm1WiT6UopCNSU=
X-Received: by 2002:a25:d210:0:b0:6cb:47d1:8738 with SMTP id
 j16-20020a25d210000000b006cb47d18738mr12162739ybg.207.1666795770044; Wed, 26
 Oct 2022 07:49:30 -0700 (PDT)
MIME-Version: 1.0
References: <20221025163952.4131046-1-peter.maydell@linaro.org>
In-Reply-To: <20221025163952.4131046-1-peter.maydell@linaro.org>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Wed, 26 Oct 2022 10:49:18 -0400
Message-ID: <CAJSP0QU0=S3SwRweGAt_dMcYLNZXw+F+umopgXAzVxduQHJYQQ@mail.gmail.com>
Subject: Re: [PULL 00/30] target-arm queue
To: Peter Maydell <peter.maydell@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb31.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, 25 Oct 2022 at 12:51, Peter Maydell <peter.maydell@linaro.org> wrote:
> target-arm queue:
>  * Implement FEAT_E0PD
>  * Implement FEAT_HAFDBS

This commit breaks CI:

i686-w64-mingw32-gcc -m32 -Ilibqemu-aarch64-softmmu.fa.p -I. -I..
-Itarget/arm -I../target/arm -I../dtc/libfdt -Iqapi -Itrace -Iui
-Iui/shader -I/usr/i686-w64-mingw32/sys-root/mingw/include/pixman-1
-I/usr/i686-w64-mingw32/sys-root/mingw/include/glib-2.0
-I/usr/i686-w64-mingw32/sys-root/mingw/lib/glib-2.0/include
-fdiagnostics-color=auto -Wall -Winvalid-pch -Werror -std=gnu11 -O2 -g
-iquote . -iquote /builds/qemu-project/qemu -iquote
/builds/qemu-project/qemu/include -iquote
/builds/qemu-project/qemu/tcg/i386 -mms-bitfields -U_FORTIFY_SOURCE
-D_FORTIFY_SOURCE=2 -fno-pie -no-pie -D_GNU_SOURCE
-D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -Wstrict-prototypes
-Wredundant-decls -Wundef -Wwrite-strings -Wmissing-prototypes
-fno-strict-aliasing -fno-common -fwrapv -Wold-style-declaration
-Wold-style-definition -Wtype-limits -Wformat-security -Wformat-y2k
-Winit-self -Wignored-qualifiers -Wempty-body -Wnested-externs
-Wendif-labels -Wexpansion-to-defined -Wimplicit-fallthrough=2
-Wno-missing-include-dirs -Wno-shift-negative-value -Wno-psabi
-fstack-protector-strong -DNEED_CPU_H
'-DCONFIG_TARGET="aarch64-softmmu-config-target.h"'
'-DCONFIG_DEVICES="aarch64-softmmu-config-devices.h"' -MD -MQ
libqemu-aarch64-softmmu.fa.p/target_arm_ptw.c.obj -MF
libqemu-aarch64-softmmu.fa.p/target_arm_ptw.c.obj.d -o
libqemu-aarch64-softmmu.fa.p/target_arm_ptw.c.obj -c
../target/arm/ptw.c
../target/arm/ptw.c: In function 'S1_ptw_translate':
../target/arm/ptw.c:269:36: error: 'PROT_WRITE' undeclared (first use
in this function); did you mean 'OF_WRITE'?
269 | ptw->out_rw = full->prot & PROT_WRITE;
| ^~~~~~~~~~
| OF_WRITE
../target/arm/ptw.c:269:36: note: each undeclared identifier is
reported only once for each function it appears in

https://gitlab.com/qemu-project/qemu/-/jobs/3230968840

Stefan

