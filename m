Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA2313C8AC3
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 20:23:00 +0200 (CEST)
Received: from localhost ([::1]:44526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3jX9-0005iw-VK
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 14:22:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3jVG-0003P9-Lp
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 14:21:02 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:33368)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m3jVE-0001vy-Pt
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 14:21:02 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 g8-20020a1c9d080000b02901f13dd1672aso3921470wme.0
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 11:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=n+gVQ8l7r8QvRyksHvg+myFznUry7OqoJ4vdqgrgy/o=;
 b=tgXqkjrmeoXa9euP961Vlqug2xoo5VVV+S2MCV/q98U4f6tGlz1rGf3h9TWQhVgNl2
 Jjhldh1MCGtNfbdn7jiZ0i7mLa1Cn/KIrJsi8MtkZsNMd8dlZQ1LsDuRcltsy4Kl5VOK
 ENfclSu6aA48Vy0tOjZEIWpYCfT8ntDrOVmkUwkRfKB4WKN0OoachsI7Cztu0brxeeLD
 zm5PP1qQpQ3s/ojjc3N7Ds2mhK+cKSVAAzXJkYf/IBRe2Dc0RKOLZVFDTtAjOy6A7DSp
 VZRdo9LVXLFc6gZYEE/waN0YSViOMs1R3aaIxaIA4EcDGlh3wyzaf8bVAHjDmQYnFau7
 eq6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=n+gVQ8l7r8QvRyksHvg+myFznUry7OqoJ4vdqgrgy/o=;
 b=W2HW0qH3k46Pa+G+EuDidy6lK66SLVoKRo0naTDhLY+AH0fHiHUR3kXm6qPBUJ86xL
 S8Vg19QI9boNIliLzcj7lfsreoM+LzVcI3e+g0LyIXh2oF2nuy7B4tXSwFxb+rAI13q2
 8Q7NGli0r4FTAlm6ZmSYzpGQDNG111KV51jpZhLJlv/hGqNR4lsdEf1Bnb7YiuLfj2d8
 dxRxxqLioXbr+W7wuQYFsW0+N1UTmfbaLNRhmBW6+kRq9NYcGR1EInc9goy90SzB2Llk
 dN3jVL+HKeKKi60xDeAGiI9vhwqmHFHAKkEDsX1ara6dDjDxdDa82BZMCTG3f0fOFf0v
 9FRQ==
X-Gm-Message-State: AOAM5311vghSiJWe5VxVyN+fb+ocJkNC0ggWHWAYm8Y7bXUR/zBPjxFU
 7UjhwJLEpg5iptb7nmF8i408vA==
X-Google-Smtp-Source: ABdhPJx7proLo8/bPH3IkpIB9WJGxdXvh93JTegnU7nBZ2Vwl+iC8RuisCGrm1sKVv399apcrLzeUA==
X-Received: by 2002:a1c:790e:: with SMTP id l14mr5337628wme.119.1626286858468; 
 Wed, 14 Jul 2021 11:20:58 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id e3sm3585678wra.15.2021.07.14.11.20.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jul 2021 11:20:57 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9CE821FF7E;
 Wed, 14 Jul 2021 19:20:56 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH  v2 00/21] documentation and metadata updates
Date: Wed, 14 Jul 2021 19:20:35 +0100
Message-Id: <20210714182056.25888-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32e.google.com
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

Posting v2 as the v1 posting got double posted due to git problems so
it's easier if we reset here.

As with previous release cycles I'll switch to maintaining a single
tree of patches for the current release at any given time. The usual
patch admission rules apply so you won't find any feature changes in
here. This series is mostly a collection of documentation and metadata
tweaks, the later being me getting ready for KVM Forum later this year
;-)

All the gitdm changes are mostly waiting for the Cc'd people to
confirm their mappings but I will accept acks from within the
appropriate organisations. If you use the proper Reviewed-by or
Acked-by tags it will make my life easier because the tooling will do
most of the work for me. I've manually converted positive statements
from v1 to Acked-by.

Otherwise the following need review:

- contrib/gitdm: add more individual contributor entries. (3 acks, 1 sobs)
- contrib/gitdm: add a new interns group-map for GSoC/Outreachy work
- contrib/gitdm: add an explicit academic entry for BU
- contrib/gitdm: add domain-map for NVIDIA
- contrib/gitdm: add domain-map for Syrmia
- contrib/gitdm: add domain-map for ZTE
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

 docs/interop/vhost-user.rst               |  2 +
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
 contrib/gitdm/aliases                     |  6 ++
 contrib/gitdm/domain-map                  |  9 +++
 contrib/gitdm/group-map-academics         |  3 +
 contrib/gitdm/group-map-individuals       |  5 ++
 contrib/gitdm/group-map-interns           | 13 ++++
 contrib/gitdm/group-map-netflix           |  5 ++
 contrib/gitdm/group-map-robots            |  7 ++
 contrib/gitdm/group-map-samsung           |  5 ++
 gitdm.config                              | 14 ++--
 21 files changed, 214 insertions(+), 15 deletions(-)
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

-- 
2.20.1


