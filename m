Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E28E16A15EC
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 05:32:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVPjC-00075m-6z; Thu, 23 Feb 2023 23:30:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dxu@dxuuu.xyz>) id 1pVM3C-00067Q-Nq
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 19:35:02 -0500
Received: from out5-smtp.messagingengine.com ([66.111.4.29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dxu@dxuuu.xyz>) id 1pVM3B-0003mD-7c
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 19:35:02 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 709995C00E3;
 Thu, 23 Feb 2023 19:34:59 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 23 Feb 2023 19:34:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dxuuu.xyz; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :message-id:mime-version:reply-to:sender:subject:subject:to:to;
 s=fm3; t=1677198899; x=1677285299; bh=/mtwo2KYCh2HRjIqcqyTptRxF
 iwqStgL0AnmN1J/q5w=; b=ST9JvWTh4SC0IhRiKiEhAlKkHftaYNXjSgpeeBt/E
 2rXFj1RvIU0OUOJL06ABMojSwGyz6MWuzoxv2Tj7W3yBjTHVk5Yd6AfgaSb5sg+c
 GTHE62qdoIYJ9A6dvj753mD+PhuV5Yr5tqBTZDK+Bf5pthEfYCrBCSXO48TWiGYd
 ShkSm6U2aDh1tQht73/WwlnuQvxYw8y5iZh9EKFZkJvacbuDk3wBOWUJlQddHT/k
 xPiW5F/BcQYOZckSVFXw0rxbdNUR98xsVfLHPq/BlseqgIIF0TNg5kDdf6tUWEzs
 6I/biUqEvaUlyBg/YNGbdKxKFvET6T1fr5x1IxiG82u/w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
 1677198899; x=1677285299; bh=/mtwo2KYCh2HRjIqcqyTptRxFiwqStgL0An
 mN1J/q5w=; b=ocOBqOiXCoB/0e7Mz2a+dpVhAwyVubI3BSGT5nQfHcZaslL2SuH
 s9mBE8BFmneGrLoPrA0dL6iRWeODT83BEJLV4wLWzaaII2IN8todqZEIDzuTURDk
 rVBGCmOLo6NlG8ZnoghfGSmnHA0gHMiFEd9ZxiI6J97dvbdDLv1EMBjQb9gOxUo1
 BTV06C536cRlrR69VKciOQ8qN5Zdq2VPnwrAp8DXuLtBI2MBYcZsbWMpKpT810+x
 KKEGJoFkX5LSz9jkzP6m+6bBkmJF7GZfTkl6pdF7ZEp0U7j9DoKXf0ocEdNad1fC
 dIgby9kDrhOJvB0nmsfuCmuoqihhhhF0evg==
X-ME-Sender: <xms:Mwb4Y9Vn3cKqup0WMA9iXi26HCgKSMhOxkG9Erkyhy8M5_jqady93w>
 <xme:Mwb4Y9mv4JmGXf_OPsOw0jp0VTqTeIJD0JdoDWaHAe69z6t62v6Z6ctyuEUD6a4h6
 KtOTjjUQ9wWhBu4nw>
X-ME-Received: <xmr:Mwb4Y5YtFKSYDB3PKrBchT-NhO5OdqfvAjgS306JfwIbjZT1ZOYPzQZv-c9vcCCiy6vgNB0j6MB8gQOBp7ws-9BSC8nw0EDoGEhCXLh-Gss>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudekvddgvdduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdljedtmdenucfjughrpefhvf
 evufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeffrghnihgvlhcuighuuceougig
 uhesugiguhhuuhdrgiihiieqnecuggftrfgrthhtvghrnhepvdeggfetgfelhefhueefke
 duvdfguedvhfegleejudduffffgfetueduieeikeejnecuvehluhhsthgvrhfuihiivgep
 tdenucfrrghrrghmpehmrghilhhfrhhomhepugiguhesugiguhhuuhdrgiihii
X-ME-Proxy: <xmx:Mwb4YwWZt1yz3nJVK42ib1TcUg_aHnJhtx0D5blPNYwimZOypqhE6Q>
 <xmx:Mwb4Y3lphhBaN0UyAWWY_s06Nxwk3Yyl8eJl8K_jyWMxjvdbbHuxpg>
 <xmx:Mwb4Y9c6cHb5q8gvYHLxBguvOXuMwHj7UNeX7O10ZZQHd7P6uGEx8A>
 <xmx:Mwb4Y_vfxE-xXPMNse_8Un6pKE3I5F6N_ZNreou87VpLtd4_mtIG4w>
Feedback-ID: i6a694271:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 23 Feb 2023 19:34:58 -0500 (EST)
From: Daniel Xu <dxu@dxuuu.xyz>
To: michael.roth@amd.com,
	kkostiuk@redhat.com
Cc: qemu-devel@nongnu.org
Subject: [PATCH 0/3] qga: Add optional `merge-output` flag to guest-exec QAPI
Date: Thu, 23 Feb 2023 17:34:32 -0700
Message-Id: <cover.1677197937.git.dxu@dxuuu.xyz>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.29; envelope-from=dxu@dxuuu.xyz;
 helo=out5-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 23 Feb 2023 23:30:32 -0500
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


