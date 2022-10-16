Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5894A60003E
	for <lists+qemu-devel@lfdr.de>; Sun, 16 Oct 2022 17:03:01 +0200 (CEST)
Received: from localhost ([::1]:33160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ok5AK-0003b2-DS
	for lists+qemu-devel@lfdr.de; Sun, 16 Oct 2022 11:03:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1ok54D-0006Da-SZ; Sun, 16 Oct 2022 10:56:42 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:34329)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1ok54C-0005iI-B8; Sun, 16 Oct 2022 10:56:41 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 a5-20020a17090aa50500b002008eeb040eso11044300pjq.1; 
 Sun, 16 Oct 2022 07:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=X3aGVU6DZbKEBn5wFSqAVMToXz5wGJF3ED4sg+WzYNE=;
 b=VdK/Z1S6bdgVjEtFPH7Az2j700UpBpc0QRWCh6+Q+Ux846cEU2Nt5+y5gHR+hsGKe8
 t/94D3muNafGEOlm1uyvAZXA4ArAXYLQzBt5bntOxSQ5hQkVN3bBRuQPItsxL6TU+7d1
 bxrhbRKXN/SWmkqnYmTZa0jqh4UC1ILxPdNLcJkQmP8O61UlOsejoLYI/k9gxKrq6MWn
 wtH0xKqlZf+I6lmV1oUOav74FeG9bgQpdNM9RrEBivVbD5DzeIB4jdRMSVdKFQBjRya5
 tuyTkAKZqzvMDijjTIosoaOk732URIYuG2KDAs2WEThoWUBjJ4hYZK6s3LNEOHV6FyNu
 2TMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=X3aGVU6DZbKEBn5wFSqAVMToXz5wGJF3ED4sg+WzYNE=;
 b=4pKehbpsbSixYDYMQEBA56qOzN35rCVSRrHPREKvKxHLjKS0y9By/4E/qEqOkXT3Db
 NqpOETZAcyJ2X28JJVxzGBO/LjhwTKpydPFPsYkRogcxXr1ZM8pY/4DNg66sBxFOt1HM
 C51D8oNafMnq8DqnVlTckJXAAI8Es+Z2GRC1xJbuGYwiH//JIQp5mA7r/2JbFMZnkUEE
 em0jMIozkcMBoHlvt80KxkLUtgiBRSoKZvfsB98l6u1vjc+8Fujl1KNrnLtClArxuAnl
 YZfKH93IWNaw4yKb7yH1iF3UO53NeefwSG6uBp6fG+URuJdPzkvBrsONMkKa8CASLBa6
 vzwg==
X-Gm-Message-State: ACrzQf0QvsJhR/t7Fngz9elk88+/fCzZsp3oiNED2C6OiXxk6Pe5nRsp
 5ZG1OIwbJJFUR1zEfWPaPUK2AtIHyhMIAQ==
X-Google-Smtp-Source: AMsMyM5BQE93dcau6SYW8tSUMNUTgG0PBve63gNIKB9+mjOf4qst3we+4cB1jHlF7JMACiSBzTq+gw==
X-Received: by 2002:a17:902:ced1:b0:184:ba6e:8c3b with SMTP id
 d17-20020a170902ced100b00184ba6e8c3bmr7573222plg.160.1665932197614; 
 Sun, 16 Oct 2022 07:56:37 -0700 (PDT)
Received: from roots.. ([183.221.93.248]) by smtp.gmail.com with ESMTPSA id
 75-20020a62154e000000b00562a8150c08sm5070380pfv.168.2022.10.16.07.56.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Oct 2022 07:56:37 -0700 (PDT)
From: Sam Li <faithilikerun@gmail.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, dmitry.fomichev@wdc.com,
 Hanna Reitz <hreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Fam Zheng <fam@euphon.net>, damien.lemoal@opensource.wdc.com, hare@suse.de,
 qemu-block@nongnu.org, Sam Li <faithilikerun@gmail.com>
Subject: [PATCH v4 0/3] Add zone append write for zoned device
Date: Sun, 16 Oct 2022 22:56:23 +0800
Message-Id: <20221016145626.171838-1-faithilikerun@gmail.com>
X-Mailer: git-send-email 2.37.3
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=faithilikerun@gmail.com; helo=mail-pj1-x1029.google.com
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

v4:
- fix lock related issues[Damien]
- drop all field in zone_mgmt op [Damien]
- fix state checks in zong_mgmt command [Damien]
- return start sector of wp when issuing zap req [Damien]

v3:
- only read wps when it is locked [Damien]
- allow last smaller zone case [Damien]
- add zone type and state checks in zone_mgmt command [Damien]
- fix RESET_ALL related problems

v2:
- split patch to two patches for better reviewing
- change BlockZoneWps's structure to an array of integers
- use only mutex lock on locking conditions of zone wps
- coding styles and clean-ups

v1:
- introduce zone append write

Sam Li (3):
  file-posix: add the tracking of the zones write pointers
  block: introduce zone append write for zoned devices
  qemu-iotests: test zone append operation

 block/block-backend.c              |  65 ++++++++
 block/file-posix.c                 | 229 ++++++++++++++++++++++++++++-
 block/io.c                         |  21 +++
 block/raw-format.c                 |   8 +
 include/block/block-common.h       |  14 ++
 include/block/block-io.h           |   3 +
 include/block/block_int-common.h   |   8 +
 include/block/raw-aio.h            |   4 +-
 include/sysemu/block-backend-io.h  |   9 ++
 qemu-io-cmds.c                     |  63 ++++++++
 tests/qemu-iotests/tests/zoned.out |   7 +
 tests/qemu-iotests/tests/zoned.sh  |   9 ++
 12 files changed, 436 insertions(+), 4 deletions(-)

-- 
2.37.3


