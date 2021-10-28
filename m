Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D7DE43E448
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 16:53:19 +0200 (CEST)
Received: from localhost ([::1]:39258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mg6mM-0003kG-8i
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 10:53:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1mg6i1-0005Lh-IW
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 10:48:49 -0400
Received: from relay68.bu.edu ([128.197.228.73]:43695)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1mg6hu-000238-9y
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 10:48:48 -0400
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay68.bu.edu (8.14.3/8.14.3) with ESMTP id 19SEmM64012328
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Thu, 28 Oct 2021 10:48:25 -0400
Date: Thu, 28 Oct 2021 10:48:22 -0400
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: Possible reward for fuzzer bug fixes? Secure Open Source Rewards
 Program
Message-ID: <20211028144822.jjbw7ypkkman7sow@mozz.bu.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=128.197.228.73; envelope-from=alxndr@bu.edu;
 helo=relay68.bu.edu
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, HK_RANDOM_ENVFROM=0.222,
 HK_RANDOM_FROM=1, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Thomas Huth <thuth@redhat.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Darren Kenny <darren.kenny@oracle.com>, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Recently a pilot for the Secure Open Source Rewards program was
announced [1]. Currently this program is run by the Linux Foundation and
sponsored by the Google Open Source Security Team.

The page mentions that patches for issues discovered by OSS-Fuzz may be
eligible for rewards. This seems like it could be a good incentive for
fixing fuzzer bugs.

A couple notes:
 * The program also rewards contributions besides fuzzer-bug fixes.
   Check out the page for full details.
 * It seems that QEMU would qualify for this program. The page mentions
   that the project should have a greater than 0.6 OpenSSF Criticality
   Score [2]. This score factors in statistics collected from github
   (sic!). QEMU's score is currently 0.81078
 * Not limited to individual contributors. Vendors can also qualify for
   rewards.
 * Work completed before Oct 1, 2021 does not qualify.
 * Individuals in some sanctioned countries are not eligible.
 * The process seems to be:
    1. Send a fix upstream
    2. Get it accepted
    3. Fill out a form to apply for a reward

Any thoughts about this? Should this be something we document/advertise
somewhere, so developers are aware of this opportunity?

[1] https://sos.dev/
[2] https://github.com/ossf/criticality_score

-Alex

