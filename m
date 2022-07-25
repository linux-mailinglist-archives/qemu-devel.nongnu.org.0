Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 669FC580590
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jul 2022 22:27:25 +0200 (CEST)
Received: from localhost ([::1]:60170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oG4fk-0005B1-Hp
	for lists+qemu-devel@lfdr.de; Mon, 25 Jul 2022 16:27:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@qemu.org>) id 1oG4bz-0002dE-4M
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 16:23:31 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:60865)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@qemu.org>) id 1oG4bw-0007jf-SE
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 16:23:30 -0400
Received: (Authenticated sender: no-reply@qemu.org)
 by mail.gandi.net (Postfix) with ESMTPSA id C9C1E200002
 for <qemu-devel@nongnu.org>; Mon, 25 Jul 2022 20:23:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
From: GitLab Bot <no-reply@qemu.org>
To: <qemu-devel@nongnu.org>
Subject: [python-qemu-qmp MR #12] Post-release trivial fix roundup
Date: Mon, 25 Jul 2022 20:23:21 -0000
Message-ID: <165878060193.7153.13318616533857006676.no-reply@qemu.org>
X-GitLab-MergeRequest-ID: 167744704
X-GitLab-Project-Id: 35575318
X-GitLab-Project-Path: qemu-project/python-qemu-qmp
X-GitLab-Project: python-qemu-qmp
X-QEMU-GitLab-MR-IID: 12
X-QEMU-GitLab-MR-URL: https://gitlab.com/qemu-project/python-qemu-qmp/-/merge_requests/12
X-QEMU-GitLab-Username: jsnow
Received-SPF: pass client-ip=217.70.178.232; envelope-from=no-reply@qemu.org;
 helo=relay12.mail.gandi.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Author: John Snow - https://gitlab.com/jsnow
Merge Request: https://gitlab.com/qemu-project/python-qemu-qmp/-/merge_requests/12
... from: jsnow/python-qemu-qmp:fixes-roundup
... into: qemu-project/python-qemu-qmp:main

This MR collects a number of small, trivial fixes that follow the first official release; covering graceful exits if dependencies are missing, better interactive debugging information, and improving packaging, publishing and GitLab CI definitions.

---

This is an automated message. This bot will only relay the creation of new merge
requests and will not relay review comments, new revisions, or concluded merges.
Please follow the GitLab link to participate in review.

