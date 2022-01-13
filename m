Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57EDC48DC14
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 17:43:08 +0100 (CET)
Received: from localhost ([::1]:43642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n83Bq-0000Rp-Ob
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 11:43:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3ylXgYQcKCg08r0674rt11tyr.p1z3rz7-qr8ry010t07.14t@flex--venture.bounces.google.com>)
 id 1n838Z-0006eE-QI
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 11:39:44 -0500
Received: from [2607:f8b0:4864:20::b4a] (port=54094
 helo=mail-yb1-xb4a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3ylXgYQcKCg08r0674rt11tyr.p1z3rz7-qr8ry010t07.14t@flex--venture.bounces.google.com>)
 id 1n838X-0002Lr-0l
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 11:39:43 -0500
Received: by mail-yb1-xb4a.google.com with SMTP id
 f12-20020a056902038c00b006116df1190aso12269160ybs.20
 for <qemu-devel@nongnu.org>; Thu, 13 Jan 2022 08:39:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=04jLXKE/iAM86SF5TdEXpSgmP7gKXKMfGX2uh+LSxO0=;
 b=TzkI2xdS2UoZp20IWI4xJiMh2sJRzoqlp53dMYvQXGFQkJL7r6OPjTkolm1+PV8PZF
 +7+6hDjgm5z4u0DUEoHbUzNV6tmsTUGTcWlG4hOvCrXQNhyVeHOc5JI5mVNdFxpNmkGr
 f5oT3dS6S8Q7x+b1vcVG+VvEv3MtiAD+/bry5inxT+P4oZQthkiHZrSbbpzDXDT0g4D3
 PCVB/FLlO6OenW3a8nJyL+eNyGh890WPbh8hT1tevB0YK1biAsyHC1B32ExwwaNJQvNZ
 C3om9pAqXQfvpXFmdflHfLqWjSWOVgEkitMstNN04NgHnCpDPJ034vgbuW/lyjxpF7qk
 2ylQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=04jLXKE/iAM86SF5TdEXpSgmP7gKXKMfGX2uh+LSxO0=;
 b=5LLaNPd5j8bLCsw6EBWsqD1vEF+Ci1VyMPBiu4T60JynHS7Odd60ZAddUR4lytAgMz
 wQY3PNSLWWTuGNy2KRXAocLz8+iDnXmuEg+y4Bh3oDJpoHSREotgDiM8bFCEsQZhEOWu
 9rfFpxsHavwBPQpI4G+1uSziGsj6pGunfHQX2sq7uPUS43TbqJwfHuATdznLLPyHnrJb
 aUv88rruchIu1airBvsWR7oBZyqE/Z3YNZZpRT5toxrJWskcUiTLhkFXOW0S6r01vXJd
 mph08J3JsbCWOR5FzkHaON2vXKDsvFujYDm5Xz8NAeb+hgPqt+VnMT0TbkDv/2qKzd9v
 zU9w==
X-Gm-Message-State: AOAM532FeECIUn7WFI0Ca7mBkx8FtLWzYiphzqZr5OUIDyEUAHkVffi7
 66a51POqeY4tGU4Pmlb55krvaMZ/2KE8
X-Google-Smtp-Source: ABdhPJz2jEC1gma6ua8TDtc6W/8cQNQ9VAApENPpoV63/CP98geg7IAX3mXU3d8IRSzgWZAZINmlTVFTffE7
X-Received: from venture.svl.corp.google.com
 ([2620:15c:2a3:200:e292:b948:2633:96])
 (user=venture job=sendgmr) by 2002:a05:6902:70d:: with SMTP id
 k13mr8149181ybt.33.1642091978727; Thu, 13 Jan 2022 08:39:38 -0800 (PST)
Date: Thu, 13 Jan 2022 08:39:32 -0800
Message-Id: <20220113163934.2556958-1-venture@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.34.1.575.g55b058a8bb-goog
Subject: [PATCH v3 0/2] hw/sensor: Add SB-TSI Temperature Sensor Interface
From: Patrick Venture <venture@google.com>
To: thuth@redhat.com, lvivier@redhat.com, pbonzini@redhat.com, f4bug@amsat.org,
 cminyard@mvista.com
Cc: qemu-devel@nongnu.org, Patrick Venture <venture@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b4a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b4a;
 envelope-from=3ylXgYQcKCg08r0674rt11tyr.p1z3rz7-qr8ry010t07.14t@flex--venture.bounces.google.com;
 helo=mail-yb1-xb4a.google.com
X-Spam_score_int: -87
X-Spam_score: -8.8
X-Spam_bar: --------
X-Spam_report: (-8.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5 autolearn=no autolearn_force=no
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

v3:
 * typofix where I accidentally embedded 'wq' into a string
 * moved the type sbtsi definition back into the source file
 * renamed the qtest file to use hyphens only

v2:
 * Split the commit into a separate patch for the qtest
 * Moved the common registers into the new header
 * Introduced a new header

Hao Wu (2):
  hw/sensor: Add SB-TSI Temperature Sensor Interface
  tests: add qtest for hw/sensor/sbtsi

 meson.build                  |   1 +
 hw/sensor/trace.h            |   1 +
 include/hw/sensor/sbtsi.h    |  45 +++++
 hw/sensor/tmp_sbtsi.c        | 369 +++++++++++++++++++++++++++++++++++
 tests/qtest/tmp-sbtsi-test.c | 161 +++++++++++++++
 hw/sensor/Kconfig            |   4 +
 hw/sensor/meson.build        |   1 +
 hw/sensor/trace-events       |   5 +
 tests/qtest/meson.build      |   1 +
 9 files changed, 588 insertions(+)
 create mode 100644 hw/sensor/trace.h
 create mode 100644 include/hw/sensor/sbtsi.h
 create mode 100644 hw/sensor/tmp_sbtsi.c
 create mode 100644 tests/qtest/tmp-sbtsi-test.c
 create mode 100644 hw/sensor/trace-events

-- 
2.34.1.575.g55b058a8bb-goog


