Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8761C60FFCC
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 20:03:56 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo7CQ-0007fA-0w; Thu, 27 Oct 2022 14:01:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.derrick@linux.dev>)
 id 1oo7CK-0007SI-8l
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:01:44 -0400
Received: from resqmta-c1p-023832.sys.comcast.net ([2001:558:fd00:56::9])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.derrick@linux.dev>)
 id 1oo7CI-0005sg-9C
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:01:44 -0400
Received: from resomta-c1p-023266.sys.comcast.net ([96.102.18.234])
 by resqmta-c1p-023832.sys.comcast.net with ESMTP
 id o46zoUgeepMNdo7CEo48qw; Thu, 27 Oct 2022 18:01:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=comcastmailservice.net; s=20211018a; t=1666893698;
 bh=JfRqZAlCPuw3hfDiSmU1w3rQ3kTZMScd4Z3pJ8s95No=;
 h=Received:Received:From:To:Subject:Date:Message-Id:MIME-Version:
 Xfinity-Spam-Result;
 b=d2Cw9xXAuP7Zlm2Ag5FWXiW+reHB3P3YY8D3zM4D5RLXdJMXGj9Tt8rpMpLrmgATV
 Wq6tq4NXBdYwcvD0T5EsTAO+HSuAOKTQGuGxkXJU9q9hPJyHeZdIh3Mc9YhQjECxH9
 JOEM01Sy9Vu+xZ94DGmGvP5eOKpZ2hkFgwnuEN16abv15ljoakmj1RJjNMFlHWpHFf
 zs/UjyasQeTyfzjl1USZS5FYDqt4rS4yDUQF7j1pZh6PmvisLwPIJEqbletY4V963q
 P+IxCBO5Zz+ZezBtrHodtUnq9DbpjKUQ8sLkogj934/1kDwV36CqQ1JlZxkRlgFR2T
 YmW70l4Z9NsNQ==
Received: from jderrick-mobl4.Home ([75.163.75.236])
 by resomta-c1p-023266.sys.comcast.net with ESMTPA
 id o7BQo587p62udo7BVodDBm; Thu, 27 Oct 2022 18:01:14 +0000
X-Xfinity-VAAS: gggruggvucftvghtrhhoucdtuddrgedvgedrtdeggdduudejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuvehomhgtrghsthdqtfgvshhipdfqfgfvpdfpqffurfetoffkrfenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomheplfhonhgrthhhrghnucffvghrrhhitghkuceojhhonhgrthhhrghnrdguvghrrhhitghksehlihhnuhigrdguvghvqeenucggtffrrghtthgvrhhnpedvtdejiefgueelteevudevhfdvjedvhfdtgfehjeeitdevueektdegtedttdehvdenucfkphepjeehrdduieefrdejhedrvdefieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhephhgvlhhopehjuggvrhhrihgtkhdqmhhosghlgedrjfhomhgvpdhinhgvthepjeehrdduieefrdejhedrvdefiedpmhgrihhlfhhrohhmpehjohhnrghthhgrnhdruggvrhhrihgtkheslhhinhhugidruggvvhdpnhgspghrtghpthhtohepkedprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgpdhrtghpthhtohepjhhonhgrthhhrghnrdguvghrrhhitghksehlihhnuhigrdguvghvpdhrtghpthhtohepmhhitghhrggvlhdrkhhrohhprggtiigvkhesshholhhiughighhmrdgtohhmpdhrtghpthhtohepqhgvmhhuqdgslhhotghksehnohhnghhnuhdrohhrghdprhgtphhtthhopehksghushgthheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepihhtshesihhrrhgvlhgvvhgrnhhtrdgukhdprhgtphhtthhopehkfiholhhfsehrvgguhhgrthdrtghomhdprhgtphhtthhopehhrhgvihhtiiesrhgvughhrghtrdgtohhm
X-Xfinity-VMeta: sc=-100.00;st=legit
From: Jonathan Derrick <jonathan.derrick@linux.dev>
To: qemu-devel@nongnu.org
Cc: Jonathan Derrick <jonathan.derrick@linux.dev>,
 Michael Kropaczek <michael.kropaczek@solidigm.com>, qemu-block@nongnu.org,
 Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>
Subject: [PATCH v3 0/2] hw/nvme: Support for Namespaces Management from guest
 OS
Date: Thu, 27 Oct 2022 13:00:44 -0500
Message-Id: <20221027180046.250-1-jonathan.derrick@linux.dev>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: softfail client-ip=2001:558:fd00:56::9;
 envelope-from=jonathan.derrick@linux.dev;
 helo=resqmta-c1p-023832.sys.comcast.net
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, SPF_HELO_PASS=-0.001, SPF_SOFTFAIL=0.665,
 TVD_PH_BODY_ACCOUNTS_PRE=0.001 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Michael Kropaczek <michael.kropaczek@solidigm.com>

Description:

Currently namespaces could be configured as follows:
1. Legacy Namespace - just one namespace within Nvme controller's
   where the back-end was specified for nvme device by -drive parameter
   pointing directly to the image file.
2. Additional Namespaces - specified by nvme-ns devices each having its
   own back-end. To have multiple namespaces each needed to be specified
   at Qemu's command line being associated with the most recently defined
   nvme-bus from nvme device.
   If a such additional namespace should be attached and/or detached by the
   guest OS, nvme controller has to be linked with another device nvme-subsys.

All that have a static nature, all need to be specified at the Qemu's 
command line, all specified virtual nvme entities will be processed during
Qemu's start-up then created and provided to the guest OS.

To have a support for nvme create-ns and delete-ns commands with specified
parameters a different approach is needed.
Virtual devices representing namespaces need to be created and/or deleted 
during Qemu's running session, at anytime. The back-end image sizes for a
namespace must accommodate the payload size and size of metadata resulted
from specified parameters. The total capacity of the nvme controller
altogether with un-allocated capacity needs to be taken into account and
updated according to nvme create-ns and delete-ns commands respectively.

Here is the approach:
The nvme device will get new parameter:
 - auto-ns-path, which specifies the path to the storage area where back-end
   image and necessary config files located stored.

The virtual devices representing namespaces will be created dynamically during
the Qemu running session following issuance of nvme create-ns and delete-ns
commands from the guest OS. QOM classes and instances will be created utilizing
existing configuration scheme used during Qemu's start-up. Back-end image files
will be neither created nor deleted during Qemu's startup or running session.
Instead a set of back-end image files and relevant config will be created by
qemu-img tool with createns sub-command prior to Qemu's session.
Required parameters are: -S serial number which must match serial parameter of
qemu-system-xx -device nvme command line specification, -C total capacity, and
optional -N that will set a maximal limit on number of allowed
namespaces (default 256) which will be followed by path name pointing to
storage location corresponding to auto-ns-path of qemu-system-xx -device nvme
parameter.

Those created back-end image files will be pre-loaded during Qemu's start-up
and then during running Qemu's session will be associated or disassociated with
QOM namespaces virtual instances, as a result of issuing nvme create-ns or
delete-ns commands. The associated back-end image file for relevant namespace
will be re-sized as follows: delete-ns command will truncate image file to the
size of 0, whereas create-ns command will re-size the image file to the size
provided by nvme create-ns command parameters. Truncating/re-sizing is a result
of blk_truncate() API which utilizes co-routines and should not block Qemu main
thread while scheduling AIO operations. It is assured that all settings will
retain over Qemu's start-ups and shutdowns. The implementation makes it
possible to combine the existing "Additional Namespace" implementation with the
new "Managed Namespaces". Those will coexist with obvious restrictions, like
both will share the same NsIds space, "static" namespaces cannot be deleted or
if its NsId specified at Qemu's command line will conflicts with previously
created one by nvme create-ns (and retained), this will lead to an abort of
Qemu at its start up.

Michael Kropaczek (2):
  hw/nvme: Support for Namespaces Management from guest OS - create-ns
  hw/nvme: Support for Namespaces Management from guest OS - delete-ns

 docs/system/devices/nvme.rst |  56 ++++++-
 hw/nvme/cfg_key_checker.c    |  51 ++++++
 hw/nvme/ctrl-cfg.c           | 181 ++++++++++++++++++++
 hw/nvme/ctrl.c               | 282 +++++++++++++++++++++++++++++++-
 hw/nvme/meson.build          |   2 +-
 hw/nvme/ns-backend.c         | 239 +++++++++++++++++++++++++++
 hw/nvme/ns.c                 | 308 +++++++++++++++++++++++++++++++----
 hw/nvme/nvme.h               |  33 +++-
 hw/nvme/trace-events         |   3 +
 include/block/nvme.h         |  31 ++++
 include/hw/nvme/ctrl-cfg.h   |  24 +++
 include/hw/nvme/ns-cfg.h     |  28 ++++
 include/hw/nvme/nvme-cfg.h   | 201 +++++++++++++++++++++++
 qemu-img-cmds.hx             |   6 +
 qemu-img.c                   | 134 +++++++++++++++
 15 files changed, 1542 insertions(+), 37 deletions(-)
 create mode 100644 hw/nvme/cfg_key_checker.c
 create mode 100644 hw/nvme/ctrl-cfg.c
 create mode 100644 hw/nvme/ns-backend.c
 create mode 100644 include/hw/nvme/ctrl-cfg.h
 create mode 100644 include/hw/nvme/ns-cfg.h
 create mode 100644 include/hw/nvme/nvme-cfg.h

-- 
2.37.3


