Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B0E6396C4
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Nov 2022 16:27:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oyx3c-0008N9-OE; Sat, 26 Nov 2022 10:25:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefan@weilnetz.de>)
 id 1oyx3a-0008N1-Ga
 for qemu-devel@nongnu.org; Sat, 26 Nov 2022 10:25:30 -0500
Received: from mail.weilnetz.de ([37.120.169.71]
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefan@weilnetz.de>)
 id 1oyx3Y-0006nf-9g
 for qemu-devel@nongnu.org; Sat, 26 Nov 2022 10:25:29 -0500
Received: from qemu.weilnetz.de (qemu.weilnetz.de [188.68.58.204])
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTP id 58010DA0498;
 Sat, 26 Nov 2022 16:25:23 +0100 (CET)
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
 id EFA5E46000E; Sat, 26 Nov 2022 16:25:22 +0100 (CET)
To: qemu-devel@nongnu.org,
	"Michael S . Tsirkin" <mst@redhat.com>
Cc: Stefan Hajnoczi <stefanha@gmail.com>,
	Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH v3 for-7.2 0/6] Add format attributes and fix format strings
Date: Sat, 26 Nov 2022 16:25:01 +0100
Message-Id: <20221126152507.283271-1-sw@weilnetz.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=37.120.169.71; envelope-from=stefan@weilnetz.de;
 helo=mail.v2201612906741603.powersrv.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Reply-to:  Stefan Weil <sw@weilnetz.de>
From:  Stefan Weil via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

v3:
- Fix description for patch 3
- Add patches 5 and 6

The patches 3 and 5 still need reviews!

[PATCH v3 for-7.2 1/6] libvhost-user: Fix wrong type of argument to
[PATCH v3 for-7.2 2/6] libvhost-user: Fix format strings
[PATCH v3 for-7.2 3/6] libvhost-user: Fix two more format strings
[PATCH v3 for-7.2 4/6] libvhost-user: Add format attribute to local
[PATCH v3 for-7.2 5/6] MAINTAINERS: Add subprojects/libvhost-user to
[PATCH v3 for-7.2 6/6] Add G_GNUC_PRINTF to function


