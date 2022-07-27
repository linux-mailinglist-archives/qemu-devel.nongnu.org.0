Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92717583445
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 22:53:03 +0200 (CEST)
Received: from localhost ([::1]:59872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGo1c-0003Uf-M6
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 16:53:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oGnrR-0005oh-3O
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 16:42:29 -0400
Received: from mout.gmx.net ([212.227.15.15]:42381)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oGnr3-0002XT-0F
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 16:42:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1658954520;
 bh=v/j/+x/IsmA109CKUDUDDmCMyuzRZKNAhpb1V5etliU=;
 h=X-UI-Sender-Class:From:To:Subject:Date;
 b=kKd/rZKlz2fqwFRD/OY4g8A0SoV/Rkbrq0jNffT5olZd18hJElHY9KmUgd0UG+VL7
 kQfXDPygdmdQjufKMYOc0WLMH5MAIIl/MG4/0x6vZz7eFyQEVktBV+1amEp6vKcU4L
 mty5/dYpJ9QJFsWO75LRqq1BXbNMIsuY/+uqukWM=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.185.42]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mzyya-1nW0WU092s-00wzSO; Wed, 27
 Jul 2022 22:42:00 +0200
From: Helge Deller <deller@gmx.de>
To: qemu-devel@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH 0/2] linux-user: Improve strace output
Date: Wed, 27 Jul 2022 22:41:57 +0200
Message-Id: <20220727204159.106936-1-deller@gmx.de>
X-Mailer: git-send-email 2.35.3
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:6cHfeF5Zr0L31lTstY0bIrGSJAzY2cySZfQ/jssdbMmaN+XrI7q
 xQnBN7Uz4DC/2uAwJlKdZPBJxeqaZlbM+aGYaTJ3mB9UEogVpfBqiAp8SHHNtWvbkPWdjol
 b6jW6eeF0MGPwVyAhSUk5W1blN9jHPT+ElgMaKjPNBnoyqe8LKqH5Cgp4OFkraYN/s2Oi4k
 GjGpIoCBSD4JQPtOE9ITg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Mxq5UfKDki0=:/rfS46kDAxLCkMv+OnX+uu
 nK1lzycgRzz+JV2hE3QZ9jmQqSetbu3I95zFiraAJJtqtXFR2KipgsAVIqO1z1HsXF1kpHZQ2
 82/+lfLSyIRMH5ARI67qYfy7T5LMS6WhC3mpA1jnxjkQof2htpZG77zcLVEDE7vY6aoCalPO/
 eCdPLd+0hAGJ3j/CSV8QoTJimpoJq3fXXa5QbYluriuoO8gAjbr20aOqGCBv2buZ36aPNhVWK
 +mWnZL1XfsMODrzwT7hDmjM8fBoV0Sp5fa5nyEnim8Q7UgrylW4YQvrJjUB9D/bgw83HQAGuW
 3A0olTvSCUIe45arvoZ86XZmlHI5Li3td6M4OjFDg83Z8O+2wU/r6tM6Q4M3dkUgQgrL/aDUG
 MMR2RBynaLk4Gvqt2Y+ZT8zGse629tjBtzA92Eg45c6fxunI3+P40smkKHizVkKvaQZTmx2EC
 ovwfhirzKNP23mU2s+IENKs/vCpyFbmGkFHoT61tJ4JPfV03ONkV/j8gbLgUWxnVWe8yplp6R
 iVBemGr9/W8vQX9TUt6w1f1vEYWWyidsMdewpfsNdSqvSRQn04RBx0S6doWajdpWnd0fxJ9/M
 1M2qvQByNWnW5e1Y2cYMFo1RIvjtt6ceoGFBlZTdQS33Jwy3bUJL0v/+j0STp9EZrNY60sJuO
 tYNTWBuy3NrcC+2yCrF9xQZeySd94mIKvT9aPTBZ3oV71nk9KOtq5ZCuNyi5DA3xJYsRxYCRI
 jAOnjQitnHO0IIQXo7HmCi7P3nbaEx+XgxMr1TrDc76sbQIetSQt/JAJtzPOaWAxLbJGTNu7T
 YkiuXnfMQdc4iKEQ7RS3JOp+cMcswKYMaDHvS++yPIOrupBeeSlbS6VOEDS6ONZlHVE5OeBBX
 yA1xEorwvPOqeIxuqUaC8O3B0g3aAhWOH6UEAGbVHnmf4HYLh8JVWWYh6/qTr5vTyLassH8h1
 ckzzgDLvU2BNjr0IR222iT5RKNd0vFd18hxQTNKLq0zAYs7wJ7z70HHp2SmaOJi0wqD+2NZzV
 sTjYap/PKep8dtz2OKrzm2JrsbWSqOWU7ibapMxlscmSFLMCMnqQ1j9BOf0EsmKd377QjAwjH
 yp9qy+4hK4OO9aFumNCArT44zzwYK83jxa+PL8fXFJNjnEs2dBVHeck7A==
Received-SPF: pass client-ip=212.227.15.15; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, RCVD_IN_MSPIKE_H2=-0.001,
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

Two patches which improve the linux-user strace output:
a) Add some missing signal names
b) Add missing clock_gettime64() syscall

Helge Deller (2):
  linux-user: Add missing signals in strace output
  linux-user: Add missing clock_gettime64() syscall strace

 linux-user/signal-common.h | 46 +++++++++++++++++++++
 linux-user/signal.c        | 37 ++---------------
 linux-user/strace.c        | 84 +++++++++++++++++++++++++++++---------
 linux-user/strace.list     |  4 ++
 4 files changed, 117 insertions(+), 54 deletions(-)

=2D-
2.35.3


