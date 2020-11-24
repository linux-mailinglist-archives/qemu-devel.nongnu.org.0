Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F00BC2C1B95
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 03:47:03 +0100 (CET)
Received: from localhost ([::1]:39380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khOMA-0001TQ-R8
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 21:47:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1khOJn-0008GM-ET
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 21:44:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23698)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1khOJl-000277-5X
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 21:44:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606185871;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type;
 bh=CMmmo38k8i6QAJIRexHoacsJeoSmTMqi08+px9HlF4Y=;
 b=h2UqFc7pTFJrJ1YusDviCf3P4VMdQL+MuMuoZ47L4ZKKH9w69wh6H8BED+lBZOeMqSF/sM
 0hgvWkAStT9tttRKm+wrn7KEuFDbaFfLdSY9W3+g+KtrZVBOjXttA9NUHAVTaxj6FGq8LU
 qnlndyTAkddCwGY8iPHa+MNuDglQsSA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-13-9An8aqryP3OZQ4E1QWFyLQ-1; Mon, 23 Nov 2020 21:44:28 -0500
X-MC-Unique: 9An8aqryP3OZQ4E1QWFyLQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BE62A521B;
 Tue, 24 Nov 2020 02:44:26 +0000 (UTC)
Received: from jason-ThinkPad-T430s.redhat.com (ovpn-13-43.pek2.redhat.com
 [10.72.13.43])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 610165D9CA;
 Tue, 24 Nov 2020 02:44:25 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 0/5] Net patches
Date: Tue, 24 Nov 2020 10:44:18 +0800
Message-Id: <1606185863-25996-1-git-send-email-jasowang@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Jason Wang <jasowang@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 23895cbd82be95428e90168b12e925d0d3ca2f06:

  Merge remote-tracking branch 'remotes/awilliam/tags/vfio-update-20201123.0' into staging (2020-11-23 18:51:13 +0000)

are available in the git repository at:

  https://github.com/jasowang/qemu.git tags/net-pull-request

for you to fetch changes up to 9925990d01a92564af55f6f69d0f5f59b47609b1:

  net: Use correct default-path macro for downscript (2020-11-24 10:40:17 +0800)

----------------------------------------------------------------

----------------------------------------------------------------
Keqian Zhu (1):
      net: Use correct default-path macro for downscript

Paolo Bonzini (1):
      net: do not exit on "netdev_add help" monitor command

Prasad J Pandit (1):
      hw/net/e1000e: advance desc_offset in case of null descriptor

Yuri Benditovich (1):
      net: purge queued rx packets on queue deletion

yuanjungong (1):
      tap: fix a memory leak

 hw/net/e1000e_core.c |  8 +++---
 include/net/net.h    |  1 +
 monitor/hmp-cmds.c   |  6 ++++
 net/net.c            | 80 +++++++++++++++++++++++++++-------------------------
 net/tap.c            |  5 +++-
 5 files changed, 57 insertions(+), 43 deletions(-)


