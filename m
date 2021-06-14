Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D18F3A65F4
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 13:46:42 +0200 (CEST)
Received: from localhost ([::1]:50842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsl3B-0005aX-1w
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 07:46:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bernat@luffy.cx>) id 1lsl0o-0004ht-Rr
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 07:44:15 -0400
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:40635)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bernat@luffy.cx>) id 1lsl0m-0006cJ-0g
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 07:44:14 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id F2EBC5C009E;
 Mon, 14 Jun 2021 07:44:08 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Mon, 14 Jun 2021 07:44:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bernat.ch; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm3; bh=pr6bcUvayBuXvPOKpo/5MnHGwZ
 UgCykb9KuH9H45yuM=; b=Rl/4XJQR92TGbOtpKOZyaL3x4ZDg0+efx9nHKHys95
 f9cTeexdjhps2VROBiu7pDfaVAriF9zPd7qBcqETz7mcf3YNkR4MLpa2aD0iwa8P
 QSwEcWMTATuvh0qOiLk6Ur3SbIhrGnCZFyQX1qeIyVSJYztv7LC3EWfGOVrRm7Bd
 9SOyvyX2sovU12h8ag3siWEVnO7oqqTjB5eZEClo5BWc9dG8iA8n7YBEhphTBUi2
 ePHqU98N1N41kaGjRVUQNunYfp1tZ2xJ4u+sBAc4FL9VB2tFgSuLyaTM3naLkGUd
 Hlbk+G4QTIAWIgM4gbOnep+VQLGqHK8qFTYRABwzQx+Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=pr6bcUvayBuXvPOKp
 o/5MnHGwZUgCykb9KuH9H45yuM=; b=iWMExQ8eJdeVr/gfAVvnN73e/gdojN+0v
 c8GZc9arK3hJL9KoYr0f5TncXpHlU455zFz+XWgEKwsEq2GSdYLXne6nQI/GNO2C
 YS5CBACccQ5aoD5Q7AOhdi+13kNx4hcaVPo98p0TvP5NEV46dd6eIWy/tGTA6J0L
 p4Ch3urAoM8soORLQONbbpQnQGQ/3czAaqdeQsb14kfZGk7zyOtu0xfbjINoHpe9
 fdykRGMmklITGKXhVNJGrS7n9qPyGaJro2HlK7QONIdeJjQNqCpgCP5BxBvaYCF9
 7Hr55hUkH076fME3X2N8Dk4rUOI9sFSA5lTUbDah8aRjIZpuVcYIg==
X-ME-Sender: <xms:CEHHYPkqrlT-sCX1iVYMSfhll6PnvtGFHG8G8P2OXcH20gdz8Uu3cA>
 <xme:CEHHYC0eRly0CSMMcwbJM-78VDtoOW8cou3sOaZyjIRRdNspAO1GQitbNaFbNiwKV
 m2y6DGaMoZCTl85t48>
X-ME-Received: <xmr:CEHHYFqf0xcSvENF1IOHqmmrtxVSB8kI5IxQduZg_pKm7Jx5_oCrkKAcGNnPYo5hEF3a_NI5Kg39i4cN-Krt3JDclG6UbO2iD__ohCsqkta2EA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedvhedggedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeggihhntggvnhht
 uceuvghrnhgrthcuoehvihhntggvnhhtsegsvghrnhgrthdrtghhqeenucggtffrrghtth
 gvrhhnpedvieffteeukedtleevfffhvdefgfdtffehtddukeetveffgfevtdefheevffeh
 gfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsvg
 hrnhgrtheslhhufhhfhidrtgig
X-ME-Proxy: <xmx:CEHHYHkhIX6fWAPhfP8zZvc6ZPEZKVrbw7ao4q3QfO9OzRi0lAONbA>
 <xmx:CEHHYN26_X15-UfpiXnpTYAalEGpLGKSeNr63Mx5a3ypzSTH1MT8MA>
 <xmx:CEHHYGu6jQWo0zmzaGIlhvX5IDGeQPhMcQvCFFbDpPontadYGRN8Rg>
 <xmx:CEHHYLBmgNauVmQ7VCuZxdjsyK05wU2IiKjWMLW4zP-ORDb9tWtXQw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 14 Jun 2021 07:44:08 -0400 (EDT)
Received: by neo.luffy.cx (Postfix, from userid 500)
 id EC640CBF; Mon, 14 Jun 2021 13:44:05 +0200 (CEST)
From: Vincent Bernat <vincent@bernat.ch>
To: "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-devel@nongnu.org
Subject: [PATCH v1] docs: add slot when adding new PCIe root port
Date: Mon, 14 Jun 2021 13:43:57 +0200
Message-Id: <20210614114357.1146725-1-vincent@bernat.ch>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.29; envelope-from=bernat@luffy.cx;
 helo=out5-smtp.messagingengine.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Vincent Bernat <vincent@bernat.ch>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Without providing a specific slot, QEMU won't be able to create the
second additional PCIe root port with the following error:

    $ qemu-system-x86_64 [...] -machine q35 \
    >    -device pcie-root-port,bus=pcie.0,id=rp1 \
    >    -device pcie-root-port,bus=pcie.0,id=rp2
    qemu-system-x86_64: -device pcie-root-port,bus=pcie.0,id=rp2:
    Can't add chassis slot, error -16

This is due to the fact they both try to use slot 0. Update the
documentation to specify a slot for each new PCIe root port.

Signed-off-by: Vincent Bernat <vincent@bernat.ch>
---
 docs/pcie_pci_bridge.txt | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/docs/pcie_pci_bridge.txt b/docs/pcie_pci_bridge.txt
index ab35ebf3cae5..1aa08fc5f0c0 100644
--- a/docs/pcie_pci_bridge.txt
+++ b/docs/pcie_pci_bridge.txt
@@ -70,9 +70,9 @@ A detailed command line would be:
 
 [qemu-bin + storage options] \
 -m 2G \
--device pcie-root-port,bus=pcie.0,id=rp1 \
--device pcie-root-port,bus=pcie.0,id=rp2 \
--device pcie-root-port,bus=pcie.0,id=rp3,bus-reserve=1 \
+-device pcie-root-port,bus=pcie.0,id=rp1,slot=1 \
+-device pcie-root-port,bus=pcie.0,id=rp2,slot=2 \
+-device pcie-root-port,bus=pcie.0,id=rp3,slot=3,bus-reserve=1 \
 -device pcie-pci-bridge,id=br1,bus=rp1 \
 -device pcie-pci-bridge,id=br2,bus=rp2 \
 -device e1000,bus=br1,addr=8
-- 
2.32.0


