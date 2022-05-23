Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83CE55315AC
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 21:19:45 +0200 (CEST)
Received: from localhost ([::1]:54664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntDai-0000j3-LU
	for lists+qemu-devel@lfdr.de; Mon, 23 May 2022 15:19:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1ntDYA-0007db-Q0
 for qemu-devel@nongnu.org; Mon, 23 May 2022 15:17:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34785)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1ntDXu-0007SX-Aa
 for qemu-devel@nongnu.org; Mon, 23 May 2022 15:17:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653333409;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=DKbOwgRbKXxG9UjEgo4wphTGQ6mw2Sx5z1Sf2kWR+i8=;
 b=P5gidQI586r07DlyK/5ZwT2xiLPjMKT1R7AU+8Xfw9qUeBsMbJR8edgurVNPMYfOqQ07yG
 Xd13iKtNXfpctINmrheyfHNKSJdiDjYU5GMi8rMwh1hk2ymR8KbeOmePTYk6mWp21P6+cy
 CPIApkuFCFB38vQ6MdVAD7B9Qbv7RdI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-175-_XJOScX7PSGYCtN0J86T0w-1; Mon, 23 May 2022 15:16:47 -0400
X-MC-Unique: _XJOScX7PSGYCtN0J86T0w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7F48C299E74D;
 Mon, 23 May 2022 19:16:47 +0000 (UTC)
Received: from kostyanf14nb.redhat.com (unknown [10.40.195.86])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7EAA02026D6A;
 Mon, 23 May 2022 19:16:46 +0000 (UTC)
From: Konstantin Kostiuk <kkostiuk@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Michael Roth <michael.roth@amd.com>
Subject: [PATCH v2 0/1] trivial: qga: Log version on start
Date: Mon, 23 May 2022 22:16:43 +0300
Message-Id: <20220523191644.823726-1-kkostiuk@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kkostiuk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

v1 -> v2: Use QEMU_FULL_VERSION instead of QEMU_VERSION
v1: https://patchew.org/QEMU/20220523145610.809663-1-kkostiuk@redhat.com/

Konstantin Kostiuk (1):
  trivial: qga: Log version on start

 qga/main.c | 2 ++
 1 file changed, 2 insertions(+)

--
2.25.1


