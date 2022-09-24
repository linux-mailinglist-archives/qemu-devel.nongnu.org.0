Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAFF15E8BE3
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Sep 2022 13:49:36 +0200 (CEST)
Received: from localhost ([::1]:34070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oc3f5-0007aC-Pf
	for lists+qemu-devel@lfdr.de; Sat, 24 Sep 2022 07:49:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oc3at-0004Lg-Mq
 for qemu-devel@nongnu.org; Sat, 24 Sep 2022 07:45:15 -0400
Received: from mout.gmx.net ([212.227.15.15]:49911)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oc3an-0003Qo-Un
 for qemu-devel@nongnu.org; Sat, 24 Sep 2022 07:45:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1664019904;
 bh=ANyt56qS/RzCjRkI8a3Gu7jaV66eRYSr+HV0JEmvrKE=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=P85+yh8w1W9Ebo8hdr2YzU3VNWKn5eHP3D22hks1F2LbW4VT+UnI4DgQH9s3cYedz
 KT8JE/UQLZWeAHxqRX2jpEVnUVkl3j1t8uafRPifKjJpgsMiSlNKYbzFiPDAy2DwHD
 PTKpKZ6txYB2b9ZwEPh/Cd3/PQ1yAgHfaWuSv64k=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.155.187]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MvbFs-1pQzig17e2-00siP2; Sat, 24
 Sep 2022 13:45:04 +0200
From: Helge Deller <deller@gmx.de>
To: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
Cc: Helge Deller <deller@gmx.de>
Subject: [PATCH 0/7] linux-user fixes for hppa target - part 2
Date: Sat, 24 Sep 2022 13:44:54 +0200
Message-Id: <20220924114501.21767-1-deller@gmx.de>
X-Mailer: git-send-email 2.37.3
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:GEDFNQ+57mcGH5C2sAs3FC0fbrMeO9mr5LsMvwSEV+sT2YwKhjR
 k8YjF3cKQN7tDUjTBon75fhz2W6Yaw+FCz3b2r7x3gWTYaWBSdKSo0/efD5n62h2ABXTdyu
 2fqRNWJA0qmgl+FrCr8CIA91T6gxPYueONxIiWmnCjaXbXPAEQ8c7GvbYLR+qeUrVQcNQg+
 xhMA1i0XP2EG17Z6NyNlg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:nrU7oBjvLNM=:xvkoxuTxx84YUF2xWsqnsF
 yWM3bTeGBTY51TcSyzK+lLvkar9XkKaT9Ut6CJb9dxHxz5WBPZpaXaSLOsVDWD07wLJhSd7gz
 yQm0jTSQ3mBXcwMROuLJiOAWu+IksN7XWh7Py6jgT6pv1Xomefoc+83LSHg2rPJZqYMjVspSJ
 QbUUQq4dcPMUP3kuBbVZo8SJGPkxKo4xKKUstmATGkmUeFqdlTnv7UtvMKMlS5R2TKhXvmONr
 1gLJLhp9n3itmHf7+eRXtvIWJJlNkQ7GH+YViOqa66kdHtewS9r517Ci2gqmy6xv8xR0mUDt/
 gw+1pfVtlA+2E6+PsdRxq/9iTG97SS+Vn+f+uCRmhOiLU31IlBA1LWF3DrECo7wpynee39M7R
 O6I17qKv4FeCktOBezMqRR+0QwCvS7fIP8zo2Z1mCGQo1Tg1+otrtvzxIfPPjTYjnM7ZmGPeW
 yX+aeufTb8UZ04rRxQVnw7G1gyN2M59Pf+CS3FPBN3j8lCLF7HyPF9rjqP/6ngN8O6HWU68SC
 m3F0oOeuuUa9YiPAuxlQmcIHSbOO1KwPzV6tmlo2OdGbM2ZPsv4BsuFOXyg0JuPBXQZk0mSHj
 lxGnS45WTmXgQf59fUI6ON1FAO+OO/9SzzvO//x7jK6Pn63IyeHB7OuOkLNR9E4VNcsvjQXYn
 3bPNX5trwbOE0ox/eHhMN1MteqoZHNOTGkNdU9zxaOkWHRpZioLRcNQ7zXNB4Q2UdmHrUvqCC
 B2JxldiUMfjsZPDTLsa0KYG+KH6NfT1OqHR/Xo61XhaX8mDeRLK844UyuBdVo2lNKuvIi8jjg
 JzYxK5/dYUqy2RtTyTsJ9YsMakAZ/Cws+HzSHBROMHX9LLi8grvZd33XcqZA+tiQAd9jS9J3d
 8FIYpmuPJ3p1yBCmMy6QLK18grAfuac68zi0UUIR+PZDT1tkaBoZE7fqqbsA3j3X5IdWGJpk3
 sErqfClaCJ6PdjVRbf+Yk+0zaP/UPDht6zZt2IJsNy2I8eo0wyuBq7QlfFhJBpWoFrD7ct1SY
 sSF8LrLyTgUjBUSvxzkOVEVvFDxQToY3Ga36+caJ0StG0cGhNjdAa5XZtbbFxeAJbhR7EFTIa
 AS5J82EiMX3m6twQMP5FeGWyGF1eft2QtGB0hMe5VTwhuED8UL8uE2/Rvt05DTfBjSGrE1uXs
 kie/6RXASxbOS08KHgAQLL9do5
Received-SPF: pass client-ip=212.227.15.15; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Some additional patches for linux-user, which mostly target
the hppa platform.
This series is on top of my previous posted patch series.

Please review.

Helge

Helge Deller (7):
  linux-user: Fix TARGET_PROT_SEM for XTENSA
  linux-user: Add proper strace format strings for
    getdents()/getdents64()
  linux-user/hppa: Add signal trampoline for hppa target
  linux-user/hppa: Drop stack guard page on hppa target
  linux-user/hppa: Increase guest stack size to 80MB for hppa target
  linux-user/hppa: Allow PROT_GROWSUP and PROT_GROWSDOWN in mprotect()
  linux-user/hppa: Fix setup_sigcontext()

 linux-user/elfload.c             | 13 +++++---
 linux-user/hppa/signal.c         | 57 +++++++++++++++++++-------------
 linux-user/hppa/target_signal.h  | 14 +-------
 linux-user/hppa/target_syscall.h |  2 ++
 linux-user/main.c                |  9 +++--
 linux-user/mmap.c                |  2 ++
 linux-user/strace.list           |  4 +--
 linux-user/syscall.c             |  4 +++
 linux-user/syscall_defs.h        |  2 +-
 9 files changed, 62 insertions(+), 45 deletions(-)

=2D-
2.37.3


