Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12B8A31513B
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 15:09:31 +0100 (CET)
Received: from localhost ([::1]:58876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Thq-0000bH-3r
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 09:09:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1l9TWE-0001X8-DX
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 08:57:30 -0500
Received: from mta-02.yadro.com ([89.207.88.252]:56134 helo=mta-01.yadro.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1l9TWC-0007we-Ds
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 08:57:30 -0500
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 666E64127C;
 Tue,  9 Feb 2021 13:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-transfer-encoding:content-type:content-type:mime-version
 :x-mailer:message-id:date:date:subject:subject:from:from
 :received:received:received; s=mta-01; t=1612879045; x=
 1614693446; bh=k15TqA+AJX/b0dHb+C2/0Phd/unzcf1lrhXV/y0lMD4=; b=B
 hV/whRV2ZwbHVoQut0jtA0Nq24u2SbPsFKcBIXtLZz01yb1HaqwhnWYQAp67oroZ
 mu6DK2VUofbWeuEhHIzm2RPbSaxcizKViYPiOOVtOZc8wsqbKQUZdSQDIMCm6Y6X
 LiVrESya2m3t/QjA1FLemCUG/usE1iOPhqSY6pLA+w=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XNIPrjq_70PR; Tue,  9 Feb 2021 16:57:25 +0300 (MSK)
Received: from T-EXCH-03.corp.yadro.com (t-exch-03.corp.yadro.com
 [172.17.100.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 03ACB41279;
 Tue,  9 Feb 2021 16:57:25 +0300 (MSK)
Received: from localhost (172.17.204.212) by T-EXCH-03.corp.yadro.com
 (172.17.100.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Tue, 9 Feb
 2021 16:57:24 +0300
From: Roman Bolshakov <r.bolshakov@yadro.com>
To: <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PULL hvf 0/5] HVF updates for 2021-02-09
Date: Tue, 9 Feb 2021 16:57:17 +0300
Message-ID: <20210209135722.4891-1-r.bolshakov@yadro.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [172.17.204.212]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-03.corp.yadro.com (172.17.100.103)
Received-SPF: pass client-ip=89.207.88.252; envelope-from=r.bolshakov@yadro.com;
 helo=mta-01.yadro.com
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

Hi Paolo,

Please apply the PR to i386 queue (not for master). It contains bug
fixes, cleanups and improvements for HVF accel:
 - Added support of older HW (Hill)
 - Fixed OSXSAVE reporting in CPUID (Alex)
 - Improved Darwin-XNU support (Vladislav)
 - dead code removed (Alex)

Test results: https://gitlab.com/roolebo/qemu/-/pipelines/253575182
The patches don't introduce regressions in kvm-unit-tests.

The following changes since commit d0dddab40e472ba62b5f43f11cc7dba085dabe71:

  Merge remote-tracking branch 'remotes/mst/tags/for_upstream' into staging (2021-02-05 15:27:02 +0000)

are available in the Git repository at:

  https://gitlab.com/roolebo/qemu.git tags/hvf-queue-20210209

for you to fetch changes up to db7884ccdde5425584bec758f72ed658b6549f8a:

  hvf: Fetch cr4 before evaluating CPUID(1) (2021-02-09 12:25:09 +0300)

Thanks,
Roman

----------------------------------------------------------------
Alexander Graf (2):
      hvf: x86: Remove unused definitions
      hvf: Fetch cr4 before evaluating CPUID(1)

Hill Ma (1):
      hvf: Guard xgetbv call

Vladislav Yaroshchuk (2):
      target/i386/hvf: add vmware-cpuid-freq cpu feature
      target/i386/hvf: add rdmsr 35H MSR_CORE_THREAD_COUNT

 target/i386/cpu.h           |   1 +
 target/i386/hvf/hvf-i386.h  |  16 -------
 target/i386/hvf/hvf.c       | 100 +++++++++++++++++++++++++++++++++++++++++++-
 target/i386/hvf/x86_cpuid.c |  34 +++++++++------
 target/i386/hvf/x86_emu.c   |   5 +++
 5 files changed, 127 insertions(+), 29 deletions(-)

-- 
2.30.0


