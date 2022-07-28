Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85C095848AC
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jul 2022 01:28:37 +0200 (CEST)
Received: from localhost ([::1]:43424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oHCvk-0000th-KZ
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 19:28:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@qemu.org>) id 1oHCuB-0007PL-1X
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 19:26:59 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:47285)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@qemu.org>) id 1oHCu8-0003wG-NG
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 19:26:58 -0400
Received: (Authenticated sender: no-reply@qemu.org)
 by mail.gandi.net (Postfix) with ESMTPSA id C7335C0002
 for <qemu-devel@nongnu.org>; Thu, 28 Jul 2022 23:26:51 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
From: GitLab Bot <no-reply@qemu.org>
To: <qemu-devel@nongnu.org>
Subject: [python-qemu-qmp MR #13] Sphinx: improve version detection for SDists
Date: Thu, 28 Jul 2022 23:26:50 -0000
Message-ID: <165905081006.27212.5808926060689228913.no-reply@qemu.org>
X-GitLab-MergeRequest-ID: 168465250
X-GitLab-Project-Id: 35575318
X-GitLab-Project-Path: qemu-project/python-qemu-qmp
X-GitLab-Project: python-qemu-qmp
X-QEMU-GitLab-MR-IID: 13
X-QEMU-GitLab-MR-URL: https://gitlab.com/qemu-project/python-qemu-qmp/-/merge_requests/13
X-QEMU-GitLab-Username: jsnow
Received-SPF: pass client-ip=217.70.183.198; envelope-from=no-reply@qemu.org;
 helo=relay6-d.mail.gandi.net
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
Merge Request: https://gitlab.com/qemu-project/python-qemu-qmp/-/merge_requests/13
... from: jsnow/python-qemu-qmp:doc-version-fix
... into: qemu-project/python-qemu-qmp:main

When building docs from SDist files, we won't have git metadata
available. Use any tools we may have at our disposal to determine the
package version when possible in these cases.

Note: this patch avoids trying to blindly import "qemu.qmp" in just such
a case that the user's environment already has such a package installed:
we want to query specifically the version from the unpackaged source
files.

Fixes #27

---

This is an automated message. This bot will only relay the creation of new merge
requests and will not relay review comments, new revisions, or concluded merges.
Please follow the GitLab link to participate in review.

