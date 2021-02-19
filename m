Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3650431F76C
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 11:39:30 +0100 (CET)
Received: from localhost ([::1]:37566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD3C5-00082o-8Y
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 05:39:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lD3Ag-0007bC-Ey
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 05:38:02 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:46451)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lD3Ae-0005xE-Lr
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 05:38:02 -0500
Received: by mail-wr1-x42d.google.com with SMTP id t15so7508413wrx.13
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 02:37:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=user-agent:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vvdgJt/nkBPYMXRndp/zFdn7IRVDnZOb6OItyOVC9Uk=;
 b=QLEiJ2pIj3Dmn9mKnjbDan6lp3bhmoflVj9ZdGfctdfAPmPiw5ia5pZo0YF7HTE2Ik
 rILMwpI2XXg+XPJ6+Q2hEle2OkWa1RpBup7wj0/meH71N3Mvc//pkErAVg4PgQV+rNqu
 17YqP5lvgVNnmI4m/3yYX2ZDME/4P4uCMoGjP72/CRI5j5EVNKXK3obPQRkrnKSXXvLa
 EOL2sdAg1qLpitO/sZypSn95gGE4o7A0j99V+tahm7YqO1QNOKYnv9p4jN0W+6aUP68a
 ySgZMdfDAdp2fUyIhAB75kVAo0eTkzxZzQ2d76TIUFIdLSj4RJV6YEigQ7jbyg2uFPnj
 35ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:user-agent:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=vvdgJt/nkBPYMXRndp/zFdn7IRVDnZOb6OItyOVC9Uk=;
 b=JP0z/97aEwNuxB7gOc2/bQIFQ4D6tjSiWzYNH5NV7+w19OCAWDxDxL8OAYzTq5g0Yt
 tW2plGw7UrZLMqgJRDp3ou9/3OVW5At+RKxqE+ROCJaofeVAr8h/L7zDCeAx5h+n3nDg
 vykX5qpG56/ESWlXgj1pEZiFAgOq0CbkeA65h2xvaEbUgQXsjX9HD3XarI9dURIC9Yb3
 0Ad+ZYKAz0eSKMLMUFDLlZCYIIe8AWRCASJn5toRqUKWoqKGKtYgyooeuiSXYjYxysyx
 6KUq4zwK9mGL2wc3cfmkRPqCIr4hSl4XjnSFzS5GhvuiadnKmelouDSBwo9mhmiUDQBH
 lpog==
X-Gm-Message-State: AOAM5335cyzNjoY2Q76Cq4GDJjBrykCad+zhr/kxdBgVEBv/obXZb1XL
 2GdBEvfwyRiSDykQ7/DSRx/qPg==
X-Google-Smtp-Source: ABdhPJykXyyo7ZLTHUOLC2A8T9VzvDmkqM90U1A/NcvRMGdBwBj5RXgj2kTiKwftYJRKvmSnRmHTRQ==
X-Received: by 2002:a5d:4282:: with SMTP id k2mr8405543wrq.315.1613731078668; 
 Fri, 19 Feb 2021 02:37:58 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id r7sm10861920wmh.38.2021.02.19.02.37.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Feb 2021 02:37:57 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0207C1FF7E;
 Fri, 19 Feb 2021 10:37:57 +0000 (GMT)
User-agent: mu4e 1.5.8; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org, Ed Maste <emaste@freebsd.org>, Li-Wen Hsu
 <lwhsu@freebsd.org>
Subject: FreeBSD build regressions
Date: Fri, 19 Feb 2021 10:29:50 +0000
Message-ID: <8735xss5q3.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Gerd Hoffmann <gerd@kraxel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Hi,

It looks like the build has been broken on Cirrus since at least 7b2c4c:

  https://cirrus-ci.com/github/qemu/qemu

I did attempt to have a look but "vm-build-freebsd" seems to be failing
with a different error:

  10:31:47  [alex.bennee@hackbox2:~/l/q/b/all] master|=E2=9C=94 + make vm-b=
uild-freebsd
    GIT     ui/keycodemapdb tests/fp/berkeley-testfloat-3 tests/fp/berkeley=
-softfloat-3 meson dtc capstone slirp
      VM-BUILD freebsd
  cross containers  no

  NOTE: guest cross-compilers enabled: cc cc
  ld-elf.so.1: /usr/local/lib/libpython3.7m.so.1.0: Undefined symbol "close=
_range@FBSD_1.6"
  ld-elf.so.1: /usr/local/lib/libpython3.7m.so.1.0: Undefined symbol "close=
_range@FBSD_1.6"
  The Meson build system
  Version: 0.55.3
  Source dir: /usr/home/qemu/qemu-test.egp8wG/src
  Build dir: /usr/home/qemu/qemu-test.egp8wG/build
  Build type: native build
  Project name: qemu
  Project version: 5.2.50
  ld-elf.so.1: /usr/local/lib/libpython3.7m.so.1.0: Undefined symbol "close=
_range@FBSD_1.6"

  ../src/meson.build:1:0: ERROR: Executables created by c compiler cc are n=
ot runnable.

  A full log can be found at /usr/home/qemu/qemu-test.egp8wG/build/meson-lo=
gs/meson-log.txt

  ERROR: meson setup failed

  /home/alex.bennee/lsrc/qemu.git/tests/vm/Makefile.include:95: recipe for =
target 'vm-build-freebsd' failed
  make: *** [vm-build-freebsd] Error 3

Tracking back to before the previously mentioned commit it was still
failing which makes me think something has happened to the BSD image (or
something is missing since the build changes). I'd appreciate it if
someone with more FreeBSD knowledge can look into both regressions
because frankly I find it exhausting enough tracking down Linux
regressions when they occur.

Thanks,

--=20
Alex Benn=C3=A9e

