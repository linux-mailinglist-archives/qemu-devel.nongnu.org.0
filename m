Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E087557D1AD
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jul 2022 18:39:52 +0200 (CEST)
Received: from localhost ([::1]:34072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEZDL-0002zy-Jb
	for lists+qemu-devel@lfdr.de; Thu, 21 Jul 2022 12:39:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oEZA9-0006wE-BX
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 12:36:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42471)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oEZA4-0007f1-CU
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 12:36:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658421387;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:  content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=w3tRUx7V7x9m+MBcApA8gXihZ9hSAWlckn12hdlKpJQ=;
 b=PkId6Sf4PtPccg8jUAKXmnrAmnCkMaAxKJZCHtALqtgUfDYqby6o/7B2gcDV6GpxAApIYf
 N8fhtCpaNDzE2EDfQA8bXidxr4gmWMx7KhrLRfE+Um4FGzFeuZIy1V9pLEDnE3q7uYxkw6
 /fUERjBb9H4xO33LvdKvtiE1FBScNow=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-654-2IfnyeWKNo6pgKtErAnRpw-1; Thu, 21 Jul 2022 12:36:26 -0400
X-MC-Unique: 2IfnyeWKNo6pgKtErAnRpw-1
Received: by mail-ed1-f71.google.com with SMTP id
 h20-20020a05640250d400b0043b6a4a2f11so1449052edb.23
 for <qemu-devel@nongnu.org>; Thu, 21 Jul 2022 09:36:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=w3tRUx7V7x9m+MBcApA8gXihZ9hSAWlckn12hdlKpJQ=;
 b=LVv6gTdkyv0B7CXkXXiYWCWQB8WhVDJ41KQj1Uki0YcWDgaMR+91x5aoNKxKXqt0s8
 wxc+qx/jXEl5lwxysC4p88Ji9Wi37MRWBzVOqzdR3JXlvnKfIlQarLEXFMh1ztCtzHXZ
 GC2S7Qh5a9H+Hgkz6598OqSBWV2FKI+zk6RBTWtKptzUhn3WtLkOKkjVOjdMBlsZ2gkq
 Y4YBH2YdpoaICBi+gDtiCY/tt5w9k/PX0Pp9cJLPkgJM0QBL+d/ZyGqMY/h5DEnsJVKA
 fYSrPtN/gJAzy3RlbT2rkgJpPTXfqtfyLqHLzyNDsct+TFnmLR//X0BEXQqS5+pT2uh1
 knxA==
X-Gm-Message-State: AJIora8VwEBKkmxHYAsxw02sXqwZmlJblJQ7Bpm2KeLaKr+i7b9Fyj4K
 1T73mU81wy4U9X3eQCdv2lkNC9uDgyNh6ObcmBDhyJh8g+SglwnDp8v8yLWUxlTTHo/SoYMVzac
 A5JNHU1EcGItdFyaNBy6tqWz7UIH9+fxAP3C+e3K9xoxTyoZVM+VaESuUcG1ju72w3jE=
X-Received: by 2002:a17:907:7ba2:b0:72b:57da:a76e with SMTP id
 ne34-20020a1709077ba200b0072b57daa76emr40826223ejc.210.1658421384314; 
 Thu, 21 Jul 2022 09:36:24 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tTY631IGC6DH0l7zq2JUsVsDS9aH+vga6WYJt42Hz5gaJhqLLEr0gyefVTkmTCp4/kX6bYBA==
X-Received: by 2002:a17:907:7ba2:b0:72b:57da:a76e with SMTP id
 ne34-20020a1709077ba200b0072b57daa76emr40826175ejc.210.1658421383618; 
 Thu, 21 Jul 2022 09:36:23 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 a15-20020a1709066d4f00b0072f0a9a8e6dsm1007847ejt.194.2022.07.21.09.36.22
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jul 2022 09:36:23 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/9] More fixes + random seed patches for QEMU 7.1
Date: Thu, 21 Jul 2022 18:36:12 +0200
Message-Id: <20220721163621.761513-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

The following changes since commit 8ec4bc3c8c09366a9e4859de7c0a1860911e8424:

  Merge tag 'net-pull-request' of https://github.com/jasowang/qemu into staging (2022-07-20 16:27:57 +0100)

are available in the Git repository at:

  https://gitlab.com/bonzini/qemu.git tags/for-upstream2

for you to fetch changes up to c0a0f1b6524abfb45c175fc0dbf2c0eed073b491:

  hw/i386: pass RNG seed via setup_data entry (2022-07-21 15:08:21 +0200)

----------------------------------------------------------------
* Bug fixes
* Pass random seed to x86 and other FDT platforms

----------------------------------------------------------------

I included the random seed patches because the feature is already
supported in the ppc and ARM pull requests; it makes little sense to
limit to a subset of the platforms since the code is basically the same
(except for x86).

Alexander Bulekov (1):
      oss-fuzz: ensure base_copy is a generic-fuzzer

Bin Meng (1):
      docs: Add caveats for Windows as the build platform

Jason A. Donenfeld (5):
      hw/nios2: virt: pass random seed to fdt
      hw/mips: boston: pass random seed to fdt
      hw/guest-loader: pass random seed to fdt
      hw/rx: pass random seed to fdt
      hw/i386: pass RNG seed via setup_data entry

Paolo Bonzini (1):
      oss-fuzz: remove binaries from qemu-bundle tree

Peter Maydell (1):
      accel/kvm: Avoid Coverity warning in query_stats()

 accel/kvm/kvm-all.c                          |  2 +-
 docs/about/build-platforms.rst               | 10 +++++++++-
 hw/core/guest-loader.c                       |  5 +++++
 hw/i386/microvm.c                            |  2 +-
 hw/i386/pc.c                                 |  4 ++--
 hw/i386/pc_piix.c                            |  2 ++
 hw/i386/pc_q35.c                             |  2 ++
 hw/i386/x86.c                                | 26 ++++++++++++++++++++++----
 hw/mips/boston.c                             |  5 +++++
 hw/nios2/boot.c                              |  5 +++++
 hw/rx/rx-gdbsim.c                            |  4 ++++
 include/hw/i386/pc.h                         |  3 +++
 include/hw/i386/x86.h                        |  3 ++-
 include/standard-headers/asm-x86/bootparam.h |  1 +
 scripts/oss-fuzz/build.sh                    |  6 ++++--
 15 files changed, 68 insertions(+), 12 deletions(-)
-- 
2.36.1


