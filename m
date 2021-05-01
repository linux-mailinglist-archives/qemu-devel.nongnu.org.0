Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32DC73706A5
	for <lists+qemu-devel@lfdr.de>; Sat,  1 May 2021 11:35:32 +0200 (CEST)
Received: from localhost ([::1]:60676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcm27-00052P-9w
	for lists+qemu-devel@lfdr.de; Sat, 01 May 2021 05:35:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lclxK-0000V5-VY
 for qemu-devel@nongnu.org; Sat, 01 May 2021 05:30:35 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:43840)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lclxH-0005U8-7O
 for qemu-devel@nongnu.org; Sat, 01 May 2021 05:30:32 -0400
Received: by mail-ej1-x635.google.com with SMTP id l4so688487ejc.10
 for <qemu-devel@nongnu.org>; Sat, 01 May 2021 02:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AMh4R8XWsBNH9emapyh5QPcdgs4qVrB9pAe7PZS4Upc=;
 b=HOcZERjeJgMovb4NU6JnvoV6FZUUgfqIDBu2DSo1j8//1XBl+gYuxAPZSUt85gZ6OS
 4B/BmQVexZdup7q4uzDlPRHzJoBWx1j6zyN2Uun6Tujph0SDvNsYp9mdEYCFsRGd+a8t
 8zN8owoBalSjYmxC2ZFpyb9uu8q0QXlFt/oQ3R1c6PCNfyf1wx1koo48fB9npFie4W/D
 AUAPybChP3InySDepRHLDGriX/tQUhmU39VCFUr/A0HEbUw1YKpmI897SVEg0yHENYoX
 Nnew5faK0hJa1m0AmK7vdWw577e35RHD1NaKxl6sT03Gs/40L8xy9KKUCDw4Q1FyMRIY
 +0lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=AMh4R8XWsBNH9emapyh5QPcdgs4qVrB9pAe7PZS4Upc=;
 b=BGBLAwwFJyEp8bAIVbHvFvDOsbu4jX95F3WOavUFVjZzIfEbrzqeTDzfoiltHo0RPD
 /XvOzZUFnk/Aklr0D/+UqS6Q4JZ9u73aSFJ2eTlbiFJFVxLPQ+jcxDVqkEniXx1aMQZ1
 gW86tQYu7KS3IkLoG5C2Xl6TiEa3RfuSKN7XZlgMIdbWQHB6C3u0bWL9gdiUGyMfgHx1
 rXW6tNhfXwNlWXNE/WupRmh9XOkbsEQybSreVSr1JKo6FH4peN2YzK8e2LRBvXmMkuHC
 MKPQIbhYJZ1D1lt/0mqkxiIW+R1bZAUc9TvD8IIop2t/1YBhBhtCVw63LfFdg0m+qGx/
 PQnw==
X-Gm-Message-State: AOAM533pPGchMOgzsgwMpaf2wtig6xCVlNJTuHHJXw02dLtAQCU+2707
 9al+0qZNjXhbbNo/vlEPPwuZHHl3zZI=
X-Google-Smtp-Source: ABdhPJzBP98HB2uPFUVrlpSyL9vqGGGYmtsMz3y5sqj+/cN1svFTKXDQa3Kd9dWsRo2eJcKQpiHD9g==
X-Received: by 2002:a17:906:3989:: with SMTP id
 h9mr8209515eje.309.1619861429021; 
 Sat, 01 May 2021 02:30:29 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id ga33sm4632721ejc.11.2021.05.01.02.30.27
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 May 2021 02:30:28 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/10] Misc patches for 2021-04-30 (incl. NVMM accelerator)
Date: Sat,  1 May 2021 11:30:16 +0200
Message-Id: <20210501093026.189429-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x635.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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

The following changes since commit b1cffefa1b163bce9aebc3416f562c1d3886eeaa:

  Update version for v6.0.0-rc4 release (2021-04-20 16:30:01 +0100)

are available in the Git repository at:

  https://gitlab.com/bonzini/qemu.git tags/for-upstream

for you to fetch changes up to 29740bdf1418c1193524356389cec825051c7a64:

  gitlab-ci: use --meson=internal for CFI jobs (2021-04-30 21:39:59 +0200)

----------------------------------------------------------------
* NetBSD NVMM support
* RateLimit mutex
* Prepare for Meson 0.57 upgrade

----------------------------------------------------------------
Joelle van Dyne (1):
      slirp: add configure option to disable smbd

Paolo Bonzini (5):
      oslib-win32: do not rely on macro to get redefined function name
      ratelimit: protect with a mutex
      configure: reindent meson invocation
      configure: handle meson options that have changed type
      gitlab-ci: use --meson=internal for CFI jobs

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
 20 files changed, 1545 insertions(+), 60 deletions(-)
 create mode 100644 include/sysemu/nvmm.h
 create mode 100644 target/i386/nvmm/meson.build
 create mode 100644 target/i386/nvmm/nvmm-accel-ops.c
 create mode 100644 target/i386/nvmm/nvmm-accel-ops.h
 create mode 100644 target/i386/nvmm/nvmm-all.c
-- 
2.31.1


