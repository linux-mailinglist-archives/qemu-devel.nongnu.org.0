Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE1404E5BB0
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Mar 2022 00:08:33 +0100 (CET)
Received: from localhost ([::1]:37086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXA5g-0000FG-AD
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 19:08:32 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huettel@www.akhuettel.de>)
 id 1nXA3e-0006ih-A0
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 19:06:27 -0400
Received: from woodpecker.gentoo.org ([140.211.166.183]:34480
 helo=smtp.gentoo.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim 4.90_1) (envelope-from <huettel@www.akhuettel.de>)
 id 1nXA3b-0000gr-Q5
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 19:06:25 -0400
Received: (nullmailer pid 657456 invoked by uid 1000);
 Wed, 23 Mar 2022 23:06:15 -0000
From: =?UTF-8?q?Andreas=20K=2E=20H=C3=BCttel?= <dilfridge@gentoo.org>
To: qemu-devel@nongnu.org
Subject: qemu-binfmt-conf.sh: improvements for mips
Date: Thu, 24 Mar 2022 00:05:57 +0100
Message-Id: <20220323230559.656291-1-dilfridge@gentoo.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=140.211.166.183;
 envelope-from=huettel@www.akhuettel.de; helo=smtp.gentoo.org
X-Spam_score_int: -56
X-Spam_score: -5.7
X-Spam_bar: -----
X-Spam_report: (-5.7 / 5.0 requ) BAYES_00=-1.9, FORGED_SPF_HELO=1,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: alex.bennee@linaro.org, richard.henderson@linaro.org, laurent@vivier.eu,
 philippe.mathieu.daude@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Re-sending v3 unchanged as requested.

The first patch has already been submitted earlier and is unchanged from v2.
The second patch extends it and resolves issue 843, "duplicate magic mips patterns".
Tested with various self-bootstrapped Gentoo chroots and in production on 
the Gentoo release engineering stage builder.



