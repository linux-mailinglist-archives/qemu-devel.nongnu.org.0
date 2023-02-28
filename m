Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20B826A60AD
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 21:49:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pX6tX-0000sK-TU; Tue, 28 Feb 2023 15:48:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dxu@dxuuu.xyz>) id 1pX6tV-0000rp-5X
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 15:48:17 -0500
Received: from out1-smtp.messagingengine.com ([66.111.4.25])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dxu@dxuuu.xyz>) id 1pX6tS-0006YR-VK
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 15:48:16 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 1C2E15C009F;
 Tue, 28 Feb 2023 15:48:14 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Tue, 28 Feb 2023 15:48:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dxuuu.xyz; h=cc
 :content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1677617294; x=1677703694; bh=DOgJN8xgSB
 X/r1kbXk2nEOE8wpz9ncDLR+8illHWppI=; b=VQFJBkDnqGzWQFcYQfv4uTeg8y
 oMQGfm+mhWlrFOwy7gGmnlRDe8uHyFNrcl58UQWZ+l3sMT5tdVSNRnJNgWx/oNGL
 VJL9GLJBgN4DS0VqwXXEo+lLw48jXO0txOSOSF9DcsWUsX53VfWDMqsordOU9fZB
 9Pvpsz/FvsgMNtGaSq8mFxj6ATjqzALN6N4t8PUMJzlktn1XJlqKQQr6XqJGhU7g
 hyTqZzRy4fvzGkvgpqiicIev4KqPcg4gNJFvxYQbWNGIsQTHoGZXtmbizPy54z0g
 kXj9cT5V7CjZPFtuwfGvM/rYAHndDwxk81ZO0T3Y/+t9G28C+HjKVwGsMkjw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:date:feedback-id:feedback-id:from:from:in-reply-to
 :message-id:mime-version:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1677617294; x=1677703694; bh=DOgJN8xgSBX/r1kbXk2nEOE8wpz9
 ncDLR+8illHWppI=; b=ax790htmhqOpWePTaHIPqcjzc93fOqnNRFv//RSUPJYH
 b7abcUpno5RWpCElQWeuxOV2uae60M0QvodUP92+4K0Rui1VWp8uQcAImP/hOcvN
 mmM7hKn+0F5tUEkR0eU3eVAv3A+0jpkv7oEKg+ALpgxo9TwIS0+/URJfIvTxTkV9
 qFZ0ta1DvSuAjZB1sQwhz+tyBqVzbtGlvROEK+x2f38VPYblfqmzwtH7iA9Z97sE
 PHYaqN1OdLbauICQXmHivwzDB678RTiDShqUZlXP+Y5MxN9SvfM4NFPWjwr6dkzc
 VpfzRVIB0lD4P/Nr4xM6j0jm2P2EaZSyhZh7r9X+WQ==
X-ME-Sender: <xms:jWj-Y2uEkfnLURpykt_wHov_YM5o8lECGn8wxyDCcSOgOBueYJIVqg>
 <xme:jWj-Y7efhySZ5pw5droCxqliwGLPUVpobBdavT49JnSU-g5VxVMwgn4JwREsuHtTn
 20Bey14VxlOaSBzEg>
X-ME-Received: <xmr:jWj-YxzDUU1p55Or65-kvhNtvw1JHc28-2shx8_ArS8sWqxU2cHB0wM_D1bWHnfN6LDXJwX0kMabW4PodjEs3Ji4omO5Ghcsd3RhlA80jfKLdA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudelfedgjeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdljedtmdenucfjughrpefhvf
 fufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpeffrghnihgvlhcuighuuceougig
 uhesugiguhhuuhdrgiihiieqnecuggftrfgrthhtvghrnhephfetveduiefhgeektddugf
 elheevvefhveegledthedujeeuteelkeffleeiudfgnecuvehluhhsthgvrhfuihiivgep
 tdenucfrrghrrghmpehmrghilhhfrhhomhepugiguhesugiguhhuuhdrgiihii
X-ME-Proxy: <xmx:jmj-YxOnzsu2xBQw-RfwrjLBBERuvNdVvuP-JMe3uD1RrPoRO7wLnA>
 <xmx:jmj-Y2_53yxe3UHRFgvJObi2h4ET7WGtkS6dTDdjvny_fVDT5sm2nw>
 <xmx:jmj-Y5WKsQopZ_P6rWufne9r3WwyjRMiYqznkx1v4IpMW-8tqzpEBg>
 <xmx:jmj-Y7GnEX_f6Wo9oTBgD5ZcJo-wY7NJ5S8dTA7FchP8lAwYmSiToA>
Feedback-ID: i6a694271:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 28 Feb 2023 15:48:13 -0500 (EST)
From: Daniel Xu <dxu@dxuuu.xyz>
To: qemu-devel@nongnu.org,
	marcandre.lureau@gmail.com
Subject: [PATCH v3 0/4] qga: Add optional `merge-output` flag to guest-exec
 QAPI
Date: Tue, 28 Feb 2023 13:48:00 -0700
Message-Id: <cover.1677617035.git.dxu@dxuuu.xyz>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.25; envelope-from=dxu@dxuuu.xyz;
 helo=out1-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Changes from v2:
* Error out if `merge-output` on windows guests
* Add FIXMEs for when glib is updated
* Fix memory leaks in qemu-keymap

Changes from v1:
* Drop invalid test fix
* Do not support `merge-output` on windows guests
* Fix a UAF in tests

Daniel Xu (4):
  crypto/luks: Initialize stack variable to silence warning
  qemu-keymap: Fix memory leaks
  qga: Add optional `merge-output` flag to guest-exec qapi
  qga: test: Add tests for `merge-output` flag

 crypto/block-luks.c   |   2 +-
 qemu-keymap.c         |   5 ++
 qga/commands.c        |  28 +++++++-
 qga/qapi-schema.json  |   6 +-
 tests/unit/test-qga.c | 157 +++++++++++++++++++++++++++++++++++++-----
 5 files changed, 177 insertions(+), 21 deletions(-)

-- 
2.39.1


