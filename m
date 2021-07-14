Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D713C81D5
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 11:39:25 +0200 (CEST)
Received: from localhost ([::1]:50806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3bMS-0004mE-A6
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 05:39:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3bJu-0001tc-B9
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 05:36:46 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:47052)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3bJs-0004Fl-Lv
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 05:36:46 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 o30-20020a05600c511eb029022e0571d1a0so983694wms.5
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 02:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FuOAryWStYcr7dTVPQkcu3ZaqHX8woe0SMlRgxqFHeE=;
 b=z83Fpq+AkDn3m5DyaT5SWVfAjoOKPPvVYM2NLJ25MSykw7ZHwZDk1RHowj/yictQqB
 Af022kvJOz/bq40VRDfN/yGfd+hOz+ZSaRNKyaspGpmFSVnKf0WwaYiZYWo/vkf8ZHlS
 B3Cy5xU9Ng/pHxMD/TPTCYjbxUe2SsVrnc5RjQVi+SB4cHSBCDku8nxB7TMz/trVpdXo
 7O5Dzme9Uu4lZDqLp2Mx3oPwqvFb1AMdKUUA8fwnLRA4tScMiPy60d23yiFqPDiPKpXE
 m1TNUlE0+ylVYGiG+O2DbRxYyKvkHlXlIV6LYwRsGqx+UcbmkkUaV/VCcr1WiRfel5pm
 1V8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FuOAryWStYcr7dTVPQkcu3ZaqHX8woe0SMlRgxqFHeE=;
 b=lN6RKKuXFFzQfWBjaADjiaV8lHFZd4AoZ0lLXmnbr8cfsRj2s6YVsvNC+J42el9FMH
 Zjr9JOwEJTERcG9z5QXU73OqhZPoMBNLXlF5ChbwVfdrOOnzRc5gJIUP8wWAq99M27ys
 gmkGcAf6MRxl9q8A2Hdacrh8nh2TlTO0DfrW4MjrazbZcNHGVeM/PwyMKxAQWW7gX6Zn
 I3s1hOqIfuVOcgSGPK7w+CIRPGlr5GhRxq39sorZTFBEKW/79TSNrCkoEpW2xkpMzaOn
 WIHWz/qarwRZNJrOnFnvUZVnrEu5Kftj1Of6yWVil8/eKW9DoJZEyCTjdFJCv1NCETCC
 Pz8w==
X-Gm-Message-State: AOAM530xygJFB0YBleu+/NILBxPg+0vwlVUv23Aveh5WH58SwYsvexD/
 7Y7F4rfJBiTpTnzF4hzSrm7ncKcoQtBTAA==
X-Google-Smtp-Source: ABdhPJzOK5Pr+iHL6BxpW/lwEJ2QUIpLAIOKjsBRSxTya+IzL/AIDcJDG6s3YPV0P/JyF7SFv7g/5Q==
X-Received: by 2002:a05:600c:3786:: with SMTP id
 o6mr2959572wmr.155.1626255403208; 
 Wed, 14 Jul 2021 02:36:43 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id d15sm1964505wri.39.2021.07.14.02.36.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 02:36:39 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id DEB501FF7E;
 Wed, 14 Jul 2021 10:36:38 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for 6.1-rc0 v1 00/21] documentation and metadata updates
Date: Wed, 14 Jul 2021 10:36:17 +0100
Message-Id: <20210714093638.21077-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32f.google.com
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


