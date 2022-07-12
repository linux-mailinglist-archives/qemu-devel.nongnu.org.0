Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C49C571FA8
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 17:40:56 +0200 (CEST)
Received: from localhost ([::1]:46342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBI0M-00059F-TL
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 11:40:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oBHtA-00071c-4I
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 11:33:28 -0400
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32]:44668)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oBHt8-0005xy-AP
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 11:33:27 -0400
Received: by mail-yb1-xb32.google.com with SMTP id h62so11916387ybb.11
 for <qemu-devel@nongnu.org>; Tue, 12 Jul 2022 08:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=AziD3TBoXJCiP5YDbKb7ymP3NOa+A5r+K8+tx8FGUdQ=;
 b=Qbb4q0GhA67MK6sNcKjqF5fTvtCt6Om7tyH6LPiPflboAUcP6gfQ/e7z34ckSqferZ
 9We+vxNw8eKZw4wGPd4cz7pCINxGfmVla55U67mAARNA9xDaV3kKL8El53TT4Np6Bmie
 /kYoPPZdVrfQXRvI5Sh7ex6u9CcXtxT8XDRs1+rvnUCHk0v6rEKstLgEKxLPKgwTQV8b
 qj1ZdzVA1+SZJYeXR2JErbU008jcpy1OAh+vERHv+IcTIMWnc3Uj2W5pXqkZRNRgvQgw
 jrTMnyqPo6HEEag2n1IsxSvYgkLnqdzZPMuOujkAxf3EqqUXZP91A/T5D8pr4XUNAmOP
 CQxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=AziD3TBoXJCiP5YDbKb7ymP3NOa+A5r+K8+tx8FGUdQ=;
 b=fZQ8RHKxaCLgRq64yC+ZNX3MhYsBcQ5FRVLShoBUmsSTjMHuNL89K7x+tUHJ0Xq4dM
 Ux2zZU4fdKoaLtieJ5dg3rwPJGIfBnTQ6ewUyOFleXbLk1wyVcog9U5dPOaYWndpxc1s
 qApUmuu80IWMXGsCS6i0LJfJrmEGDw8IFFz4/lwmEmhWrH6KIR3i9bRqQ3qUrsQPkfLF
 ROhsFH2p5gKEHsNKHeACUYbKCKrPtYCtlvPyXRIEoGs3sXFCxjlmGoQWeHeJoLdC1RD4
 vjaNZEjr0xH3kRFaeqZfH0ezb9dJEsDtB8G7/ao1/gQCHg2cWgr/J1W6uYBqLsVI/Hg2
 xXvg==
X-Gm-Message-State: AJIora+w7b+6z/Y9EW5ya3JP0/2C87VpXl2IGgdrl/zEKrIKPFRARFoe
 Zma5TLMs8ukq6L3LlwuDvvilUdz1u4tw4vcCiT+0EyhI85/7tw==
X-Google-Smtp-Source: AGRyM1ufpdWGSBS7FMzhcg+FhO2E/LNlYBtwEjFhhRYugOQlDvUFnUkAzzTh9UXG9/GcuG/QtsB6q46HdXspdSwZMBQ=
X-Received: by 2002:a25:cb0e:0:b0:66f:7b31:3563 with SMTP id
 b14-20020a25cb0e000000b0066f7b313563mr4636964ybg.85.1657640004550; Tue, 12
 Jul 2022 08:33:24 -0700 (PDT)
MIME-Version: 1.0
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 12 Jul 2022 16:32:45 +0100
Message-ID: <CAFEAcA-79gwhLNia6=E7-WtQXo9nV7U=zwy=97dT_g8+vCDpHQ@mail.gmail.com>
Subject: loongarch missing tests/qtest/machine-none-test.c support
To: QEMU Developers <qemu-devel@nongnu.org>
Cc: Song Gao <gaosong@loongson.cn>, XiaoJuan Yang <yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb32.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

The tests/qtest/machine-none-test has a cpus_map[] array which needs
to be updated to list a CPU that will work with the 'none' machine type
for the longarch64 target. This results in a warning message during
'make check':

$ QTEST_QEMU_BINARY=qemu-system-loongarch64 ./tests/qtest/machine-none-test
# random seed: R02Sb57df3405339b14ef8e45e32fb787d3d
1..1
# Start of loongarch64 tests
# Start of machine tests
# Start of none tests
WARNING: cpu name for target 'loongarch64' isn't defined, add it to cpus_map
ok 1 /loongarch64/machine/none/cpu_option
# End of none tests
# End of machine tests
# End of loongarch64 tests

Could somebody update the test appropriately, please?

thanks
-- PMM

