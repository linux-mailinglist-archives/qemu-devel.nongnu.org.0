Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C3B6A7BA3
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 08:07:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXd2A-0002ud-Sy; Thu, 02 Mar 2023 02:07:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pXd28-0002uJ-BV
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 02:07:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pXd26-0005UJ-Jx
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 02:07:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677740835;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=f8W4VBKurxpSB3oSLZXR25rJC4EzEf5bzMM+FpD3jP4=;
 b=XHrAwGzOw0tz3Qme4HyOzqJjjhuQoIPYEzyzSXmD7fZcUHkd8ubRPKYLthG+SUghFAcEX2
 /zbqNYAnystZ86LaS2Dwnocrv0KkaxFBtpyC6fZpftLmnaaB7aWg/Gu62nHW74ZSaWFq99
 qhMA+SO+nVTZFSDsFFHEv7qQAYuLsTc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-62-ox3YKKzNNiuSn4S0vvRDzg-1; Thu, 02 Mar 2023 02:07:01 -0500
X-MC-Unique: ox3YKKzNNiuSn4S0vvRDzg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 59E5787A9E4;
 Thu,  2 Mar 2023 07:07:01 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.92])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 30F662166B2A;
 Thu,  2 Mar 2023 07:07:01 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 07BFE21E6A22; Thu,  2 Mar 2023 08:07:00 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org
Subject: [PULL 0/5] Monitor patches for 2023-03-02
Date: Thu,  2 Mar 2023 08:06:55 +0100
Message-Id: <20230302070700.2998086-1-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

The following changes since commit 627634031092e1514f363fd8659a579398de0f0e:

  Merge tag 'buildsys-qom-qdev-ui-20230227' of https://github.com/philmd/qemu into staging (2023-02-28 15:09:18 +0000)

are available in the Git repository at:

  https://repo.or.cz/qemu/armbru.git tags/pull-monitor-2023-03-02

for you to fetch changes up to 0f3fea217164e3925db91d46f21fc9fa11708e66:

  target/ppc: Restrict 'qapi-commands-machine.h' to system emulation (2023-03-02 07:51:33 +0100)

----------------------------------------------------------------
Monitor patches for 2023-03-02

----------------------------------------------------------------
Dongli Zhang (1):
      readline: fix hmp completion issue

Philippe Mathieu-Daudé (4):
      target/arm: Restrict 'qapi-commands-machine.h' to system emulation
      target/i386: Restrict 'qapi-commands-machine.h' to system emulation
      target/loongarch: Restrict 'qapi-commands-machine.h' to system emulation
      target/ppc: Restrict 'qapi-commands-machine.h' to system emulation

 target/ppc/cpu-qom.h                     |  2 +
 monitor/hmp.c                            |  8 +---
 target/arm/{monitor.c => arm-qmp-cmds.c} | 28 ++++++++++++
 target/arm/helper.c                      | 29 -------------
 target/i386/cpu.c                        | 74 +++++++++++++++++---------------
 target/loongarch/cpu.c                   | 27 ------------
 target/loongarch/loongarch-qmp-cmds.c    | 37 ++++++++++++++++
 target/ppc/cpu_init.c                    | 48 +--------------------
 target/ppc/{monitor.c => ppc-qmp-cmds.c} | 50 ++++++++++++++++++++-
 target/arm/meson.build                   |  2 +-
 target/loongarch/meson.build             |  1 +
 target/ppc/meson.build                   |  2 +-
 12 files changed, 161 insertions(+), 147 deletions(-)
 rename target/arm/{monitor.c => arm-qmp-cmds.c} (90%)
 create mode 100644 target/loongarch/loongarch-qmp-cmds.c
 rename target/ppc/{monitor.c => ppc-qmp-cmds.c} (78%)

-- 
2.39.0


