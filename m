Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A0043C8205
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 11:48:00 +0200 (CEST)
Received: from localhost ([::1]:48566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3bUl-0005L6-Es
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 05:47:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3bKY-00032b-PB
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 05:37:27 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:44007)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3bKV-0004dO-9R
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 05:37:26 -0400
Received: by mail-wr1-x434.google.com with SMTP id a13so2355164wrf.10
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 02:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FuOAryWStYcr7dTVPQkcu3ZaqHX8woe0SMlRgxqFHeE=;
 b=Kvcs/BN57WwJ0+kO1kI0sWTHXGxyCtplY0ZzBlL/d8aP7X7UH9Jl2YgGfgDFCQrMse
 sdd04C/qgQFyTe/xVCH9WP8/l8h8hUUiofawx/HcAcFTR3Axh4qJcDeOm8Gq7L0TK6Yl
 gCxmElzwEHq/IvgYQIXe8aqem9SiysD3gN7G6my/YSI466TwOVxohLlUOZY/0JgXaqb+
 vZloLywYEPd7rw0QSDG8QzbWz7f+RYvIhEIjEPvsAXmq7oFwtuHWCV2pac7teGO2ku4B
 0lAZaCLo/Xgd/hHVvGbh7qd8N/eLqW2sMJSBAJR+9QQW6dEAgAaL/skAb0ws+jkTlYXY
 9sPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FuOAryWStYcr7dTVPQkcu3ZaqHX8woe0SMlRgxqFHeE=;
 b=OD6jV/qtXZdSC2f1hx4Zap0SErRPfHXRSa+ytWSAgJJA1cZm+BcH0Hkev0jbVf47CL
 NKimApoh8VQhm5xNOJ+deGwkJv4Ftm7GD2DBs9pi79I++vPfy6+Ah3RX3LVL1fyyqCgK
 t56tm6oXb2wmmZ38KwPY6RuoNlxgP5BwmS2p8Jx9lvfH1E245AnzmNzo7zLoyno0EtUf
 T1t0Vv0KCxnZqFxHUrn32aF5UFKz/a9ANpRFeCNWybf5RrPcvaptTKTp6L774oN5YbCG
 Pxz94GVJ1ZhsGrYtnmVaRQEggk/p76b1jD9vKqoqK8p5ZzGpDaiLM7d+XgIbEZWZiJpn
 slxg==
X-Gm-Message-State: AOAM532kggSH4qEDSseHk3PbNduyPT8vYoQzX23yqlGosNkf4xEqHTv3
 Ze+lSdJ49UxkcruTL7ntgkYWqTm6ADHahg==
X-Google-Smtp-Source: ABdhPJxSiJgPlnk4FhUIrxL5erm7+SXP1r5RV9xwVv7xdEhezkmILzZ+LI/6phHRZP7EY2+LKgQtgA==
X-Received: by 2002:adf:e107:: with SMTP id t7mr11731627wrz.165.1626255440880; 
 Wed, 14 Jul 2021 02:37:20 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id r4sm1935287wre.84.2021.07.14.02.37.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 02:37:20 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9A1931FF91;
 Wed, 14 Jul 2021 10:37:19 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for 6.1-rc0 v1 00/21] documentation and metadata updates
Date: Wed, 14 Jul 2021 10:36:58 +0100
Message-Id: <20210714093719.21429-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

As with previous release cycles I'll switch to maintaining a single
tree of patches for the current release at any given time. The usual
patch admission rules apply so you won't find any feature changes in
here. This series is mostly a collection of documentation and metadata
tweaks, the later being me getting ready for KVM Forum later this year
;-)

All the gitdm changes are mostly waiting for the Cc'd people to
confirm their mappings but I will accept acks from within the
appropriate organisations. Otherwise the following need review:

- contrib/gitdm: add more individual contributor entries.
- contrib/gitdm: add a new interns group-map for GSoC/Outreachy work
- contrib/gitdm: add an explicit academic entry for BU
- contrib/gitdm: add group-map for Netflix
- contrib/gitdm: add domain-map for NVIDIA
- contrib/gitdm: add domain-map for Syrmia
- contrib/gitdm: add domain-map for ZTE
- contrib/gitdm: add domain-map for Crudebyte
- contrib/gitdm: un-ironically add a mapping for LWN
- contrib/gitdm: add domain-map/group-map for Wind River
- contrib/gitdm: add domain-map for Eldorado
- contrib/gitdm: add domain-map/group-map mappings for Samsung
- gitdm.config: sort the corporate GroupMap entries
- contrib/gitdm: add a group mapping for robot scanners
- contrib/gitdm: add domain-map for MontaVista
- .mailmap: fix up some broken commit authors
- contrib/gitdm: add some new aliases to fix up commits
- configure: remove needless if leg
- docs: add a section on the generalities of vhost-user
- docs: collect the disparate device emulation docs into one section


Alex Bennée (20):
  docs: collect the disparate device emulation docs into one section
  docs: add a section on the generalities of vhost-user
  configure: remove needless if leg
  contrib/gitdm: add some new aliases to fix up commits
  .mailmap: fix up some broken commit authors
  contrib/gitdm: add domain-map for MontaVista
  contrib/gitdm: add a group mapping for robot scanners
  gitdm.config: sort the corporate GroupMap entries
  contrib/gitdm: add domain-map/group-map mappings for Samsung
  contrib/gitdm: add domain-map for Eldorado
  contrib/gitdm: add domain-map/group-map for Wind River
  contrib/gitdm: un-ironically add a mapping for LWN
  contrib/gitdm: add domain-map for Crudebyte
  contrib/gitdm: add domain-map for ZTE
  contrib/gitdm: add domain-map for Syrmia
  contrib/gitdm: add domain-map for NVIDIA
  contrib/gitdm: add group-map for Netflix
  contrib/gitdm: add an explicit academic entry for BU
  contrib/gitdm: add a new interns group-map for GSoC/Outreachy work
  contrib/gitdm: add more individual contributor entries.

Viresh Kumar (1):
  gitignore: Update with some filetypes

 docs/interop/vhost-user.rst               |  4 +-
 docs/system/device-emulation.rst          | 79 +++++++++++++++++++++++
 docs/system/{ => devices}/ivshmem.rst     |  0
 docs/system/{ => devices}/net.rst         |  0
 docs/system/{ => devices}/nvme.rst        |  0
 docs/system/{ => devices}/usb.rst         |  0
 docs/system/devices/vhost-user.rst        | 59 +++++++++++++++++
 docs/system/{ => devices}/virtio-pmem.rst |  0
 docs/system/index.rst                     |  6 +-
 configure                                 | 10 ++-
 .gitignore                                |  2 +
 .mailmap                                  |  4 ++
 contrib/gitdm/aliases                     |  3 +
 contrib/gitdm/domain-map                  |  9 +++
 contrib/gitdm/group-map-academics         |  3 +
 contrib/gitdm/group-map-individuals       |  6 ++
 contrib/gitdm/group-map-interns           | 13 ++++
 contrib/gitdm/group-map-netflix           |  5 ++
 contrib/gitdm/group-map-robots            |  7 ++
 contrib/gitdm/group-map-samsung           |  5 ++
 contrib/gitdm/group-map-windriver         |  6 ++
 gitdm.config                              | 15 +++--
 22 files changed, 220 insertions(+), 16 deletions(-)
 create mode 100644 docs/system/device-emulation.rst
 rename docs/system/{ => devices}/ivshmem.rst (100%)
 rename docs/system/{ => devices}/net.rst (100%)
 rename docs/system/{ => devices}/nvme.rst (100%)
 rename docs/system/{ => devices}/usb.rst (100%)
 create mode 100644 docs/system/devices/vhost-user.rst
 rename docs/system/{ => devices}/virtio-pmem.rst (100%)
 create mode 100644 contrib/gitdm/group-map-interns
 create mode 100644 contrib/gitdm/group-map-netflix
 create mode 100644 contrib/gitdm/group-map-robots
 create mode 100644 contrib/gitdm/group-map-samsung
 create mode 100644 contrib/gitdm/group-map-windriver

-- 
2.20.1


