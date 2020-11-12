Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34EEE2B07B2
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 15:43:11 +0100 (CET)
Received: from localhost ([::1]:34568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdDob-0002Hb-T7
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 09:43:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kdDmJ-0000XR-VL
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 09:40:48 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:39332)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kdDmH-0003jn-V6
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 09:40:47 -0500
Received: by mail-wr1-x430.google.com with SMTP id o15so6248751wru.6
 for <qemu-devel@nongnu.org>; Thu, 12 Nov 2020 06:40:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tvN7p/jiEutLQrRwN9hIwT4SuMenw6Fk6BTPzNoku8k=;
 b=OGvt4SM3s8i8FSVzE2M7R6mw/aJOBa5uIR+UV4x0dtjhoyyJDFnaKhC0YGMmjNCjne
 ROQNYKPXERtmXUJufhPwiasZxOS80HCjHMs+5WrLJvxeA6THjsuf9yQOBlv8Wr+54yYH
 7kH9X+yxOh42M66LPXDKyCPwh0lcOQwtJqVqXoVpR/uSvc9K2fs2WM8k3JHDWchBWePT
 lLgGWLWBz5eqbDcmIs0Uq26gQFR5NQkaiJWioYV/9yUvgP3JQdPNUGXUk7Ji5CPqMr4r
 ns7BObYof87f72gc2se4pvVCVHpxsnF1R3x2rG93TsYy2kqQDPYQ8RzAAShP4UUBE9wC
 XMZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tvN7p/jiEutLQrRwN9hIwT4SuMenw6Fk6BTPzNoku8k=;
 b=U0iPBBDhLam7bmMeAs1kzLQkONHG6cJaQgwOAWoL4gFcI2k5nheX5vbBT05KhODjKB
 uAH8h/icJn8ZS57K3yObXxiwo1ODYm5TTpSflSZfhdK0brRnfL9TbTEx8zRgbb7NgZ6z
 syvRj+TK82cs3sCnC7ESibFyd98eq+BQCDw6BWPNGq1umsvcz67UMn2y7TJsIEQzFnet
 cdN4WKY8A0MQwoF4Z9+P4ie3r0Q1yRvOOvFgnOHzonFB1vH+UJZ0uy7nFV+naFkeuIlM
 VottodSiVUbh89WSuNZqKb6L0O2EwfxIoWdfJR3vwLM0GYc6/bOkv1mbWUSqFXsTDLa6
 RDpQ==
X-Gm-Message-State: AOAM531/iagQbk1v0ClxO8/ZnFGkmwja+lpnjhu7VvnOTot2bbmfrAFn
 qbj405VONq5PyK8uzO6WfyoW79ncgS0T7Q==
X-Google-Smtp-Source: ABdhPJx08I86tXcUY4jPBXDzd8DHQyXOBfWOwEoQspT8hmBSsEwU1VlSCL0fkSotyknFo8Xmexj5tw==
X-Received: by 2002:a5d:6288:: with SMTP id k8mr22560448wru.30.1605192043831; 
 Thu, 12 Nov 2020 06:40:43 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id k16sm7410907wrl.65.2020.11.12.06.40.42
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Nov 2020 06:40:42 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [for-5.2 0/9] docs: Move orphan top-level .rst files into manuals
Date: Thu, 12 Nov 2020 14:40:32 +0000
Message-Id: <20201112144041.32278-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently we have a handful of rST documents that are sat in the top
level docs/ directory and do not get built into the manuals.  These
are a legacy from the period after we'd decided we wanted rST format
documentation but before we'd set up the manual structure.  This
patchset moves them all into at least plausibly suitable places in
the manual set:

 * virtio-net-failover, cpu-hotplug, virtio-pmem all go into the
   system manual
 * microvm goes into the system manual, but first we have to create a
   structure in target-i386.rst that lets us have a list of multiple
   machine types (along the pattern that target-arm.rst does)
 * pr-manager.rst goes into the system manual, but the part of it
   documenting the qemu-pr-helper executable needs to go into the
   tools manual

If anybody who cares about the x86 machine models would like to
create some documentation of the others ("q35", "isapc", "xenpv",
"xenfv") you now have a place for it to live :-)

Since there's no good way to cross-reference between different
manuals there is no direct link between the pr-manager.rst and the
qemu-pr-helper.rst; my proposal for fixing that is the recent "build
a single manual, not five" RFC.

thanks
-- PMM

Peter Maydell (9):
  docs: Move virtio-net-failover.rst into the system manual
  docs: Move cpu-hotplug.rst into the system manual
  docs: Move virtio-pmem.rst into the system manual
  docs/system/virtio-pmem.rst: Fix minor style issues
  docs: Split out 'pc' machine model docs into their own file
  docs: Move microvm.rst into the system manual
  docs: Move pr-manager.rst into the system manual
  docs: Split qemu-pr-helper documentation into tools manual
  docs/system/pr-manager.rst: Fix minor docs nits

 docs/meson.build                          |  1 +
 docs/{ => system}/cpu-hotplug.rst         |  0
 docs/{ => system/i386}/microvm.rst        |  5 +-
 docs/system/i386/pc.rst                   |  7 ++
 docs/system/index.rst                     |  4 +
 docs/{ => system}/pr-manager.rst          | 44 ++---------
 docs/system/target-i386.rst               | 19 +++--
 docs/{ => system}/virtio-net-failover.rst |  0
 docs/system/virtio-pmem.rst               | 75 +++++++++++++++++++
 docs/tools/conf.py                        |  2 +
 docs/tools/index.rst                      |  1 +
 docs/tools/qemu-pr-helper.rst             | 90 +++++++++++++++++++++++
 docs/virtio-pmem.rst                      | 76 -------------------
 13 files changed, 204 insertions(+), 120 deletions(-)
 rename docs/{ => system}/cpu-hotplug.rst (100%)
 rename docs/{ => system/i386}/microvm.rst (98%)
 create mode 100644 docs/system/i386/pc.rst
 rename docs/{ => system}/pr-manager.rst (68%)
 rename docs/{ => system}/virtio-net-failover.rst (100%)
 create mode 100644 docs/system/virtio-pmem.rst
 create mode 100644 docs/tools/qemu-pr-helper.rst
 delete mode 100644 docs/virtio-pmem.rst

-- 
2.20.1


