Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 889285315C6
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 21:43:51 +0200 (CEST)
Received: from localhost ([::1]:58160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntDy2-0007ep-Bk
	for lists+qemu-devel@lfdr.de; Mon, 23 May 2022 15:43:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1ntDvZ-0004ue-Tx
 for qemu-devel@nongnu.org; Mon, 23 May 2022 15:41:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23861)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1ntDvY-0003Lb-8J
 for qemu-devel@nongnu.org; Mon, 23 May 2022 15:41:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653334875;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=+6AJPjSGYC9QgDxShViT5+LTEO3UpiUlKtaItv1wfAA=;
 b=elwqM5UEbHT4cyZGv9Wb1pJJL84N+euAIlkRbf47sNp0NotutYnLL1jCZ8EavnHEYvSyDz
 8OD61+uCQkH5yEcg9tqpIhSA7PXU1SCZAeHaWIT4GuHiC8th31ibmtorY4BGj09zoG/nAN
 hGGH6LmrjOuJlyeqzHvhkJKwVeCo+fk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-479-2MNfki4UPca31yyZP0KrxA-1; Mon, 23 May 2022 15:41:14 -0400
X-MC-Unique: 2MNfki4UPca31yyZP0KrxA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E4F9585A5BB;
 Mon, 23 May 2022 19:41:13 +0000 (UTC)
Received: from kostyanf14nb.redhat.com (unknown [10.40.195.86])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0A7D42026D6A;
 Mon, 23 May 2022 19:41:12 +0000 (UTC)
From: Konstantin Kostiuk <kkostiuk@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 0/3] qemu-ga patches
Date: Mon, 23 May 2022 22:41:08 +0300
Message-Id: <20220523194111.827805-1-kkostiuk@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kkostiuk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

The following changes since commit 3757b0d08b399c609954cf57f273b1167e5d7a8d:

  Merge tag 'pull-request-2022-05-18' of https://gitlab.com/thuth/qemu into staging (2022-05-20 08:04:30 -0700)

are available in the Git repository at:

  git@github.com:kostyanf14/qemu.git tags/qga-win32-pull-2022-05-23

for you to fetch changes up to cb69e5d06bb8ba4929f277daa87160bf2f54c51e:

  trivial: qga: Log version on start (2022-05-23 22:27:15 +0300)

----------------------------------------------------------------
qga-win32-pull-2022-05-23

----------------------------------------------------------------
Konstantin Kostiuk (2):
      qga-win32: Add support for NVME but type
      trivial: qga: Log version on start

luzhipeng (1):
      qga: add guest-get-diskstats command for Linux guests

 qga/commands-posix.c | 123 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 qga/commands-win32.c |  11 +++++++++++
 qga/main.c           |   2 ++
 qga/qapi-schema.json |  86 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 222 insertions(+)


--
2.25.1


