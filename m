Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E97BBF8E
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Sep 2019 03:04:09 +0200 (CEST)
Received: from localhost ([::1]:38666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iCZFQ-000364-IF
	for lists+qemu-devel@lfdr.de; Mon, 23 Sep 2019 21:04:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51062)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <tao3.xu@intel.com>) id 1iCZDe-0002D7-Aq
 for qemu-devel@nongnu.org; Mon, 23 Sep 2019 21:02:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tao3.xu@intel.com>) id 1iCZDc-0006Ru-LB
 for qemu-devel@nongnu.org; Mon, 23 Sep 2019 21:02:17 -0400
Received: from mga03.intel.com ([134.134.136.65]:38291)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tao3.xu@intel.com>) id 1iCZDc-0006Qq-DI
 for qemu-devel@nongnu.org; Mon, 23 Sep 2019 21:02:16 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Sep 2019 18:02:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,542,1559545200"; d="scan'208";a="189216131"
Received: from tao-optiplex-7060.sh.intel.com ([10.239.159.36])
 by fmsmga007.fm.intel.com with ESMTP; 23 Sep 2019 18:02:11 -0700
From: Tao Xu <tao3.xu@intel.com>
To: ehabkost@redhat.com, sgarzare@redhat.com, philmd@redhat.com,
 pbonzini@redhat.com, rth@twiddle.net
Subject: [PATCH v4 0/2] target/i386: cpu.h marcos clean up
Date: Tue, 24 Sep 2019 09:02:07 +0800
Message-Id: <20190924010209.27149-1-tao3.xu@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 134.134.136.65
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
Cc: Tao Xu <tao3.xu@intel.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add some comments, clean up comments over 80 chars per line. And there
is an extra line in comment of CPUID_8000_0008_EBX_WBNOINVD, remove
the extra enter and spaces.

Drop the duplicated definition of cpuid AVX512_VBMI marco and rename it
as CPUID_7_0_ECX_AVX512_VBMI. And rename CPUID_7_0_ECX_VBMI2
as CPUID_7_0_ECX_AVX512_VBMI2.

Changelog:
v4:
    - rename CPUID_7_0_ECX_VBMI2 as CPUID_7_0_ECX_AVX512_VBMI2.
      (Suggested by Stefano Garzarella)
v3:
    - split the patch into 2 patches. (Suggested by Stefano Garzarella
      and Eduardo Habkost)
v2:
    - correct the comments over 80 chars per line. (Suggested by
      Philippe Mathieu-Daudé)

Tao Xu (2):
  target/i386: clean up comments over 80 chars per line
  target/i386: drop the duplicated definition of cpuid AVX512_VBMI marco

 target/i386/cpu.c           |   8 +-
 target/i386/cpu.h           | 163 +++++++++++++++++++++++-------------
 target/i386/hvf/x86_cpuid.c |   2 +-
 3 files changed, 111 insertions(+), 62 deletions(-)

-- 
2.20.1


