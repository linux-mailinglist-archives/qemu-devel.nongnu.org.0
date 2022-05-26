Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC4D534B6D
	for <lists+qemu-devel@lfdr.de>; Thu, 26 May 2022 10:17:17 +0200 (CEST)
Received: from localhost ([::1]:54896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nu8gG-0007Rx-KY
	for lists+qemu-devel@lfdr.de; Thu, 26 May 2022 04:17:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ilg@livius.net>) id 1nu8dg-0006jl-TO
 for qemu-devel@nongnu.org; Thu, 26 May 2022 04:14:37 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:37460)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ilg@livius.net>) id 1nu8de-0007CB-Vo
 for qemu-devel@nongnu.org; Thu, 26 May 2022 04:14:36 -0400
Received: by mail-ed1-x532.google.com with SMTP id d22so899533edj.4
 for <qemu-devel@nongnu.org>; Thu, 26 May 2022 01:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=livius-net.20210112.gappssmtp.com; s=20210112;
 h=from:content-transfer-encoding:mime-version:subject:message-id:date
 :cc:to; bh=qqdQ8ZfNPx+cNMXFaKI9+yb4ZcSpr6VG4a0KnJNkxME=;
 b=E1bMAcHAARchXQs0qQozI+Rx7NI/6BhNrZZwJq1bJ93KdeQZk8azLkHH3E84GQ86HK
 qB3Vku8OfodobxqkfL1THYA1+svkWzL9X5++w3ffKcZ5LpNHPURAtMmrTLbrEglnyZhJ
 yW4KCxrI0r7ueWPm4nPYaa4QHSbtf0V85746pxLmsJnGoswyj14GHWIXQ6X5TQvar4Zm
 LweJR86ikLSOSIc/vTnd43dfLgviEHULljWZ2wz5gvb3CiPolendSmBva6EzDnHs60rx
 GPvzJ2BxTSiu31RilifyFhhanVACtW3CGhpjchqCNLIJGwjjo7Qks+XkEzADcw2T5lSQ
 bz2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:content-transfer-encoding:mime-version
 :subject:message-id:date:cc:to;
 bh=qqdQ8ZfNPx+cNMXFaKI9+yb4ZcSpr6VG4a0KnJNkxME=;
 b=1lRe1rPyzVQfPZCr7g4iPPUcNMTtPIhfy/unPBtnAXLzNKLT09yz/yq8gbUI7b21BU
 4U8dO7FasCVHeIxhbycQXR6jurHDazERs9PZ1hjLK08Hslv0Uf6hq1DEfVkX8/+kNxcr
 Zne1b77+KM8MJFJUj4MI+dXI6DZevGd7u3Yg0qGCEmNqqkfP9oYEapPIML/Snjue5kl3
 KLyV9cBi053tod8AbL5bjP8LMZaPigV/kxfWVqIEFd7lP7mgT2iRE7e5mg+mw0zPkB8R
 mPaDw/Y1hMbE5NSpiISMaPvQwpAddQM4v5xUj2BTCNIX34r056cb3swBo1mDTSexnVBL
 ivIA==
X-Gm-Message-State: AOAM533zWBCJAWtC+xp+6KYlQDkpzvatXMTxdGNLJ70Y6pHb8aNGFtY1
 OtzdYBfcPfHyW3J7zufWA7dpLRKMpn//ZWI2
X-Google-Smtp-Source: ABdhPJzqHm8cIQhlXPvMt4CSsZo+XA5XEG7VVHQLFfR3XRtkPyWpcm5i61hR6fMy7MB/EhWWbk+JiA==
X-Received: by 2002:a05:6402:2391:b0:42b:74ef:f164 with SMTP id
 j17-20020a056402239100b0042b74eff164mr17466310eda.151.1653552872753; 
 Thu, 26 May 2022 01:14:32 -0700 (PDT)
Received: from smtpclient.apple ([86.121.23.37])
 by smtp.gmail.com with ESMTPSA id
 gj15-20020a170907740f00b006f3ef214da8sm304160ejc.14.2022.05.26.01.14.31
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 26 May 2022 01:14:32 -0700 (PDT)
From: Liviu Ionescu <ilg@livius.net>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.80.82.1.1\))
Subject: AArch64 semihosting?
Message-Id: <AADD58D2-C3BE-40DF-8EE5-3A901F4F8F04@livius.net>
Date: Thu, 26 May 2022 11:14:31 +0300
Cc: Peter Maydell <peter.maydell@linaro.org>
To: QEMU Developers <qemu-devel@nongnu.org>
X-Mailer: Apple Mail (2.3696.80.82.1.1)
Received-SPF: none client-ip=2a00:1450:4864:20::532;
 envelope-from=ilg@livius.net; helo=mail-ed1-x532.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

I'm trying to set-up an environment for running unit-tests on AArch64, =
and I'm constantly getting crashes:

```
ilg@wksi ~ % =
/Users/ilg/Library/xPacks/@xpack-dev-tools/qemu-arm/6.2.0-1.1/.content/bin=
/qemu-system-aarch64  "--machine" "virt" "--cpu" "cortex-a57" "--kernel" =
"/Users/ilg/My Files/WKS =
Projects/micro-os-plus.github/work/aarch64-boot-libgloss/Debug/aarch64-boo=
t-libgloss.elf" "--nographic" "-d" "unimp,guest_errors" =
"--semihosting-config" "enable=3Don,target=3Dnative" =
"--semihosting-config" "arg=3Dsample-test,arg=3Done,arg=3Dtwo" -s

zsh: segmentation fault   "--machine" "virt" "--cpu" "cortex-a57" =
"--kernel"  "--nographic" "-d"     =20
ilg@wksi ~ %=20
```

The application was built with newlib libgloss and all it does is a =
series of printfs to display Hello World and the argv array.

I also tried with a custom semihosting implementation that I use for =
other projects, and the result is the same, QEMU crashes.

However, if I start QEMU with -s (in GDB server mode) and load the =
application via the GDB client, the application no longer crashes, it =
passes the command lines arguments properly, it runs through the =
printfs, it returns, it reaches the semihosting SYS_EXIT_EXTENDED call =
and emulation terminates normally.

Things are not entirely ok, since the messages expected to be printed by =
QEMU are not shown; instead, they appear in the GDB trace window, so =
they are reflected back to GDB.


Are there any known issues with semihosting on AArch64? I'm using a =
similar configuration for running Cortex-M unit-tests on =
mps2-an500/mps2-an385 and on those machines semihosting works as =
expected.

Some time ago I reworked the semihosting implementation in OpenOCD, and =
there I used a common semihosting implementation for all Arm and RISC-V =
devices; everything worked fine, so a common approach is realistic.

My testing environment depends on running semihosted application in =
QEMU, so I have to find a solution to make it work.

Any thoughts on this?


Liviu






