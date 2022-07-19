Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55BC257A29C
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 17:06:26 +0200 (CEST)
Received: from localhost ([::1]:46376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDono-0007zg-W5
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 11:06:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@qemu.org>) id 1oDolB-0004wI-5X
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 11:03:41 -0400
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222]:44889)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@qemu.org>) id 1oDol4-0006qQ-Vz
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 11:03:40 -0400
Received: (Authenticated sender: no-reply@qemu.org)
 by mail.gandi.net (Postfix) with ESMTPSA id 6778340013
 for <qemu-devel@nongnu.org>; Tue, 19 Jul 2022 15:03:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
From: GitLab Bot <no-reply@qemu.org>
To: <qemu-devel@nongnu.org>
Subject: [python-qemu-qmp MR #10] GitLab: Omit pages job on
 merge_request_event pipelines
Date: Tue, 19 Jul 2022 15:03:24 -0000
Message-ID: <165824300493.16404.4558647356699827571.no-reply@qemu.org>
X-GitLab-MergeRequest-ID: 166624892
X-GitLab-Project-Id: 35575318
X-GitLab-Project-Path: qemu-project/python-qemu-qmp
X-GitLab-Project: python-qemu-qmp
X-QEMU-GitLab-MR-IID: 10
X-QEMU-GitLab-MR-URL: https://gitlab.com/qemu-project/python-qemu-qmp/-/merge_requests/10
X-QEMU-GitLab-Username: jsnow
Received-SPF: pass client-ip=2001:4b98:dc4:8::222;
 envelope-from=no-reply@qemu.org; helo=relay2-d.mail.gandi.net
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
Merge Request: https://gitlab.com/qemu-project/python-qemu-qmp/-/merge_reques=
ts/10
... from: jsnow/python-qemu-qmp:fix_pipelines
... into: qemu-project/python-qemu-qmp:main

As I found out when Thomas went to submit a job, merge pipelines from a
fork accidentally select this job -- which will then fail as none of the
prior jobs are included in such pipelines.

(Thanks to Dan for diagnosing the misconfiguration.)

Suggested-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
Signed-off-by: John Snow <jsnow@redhat.com>

---

This is an automated message. This bot will only relay the creation of new me=
rge
requests and will not relay review comments, new revisions, or concluded merg=
es.
Please follow the GitLab link to participate in review.

