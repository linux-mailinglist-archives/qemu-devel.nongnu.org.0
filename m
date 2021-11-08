Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3C674481F8
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 15:38:19 +0100 (CET)
Received: from localhost ([::1]:58526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mk5mt-0001w2-08
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 09:38:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mk5l5-0008A7-7F
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 09:36:27 -0500
Received: from [2a00:1450:4864:20::52b] (port=37693
 helo=mail-ed1-x52b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mk5ky-00074b-A0
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 09:36:23 -0500
Received: by mail-ed1-x52b.google.com with SMTP id f8so63475227edy.4
 for <qemu-devel@nongnu.org>; Mon, 08 Nov 2021 06:36:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eFcY+YFn2/y44sm6fS8ePAb0w9i21PMd73WjdzReTdg=;
 b=laugrHzopopim9CeTHirOcLjGPGCXz9n68+FKDYzDT6S8LEGTuxnGq8j+d8DxpHssw
 Ky1TD+uA0Rn/uKP89o6gB7ijeJN3LiWNVNTI7UC6T/NZS/sOv6bB/ffDhVfsgqm5l0c+
 g8ESJCjz45JR3wixt8IPEscIN75elUueFzriw88u8p0yX/qvJgDGnoPx9bRAhIQo0ZTg
 flgaruvKpGDCjvk0lFfsv7TTQih47k1oFEAVYd+czajDHO55ligGJUdhEt3d4aR67IHI
 Dx9YpuyMStR7MQBloHks7cMhHLWnz4gIWs5TyejZvcF7s2gQJL2xkyTuJQ1k7C8jhh/C
 vStw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=eFcY+YFn2/y44sm6fS8ePAb0w9i21PMd73WjdzReTdg=;
 b=AZAKocvfGrM1p/HmTTreXcJuPiZ7MNpOrIp84uwy1oSLjjoeYTGVfm9+Eslv4+ILoL
 3wQcbW0u7NJLDGxgyItUHOQ44lmNefBlOMUm2ds6ZKKXYnd4j7zKWx7CM2bUbfZEOVEN
 Ax/FusA80vX/0dPMAtpDitB6ca0zOZP4WmGIcxb7v8PveKRDFv9yKF/zF4AtI7QX1iVv
 D6ortGjVY9D+lwvYQwbt/Ha8OhnlFtzr/VGba5I8avO38FfDsTMqJrhzL9mr7E5fQoKF
 txqauN1VshRhFg6DB+9HqnUjkSXzye9wJYsQuzKAy/gZS38Yf2E6R6cTDE5ranrl4pl4
 BNLw==
X-Gm-Message-State: AOAM530RgnSOcUM5OtlmJnkR1wKSjb5DvTHOfi1XbKk31gwzGHX/VzPU
 3iqUb64sOVo1LisU49h+tGupSr0HxzY=
X-Google-Smtp-Source: ABdhPJzAAmXc79K4phbxhx/MBE2c/X1htSl7nWwsSU65a3cGyneuMnTtNzlGZSyDkEZ+FvoIjqcCew==
X-Received: by 2002:a50:e0c9:: with SMTP id j9mr111276edl.336.1636382178527;
 Mon, 08 Nov 2021 06:36:18 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id hp3sm8366662ejc.61.2021.11.08.06.36.17
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Nov 2021 06:36:18 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/10] Misc QEMU bugfixes for 6.2 hard freeze
Date: Mon,  8 Nov 2021 15:36:06 +0100
Message-Id: <20211108143616.660340-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

The following changes since commit 63ed851de474b1e2458cb9b4ba6e02a88f72c25c:

  Merge remote-tracking branch 'remotes/juanquintela/tags/migration-20211106-pull-request' into staging (2021-11-06 19:43:42 -0400)

are available in the Git repository at:

  https://gitlab.com/bonzini/qemu.git tags/for-upstream

for you to fetch changes up to 8b4ed0dabae559ebe1fd6f8eb54e1ec6000a0a7a:

  ui/gtk-egl: Fix build failure when libgbm is not available (2021-11-08 12:20:13 +0100)

----------------------------------------------------------------
* Fix off-by-one in MODE SELECT commands
* extend --extra-*flags behavior to meson-based tests
* allow using snappy in static builds
* i386 TCG fixes
* fix build failure when libgbm is not available

----------------------------------------------------------------
Mauro Matteo Cascella (1):
      hw/scsi/scsi-disk: MODE_PAGE_ALLS not allowed in MODE SELECT commands

Paolo Bonzini (8):
      target-i386: mmu: use pg_mode instead of HF_LMA_MASK
      target-i386: mmu: fix handling of noncanonical virtual addresses
      meson: perform snappy test with the C++ compiler if used
      docs: adjust for demise of scripts/create_config
      configure: simplify calls to meson_quote
      configure: preserve CFLAGS, CXXFLAGS and LDFLAGS in config.status
      configure: propagate --extra-cflags and --extra-ldflags to meson compile tests
      configure: ignore preexisting QEMU_*FLAGS envvars

Philippe Mathieu-Daudé (1):
      ui/gtk-egl: Fix build failure when libgbm is not available

 configure                            | 46 ++++++++++++++++++++++--------------
 docs/devel/build-system.rst          |  9 ++++---
 hw/scsi/scsi-disk.c                  |  6 +++++
 meson.build                          |  6 ++++-
 target/i386/tcg/sysemu/excp_helper.c | 25 +++++++++++---------
 ui/gtk-egl.c                         |  2 ++
 6 files changed, 59 insertions(+), 35 deletions(-)
-- 
2.33.1


