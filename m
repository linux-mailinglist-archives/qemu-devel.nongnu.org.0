Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D2442B4473
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 14:12:10 +0100 (CET)
Received: from localhost ([::1]:52238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1keeIj-0005Gp-IQ
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 08:12:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1keeH2-0003zi-5s
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 08:10:24 -0500
Received: from mta-02.yadro.com ([89.207.88.252]:35640 helo=mta-01.yadro.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1keeH0-0002l5-FJ
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 08:10:23 -0500
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 02F9441393
 for <qemu-devel@nongnu.org>; Mon, 16 Nov 2020 13:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:content-transfer-encoding:mime-version
 :x-mailer:message-id:date:date:subject:subject:from:from
 :received:received:received; s=mta-01; t=1605532218; x=
 1607346619; bh=SpKRceBLDJwn8pyvNdLD8sSxJXosMFnlGQOhYWtlDGo=; b=h
 V6V/nOG11X+xtKQYv/CrmqUJf6a523xq4KtnIvT5CFgTUTxG9tLJR2xpn5IN0Qc4
 4cemVdZSuVBjzUPXI/av1naWIlgAzxcHAxWrZVL8BqMXzkPqQb6rwfZa40x94JzY
 nJByMOZ60oQHqVrMnU5qNoh5AAIfn4Ot+TzkBuvs3E=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P1UA-QdANrWS for <qemu-devel@nongnu.org>;
 Mon, 16 Nov 2020 16:10:18 +0300 (MSK)
Received: from T-EXCH-04.corp.yadro.com (t-exch-04.corp.yadro.com
 [172.17.100.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 1AB2141373
 for <qemu-devel@nongnu.org>; Mon, 16 Nov 2020 16:10:18 +0300 (MSK)
Received: from localhost (172.17.204.212) by T-EXCH-04.corp.yadro.com
 (172.17.100.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Mon, 16
 Nov 2020 16:10:16 +0300
From: Roman Bolshakov <r.bolshakov@yadro.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH for-6.0 0/6] Add HMP/QMP commands to query accelerator
Date: Mon, 16 Nov 2020 16:10:05 +0300
Message-ID: <20201116131011.26607-1-r.bolshakov@yadro.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.17.204.212]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-04.corp.yadro.com (172.17.100.104)
Received-SPF: pass client-ip=89.207.88.252; envelope-from=r.bolshakov@yadro.com;
 helo=mta-01.yadro.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/16 08:10:19
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
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
Cc: Roman Bolshakov <r.bolshakov@yadro.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

Management applications have no way to determine if certain accelerator
is available. That complicates discovery of non-KVM accelerators.

To address the issue, the series adds two commands:

  'query-accel' for QMP to be used by management apps, and

  'info accel' for HMP to replace 'info kvm' in future.

Thanks,
Roman

Roman Bolshakov (6):
  qapi: Add query-accel command
  qapi: Rename KvmInfo to AccelInfo
  qapi: Use qmp_query_accel() in qmp_query_kvm()
  softmmu: Remove kvm_available()
  hmp: Add 'info accel' command
  qapi: Deprecate 'query-kvm'

 hmp-commands-info.hx       | 13 +++++++++++++
 include/monitor/hmp.h      |  1 +
 include/sysemu/arch_init.h |  1 -
 monitor/hmp-cmds.c         | 36 ++++++++++++++++++++++++++++++++++--
 monitor/qmp-cmds.c         | 18 ++++++++++++++----
 qapi/machine.json          | 37 ++++++++++++++++++++++++++++++-------
 softmmu/arch_init.c        |  9 ---------
 7 files changed, 92 insertions(+), 23 deletions(-)

-- 
2.29.2


