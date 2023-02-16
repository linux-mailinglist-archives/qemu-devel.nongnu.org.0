Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D55B86996AD
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 15:08:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSeuW-0000EO-Js; Thu, 16 Feb 2023 09:06:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pSeuU-0000Cw-9F
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 09:06:54 -0500
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pSeuS-0005Ex-8M
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 09:06:54 -0500
Received: by mail-pf1-x429.google.com with SMTP id bd35so1517357pfb.6
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 06:06:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1676556410;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=0Dch5VbCjhPz2AzW5Xd+j0gWMYx0n3iH1pJ0XU0/VFc=;
 b=m11bBKbZgPMQcSsl8j/kfSL1KjczOL7JshYxrQDq1/qoNG4VtAavEDglEW4LNQ8/t6
 rj+eCuVwYirioZBE43a7xwgyPclTWLRhmt6Gz9g+Y4OqJtD6+yIJVWU2m//GJiRgpcPC
 sXnuxmyfx9j2Zt4IUdJxaxlSGf1aRt6TxO3KRoAzKFujBX0jKA4M0QolxaKBcfitCufl
 GwaY6Vr0zPrF8lauKlItRZWgb27LdN7UkEi10bFrxoTUGihwb3SqB49i0YCv1VYPh+qx
 tXFAKmeBHHBcuQ3fwB9x6SALcE7ms8xNCnuYhiTkSrGN4WNTQb24JWpqCdGldfkUksiP
 UFmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1676556410;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0Dch5VbCjhPz2AzW5Xd+j0gWMYx0n3iH1pJ0XU0/VFc=;
 b=dZnHzAe16xecgg//8qYeTOuXw/dNsNsqd2Lp1Pyh+kTXZBvjj8BxIckWgheRbO757y
 W21ZuA4TQyhbeyRi7CudwNthleIApdaqGmyCAFGEop35G10wywN9k1Lp+FaX3P7eB4jt
 grTnEyOCawrV+0TrXWVCn53/nxJcG4bx2dprFS+KGlc864bIBiDxg9rkjYTO5og3mTtG
 sMnp3YF7N3xzrTQMtAwSc66P2Oi3rk3Ygn3fx2bVUrDhvOBxa1J0smcDnXWzAcgNXPu7
 r0oggSi+A/FVJ0nURKEDWmkVIVIfraXmkiJqMgMyZaKNKGfo4mdWsO39rA9RGiRogG+b
 9snA==
X-Gm-Message-State: AO0yUKUvS4gngEXMeB4vdTz03AXJ4YO5SSB/nkrBerhLVQAizKE4/1g1
 kx9vPzpfS+BSZaCRR/nqlrqsSijOBPiIsgRsWdX6Xw==
X-Google-Smtp-Source: AK7set/N3pQ4AyAGzf/pS4DixL0r9x3lSc1lOzSsL5Iw7uIREb0bqSvu1MCNFO4GUiOXHVMzgYcIVLPpMc2qP0iMuRo=
X-Received: by 2002:a62:840e:0:b0:5a9:babe:6cb9 with SMTP id
 k14-20020a62840e000000b005a9babe6cb9mr109397pfd.48.1676556410380; Thu, 16 Feb
 2023 06:06:50 -0800 (PST)
MIME-Version: 1.0
References: <20230208233111.398577-1-dinahbaum123@gmail.com>
In-Reply-To: <20230208233111.398577-1-dinahbaum123@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Feb 2023 14:06:39 +0000
Message-ID: <CAFEAcA8ixLad98B9jt5-OpkSUxnQ6r61jLJQHYTkbLW8t9fP=Q@mail.gmail.com>
Subject: Re: [PATCH 0/2] *** configure: Add 'mkdir build' check ***
To: Dinah Baum <dinahbaum123@gmail.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, 8 Feb 2023 at 23:32, Dinah Baum <dinahbaum123@gmail.com> wrote:
>
> QEMU configure script goes into an infinite error printing loop
> when in read only directory due to 'build' dir never being created.
>
> 1 - Checking if 'mkdir dir' succeeds and if the directory is
> writeable prevents this error.
>
> 2 - Since we exit early on error in (1), code for reading in
> arguments has been moved before that

Unfortunately this patch series changes the output of the --help
message, because it moves the code that prints it so that it
is before some of the other bits of configure that identify
various default values to print as part of the help message.
You can see this if you do './configure --help > help.txt'
before and after the changes and compare the outputs:



--- /tmp/old.help       2023-02-16 13:58:45.302662220 +0000
+++ /tmp/new-help       2023-02-16 13:56:05.579389660 +0000
@@ -1,47 +1,21 @@
-Using './build' as the directory for build output

 Usage: configure [options]
 Options: [defaults in brackets after descriptions]

 Standard options:
   --help                   print this message
-  --prefix=PREFIX          install in PREFIX [/usr/local]
+  --prefix=PREFIX          install in PREFIX []
   --target-list=LIST       set target list (default: build all)
-                           Available targets: aarch64-softmmu alpha-softmmu
-                           arm-softmmu avr-softmmu cris-softmmu hppa-softmmu
-                           i386-softmmu loongarch64-softmmu m68k-softmmu
-                           microblaze-softmmu microblazeel-softmmu mips-softmmu
-                           mips64-softmmu mips64el-softmmu mipsel-softmmu
-                           nios2-softmmu or1k-softmmu ppc-softmmu ppc64-softmmu
-                           riscv32-softmmu riscv64-softmmu rx-softmmu
-                           s390x-softmmu sh4-softmmu sh4eb-softmmu
-                           sparc-softmmu sparc64-softmmu tricore-softmmu
-                           x86_64-softmmu xtensa-softmmu xtensaeb-softmmu
-                           aarch64-linux-user aarch64_be-linux-user
-                           alpha-linux-user arm-linux-user armeb-linux-user
-                           cris-linux-user hexagon-linux-user hppa-linux-user
-                           i386-linux-user loongarch64-linux-user
-                           m68k-linux-user microblaze-linux-user
-                           microblazeel-linux-user mips-linux-user
-                           mips64-linux-user mips64el-linux-user
-                           mipsel-linux-user mipsn32-linux-user
-                           mipsn32el-linux-user nios2-linux-user
-                           or1k-linux-user ppc-linux-user ppc64-linux-user
-                           ppc64le-linux-user riscv32-linux-user
-                           riscv64-linux-user s390x-linux-user sh4-linux-user
-                           sh4eb-linux-user sparc-linux-user
-                           sparc32plus-linux-user sparc64-linux-user
-                           x86_64-linux-user xtensa-linux-user
-                           xtensaeb-linux-user
+                           Available targets:
   --target-list-exclude=LIST exclude a set of targets from the
default target-list

 Advanced options (experts only):
   --cross-prefix=PREFIX    use PREFIX for compile tools, PREFIX can be blank []
-  --cc=CC                  use C compiler CC [cc]
-  --host-cc=CC             use C compiler CC [cc] for code run at
+  --cc=CC                  use C compiler CC []
+  --host-cc=CC             use C compiler CC [] for code run at
                            build time
(etc)

You can see that the new output doesn't show the available target
list or the default values in [] for options like --cc and --host-cc.

This is kind of awkward to fix because some of the code we run to
figure out those default values probably assumes that the current
directory is writeable and/or that the build directory was created.

My suggestion is that because the case we're trying to fix is
really a corner case (accidentally running configure in a
read-only directory), and our hope for the future is to move
still more of this code out of configure and into meson.build,
that we should take the simple approach:
 * just do something like patch 1, which exits immediately if
   it finds that it couldn't create the build directory
 * accept that in this situation, --help doesn't work. This
   is already the case for some other early error paths, like
   the one where we failed to create the temporary directory TMPDIR1

I think that's OK if we have a suitably clear error message.
I'll go and review patch 1 specifically now, assuming this
approach.

thanks
-- PMM

