Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E91E4B1282
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 17:17:38 +0100 (CET)
Received: from localhost ([::1]:42546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIC8U-0003PF-FY
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 11:17:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1nI9Xz-0003gY-SN; Thu, 10 Feb 2022 08:31:43 -0500
Received: from proxmox-new.maurer-it.com ([94.136.29.106]:64256)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <f.ebner@proxmox.com>)
 id 1nI9Xx-0004mc-Hj; Thu, 10 Feb 2022 08:31:43 -0500
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id 4130C46DCE;
 Thu, 10 Feb 2022 14:31:30 +0100 (CET)
From: Fabian Ebner <f.ebner@proxmox.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/4] Make qemu-img dd more flexible
Date: Thu, 10 Feb 2022 14:31:19 +0100
Message-Id: <20220210133123.347350-1-f.ebner@proxmox.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=94.136.29.106; envelope-from=f.ebner@proxmox.com;
 helo=proxmox-new.maurer-it.com
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
Cc: kwolf@redhat.com, w.bumiller@proxmox.com, qemu-block@nongnu.org,
 aderumier@odiso.com, hreitz@redhat.com, t.lamprecht@proxmox.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Adds support for reading from stdin and writing to stdout (when raw
format is used), as well as overriding the size of the output and
input image/stream.

Additionally, the options -n for skipping output image creation and -l
for loading a snapshot are made available like for convert.

Alexandre Derumier (1):
  qemu-img: dd: add -n option (skip target volume creation)

Fabian Ebner (1):
  qemu-img: dd: add -l option for loading a snapshot

Wolfgang Bumiller (2):
  qemu-img: dd: add osize and read from/to stdin/stdout
  qemu-img: dd: add isize parameter

 docs/tools/qemu-img.rst |  28 ++++-
 qemu-img-cmds.hx        |   4 +-
 qemu-img.c              | 261 +++++++++++++++++++++++++++++-----------
 3 files changed, 215 insertions(+), 78 deletions(-)

-- 
2.30.2



