Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 735086B159A
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 23:50:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pa2bh-00017x-MC; Wed, 08 Mar 2023 17:50:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dxu@dxuuu.xyz>) id 1pa2be-000130-Ir
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 17:49:58 -0500
Received: from out2-smtp.messagingengine.com ([66.111.4.26])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dxu@dxuuu.xyz>) id 1pa2bc-0007pX-Qu
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 17:49:58 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 25F7B5C007C;
 Wed,  8 Mar 2023 17:49:53 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Wed, 08 Mar 2023 17:49:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dxuuu.xyz; h=cc
 :content-transfer-encoding:content-type:content-type:date:date
 :from:from:in-reply-to:message-id:mime-version:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1678315793; x=1678402193; bh=cY
 fJoRQTWA8rZmtsLgtIEhJYjfL9iz6XdufQiBx4WTo=; b=X7/UPpduj6Q8Bvn6So
 4t1Gi6vTV14NGzVLQEFWYbA2G1+tHyJeSHMYrOb1/9TEqqCm3KUWbHIO9dd34A0H
 Nxig47UZZMYtUPXKGu+Qm/86+XV5oEtJr1zGt32sy0pdHIZM1pVChdSVRYWbrJJl
 HRYHxe1n4PMHwE1cAFRLckmkjE98VkTWLz3MOa67N+4UaRbJBHpp7g7alJ4qK2md
 Rosbo/JfUS4Nax9kZehiUYJLvy7XXORTXMOoWHfLy3zUI7YsPnocHHFRoeC1//dK
 SeM+NP0WmJ8VI2tDGfLhBjVMbDlp6W2y/5vdsb4oi34ZvpskYIe1tHOQx+b5D3uQ
 xxiw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1678315793; x=1678402193; bh=cYfJoRQTWA8rZ
 mtsLgtIEhJYjfL9iz6XdufQiBx4WTo=; b=RdeRjR/ifpYTlrUhpNqE9Dpm6ymXA
 aiMDwnxNWFofx/c9DyX+JKy3xTTSdwr4gOL0geQsrvBCx2PsjgRh0aOrsBOvO9Rf
 hmpGLHTE+cfA2/qYsjHzW0nuwwLeotU2gszzsU7toFF4keHa3ykyMMD6HpIDymFq
 d2qH95aVUOeihAQmDEGWonICHTR8AF+Qwue2WsA+XsLV19KDgq/jj3vcRLaHDeEE
 YoQkdMRrczDb8balqg8Prd3DKwOdDY2kgwOa2lwsjduo/pSso0ixQdT2vSft6D5d
 47C+hrN9sGuDhvhnNgyXdZkKcWxmm1nQYey8SjfsrD3bvdp4mZ3bR9JEQ==
X-ME-Sender: <xms:EBEJZGN7jVK6P15j6W2-_oMg0x37xuHStqAXnzUGvgoDUHm8n8cl4A>
 <xme:EBEJZE-XUiRctKCAFXHh-3Mlg-F0dZItFL6qpTSRgG2Zxo_U2w4_KbtWA946vMMSI
 yETslMb10ir560Xvg>
X-ME-Received: <xmr:EBEJZNS-T6Ekz5CVm3sO-_dxw6ObjSg0Pkw0Qs1UAfZjgqX5C_XgR4VKXSNKeNDzYp0c4Z_E-zM56Ta3a9EO9nKNcur6VEoGUN6jO4rqj2Mejg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvddugedgtdduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdljedtmdenucfjughrpefhvf
 fufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpeffrghnihgvlhcuighuuceougig
 uhesugiguhhuuhdrgiihiieqnecuggftrfgrthhtvghrnhephfetveduiefhgeektddugf
 elheevvefhveegledthedujeeuteelkeffleeiudfgnecuvehluhhsthgvrhfuihiivgep
 tdenucfrrghrrghmpehmrghilhhfrhhomhepugiguhesugiguhhuuhdrgiihii
X-ME-Proxy: <xmx:EREJZGskulxPvt0I7JegAaFWLh2q1nBsEDv4O06W_0W_UnyPm0UPMA>
 <xmx:EREJZOdn4VBgLwDQFNhb0nWSBOB29cnwAeezdYZt64VsUPk0RZ-6qw>
 <xmx:EREJZK1jLY_uqubq-O_M-ikuG3dSZDMiC8CtWVgwtI7OG3kP2QkbAA>
 <xmx:EREJZCEya2RFM6GtORuLPyDFr-RvvSaZLf-Kq22H6xHwap6blh9G-Q>
Feedback-ID: i6a694271:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 8 Mar 2023 17:49:52 -0500 (EST)
From: Daniel Xu <dxu@dxuuu.xyz>
To: qemu-devel@nongnu.org,
	marcandre.lureau@gmail.com,
	berrange@redhat.com
Subject: [PATCH v4 0/3] qga: Support merging output streams in guest-exec
Date: Wed,  8 Mar 2023 15:49:38 -0700
Message-Id: <cover.1678314204.git.dxu@dxuuu.xyz>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.26; envelope-from=dxu@dxuuu.xyz;
 helo=out2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
via a backwards compatibile refactor and a new enum variant,
`all-merge`.

---

Changes from v3:
* Split out ASAN fixes into separate patch series
* Refactor `capture-output` flag into an enum
* Avoid using /bin/bash on windows

Changes from v2:
* Error out if `merge-output` on windows guests
* Add FIXMEs for when glib is updated
* Fix memory leaks in qemu-keymap

Changes from v1:
* Drop invalid test fix
* Do not support `merge-output` on windows guests
* Fix a UAF in tests


Daniel Xu (3):
  qga: Refactor guest-exec capture-output to take enum
  qga: Add `all-merge` variant to GuestExecCaptureOutputMode
  qga: test: Add tests for `all-merge` flag

 qga/commands.c        |  68 ++++++++++++++++--
 qga/qapi-schema.json  |  34 ++++++++-
 tests/unit/test-qga.c | 158 +++++++++++++++++++++++++++++++++++++-----
 3 files changed, 237 insertions(+), 23 deletions(-)

-- 
2.39.1


