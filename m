Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEFEA1C8781
	for <lists+qemu-devel@lfdr.de>; Thu,  7 May 2020 13:04:05 +0200 (CEST)
Received: from localhost ([::1]:44836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jWeJw-0007yw-RP
	for lists+qemu-devel@lfdr.de; Thu, 07 May 2020 07:04:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1jWeH7-0004w3-BA
 for qemu-devel@nongnu.org; Thu, 07 May 2020 07:01:09 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:32821
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1jWeH3-0000IW-2N
 for qemu-devel@nongnu.org; Thu, 07 May 2020 07:01:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588849261;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=t2VHDzctGZvLsU60zVEFuMdDSc5SkIQXKrDY67fuPeU=;
 b=aJmJAdAKgTRXmsOUw4hltJWZ4PKbTsSobdy/Oz+aMLFO3pc2CLZpLeiWkrQFL7/NbSVD/8
 0zDfcENuWll3ke4rgLkO/MhYJ75iC4CHExnNO673/7MkGiOYY6+ZWkdnRnOYycvMCMkAn+
 xeEj8F/M7bPBt+BJBI0VTb43pioE5LQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-470-EUGDDg33MqOCVqCSPP6b8w-1; Thu, 07 May 2020 06:59:24 -0400
X-MC-Unique: EUGDDg33MqOCVqCSPP6b8w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AE21680183C;
 Thu,  7 May 2020 10:59:23 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.74.8.13])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5F904649A9;
 Thu,  7 May 2020 10:59:20 +0000 (UTC)
From: P J P <ppandit@redhat.com>
To: QEMU Developers <qemu-devel@nongnu.org>
Subject: [PATCH 0/2] use unsigned type for MegasasState fields
Date: Thu,  7 May 2020 16:27:16 +0530
Message-Id: <20200507105718.1319187-1-ppandit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=207.211.31.81; envelope-from=ppandit@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/07 00:55:34
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Fam Zheng <fam@euphon.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Prasad J Pandit <pjp@fedoraproject.org>, Ren Ding <rding@gatech.edu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Prasad J Pandit <pjp@fedoraproject.org>

Hello,

* This series fixes an OOB access issue which may occur when a guest user
  sets 's->reply_queue_head' field to a negative(or large positive) value,
  via 'struct mfi_init_qinfo' object in megasas_init_firmware().

* Second patch updates other numeric fields of MegasasState to unsigned typ=
e.

Thank you.
---
Prasad J Pandit (2):
  megasas: use unsigned type for reply_queue_head
  megasas: use unsigned type for positive numeric fields

 hw/scsi/megasas.c | 40 ++++++++++++++++++++--------------------
 1 file changed, 20 insertions(+), 20 deletions(-)

--=20
2.25.4


