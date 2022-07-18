Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6BBC578AAE
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 21:28:00 +0200 (CEST)
Received: from localhost ([::1]:43836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDWPP-0003IG-Vx
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 15:28:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@qemu.org>) id 1oDVeD-0004yN-Io
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 14:39:15 -0400
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226]:34429)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@qemu.org>) id 1oDVe1-0006Mi-61
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 14:39:12 -0400
Received: (Authenticated sender: no-reply@qemu.org)
 by mail.gandi.net (Postfix) with ESMTPSA id D6FC1C0004
 for <qemu-devel@nongnu.org>; Mon, 18 Jul 2022 18:38:50 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
From: GitLab Bot <no-reply@qemu.org>
To: <qemu-devel@nongnu.org>
Subject: [python-qemu-qmp MR #9] qemu/qmp/legacy: Replace 'returns-whitelist'
 with the correct type
Date: Mon, 18 Jul 2022 18:38:49 -0000
Message-ID: <165816952934.12416.6139132168134735055.no-reply@qemu.org>
X-GitLab-MergeRequest-ID: 166414079
X-GitLab-Project-Id: 35575318
X-GitLab-Project-Path: qemu-project/python-qemu-qmp
X-GitLab-Project: python-qemu-qmp
X-QEMU-GitLab-MR-IID: 9
X-QEMU-GitLab-MR-URL: https://gitlab.com/qemu-project/python-qemu-qmp/-/merge_requests/9
X-QEMU-GitLab-Username: thuth
Received-SPF: pass client-ip=2001:4b98:dc4:8::226;
 envelope-from=no-reply@qemu.org; helo=relay6-d.mail.gandi.net
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

Author: Thomas Huth - https://gitlab.com/thuth
Merge Request: https://gitlab.com/qemu-project/python-qemu-qmp/-/merge_requests/9
... from: thuth/python-qemu-qmp:fixes
... into: qemu-project/python-qemu-qmp:main

'returns-whitelist' has been renamed to 'command-returns-exceptions' in QEMU
commit b86df3747848 ("qapi: Rename pragma *-whitelist to *-exceptions").

---

This is an automated message. This bot will only relay the creation of new merge
requests and will not relay review comments, new revisions, or concluded merges.
Please follow the GitLab link to participate in review.

