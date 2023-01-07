Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A4DF660C79
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Jan 2023 05:49:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pE17W-0007r2-03; Fri, 06 Jan 2023 23:47:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>) id 1pDz5t-0008TO-Al
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 21:38:01 -0500
Received: from mail-b.sr.ht ([173.195.146.151])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>) id 1pDz5r-0002d9-Qk
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 21:38:01 -0500
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id 44FF111EF15;
 Sat,  7 Jan 2023 02:37:58 +0000 (UTC)
From: ~henca <henca@git.sr.ht>
Date: Sat, 07 Jan 2023 02:37:58 +0000
Subject: [PATCH qemu v3 0/1]  [PATCH v3] Emulate dip switch language layout
 settings on SUN keyboard
MIME-Version: 1.0
Message-ID: <167305907804.10652.2746409341903316717-0@git.sr.ht>
X-Mailer: git.sr.ht
To: qemu-devel@nongnu.org
Cc: atar4qemu@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=173.195.146.151; envelope-from=outgoing@sr.ht;
 helo=mail-b.sr.ht
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 06 Jan 2023 23:47:46 -0500
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
Reply-To: ~henca <hc1245@poolhem.se>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Year 2020 I made 2 attempts to contribute this patch. Unfortunately "git
format-patch" produced crippled patches which were not possible to
apply. Some @@-lines got extra code that didn't belong in those lines.
Now I am instead trying to send my patch using sourcehut. Unfortunately,
it seems as if the patch created by sourcehut is still crippled, but my
commit has been pushed to the git repo at https://git.sr.ht/~henca/qemu
and it builds and works fine from there.

Henrik Carlqvist (1):
  Emulating sun keyboard language layout dip switches, taking the value
    for the dip switches from the "-k" option to qemu.

 hw/char/escc.c | 74 +++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 73 insertions(+), 1 deletion(-)

-- 
2.34.5

