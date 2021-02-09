Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B89DA314A14
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 09:16:29 +0100 (CET)
Received: from localhost ([::1]:46878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9OCC-0002sC-Me
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 03:16:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l9NVZ-0005Kb-PA; Tue, 09 Feb 2021 02:32:25 -0500
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:49875)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1l9NVO-0005g8-R1; Tue, 09 Feb 2021 02:32:25 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id B2E158D5;
 Tue,  9 Feb 2021 02:31:52 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 09 Feb 2021 02:31:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=FkAOklgvx6ECL
 z6oD59Ws+EbnvjN4zGERbX2dqXYSxw=; b=lII2GryLN/F7AewOsFH1KWRrP+dHx
 i+R1V8bzZ11Fzr8LP33FWPWRjqIILnAF1wOYE4iiKjCOdUbaqi5rENubsGSyMrkp
 2N7qcmjdc7/1q9iVaouRQ0C7xNOusI3TbTl0X5aN8gHMGDTPRSE11YQd2VJ1dDFW
 VpAkBdCHPJLExmmgtracAjA9cAI129veHRMR4VEsgN0cWKuvkJpD/bRxIJDLHEk2
 hjaW73qcH9tlT5RfcuQAnnWT/Y0tUgSQ1NqMmpneAxRHDXbNFv2VNpSkD8im869g
 HEKjdXBHMYqrVB6Pk1gqm6kqfym9/K7MVMKQnO0zzsJpZICCJQQbrV18Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=FkAOklgvx6ECLz6oD59Ws+EbnvjN4zGERbX2dqXYSxw=; b=mdQ7FkZN
 K3fCPGv3zLnQBaCUfGWpUXIASBd7uydJB8YMRwORZJTvO0sgBmzlzjpk7NXZz9LB
 OJimw3lUPFLKwETRKOyyjfOpr3ZXB5biFh48Va9tLARaSWzM/crRbZbE7MVu9Idq
 7t/5Ie7aYOPhoI7SgFzIf7ic724PsJyh1oTzv8yckxYsbKJEoSWuEBws/1v/30zv
 e0X49+Dp1Zan9mgPXHKzrrY8wgmPIAzCWFamMmfnlXLOByTDhLRfjIQETvdgMMCA
 afvMhMyQ2ILoJEGHcTMt2il0uCxqcz0VSJ8IfDsRzxttryfvVMrLj4NFtSubOw+o
 7VytLbamPYz58Q==
X-ME-Sender: <xms:aDoiYEMg_ao_MHQ4eP52UQcCcNlaW9fEZG2d2u_YjSSekxbn8rtK9w>
 <xme:aDoiYK8KfVhOI3o4gKeihHO1Vkg3udOefSO2lhc75l4MAoJZuBz0JM5nuFaK_YIdS
 Ohwoq9ELL1xVS0iqnM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrheeggddutdelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpeeggeettdeufefhvefgudehjeevgeekkeetuefhieegveduleegfedvveegjeeg
 ueenucffohhmrghinhepnhhvmhgvgihprhgvshhsrdhorhhgnecukfhppeektddrudeije
 drleekrdduledtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhf
 rhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:aDoiYLQei5djwaPNTiGCvZVlpCxLOviOW9-t647XD4LwS6U6RuU6DQ>
 <xmx:aDoiYMs2pS4tVV-l10YaukSCggkc-HPJIvtK3VjWZepQEHfrcexB6A>
 <xmx:aDoiYMd6-hTsGlYyu-X-d3PRMVnQ7OorKRpX9kdOnvWdh3hME_W1NA>
 <xmx:aDoiYE6gcTOhDgtZtYuNVjDGhxUT25elVAjrttclltlOysmwRGUJiYhe5Mc>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id C21521080057;
 Tue,  9 Feb 2021 02:31:50 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 19/56] hw/block/nvme: Document zoned parameters in usage text
Date: Tue,  9 Feb 2021 08:30:24 +0100
Message-Id: <20210209073101.548811-20-its@irrelevant.dk>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210209073101.548811-1-its@irrelevant.dk>
References: <20210209073101.548811-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.26; envelope-from=its@irrelevant.dk;
 helo=wnew1-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Niklas Cassel <Niklas.Cassel@wdc.com>,
 Dmitry Fomichev <dmitry.fomichev@wdc.com>, Klaus Jensen <k.jensen@samsung.com>,
 Max Reitz <mreitz@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Dmitry Fomichev <dmitry.fomichev@wdc.com>

Added brief descriptions of the new device properties that are
now available to users to configure features of Zoned Namespace
Command Set in the emulator.

This patch is for documentation only, no functionality change.

Signed-off-by: Dmitry Fomichev <dmitry.fomichev@wdc.com>
Reviewed-by: Niklas Cassel <Niklas.Cassel@wdc.com>
Reviewed-by: Keith Busch <kbusch@kernel.org>
Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.c | 43 ++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 38 insertions(+), 5 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 4bcc7660736b..f4f1487afeb1 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -9,7 +9,7 @@
  */
 
 /**
- * Reference Specs: http://www.nvmexpress.org, 1.2, 1.1, 1.0e
+ * Reference Specs: http://www.nvmexpress.org, 1.4, 1.3, 1.2, 1.1, 1.0e
  *
  *  https://nvmexpress.org/developers/nvme-specification/
  */
@@ -22,8 +22,9 @@
  *              [pmrdev=<mem_backend_file_id>,] \
  *              max_ioqpairs=<N[optional]>, \
  *              aerl=<N[optional]>, aer_max_queued=<N[optional]>, \
- *              mdts=<N[optional]>
- *      -device nvme-ns,drive=<drive_id>,bus=bus_name,nsid=<nsid>
+ *              mdts=<N[optional]>,zoned.append_size_limit=<N[optional]> \
+ *      -device nvme-ns,drive=<drive_id>,bus=<bus_name>,nsid=<nsid>,\
+ *              zoned=<true|false[optional]>
  *
  * Note cmb_size_mb denotes size of CMB in MB. CMB is assumed to be at
  * offset 0 in BAR2 and supports only WDS, RDS and SQS for now.
@@ -41,14 +42,46 @@
  * ~~~~~~~~~~~~~~~~~~~~~~
  * - `aerl`
  *   The Asynchronous Event Request Limit (AERL). Indicates the maximum number
- *   of concurrently outstanding Asynchronous Event Request commands suppoert
+ *   of concurrently outstanding Asynchronous Event Request commands support
  *   by the controller. This is a 0's based value.
  *
  * - `aer_max_queued`
  *   This is the maximum number of events that the device will enqueue for
- *   completion when there are no oustanding AERs. When the maximum number of
+ *   completion when there are no outstanding AERs. When the maximum number of
  *   enqueued events are reached, subsequent events will be dropped.
  *
+ * - `zoned.append_size_limit`
+ *   The maximum I/O size in bytes that is allowed in Zone Append command.
+ *   The default is 128KiB. Since internally this this value is maintained as
+ *   ZASL = log2(<maximum append size> / <page size>), some values assigned
+ *   to this property may be rounded down and result in a lower maximum ZA
+ *   data size being in effect. By setting this property to 0, users can make
+ *   ZASL to be equal to MDTS. This property only affects zoned namespaces.
+ *
+ * Setting `zoned` to true selects Zoned Command Set at the namespace.
+ * In this case, the following namespace properties are available to configure
+ * zoned operation:
+ *     zoned.zone_size=<zone size in bytes, default: 128MiB>
+ *         The number may be followed by K, M, G as in kilo-, mega- or giga-.
+ *
+ *     zoned.zone_capacity=<zone capacity in bytes, default: zone size>
+ *         The value 0 (default) forces zone capacity to be the same as zone
+ *         size. The value of this property may not exceed zone size.
+ *
+ *     zoned.descr_ext_size=<zone descriptor extension size, default 0>
+ *         This value needs to be specified in 64B units. If it is zero,
+ *         namespace(s) will not support zone descriptor extensions.
+ *
+ *     zoned.max_active=<Maximum Active Resources (zones), default: 0>
+ *         The default value means there is no limit to the number of
+ *         concurrently active zones.
+ *
+ *     zoned.max_open=<Maximum Open Resources (zones), default: 0>
+ *         The default value means there is no limit to the number of
+ *         concurrently open zones.
+ *
+ *     zoned.cross_zone_read=<enable RAZB, default: false>
+ *         Setting this property to true enables Read Across Zone Boundaries.
  */
 
 #include "qemu/osdep.h"
-- 
2.30.0


