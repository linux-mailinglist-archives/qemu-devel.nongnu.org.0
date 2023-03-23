Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 740286C5B4E
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Mar 2023 01:20:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pf8gS-0007dD-KJ; Wed, 22 Mar 2023 20:20:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dxu@dxuuu.xyz>) id 1pf8gF-0007cn-7q
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 20:19:47 -0400
Received: from out5-smtp.messagingengine.com ([66.111.4.29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dxu@dxuuu.xyz>) id 1pf8gD-0005fH-L4
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 20:19:46 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 3A71E5C00E9;
 Wed, 22 Mar 2023 20:19:45 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Wed, 22 Mar 2023 20:19:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dxuuu.xyz; h=cc
 :content-transfer-encoding:content-type:content-type:date:date
 :from:from:in-reply-to:message-id:mime-version:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1679530785; x=1679617185; bh=UM
 Gx9w7ksyaO9iSstF8g7qP84Wag9mtLtmst9DjhIwo=; b=sH1d2agm1bQIgF+5UI
 u29/SdpS9WljnaOYmQtpmnugWGwO454ePca5MvLrD1tq6LSs4EOMhURah9jtKXdg
 DA4Ov8tHjlSqqX0sgJGVoCKgGJ0xRRx66ZFjj41FLJyHKh3MpDibB4ptGKUpLoAy
 uhiJSnrzjL3BfYj6L+RpLK7Ivgi+AAA5HkhJb60KuNh2m9yW62+RXNWkIl/hykvh
 yiY1PgkrW1VTuMuRbB0+MRzcM+rFA86Ba0GcqK1ZTDKNH0kSh1C8VaZrYOPaFGks
 8wdepnMGpFdq9HbXrqKQ04wiKeIkSm3NFzkuhCAcxWRtD6C/oZ5U0GT+3xx8BTKW
 ZL5Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1679530785; x=1679617185; bh=UMGx9w7ksyaO9
 iSstF8g7qP84Wag9mtLtmst9DjhIwo=; b=qPCPBYCXSV6A5w8YXUTw39uIAHwj6
 VZhSt9H54pWBuPmUI+cioKUaf1600Cij6YmpBS91/84sKVrE5jfl/2lxe+/wSsnr
 p9e75n2eHiFTmUOhFI+LLLlqwHsB/MKZofSiwDl0qwf5UagG5LFAjEMcxL0qrV27
 fNEddC17u+dZRbsggiTaPojpdQCk9E6aGEBt4cUv37zq0vCMzhjPulv7l5U3RhMs
 sq9lupLI6GdfURwvetKlNmy+x86aw37VGAjASqMy/MyM5slMUvQfsBa3gIkCHDDY
 qJHb6wLH34PHBu1UClqpy584YNwB/yiGloLTObJzvoUEW3xPHxG5lSgxw==
X-ME-Sender: <xms:IZsbZP5zueUgODl4MQoRgI8TD31kOZmeyX0ZPe1gnW83bcLrd2qa-Q>
 <xme:IZsbZE6zSugvS6mYfE3FGth0ZrJf4Mu5PhOYhJq5VVKK8Kgftj65uNkeDqU0DU46W
 ti65IMWYz1mNG863g>
X-ME-Received: <xmr:IZsbZGfELuyXgxAO9CtVT-56VAwYKO2qXinzPppiXBEHXl1SX0Un8Ieh_RYMV3cQ3zwdc86ZR4Tc6wOy67hkXFI0XjmNnjSCiLpxapuxZpF6iA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdegfedgvddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdljedtmdenucfjughrpefhvf
 fufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpeffrghnihgvlhcuighuuceougig
 uhesugiguhhuuhdrgiihiieqnecuggftrfgrthhtvghrnhephfetveduiefhgeektddugf
 elheevvefhveegledthedujeeuteelkeffleeiudfgnecuvehluhhsthgvrhfuihiivgep
 tdenucfrrghrrghmpehmrghilhhfrhhomhepugiguhesugiguhhuuhdrgiihii
X-ME-Proxy: <xmx:IZsbZAKWNTq-dIJQ_78G8pVHaJAWTnBNrkSR6UvO7kBZw5bTpqAtXQ>
 <xmx:IZsbZDJvsi-zkED7fayUy_aLdizQLiKg-7lhxPGp9uKSSD-HJOCT1g>
 <xmx:IZsbZJzg3v0_0JG0jjXKgA2A-idCFFrC1SYLVNTnt6xvjCTkLm2EhQ>
 <xmx:IZsbZJiftNDgBJK7kMbK8bd7EI3udRIi0zpSIaY4LsC35Emo0rxv0A>
Feedback-ID: i6a694271:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Mar 2023 20:19:44 -0400 (EDT)
From: Daniel Xu <dxu@dxuuu.xyz>
To: qemu-devel@nongnu.org,
	marcandre.lureau@gmail.com,
	berrange@redhat.com
Subject: [PATCH v6 0/3] qga: Support merging output streams in guest-exec
Date: Wed, 22 Mar 2023 18:19:25 -0600
Message-Id: <cover.1679530587.git.dxu@dxuuu.xyz>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
`merged`.

---

Changes from v5:
* Add qapi conditional for `merged` flag
* Remove error check for windows as above conditional enforces it

Changes from v4:
* Rename `all` -> `separated`
* Rename `all-merge` -> `merged`

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
  qga: Add `merged` variant to GuestExecCaptureOutputMode
  qga: test: Add tests for `merged` flag

 qga/commands.c        |  62 +++++++++++++++--
 qga/qapi-schema.json  |  36 +++++++++-
 tests/unit/test-qga.c | 158 +++++++++++++++++++++++++++++++++++++-----
 3 files changed, 233 insertions(+), 23 deletions(-)

-- 
2.39.1


