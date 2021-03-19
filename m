Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CADA341E2B
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 14:29:55 +0100 (CET)
Received: from localhost ([::1]:35654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNFCM-00049l-41
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 09:29:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lNF8Q-0000K3-0e; Fri, 19 Mar 2021 09:25:50 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:38965)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lNF8O-0003fZ-71; Fri, 19 Mar 2021 09:25:49 -0400
Received: from localhost.localdomain ([82.142.20.38]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1N4hex-1lnG4o2KAx-011gjB; Fri, 19 Mar 2021 14:25:41 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/6] iotests: fix failures with non-PCI machines
Date: Fri, 19 Mar 2021 14:25:31 +0100
Message-Id: <20210319132537.2046339-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:PzW1L1sYVskSkc0isfni0Xv9K6bHteWLS8oGS04pQWU66XAAA/I
 qoGPJwtI57TSFjjasS9xW5k8gNzwJlWD0vdsx0i1vgj2+1zTW2pQehvYP/y+WhgayvSDZ4m
 g/RRisCd/Ur+Hlh+VZGJ/7KQg6ptNQuOqNesE/7qQ2ol2aLswp3dQweVALqcU51MZSCdfFn
 PuwFbgz1A9zAeSgLARwdw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Vw8yU/Lpwc8=:IIauFs4a06FZFesBqk8Y8F
 Zp451PW4bQwLqNnpgdAI8Wjqqkj8UUVPv6wtVqI2khB04DuKX/OUSSZxm7YIn9dQC01o8ubbt
 DxQusC23n7dn4GYzsMaNbXxQk2aCFGBMGAaVHDXFrFJbfRZKCUUjOpk0aoH6Uc2dtpOtervzK
 G/OSZVIwUfADASAV97splVizOIwaoU374j/9tH2lIMDk55HDVXm0EXH7Jb0oQIUr9c7AA8O1j
 uTje/PEu8nGtzQGpcMTDFmzlGzSKg7Ccmj6Rikp6SGS+V1lBakVjSad7/REe71TyuUyELUZWp
 MncilQzkFjvcm+fTX3xaf9lN4zZNNpZLrwBnBETT4BRk5R45zFaRh7gGI49UszOQynYok3PH2
 muhgWQiJ2NiSSwC/yPNlbWSy/vDC1sPC2WGKVHN5XBqzTuqMW/WDjl9WOapYQAzUAFAqmyOMB
 rnwi8d9fTg==
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
v2:=0D
   Fix typos and comments=0D
   Don't define QEMU_ARCH_NO_PCI but QEMU_ARCH_VIRTIO_PCI,=0D
   QEMU_ARCH_VIRTIO_CCW and QEMU_ARCH_VIRTIO_MMIO=0D
   Update test 127 and 256 to run with ccw=0D
   Update .out of test 051=0D
   Add a patch to update "-drive if=3Dvirtio"=0D
=0D
Laurent Vivier (6):=0D
  qdev: define list of archs with virtio-pci or virtio-ccw=0D
  m68k: add the virtio devices aliases=0D
  blockdev: with -drive if=3Dvirtio, use generic virtio-blk=0D
  iotests: Revert "iotests: use -ccw on s390x for 040, 139, and 182"=0D
  iotests: test m68k with the virt machine=0D
  iotests: iothreads need ioeventfd=0D
=0D
 include/sysemu/arch_init.h    |  8 +++++=0D
 blockdev.c                    |  6 +---=0D
 softmmu/qdev-monitor.c        | 65 ++++++++++++++++++++---------------=0D
 tests/qemu-iotests/040        |  2 +-=0D
 tests/qemu-iotests/051        | 12 +------=0D
 tests/qemu-iotests/051.out    |  2 +-=0D
 tests/qemu-iotests/051.pc.out |  2 +-=0D
 tests/qemu-iotests/068        |  4 +--=0D
 tests/qemu-iotests/093        |  3 +-=0D
 tests/qemu-iotests/127        |  3 +-=0D
 tests/qemu-iotests/139        |  9 ++---=0D
 tests/qemu-iotests/182        | 13 ++-----=0D
 tests/qemu-iotests/238        |  4 +--=0D
 tests/qemu-iotests/240        | 10 +++---=0D
 tests/qemu-iotests/256        |  6 ++--=0D
 tests/qemu-iotests/257        |  4 +--=0D
 tests/qemu-iotests/307        |  4 +--=0D
 tests/qemu-iotests/iotests.py | 10 +++---=0D
 tests/qemu-iotests/testenv.py |  1 +=0D
 19 files changed, 77 insertions(+), 91 deletions(-)=0D
=0D
-- =0D
2.30.2=0D
=0D

