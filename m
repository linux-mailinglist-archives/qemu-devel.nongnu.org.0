Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9362C54DF11
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 12:28:05 +0200 (CEST)
Received: from localhost ([::1]:48180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1mjM-0007FL-Lv
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 06:28:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nikita.lapshin@openvz.org>)
 id 1o1mcA-0006tR-Up
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 06:20:40 -0400
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235]:46017)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nikita.lapshin@openvz.org>)
 id 1o1mc6-0000UV-UR
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 06:20:37 -0400
Received: by mail-lj1-x235.google.com with SMTP id s10so956398ljh.12
 for <qemu-devel@nongnu.org>; Thu, 16 Jun 2022 03:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openvz-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xLll8c/0bFC5Kv+uYZ98u4kVrKBDnnI+LAN9UJuvyDI=;
 b=CyaN6iiO2gaPm5b8MTSLbrU5mF6i2lN+0qOcI2RmhIVw54vmGhpa1y1TuwpDk4Ufxv
 kKB74A157ZkcIGTO0fULADhC8d56wGmKsDjylSf31r9ksGaeP+sxH9C6tVMhEh7fHrt8
 fOt1ZxNNj0JqTVSCt6wH/QMtqm5VbRZsiHmKwfHEPvbC0m/49GzSfkX0eu0qSjQBKlKN
 Y6vDdgLVFniRdA+X9KUoi7N2Pbdqh5eBGkdpQu3oO0+HqSZX8HnZeuo6hwULoCle5KFN
 BxdkGGrWArq9GXrMnb7GR0c3nvJy1fdxDr56e+sn91p69HwdBCIGreTqKb/zEXOIqA10
 4tVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xLll8c/0bFC5Kv+uYZ98u4kVrKBDnnI+LAN9UJuvyDI=;
 b=5BmuzQ+x8ssXP9o6IxQPJrsPdmD1YOmhvlxxORQqRdJesFUZKool04u4oDD8qd+2+S
 UTchPMF/SZocDzMUl2Z+wsXJIbJdfaCfBU7QPU+UtR2XKjSbVj2Gk1YirJjxmJZJXDD4
 3c7VJl/ds7cfyZS9Rql9c0r3XM34KdAtZXfHK/vuLUrV9bWEkAJYM9YxvaCaNQ/Kq8eo
 TvPVRD+S4CtHabhcAoWZjMUI0mGF8EMm7Q8s/yNHyAR2GpOVnadqX73ScUjK8WVNgmG8
 j414E6KT4DnNLdAVUrpvrpX/FfClcOILxs8bpvxSpRoSw++aiM2q21sOtiFACnuuTi/H
 XuNA==
X-Gm-Message-State: AJIora9uJLW5CWZxUUUbklfZ2X/0Bito+QhXyY3AIRk22MhQMpogD3Zp
 Q7OFoxtspHiCpVy09L4mbzSAwb8uv9UJWmlk
X-Google-Smtp-Source: AGRyM1uE9EwQc8U6fp8b8BJb3np7P+XSeCpgXZyRNTxExwu2m89iqz9iCR6f8f3BP/FfdEIrY9apdQ==
X-Received: by 2002:a2e:8083:0:b0:258:eac9:70d2 with SMTP id
 i3-20020a2e8083000000b00258eac970d2mr2130331ljg.150.1655374826765; 
 Thu, 16 Jun 2022 03:20:26 -0700 (PDT)
Received: from localhost.localdomain ([93.175.28.49])
 by smtp.gmail.com with ESMTPSA id
 q17-20020a05651232b100b0047255d21166sm179014lfe.149.2022.06.16.03.20.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jun 2022 03:20:26 -0700 (PDT)
From: nikita.lapshin@openvz.org
To: qemu-devel@nongnu.org
Cc: den@virtuozzo.com, andrey.drobyshev@virtuozzo.com, quintela@redhat.com,
 dgilbert@redhat.com, nikita.lapshin@openvz.org
Subject: [PATCH 0/8] New parameter for migration stream
Date: Thu, 16 Jun 2022 13:19:56 +0300
Message-Id: <20220616102006.218693-1-nikita.lapshin@openvz.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::235;
 envelope-from=nikita.lapshin@openvz.org; helo=mail-lj1-x235.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Nikita Lapshin <nikita.lapshin@openvz.org>

We want to implement exteranl bg-snapshot tool for saving RAM. For this it
is important to be able manage migration stream because tool has no idea
about non-RAM part and how to parse it.

This paramter provides gurantee about migration content. Now there are 4
parts of migration stream which can be specified: "ram", "block",
"dirty-bitmaps", "vmstate". "vmstate" can be any section which handler has
vmdesc. "block" and "dirty-bitmpas" impleneted just like existing
capabilities.

This way of specifying can be extended on future parts of migration.

Nikita Lapshin (8):
  migration: Implemented new parameter stream_content
  migration: should_skip() implemented
  migration: Add vmstate part of migration stream
  migration: Add dirty-bitmaps part of migration stream
  migration: Add block part of migration stream
  migration: Add RAM part of migration stream
  migration: analyze-migration script changed
  migration: Test for RAM and vmstate parts

 migration/migration.c                         | 76 ++++++++++++++-
 migration/migration.h                         |  3 +
 migration/ram.c                               |  6 ++
 migration/savevm.c                            | 69 ++++++++-----
 qapi/migration.json                           | 21 +++-
 scripts/analyze-migration.py                  | 19 ++--
 .../tests/migrate-ram-stream-content-test     | 96 +++++++++++++++++++
 .../tests/migrate-ram-stream-content-test.out |  5 +
 8 files changed, 256 insertions(+), 39 deletions(-)
 create mode 100755 tests/qemu-iotests/tests/migrate-ram-stream-content-test
 create mode 100644 tests/qemu-iotests/tests/migrate-ram-stream-content-test.out

-- 
2.31.1


