Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 522B553541A
	for <lists+qemu-devel@lfdr.de>; Thu, 26 May 2022 21:52:27 +0200 (CEST)
Received: from localhost ([::1]:38978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuJWy-000359-PV
	for lists+qemu-devel@lfdr.de; Thu, 26 May 2022 15:52:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@qemu.org>) id 1nuJOe-0001LV-SS
 for qemu-devel@nongnu.org; Thu, 26 May 2022 15:43:48 -0400
Received: from relay12.mail.gandi.net ([2001:4b98:dc4:8::232]:51441)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@qemu.org>) id 1nuJOd-000797-0i
 for qemu-devel@nongnu.org; Thu, 26 May 2022 15:43:48 -0400
Received: (Authenticated sender: no-reply@qemu.org)
 by mail.gandi.net (Postfix) with ESMTPSA id 7D02B200004
 for <qemu-devel@nongnu.org>; Thu, 26 May 2022 19:43:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
From: GitLab Bot <no-reply@qemu.org>
To: <qemu-devel@nongnu.org>
Subject: [python-qemu-qmp MR #6] GitLab: add python3.11 to python container
Message-ID: <165359422084.5936.952157135173308838.no-reply@qemu.org>
X-GitLab-MergeRequest-ID: 157379603
X-GitLab-Project-Id: 35575318
X-GitLab-Project-Path: qemu-project/python-qemu-qmp
X-GitLab-Project: python-qemu-qmp
X-QEMU-GitLab-MR-IID: 6
X-QEMU-GitLab-MR-URL: https://gitlab.com/qemu-project/python-qemu-qmp/-/merge_requests/6
X-QEMU-GitLab-Username: jsnow
Received-SPF: pass client-ip=2001:4b98:dc4:8::232;
 envelope-from=no-reply@qemu.org; helo=relay12.mail.gandi.net
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, MISSING_DATE=1.36,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
Date: Thu, 26 May 2022 15:43:48 -0400
X-Mailman-Approved-At: Thu, 26 May 2022 15:50:10 -0400
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

Author: John Snow - https://gitlab.com/jsnow
Merge Request: https://gitlab.com/qemu-project/python-qemu-qmp/-/merge_requests/6
... from: jsnow/python-qemu-qmp:install_python_311
... into: qemu-project/python-qemu-qmp:main

*Actually* install Python 3.11 to the container that is used during the
GitLab pipeline. Without this, the test is just skipped, which isn't
that helpful.

Signed-off-by: John Snow <jsnow@redhat.com>

---

This is an automated message. This bot will only relay the creation of new merge
requests and will not relay review comments, new revisions, or concluded merges.
Please follow the GitLab link to participate in review.

