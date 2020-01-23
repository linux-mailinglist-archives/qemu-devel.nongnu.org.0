Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86385146359
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jan 2020 09:20:35 +0100 (CET)
Received: from localhost ([::1]:52768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iuXj8-0005tx-DV
	for lists+qemu-devel@lfdr.de; Thu, 23 Jan 2020 03:20:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53321)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <johannes@sipsolutions.net>) id 1iuXfw-00020Y-Ps
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 03:17:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <johannes@sipsolutions.net>) id 1iuXfv-0005lS-MY
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 03:17:16 -0500
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]:35486
 helo=sipsolutions.net)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <johannes@sipsolutions.net>)
 id 1iuXfv-0005iM-EL
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 03:17:15 -0500
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.93) (envelope-from <johannes@sipsolutions.net>)
 id 1iuXfs-00FGF5-5t; Thu, 23 Jan 2020 09:17:12 +0100
From: Johannes Berg <johannes@sipsolutions.net>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 0/6] small vhost changes and in-band notifications
Date: Thu, 23 Jan 2020 09:17:02 +0100
Message-Id: <20200123081708.7817-1-johannes@sipsolutions.net>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a01:4f8:191:4433::2
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
Cc: mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

Here's a repost of all the patches I sent back in August, with the
in-band notifications rebased over the reset patch, so IDs have now
changed a bit.

I've marked this all as v5 even if it really wasn't for all of them,
just the VugDev main fd cleanup patch was at v4 before.

I've also collected reviewed-by's from the previous patches here.

Let me know if I should make any further edits here or in follow-up
patches.

Thanks,
johannes



