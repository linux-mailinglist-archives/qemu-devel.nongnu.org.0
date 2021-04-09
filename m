Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 226A6359F93
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 15:11:45 +0200 (CEST)
Received: from localhost ([::1]:49372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUqvI-0008Gj-5h
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 09:11:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lUqtM-00078x-SS
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 09:09:46 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:42015)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lUqtG-0002S0-Fk
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 09:09:44 -0400
Received: from localhost.localdomain ([82.142.18.94]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1M9nEJ-1lRocd3B8H-005sgk; Fri, 09 Apr 2021 15:09:34 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 0/1] Linux user for 6.0 patches
Date: Fri,  9 Apr 2021 15:09:30 +0200
Message-Id: <20210409130931.382887-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.30.2
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:MHyfauIZPpvFyILqzeyACo01iqTvOy/G6Va3oN6Rxq9LMqFB/3V
 8zHU4k0pPgCohJAFfElJYiqkpWO0NMmEZGqF477EuD+tR9DIkxL/E2gqaoekk32U4T6ZIgN
 3ZL/5gax/+1ISBk4ty0i2mO3MiSlmuopH1o7H7KrBHYVQAflRD92+PzJyR+RebQCOyWfiiw
 rBc/z/T5YpIWYX6phmV8g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:lh3ljPYmG+s=:kyuhbDe5Wsm7iQ8lknxQ7s
 59I7NcSYjBmaFMEmwH24z+XZLlE2vr/LBVT07YobBHxeyk8Erki0VJDL+UqM5rR7vFxLIkjaS
 VLrGlaOo+XAzUjM//0pRAWnzs7Z2n8X/smqMNF71ezgud1TgMaPZou1KeKMRHNnJwMHzHwR5t
 ZaQIMOS6gjqn98raQ1xA2e/p2yerSw46tN0k4qBtDtQvVBc9bALV2jmn7osfUuIBoHd2a3FfK
 1B0hmlDtERx8EpmyOHSF84tpAtBObHlud+KJFo8rOyPxkfD59fVU9F/vJdSodqGHxl1fkwbjb
 pu7g5u1b/QoEBPrrI53xHVi6fg8TSkdSVxKaqcFiosy9Hp80webWUZdQSJXdkUS7Sxs27xsfr
 7jQJ3oSelC50p57VdPj8iPM5Jsly75EtjZ9sRe6G3DztGuM88z1ywLHF2MkwffyE8gG+3B2VK
 Xw8LSQMWQ18RBfLyRIJYJ5Iwq/TQdsbYNShogUEmMtb0hErvx9Tu
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit d0d3dd401b70168a353450e031727affee828527=
:=0D
=0D
  Update version for v6.0.0-rc2 release (2021-04-06 18:34:34 +0100)=0D
=0D
are available in the Git repository at:=0D
=0D
  git://github.com/vivier/qemu.git tags/linux-user-for-6.0-pull-request=0D
=0D
for you to fetch changes up to 360f0abdc51652b06a3718ed43a8688562e69ca4:=0D
=0D
  linux-user: Use signed lengths in uaccess.c (2021-04-07 18:55:27 +0200)=0D
=0D
----------------------------------------------------------------=0D
linux-user pull request 20210409=0D
=0D
Fix lock_user()/unlock_user()=0D
=0D
----------------------------------------------------------------=0D
=0D
Richard Henderson (1):=0D
  linux-user: Use signed lengths in uaccess.c=0D
=0D
 linux-user/qemu.h    | 15 +++++++++------=0D
 linux-user/uaccess.c | 12 ++++++------=0D
 2 files changed, 15 insertions(+), 12 deletions(-)=0D
=0D
-- =0D
2.30.2=0D
=0D

