Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B36244B0A2
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 16:48:03 +0100 (CET)
Received: from localhost ([::1]:54730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkTLt-0004tq-TE
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 10:48:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mkTKy-0003YS-0F
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 10:47:04 -0500
Received: from mout.kundenserver.de ([217.72.192.75]:50541)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mkTKw-0002gE-ER
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 10:47:03 -0500
Received: from quad ([82.142.14.190]) by mrelayeu.kundenserver.de (mreue108
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1N8ojI-1mgYzd3VdW-015ub3; Tue, 09
 Nov 2021 16:47:00 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 0/1] Q800 for 6.2 patches
Date: Tue,  9 Nov 2021 16:46:57 +0100
Message-Id: <20211109154658.1058842-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Bd2RHab1XSNziCZKRxabJzRy+Tn6X4Crrv59VUNEd2rpwO1i9wJ
 Kh3zB1PEcsS10px0x0Sp2xdID04R68U/6vt7ydzSe1SAXpbXKShzKHUcyPwCDJK79kXlCCe
 0Lf2eHgnTIlunBEXyp0quCHQxTUOuRdAZ+WTiljP+HxIdZ/OsKL+xspZh+5mbge1xhX3PY5
 xvesl+0moDRT3yvNQNwHQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:UP6+20W2Ne0=:+6M3hvV6KybbX05CCW8fRk
 Zk1naojDUulKLUElPllZh3brklMt5mlkisFKYNgQsm/r0mOp6WATR/dJGT+yj3jRQDYbWFA6O
 imr7KgQ3SsXV+fa5lEncFTUKzOlgnZ7XBuS0DO9xE1ZHM2dSDGYlAQtyheNbSamrXA2Cwfy/7
 Xf1BS1TXmDohovMn9t0YC6hgS+9WW2fBk5J2gOdYJzkku7KYIw82zWA+bpXz5Ne+ElW/YnrTs
 2unm/VjO2gWj69xlfZFTyAMR/+2Er1mZFDFWR8cyafkSBrah4jWG7RvXFEhbNHoWPp51l/jW1
 QqWn6xD/B26SxLsxi3aE1q8oiGtmPEAn4a8s1wQcg3EbxDWjNDPmqwI0jZVR/25TFdeHJGOVD
 4qdz1idK5Dr7f/IGGfqyu4Dqhvb/uf+MVD0RenLMQhTdnXiIld8tJwbVFTbSsJ1RAF9PF8MxT
 H9ttOb5q2A8iKENSTUNexRRaF2MIc9RSwc4l0v2TBvHl0g3NZvTrDhE7cKt5pA4ibl7O0TpHp
 eVTFklvH6kfgrrV57Ui+NCwQyOE16y/o0+27DvPOidGU6FOO17WTSxS5QYBWmKPfCYiM0NRqW
 M194b5wi62NzP9TC8esQA3PPKAjeN3mzawaizZhw90cL2o0PpkRHH47opRvrjlSuI8oOmbqgY
 M0MuVnZBIsevMNWD8Rt858ubDwXenaZpVPmx7sD2S6ZnTcljTYy/lT59W5UttWLI0GZk=
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 2b22e7540d6ab4efe82d442363e3fc900cea6584=
:=0D
=0D
  Merge tag 'm68k-for-6.2-pull-request' of git://github.com/vivier/qemu-m68=
k into staging (2021-11-09 13:16:56 +0100)=0D
=0D
are available in the Git repository at:=0D
=0D
  git://github.com/vivier/qemu-m68k.git tags/q800-for-6.2-pull-request=0D
=0D
for you to fetch changes up to 5db83c7e90ec6c0b28995b537bb03942edcd4164:=0D
=0D
  macfb: fix a memory leak (CID 1465231) (2021-11-09 16:42:49 +0100)=0D
=0D
----------------------------------------------------------------=0D
Fix CID 1465231=0D
=0D
----------------------------------------------------------------=0D
=0D
Laurent Vivier (1):=0D
  macfb: fix a memory leak (CID 1465231)=0D
=0D
 hw/display/macfb.c | 11 ++++-------=0D
 1 file changed, 4 insertions(+), 7 deletions(-)=0D
=0D
-- =0D
2.31.1=0D
=0D

