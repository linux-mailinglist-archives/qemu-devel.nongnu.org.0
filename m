Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EB292F9A15
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 07:46:45 +0100 (CET)
Received: from localhost ([::1]:37302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1OJI-0004Zi-9c
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 01:46:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1l1OBI-0002bP-Uu; Mon, 18 Jan 2021 01:38:31 -0500
Received: from wnew4-smtp.messagingengine.com ([64.147.123.18]:41051)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1l1OBF-0007Hw-Js; Mon, 18 Jan 2021 01:38:28 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id 36CDF16A5;
 Mon, 18 Jan 2021 01:38:22 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Mon, 18 Jan 2021 01:38:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=DgEncLxHOwju3s3qsQovwzM5MS
 urO/+K7pT6AH/ZnM4=; b=ccWMOF063Ku6MMNGUrlAMjPF9KPsClnCmWNEv2gxFJ
 LHXYvLUKN/6/lyxJbxnhB8vkYgHY6hlFiuLDt8hVJbz0U5Y+ElqsXBXuvyiOfld+
 gzw2H3KEYEorw9Px/yJw6MZzS7xLsyGv3N/dgIq1bVCwo86/EtOuKvyJ0aoEBo0y
 hMSREwiHo9J3JRkF7H7W7uhqCxAeggDwJAL2gMfPWkBDf2ma88Nw4VQzRY9A64LG
 r0m7IrAscxNo9P4821yweTzSAG/Z7JSxju8Siwwjz/2P1zW8MIzcJVWpSXswMFSq
 QIvdVdYFncngMS7tvWYZpTCKUZwvEZs+VRZ6qe2BdwEQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=DgEncLxHOwju3s3qs
 QovwzM5MSurO/+K7pT6AH/ZnM4=; b=PlOoDjisa4rhkTAeEfJ3RsmKiRi1CJp/j
 QBz6jvD79OAzrVn+kO2p38KMV0cJtt1fzw2xvkA3DrK0EcEA9UmGKVmBTT3P99ia
 SAKBpcXmpSvHJxta9BFMyk7G5h+XkteSIBf7lCI/Y90Vluq9crgHMf931GN4Hm3V
 a+/ib6owhucEoRsSqVmnZQAIqdAPKHFHwLOu6QaruBJoFU9shd6cgzdMamkNnQt+
 gO1a2Yp0C6SpWeZwqsEhV5YRDEPYZIvEN9ReQKWkDMMrFnM5zs50iOd9NEOVQh2p
 1OlK3OjyshSvqQCeg4nmL1Fgp5mzRvwFbmNzodR1IPrgeWMFjlslg==
X-ME-Sender: <xms:3CwFYPZnlIm_u1iAn_-aPsgdP0k7feH3gYh01eT1ePDpoVddwVcqIg>
 <xme:3CwFYOZjVVwEQAHZKZidXGCj53XOgBWvXU07BM_kGOEQMo_tY7PamVALyrdjWGI3q
 Hox2Aht5XmzNII2RMY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrtdejgdeliecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomheplfhirgiguhhnucgj
 rghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqeenucggtffrrg
 htthgvrhhnpeehgfdtkefggfetgeffgfeuuedtjeejudekveevfeevjeefgeettdefleet
 gfdvudenucffohhmrghinhepghhithhlrggsrdgtohhmnecukfhppeduudeirddvvdekrd
 ekgedrvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhm
 pehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:3CwFYB-FhIvTYl22E5U7prntTbIAkVigIumpzLl1HjSL0jtlcrxk0Q>
 <xmx:3CwFYFr0fVb4rO2ztQKeuDlf9XSO8wtNSVGE0e3ErVGG_4Gc1AChIg>
 <xmx:3CwFYKqqZYhwv1Prk61mmqPA5O307gjgeFNXe6eVATbxmK9boI-DVw>
 <xmx:3SwFYObR50qMvbcydSoD8bUFcrqPLgOFZp2BrXBguJZBls6qd9lbZbW_talotIup>
Received: from strike.U-LINK.com (unknown [116.228.84.2])
 by mail.messagingengine.com (Postfix) with ESMTPA id 4F4BD24005B;
 Mon, 18 Jan 2021 01:38:14 -0500 (EST)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/9] Alpine Linux build fix and CI pipeline
Date: Mon, 18 Jan 2021 14:37:59 +0800
Message-Id: <20210118063808.12471-1-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.18;
 envelope-from=jiaxun.yang@flygoat.com; helo=wnew4-smtp.messagingengine.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_SORBS_WEB=1.5, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Viktor Prutyanov <viktor.prutyanov@phystech.edu>, kvm@vger.kernel.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alistair Francis <alistair@alistair23.me>, Greg Kurz <groug@kaod.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>, qemu-ppc@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Alpine Linux is a security-oriented, lightweight Linux distribution
based on musl libc and busybox.

It it popular among Docker guests and embedded applications.

Adding it to test against different libc.

Patches pending review at v2 are: 7, 8, 9

Tree avilable at: https://gitlab.com/FlyGoat/qemu/-/commits/alpine_linux_v2
CI All green: https://gitlab.com/FlyGoat/qemu/-/pipelines/242003288

It is known to have checkpatch complains about identation but they're
all pre-existing issues as I'm only doing string replacement. 

v2:
 - Reoreder patches (Wainer)
 - Add shadow to dockerfile (Wainer)
 - Pickup proper signal.h fix (PMM)
 - Correct clock_adjtime title (Thomas Huth)
 - Collect review tags

Jiaxun Yang (8):
  configure: Add sys/timex.h to probe clock_adjtime
  libvhost-user: Include poll.h instead of sys/poll.h
  hw/block/nand: Rename PAGE_SIZE to NAND_PAGE_SIZE
  elf2dmp: Rename PAGE_SIZE to ELF2DMP_PAGE_SIZE
  tests: Rename PAGE_SIZE definitions
  accel/kvm: avoid using predefined PAGE_SIZE
  tests/docker: Add dockerfile for Alpine Linux
  gitlab-ci: Add alpine to pipeline

Michael Forney (1):
  osdep.h: Remove <sys/signal.h> include

 configure                                 |  1 +
 meson.build                               |  1 -
 contrib/elf2dmp/addrspace.h               |  6 +-
 include/qemu/osdep.h                      |  4 --
 subprojects/libvhost-user/libvhost-user.h |  2 +-
 accel/kvm/kvm-all.c                       |  3 +
 contrib/elf2dmp/addrspace.c               |  4 +-
 contrib/elf2dmp/main.c                    | 18 +++---
 hw/block/nand.c                           | 40 ++++++-------
 tests/migration/stress.c                  | 10 ++--
 tests/qtest/libqos/malloc-pc.c            |  4 +-
 tests/qtest/libqos/malloc-spapr.c         |  4 +-
 tests/qtest/m25p80-test.c                 | 54 ++++++++---------
 tests/tcg/multiarch/system/memory.c       |  6 +-
 tests/test-xbzrle.c                       | 70 +++++++++++------------
 .gitlab-ci.d/containers.yml               |  5 ++
 .gitlab-ci.yml                            | 23 ++++++++
 tests/docker/dockerfiles/alpine.docker    | 57 ++++++++++++++++++
 18 files changed, 198 insertions(+), 114 deletions(-)
 create mode 100644 tests/docker/dockerfiles/alpine.docker

-- 
2.30.0


