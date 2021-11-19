Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28656457108
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 15:47:37 +0100 (CET)
Received: from localhost ([::1]:51494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo5Au-0004pV-7z
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 09:47:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mo598-0002hL-SW
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 09:45:46 -0500
Received: from [2a00:1450:4864:20::52b] (port=42904
 helo=mail-ed1-x52b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mo597-0003Zw-AJ
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 09:45:46 -0500
Received: by mail-ed1-x52b.google.com with SMTP id r11so43623479edd.9
 for <qemu-devel@nongnu.org>; Fri, 19 Nov 2021 06:45:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JI/MaM0KTcl8YYQxTjNSYqz+/ysNBbFpnJkC/+X5vdI=;
 b=jdQUy1utncaqqmYKEg/mP3skAwMCK6hC9/ZnXq0n9I8jUW8FFWARqHmhoBJEdNqRDI
 ZUYXUOU9bDEXscKBk0mCP+VwkXMnpqvt2nwCpwkijfapAA+s12ms/pH/rHuEAAR+WwHN
 givHRTg9HX+A5MyejFEKMU5lf2hPswbL2prxhiu2fFUMeQN9QGuxMkLie8mFeC6cMztI
 2S0WitwoVj2s4TyUSlFaDVfjIRO8vtpzWqjItJWX2z96BPiCAUg2weTIuPNBQmQYvWcZ
 XtMjY+r/7Ph59ETpuEv0hlaub4J36bptaeG7SgOQ7SnUUEgXBODcTOTR43PiESFIncCT
 GaCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=JI/MaM0KTcl8YYQxTjNSYqz+/ysNBbFpnJkC/+X5vdI=;
 b=XI3BKLCPg9USTJCto7Kjj98eKSqhRhBfb/9WanJ/4rwdg/jaCmE7JplRvqrLUaiKp0
 3Gwd3RoqrNozE1mSBd/xZvG2VkGTBdq50kQ2FsgWLOF25uXr4ierewiPKAxOLiiup4EM
 ZlfKwFwRPpN6qVxdOHjxX1kJnafQsHwz6r5Y1149DQIU+ng5hXhp2t7cLTQGXVAa/B7B
 qirycndVBrVi0eG7Py7UpDr0SWa65GZahceDeHZxHoenmQTcWx74WeQkrWV2Din4SWah
 +gbCLNN8z1ZII0TXIUHfd/mBgmKpaYe4oNeta+gO9YUDhZxwxSU6olnXgs7PTb/HYAv3
 kJrQ==
X-Gm-Message-State: AOAM530DBlJRY2aDhzjgSkqbmR3/o23VTdqQ2XVAtkBL8JJwO0zDJJW9
 Yy0/Wpcc38hbusvs7mISIzDq4kE/pNQ=
X-Google-Smtp-Source: ABdhPJyxlT7N2+YkhK0t4+c0Ryv9JfMOnGlNlKen8P+xocdXgtEZ+f2euqZhxC2yoV0W/PuwSZTNjw==
X-Received: by 2002:a17:906:538d:: with SMTP id
 g13mr8821539ejo.62.1637333140631; 
 Fri, 19 Nov 2021 06:45:40 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id z25sm26934ejd.80.2021.11.19.06.45.39
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 06:45:40 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/7] Misc bugfixes for 2021-11-19
Date: Fri, 19 Nov 2021 15:45:32 +0100
Message-Id: <20211119144539.285740-1-pbonzini@redhat.com>
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
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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

The following changes since commit 42f6c9179be4401974dd3a75ee72defd16b5092d:

  Merge tag 'pull-ppc-20211112' of https://github.com/legoater/qemu into staging (2021-11-12 12:28:25 +0100)

are available in the Git repository at:

  https://gitlab.com/bonzini/qemu.git tags/for-upstream

for you to fetch changes up to fdc6e168181d06391711171b7c409b34f2981ced:

  chardev/wctable: don't free the instance in wctablet_chr_finalize (2021-11-19 10:24:50 +0100)

----------------------------------------------------------------
Bugfixes for 6.2.

----------------------------------------------------------------
Daniil Tatianin (1):
      chardev/wctable: don't free the instance in wctablet_chr_finalize

Mark Cave-Ayland (2):
      esp: ensure that async_len is reset to 0 during esp_hard_reset()
      qtest/am53c974-test: add test for reset before transfer

Paolo Bonzini (1):
      meson: fix botched compile check conversions

Philippe Mathieu-Daudé (1):
      docs: Spell QEMU all caps

Stefan Weil (1):
      meson.build: Support ncurses on MacOS and OpenBSD

nia (1):
      nvmm: Fix support for stable version

 chardev/wctablet.c                    |  1 -
 docs/devel/modules.rst                |  2 +-
 docs/devel/multi-thread-tcg.rst       |  2 +-
 docs/devel/style.rst                  |  2 +-
 docs/devel/ui.rst                     |  4 ++--
 docs/interop/nbd.txt                  |  6 +++---
 docs/interop/qcow2.txt                |  8 ++++----
 docs/multiseat.txt                    |  2 +-
 docs/system/device-url-syntax.rst.inc |  2 +-
 docs/system/i386/sgx.rst              | 26 +++++++++++++-------------
 docs/u2f.txt                          |  2 +-
 hw/scsi/esp.c                         |  1 +
 meson.build                           | 33 ++++++++++++++++++++-------------
 target/i386/nvmm/nvmm-all.c           | 10 ++++++++++
 tests/qtest/am53c974-test.c           | 30 ++++++++++++++++++++++++++++++
 ui/curses.c                           |  4 ++++
 16 files changed, 93 insertions(+), 42 deletions(-)
-- 
2.33.1


