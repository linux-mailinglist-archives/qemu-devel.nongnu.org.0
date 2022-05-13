Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B7A652692A
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 20:23:16 +0200 (CEST)
Received: from localhost ([::1]:35942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npZwZ-0006xU-MN
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 14:23:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1npZjx-0004Wy-VX; Fri, 13 May 2022 14:10:16 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:38764)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1npZju-0007L0-CS; Fri, 13 May 2022 14:10:12 -0400
Received: by mail-ej1-x633.google.com with SMTP id n10so17759489ejk.5;
 Fri, 13 May 2022 11:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=B+mnGzoN8dF8kZBDeMa+h7r+FYrqSgMHMidhuCTWTwI=;
 b=KQyMk8bzCjy0W1OsgrA0q4WybcDGmASfNSaP4NhbF5LFNZ0A2hOdi8gP/DomS8+9dO
 LOtlncXxSgCWY/yVRwqKmITN6LDQQHN4lDTe2BEwVzeS2Bo5DqdyfggEHTGDOKhnxoDx
 UWWqWoAaGdd0Hf+R50zigPdk255eeYJeETMTLpLprPojkA6nTPQhppqWkLirQ9mOECCu
 JnNA3pumn8jQ+zzVk9jEQpA6aMwE58GROOErTICDOHsi8QdTug0tQuTRamAQPOpwhE3t
 9YagHd8XqrwxN4bQN02sWW9uOU4i/zG/Yhv2qINbJzmYkJj9N/00IYn/RQrsgbng6wsn
 jc7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=B+mnGzoN8dF8kZBDeMa+h7r+FYrqSgMHMidhuCTWTwI=;
 b=B35XONPqFEDJahqoRN1VSEdNuodMlaB9l1bq/ANHcaCW9vkd69v5nrR/7WnlvmrJSA
 NQOq8iqGQhSDDmvv71PSDeAeX4HAUltIYBbNd1Z5SCMOCmRIbObPUJyBnf8WlWD2h/x2
 RuCGQm9CPeoQ75KZQp01kOZb4FiMPvqXGB3Dk+bPmhV/iFvl6AhfuQh/VwFcv51XxNKP
 0bbGQirS/PC3PH5dagSQhrzj5tiO9MMTJdfR4PRUB8GzzRohKJs7oatq4m8dHDOQx8fG
 b1Uval4mJe/kbcyBnBq1BuigK5mZ0lGcE/PHGycq4TRM17iEHAuEf4v2J/Z35oOVokS7
 gUPg==
X-Gm-Message-State: AOAM533+1tF735n9ZzpAkUPrFSYTzWhWsiPDY8VAfJOpqZyv4odi6bmB
 U0yhM8zxg5KAvN97RBvP/QfqXPlRWTs=
X-Google-Smtp-Source: ABdhPJxLNDiGt6mu8g/iIcRbxj5+FP6Ssv6g2I5vuL2XAJ6cqEhKgpSgehK74/8lZ6EnnQbrcXlRVA==
X-Received: by 2002:a17:907:1b19:b0:6f0:1022:1430 with SMTP id
 mp25-20020a1709071b1900b006f010221430mr5361497ejc.13.1652465407328; 
 Fri, 13 May 2022 11:10:07 -0700 (PDT)
Received: from Provence.localdomain
 (dynamic-089-014-181-123.89.14.pool.telefonica.de. [89.14.181.123])
 by smtp.gmail.com with ESMTPSA id
 e11-20020a170906648b00b006fa84a0af2asm1040008ejm.16.2022.05.13.11.10.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 May 2022 11:10:07 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, sstabellini@kernel.org, anthony.perard@citrix.com,
 paul@xen.org, xen-devel@lists.xenproject.org,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v2 0/3] PIIX3-IDE XEN cleanup
Date: Fri, 13 May 2022 20:09:54 +0200
Message-Id: <20220513180957.90514-1-shentey@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

v2:
* Have pci_xen_ide_unplug() return void (Paul Durrant)
* CC Xen maintainers (Michael S. Tsirkin)

v1:
This patch series first removes the redundant "piix3-ide-xen" device class and
then moves a XEN-specific helper function from PIIX3 code to XEN code. The idea
is to decouple PIIX3-IDE and XEN and to compile XEN-specific bits only if XEN
support is enabled.

Testing done:
'qemu-system-x86_64 -M pc -m 1G -cdrom archlinux-2022.05.01-x86_64.iso" boots
successfully and a 'poweroff' inside the VM also shuts it down correctly.

XEN mode wasn't tested for the time being since its setup procedure seems quite
sophisticated. Please let me know in case this is an obstacle.

Bernhard Beschow (3):
  hw/ide/piix: Remove redundant "piix3-ide-xen" device class
  hw/ide/piix: Add some documentation to pci_piix3_xen_ide_unplug()
  include/hw/ide: Unexport pci_piix3_xen_ide_unplug()

 hw/i386/pc_piix.c          |  3 +--
 hw/i386/xen/xen_platform.c | 48 +++++++++++++++++++++++++++++++++++++-
 hw/ide/piix.c              | 42 ---------------------------------
 include/hw/ide.h           |  3 ---
 4 files changed, 48 insertions(+), 48 deletions(-)

-- 
2.36.1


