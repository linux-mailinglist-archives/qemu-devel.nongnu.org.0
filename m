Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16C9B53D2A6
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jun 2022 22:12:00 +0200 (CEST)
Received: from localhost ([::1]:34650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nxDeJ-000250-6y
	for lists+qemu-devel@lfdr.de; Fri, 03 Jun 2022 16:11:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nxDNm-00074D-RZ; Fri, 03 Jun 2022 15:54:54 -0400
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:54867)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nxDNj-0008Cv-7M; Fri, 03 Jun 2022 15:54:54 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 4F6A7320096B;
 Fri,  3 Jun 2022 15:54:48 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Fri, 03 Jun 2022 15:54:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1654286087; x=
 1654372487; bh=XjAUVaZOs6cVxQitSF42MMUPvVUHVcKYxbYsxg8fDLo=; b=E
 gJ4gd0N1gIrVrJtyAvSrv+x15vMsgI3iqRew3qkWGrQdVKMUfMYh27dd13NFS3S2
 Cu1DotP/DfB4gBLqLDKO+i5OSk2pIeZhU4ga+hcRsYo/jHe5iEScoQV14ZIX7f+5
 FFoEojzoJMzllOyExX/XfSd3ZtGjUyP1Fo7ptXwwdaN5z0Hx7+KUD+0ZMOITwcy3
 57pjjoTI2+ECV2ERjHP1g7bOt/s+4yz21hsfFfDczs0Q5isgH+tkE2pZ14kWmeX+
 fLuLHRApjjsu2d8aQTzDfutYh/nR7g70xtgWHnvixU4mQ6JGhmdM7i4WW9kcr8fp
 PA9I9O8PxeGW/PPhdRZ3g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1654286087; x=
 1654372487; bh=XjAUVaZOs6cVxQitSF42MMUPvVUHVcKYxbYsxg8fDLo=; b=x
 OdokhScowL82bV/NCOhQpxmabT8L9N4B5MzarPRgFlzSnDCCUCEGNDDsCHMZerQ+
 XAc1ud/7ABvBT2Zc4iWM8oCjXdSjm9clBp3WJ8va4MiB0KCf+5BtZEGivrcmrRAU
 NHW4fSHuEVScGX37tQVoJyEhlrhF7pfwCAnoTGFxJc0cjb7qbzgdBRvpOI2f0X4j
 nk2qM84lByUXMyPYQgtteaZkcKvuRQVOhPK80JDmnv8sFrjMbXbxjhI2+lR/J3qQ
 896VImGyKBOIR482Wrijvd0zuCAk1L+g6hyDycv9qEMnnf9a8Hj1JxPanXIUtG5K
 w9+t6l9EDopm1XuPKxt+Q==
X-ME-Sender: <xms:B2eaYg3vfv4Aja-bel7yI5e2bh18ECQBKfGajQ-Q0lTKmP2JQKanKg>
 <xme:B2eaYrGSw1Q7-1XO82TADVGeJWqfabDRD3oqj4dK8HOLbP6cdlIol_Qzs6fsWLlk9
 C_cc9byAfMgoJ9bD5E>
X-ME-Received: <xmr:B2eaYo7TnH15uT93W-saug6SYtn_9w92Yh3TPkWHcOe0FT049jt7qGj7gwCUUtql4rcQf_q9fe1LGNSBDD9H>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrleeigddugedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpefmlhgr
 uhhsucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrg
 htthgvrhhnpeefvedtueetueduffevgffgtdeftdeuleffhfeigeffkeegfeejfeffteej
 iefhvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:B2eaYp0To9GlACoHGEdq7-qVVUMEGLlt6FvsrHcirKEJg4RATcPU-Q>
 <xmx:B2eaYjEsDj24mUhVWvRtIAzNfZiNP7eLnktNRtuFnSBwzWGTcmhzDg>
 <xmx:B2eaYi9zz3YqXB8XfI4zLyqwLlS3j_wS1Sjoj6_h4HROEsVi_3oqpg>
 <xmx:B2eaYjHFabuL-JLt9Zs7LiL0sgIQ8QCwL511leL1RkpEqA8OZXEaYA>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 3 Jun 2022 15:54:45 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Cc: Yanan Wang <wangyanan55@huawei.com>, Hanna Reitz <hreitz@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, libvir-list@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Fam Zheng <fam@euphon.net>, Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-block@nongnu.org, Klaus Jensen <its@irrelevant.dk>,
 Keith Busch <kbusch@kernel.org>, Kevin Wolf <kwolf@redhat.com>,
 Klaus Jensen <k.jensen@samsung.com>
Subject: [PULL 10/11] hw/nvme: deprecate the use-intel-id compatibility
 parameter
Date: Fri,  3 Jun 2022 21:53:53 +0200
Message-Id: <20220603195354.705516-11-its@irrelevant.dk>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220603195354.705516-1-its@irrelevant.dk>
References: <20220603195354.705516-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.24; envelope-from=its@irrelevant.dk;
 helo=wout1-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Klaus Jensen <k.jensen@samsung.com>

Since version 5.2 commit 6eb7a071292a ("hw/block/nvme: change controller
pci id"), the emulated NVMe controller has defaulted to a non-Intel PCI
identifier.

Deprecate the compatibility parameter so we can get rid of it once and
for all.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 docs/about/deprecated.rst | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index 47a8628b5601..aa2e32020707 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -303,6 +303,14 @@ In QEMU versions 6.1, 6.2 and 7.0, the ``nvme-ns`` generates an EUI-64
 identifer that is not globally unique. If an EUI-64 identifer is required, the
 user must set it explicitly using the ``nvme-ns`` device parameter ``eui64``.
 
+``-device nvme,use-intel-id=on|off`` (since 7.1)
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+The ``nvme`` device originally used a PCI Vendor/Device Identifier combination
+from Intel that was not properly allocated. Since version 5.2, the controller
+has used a properly allocated identifier. Deprecate the ``use-intel-id``
+machine compatibility parameter.
+
 
 Block device options
 ''''''''''''''''''''
-- 
2.36.1


