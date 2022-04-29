Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 803E8514216
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 07:57:18 +0200 (CEST)
Received: from localhost ([::1]:46966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkJcy-0007oy-FF
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 01:57:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nkJOA-0005zb-UV; Fri, 29 Apr 2022 01:41:59 -0400
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:34149)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nkJO8-0004Xn-Qz; Fri, 29 Apr 2022 01:41:58 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 4F62A32009D6;
 Fri, 29 Apr 2022 01:41:53 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Fri, 29 Apr 2022 01:41:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-transfer-encoding:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1651210912; x=1651297312; bh=sff62JQWzZ
 8q/Ts/FnrS+KViBqo4Y6YJ8CX08+73P28=; b=bQxHAUpRSTTINZgdqeThNV8d1N
 JOzqpwWh3l53nijZT/R7e2jKDGr4HD6eeNV5O9fDlL+Nd+6tWvX/Co0f7IBmTRci
 h9yHsfOmSoDecSXVuYqw4gOY9xitUWVFnhX0ADnc3wlX7GAx0hsPwxp23gUmJt1K
 WPdkr6bRIRCioMt28/SXna6LJmBrwMV0IMpjCh12nFFCnfM/X3lelTI0jbZMuo42
 sr5m1+nWQLySFVVuiQ4Eg2ieFId2iD9Px5fva6S3127uVFNRR5OgdM4GeickepRk
 1XujIUilZxnSAz0S0jAjcRu3Gd16lLwBYJVC0/iyuPyedQMHslyi6GRjSzHQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:message-id:mime-version:reply-to:sender
 :subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; t=1651210912; x=1651297312; bh=s
 ff62JQWzZ8q/Ts/FnrS+KViBqo4Y6YJ8CX08+73P28=; b=uITjqTjQ0X1Ja5PQ6
 ANR1zLnlWZ31+jnaLt7dqvAlckLkjSWc/aN4fXuKwIha4fSzf/fPKLRcHRci5/Av
 9jRS/9UJmijNPEKRRzCrzrQ4PQ7zCw26CEKQBRtALgl9bBVzxlsbZBFTWneSDb5I
 FdpJc9pvA/dH2oivEkEnKEA2h3CTbM59HcueAiCfRbufn8junKQSWwF055YDtDpN
 t/0hML/S67YRFOcp9XHtEk6cEJ6lxqU7mTUs8ulqb4m0/S8/5EYRW93UQsE2Cx6w
 40kIwSQ/uvGBizLiocDmPJe7pXgSYmeDv7bdpDqeKjjHbcNrfzt9K3oV+uyxhget
 K4kLQ==
X-ME-Sender: <xms:oHprYvxItDat5blsuuw-ipvACeeq1gsKfPECXXgC8eYRXJJBBVotSA>
 <xme:oHprYnSXm1yhIXdzSdchi0rJZQ_n6RFvwpLkfBEioP05bNy8LfQ_X9pjxoPBw6MTZ
 M8fxoifbmthyGXV2bc>
X-ME-Received: <xmr:oHprYpUMomYfRgF-97OnV92o0XHLbzmfV4gvmX_9nutGPfkqH3A4tf51VkQgoyuCJArl23fy5dHuvz0Gp5li>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudekgdelgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhsucfl
 vghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtthgvrh
 hnpedtleduhfegleehleeltdejffefjedtleeuvdfgteevffegtedvveekheeiieekteen
 ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehithhsse
 hirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:oHprYpiljF7NuBkKH5hXMTas4WRtwntsE0f_R6MSoXl9f_8v07PWnQ>
 <xmx:oHprYhDWDFOhHEtBzsi5jkHAPbZSHZPlHrk7Nl-n6CEgtgLRJQYfSQ>
 <xmx:oHprYiIhcJzIFWq1xPZQSy-MHv6QMRavoo2r-vB3VS7uHeoE1eLgGQ>
 <xmx:oHprYs_n13-DFlGXCsP1yp4MDf77r17T5slYJq-oHDwYr50FIQkW-Q>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 29 Apr 2022 01:41:51 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/nvme: deprecate the use-intel-id compatibility parameter
Date: Fri, 29 Apr 2022 07:41:49 +0200
Message-Id: <20220429054149.2169473-1-its@irrelevant.dk>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
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
Cc: Klaus Jensen <its@irrelevant.dk>, libvir-list@redhat.com,
 Keith Busch <kbusch@kernel.org>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Since version 5.2 commit 6eb7a071292a ("hw/block/nvme: change controller
pci id"), the emulated NVMe controller has defaulted to a non-Intel PCI
identifier.

Deprecate the compatibility parameter so we can get rid of it once and
for all.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 docs/about/deprecated.rst | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index 896e5a97abbd..450f945ac25f 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -356,6 +356,14 @@ contains native support for this feature and thus use of the option
 ROM approach is obsolete. The native SeaBIOS support can be activated
 by using ``-machine graphics=off``.
 
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
2.35.1


