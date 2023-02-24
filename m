Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F3536A15ED
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 05:32:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVPjI-00077Z-DV; Thu, 23 Feb 2023 23:30:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dxu@dxuuu.xyz>) id 1pVNSq-0001qR-2u
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 21:05:36 -0500
Received: from out3-smtp.messagingengine.com ([66.111.4.27])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dxu@dxuuu.xyz>) id 1pVNSo-0007Oh-3B
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 21:05:35 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 0FE415C0107;
 Thu, 23 Feb 2023 21:05:32 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 23 Feb 2023 21:05:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dxuuu.xyz; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :message-id:mime-version:reply-to:sender:subject:subject:to:to;
 s=fm3; t=1677204332; x=1677290732; bh=/mtwo2KYCh2HRjIqcqyTptRxF
 iwqStgL0AnmN1J/q5w=; b=vNYgIzteRHcHPRGtEzULGzXeimdBtVdfEIJRLXal8
 7H1keMrdZfZI74rHn3uAIg84Kj7sGc7D/r8Duos4qy5SNvZW4rShrIMf0PZlQrYf
 /6L6THp5975tBnTjqyB55pzFv0RjJlWGsAYCHbI0oVI05PBx/5KtuCHoGzEMuhHR
 eGAOE/LSBEUKSVjs49L737ktlujH9m7XPlaodAWoUxL4gm/eb4qauEUSaHrnS6Ob
 jIbxyKlXDhpaCfzxRa2KiSPQUOzwg9U9SZ+55Dqu02BRoQAoH7m+V9rkPl8509bw
 8DGx41vqFRKLX616s0sGO+MGMIn2aBsGWgV735NXw61Nw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
 1677204332; x=1677290732; bh=/mtwo2KYCh2HRjIqcqyTptRxFiwqStgL0An
 mN1J/q5w=; b=RVTD58s67xzEDEpLwvRXZbtydhUBtY5ZjVT37oVqdOMPwUMkLln
 VUokgmFRgEf7LduM7AQJB6MtsfZafwsYGCTvzJNiuv7WhbbDI3BDQxmxFEVQDt3S
 6B1DtvVoK+wL7fM5oPHTs+NJGzsQRiy91DmHe0ssqiytfuCjQd/E9ILOFvY62IXk
 UmhnZw6wnWWJvXg45H/egzzqYlzKs4/uf5tBmNZHaZ53UhzHX5Lv9wwVhv9ozlEr
 nF3czxy+Z64PKYBJDN7b1Nh/2ZRAzWqVHwNFjPas4OJ+t2Td6hEcqTaexP0nPm6I
 K9plU1XbdRtPzvNKb159AtFyIHswX7iftJw==
X-ME-Sender: <xms:axv4Y2T_tm7qkO8UAOkmrIhWBM21zJyxPaV_cK7KACLi4JlgPmE7Xw>
 <xme:axv4Y7yxhP3MplJ_biaS3K0IwPhVrZ2rMIgMBnz4Y_Mhz15u0A_aHfxlSmeAz8xiA
 1nZvs4CsGHTpTt60g>
X-ME-Received: <xmr:axv4Yz3t3gGLcc5ZcNXAaZXhJJZ-T10qr8VyZAHiXjcctH_O-n5tkFfrjx3KmIOaXjV3gaKWkW1wp1-d_pegyaAaWhgGpY_CDu5N7M3HDeA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudekvddgfeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdljedtmdenucfjughrpefhvf
 evufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeffrghnihgvlhcuighuuceougig
 uhesugiguhhuuhdrgiihiieqnecuggftrfgrthhtvghrnhepvdeggfetgfelhefhueefke
 duvdfguedvhfegleejudduffffgfetueduieeikeejnecuvehluhhsthgvrhfuihiivgep
 tdenucfrrghrrghmpehmrghilhhfrhhomhepugiguhesugiguhhuuhdrgiihii
X-ME-Proxy: <xmx:axv4YyA9L_RR5anUPkrSet5DCAjMf5oAiHu3JACS4Zx9LXm-CGBbGA>
 <xmx:axv4Y_iKy76gfTaAzUjuNpm-marQ-y_RawtIfC-XqrtWLyjRai-IBg>
 <xmx:axv4Y-qXC8kc-7XCuRnVfbaX1Ak7GD9QuF2umAKcpkJkI4zqbUkv8w>
 <xmx:bBv4Yyv_L96Do1D-YtFZlLnlUHuCYkEIBdCyCMsVfBBOfivVE7WnPg>
Feedback-ID: i6a694271:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 23 Feb 2023 21:05:31 -0500 (EST)
From: Daniel Xu <dxu@dxuuu.xyz>
To: michael.roth@amd.com,
	kkostiuk@redhat.com
Cc: qemu-devel@nongnu.org,
	dxu@dxuuu.xyz
Subject: [PATCH 0/3] qga: Add optional `merge-output` flag to guest-exec QAPI
Date: Thu, 23 Feb 2023 19:05:12 -0700
Message-Id: <cover.1677197937.git.dxu@dxuuu.xyz>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.27; envelope-from=dxu@dxuuu.xyz;
 helo=out3-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 23 Feb 2023 23:30:42 -0500
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Currently, the captured output (via `capture-output`) is segregated into
separate GuestExecStatus fields (`out-data` and `err-data`). This means
that downstream consumers have no way to reassemble the captured data
back into the original stream.

This is relevant for chatty and semi-interactive (ie. read only) CLI
tools.  Such tools may deliberately interleave stdout and stderr for
visual effect. If segregated, the output becomes harder to visually
understand.

This patchset adds support for merging stderr and stdout output streams
via a new QAPI flag.

Daniel Xu (3):
  qga: test: Use absolute path to test data
  qga: Add optional `merge-output` flag to guest-exec qapi
  qga: test: Add tests for `merge-output` flag

 qga/commands.c        |  13 +++-
 qga/qapi-schema.json  |   6 +-
 tests/unit/test-qga.c | 135 ++++++++++++++++++++++++++++++++++++------
 3 files changed, 133 insertions(+), 21 deletions(-)

-- 
2.39.1


