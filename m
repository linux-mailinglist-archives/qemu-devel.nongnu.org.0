Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD384A5279
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 23:37:59 +0100 (CET)
Received: from localhost ([::1]:32790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEfJ7-0004fV-Lw
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 17:37:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <34WL4YQcKCp4TCLRSPCEMMEJC.AMKOCKS-BCTCJLMLELS.MPE@flex--venture.bounces.google.com>)
 id 1nEfGK-0003hw-15
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 17:35:04 -0500
Received: from [2607:f8b0:4864:20::b4a] (port=45759
 helo=mail-yb1-xb4a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <34WL4YQcKCp4TCLRSPCEMMEJC.AMKOCKS-BCTCJLMLELS.MPE@flex--venture.bounces.google.com>)
 id 1nEfGI-0000Uv-M8
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 17:35:03 -0500
Received: by mail-yb1-xb4a.google.com with SMTP id
 2-20020a251302000000b006118f867dadso29550195ybt.12
 for <qemu-devel@nongnu.org>; Mon, 31 Jan 2022 14:35:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=OYO2euCHTH7CfzpgQ4Sx+71WPqJKIOBjJoh6ZUDrhBA=;
 b=VcACbLQAu2hNEXanIRWbmhxTtfTb+swtyhQSMwIV/WQDYmsViCLURxBsIsjElvnrPt
 iTFDrsEzsdMTyjgaAV4KytTQlPdZTKEVXZJ2Vz1Jt1jA2oyq5hxwUn0AtYizKVxkp4AP
 IaCWmuPN4gjuWQCmlvh7UEOcdB6dt6FHHG0ybJu/gSOYC3+k0BwLhqyLWXTMIuo2k1H3
 z+BcOUtkBHqNqSwHbz+gh5fhyEAVDJ+zGBNMUS7OcHTKk7bH9Y+/UM7SBhf4VyeihvZG
 rrjo71XetHw08n7YsC2od6Tp63Lmv4P37zSktHVVTWAnA87BZLiDU5vtNKXpg4zeRvjE
 YQvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=OYO2euCHTH7CfzpgQ4Sx+71WPqJKIOBjJoh6ZUDrhBA=;
 b=yQBQAVFm2w7rFdcnatpSfaceaPWImg04Yj5a9+ejwDoB4jFPp7HlarKILP/+PkJq8H
 sOFq8srlNLWWtgS45Oklo1Qegr9NN0bxzVgDNd02l3s5KQrKIbmNYDiCX5P7E1AfXW/Y
 6mB/5IZNGs83ZkZFtOpZUrJ1KtZHh1M/6rjaj86BdAwd+9jgBgfoOKH8PfBiKVQoRZHj
 oayQ40YQl5Cvmp/9HfhzDrz1KtBCsjYd5cMXZ81Si81QhH5HE28HTdVX/4GKgsE0H8vY
 y4pcNGi89BSL1v/9dqhft4wGELL7lYLlap09tdgGMSOFoThiWSoQW6wxj+y0sgNlfHvz
 UYkA==
X-Gm-Message-State: AOAM530VhugeyBO/TADYuKikM1cLNNdjMwUzlhpEZVpznxe9cofGB2QD
 q7i9LoSufggw6nDbwWKvPCcam2oF/Pr9
X-Google-Smtp-Source: ABdhPJwF0SA0K40m5YuRcwd23wBkd1s/LQLsnp26YuWJ9Oycq1JqxLqaZmEJO4ypTmbb4Jwzx9XVF4MjZQ6B
X-Received: from venture.svl.corp.google.com
 ([2620:15c:2a3:200:5780:bdf0:5f14:9c50])
 (user=venture job=sendgmr) by 2002:a25:d116:: with SMTP id
 i22mr31351910ybg.361.1643668193340; Mon, 31 Jan 2022 14:29:53 -0800 (PST)
Date: Mon, 31 Jan 2022 14:29:46 -0800
Message-Id: <20220131222948.496588-1-venture@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.35.0.rc2.247.g8bbb082509-goog
Subject: [PATCH v4 0/2] hw/sensor: Add SB-TSI Temperature Sensor Interface
From: Patrick Venture <venture@google.com>
To: cminyard@mvista.com, thuth@redhat.com, lvivier@redhat.com, 
 pbonzini@redhat.com, f4bug@amsat.org
Cc: qemu-devel@nongnu.org, Patrick Venture <venture@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b4a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b4a;
 envelope-from=34WL4YQcKCp4TCLRSPCEMMEJC.AMKOCKS-BCTCJLMLELS.MPE@flex--venture.bounces.google.com;
 helo=mail-yb1-xb4a.google.com
X-Spam_score_int: -87
X-Spam_score: -8.8
X-Spam_bar: --------
X-Spam_report: (-8.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=no autolearn_force=no
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
 * Added missing signature block from submitter.

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


