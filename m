Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC616B8F26
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Mar 2023 11:02:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pc1Sq-0008TD-6v; Tue, 14 Mar 2023 06:01:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dinahbaum123@gmail.com>)
 id 1pc1Sn-0008Ry-GC
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 06:01:01 -0400
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dinahbaum123@gmail.com>)
 id 1pc1Sl-0002Ng-Or
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 06:01:01 -0400
Received: by mail-qt1-x831.google.com with SMTP id x1so337025qtr.7
 for <qemu-devel@nongnu.org>; Tue, 14 Mar 2023 03:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678788057;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=yAHmYtndas7yZ+PvD53Whr6BeJ3arYInTWG3/YgP5jg=;
 b=m0EiHvACt8FctziFdmUYHd7ah7nGWxCwm3Fd75dUEwbLNj7m7o8REE0pPkvDZQoALc
 Y/3+RoAOBWKd7gRPa6Ajqw81z9YJWdTk6U1BnrMpz5xeJYCYvLq7lGmHEe6bOEjFhVwO
 z2CUVjFZxfRpp3dQ+ttlX6zylc9DipAsvsgJI7/BrzVkpT266oiTXMjMFwWDS+p6bhzY
 7qtgmmFg2xyMZNpptTO5Ctaylk8vPXdkv1OrjObfEraZl8ft8yi7FbW+2H/6vuEWzF0X
 CdKMYittiDImfhTFB4SopLVAe7/C3RRoViQsXOB3TEVrpdKea5QVlNZeRCqzW7A5KN+6
 VyYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678788057;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yAHmYtndas7yZ+PvD53Whr6BeJ3arYInTWG3/YgP5jg=;
 b=iyhcPMOffHic58Wf9/nex5R7XxuoX1sN36fPvibtR6QIQ2membuFUkoh8tfmoNQgZN
 Wn0PKtqKQvmD79kpd1dB+yTp5u/cHr9twwDa7dUFjneXwR743m/p6Adv2rgAtl9isfmH
 rgeHBYB3BWiyRvDaa9fimMMR93oqJ/bp3IJ/X5MA2NsslHwNstvX8B3+RvKQ/i9kqpJ4
 cZwMb3IIC++iI+2dgJxS1rKEIyCEvCHpIdykP7zDAhgIuvqkUPyMEMWiuxE/d1RvskjL
 tSathEBtFO7C3RxeCEsSUTZPMc+JBqiHOi6X+kFonFeBCHUR2cbW29Znwcc7OuYO9ohQ
 yx5g==
X-Gm-Message-State: AO0yUKUfbjZMTutDn98pdIeiibkxIqvDSArFgEn9rvL/mHs7Cm1JLQt2
 hPOhp2rblEYQZBJTK2W6FlClLDnzaZY=
X-Google-Smtp-Source: AK7set9SD2mIm/V92Znfo/N8V4baYPLed5EqqMGV7X3zB3Z46Vp7NdDlZBGR1qp58llMAqBJREbDtQ==
X-Received: by 2002:a05:622a:488:b0:3bf:c431:ea6e with SMTP id
 p8-20020a05622a048800b003bfc431ea6emr30495045qtx.3.1678788056704; 
 Tue, 14 Mar 2023 03:00:56 -0700 (PDT)
Received: from debian.hsd1.ma.comcast.net ([2601:182:cc00:77b0::675])
 by smtp.gmail.com with ESMTPSA id
 j15-20020ac8404f000000b003b323387c1asm1288812qtl.18.2023.03.14.03.00.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Mar 2023 03:00:56 -0700 (PDT)
From: Dinah Baum <dinahbaum123@gmail.com>
To: qemu-devel@nongnu.org
Cc: Dinah Baum <dinahbaum123@gmail.com>
Subject: [PATCH v2 0/3] Enable -cpu <cpu>,help
Date: Tue, 14 Mar 2023 06:00:23 -0400
Message-Id: <20230314100026.536079-1-dinahbaum123@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::831;
 envelope-from=dinahbaum123@gmail.com; helo=mail-qt1-x831.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Part 1 is a refactor/code motion patch for
qapi/machine target required for setup of

Part 2 which enables query-cpu-model-expansion
on all architectures

Part 3 implements the '<cpu>,help' feature

Limitations:
Currently only 'FULL' expansion queries are implemented since
that's the only type enabled on the architectures that
allow feature probing

Unlike the 'device,help' command, default values aren't
printed

Dinah Baum (3):
  qapi/machine-target: refactor machine-target
  cpu, qapi, target/arm, i386, s390x: Generalize
    query-cpu-model-expansion
  cpu, qdict, vl: Enable printing options for CPU type

 MAINTAINERS                      |   1 +
 cpu.c                            |  61 +++++++++++++++
 include/exec/cpu-common.h        |  10 +++
 include/qapi/qmp/qdict.h         |   2 +
 qapi/machine-target-common.json  | 130 +++++++++++++++++++++++++++++++
 qapi/machine-target.json         | 129 +-----------------------------
 qapi/meson.build                 |   1 +
 qemu-options.hx                  |   7 +-
 qobject/qdict.c                  |   5 ++
 softmmu/vl.c                     |  36 ++++++++-
 target/arm/arm-qmp-cmds.c        |   7 +-
 target/arm/cpu.h                 |   7 +-
 target/i386/cpu-sysemu.c         |   7 +-
 target/i386/cpu.h                |   6 ++
 target/s390x/cpu.h               |   7 ++
 target/s390x/cpu_models_sysemu.c |   6 +-
 16 files changed, 278 insertions(+), 144 deletions(-)
 create mode 100644 qapi/machine-target-common.json

-- 
2.30.2


