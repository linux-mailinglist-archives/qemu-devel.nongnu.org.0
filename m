Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C99600070
	for <lists+qemu-devel@lfdr.de>; Sun, 16 Oct 2022 17:11:58 +0200 (CEST)
Received: from localhost ([::1]:39168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ok5Iz-0003zq-Fm
	for lists+qemu-devel@lfdr.de; Sun, 16 Oct 2022 11:11:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1ok5Cc-0005sq-AP; Sun, 16 Oct 2022 11:05:26 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:39428)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1ok5CZ-0006rn-QJ; Sun, 16 Oct 2022 11:05:21 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 o17-20020a17090aac1100b0020d98b0c0f4so10708383pjq.4; 
 Sun, 16 Oct 2022 08:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8QP8pDQl5TD9EzPNpmN/PaUd3jAaQ4FFSFOzcCciNWg=;
 b=nEQHzRfes9adLc3H+325Td/yZMpFFDiHkybSyEEh/i7N1cxQ/mvKFHkhis3kHA9I8o
 mycIWeLZKp5sSVymWmJc9NCgQliANOG3DwHz7SUknkORMz5zM536YbiSv3VT6F/aMon8
 zzrZ+MWGWT5fK9YHAbCprdjIBc4IFNFUJ940dEjcVyyd05vslJ47q37BfyC27tovghwG
 lVwInkxS5Vasxf6ifuc8+d/xUD88zeahHfUWOlSNhvJf/SOu9fkTlDnG8U2ZxuXRsVsJ
 AnYh1d6hDCkdhFwtLMnpfB4tWpCiaIqLVHKJEQXFIh3OBTIr0N4HfacS+hDSrg0eJf1r
 5IUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8QP8pDQl5TD9EzPNpmN/PaUd3jAaQ4FFSFOzcCciNWg=;
 b=pb3kH6WP1M9w6hNavhb68ImTBbqfbxskCeOr4JZXXdjbUOD+En+nR5ZjSySi77hNUB
 iZdXV/xOiF8DotzCVleY1/JqZRgijjfuw/o+zOwYoBcxT1GtqWAphbXMVslXXdNQ8/wn
 l/lpUGLB+1Jg02cTmONZvLpNXIPlvSq2I6vlJHMpz0WSHoeGVTdYFDaevwDYop7zh2br
 by4ZSKx2cULP3P+fL7r2kXBCz7bj8McXt7Fb2AwaqPEHvzG/UxFioJp/qHvHYxIPhvcY
 1gb5VQGPSgO/jZ5M4gGaoA1Kl59EJlJOiWA5AT9eEP+Z0ypDYVVtO7T7Z4C4dhm7rQgF
 6tnQ==
X-Gm-Message-State: ACrzQf1I6g1WBoDraSAwBkbrMGT0/PUQwWWbHyX8njiveRKTzFW3C9BE
 exNqiaZDoM3mc2g3rTkD4STc5C/mAwaeVA==
X-Google-Smtp-Source: AMsMyM7edhk8Dn7cPzFWa2qJxw7L6+iouI/tHe3Ee7+Px24a22lUTUh1B3GTOpyFZnBSPxJUxOyA2A==
X-Received: by 2002:a17:902:9f97:b0:184:983f:11c5 with SMTP id
 g23-20020a1709029f9700b00184983f11c5mr7404438plq.89.1665932715428; 
 Sun, 16 Oct 2022 08:05:15 -0700 (PDT)
Received: from roots.. ([183.221.93.248]) by smtp.gmail.com with ESMTPSA id
 184-20020a6217c1000000b005623a138583sm5166707pfx.124.2022.10.16.08.05.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Oct 2022 08:05:15 -0700 (PDT)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: dmitry.fomichev@wdc.com, "Michael S. Tsirkin" <mst@redhat.com>,
 hare@suse.de, qemu-block@nongnu.org, damien.lemoal@opensource.wdc.com,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Sam Li <faithilikerun@gmail.com>
Subject: [RFC v3 0/2] Add zoned storage emulation to virtio-blk driver
Date: Sun, 16 Oct 2022 23:05:04 +0800
Message-Id: <20221016150506.172675-1-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.37.3
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=faithilikerun@gmail.com; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Note: the virtio-blk headers isn't upstream in the kernel yet therefore
marked as an RFC.

v3:
- use qemuio_from_buffer to write status bit [Stefan]
- avoid using req->elem directly [Stefan]
- fix error checkings and memory leak [Stefan]

v2:
- change units of emulated zone op coresponding to block layer APIs
- modify error checking cases [Stefan, Damien]

v1:
- add zoned storage emulation

Sam Li (2):
  include: update virtio_blk headers from Linux 5.19-rc2+
  virtio-blk: add zoned storage emulation for zoned devices

 hw/block/virtio-blk-common.c                |   2 +
 hw/block/virtio-blk.c                       | 412 +++++++++++++++++++-
 include/hw/virtio/virtio-blk.h              |  11 +-
 include/standard-headers/linux/virtio_blk.h | 109 ++++++
 4 files changed, 531 insertions(+), 3 deletions(-)

-- 
2.37.3


