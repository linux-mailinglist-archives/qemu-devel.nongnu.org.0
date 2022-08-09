Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BC2B58DC9C
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Aug 2022 18:58:13 +0200 (CEST)
Received: from localhost ([::1]:50396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLSYW-0006zC-Bv
	for lists+qemu-devel@lfdr.de; Tue, 09 Aug 2022 12:58:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1oLSWQ-0003Wp-EI; Tue, 09 Aug 2022 12:56:04 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:55077)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1oLSWO-0000W8-Ml; Tue, 09 Aug 2022 12:56:02 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue010
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1N95Rn-1nIF3K0gsx-0169qg; Tue, 09
 Aug 2022 18:55:57 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 0/2] Trivial branch for 7.1 patches
Date: Tue,  9 Aug 2022 18:55:53 +0200
Message-Id: <20220809165555.2415931-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:4wgleWVivobzNZNRt39nKXmMum4Ruv2EYMv1DlcGGLCGZ25Z00D
 a1/0dFk4M2eCUOtwHQVzB1zL5UVZdxcKA9+ZoP6br7YKqo08apu8OEcQj0niS7wv9GL3Q30
 f0pqsDqTywkLJfOUSisNGFE/gEnRyPwLmB1fMYr1iAkb0K0Kfic88RYVTXwMck3ni3FXXz7
 e/5YGNSWqy3B2gl+rxzIA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:2+LIsI8gSt8=:2srpe/tStOiFmzmc77p86F
 yu1IVncl3seNzLcmw/nFNoBZP9SR1PxNGm6zvfKHQ8LEbV1IyizboA6tJ4XsChGKmDbgvTlqP
 cQy9tODKy5ERp+eUTc/aUfx54uz4QTA7NoD0VLyrquBMvILGsTQP/nk3owjQg2yxv5UaG76Ss
 cuHjyhe3IW9QUTS7gZdIZSvbt5BIKnjiWi9YXzyzPAPIu5ThcuiwDRu/+EfFJHvTwd7xh8zAT
 5SMUJDJeqoJtYnXEI8MjRPuw+eozys65bqL7GevxI2QMBca5lKG1cgtkdiHn8MwWa39cQf3dt
 wSRtL/9VRJlYSRTDpQjLs4+e/JlChER8Z81I56lhPZ0WtR+s+iATph5o4qv847sIUJ7TAa+6R
 juukftLysyusWaza2t1khn7cmi6ldv/V0wN+rbbVUQZ+sQnFsSgJHAyLTBFpG8Yw2DXdJqzxB
 GYF6U2exo9HV8q+iPRl3w6JYHt2Em6r4s25bGu3/DQtBUjjUWs5nQi3ecpsPuykSB10VVSis7
 CM8zsJSzxJSAj3OKlX6EuIU+qdjJEZUNWGloO2Rpg5mLCJmbZ8WVM+RPQlL0l356by/R2+9uX
 PJmfRUOWjbKtrNibwXXvPbfnk85OdEU0NqVVJWhLtHQ7Flt3whUw3pynDKsL8y//gPCAZfiTz
 POILnUMSad25ph8/FYdWTBGCYp77uaheAV21OAxWLZ+dyv7p9eE0fRrH7nIo0aEf5STgn39j3
 oxKw5Keu+9SJ1LHWoanX6s3KxCRzRkSn4oGSFg==
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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

The following changes since commit c669f22f1a47897e8d1d595d6b8a59a572f9158c:

  Merge tag 'pull-la-20220805' of https://gitlab.com/rth7680/qemu into staging (2022-08-05 12:55:53 -0700)

are available in the Git repository at:

  https://gitlab.com/laurent_vivier/qemu.git tags/trivial-branch-for-7.1-pull-request

for you to fetch changes up to 9390da5ef29a5e0f98e5b482dceeeb287c452f17:

  xlnx_dp: drop unsupported AUXCommand in xlnx_dp_aux_set_command (2022-08-08 11:40:06 +0200)

----------------------------------------------------------------
Pull request trivial branch 20220809

----------------------------------------------------------------

Markus Armbruster (1):
  contrib/vhost-user-blk: Clean up deallocation of VuVirtqElement

Qiang Liu (1):
  xlnx_dp: drop unsupported AUXCommand in xlnx_dp_aux_set_command

 contrib/vhost-user-blk/vhost-user-blk.c | 9 +++------
 hw/display/xlnx_dp.c                    | 4 ++--
 2 files changed, 5 insertions(+), 8 deletions(-)

-- 
2.37.1


