Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C89622BF72
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jul 2020 09:36:33 +0200 (CEST)
Received: from localhost ([::1]:36092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jysFs-0007HT-6K
	for lists+qemu-devel@lfdr.de; Fri, 24 Jul 2020 03:36:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jysEs-0006Q3-AW
 for qemu-devel@nongnu.org; Fri, 24 Jul 2020 03:35:30 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:50261)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jysEq-0007i6-MG
 for qemu-devel@nongnu.org; Fri, 24 Jul 2020 03:35:30 -0400
Received: by mail-wm1-x342.google.com with SMTP id c80so7074122wme.0
 for <qemu-devel@nongnu.org>; Fri, 24 Jul 2020 00:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+nNqMt/BZv7ln0PdX+r18GLXJMBiluBgWiKc1zsOhoM=;
 b=Y8s7F2z77fiyikUE9MsOrJkIiFcV63fVlTfB6/t96490uKawAApTeUbd45ghfcpbCn
 X8TsmGYwbGcT24IntTdPaIhrMzwSk0v4aJuQKCyAD3d9qBZ55JDqE1cXdxKUx0yHAawT
 g1YJYcUWiJzIeCdUCk/QYfvDelC+BghIG0WC/9yRHaEzrjIgAh+7bLX6Hm+O5DHy7XL8
 LLTUfsgCgsLWQrU2XzXKae+zZO11Dx27e88nNsxPFT8cKzu4oV9QtCyglU2fpPQROe3X
 3xkYIbqIUvdBx1s4DnJ0E011YWzrYTFtN8mTutobTkbIMemP9VaSHNBTOEDPVZdwqcE8
 hf0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=+nNqMt/BZv7ln0PdX+r18GLXJMBiluBgWiKc1zsOhoM=;
 b=qjB/qHKSIDJi/GAqvKsTr9WClSxO9AO1fuitH9Q85jUmMdH5UcfB9fQ6cj/J7SssHZ
 riYZRpCAob65JLa0dxIVNUNdCjsr+GsVGHZ+/M6ukgNlNNEABvDf59/JGZu5Xqg4msVh
 WVBg2+tfcZNWJfqMmYYx+gFPlFU6xzDWsmLKCofwPy8pdqGdO3KbxOInnVdUrK44NBgx
 oZZCmuGbEajq6PuWr1aXpSvBvVeQflEctS9XVzTY3BbHlSRrItTgtiPRXwqSh0XLb9wB
 nYaYN1Bk0J2foPNSGHxgc7eDOSJeP7ycxaKDNaiBMizSRRceUZ7neG4ourSke2TfnW+A
 BcQg==
X-Gm-Message-State: AOAM530+iDOCgIiTrxIAohvUAzTb+pF7ZY7XAqgJauzYfV9u2AYZdyj9
 VMNZG7Dzbhz2MKpiojXM/e66kEbv8cU=
X-Google-Smtp-Source: ABdhPJxTKgVk+89OYJElawKchgIDJJK6Z5kVenKlI4AafF3aUIxn5MqYDXHmUfvCIsQq1cTfvouECA==
X-Received: by 2002:a1c:dc02:: with SMTP id t2mr7352935wmg.55.1595576126687;
 Fri, 24 Jul 2020 00:35:26 -0700 (PDT)
Received: from localhost.localdomain
 (138.red-83-57-170.dynamicip.rima-tde.net. [83.57.170.138])
 by smtp.gmail.com with ESMTPSA id y189sm7319431wmd.27.2020.07.24.00.35.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jul 2020 00:35:26 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] tests: Add 'fetch-acceptance' rule
Date: Fri, 24 Jul 2020 09:35:22 +0200
Message-Id: <20200724073524.26589-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::342;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a rule to fetch acceptance test assets.

This is particularly useful in a CI context, when a single job
can fetch and save the cache so other jobs reuse it directly.

It is also useful to measure the time spent downloading the
assets versus the time spent running the tests.

For now we have to exclude the 'boot_linux.py' which triggers
an exception.

Philippe Mathieu-Daudé (2):
  tests: Add 'fetch-acceptance' rule
  tests: Exclude 'boot_linux.py' from fetch-acceptance rule

 tests/Makefile.include | 9 +++++++++
 1 file changed, 9 insertions(+)

-- 
2.21.3


