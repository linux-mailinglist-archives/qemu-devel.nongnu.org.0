Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 679095B9F33
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Sep 2022 17:51:10 +0200 (CEST)
Received: from localhost ([::1]:53222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYr8v-0002b4-BS
	for lists+qemu-devel@lfdr.de; Thu, 15 Sep 2022 11:51:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oYr4J-00071a-Jz
 for qemu-devel@nongnu.org; Thu, 15 Sep 2022 11:46:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54116)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oYr4G-0008Ub-Op
 for qemu-devel@nongnu.org; Thu, 15 Sep 2022 11:46:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663256779;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=l9yasc6qAltzYFVSe99xy8NvQqF9webxE+0CoKYVvds=;
 b=g6paFjuXsn3lkw4Gv0GX8u2tqndlsUhU1SHVaVj7L24+YcqrKsClkbE4LVcHdOqB4X2Hgu
 PGMoeU9wsq14acdObpqm5lkBCGtd/Xowh8epuIBo6ABV/M5UCUG21uRWjJXz5aqzxCJ/U4
 PG7cwMJ/MGob+TYPjZsDtvdA4vtLw40=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-584-ebcUPV99PF6mC2WKurPX9Q-1; Thu, 15 Sep 2022 11:46:15 -0400
X-MC-Unique: ebcUPV99PF6mC2WKurPX9Q-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 511FF101E151;
 Thu, 15 Sep 2022 15:46:15 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.33.36.164])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 56AA4492B04;
 Thu, 15 Sep 2022 15:46:14 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org,
	pizhenwei@bytedance.com,
	dongli.zhang@oracle.com
Cc: armbru@redhat.com
Subject: [PULL 0/3] hmp queue
Date: Thu, 15 Sep 2022 16:46:03 +0100
Message-Id: <20220915154606.124713-1-dgilbert@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

The following changes since commit 79dfa177ae348bb5ab5f97c0915359b13d6186e2:

  Merge tag 'pull-qapi-2022-09-07' of git://repo.or.cz/qemu/armbru into staging (2022-09-07 13:13:30 -0400)

are available in the Git repository at:

  https://gitlab.com/dagrh/qemu.git tags/pull-hmp-20220915a

for you to fetch changes up to 22269b0436cc8e4aaac975b4c8cb01b343d09661:

  hmp: Fix ordering of text (2022-09-15 14:13:30 +0100)

----------------------------------------------------------------
HMP pull 2022-09-15

A set of 3 small additions/fixes.

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

----------------------------------------------------------------
Dongli Zhang (1):
      monitor/hmp: print trace as option in help for log command

Dr. David Alan Gilbert (1):
      hmp: Fix ordering of text

Zhenwei Pi (1):
      monitor: Support specified vCPU registers

 hmp-commands-info.hx |  8 +++++---
 hmp-commands.hx      | 46 +++++++++++++++++++++++-----------------------
 monitor/hmp.c        |  9 +++++++--
 monitor/misc.c       | 10 ++++++++--
 4 files changed, 43 insertions(+), 30 deletions(-)


