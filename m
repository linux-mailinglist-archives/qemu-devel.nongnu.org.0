Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E740346862
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 20:02:17 +0100 (CET)
Received: from localhost ([::1]:39858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOmIC-00042O-FA
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 15:02:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lOlcu-00082q-9h; Tue, 23 Mar 2021 14:19:39 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:36610)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lOlcq-0006dT-1B; Tue, 23 Mar 2021 14:19:35 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 j20-20020a05600c1914b029010f31e15a7fso5544390wmq.1; 
 Tue, 23 Mar 2021 11:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Y+iokgZHqUvblHm7VFfICZzv6i6RKfb+gYdBq4jE44g=;
 b=Em0+ljbyiO2xJBDO0sppQRvQbzOZ8DFjGtJ1WrBeo9fzm68v+T65oS8UA8iX2Lwfnj
 pN9Xcxdy3jxNmzhyM6WpvUhTJxZmj+MX6vMSpnMtKyC+0WI1Y5v/UNEluI2uksekIAQr
 81kr7lmdC/2GC6vm214fq+5GWI4gLmWWjjIWziEbFrScrZoj5NoWXDLeb+ogrD+cM5CQ
 HNSyUKTXCVhaK4C/UzjeD2Rl/SBD8LoJA8XdEOgLwmrrFDRZGDXOjjZE4XbgJxoR3MMC
 QeM84RywDHQtAOV6t08FDoskvZ5a2cZkN8PPUn2yTRdzKsk/A972zLRRwna29GCBAwrR
 nzYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=Y+iokgZHqUvblHm7VFfICZzv6i6RKfb+gYdBq4jE44g=;
 b=RG0oLxVLhIsOCGsGAFKbBDf8oH1/2rsGTKI/rn9+5AIo4dXBnVjDB3Odb2HFSRWbVv
 Ff9m9ikOKv06cpcuTw6rxAj6Zh3WsGOzbwGsGa2FZWJZQHdAq40+CUlZo6UeVb1F98nL
 DZUf+utty/i8UUPk4FkKTaneA6+CwlHxxilVyZf+lzsoH9DG2LXGlsLnJo8IcxgJ+b1K
 a1XfLSjTiXG7IkTC3BAQ+RdtmJG982D7oCdXT7AjLOE0uE11oUtZp169QOBDB1gt2+At
 n8KjlKDpf7++yj8Gb/ben6DePuF8lvK9PJg2p93Q+32/8upc3Nzce2jfolFxDu7ge3ln
 Y5XA==
X-Gm-Message-State: AOAM532m4Oy8mLCW71QERYp/uvvQoFNQc5WMtbKDVIiTokLGbKg5s7Ew
 +ImueoU1U0F1gvypMYotqqUNpJPDE24=
X-Google-Smtp-Source: ABdhPJxjmlTcpyMelPQM6tCMe8QSwxVvtM6uIF1vnEhyEDb9mZf6tAaKLPCkKM1mmEN1hfpn3KI66Q==
X-Received: by 2002:a05:600c:284:: with SMTP id 4mr4671489wmk.24.1616523569705; 
 Tue, 23 Mar 2021 11:19:29 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 u8sm24204412wrr.42.2021.03.23.11.19.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 11:19:29 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/5] qemu-iotests: quality of life improvements
Date: Tue, 23 Mar 2021 19:19:22 +0100
Message-Id: <20210323181928.311862-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: eesposit@redhat.com, kwolf@redhat.com, vsementsov@virtuozzo.com,
 qemu-block@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series adds a few usability improvements to qemu-iotests, in
particular:

- arguments can be passed to Python unittests scripts, for example
  to run only a subset of the test cases (patches 1-2)

- it is possible to do "./check -- ../../../tests/qemu-iotests/055 args..."
  and specify arbitrary arguments to be passed to a single test script.
  This allows to take advantage of the previous feature and ease debugging
  of Python tests.

Paolo

v1->v2: patches 1-2 are a rewrite of v1's patch 1
        moved print_env change to patch 4
        do not use argparse.REMAINDER

Paolo Bonzini (5):
  qemu-iotests: do not buffer the test output
  qemu-iotests: allow passing unittest.main arguments to the test
    scripts
  qemu-iotests: move command line and environment handling from
    TestRunner to TestEnv
  qemu-iotests: let "check" spawn an arbitrary test command
  qemu-iotests: fix case of SOCK_DIR already in the environment

 tests/qemu-iotests/check         | 15 +++++-
 tests/qemu-iotests/iotests.py    | 78 +++++++++++++++++++-------------
 tests/qemu-iotests/testenv.py    | 22 +++++++--
 tests/qemu-iotests/testrunner.py | 15 +-----
 4 files changed, 81 insertions(+), 49 deletions(-)

-- 
2.30.1


