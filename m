Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C0A622F83
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Nov 2022 16:58:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osnSI-0001cs-Jd; Wed, 09 Nov 2022 10:57:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mrezanin@redhat.com>)
 id 1osnS5-0001aE-07
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 10:57:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mrezanin@redhat.com>)
 id 1osnS3-0005QV-JM
 for qemu-devel@nongnu.org; Wed, 09 Nov 2022 10:57:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668009437;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=qfdJGHOwqwpSi0rIx60FF0S7p1+QrvvJ74t9z/eO2CA=;
 b=YIyfWeBzXnMZN8donKaEb2J6EEbX9sS3EpFIPQqBf4m+/oPoOyUT3ulYb2m8F+dhFAKrEQ
 nnF6l74mhySnG7VCPzuOV+nXs5ECDwgITe2H8bIO/VRzxCWErMSp5eQb8xCgBbz6+iXBBI
 3n4FQ7AcfjVYkJkUfsCoif4UQ1997Ac=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-295-ad9EaE7mM0SajQAxaFIT0w-1; Wed, 09 Nov 2022 10:57:16 -0500
X-MC-Unique: ad9EaE7mM0SajQAxaFIT0w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0C4C885A583
 for <qemu-devel@nongnu.org>; Wed,  9 Nov 2022 15:57:16 +0000 (UTC)
Received: from wi2021.rezanina.moe.rezanina.moe (ovpn-193-213.brq.redhat.com
 [10.40.193.213])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5DDC940C2087;
 Wed,  9 Nov 2022 15:57:15 +0000 (UTC)
From: mrezanin@redhat.com
To: qemu-devel@nongnu.org
Cc: Miroslav Rezanina <mrezanin@redhat.com>
Subject: [PATCH 0/4] Removal of several unused variables causing 
Date: Wed,  9 Nov 2022 10:57:10 -0500
Message-Id: <cover.1668009030.git.mrezanin@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mrezanin@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Miroslav Rezanina <mrezanin@redhat.com>

When trying to run qemu build using clang 15.0.1 compiler with
--enable-werror option, several 'Unused but set variable' warnings
was breaking the build.

These variables show similar pattern - they are only incremented but
final value of the variable is never used. 

Removing this variables to enable using --enable-werror option
with Clang 15.0.1.

Miroslav Rezanina (4):
  rtl8139: Remove unused variable
  tulip: Remove unused variable
  qemu-img: remove unused variable
  host-libusb: Remove unused variable

 hw/net/rtl8139.c     |  2 --
 hw/net/tulip.c       |  4 +---
 hw/usb/host-libusb.c | 15 ---------------
 qemu-img.c           |  4 ++--
 4 files changed, 3 insertions(+), 22 deletions(-)

-- 
2.31.1


