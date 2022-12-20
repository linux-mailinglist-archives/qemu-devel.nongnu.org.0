Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E52651FFC
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 12:58:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7aX9-0003zC-Uh; Tue, 20 Dec 2022 06:11:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7aWx-0003tP-O5
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 06:11:32 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7aWt-0003g8-Kr
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 06:11:30 -0500
Received: by mail-wr1-x430.google.com with SMTP id h16so11343594wrz.12
 for <qemu-devel@nongnu.org>; Tue, 20 Dec 2022 03:11:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=fVJHGwvdSALlI3TSuKGt0wEEThjZylR1RqmQ6XBl8QI=;
 b=QRd0bIQsshJiwdydBoAtg+xh3geYKkb91kF00NdB8y6P7Z2HneixJTSE6vl9fSsiFV
 AvAH/U+XB2ryKu/gWz3h0AdqkKudYJujis+25/6l9J8O4nREMwllfOlt3lCjE/Y8BPAS
 J7GXUF/TRo4q+IxMtPVYyntK9HRtuyUW/MDh5R8IW+OGeQBU2ai5s3G0zeSru1ZKuONi
 YSrHG4O4WpAAaYlR8gNcl1tl3ZZ33+tXZgHCZQTaMQJzU+jczC4Sns0n/Wltq/+aIkuZ
 vQLQ4aZhF1Pev3hO/d7XafSy7mNCu9/w3NRZS2bYReMS7qy4GN9hNN7hXjlETS7KlUOm
 qnWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fVJHGwvdSALlI3TSuKGt0wEEThjZylR1RqmQ6XBl8QI=;
 b=G4u44tObhICbSAGHvWKRmCv6arqbyzBN0FG6pwVoVMiW0JG8AzsGZ2pmLgUf+5Yvun
 QLBXha9/6fVm9axeWzCzzu8dASHMCtVDkxxm23fWgBqq4bLutFKH6XqCT7pvi07DNEn3
 SLfdhpi++va4zUMcrPU2ADQcPgjp3J48hctHLd02me3udqHMLi3YReCJGp2O710af2BO
 njkE2neFsgFGI+nX2s2P0bv3sFIsOlNaWI3Q3UEuS8sQ1ydQ8qRnCzAYbaKjvjJ+zeUA
 /DkPQob2WzASipH/GmbM9UowoQMy/Y85GUhj3JgOfzKMhA+9m6SOXK1Dm2VEIvBvLhRr
 wJeA==
X-Gm-Message-State: ANoB5pnWoANNEQgHsWQoUyNxQaNZuFVst2fu4y2icnQGfQlR/hmN/MWl
 0aUow7OGhH5CTvylRU/JyRI2R1YPcO5N4bbshHc=
X-Google-Smtp-Source: AA0mqf6McHPfulB7QEZ7vCeOnN8pQE3YHzb7CWnquHNoRcJlJkSeuRlMjHzOi3EmpejHacDTMYtW1g==
X-Received: by 2002:a5d:4a8f:0:b0:242:4c11:c062 with SMTP id
 o15-20020a5d4a8f000000b002424c11c062mr36029826wrq.28.1671534685749; 
 Tue, 20 Dec 2022 03:11:25 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 u1-20020a5d6ac1000000b00241cfe6e286sm12417498wrw.98.2022.12.20.03.11.24
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 20 Dec 2022 03:11:25 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>, Greg Kurz <groug@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Aurelien Jarno <aurelien@aurel32.net>, Huacai Chen <chenhuacai@kernel.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, qemu-arm@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Markus Armbruster <armbru@redhat.com>, Song Gao <gaosong@loongson.cn>
Subject: [PATCH RESEND v2 0/5] target: Restrict 'qapi-commands-machine.h' to
 system emulation
Date: Tue, 20 Dec 2022 12:11:17 +0100
Message-Id: <20221220111122.8966-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

[resend fixing my last name typography...]

All series reviewed, can patches be picked by corresponding
maintainers?

The "qapi-commands-machine.h" header is not generated in user-only
emulation. This series removes its use in user-emu code by moving
the QMP code depending on this header into a separate sysemu unit.

Since v1:
- renamed cpu-monitor.c -> monitor.c on loongarch

Philippe Mathieu-Daudé (5):
  target/arm: Restrict 'qapi-commands-machine.h' to system emulation
  target/i386: Restrict 'qapi-commands-machine.h' to system emulation
  target/loongarch: Restrict 'qapi-commands-machine.h' to system
    emulation
  target/mips: Restrict 'qapi-commands-machine.h' to system emulation
  target/ppc: Restrict 'qapi-commands-machine.h' to system emulation

 target/arm/helper.c            | 29 -------------
 target/arm/m_helper.c          |  1 -
 target/arm/monitor.c           | 28 +++++++++++++
 target/i386/cpu.c              | 74 ++++++++++++++++++----------------
 target/loongarch/cpu.c         | 27 -------------
 target/loongarch/meson.build   |  1 +
 target/loongarch/monitor.c     | 37 +++++++++++++++++
 target/mips/cpu.c              | 29 -------------
 target/mips/sysemu/meson.build |  1 +
 target/mips/sysemu/monitor.c   | 39 ++++++++++++++++++
 target/ppc/cpu-qom.h           |  2 +
 target/ppc/cpu_init.c          | 48 +---------------------
 target/ppc/monitor.c           | 50 ++++++++++++++++++++++-
 13 files changed, 197 insertions(+), 169 deletions(-)
 create mode 100644 target/loongarch/monitor.c
 create mode 100644 target/mips/sysemu/monitor.c

-- 
2.38.1


