Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE591055C8
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Nov 2019 16:39:34 +0100 (CET)
Received: from localhost ([::1]:42020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iXoYP-0001Cl-Hs
	for lists+qemu-devel@lfdr.de; Thu, 21 Nov 2019 10:39:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51854)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <paolo.bonzini@gmail.com>) id 1iXoVp-0006jw-Sp
 for qemu-devel@nongnu.org; Thu, 21 Nov 2019 10:36:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <paolo.bonzini@gmail.com>) id 1iXoVo-0001N1-OI
 for qemu-devel@nongnu.org; Thu, 21 Nov 2019 10:36:53 -0500
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:34457)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
 id 1iXoVo-0001M7-Dh
 for qemu-devel@nongnu.org; Thu, 21 Nov 2019 10:36:52 -0500
Received: by mail-wr1-x441.google.com with SMTP id t2so5003639wrr.1
 for <qemu-devel@nongnu.org>; Thu, 21 Nov 2019 07:36:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id;
 bh=Oa3DZBPTwo+vIXSnmZJWzYpaCLyV7qn+zt+elGWY6JQ=;
 b=czKsHPErUJThSI6MZjke3CKdQKbeQfVxBBvcT3fXt8n/8IVeDZe9ZDt5ZU3km/srVm
 aeQ66xnO8l2eVNq3dCQ73+TDJqmoZCa4fTOTW93K3a77zlpvw9pfj3ccboiXGf5tsV7m
 AwwZ6pBEt7pMxJjKlq+RAK2qGCl7sA38FT7VGQ7J0H5oXaM+30zTpAmcALh3byv7FiAB
 4s0OIQ1XSHHQTWEXq67w5z1HbJOSfafLBdFTbNTXMzpft741Kjtcznh1YrTUtDv+k8LY
 Yj1nD+VdEBCHsyYgzA9vtJzVzbUydmIaPK7k69cPFFF/3bbBa6bWbGzsAJv+lvNTbmKN
 dqGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
 bh=Oa3DZBPTwo+vIXSnmZJWzYpaCLyV7qn+zt+elGWY6JQ=;
 b=DAE5lme2Dsvu8FC6rjkkgQ1wDOnNrZH2uWcBi9oh5vaQQinmp5GUye28saieEwLqD/
 QQqhMWcCLLTPNr6hr0fXGCnYZ8bG6KjaxYRq+1uTqe+dV2OdndoqKYyDZXCvRYBdGnZP
 pqVE8pCmmFr/uXEEMZJttcAhUPRSVk4kLPThrJOcgJfXKQgBPZXhjcewYjxaJt+qvHIs
 Qo6woSoCaaytQQZdIxRcBptold8kCHfUp1vCfAD9kBJGHzvclDuTnS8CeJdi2xRqzb3n
 cOtfQ2eKe+W/j+1CcEPh96GsROIjXdUCC57bEkUqwJwHP4OPfrGvF3zli6tFii5x2Loq
 tIpQ==
X-Gm-Message-State: APjAAAVbCJ1Ia2yiFndkJ15LCFfcWN4NPUVlpsAN7Vj4PD3YcBFYsq+4
 hZ02NYQ0UjfzLdjl7Wc+tlALLfji
X-Google-Smtp-Source: APXvYqw+g9hvcTDhGi3SyWxMd0uH4iG7I5M8JO9Cz7aLEoinchIXSfJWunX7GXJUsX3sRAQWFUJe/Q==
X-Received: by 2002:adf:e2cd:: with SMTP id d13mr11637633wrj.221.1574350611114; 
 Thu, 21 Nov 2019 07:36:51 -0800 (PST)
Received: from 640k.lan ([93.56.166.5])
 by smtp.gmail.com with ESMTPSA id m15sm3970933wrj.52.2019.11.21.07.36.49
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 21 Nov 2019 07:36:50 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/4] x86 updates for QEMU 4.2-rc
Date: Thu, 21 Nov 2019 16:36:45 +0100
Message-Id: <1574350609-29518-1-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.8.3.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::441
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
Cc: ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 39e2821077e6dcf788b7c2a9ef50970ec7995437:

  Update version for v4.2.0-rc2 release (2019-11-19 19:34:10 +0000)

are available in the git repository at:

  git://github.com/bonzini/qemu.git tags/for-upstream

for you to fetch changes up to 02fa60d10137ed2ef17534718d7467e0d2170142:

  i386: Add -noTSX aliases for hle=off, rtm=off CPU models (2019-11-21 16:35:05 +0100)

----------------------------------------------------------------
* x86 updates for Intel errata (myself, Eduardo)
* the big ugly list of x86 VMX features, which was targeted for 5.0 but
caused a Libvirt regression (myself)

----------------------------------------------------------------

The diffstat is scary, but 90% of the patches are adding initializers to
the CPU model definitions.

Eduardo Habkost (2):
      i386: Add new versions of Skylake/Cascadelake/Icelake without TSX
      i386: Add -noTSX aliases for hle=off, rtm=off CPU models

Paolo Bonzini (2):
      target/i386: add VMX features to named CPU models
      target/i386: add support for MSR_IA32_TSX_CTRL

 target/i386/cpu.c     | 759 +++++++++++++++++++++++++++++++++++++++++++++++++-
 target/i386/cpu.h     |   5 +
 target/i386/kvm.c     |  13 +
 target/i386/machine.c |  20 ++
 4 files changed, 796 insertions(+), 1 deletion(-)
-- 
1.8.3.1


