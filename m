Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C56E6577E03
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 10:54:52 +0200 (CEST)
Received: from localhost ([::1]:45066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDMWh-00016g-8g
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 04:54:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1oDMUX-0005BJ-MF
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 04:52:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43625)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1oDMUU-0002SL-Nr
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 04:52:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658134353;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=yIzAzZrLe1nOAtkVDdhqx7+fwNuHSLufBn2+L6rkNhM=;
 b=RarbcRraV/berJirTswQCxfseCB9/HjjI5xoScucUQWuy6D2+Sa4wc47aHMAZFm64LUK4Q
 9VmMr34mbGQdOOW3QbmVv2MuQSIKsBINpCPX82pWBe+ppaFStoOCqF2+4di5I2chZPNFY+
 BMUO7dLBvjSLt/l5i5fgS0xaGPkmBXw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-488-UoxsBv1xPmyKCqycC0Ac_g-1; Mon, 18 Jul 2022 04:52:31 -0400
X-MC-Unique: UoxsBv1xPmyKCqycC0Ac_g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0A8221C0519F
 for <qemu-devel@nongnu.org>; Mon, 18 Jul 2022 08:52:31 +0000 (UTC)
Received: from kostyanf14nb.redhat.com (unknown [10.40.194.71])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7DBF22166B29
 for <qemu-devel@nongnu.org>; Mon, 18 Jul 2022 08:52:30 +0000 (UTC)
From: Konstantin Kostiuk <kkostiuk@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/1] MAINTAINERS: Add myself as Guest Agent co-maintainer
Date: Mon, 18 Jul 2022 11:52:27 +0300
Message-Id: <20220718085228.2355769-1-kkostiuk@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kkostiuk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

v1 -> v2: Rebase to current master
v1: https://patchew.org/QEMU/20220713133249.2229623-1-kkostiuk@redhat.com/

Konstantin Kostiuk (1):
  MAINTAINERS: Add myself as Guest Agent co-maintainer

 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--
2.25.1


