Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 418502DF74B
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Dec 2020 01:55:08 +0100 (CET)
Received: from localhost ([::1]:50052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kr9Te-0007aE-Ir
	for lists+qemu-devel@lfdr.de; Sun, 20 Dec 2020 19:55:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1kr9SF-0006cQ-20; Sun, 20 Dec 2020 19:53:39 -0500
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:48467)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1kr9SD-0005H7-4l; Sun, 20 Dec 2020 19:53:38 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id B230C5803E8;
 Sun, 20 Dec 2020 19:53:34 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Sun, 20 Dec 2020 19:53:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm1; bh=sUtRj3NPtex5SKNHchbwBlkxCW
 UTwtJkEMqd19YdEoo=; b=rb3+vnOYw47nGA793QjNFj305dzdpLD0QiQPynvhsx
 Ow1dPKfaRS147GloYsVpnqAaJ5lRUvW2VJcONc921QpDCWb5P9hoUgXuCh4EJ4uO
 /qjJaE1ghoREl/tXvXcxg/2aBxtDUrbniwtEJK7RaEK8BjJwNFydQ9ys/q2ocUZG
 ioDSU4KEEQB7zWyXc6GE7gcNPA0NIDaZHg0Xr8+V5HIZ5b4poukzNj1FtNJALZt8
 aWuSX6UvBEtyS3KHgipa9KFcku5UfMDqOaMEj12RgN6c7TB82QtvQxX95oppndmJ
 sb0EndTvPdGZmKsCIUASAFFIN7msMA0TYcs374Qjk4SA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=sUtRj3NPtex5SKNHc
 hbwBlkxCWUTwtJkEMqd19YdEoo=; b=dOLFE8uc6ZJIIZoxWj5Xym7QRVGeUMcms
 VwGPlcFrC4f1eBQxjbxbEG9F9BW3+zY/tUChD1BPSq+YydnIud8TSa+3omR4RJkX
 TYXeNDC7biKtYnDzhIGgTwvGzBaX5IPxApz/6fjSAospZvr1VGrc2tMZeMSifdTU
 RN97AG8qxnC5VmH5qki2Sdr0/9v/I+1bq5/X4iBFtQ6PZpdS0ZcsHSFAv6GTw3CH
 O8pVLGhowHfmHr5mCECRo7KW5wU/7QwHvWqI9+KZOtY7iJVU/9fez9cVN+AXFehH
 Lyd0WYzzGCgRg5xk8ojigIaoq7d0Pf5eyoJvaRdppQAIJHHOWZ9Lw==
X-ME-Sender: <xms:DPLfX_Qby4D_Z-T_otFR0awzCRzM_eWzY6DxSo1W0xBa98NI04Bu2Q>
 <xme:DPLfXww7fvYz5BwIjFVq1ermLCS5WdZjVBkmMpOhsTF_kdfd82371ol_Bj28dKPUS
 f1uJIJU91wu4FiUUks>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvddtuddgvdekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeflihgrgihunhcu
 jggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqnecuggftrf
 grthhtvghrnhepffdtheduudetvdeijefgjeegleeiudeikeekjeffheeiteejffduiefh
 leehvedunecuffhomhgrihhnpegrlhhpihhnvghlihhnuhigrdhorhhgpdhgihhtlhgrsg
 drtghomhenucfkphepgeehrdeffedrhedtrddvheegnecuvehluhhsthgvrhfuihiivgep
 tdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgoh
 grthdrtghomh
X-ME-Proxy: <xmx:DPLfX01EPCvMjPPRWlIdC2ZvexfT6qmWqo9YEgZIMfUbzK8s3EuP_g>
 <xmx:DPLfX_Cu5Y8jXiaGj7XHEQg0vvvwJVTl6MZN1XzYO_eJd-OfyHYLJQ>
 <xmx:DPLfX4jgekGth9QEmV8rRSV_5fm4pcJBhZIeGWfn2WYrxzxx3nr01w>
 <xmx:DvLfX47_ys_J75tgycK8JorROAT7nEQHrm4q-KZh6pKEibCqmxtDBZWbkiBNOryd>
Received: from strike.U-LINK.com (li1000-254.members.linode.com [45.33.50.254])
 by mail.messagingengine.com (Postfix) with ESMTPA id 7995B24005A;
 Sun, 20 Dec 2020 19:53:24 -0500 (EST)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/9] Alpine Linux build fix and CI pipeline
Date: Mon, 21 Dec 2020 08:53:09 +0800
Message-Id: <20201221005318.11866-1-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: permerror client-ip=66.111.4.224;
 envelope-from=jiaxun.yang@flygoat.com; helo=new2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 T_SPF_PERMERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Thomas Huth <thuth@redhat.com>, kvm@vger.kernel.org,
 Viktor Prutyanov <viktor.prutyanov@phystech.edu>,
 Laurent Vivier <lvivier@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, Greg Kurz <groug@kaod.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Alpine Linux[1] is a security-oriented, lightweight Linux distribution
based on musl libc and busybox.

It it popular among Docker guests and embedded applications.

Adding it to test against different libc.

[1]: https://alpinelinux.org/

Tree avilable at: https://gitlab.com/FlyGoat/qemu/-/tree/alpine_linux_v1

Jiaxun Yang (9):
  tests/docker: Add dockerfile for Alpine Linux
  configure: Add sys/timex.h to probe clk_adjtime
  configure/meson: Only check sys/signal.h on non-Linux
  libvhost-user: Include poll.h instead of sys/poll.h
  elf2dmp: Rename PAGE_SIZE to ELF2DMP_PAGE_SIZE
  hw/block/nand: Rename PAGE_SIZE to NAND_PAGE_SIZE
  accel/kvm: avoid using predefined
  tests: Rename PAGE_SIZE definitions
  gitlab-ci: Add alpine to pipeline

 .gitlab-ci.d/containers.yml               |  5 ++
 .gitlab-ci.yml                            | 23 ++++++++
 accel/kvm/kvm-all.c                       |  3 +
 configure                                 |  1 +
 contrib/elf2dmp/addrspace.c               |  4 +-
 contrib/elf2dmp/addrspace.h               |  6 +-
 contrib/elf2dmp/main.c                    | 18 +++---
 hw/block/nand.c                           | 40 ++++++-------
 meson.build                               |  5 +-
 subprojects/libvhost-user/libvhost-user.h |  2 +-
 tests/docker/dockerfiles/alpine.docker    | 56 ++++++++++++++++++
 tests/migration/stress.c                  | 10 ++--
 tests/qtest/libqos/malloc-pc.c            |  4 +-
 tests/qtest/libqos/malloc-spapr.c         |  4 +-
 tests/qtest/m25p80-test.c                 | 54 ++++++++---------
 tests/tcg/multiarch/system/memory.c       |  6 +-
 tests/test-xbzrle.c                       | 70 +++++++++++------------
 17 files changed, 201 insertions(+), 110 deletions(-)
 create mode 100644 tests/docker/dockerfiles/alpine.docker

-- 
2.29.2


