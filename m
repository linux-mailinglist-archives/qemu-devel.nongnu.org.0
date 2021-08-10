Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D4873E7E2B
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 19:23:19 +0200 (CEST)
Received: from localhost ([::1]:50344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDVTC-0006XP-7Z
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 13:23:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>) id 1mDUwX-0003a0-Rj
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 12:49:33 -0400
Received: from mail-b.sr.ht ([173.195.146.151]:59244)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>) id 1mDUwV-0001wO-W8
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 12:49:33 -0400
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id 8CBDD11EEF6;
 Tue, 10 Aug 2021 16:49:30 +0000 (UTC)
From: ~archi42 <archi42@git.sr.ht>
Date: Tue, 10 Aug 2021 16:49:30 +0000
Subject: [PATCH qemu 0/1] Document how to use gdbserver with unix sockets
MIME-Version: 1.0
Message-ID: <162861417028.13673.3981098709822414721-0@git.sr.ht>
X-Mailer: git.sr.ht
To: qemu-devel@nongnu.org
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
X-Mailman-Approved-At: Tue, 10 Aug 2021 13:21:40 -0400
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
Reply-To: ~archi42 <sourcehut@mailhell.seb7.de>
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I had some trouble with gdb over unix sockets, and Peter was so nice to
help me out with it on IRC.
This adds some docs for that, so others
might have less trouble:

< pm215> yeah, that would be good

Feel
free to adjust/rephrase/rearrange the patch :)

Sebastian Meyer (1):
  docs: how to use gdb with unix sockets

 docs/system/gdb.rst | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

-- 
2.32.0

