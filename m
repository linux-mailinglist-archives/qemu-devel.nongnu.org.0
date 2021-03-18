Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A9FA34106F
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 23:41:35 +0100 (CET)
Received: from localhost ([::1]:41700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lN1Ke-0005Rf-9h
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 18:41:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lN1Ia-0003yD-OV; Thu, 18 Mar 2021 18:39:24 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:33725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lN1IY-0003xG-V7; Thu, 18 Mar 2021 18:39:24 -0400
Received: from localhost.localdomain ([82.142.20.38]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1Mj8a5-1lsU5p02R3-00f90o; Thu, 18 Mar 2021 23:39:16 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/4] iotests: fix failures with non-PCI machines
Date: Thu, 18 Mar 2021 23:39:03 +0100
Message-Id: <20210318223907.1344870-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.30.2
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:abnz19YEvSr/vGt22n47CU3LB98/kJV0Fxmkq4Qo/5kOu3u6wpZ
 cbXcO5uxQn+jdEaEYuMbNTCOGmbncgmKkFmoTr0t9OTBsJZHnHjQYvzBGcjckdrpOjB6ZIP
 orYN+j/CR+r3F9P6XWyb1/8pCBErRHxCSCLRgtO57WRAnhxgyBJbeb5uADGgXSI5NYuZ8WG
 iij1Xqa41TxlwL2GBxUmQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:YMnnAUGAjJQ=:VeVjedvwG4LMZbuablWvfe
 KQKljedAic4pR+kz2yif87mjNErrJHKD/8mw0OScMS0FwTVCCnsqJ4d7YYMSJhfVfTxu2jrxh
 1mcJyG8Ono3XcaJdgEPhgUr1UqbysIx5g4l3oC8t0A+o1iXp5RLEbyCVdneeITbGOQ/Z3tKkS
 x4MMfz5tmlABzF8RD+YCj8EJM7JXRNh0xUqyWEMLwiF2jK0fUYXMPet7A5UNffN9W37+hdm84
 7P+JEMfYE0eCBx3DG4bIfxHh6TCsaOveQ1Fu9v3pqJWEHYjwEjCvevjXjb4CToGm3ZM51xuEX
 kxunJjkCX7O3b3layIWqTiw62KMmTdJdBFriVzlts8IybAtaddDhd4ntx25pbhbqdXtcBupQ6
 OoEpEMR3nhfRWeRMbjSrzI56tAClULcHe2ZzpT5ZPqYEDxMjq5xh8l4l2x/tB5N7wPSa/+DPj
 LxULFCpTLg==
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Max Reitz <mreitz@redhat.com>, qemu-s390x@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Tests are executed using virtio-*-pci even on a non PCI machine.=0D
=0D
The problem can be easily fixed using the virtio aliases=0D
(virtio-*), to run virtio-*-ccw on s390x and virtio-*-device on=0D
m68k.=0D
=0D
A first attempt was tried with virtio-*-ccw by detecting=0D
the machine type, this series removes it to use the aliases that=0D
are a cleaner approach.=0D
=0D
Laurent Vivier (4):=0D
  m68k: add the virtio devices aliases=0D
  iotests: Revert "iotests: use -ccw on s390x for 040, 139, and 182"=0D
  iotests: test m68k with the virt machine=0D
  iotests: iothreads need ioeventfd=0D
=0D
 blockdev.c                    |  6 +----=0D
 softmmu/qdev-monitor.c        | 46 +++++++++++++++++++++++------------=0D
 tests/qemu-iotests/040        |  2 +-=0D
 tests/qemu-iotests/051        | 12 +--------=0D
 tests/qemu-iotests/068        |  4 +--=0D
 tests/qemu-iotests/093        |  3 +--=0D
 tests/qemu-iotests/127        |  4 +--=0D
 tests/qemu-iotests/139        |  9 ++-----=0D
 tests/qemu-iotests/182        | 13 ++--------=0D
 tests/qemu-iotests/238        |  4 +--=0D
 tests/qemu-iotests/240        | 10 ++++----=0D
 tests/qemu-iotests/256        |  2 ++=0D
 tests/qemu-iotests/257        |  4 +--=0D
 tests/qemu-iotests/307        |  4 +--=0D
 tests/qemu-iotests/iotests.py | 10 ++++----=0D
 tests/qemu-iotests/testenv.py |  1 +=0D
 16 files changed, 58 insertions(+), 76 deletions(-)=0D
=0D
-- =0D
2.30.2=0D
=0D

