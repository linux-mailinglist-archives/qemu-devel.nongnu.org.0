Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64EEC598E58
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Aug 2022 22:51:30 +0200 (CEST)
Received: from localhost ([::1]:44492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOmUD-0001nK-3h
	for lists+qemu-devel@lfdr.de; Thu, 18 Aug 2022 16:51:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@qemu.org>) id 1oOmRy-0000Aq-Ez
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 16:49:11 -0400
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224]:42053)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@qemu.org>) id 1oOmRv-0000lT-Rm
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 16:49:10 -0400
Received: (Authenticated sender: no-reply@qemu.org)
 by mail.gandi.net (Postfix) with ESMTPSA id C51DEE0004
 for <qemu-devel@nongnu.org>; Thu, 18 Aug 2022 20:49:02 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
From: GitLab Bot <no-reply@qemu.org>
To: <qemu-devel@nongnu.org>
Subject: [python-qemu-qmp MR #18] New release - v0.0.2
Date: Thu, 18 Aug 2022 20:49:00 -0000
Message-ID: <166085574086.24569.1956558527725650436.no-reply@qemu.org>
X-GitLab-MergeRequest-ID: 172363115
X-GitLab-Project-Id: 35575318
X-GitLab-Project-Path: qemu-project/python-qemu-qmp
X-GitLab-Project: python-qemu-qmp
X-QEMU-GitLab-MR-IID: 18
X-QEMU-GitLab-MR-URL: https://gitlab.com/qemu-project/python-qemu-qmp/-/merge_requests/18
X-QEMU-GitLab-Username: jsnow
Received-SPF: pass client-ip=2001:4b98:dc4:8::224;
 envelope-from=no-reply@qemu.org; helo=relay4-d.mail.gandi.net
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
Merge Request: https://gitlab.com/qemu-project/python-qemu-qmp/-/merge_requests/18
... from: jsnow/python-qemu-qmp:new_release
... into: qemu-project/python-qemu-qmp:main

***If this MR is approved, after merge I will be tagging this commit as "v0.0.2", building packages, and publishing them to PyPI.***

New release; primarily for the benefit of downstream packaging. This is
a minor release that should be safe to upgrade to, unless you are
relying on string-matching repr() output for certain error classes,
which have changed slightly.

Changelog:

This release primarily fixes development tooling, documentation, and packaging issues that have no impact on the library itself. A handful of small, runtime visible changes were added as polish.

* Milestone: %"v0.0.2" 
* #28: Added manual pages and web docs for qmp-shell[-wrap]
* #27: Support building Sphinx docs from SDist files
* #26: Add coverage.py support to GitLab merge requests
* #25: qmp-shell-wrap now exits gracefully when qemu-system not found.
* #24: Minor packaging fixes.
* #10: qmp-tui exits gracefully when [tui] extras are not installed.
* #09: `__repr__` methods have been improved for all custom classes.
* #04: Mutating QMPClient.name now also changes logging messages.


Thanks!

--js

---

This is an automated message. This bot will only relay the creation of new merge
requests and will not relay review comments, new revisions, or concluded merges.
Please follow the GitLab link to participate in review.

