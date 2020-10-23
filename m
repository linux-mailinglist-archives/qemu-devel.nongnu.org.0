Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AA7C29790D
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Oct 2020 23:47:45 +0200 (CEST)
Received: from localhost ([::1]:33122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kW4uV-0006HN-U4
	for lists+qemu-devel@lfdr.de; Fri, 23 Oct 2020 17:47:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <keithp@keithp.com>) id 1kW4sE-0005Gp-FL
 for qemu-devel@nongnu.org; Fri, 23 Oct 2020 17:45:22 -0400
Received: from home.keithp.com ([63.227.221.253]:42416 helo=elaine.keithp.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <keithp@keithp.com>) id 1kW4sA-0007G0-B0
 for qemu-devel@nongnu.org; Fri, 23 Oct 2020 17:45:22 -0400
Received: from localhost (localhost [127.0.0.1])
 by elaine.keithp.com (Postfix) with ESMTP id 742773F2DD13
 for <qemu-devel@nongnu.org>; Fri, 23 Oct 2020 14:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
 t=1603489513; bh=Jzuf/ZbbXBaQuCVsIs7n+MzaXMCO3H7M3MRjBaqvroQ=;
 h=From:To:Subject:Date:From;
 b=Kdu5KAWO39HL7jED7wL64gfRd/FoCxNS8golgngBZ7i1cxhmIGlypQ06BuYFwM34P
 TAZFwGSIaxHYpQxd98GCbMl3W5U8iR2Iqh/VaByFdvz3C79OHAecskgjy9mUMDZDP+
 eaHIXGq0rhG6sryC2WFKH92xcD/wq4ESdRzjhmIohAqaVZM/t63x3n2zhBFeu+D8ha
 fUq15zXRtEyhYqozIa4dIoPgHyZeixw9RSi+eOyEIakFgfAGdGoYg0ulyNA5H1XvzY
 U2VWMNPK5sJUuU0TvTE7AYWYiqwVWr4yHGsCtQp+0TLGDquHE578WGkt/p1iLAQtWV
 Shv65xHIUW/cA==
X-Virus-Scanned: Debian amavisd-new at keithp.com
Received: from elaine.keithp.com ([127.0.0.1])
 by localhost (elaine.keithp.com [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id 680zWvY4cYGn for <qemu-devel@nongnu.org>;
 Fri, 23 Oct 2020 14:45:13 -0700 (PDT)
Received: from keithp.com (koto.keithp.com [10.0.0.2])
 by elaine.keithp.com (Postfix) with ESMTPSA id 270FF3F2DD10
 for <qemu-devel@nongnu.org>; Fri, 23 Oct 2020 14:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
 t=1603489513; bh=Jzuf/ZbbXBaQuCVsIs7n+MzaXMCO3H7M3MRjBaqvroQ=;
 h=From:To:Subject:Date:From;
 b=Kdu5KAWO39HL7jED7wL64gfRd/FoCxNS8golgngBZ7i1cxhmIGlypQ06BuYFwM34P
 TAZFwGSIaxHYpQxd98GCbMl3W5U8iR2Iqh/VaByFdvz3C79OHAecskgjy9mUMDZDP+
 eaHIXGq0rhG6sryC2WFKH92xcD/wq4ESdRzjhmIohAqaVZM/t63x3n2zhBFeu+D8ha
 fUq15zXRtEyhYqozIa4dIoPgHyZeixw9RSi+eOyEIakFgfAGdGoYg0ulyNA5H1XvzY
 U2VWMNPK5sJUuU0TvTE7AYWYiqwVWr4yHGsCtQp+0TLGDquHE578WGkt/p1iLAQtWV
 Shv65xHIUW/cA==
Received: by keithp.com (Postfix, from userid 1000)
 id 02CE515821A3; Fri, 23 Oct 2020 14:45:12 -0700 (PDT)
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] riscv: Add SiFive test device to sifive targets
Date: Fri, 23 Oct 2020 14:45:04 -0700
Message-Id: <20201023214506.917601-1-keithp@keithp.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.227.221.253; envelope-from=keithp@keithp.com;
 helo=elaine.keithp.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/23 17:45:14
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Reply-to: Keith Packard <keithp@keithp.com>
From: Keith Packard via <qemu-devel@nongnu.org>

The SiFive test device, which is already available in the qemu tree,
allows the system under emulation to shut down qemu. This is currently
used by OpenSBI to terminate QEMU at powerdown time. These two patches
add this device to the two sifive models.



