Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 874CD6A5F0C
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 19:52:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pX540-0006fi-V2; Tue, 28 Feb 2023 13:51:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dxu@dxuuu.xyz>) id 1pX53z-0006dC-01
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 13:50:59 -0500
Received: from out1-smtp.messagingengine.com ([66.111.4.25])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dxu@dxuuu.xyz>) id 1pX53w-0006vP-PH
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 13:50:58 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id C8FE35C0071;
 Tue, 28 Feb 2023 13:50:50 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Tue, 28 Feb 2023 13:50:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dxuuu.xyz; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1677610250; x=1677696650; bh=A20rQCBtkU
 RvBTjG01ltZInqHyXmELhal700PYSn5oM=; b=SoG+wFnnhfIS1ovNli/e3lId/q
 +2p3s+4msqblfwB1W02+1bmwxQfRkIHw1kNcSg6iqmUy8TfUmN3Ad31MR3cjzT6I
 ZtL6K6mkgnbwV1ufJQziMajqDUYLaK0ierbzd+5UNMooLVrU2K6YpNp4rPMK9wPi
 UbZOXWMaZUsZ+QuIwYgbisdMCurpO93VyRkjpHO0UgNIJp3DNRwFc3FXjyG5r88e
 Mcw7RJR95UH/ECkSxQZbLamNnmtlUIOM/ambA8kVBGBp5u8/1HcYONgfd7iD094p
 cR4crDO3pBGEk33HwrW1Cg/ZM3HQ5zfKhn/ePdd1APcX/AlR0MYopwKO4uaw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1677610250; x=1677696650; bh=A20rQCBtkURvB
 TjG01ltZInqHyXmELhal700PYSn5oM=; b=eGL2B6f8xJO6Q21L8Z1noFBQXSCCE
 Bbk4KiC9jtjXqcMIRGhrDa+RCmBRr/PVEkCBTKzRMDLYaB6iBee6Q1HnQm6YGjZB
 o4s0zsGS3eBDc9qZt7WT3Ab/+xQk4goGyqXliDCC+5lcsaknbkCySmTR3XvTXkdk
 KasN/gBuv+BYXo0y6iPXRqhD9VirUw8e51NpiRqysNMd0h2m20unrb6UcSwPa0zL
 lGIlwGPhFWfKcRHNju+W+VUhVUNB7GfOJUeibOkQXG9Ddl1c04kp85AZmzQEEfxJ
 TduU1AuDHNo2WGJrP6/mGsYuGRtoQU2T56g6qwMdIT5HzUmo9Gezah+xA==
X-ME-Sender: <xms:Ck3-Y_b8e4AAjid9dLly8SkZGIkZGnXRJDCPXAfrXGBk5-VUUnrGlw>
 <xme:Ck3-Y-bUzegCiAtMI6tPr5G6kI1rd4RnbO3J_8MnS0IWG0jgUPBy2tLpuv-IlscWC
 PbYyJU_b1A1IIrxJw>
X-ME-Received: <xmr:Ck3-Yx-iUrxOBS_Ffwwla2aFx5hasMpyVRn7qbC7ee1S0QA4HJQJM2Wr9jbCg0FZ7HbaiuL-SVJ8k6GTOZzUD-TeMe2jGbJn_4CTUJYFGYdQSg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudelfedgheegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdljedtmdenucfjughrpefhvf
 evufffkffogggtgfesthekredtredtjeenucfhrhhomhepffgrnhhivghlucgiuhcuoegu
 gihusegugihuuhhurdighiiiqeenucggtffrrghtthgvrhhnpeehleehgeekieegffdugf
 ejfeffveeuhfdtfeehgfekvdfgheeuvdevkeetiedukeenucevlhhushhtvghrufhiiigv
 pedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegugihusegugihuuhhurdighiii
X-ME-Proxy: <xmx:Ck3-Y1pNTgggdp5fzG5KX9f5LxqU7Df_9Pi4gudb7KgwqZYlNBvdvA>
 <xmx:Ck3-Y6qPEXoEsbC8xgGbdYWBEsRwhsq9c44eNDZvUAvKY4t0yLM--g>
 <xmx:Ck3-Y7SDKx6fZw399Ngrmg5L45wkl4n7BEQIq8VrYM7R6eFyxNvpYA>
 <xmx:Ck3-YxREIHHmiaT86DVnSy8EV0q1d8Ya-OEbnqrwWeLO_m7Fghw7hw>
Feedback-ID: i6a694271:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 28 Feb 2023 13:50:50 -0500 (EST)
From: Daniel Xu <dxu@dxuuu.xyz>
To: qemu-devel@nongnu.org
Cc: marcandre.lureau@gmail.com
Subject: [PATCH v2 0/3] qga: Add optional `merge-output` flag to guest-exec
 QAPI
Date: Tue, 28 Feb 2023 11:50:33 -0700
Message-Id: <cover.1677609866.git.dxu@dxuuu.xyz>
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

Changes from v1:
* Drop invalid test fix
* Do not support `merge-output` on windows guests
* Fix a UAF in tests


Daniel Xu (3):
  crypto/luks: Initialize stack variable to silence warning
  qga: Add optional `merge-output` flag to guest-exec qapi
  qga: test: Add tests for `merge-output` flag

 crypto/block-luks.c   |   2 +-
 qga/commands.c        |  14 ++++-
 qga/qapi-schema.json  |   6 +-
 tests/unit/test-qga.c | 133 ++++++++++++++++++++++++++++++++++++------
 4 files changed, 134 insertions(+), 21 deletions(-)

-- 
2.39.1


