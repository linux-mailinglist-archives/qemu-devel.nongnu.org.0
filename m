Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C89F49F062
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 02:16:40 +0100 (CET)
Received: from localhost ([::1]:51216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDFsV-00054x-8H
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 20:16:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nDFZO-0003Zf-HG
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 19:56:54 -0500
Received: from [2607:f8b0:4864:20::82d] (port=42505
 helo=mail-qt1-x82d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nDFZK-0005N3-RE
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 19:56:54 -0500
Received: by mail-qt1-x82d.google.com with SMTP id y17so3971068qtx.9
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 16:56:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SELyuhP/ufEKVsYfnTLRmWrOkk5Jw+/IqL36t4yS/4o=;
 b=ITFByDxNoZDEooiz7kAh9Z/r4fPRGMvbScemNefRTBKgA5r/LyrApfB/0WzWeuwEJz
 vnMHMudyJjbKoMt8meIuXQxHhns4R7F+eBAghF10yPr8HrKKfO41xpUaXTeNqL11s2r+
 szM6NSbS69cGiQLlKUEQhREKdz7G0WPfamHEaFazYm/O5QdsNwr8351yebdgkeNyQg6G
 n7DTIzQIDE/ur8Er560IJi1Ym2Mq7AozYyzgQ/NOcjZRXXJW65O1VbBNFB8vuZqht08G
 mWEy/xewl/zOqIWFRMZ+P+mHFqkjY5ZEDjPbsmF60oRbzMXsSs2VkEQgJwHl/hhAPAmF
 9mKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SELyuhP/ufEKVsYfnTLRmWrOkk5Jw+/IqL36t4yS/4o=;
 b=07xbiZrOFM/TnQ/hcNro3FgyG1dA/lJu+stGq4XJ6EymIYAjX7h41+xW6fKn9BqWSP
 OP4sJVekxTvGZRN+VmW1P1zlXDoww/bCeki24bAfdcs7p1lqv92q0d6K0DBIxPbGBl9k
 PqQ45nb/10pDq5FTSyq2SNjUo3TIIDhB5QwPgahlk27vWAx3c3AURL37aGlLO51Hn3tf
 inWpdBbnIv65mzkNaHKj0UyA4+9zz7uQSxYB4r5vfUzeRd8aThkxnogm+VpQbu8Pes29
 wrw27jqrokph3S8tti+XyYMX3/yNT9S1j3Oj5TO2JkjqX7AC5m1vAMM+ul9iWvCd3lMc
 k8tg==
X-Gm-Message-State: AOAM533eknMk0BziTRGuLrI/Nj+I9ZhqDUqQ+VyiHwzhS9Wl3FUuauDP
 56tg9GkIxnIK8S8SLjmkQ/Eve2AEflhLDQ==
X-Google-Smtp-Source: ABdhPJwEint8XXY3pqXoyRapb9Vp14rSWWWrBWHir0YkNTfo1YhJ2Ape4ALcJLZWctQexJoRj/qkmw==
X-Received: by 2002:ac8:758d:: with SMTP id s13mr4627428qtq.414.1643331381748; 
 Thu, 27 Jan 2022 16:56:21 -0800 (PST)
Received: from localhost.localdomain
 (209-6-248-219.s2265.c3-0.wrx-ubr1.sbo-wrx.ma.cable.rcncustomer.com.
 [209.6.248.219])
 by smtp.gmail.com with ESMTPSA id d8sm2182003qtd.70.2022.01.27.16.56.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 16:56:21 -0800 (PST)
From: Will Cohen <wwcohen@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 00/11] This is a followup to
 https://lists.gnu.org/archive/html/qemu-devel/2021-11/msg04325.html, 
Date: Thu, 27 Jan 2022 19:56:00 -0500
Message-Id: <20220128005611.87185-1-wwcohen@gmail.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::82d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::82d;
 envelope-from=wwcohen@gmail.com; helo=mail-qt1-x82d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>,
 hi@alyssa.is, Will Cohen <wwcohen@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Since v2, the following changes have been made:

- Re-add incorrectly omitted previous review header to final patch
- Remove redundant utimensat backwards compatibility
- Set XATTR_SIZE_MAX to 64k
- Integrate proposed statfs.h back into file-op-9p.h
- Replace clang references with gcc
- Ensure that synth tests pass

Keno Fischer (10):
  9p: linux: Fix a couple Linux assumptions
  9p: Rename 9p-util -> 9p-util-linux
  9p: darwin: Handle struct stat(fs) differences
  9p: darwin: Handle struct dirent differences
  9p: darwin: Ignore O_{NOATIME, DIRECT}
  9p: darwin: Compatibility defn for XATTR_SIZE_MAX
  9p: darwin: *xattr_nofollow implementations
  9p: darwin: Compatibility for f/l*xattr
  9p: darwin: Implement compatibility for mknodat
  9p: darwin: meson: Allow VirtFS on Darwin

Will Cohen (1):
  9p: darwin: adjust assumption on virtio-9p-test

 fsdev/file-op-9p.h                     | 15 +++-
 fsdev/meson.build                      |  1 +
 hw/9pfs/9p-local.c                     | 19 +++--
 hw/9pfs/9p-proxy.c                     | 18 ++++-
 hw/9pfs/9p-synth.c                     |  4 ++
 hw/9pfs/9p-util-darwin.c               | 97 ++++++++++++++++++++++++++
 hw/9pfs/{9p-util.c => 9p-util-linux.c} |  7 +-
 hw/9pfs/9p-util.h                      | 21 ++++++
 hw/9pfs/9p.c                           | 73 +++++++++++++++++--
 hw/9pfs/codir.c                        |  4 ++
 hw/9pfs/meson.build                    |  3 +-
 include/qemu/xattr.h                   |  4 +-
 meson.build                            | 12 ++--
 tests/qtest/virtio-9p-test.c           |  2 +-
 14 files changed, 257 insertions(+), 23 deletions(-)
 create mode 100644 hw/9pfs/9p-util-darwin.c
 rename hw/9pfs/{9p-util.c => 9p-util-linux.c} (90%)

-- 
2.34.1


