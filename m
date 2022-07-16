Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49EBE57706E
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Jul 2022 19:36:53 +0200 (CEST)
Received: from localhost ([::1]:56418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oClik-0000Or-SK
	for lists+qemu-devel@lfdr.de; Sat, 16 Jul 2022 13:36:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>) id 1oClgq-000660-GB
 for qemu-devel@nongnu.org; Sat, 16 Jul 2022 13:34:52 -0400
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:44529)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>) id 1oClgo-0004yn-97
 for qemu-devel@nongnu.org; Sat, 16 Jul 2022 13:34:52 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 1C9885805C3;
 Sat, 16 Jul 2022 13:34:47 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Sat, 16 Jul 2022 13:34:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to; s=fm1; t=1657992887; x=1657996487; bh=+gp8GOqI/I
 5BisSsB3rGqVbwXDy1cKIOOsoUBk8Ej6s=; b=hP+xIETHQgXM1WU9a3qd0sts2M
 3U/VkUfnJWuAZe0hDNqRTs9Og0wyyvd4Kl5L3IjoX4nb7PJecgM2J4T78EdztG+H
 l+VriD9bqa1dQ7UrK4ARAaPiHtsKHaLSVNFhoqqYjysxG9U1J8VrSQYKJM2ABMWv
 ZKvzQH4eyRavC1dHwgvxKf0GadL3dksz4mJ74a+ebDj9idSVuAs+oWp3wsDVgvOr
 chbvSc6u/qaej7FmAPQr9kd+8CQtvq5wl/CCn8XVNMVHKU/kp+ztxPam8anDnTkL
 WjsskRyPyXcPACSraiZXZ3Err92sCQQOLYWZ4hunxxJZ6mTMjn7CxA5dPWQg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1657992887; x=1657996487; bh=+gp8GOqI/I5Bi
 sSsB3rGqVbwXDy1cKIOOsoUBk8Ej6s=; b=IPBLar8PLlAD9ARorV4DbT0YXt5de
 uADkwn0U81p1pI9BeT7HRxrsmTOHdm2gipkBOWuw7M6zXbSDQ2dJm+ix71vECvJA
 RygTl7uzrQmVmqC/pe8IwLIjefs9dCKyP7UcA7arS6UaxoqUaCPYJV5mRvKL2yZZ
 btyBfcVORHo0ejmZ6GN4k2IJ2Mk6DeTJBAjYVzXHyewwDI4BoxUIMeQWtk2HKH8J
 uwMtAex8+8gZWBeY3irBMeO0WjRXvIYVQavr1bTzjcEVRJfDqDy5UqUiuTSmWPmV
 fU+hn6lEZ1UXl6B3VQURJGXhLS2BgNdhzYnm2OX27cAdZ9OTin06PdO8w==
X-ME-Sender: <xms:tvbSYsTrOBJIGphSFXfCCNjyZHUlXvSnFgWa2auZHYpSd5pBcd8d1w>
 <xme:tvbSYpyWtH7goqPBZ6Ujchmzuc58QztLLUZxKCZmRwqnMjpCNHcVGXfQmCGjNjRaa
 QLyODn7U3tUsqTuUlI>
X-ME-Received: <xmr:tvbSYp2gZElYmPzknko8IK0AqR0r9mlzfSLB8mcJ7rSFRCNizHeWlFyGfqemayFI_YfCkY38AZ3a85CI-sXM1JVC65YX11Wx>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudekfedguddujecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecumhhishhsihhnghcuvffquchfihgvlhguucdlfe
 dtmdenucfjughrpefhvfevufffkffogggtgfesthekredtredtjeenucfhrhhomheprfgv
 thgvrhcuffgvlhgvvhhorhihrghsuceophgvthgvrhesphhjugdruggvvheqnecuggftrf
 grthhtvghrnhepteffieejvefhleetheduieejtdeiffetudekuddufefghfefueetgefg
 vdffgedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epphgvthgvrhesphhjugdruggvvh
X-ME-Proxy: <xmx:tvbSYgDdxCMyjra76s6AgSWudfAWZVL4eP4_wMJurHVplDzV1-B7tQ>
 <xmx:tvbSYljdoxEuEqaXqIfn4bsjgEzdqQRIyALn9uxpTcPFgj5y66YVKg>
 <xmx:tvbSYsrqqJkMdbTznLlJn-73FhAuGb0pu5FrXeegV0D3egfGz2S5Iw>
 <xmx:tvbSYgXKiBIiKTCpE4OtgENmocPOdVhBjkPnfoFciyiu1anSSwJ_sA>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 16 Jul 2022 13:34:46 -0400 (EDT)
From: Peter Delevoryas <peter@pjd.dev>
To: 
Cc: jsnow@redhat.com, crosa@redhat.com, bleal@redhat.com, f4bug@amsat.org,
 wainersm@redhat.com, qemu-devel@nongnu.org, berrange@redhat.com,
 peter@pjd.dev
Subject: [PATCH v2 0/1] python/machine: Fix AF_UNIX path too long on macOS
Date: Sat, 16 Jul 2022 10:34:33 -0700
Message-Id: <20220716173434.17183-1-peter@pjd.dev>
X-Mailer: git-send-email 2.37.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.230; envelope-from=peter@pjd.dev;
 helo=new4-smtp.messagingengine.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FROM_FMBLA_NEWDOM28=0.798, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

v2:
- Reduced QEMUMachine socket directory prefix length.
- Replaced QEMUMachine default name with "qmp".
- Rewrote commit description.

Thanks,
Peter Delevoryas

Peter Delevoryas (1):
  python/machine: Fix AF_UNIX path too long on macOS

 python/qemu/machine/machine.py         | 2 +-
 tests/avocado/avocado_qemu/__init__.py | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.37.0


