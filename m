Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70D3F596B79
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Aug 2022 10:41:53 +0200 (CEST)
Received: from localhost ([::1]:34986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOEca-00015Q-IB
	for lists+qemu-devel@lfdr.de; Wed, 17 Aug 2022 04:41:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@openvz.org>)
 id 1oOEZL-0004pl-4J; Wed, 17 Aug 2022 04:38:31 -0400
Received: from relay.virtuozzo.com ([130.117.225.111]:35567)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@openvz.org>)
 id 1oOEZJ-0006Ae-AU; Wed, 17 Aug 2022 04:38:30 -0400
Received: from [192.168.16.116] (helo=iris.sw.ru)
 by relay.virtuozzo.com with esmtp (Exim 4.95)
 (envelope-from <den@openvz.org>) id 1oOEX9-00GAqg-6e;
 Wed, 17 Aug 2022 10:37:26 +0200
From: "Denis V. Lunev" <den@openvz.org>
To: qemu-block@nongnu.org,
	qemu-devel@nongnu.org
Cc: "Denis V . Lunev" <den@openvz.org>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Fam Zheng <fam@euphon.net>, Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Lieven <pl@kamp.de>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Subject: [PATCH for 7.2] minor fixups in block code
Date: Wed, 17 Aug 2022 10:37:34 +0200
Message-Id: <20220817083736.40981-1-den@openvz.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=130.117.225.111; envelope-from=den@openvz.org;
 helo=relay.virtuozzo.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

These 2 patches are just minor improvements to make code a bit better.

Signed-off-by: Denis V. Lunev <den@openvz.org>
CC: Kevin Wolf <kwolf@redhat.com>
CC: Hanna Reitz <hreitz@redhat.com>
CC: Stefan Hajnoczi <stefanha@redhat.com>
CC: Fam Zheng <fam@euphon.net>
CC: Ronnie Sahlberg <ronniesahlberg@gmail.com>
CC: Paolo Bonzini <pbonzini@redhat.com>
CC: Peter Lieven <pl@kamp.de>
CC: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>



