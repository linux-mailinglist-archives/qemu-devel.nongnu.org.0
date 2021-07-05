Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 078CA3BBB85
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 12:48:41 +0200 (CEST)
Received: from localhost ([::1]:40996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0M9Y-00067v-0f
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 06:48:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1m0M7j-0003Rk-EP
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 06:46:47 -0400
Received: from forward1-smtp.messagingengine.com ([66.111.4.223]:48125)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1m0M7g-0000Bx-HD
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 06:46:47 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailforward.nyi.internal (Postfix) with ESMTP id E978E19407AA;
 Mon,  5 Jul 2021 06:46:40 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 05 Jul 2021 06:46:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=r7DAGOVAb7zSSo0L+
 d/P8FgYd74M6jRPN2RgWh8KYPk=; b=KgMWzWdIBJOIpGP7IwiHnvjU6pdtsRVum
 Ly8bCEJsiwcLglbNmAD2sIppgnF4PxPjfEJhnHiz3GxPVmD0mdY5KsTK6nsUJVwG
 T6idON9LZESnIlJXosdI8LYJEyfzzpudtgCKWlSBoXOhQKIk8g8Rp3DwnxfpF9v4
 r6h/5Ea3JN6rIsjq8jmlll2EeMUFwudqFOW3im42t+a7XCcwsTYf1nVKi24ymakd
 2eNsRQX0Rjn8K8YSC22rbVqxwcBwQgVzNNlOhw4xzYkKnh5/tfKBn+ipkZTrOvp5
 BQGL96Z5X3cd5w/YGV0u7eHDzuNcN0yqVfrNPrel/1H+6oHlhPoVA==
X-ME-Sender: <xms:CuPiYDheKHIZ89jPR6qnOYsCYdp_Co_0fm_5MaCZ4vm0VEH_3pHbug>
 <xme:CuPiYACKbJPTRkZCZu3hRGRhewQScc9L0oWNe7PwDi2xQ5BXOfbZavXXZhcPJiSCp
 XRvODeR8PFhCoLWN48>
X-ME-Received: <xmr:CuPiYDEak3gfst-eM-B7cUQHu7BmXNm-VHkQItOaz9JQ4OcYb19F1QxdnERqVxDv45zlgAEPuaHshDqLN1SZOYbjpnf2TRZgw4FYW1uIFLo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeejgedgfedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeffrghvihguucfg
 ughmohhnughsohhnuceouggrvhhiugdrvggumhhonhgushhonhesohhrrggtlhgvrdgtoh
 hmqeenucggtffrrghtthgvrhhnpefhfedtieevleetueeukeffvdfffeeigfdtvdffgeei
 tdegfeffleeihfevtdekfeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluh
 hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepuggrvhhiugdrvggu
 mhhonhgushhonhesohhrrggtlhgvrdgtohhm
X-ME-Proxy: <xmx:CuPiYASZOWii4reygXleK7I0TXbwFeXiuJoAhamyGe8qHX1DWhwxig>
 <xmx:CuPiYAyD8-O30GsEdtcrLzvSfskPRabWN3chDmp6cT0k_p1Owdxp8Q>
 <xmx:CuPiYG4wYo4g_UlODH29UAgNsrOnjHso3Bcl3B19EESAFGLQgqznmw>
 <xmx:EOPiYElQJjrte1hgL4o1s6vP4nG5Q3zUeGLxMvfZI7ZDcpU5sD7cmg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 5 Jul 2021 06:46:33 -0400 (EDT)
Received: from localhost (disaster-area.hh.sledj.net [local])
 by disaster-area.hh.sledj.net (OpenSMTPD) with ESMTPA id 18d5600b;
 Mon, 5 Jul 2021 10:46:32 +0000 (UTC)
From: David Edmondson <david.edmondson@oracle.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 0/8] Derive XSAVE state component offsets from CPUID leaf
 0xd where possible
Date: Mon,  5 Jul 2021 11:46:24 +0100
Message-Id: <20210705104632.2902400-1-david.edmondson@oracle.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: softfail client-ip=66.111.4.223;
 envelope-from=david.edmondson@oracle.com;
 helo=forward1-smtp.messagingengine.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_SOFTFAIL=0.665, UNPARSEABLE_RELAY=0.001 autolearn=no autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 Michael Roth <michael.roth@amd.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>,
 David Edmondson <david.edmondson@oracle.com>, babu.moger@amd.com,
 Roman Bolshakov <r.bolshakov@yadro.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The offset of XSAVE state components within the XSAVE state area is
currently hard-coded via reference to the X86XSaveArea structure. This
structure is accurate for Intel systems at the time of writing, but
incorrect for newer AMD systems, as the state component for protection
keys is located differently (offset 0x980 rather than offset 0xa80).

For KVM and HVF, replace the hard-coding of the state component
offsets with data derived from CPUID leaf 0xd information.

TCG still uses the X86XSaveArea structure, as there is no underlying
CPU to use in determining appropriate values.

This is a replacement for the changes in
https://lore.kernel.org/r/20210520145647.3483809-1-david.edmondson@oracle.com,
which simply modifed the hard-coded offsets for AMD systems.

Testing on HVF is minimal (it builds and, by observation, the XSAVE
state component offsets reported to a running VM are accurate on an
older Intel system).

David Edmondson (8):
  target/i386: Declare constants for XSAVE offsets
  target/i386: Consolidate the X86XSaveArea offset checks
  target/i386: Clarify the padding requirements of X86XSaveArea
  target/i386: Pass buffer and length to XSAVE helper
  target/i386: Make x86_ext_save_areas visible outside cpu.c
  target/i386: Observe XSAVE state area offsets
  target/i386: Populate x86_ext_save_areas offsets using cpuid where
    possible
  target/i386: Move X86XSaveArea into TCG

 target/i386/cpu.c            |  18 +--
 target/i386/cpu.h            |  41 ++----
 target/i386/hvf/hvf-cpu.c    |  34 +++++
 target/i386/hvf/hvf.c        |   3 +-
 target/i386/hvf/x86hvf.c     |  19 ++-
 target/i386/kvm/kvm-cpu.c    |  36 +++++
 target/i386/kvm/kvm.c        |  52 +------
 target/i386/tcg/fpu_helper.c |   1 +
 target/i386/tcg/tcg-cpu.c    |  20 +++
 target/i386/tcg/tcg-cpu.h    |  57 ++++++++
 target/i386/xsave_helper.c   | 267 ++++++++++++++++++++++++++---------
 11 files changed, 381 insertions(+), 167 deletions(-)

-- 
2.30.2


