Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 385B740CB7D
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 19:14:43 +0200 (CEST)
Received: from localhost ([::1]:42896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQYUb-0001OB-PY
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 13:14:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mQY0Y-0003Rq-1D
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 12:43:39 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:39569)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mQY0S-0006Ya-Q0
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 12:43:37 -0400
Received: by mail-ed1-x533.google.com with SMTP id h17so5880245edj.6
 for <qemu-devel@nongnu.org>; Wed, 15 Sep 2021 09:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JFlliBat+zzIFPe47YHh0SA10XgO+nHZfXQTWW6ZzM4=;
 b=bTJr4QOdyMjqxYA/IpEj1YUdE+kbtpkKqPkPBS4w/zyDHq3m1HRw88k+cgta/aXGNE
 mv7U0lw+h75oJbpSpfb/Om+OpDvZFB4X7FCSbsXGv2wFS8sTX2eklaxnnJmO97OL3gnQ
 UkBzxi2nFcP4z3o9BnIwvmu5Lux16GAwbluq9fRNM1dyBSLDMvZ1tyBpOU5FN0zjomiG
 TYUaGlYHM1IFeSkqCY+QqtbDR8wlj3IPy3idlZ9WnxTDDgYj5teo8HCm9GdzqMJV62Qn
 aVtSWnOJtijW8uZS9NGHSaUtPbDeM4tJusG25gChyYA1pZOG2BVji2YqlopTgYDVxm0I
 MeSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=JFlliBat+zzIFPe47YHh0SA10XgO+nHZfXQTWW6ZzM4=;
 b=a4KCHCwqerD5PU3DooCBjCkwf8r/vrAOZPE9YarsK1oo8pxa+NyFcDUYuDXCDjGxnq
 eoHAq8EiqE3cqTz/H+dd9RAx4Eu7bU1yI8bf6nORKDxxquo+RHrr1XYVQLonYArALAwZ
 7ZJo1/ce5OqP4aIDhdAnG3Z+Q/1Xw+VeW0sCKcXxpxMNiZnUy5++ZNnTxhPlXJOvPGVh
 PmlTvGLZmDLn3pVowFVoR17rqXDjNtjzyGnxL1d/ejPMw2qwffMGuP2N6c/WEjDFr9jt
 8OOjDxO8Bh2bht8hmdV6Tsj5ivT0H7vOcv+g0AfpYKfbnGXF9nktqjW8H7UZ/NAfVDWJ
 qcZw==
X-Gm-Message-State: AOAM532A2foGLoB8x/eIbs1X+8LnL2m5vxGBCqlxrbGktIJOewjj0/Ow
 7mnV8nztUcted+J5ICAeb39TAYWP8yE=
X-Google-Smtp-Source: ABdhPJyyz1+1+BaHa0v+QLvQiOCh9zp9Uin2XGYHdwu5fYuMZwno0mkIQf0JzTjhhqcgXz4hdiznEQ==
X-Received: by 2002:a17:906:36d6:: with SMTP id
 b22mr906466ejc.387.1631724210700; 
 Wed, 15 Sep 2021 09:43:30 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id v1sm238319ejd.31.2021.09.15.09.43.30
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Sep 2021 09:43:30 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/4] Update meson version
Date: Wed, 15 Sep 2021 18:43:25 +0200
Message-Id: <20210915164329.13815-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x533.google.com
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

The following changes since commit 831aaf24967a49d7750090b9dcfd6bf356f16529:

  Merge remote-tracking branch 'remotes/marcandre/tags/misc-pull-request' into staging (2021-09-14 18:14:56 +0100)

are available in the Git repository at:

  https://gitlab.com/bonzini/qemu.git tags/for-upstream

for you to fetch changes up to 3bfc2d0b71a59e17b886769d56bef2771701f4f0:

  target/xtensa: list cores in a text file (2021-09-15 09:12:55 +0200)

----------------------------------------------------------------
* Update Meson to 0.58.2

----------------------------------------------------------------
Paolo Bonzini (4):
      meson: bump submodule to 0.58.2
      meson: switch minimum meson version to 0.58.2
      hexagon: use env keyword argument to pass PYTHONPATH
      target/xtensa: list cores in a text file

 configure                     |  8 ++-----
 docs/meson.build              | 14 +++++------
 meson                         |  2 +-
 meson.build                   | 54 ++++++++++++++++++++-----------------------
 plugins/meson.build           |  4 ++--
 scripts/mtest2make.py         |  7 ++----
 target/hexagon/meson.build    |  3 ++-
 target/xtensa/cores.list      |  9 ++++++++
 target/xtensa/import_core.sh  |  3 +++
 target/xtensa/meson.build     |  4 ++--
 tests/qapi-schema/meson.build |  4 ++--
 tests/qtest/meson.build       |  2 +-
 tests/unit/meson.build        |  2 +-
 trace/meson.build             |  4 ++--
 14 files changed, 61 insertions(+), 59 deletions(-)
 create mode 100644 target/xtensa/cores.list
-- 
2.31.1


