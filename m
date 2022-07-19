Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDF2557A42F
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 18:25:24 +0200 (CEST)
Received: from localhost ([::1]:32880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDq2G-0007Wn-5N
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 12:25:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@qemu.org>) id 1oDpyP-0001LI-Ij
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 12:21:27 -0400
Received: from relay12.mail.gandi.net ([2001:4b98:dc4:8::232]:36139)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@qemu.org>) id 1oDpyN-0004kG-BE
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 12:21:25 -0400
Received: (Authenticated sender: no-reply@qemu.org)
 by mail.gandi.net (Postfix) with ESMTPSA id B8BE1200007
 for <qemu-devel@nongnu.org>; Tue, 19 Jul 2022 16:21:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
From: GitLab Bot <no-reply@qemu.org>
To: <qemu-devel@nongnu.org>
Subject: [python-qemu-qmp MR #11] first public release - v0.0.1
Date: Tue, 19 Jul 2022 16:21:16 -0000
Message-ID: <165824767606.16404.6058857132450774105.no-reply@qemu.org>
X-GitLab-MergeRequest-ID: 166643398
X-GitLab-Project-Id: 35575318
X-GitLab-Project-Path: qemu-project/python-qemu-qmp
X-GitLab-Project: python-qemu-qmp
X-QEMU-GitLab-MR-IID: 11
X-QEMU-GitLab-MR-URL: https://gitlab.com/qemu-project/python-qemu-qmp/-/merge_requests/11
X-QEMU-GitLab-Username: jsnow
Received-SPF: pass client-ip=2001:4b98:dc4:8::232;
 envelope-from=no-reply@qemu.org; helo=relay12.mail.gandi.net
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
Merge Request: https://gitlab.com/qemu-project/python-qemu-qmp/-/merge_requests/11
... from: jsnow/python-qemu-qmp:first_release
... into: qemu-project/python-qemu-qmp:main

***If this MR is approved, after merge; I will be tagging this commit as "v0.0.1", building packages, and publishing them to PyPI.***

No changelog, it's the "first release" :)

In practice, the commit history range 4e078291.. comprises all of the changes made to the QMP library since it was forked out of the qemu.git tree; most of them relate to packaging, metadata, documentation fixes, GitLab configuration and so on, except a single functional change in 0443582d: `kick event queue on legacy event_pull()`. This change was also mirrored to the in-tree version of this library that still exists in qemu.git.

This release is considered to be an "alpha" release, and the PyPI metadata and README both reflect that. The API is still prone to change in either a v0.0.2 or v0.1.0 release. Feedback from anyone and everyone is especially welcomed at this stage.

Thanks!

--js

---

This is an automated message. This bot will only relay the creation of new merge
requests and will not relay review comments, new revisions, or concluded merges.
Please follow the GitLab link to participate in review.

