Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D83396A15E3
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 05:31:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVPix-00073h-8k; Thu, 23 Feb 2023 23:30:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dxu@dxuuu.xyz>) id 1pVLqT-0005R8-IA
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 19:21:53 -0500
Received: from out5-smtp.messagingengine.com ([66.111.4.29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dxu@dxuuu.xyz>) id 1pVLqR-0000CY-Sm
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 19:21:53 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id BE4145C00D8;
 Thu, 23 Feb 2023 19:21:48 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Thu, 23 Feb 2023 19:21:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dxuuu.xyz; h=cc
 :content-transfer-encoding:date:date:from:from:in-reply-to
 :message-id:mime-version:reply-to:sender:subject:subject:to:to;
 s=fm3; t=1677198108; x=1677284508; bh=/mtwo2KYCh2HRjIqcqyTptRxF
 iwqStgL0AnmN1J/q5w=; b=wv4hiZv0JciIEv6eOG0CbKC5T+5TzthGFVpbg14ZV
 jlUENoB0xXkt0CGgNz1s/F3Pdy11xzJ2s8snqFso2AprS3351G1sWeYJi5VwqwYn
 dDXuJeORD4LsZv1bcuZUikjvck8Es/t2nCI15FVJkjbMZnDYsnBPY1AIKqA05mR4
 Tu5rsOJG5i0CiWsskw2JxQiav1hxm6y+f7UzU94Om80NeXtds0hrJGGyUIlvvLvY
 ixKc3gO/rssLNUhVDVsvAdL+OeVxMFMUdhqHIwyv7i3Eq2uTAbgxXg++on7V2cGV
 ne3OMF+Q9gesI5o3oSHFFEHaHiaq+sDEGMCb59ouerdVw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
 1677198108; x=1677284508; bh=/mtwo2KYCh2HRjIqcqyTptRxFiwqStgL0An
 mN1J/q5w=; b=LehiwSTwYK8V5UsleYslYa+zt0sfj4WGJ4Sv3udE3u0XaZLorQr
 ZAoScnZGMQ4sbiN1kKXVZVHKcbvcaueGG1htAKNaiFLrHHlHDlQ0Fi/SIklwI/Mm
 /jVzAq4P27ysjodJaA53j4Wkzc293tdYxz2mv4kDAkDLCIKhqPv7qO4N5q5Q2gXa
 YORvTRaznBoq4117m8ikRdcu4PaNabetaSyvCliE1k/3k90qvcjIuDturjvWIKRp
 u+713XTtZy/yBWG4Foy9XrsDrcgTZkCX67LWDoDpvz8vCsUqXK/MDKxIkQ9gaHA5
 /2ltxKU4WjDCNvNRtCesp5UV4ksHHcSLB2A==
X-ME-Sender: <xms:HAP4Y1vZLaBXPUhxWlpsrNXiqotttNFKr-N2JiHDpNEM3L2RKTAGgg>
 <xme:HAP4Y-dpp_YMN_gF3lj2FkUSEoY2Hr3lJBgbuiCbsPK-urVj93tYGQe0_s3T7UfcB
 77GUt5UBJFqqHxeNQ>
X-ME-Received: <xmr:HAP4Y4z5wVgwGPHbFJ2CadG38wYZG-h_rZXDlGRR73fV5qM9dWwWWsXuTIqmG5aZjtPAlKno1nVoFffdf_ecOMC3_Oci_IrUXA8bv8UBuTU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudekvddgudekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdljedtmdenucfjughrpefhvffufffkofgggfestdekredtredttden
 ucfhrhhomhepffgrnhhivghlucgiuhcuoegugihusegugihuuhhurdighiiiqeenucggtf
 frrghtthgvrhhnpeeifffgledvffeitdeljedvteeffeeivdefheeiveevjeduieeigfet
 ieevieffffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpegugihusegugihuuhhurdighiii
X-ME-Proxy: <xmx:HAP4Y8N0vsq_hlqbObX1ucjxtR-mACYKglSt2xU4uV3Mg-efxNSq5w>
 <xmx:HAP4Y1-tBmpxLFGgENGEm-G9biIf4P5KeC2zMNivejJc9Y5yjM2Cww>
 <xmx:HAP4Y8XHFduVLEye61bDTHKudwV8_8bldwT1tUWNHTQSQ5QF4rrCcw>
 <xmx:HAP4Y3k1mIVLwrLr1NhQ7U65C1bbyUBP3sncKSqPRszkD6VylncH1w>
Feedback-ID: i6a694271:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 23 Feb 2023 19:21:48 -0500 (EST)
From: Daniel Xu <dxu@dxuuu.xyz>
To: Michael Roth <michael.roth@amd.com>,
 Konstantin Kostiuk <kkostiuk@redhat.com>, qemu-devel@nongnu.org
Subject: [PATCH 0/3] qga: Add optional `merge-output` flag to guest-exec QAPI
Date: Thu, 23 Feb 2023 17:21:29 -0700
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
X-Mailman-Approved-At: Thu, 23 Feb 2023 23:30:16 -0500
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


