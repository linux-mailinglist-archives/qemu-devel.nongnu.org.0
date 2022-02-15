Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0D484B5F0F
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 01:30:09 +0100 (CET)
Received: from localhost ([::1]:35494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJljM-0006dp-CW
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 19:30:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nJlgV-0005No-M7
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 19:27:11 -0500
Received: from [2607:f8b0:4864:20::430] (port=36833
 helo=mail-pf1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nJlgT-0002yc-LB
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 19:27:11 -0500
Received: by mail-pf1-x430.google.com with SMTP id z16so10151274pfh.3
 for <qemu-devel@nongnu.org>; Mon, 14 Feb 2022 16:27:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gBxEdXK4NgOejp71nnLyyGOU9/xjfgVNHN27SNO4ukE=;
 b=iuNZM0leSSudeYMgc3hG5SXDRbQeRVphrdgA3WF2frD4MS7C8mLIs+CfG9DabQsBEg
 D2/yA54GgukONSyH+bhZO0JK3csE3UQpw9IgEJKtoXBUOpi2RGzgpHpnpS5tkovdZMgt
 4btZ4xAtBUY+bHje9Z6CtNRfnDRLRVXh+N/8AhNLqH7cH18bZuTNp5FZd9r5FTyan9ZS
 TrUxZkExAYk9DzCBfo6KdUzSkcwA9LyZ+tNCZgASxCajcUn3GmRsOWatjgW8FNZw6tm0
 BnlszFzt+PvpcPxaHi2T75O6n6mkNM59ZSNDnVtWJ9Fn04K5UtPp7CRX5ms+hnAb9M+S
 Nb3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=gBxEdXK4NgOejp71nnLyyGOU9/xjfgVNHN27SNO4ukE=;
 b=uSc4l0AHjddHCtYMJCmXrutB5+Aw/74bu0G0AOFT3nUPGao/1zgg1H5B62Ja5Sk4ZO
 a4AzSMFlmmj4AgLYhRA/3rqtTcdmBqtqx4BbBDBCJ3HcpBAfwtlmXw546vqZtbYWcqql
 jEdVjU2IRNqk/PRa7ajE92qbIJLamNhtdPXgFx+Fpl1z2MQFVjl4G4PNgEmK7M49f74E
 YI+jaf3L/l7kT6GDbTkWyAHPtkODHPMMpd1G42G3Wftb3Fon246VlDLCzG4o1Ju2uIns
 7kCopO28bC7iRusr2ydfWDPxo4mmh7aiOhkOHt90Fvb0Igo53ebceSRPHaCAA809Pcf3
 lVdQ==
X-Gm-Message-State: AOAM532rxFy++WJhRHdGzJlDnY9SxjS6gZ9ImhFcyE5SRQcyilUFQH9j
 Za7M2r9hbhqJKhvg0zbm2lg=
X-Google-Smtp-Source: ABdhPJzZO/Ni9uuTCJqNlexrbDDISRW0XqVb5sndFzCpOyxRpZgHZNCgUFUxPoJayviRqkfZLmOITQ==
X-Received: by 2002:a65:62d7:: with SMTP id m23mr1295682pgv.329.1644884828072; 
 Mon, 14 Feb 2022 16:27:08 -0800 (PST)
Received: from localhost.localdomain (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71])
 by smtp.gmail.com with ESMTPSA id fv9sm15550780pjb.7.2022.02.14.16.27.02
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 14 Feb 2022 16:27:07 -0800 (PST)
To: Richard Henderson <richard.henderson@linaro.org>,
 Mark Burton <mark.burton@greensocs.com>, qemu-devel@nongnu.org
Cc: Amir Gonnen <amir.gonnen@neuroblade.ai>, Eric Blake <eblake@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>,
 Damien Hedde <damien.hedde@greensocs.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Mirela Grujic <mirela.grujic@greensocs.com>,
 Juan Quintela <quintela@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [NOTFORMERGE PATCH 0/1] target: Toward heterogeneous machine
Date: Tue, 15 Feb 2022 01:26:57 +0100
Message-Id: <20220215002658.60678-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::430
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x430.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 PDS_HP_HELO_NORDNS=0.635, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

Hi, following last week KVM call [1], I'm posting my playground
machine to slowly work toward heterogeneous QEMU. This is
orthogonal to Paolo / Markus / Daniel effort to have a
qemu-system-qmp CLI entrypoint [2].

After refactoring a bit the headers to remove target-specific
dependencies, we can remove the targets (and accelerators)
from the picture, to have a target-agnostic QEMU.

This binary helps to find a lot of code abuses where we only
expect one target being built, and is useful to clean that.

So far my naive roadmap draft is:

- Ignoring target-specific hardware devices, target-agnostic
  code should only use the CPUClass and CPUState to interface
  with the target-specific code.

- CPU objects shouldn't access an unique global accelerator,
  but should be initialized with a specific accelerator.

- Each target registers as a QEMU module. Should we expose
  a target API beside the CPU?

- Compile TCG-target-specific objects in each target dir?

- Refactor buildsys to register multiple targets.

- TBC.

[1] https://lore.kernel.org/qemu-devel/87fsot761s.fsf@secure.mitica/
[2] https://lore.kernel.org/qemu-devel/20220208144458.1079634-1-pbonzini@redhat.com/

Based-on: <20220214183144.27402-1-f4bug@amsat.org>
"target: Use ArchCPU & CPUArchState as abstract interface to target CPU"
https://lore.kernel.org/qemu-devel/20220214183144.27402-1-f4bug@amsat.org/

Philippe Mathieu-Daudé (1):
  target: Add system emulation aiming to target any architecture

 configs/devices/any-softmmu/default.mak |  1 +
 configs/targets/any-softmmu.mak         |  3 +++
 hw/any/meson.build                      |  5 +++++
 hw/meson.build                          |  1 +
 include/sysemu/arch_init.h              |  1 +
 meson.build                             |  6 +++--
 qapi/machine.json                       |  2 +-
 target/Kconfig                          |  1 +
 target/any/Kconfig                      |  4 ++++
 target/any/cpu-param.h                  | 30 +++++++++++++++++++++++++
 target/any/cpu.h                        | 26 +++++++++++++++++++++
 target/any/meson.build                  |  8 +++++++
 target/meson.build                      |  1 +
 13 files changed, 86 insertions(+), 3 deletions(-)
 create mode 100644 configs/devices/any-softmmu/default.mak
 create mode 100644 configs/targets/any-softmmu.mak
 create mode 100644 hw/any/meson.build
 create mode 100644 target/any/Kconfig
 create mode 100644 target/any/cpu-param.h
 create mode 100644 target/any/cpu.h
 create mode 100644 target/any/meson.build

-- 
2.34.1


