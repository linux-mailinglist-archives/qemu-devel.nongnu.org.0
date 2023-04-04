Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B03B26D65A7
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 16:43:36 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjhsC-0004my-Sz; Tue, 04 Apr 2023 10:43:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pjhsB-0004mi-02
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 10:42:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1pjhs9-00011k-EW
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 10:42:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680619376;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=6SmmwOOwfC1dis3g2kCsH/aJO+IoBSOb3BzCnPUC+qs=;
 b=PRgoLQOP3oT2xYNXA1L6cyK2jLGI5OPh6g1cAlAJT875RE0vKznpbjAWnus/UJSR5wlUDE
 8YNsKKhIh6plxGGsz/foENKFvleg/jHIWjqjX4mKLsG+I8JyI6BBckFkHeiYPMCUaWCg1I
 J12uXBGRwR0NukHul3ry/WGXXUUU1vU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-96-_MqPKDpZMvCHDm58Wtv5iA-1; Tue, 04 Apr 2023 10:42:54 -0400
X-MC-Unique: _MqPKDpZMvCHDm58Wtv5iA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 928101C17436
 for <qemu-devel@nongnu.org>; Tue,  4 Apr 2023 14:42:47 +0000 (UTC)
Received: from green.redhat.com (unknown [10.2.16.110])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 60F45492C13
 for <qemu-devel@nongnu.org>; Tue,  4 Apr 2023 14:42:47 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/1] NBD patches for 8.0-tc3
Date: Tue,  4 Apr 2023 09:42:43 -0500
Message-Id: <20230404144244.185609-1-eblake@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
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

The following changes since commit 51a6dc9d394098e8f4141fad869a1ee9585f54f8:

  Merge tag 'pull-target-arm-20230403' of https://git.linaro.org/people/pmaydell/qemu-arm into staging (2023-04-03 17:01:47 +0100)

are available in the Git repository at:

  https://repo.or.cz/qemu/ericb.git tags/pull-nbd-2023-04-04

for you to fetch changes up to f1426881a827a6d3f31b65616c4a8db1e9e7c45e:

  nbd/server: Request TCP_NODELAY (2023-04-04 08:13:15 -0500)

----------------------------------------------------------------
nbd patches for 2023-04-04

- Eric Blake: use TCP_NODELAY in nbd server, as followup to corking

----------------------------------------------------------------
Eric Blake (1):
      nbd/server: Request TCP_NODELAY

 nbd/server.c | 1 +
 1 file changed, 1 insertion(+)

base-commit: 51a6dc9d394098e8f4141fad869a1ee9585f54f8
-- 
2.39.2


