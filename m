Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35A26529E3D
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 11:40:39 +0200 (CEST)
Received: from localhost ([::1]:34644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqth0-0000M3-0n
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 05:40:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nqtTK-00080L-3Z
 for qemu-devel@nongnu.org; Tue, 17 May 2022 05:26:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20612)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nqtTF-0003Vt-6j
 for qemu-devel@nongnu.org; Tue, 17 May 2022 05:26:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652779583;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=iOXnA9wPtKTHwTwdmPsrPpzzghOunEoxMfHzP6xEbGA=;
 b=JjWRy6dO2MGSbvCpOvn0KQz8f7oYif/dVhk2cKMc9gow/mxHG0fy2XhCKEYNgc8wItNDjW
 iJHya19MA0PMNqVujPUFJp2tIWlFJ7VVVrEAFB6RsXhlWkGDl0Vk6N9N4gdbdsIP2NwKPP
 /1TCWhJ0xQEdcdAP0aDZEawNiLA3Nxg=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-543-fzR5QpV9NluU5Q5GO73-LA-1; Tue, 17 May 2022 05:26:22 -0400
X-MC-Unique: fzR5QpV9NluU5Q5GO73-LA-1
Received: by mail-ed1-f72.google.com with SMTP id
 p13-20020aa7c4cd000000b0042ab847aba8so2824549edr.0
 for <qemu-devel@nongnu.org>; Tue, 17 May 2022 02:26:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iOXnA9wPtKTHwTwdmPsrPpzzghOunEoxMfHzP6xEbGA=;
 b=B9L/Xp9Ub6FuLADzUGlQ5g7PjdTlsSi6hjtvAN71ujNd69yaHazIM3d2jL3Yl4jENR
 CnwLXI0niRkj7890uJPM+2gQEG2m3IFDIJzxjDKpM/ZLbWb0wZdSP5FVe3gfb4CiCVEZ
 AAeCNU90oZmuw5JytJv2+ozivqXtntdBcbVDyylsGxzw+j/ZwPDdquDbHdURzea/g2+c
 VcTaLOdQytapA8UFETzAQtaxchVzPKueqcZW9/icPdqvkS91GmOZxx4LpKKSni/qplmK
 EVE4FIe0xHx56GM8v5RLsus4nP03h5+fjrG0k/JWncrARiWITZCyDbJDksTQmAdQ32g8
 MiNA==
X-Gm-Message-State: AOAM533VswdK8pEJw7gTQnuEQP+dOJtXGI0Hhyp2jI2zLtMhfG754VUN
 IVKSwG+8/QObdQsoz+ObrCHCzVldUNi/Ox1B6sxRc2cj5uOlUMYOEwhulw4rJxGx0jHjkD9uuwv
 wUqQUpyRRp/89hbO4eZY+U9Bp2W1uEcHFcEQT1c91ij3h2UHCGnKGVlLycq6z3RQ6HSE=
X-Received: by 2002:a17:906:a10a:b0:6fe:563a:8895 with SMTP id
 t10-20020a170906a10a00b006fe563a8895mr4206420ejy.80.1652779580878; 
 Tue, 17 May 2022 02:26:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwpgEuZUrXtUPGHosg3h9OwwtZZoopi733/MlHZXTJQFzTxYYHsqTQylDre72W+nVduOG5FnQ==
X-Received: by 2002:a17:906:a10a:b0:6fe:563a:8895 with SMTP id
 t10-20020a170906a10a00b006fe563a8895mr4206405ejy.80.1652779580610; 
 Tue, 17 May 2022 02:26:20 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 m3-20020a17090672c300b006f3ef214e18sm797383ejl.126.2022.05.17.02.26.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 May 2022 02:26:20 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org,
	richard.henderson@linaro.org
Subject: [PATCH 00/16] Cross compilation of embedded firmware
Date: Tue, 17 May 2022 11:26:00 +0200
Message-Id: <20220517092616.1272238-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

This is the next part of the firmware cross compilation story.  It only
looks at firmware that's strictly part of QEMU (optionrom, s390-ccw,
vof), and does not do docker cross compilers yet; but it takes the
infrastructure from tests/tcg/configure.sh and moves it in the main
configure script so that others can use it.

I actually expect the compiler tests to move back to tests/tcg, running
at Make time after the docker images are built.  For now, the file is
moved as a whole, including both compiler detection and the tests.

Paolo

RFC->v1:
- new patches 1-4, 6, 16
- patches 9-10 have been merged already

Paolo Bonzini (16):
  configure: do not define or use the CPP variable
  build: clean up ninja invocation
  build: add a more generic way to specify make->ninja dependencies
  build: do a full build before running TCG tests
  configure, meson: move symlinking of ROMs to meson
  tests/tcg: correct target CPU for sparc32
  tests/tcg: merge configure.sh back into main configure script
  configure: add missing cross compiler fallbacks
  configure: handle host compiler in probe_target_compiler
  configure: introduce --cross-prefix-*=
  configure: include more binutils in tests/tcg makefile
  configure: move symlink configuration earlier
  configure: enable cross-compilation of s390-ccw
  configure: enable cross-compilation of optionrom
  configure: enable cross compilation of vof
  configure: remove unused variables from config-host.mak

 Makefile                     |   9 +-
 configure                    | 605 ++++++++++++++++++++++++++++++-----
 pc-bios/meson.build          |  18 +-
 pc-bios/optionrom/Makefile   |   4 +-
 pc-bios/s390-ccw/Makefile    |   9 +-
 pc-bios/s390-ccw/netboot.mak |   2 +-
 pc-bios/vof/Makefile         |  17 +-
 scripts/mtest2make.py        |   8 +-
 tests/Makefile.include       |   4 +-
 tests/tcg/configure.sh       | 376 ----------------------
 10 files changed, 570 insertions(+), 482 deletions(-)
 delete mode 100755 tests/tcg/configure.sh

-- 
2.36.0


