Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D18416D02
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 09:44:12 +0200 (CEST)
Received: from localhost ([::1]:40128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTfsR-0007r1-GS
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 03:44:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mTfcd-0003AA-RC; Fri, 24 Sep 2021 03:27:51 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:48289)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1mTfcZ-0002nz-1I; Fri, 24 Sep 2021 03:27:51 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 7D0F15C01F6;
 Fri, 24 Sep 2021 03:27:45 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Fri, 24 Sep 2021 03:27:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:content-type:mime-version
 :content-transfer-encoding; s=fm1; bh=F3fE/DNyu97SsBqpZ8zdbg9aPy
 3Nw2T+DxDRqBV2Bzc=; b=htmS62kYOE/AdcuTMXeqXysAKF1In0rfW8NVFxNTOM
 UdpJFmbJhncKlm3kwJfqXEWSrvfXvVOb85H6zpvog9WgLMf5xPqpQebHzuLypYpn
 jMBh8ALdIOkUHj/69I1T0jDkvzYOK1+wlOqyCGP9ekxxY3GodD/CUWdmpqGnjaSR
 /O14Dc+Q4Q1RVDZkrbbU6mEHbUjsfnF0wAGsPRTdBtSObVxnisl4I2lCtQP+rE4k
 exK5kOipP32VQxeE6DqHSJ8JyRzoZlTwbxhWU0VnmncF+lRPUbD7XfSdXqv+mldp
 Eqq4RrzBOZevKvfHVDUQ92yBMxWztTeUh738VFHCZpIg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=F3fE/D
 Nyu97SsBqpZ8zdbg9aPy3Nw2T+DxDRqBV2Bzc=; b=pirkKkeuGIGbrC6DTh2HQu
 FWLcBnTW96E7wK7Kj44wF+MMcR+ilKob89wgOBdjqQRpn7d08gsZxJ6AGl6YokSZ
 HIu0hk/LW29jsyb0niF6aNnyxCT6jq+Ah93KBQFOYl7eQcHtAicfvX27+4nRHuW0
 wwuKAaSOGRWDlpqAvv1l9uupMHMpEiqpIVTEhW6a+igyZa3hvzNJs9Ofg+7lNOE0
 kxRk7wafrInlOgfWzLk+WK6znssXz6uefc6KJ/LqyWQvC2nCD5BUwMWhrVHeabR8
 YBCtjZWUkQi9cs0cntJgVjIlPHE55RJ/wzYJXRak5Y3l0MLb+9KexRsfMlLrxiVg
 ==
X-ME-Sender: <xms:8H1NYdF6zofjIUaX4RlRWpqyiwTNDY6AskqXtU33PqEeuGnKdxn4SQ>
 <xme:8H1NYSUt5BNYPLrXALyp9uIDUYEO2UmF6KkB42ewoDZeT8arAg-mjp60nVACuau-8
 RJS1HH53b6BpJ_YvuM>
X-ME-Received: <xmr:8H1NYfLOMiSPmvShbHMOYISsnnLQXTxft4jTUSXLV-T8mAD85PrIOAfooVW1sZV-hptoBH5QsvLsdH7GI9gHqJy5DPqY7FCKMTT3hDqNYg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudejtddguddujecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgtggfgsehtqhertdertdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpefhgeevkeeigfekvedvteejjeekkedugfdvheeijeffgfekffdvveelffetvdeg
 hfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehith
 hssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:8H1NYTH1ivcTSNgKhjFeYfz-x1A_I-UyDgHSy3ZePBKEzjMo9E83Cg>
 <xmx:8H1NYTUw5AHd6oiExbmjCB1E6_BjhUT_ab_Y_-3MTKulxbx4ZBLVTw>
 <xmx:8H1NYePAOrkPtk2ACnSuZ4kqiEPWT49wKmMsgMuJt74F5dFSxctXnA>
 <xmx:8X1NYVI2hMo9nDWmWpZglhoVKy8eCq4tF9nxGmFm1yqoPXR2KnSjJw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 24 Sep 2021 03:27:43 -0400 (EDT)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] hw/nvme: fix namespace attachment on controller hotplug
Date: Fri, 24 Sep 2021 09:27:40 +0200
Message-Id: <20210924072742.306473-1-its@irrelevant.dk>
X-Mailer: git-send-email 2.33.0
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=66.111.4.27; envelope-from=its@irrelevant.dk;
 helo=out3-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, Keith Busch <kbusch@kernel.org>,
 Hannes Reinecke <hare@suse.de>, Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>=0D

First patch from Hannes fixes the subsystem registration process such=0D
that shared (but non-detached) namespaces are automatically attached to=0D
hotplugged controllers.=0D
=0D
The second patch changes the default for 'shared' such that namespaces=0D
are shared by default and will thus by default be attached to hotplugged=0D
controllers. This adds a compat property for older machine versions and=0D
updates the documentation to reflect this.=0D
=0D
Hannes Reinecke (1):=0D
  hw/nvme: reattach subsystem namespaces on hotplug=0D
=0D
Klaus Jensen (1):=0D
  hw/nvme: change nvme-ns 'shared' default=0D
=0D
 docs/system/devices/nvme.rst | 24 ++++++++++++++----------=0D
 hw/core/machine.c            |  4 +++-=0D
 hw/nvme/ns.c                 |  8 +-------=0D
 hw/nvme/subsys.c             | 10 +++++++++-=0D
 4 files changed, 27 insertions(+), 19 deletions(-)=0D
=0D
-- =0D
2.33.0=0D
=0D

