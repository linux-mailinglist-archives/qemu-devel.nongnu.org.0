Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74F6E5EBF41
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 12:10:01 +0200 (CEST)
Received: from localhost ([::1]:51684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od7XM-0003vZ-Jr
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 06:10:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1od7ND-0007SI-Hx
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 05:59:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30979)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1od7NA-0008R7-JG
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 05:59:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664272767;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=WnxmpGy2n51Zj3uJ9zxv+437/YXRvgYfcWZApmdXrwM=;
 b=CrPqkshHhI8xu3m5SqqdlRs/BCbTiSq5NmwXeL/JSNBwDQBTnx7lRL3aUIAbaP2jDG9YZo
 qnQMVV9Vd+qz/5ZOrSDGgprwrHStGe8TmrNWXP/p47bVCJFWSyR1uXsbcxM0onRRrpPEWa
 RBP75abOvzXhHFPUH5zR978hEscqqHU=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-423-poiIdmi6P8-7QpYDkTSeMw-1; Tue, 27 Sep 2022 05:59:26 -0400
X-MC-Unique: poiIdmi6P8-7QpYDkTSeMw-1
Received: by mail-ed1-f70.google.com with SMTP id
 b17-20020a056402351100b00453b19d9bd0so7314474edd.4
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 02:59:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=WnxmpGy2n51Zj3uJ9zxv+437/YXRvgYfcWZApmdXrwM=;
 b=YBR58IyfQ3T2hS784FlTzRpXHT5DQzqid2C3PtEspmtgL7EpIJYmOb4jE14UTrFr5H
 ExkYhb6xu0Zv+kClBVr23brsGBYKr+GEAuQs7VEJ6v8s4Cfe+iZDtXXTfHmMXZi9gDhM
 KkMyJs2l002jwPfxM/1Sg8KBgnHIcleY5yyBkRbffrRqfYriVsgd+zCyn4wfHds45frY
 z9V+F3o82jti6+Vn4gqOhfw3atu4Ym/CBH/CJNuY4OCCuVBsLoXIWnkXCSySs/VAAG/R
 Fepn3KmvzmX2tN6pFwW6rOX8KTvx2NdxZGsXvfTdwCAYHfWykADDLAofM2TTb59PA2X/
 CpUQ==
X-Gm-Message-State: ACrzQf2wSxksYyIyZc+C9xFBlHRHA1wGBHKsy8T4KoqQ+kiYj3VZZEIh
 kLFdaLyDBibj+KH/yIPLAvUe1tnti1La/9ybHZ2Xl0uLJ199d83xzRBr1Z5+4uqVlGtu3Avg5wI
 vmxjzXKuC99hRJ8wRajeT3AO0pdAvb06PMtggIeB0wl8gVM50uBfeFzsytbsbBHQsp2k=
X-Received: by 2002:a17:907:168a:b0:782:9a6f:cd5f with SMTP id
 hc10-20020a170907168a00b007829a6fcd5fmr17451704ejc.428.1664272764625; 
 Tue, 27 Sep 2022 02:59:24 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4xj13pi/0HriBefJ0QEPPOpUuehk16C//oWu5x5BOTbn4qjr8IKshwdsxTJ1TO2liYtaBFDw==
X-Received: by 2002:a17:907:168a:b0:782:9a6f:cd5f with SMTP id
 hc10-20020a170907168a00b007829a6fcd5fmr17451690ejc.428.1664272764320; 
 Tue, 27 Sep 2022 02:59:24 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 io7-20020a17090780c700b00771cb506149sm542728ejc.59.2022.09.27.02.59.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Sep 2022 02:59:23 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: marcandre.lureau@redhat.com
Subject: [PATCH 0/5] Small meson updates for QEMU 7.2
Date: Tue, 27 Sep 2022 11:59:16 +0200
Message-Id: <20220927095921.261760-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

Update Meson to 0.61.5 to fix a few longstanding issues:
- `checkinstall` on Debian Bullseye fails with `FileNotFoundError:` (#848)
- Meson warns about a broken Python install on Debian/Ubuntu (#873)
- dbus-display must be built as a module

Paolo Bonzini (5):
  ui: fix path to dbus-display1.h
  meson: require 0.61.3
  meson: multiple names can be passed to dependency()
  configure, meson: move C++ compiler detection to meson.build
  configure, meson: move linker flag detection to meson

 configure                       | 75 +--------------------------------
 meson                           |  2 +-
 meson.build                     | 67 +++++++++++++++++++----------
 qga/meson.build                 |  2 +-
 scripts/main.c                  |  1 +
 tests/qtest/dbus-display-test.c |  2 +-
 ui/dbus.h                       |  2 +-
 7 files changed, 50 insertions(+), 101 deletions(-)
 create mode 100644 scripts/main.c

-- 
2.37.3


