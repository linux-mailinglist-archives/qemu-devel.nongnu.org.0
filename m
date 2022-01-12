Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 298CC48CF1B
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 00:29:25 +0100 (CET)
Received: from localhost ([::1]:60162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7n3S-0004FK-NM
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 18:29:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3rWPfYQcKCgg3mv12zmowwotm.kwuymu2-lm3mtvwvov2.wzo@flex--venture.bounces.google.com>)
 id 1n7n0s-0002iE-6E
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 18:26:42 -0500
Received: from [2607:f8b0:4864:20::b4a] (port=51107
 helo=mail-yb1-xb4a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3rWPfYQcKCgg3mv12zmowwotm.kwuymu2-lm3mtvwvov2.wzo@flex--venture.bounces.google.com>)
 id 1n7n0p-0004cl-OD
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 18:26:40 -0500
Received: by mail-yb1-xb4a.google.com with SMTP id
 s89-20020a25aa62000000b00611afc92630so3460895ybi.17
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 15:26:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=jwGjAQUlNj24EtyQGxYDoIUbS/BrKaITAtFNWuv5GLs=;
 b=ASm4oHhZww56gZiRhjuB0R6405D/rk4KK9XBe1hIAyPZfd71dHKmXEpZNxf9T+AY6p
 1i9gkmjFy43WHhL/epcLn1iVE0WKJc/YGINvsiOO1gF18FjvGsjr3MAg2ljvlpiFoCqF
 /vMTtVoXb89jxDDYZKmhQNY65UA1qno5m+IVoDAd1IV81fu4Gbzznpw/qp80QO4qGeXZ
 CotyXNRpdod5w5MutgxKFUQWCzAvKtNEgRZqqilLGRHlXGx2+9bJgE+aXmzvEgET67Qa
 cy8dFAM6HryIECsiZwrFVFrLwdEK9dv+/+icEJGbfs0+Y2tR7LX4Q9P52PR1iYI3Xckb
 MSuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=jwGjAQUlNj24EtyQGxYDoIUbS/BrKaITAtFNWuv5GLs=;
 b=GD4fslqKYYyKgLn5TA7trqPpyKl2RUKBhcmzzpB+DqkhSgnuqhXPF4r9DaDF/QBoRy
 S2MGqZ2c+Y6smfNvfqGVHuoA1o0HarjdTV4oofZCHXnKsJaqs9/VSweO/46WaawzALua
 5HgTvJXNPrSHWUL85DfmmB8686k+1MYu69xiA2WqhMWhP1BoXD2v1BJQAEX6OkNlxJOZ
 PjvoDCn2AC6FllAcxCX5OIqmLdiyFD9AGJjSB5j9fopd4Cf5Atdq+4Yoon2gK2DJwaF/
 F++Rl2W7nqGW2DoDwuHYVQj52zQW1tmfaF0qBohnDolf5DyfoCUPrIRym1IQCO1eyrcV
 8ORA==
X-Gm-Message-State: AOAM533QflVaCqGNW+xCzaHAJazCIh9jZbIzpW6QPqcMYRv7p8wlvUtn
 EzYuNbaIWP93kC2p8Se7iqIgXj5BmYV6
X-Google-Smtp-Source: ABdhPJzaXx+ObxMo2V15c8PY1J50x3vFkP6rng6EnXxDWt2ovkP+L8gwpwVhtXq1UMY4L3RbEjMjxDtLFCTv
X-Received: from venture.svl.corp.google.com
 ([2620:15c:2a3:200:e211:b78e:685:a989])
 (user=venture job=sendgmr) by 2002:a25:8745:: with SMTP id
 e5mr1098082ybn.649.1642029997977; Wed, 12 Jan 2022 15:26:37 -0800 (PST)
Date: Wed, 12 Jan 2022 15:26:31 -0800
Message-Id: <20220112232633.1811256-1-venture@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.34.1.575.g55b058a8bb-goog
Subject: [PATCH v2 0/2] hw/sensor: Add SB-TSI Temperature Sensor Interface
From: Patrick Venture <venture@google.com>
To: thuth@redhat.com, lvivier@redhat.com, pbonzini@redhat.com, f4bug@amsat.org,
 cminyard@mvista.com
Cc: qemu-devel@nongnu.org, Patrick Venture <venture@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b4a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b4a;
 envelope-from=3rWPfYQcKCgg3mv12zmowwotm.kwuymu2-lm3mtvwvov2.wzo@flex--venture.bounces.google.com;
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

v2:
 * Split the commit into a separate patch for the qtest
 * Moved the common registers into the new header
 * Introduced a new header

Hao Wu (2):
  hw/sensor: Add SB-TSI Temperature Sensor Interface
  tests: add qtest for hw/sensor/sbtsi

 hw/sensor/Kconfig            |   4 +
 hw/sensor/meson.build        |   1 +
 hw/sensor/tmp_sbtsi.c        | 365 +++++++++++++++++++++++++++++++++++
 hw/sensor/trace-events       |   5 +
 hw/sensor/trace.h            |   1 +
 include/hw/sensor/sbtsi.h    |  50 +++++
 meson.build                  |   1 +
 tests/qtest/meson.build      |   1 +
 tests/qtest/tmp_sbtsi-test.c | 161 +++++++++++++++
 9 files changed, 589 insertions(+)
 create mode 100644 hw/sensor/tmp_sbtsi.c
 create mode 100644 hw/sensor/trace-events
 create mode 100644 hw/sensor/trace.h
 create mode 100644 include/hw/sensor/sbtsi.h
 create mode 100644 tests/qtest/tmp_sbtsi-test.c

-- 
2.34.1.575.g55b058a8bb-goog


