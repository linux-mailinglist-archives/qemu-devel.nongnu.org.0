Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC83861879F
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 19:35:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqf1Y-0004z1-Du; Thu, 03 Nov 2022 14:33:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oqf0c-0004q8-ET
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 14:32:39 -0400
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oqf0V-000567-Uo
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 14:32:08 -0400
Received: by mail-yb1-xb35.google.com with SMTP id 129so3230931ybb.12
 for <qemu-devel@nongnu.org>; Thu, 03 Nov 2022 11:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=//lKooy75Bds+hQ5K1ScNiBQDEsBCh3ArsLpISjrSAI=;
 b=b/ZoKh/3VtZHOvd+ezCQUgc2nVCxGHtWTqm92Od/Oc5pBc9kqhAQcE1IYx1c99baeS
 40BFFHmgIOyPj03D7HT0lhCr8SMArxZTqGuZZ0bo6OrwUFL8JSEgXnzYw37LA5VLF72h
 2pA/YFdpSt3uc9ZNGWFJA+hfX3Geag2f8OO4xTSWVNf7AaHJ2w/9kL459PKULWJClqnz
 jhQ9/BG03yeToiJPl1UlFCf+shfAgjYXYj1+YrrQzBUccNLnz0BZHbOcduLcd7OEItOL
 tXcxtVRNaqNmX1dUN91lyKu0VpByXvuwX0eLt6OKMj8YZ6kO4wMIeuOhWuxHp619fY/v
 nFHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=//lKooy75Bds+hQ5K1ScNiBQDEsBCh3ArsLpISjrSAI=;
 b=fVoINW+p29h11toNjbdvNuSN36hh/23W510R1DIvFtenV5ua+RaoxvggjS7tEwgUvh
 RVSNnidbkFmgX19sUcLFNP4c4JKRaJCKvIpEFt6h0e1SE8AFh4VE8n0kw5rKO1YCRJ/U
 rdfEW9N7up02VPxdElH/0CxIUUZ7+OvioPhQwRY2C0xfosgWy5Tcm2AewrLXDGbt92f8
 +Bpex04/eqpaas4kYG3tNx6fKuy6QKRxGZUdTfcYbfa0u1cBdUDKgV/jkM9MIaCJD/by
 tq1ox3lrK0OmOzxzWPOGOkvqb60BolnfCSNIXev0Gs7ve38acZ0CN/8Yo1YudfVzgD6Z
 L6KQ==
X-Gm-Message-State: ACrzQf3C0JCZGrb19sfkmz7OGbsbMnp4LwHoOHVip34YgacmKX7eugY8
 rxCPaBgbXAiG2xXPrnakWY/fwJ7N4yBVXZaUIwk=
X-Google-Smtp-Source: AMsMyM6iXxSi8KBRbWtM8G4ftn5X8g92mkrpriBHh+5O2Y9nODgKlw4lAeBgHystleh8r2Rm+66Q+Xx1nlQ1i14Lls4=
X-Received: by 2002:a05:6902:708:b0:6ca:a03f:fc7b with SMTP id
 k8-20020a056902070800b006caa03ffc7bmr33110476ybt.118.1667500322797; Thu, 03
 Nov 2022 11:32:02 -0700 (PDT)
MIME-Version: 1.0
References: <20221103123901.2811990-1-gaosong@loongson.cn>
In-Reply-To: <20221103123901.2811990-1-gaosong@loongson.cn>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Thu, 3 Nov 2022 14:31:50 -0400
Message-ID: <CAJSP0QVmAQQMf1x+CoW+oGUu30g=TkqJDcVH3caC1rmwP6gsSA@mail.gmail.com>
Subject: Re: [PULL 0/7] loongarch-to-apply queue
To: Song Gao <gaosong@loongson.cn>
Cc: qemu-devel@nongnu.org, richard.henderson@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb35.google.com
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

The cross-win32-system GitLab CI job fails to build with the following error:

i686-w64-mingw32-gcc -m32 -Ilibqemu-loongarch64-softmmu.fa.p -I. -I..
-Itarget/loongarch -I../target/loongarch -I../dtc/libfdt -Iqapi
-Itrace -Iui -Iui/shader
-I/usr/i686-w64-mingw32/sys-root/mingw/include/pixman-1
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
'-DCONFIG_TARGET="loongarch64-softmmu-config-target.h"'
'-DCONFIG_DEVICES="loongarch64-softmmu-config-devices.h"' -MD -MQ
libqemu-loongarch64-softmmu.fa.p/hw_loongarch_acpi-build.c.obj -MF
libqemu-loongarch64-softmmu.fa.p/hw_loongarch_acpi-build.c.obj.d -o
libqemu-loongarch64-softmmu.fa.p/hw_loongarch_acpi-build.c.obj -c
../hw/loongarch/acpi-build.c
../hw/loongarch/acpi-build.c: In function 'acpi_build':
../hw/loongarch/acpi-build.c:402:9: error: implicit declaration of
function 'tpm_get_version' [-Werror=implicit-function-declaration]
402 | if (tpm_get_version(tpm_find()) == TPM_VERSION_2_0) {
| ^~~~~~~~~~~~~~~
../hw/loongarch/acpi-build.c:402:9: error: nested extern declaration
of 'tpm_get_version' [-Werror=nested-externs]
../hw/loongarch/acpi-build.c:402:25: error: implicit declaration of
function 'tpm_find' [-Werror=implicit-function-declaration]
402 | if (tpm_get_version(tpm_find()) == TPM_VERSION_2_0) {
| ^~~~~~~~
../hw/loongarch/acpi-build.c:402:25: error: nested extern declaration
of 'tpm_find' [-Werror=nested-externs]
../hw/loongarch/acpi-build.c:402:40: error: 'TPM_VERSION_2_0'
undeclared (first use in this function); did you mean 'TP_VERSION'?
402 | if (tpm_get_version(tpm_find()) == TPM_VERSION_2_0) {
| ^~~~~~~~~~~~~~~
| TP_VERSION
../hw/loongarch/acpi-build.c:402:40: note: each undeclared identifier
is reported only once for each function it appears in

https://gitlab.com/qemu-project/qemu/-/jobs/3270049630

Stefan

