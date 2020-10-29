Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0259729E774
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Oct 2020 10:35:47 +0100 (CET)
Received: from localhost ([::1]:53738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kY4LR-00074O-HA
	for lists+qemu-devel@lfdr.de; Thu, 29 Oct 2020 05:35:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kY4J3-0005Wf-LE
 for qemu-devel@nongnu.org; Thu, 29 Oct 2020 05:33:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35312)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kY4J0-0006JB-MN
 for qemu-devel@nongnu.org; Thu, 29 Oct 2020 05:33:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603963993;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=tCDSHB17lPz5sYX0KNrveY3UW9EMK+LXYAbuoRs4SOo=;
 b=MFnPE342L/fwNjGhOQwublEiB6ycYHT9Z8/zMQf27IJwyZTereXY82zPJ9Y2IFS6dq0BUD
 yN1F2qsUPiJUCKrQgaWU9EXH8Mcd4H/kHqyF51sKCYYN+FPK9qWpucIEVqOo04Odn0at9o
 sgqVc+xCmTmz6JC11Bpex6+aZknIYWI=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-141-0qWAZsQEMIuAxFAlnlQ5EA-1; Thu, 29 Oct 2020 05:33:11 -0400
X-MC-Unique: 0qWAZsQEMIuAxFAlnlQ5EA-1
Received: by mail-ed1-f69.google.com with SMTP id dn20so938274edb.14
 for <qemu-devel@nongnu.org>; Thu, 29 Oct 2020 02:33:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RtZehlgqGDhf61IIYJPAvL+XtEgpPW7xS4gotJB+tsQ=;
 b=LhlHamfQtfmf4IYvGVRreRmKc55AjpQCJkxxpG1+p6jqNq6NeFhRmHmUWiJowEAIUL
 IDoDpMJY2/H1GjUwceboDL2WOwEQ0BMbUFBdt79eH6CxBcdUsDnAnzreTarrOJrUslN3
 xF/fbn5jxUSydEFd7Wo/Avakl8ATmewBcXaGdq6EkKvaw5O09T4EkUXj/LkgDdbIRCBa
 zkfZoqn+gLqWolaFvFSIu/SxjLeM5XWsaJtMG+ENFGYu+FSIsF2co6t0dJCqj/+z7s2M
 kDv5tIW5wx/EzR9YHtjutBPvd4BGuWAP8dYqoKAECue6+FTOkLJtCTV4B3Prz6JF/1e+
 5ggQ==
X-Gm-Message-State: AOAM5314dtrmMjWj9EiWd09rJqJQd5KlxzMx5i/ApQb1EUJXLOGqrbSb
 LB1UlceiKerW0XGvz/35ZkVARpif3Ro8iPYxL02QtcohdPrbe8knBva2boww3qxFwrTnbng9ir9
 qYNxsSWdSTBzUgjM=
X-Received: by 2002:a17:906:e292:: with SMTP id
 gg18mr3150450ejb.278.1603963989947; 
 Thu, 29 Oct 2020 02:33:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzmnF+JfAcCPGoEsu5J7RhLGEdrVNR5cQy635MVNHflf2LAqQjuV8oPWM4QzoSJgEukikSCqw==
X-Received: by 2002:a17:906:e292:: with SMTP id
 gg18mr3150423ejb.278.1603963989680; 
 Thu, 29 Oct 2020 02:33:09 -0700 (PDT)
Received: from x1w.redhat.com (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id w16sm1133626eds.81.2020.10.29.02.33.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Oct 2020 02:33:08 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-5.2 v2 00/25] block/nvme: Fix Aarch64 or big-endian hosts
Date: Thu, 29 Oct 2020 10:32:41 +0100
Message-Id: <20201029093306.1063879-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/29 00:47:54
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Eric Auger <eric.auger@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a bit of tracing, clean around to finally fix few bugs.=0D
In particular, restore NVMe on Aarch64 host.=0D
=0D
Since v1:=0D
- addressed Stefan and Eric review comments=0D
- dropped unnecessary patches=0D
- added BE fix reported by Keith=0D
=0D
Patches missing review: #10, #24, #25=0D
=0D
Supersedes: <20201027135547.374946-1-philmd@redhat.com>=0D
=0D
Eric Auger (4):=0D
  block/nvme: Change size and alignment of IDENTIFY response buffer=0D
  block/nvme: Change size and alignment of queue=0D
  block/nvme: Change size and alignment of prp_list_pages=0D
  block/nvme: Align iov's va and size on host page size=0D
=0D
Philippe Mathieu-Daud=C3=A9 (21):=0D
  MAINTAINERS: Cover 'block/nvme.h' file=0D
  block/nvme: Use hex format to display offset in trace events=0D
  block/nvme: Report warning with warn_report()=0D
  block/nvme: Trace controller capabilities=0D
  block/nvme: Trace nvme_poll_queue() per queue=0D
  block/nvme: Improve nvme_free_req_queue_wait() trace information=0D
  block/nvme: Trace queue pair creation/deletion=0D
  block/nvme: Move definitions before structure declarations=0D
  block/nvme: Use unsigned integer for queue counter/size=0D
  block/nvme: Make nvme_identify() return boolean indicating error=0D
  block/nvme: Make nvme_init_queue() return boolean indicating error=0D
  block/nvme: Introduce Completion Queue definitions=0D
  block/nvme: Use definitions instead of magic values in add_io_queue()=0D
  block/nvme: Correctly initialize Admin Queue Attributes=0D
  block/nvme: Simplify ADMIN queue access=0D
  block/nvme: Simplify nvme_cmd_sync()=0D
  block/nvme: Set request_alignment at initialization=0D
  block/nvme: Correct minimum device page size=0D
  block/nvme: Fix use of write-only doorbells page on Aarch64 arch=0D
  block/nvme: Fix nvme_submit_command() on big-endian host=0D
  block/nvme: Simplify Completion Queue Command Identifier field use=0D
=0D
 include/block/nvme.h |  18 ++--=0D
 block/nvme.c         | 213 ++++++++++++++++++++++++-------------------=0D
 MAINTAINERS          |   2 +=0D
 block/trace-events   |  30 +++---=0D
 4 files changed, 150 insertions(+), 113 deletions(-)=0D
=0D
--=20=0D
2.26.2=0D
=0D


