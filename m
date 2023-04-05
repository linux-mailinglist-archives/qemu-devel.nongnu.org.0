Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D97B6D84C9
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Apr 2023 19:22:33 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pk6p5-0004hI-LW; Wed, 05 Apr 2023 13:21:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3Ea4tZAUKCkwrwuw7u22uzs.q204s08-rs9sz121u18.25u@flex--digit.bounces.google.com>)
 id 1pk6p3-0004gA-Pp
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 13:21:25 -0400
Received: from mail-ed1-x549.google.com ([2a00:1450:4864:20::549])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3Ea4tZAUKCkwrwuw7u22uzs.q204s08-rs9sz121u18.25u@flex--digit.bounces.google.com>)
 id 1pk6p1-0004G0-SZ
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 13:21:25 -0400
Received: by mail-ed1-x549.google.com with SMTP id
 j21-20020a508a95000000b004fd82403c91so50139822edj.3
 for <qemu-devel@nongnu.org>; Wed, 05 Apr 2023 10:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1680715281;
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=u9C6RC+ewGy0Ci4s6FkIeuGmgWBfvrJOpdCg6ePCKkI=;
 b=orLiEyngyJYc/uXnDBFM3q4Tl2oQtzL8Tc2SF3hq73xr6ixL4zu6B7XgEj/3SR5hrz
 560FoX64MPdeOQxPfuvdw72Ji9nWYUiTFgfHTGl48ZAhHgB1A+2l7mF0NxIiRyYSgVGi
 u8coEF0KFPxIe5Pn5ftFmLRdy0S6WJkBYVSgpvwTZTT1whyGx6eh4SQoNwK0FGLKcTTb
 n4ucUy3QnOQLoQU49bLGeWmqr/8xbMcRwhxvJj9QNBhCtl5HKcWvLhMZpiirYZrI1XTP
 gLo1BO+5hL9pK9vpsFq4xXtBXvLU3IppKlY+uFgMZxZjDnJc+NxpNAP5xsg+gWI4tNzj
 U+6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680715281;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=u9C6RC+ewGy0Ci4s6FkIeuGmgWBfvrJOpdCg6ePCKkI=;
 b=rm4yOjIDNAUUqtvRLtCidx6HPTMj3wKPXk95seqwiPFAD1n35pDax2m+Ay6pCm3rvr
 rKBX1ax4OkPeZ7l/b32Ks+LnGlpsxAbPEHy1zfPsJuQTMChoKtc1g9SmVJz95eLi7YdQ
 1NN67ADT1CUxyAgE7zZ+8Lc2MFnp8KocEHAAg5nnirwgU4IjD3HJWMUm7CaHEXyjLLw6
 yUkQlrWxs8+EDvqHIEucAtmlklqWlZWf0qylvY+VwQDH3HqhSATS/nUEc5hDaJTXgF/2
 6O/ourRn1/8MlcTrm9yRDmNMlsfiXxa3+yZKy/0y4nc5U+EKe6tkQRND6iJqE1lCbSfT
 vkIg==
X-Gm-Message-State: AAQBX9dtaFwyAA9coqHEHcSMuZK3yOAFnowKw90bEWiGP3QeLnWxLKH+
 XWoSD3Dp7ImEs2ZxVgMKLBOpuBpJYAp3t001G6POdBtkPgK3QK4Ut/QpJqoxkeUA+jurVZZyCyU
 MNhDkDPdUysNWwp/C1ribKCQKvuiL0HwwbJFnV63c8wumkErfRvCP1dQzag==
X-Google-Smtp-Source: AKy350Yx2jXv2bwvXl5digwDDNYigt/JafXgIvcax59uBSGezgRYmnFAOOTv3pnCVVIvVt23kHmtYTM8/w==
X-Received: from digit-linux-eng.par.corp.google.com
 ([2a00:79e0:a0:1:d1d4:d452:da86:5ee0])
 (user=digit job=sendgmr) by 2002:a17:906:a4d:b0:931:faf0:3db1 with SMTP id
 x13-20020a1709060a4d00b00931faf03db1mr2648309ejf.4.1680715281041; Wed, 05 Apr
 2023 10:21:21 -0700 (PDT)
Date: Wed,  5 Apr 2023 19:21:06 +0200
Mime-Version: 1.0
X-Mailer: git-send-email 2.40.0.348.gf938b09366-goog
Message-ID: <20230405172109.3081788-1-digit@google.com>
Subject: [PATCH v2] Fix QEMU compilation on Debian 10
From: "David 'Digit' Turner" <digit@google.com>
To: qemu-devel@nongnu.org
Cc: "David 'Digit' Turner" <digit@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::549;
 envelope-from=3Ea4tZAUKCkwrwuw7u22uzs.q204s08-rs9sz121u18.25u@flex--digit.bounces.google.com;
 helo=mail-ed1-x549.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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

QEMU does not compile on an old Debian 10 system for the
following reasons:

- Several sources include recent kernel headers that are
  not provided by this system, and not listed in
  linux-headers/

- The libvhost-user.c source file ends up including a
  system kernel header, instead of the up-to-date
  standard-headers/ version that contains the right
  macro definition.

David 'Digit' Turner (3):
  Fix libvhost-user.c compilation.
  update-linux-headers.sh: Add missing kernel headers.
  Update linux headers to v6.3rc5

 include/standard-headers/drm/drm_fourcc.h    |  12 ++
 include/standard-headers/linux/ethtool.h     |  48 +++++++-
 include/standard-headers/linux/fuse.h        |  45 +++++++-
 include/standard-headers/linux/pci_regs.h    |   1 +
 include/standard-headers/linux/vhost_types.h |   2 +
 include/standard-headers/linux/virtio_blk.h  | 105 +++++++++++++++++
 linux-headers/asm-arm64/kvm.h                |   1 +
 linux-headers/asm-x86/kvm.h                  |  34 +++++-
 linux-headers/linux/const.h                  |  36 ++++++
 linux-headers/linux/kvm.h                    |   9 ++
 linux-headers/linux/memfd.h                  |  39 +++++++
 linux-headers/linux/nvme_ioctl.h             | 114 +++++++++++++++++++
 linux-headers/linux/vfio.h                   |  15 ++-
 linux-headers/linux/vhost.h                  |   8 ++
 scripts/update-linux-headers.sh              |   4 +-
 subprojects/libvhost-user/libvhost-user.c    |   6 +
 16 files changed, 467 insertions(+), 12 deletions(-)
 create mode 100644 linux-headers/linux/const.h
 create mode 100644 linux-headers/linux/memfd.h
 create mode 100644 linux-headers/linux/nvme_ioctl.h

-- 
2.40.0.348.gf938b09366-goog


