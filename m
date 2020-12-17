Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C0552DDA8F
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 22:08:14 +0100 (CET)
Received: from localhost ([::1]:55454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kq0VR-0003ZZ-4M
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 16:08:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kq0Py-000252-CE; Thu, 17 Dec 2020 16:02:34 -0500
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:45433)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1kq0Pv-0002C0-HC; Thu, 17 Dec 2020 16:02:34 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 8A8D16A3;
 Thu, 17 Dec 2020 16:02:26 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 17 Dec 2020 16:02:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=from:to:cc:subject:date:message-id:content-type:mime-version
 :content-transfer-encoding; s=fm1; bh=Ipn7va8QVQG4eoQiemms2FxBhT
 5Y2tr/J7EjvC7vqI4=; b=EUpBt9hpb7vpMVNjWi5bnuxnH5CY28TZYV7ZZKti1g
 BHIwvZ/Q7aaY48dLlN7VV3Wt+q0kr8DN+Oog07Mg2E8F25vwwVMRDb1oedYaqVW2
 HIF/PVb31dAPxO5OPN+mfYU5DUR52xIMQwJCyrURRtFY3bmSu2wjTeY4HFPj4QCk
 rThHWMiJlAoifxuKtVa22mrPkcVrEa2zHS5UpVvgZpq0o6fler4hLHvuTB0xzGUW
 8SdpYJh9U5eE2v641pCaw5GGHnU3VKqKpXeWGlYV/sGkIFTTUKcRzKXZy9XtpuR/
 AZG2tfeg6i9EjbxqkgWFv3zdF+wwBSDekbcCEbFzaxag==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=Ipn7va
 8QVQG4eoQiemms2FxBhT5Y2tr/J7EjvC7vqI4=; b=NqbaiNnU3wqAuVVmOsbTNX
 WHJPC02lQpqJlYaUnnR2sh+26cXVVQhFUNvoMU3foFZZ0Xg5TIhtKtA2KXcxAbVg
 to/q0J6jU2A90J/tYIcTCZ2V0BfeumWpGsmtbQVx9usF1rZhbm6886PKYciSOfWQ
 ghKw/ZngzS81C4GJN+gcQPKWkLFAqkaDpSnIXGWaMtJgx0Vr/1H+v4a5vclKi8ma
 +EJbyCiZ2hQY9D81C1bO034+pKHNsQ+fP7mGQ3v34NQQf6QsRQiyRXyZhyMowQ8O
 B83r+AJZczyKxyzdwAhcaHxvFrK2WO2on10kwYauIpfWnDEkmZm3OQFda+ZqDpRg
 ==
X-ME-Sender: <xms:YMfbX8R84lR6EvYL54KIDwJ5L0Kb1iV_NE3UPuI5peCXMakO3TZb6w>
 <xme:YMfbX5xTLeWt5yX6TxXr8Zr1go98fk6tc5qHwgzoZiw5WxRQaYKDcxq4lvg8pKJqN
 JEsEfY_3Vtb68x_mDQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudelgedgudegudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvffufffkofgtggfgsehtqhertdertdejnecuhfhrohhmpefmlhgruhhs
 ucflvghnshgvnhcuoehithhssehirhhrvghlvghvrghnthdrughkqeenucggtffrrghtth
 gvrhhnpefhgeevkeeigfekvedvteejjeekkedugfdvheeijeffgfekffdvveelffetvdeg
 hfenucfkphepkedtrdduieejrdelkedrudeltdenucevlhhushhtvghrufhiiigvpedtne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:YMfbX50Zm6BMo9l-tl2JjfQIxS4K8wLQ9BkT0IzuNMxVwZmoXVRF9Q>
 <xmx:YMfbXwBirMIp0Je5Iea72ioKbgwNQqRUMzT4K4xmDbn1QYwZyVUnlA>
 <xmx:YMfbX1h-tVfOA0ZsMjExK29BWfXcpnWeQ9w90MI48sf49yZ7PmpgJA>
 <xmx:YsfbXwWbuAa2CDrjiFIaQvu-U5aZ6nfF0H13RBPtVTrDQbFDQ4UQtg>
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by mail.messagingengine.com (Postfix) with ESMTPA id 8601B24005E;
 Thu, 17 Dec 2020 16:02:23 -0500 (EST)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC 0/3] hw/block/nvme: dif-based end-to-end data protection
 support
Date: Thu, 17 Dec 2020 22:02:19 +0100
Message-Id: <20201217210222.779619-1-its@irrelevant.dk>
X-Mailer: git-send-email 2.29.2
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=64.147.123.21; envelope-from=its@irrelevant.dk;
 helo=wout5-smtp.messagingengine.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Max Reitz <mreitz@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>=0D

This series adds support for extended LBAs and end-to-end data=0D
protection. Marked RFC, since there are a bunch of issues that could use=0D
some discussion.=0D
=0D
Storing metadata bytes contiguously with the logical block data and=0D
creating a physically extended logical block basically breaks the DULBE=0D
and deallocation support I just added. Formatting a namespace with=0D
protection information requires the app- and reftags of deallocated or=0D
unwritten blocks to be 0xffff and 0xffffffff respectively; this could be=0D
used to reintroduce DULBE support in that case, albeit at a somewhat=0D
higher cost than the block status flag-based approach.=0D
=0D
There is basically three ways of storing metadata (and maybe a forth,=0D
but that is probably quite the endeavour):=0D
=0D
  1. Storing metadata as extended blocks directly on the blockdev. That=0D
     is the approach used in this RFC.=0D
=0D
  2. Use a separate blockdev. Incidentially, this is also the easiest=0D
     and most straightforward solution to support MPTR-based "separate=0D
     metadata". This also allows DULBE and block deallocation to be=0D
     supported using the existing approach.=0D
=0D
  3. A hybrid of 1 and 2 where the metadata is stored contiguously at=0D
    the end of the nvme-ns blockdev.=0D
=0D
Option 1 obviously works well with DIF-based protection information and=0D
extended LBAs since it maps one to one. Option 2 works flawlessly with=0D
MPTR-based metadata, but extended LBAs can be "emulated" at the cost of=0D
a bunch of scatter/gather operations.=0D
=0D
The 4th option is extending an existing image format (QCOW2) or create=0D
something on top of RAW to supports metadata bytes per block. But both=0D
approaches require full API support through the block layer. And=0D
probably a lot of other stuff that I did not think about.=0D
=0D
Anyway, we would love some comments on this.=0D
=0D
Gollu Appalanaidu (2):=0D
  nvme: add support for extended LBAs=0D
  hw/block/nvme: end-to-end data protection=0D
=0D
Klaus Jensen (1):=0D
  hw/block/nvme: refactor nvme_dma=0D
=0D
 hw/block/nvme-ns.h    |  22 +-=0D
 hw/block/nvme.h       |  36 +++=0D
 include/block/nvme.h  |  24 +-=0D
 hw/block/nvme-ns.c    |  66 ++++-=0D
 hw/block/nvme.c       | 616 ++++++++++++++++++++++++++++++++++++++----=0D
 hw/block/trace-events |  10 +=0D
 6 files changed, 704 insertions(+), 70 deletions(-)=0D
=0D
-- =0D
2.29.2=0D
=0D

