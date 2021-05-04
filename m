Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD68372B1C
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 15:33:20 +0200 (CEST)
Received: from localhost ([::1]:55842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldvAt-0005oE-9h
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 09:33:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ldv8u-0004S0-2v
 for qemu-devel@nongnu.org; Tue, 04 May 2021 09:31:16 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:34753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ldv8s-0001e7-4L
 for qemu-devel@nongnu.org; Tue, 04 May 2021 09:31:15 -0400
Received: by mail-ed1-x530.google.com with SMTP id l7so1787203edb.1
 for <qemu-devel@nongnu.org>; Tue, 04 May 2021 06:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=O4W/AYuzwDNNyngE6nyzNbrArLoIk1G3wmD0FJ+e5Hk=;
 b=ZmYj8wE8xI1+mbEFoswr7jGnCbhwI9+lMuW9PB7Ru8qT2ASDLJOFyFOXRhULMcP5We
 Ut4n00vhjJJp/I6ArAkQRjzwjIJsnfddZCw1GPJ0FIkROrQj4znY9fmdkUMwP2r+A4Rm
 vykO1d7fDjMWHqTDWtmqcpcDUa/5CMJkUQc1R3NFr9cn+A5v78sW3cSkL1HhiYuoOt/v
 SsZZePnOWntwQVP3YQ5AHjd1mYEtnEIz0JsNsT5Wns5wvL3I3N7xHmCETNrvClYYKaML
 zPWFjF+p/pLCdWly0IOjZ2jsc25h/CFVUIW/njmrelLBnm5ThHtHgGRAHpe5W4DJ5fsv
 Ba1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=O4W/AYuzwDNNyngE6nyzNbrArLoIk1G3wmD0FJ+e5Hk=;
 b=bhZ9jw6Ks4qF1scyBxQ+m+UXogTRwFRTkR6jsct33uw58kr9mh7PxdkVQ0HrFgL1dR
 PlNNofX7R2nzkKjBa3ugivd2pA/amYayTyKoV+FTXB/sR6Vyv/ikWBENeHrPWriEiLwr
 9PoZ1Kl2W1hfG1n5GSWV3oTwwEkcO+ix85YKvf2aGErS268SFLLoFWtFSv1W2JbTxoQb
 Q68FYuuBpPS5ZVse/A5VpnuJxBycs8aIuXTeJjYgL9gaGk5Urm4CN4OKEDEJsKIxk8vM
 IDbz8T030rJWYOx8Qx65bpOQmsQ968O4p1MZTEhAVjV0tQ4V7WZ/CcLDojq33d6C77Kg
 ON7Q==
X-Gm-Message-State: AOAM531TChCS1hXJ/BqJtSqyDl/lM3Pt7htGOu1fimAc3v1c6yvMc2kz
 /8fZyXMa09T+oCroLf24+AsFHlkLgVU=
X-Google-Smtp-Source: ABdhPJxKLiq4vFXpx0j9wEITozPxKDjCzVy+csSZJXBqCmseCf2ZK5L9Xstb55hOY1IfVPokCBWaAA==
X-Received: by 2002:a05:6402:36e:: with SMTP id
 s14mr13896549edw.338.1620135072070; 
 Tue, 04 May 2021 06:31:12 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id y19sm6449860edc.73.2021.05.04.06.31.09
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 May 2021 06:31:10 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 00/11] Misc patches for 2021-04-30 (incl. NVMM accelerator)
Date: Tue,  4 May 2021 15:31:07 +0200
Message-Id: <20210504133109.508824-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x530.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit e93d8bcf9dbd5b8dd3b9ddbb1ece6a37e608f300:

  Merge remote-tracking branch 'remotes/philmd/tags/mips-20210502' into staging (2021-05-03 12:05:12 +0100)

are available in the Git repository at:

  https://gitlab.com/bonzini/qemu.git tags/for-upstream

for you to fetch changes up to 9ba5db49aea924175b8f23edd388fa2452206d20:

  glib-compat: accept G_TEST_SLOW environment variable (2021-05-04 14:15:35 +0200)

v1->v2: check for new-enough NetBSD, add another 0.57 preparation patch

----------------------------------------------------------------
* NetBSD NVMM support
* RateLimit mutex
* Prepare for Meson 0.57 upgrade

----------------------------------------------------------------
Joelle van Dyne (1):
      slirp: add configure option to disable smbd

Paolo Bonzini (6):
      oslib-win32: do not rely on macro to get redefined function name
      ratelimit: protect with a mutex
      configure: reindent meson invocation
      configure: handle meson options that have changed type
      gitlab-ci: use --meson=internal for CFI jobs
      glib-compat: accept G_TEST_SLOW environment variable

Reinoud Zandijk (4):
      Add NVMM accelerator: configure and build logic
      Add NVMM accelerator: x86 CPU support
      Add NVMM accelerator: acceleration enlightenments
      Add NVMM Accelerator: add maintainers for NetBSD/NVMM

 .gitlab-ci.yml                    |   10 +-
 MAINTAINERS                       |   11 +
 accel/Kconfig                     |    3 +
 block/block-copy.c                |    2 +
 blockjob.c                        |    3 +
 configure                         |  119 ++--
 include/glib-compat.h             |   17 +
 include/qemu/ratelimit.h          |   14 +
 include/sysemu/hw_accel.h         |    1 +
 include/sysemu/nvmm.h             |   26 +
 meson.build                       |   16 +-
 meson_options.txt                 |    2 +
 net/slirp.c                       |   16 +-
 qemu-options.hx                   |    8 +-
 target/i386/helper.c              |    2 +-
 target/i386/meson.build           |    1 +
 target/i386/nvmm/meson.build      |    8 +
 target/i386/nvmm/nvmm-accel-ops.c |  111 ++++
 target/i386/nvmm/nvmm-accel-ops.h |   24 +
 target/i386/nvmm/nvmm-all.c       | 1226 +++++++++++++++++++++++++++++++++++++
 util/oslib-win32.c                |    2 +-
 21 files changed, 1562 insertions(+), 60 deletions(-)
 create mode 100644 include/sysemu/nvmm.h
 create mode 100644 target/i386/nvmm/meson.build
 create mode 100644 target/i386/nvmm/nvmm-accel-ops.c
 create mode 100644 target/i386/nvmm/nvmm-accel-ops.h
 create mode 100644 target/i386/nvmm/nvmm-all.c
-- 
2.31.1


