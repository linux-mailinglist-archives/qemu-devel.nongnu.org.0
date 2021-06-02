Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B06AF398322
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 09:38:07 +0200 (CEST)
Received: from localhost ([::1]:58812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loLS2-0002FP-8C
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 03:38:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1loLQK-00087H-ON
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 03:36:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38903)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1loLQH-0003hF-6i
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 03:36:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622619375;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=TfStD3XDTdFxH+pXC9r07dK4fKc1ulQrWQGyRUgHhLY=;
 b=I9jM4iGnGQm5j6a60tXFo0c85HTAU4iOwQRkkO8jNuBqrkDg8/0Gv1iiTnT2f7a0Rt4dsm
 3tlZIeGQFCGeWz54zF1CVa95Dx417bx2fwCVwtz+OQj2nGEjoB5zXk6rpF0BPdpN2PShxk
 t4ZGAbNMkgTzAiK36wIxYWeR4fNeo5o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-281-Dycdxi2_Pn6ZbnkEm1zvZQ-1; Wed, 02 Jun 2021 03:36:11 -0400
X-MC-Unique: Dycdxi2_Pn6ZbnkEm1zvZQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A93B48018A7;
 Wed,  2 Jun 2021 07:36:10 +0000 (UTC)
Received: from thuth.com (ovpn-112-40.ams2.redhat.com [10.36.112.40])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 396365C737;
 Wed,  2 Jun 2021 07:36:08 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 00/17] doc updates and CentOS 7 removal
Date: Wed,  2 Jun 2021 09:35:49 +0200
Message-Id: <20210602073606.338994-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

 Hi Peter!

The following changes since commit 52848929b70dcf92a68aedcfd90207be81ba3274:

  Merge remote-tracking branch 'remotes/kraxel/tags/usb-20210528-pull-request' into staging (2021-05-30 20:10:30 +0100)

are available in the Git repository at:

  https://gitlab.com/thuth/qemu.git tags/pull-request-2021-06-02

for you to fetch changes up to 2a85a08c998e418a46a308095893f223642f6fc9:

  configure: bump min required CLang to 6.0 / XCode 10.0 (2021-06-02 09:11:32 +0200)

----------------------------------------------------------------
* Update the references to some doc files (use *.rst instead of *.txt)
* Bump minimum versions of some requirements after removing CentOS 7 support
----------------------------------------------------------------

Daniel P. Berrangé (11):
      patchew: move quick build job from CentOS 7 to CentOS 8 container
      crypto: bump min nettle to 3.4, dropping RHEL-7 support
      crypto: drop back compatibility typedefs for nettle
      crypto: bump min gcrypt to 1.8.0, dropping RHEL-7 support
      crypto: bump min gnutls to 3.5.18, dropping RHEL-7 support
      crypto: drop used conditional check
      tests/vm: convert centos VM recipe to CentOS 8
      tests/docker: drop CentOS 7 container
      configure: bump min required glib version to 2.56
      configure: bump min required GCC to 7.5.0
      configure: bump min required CLang to 6.0 / XCode 10.0

Stefano Garzarella (5):
      docs: fix references to docs/devel/tracing.rst
      docs: fix references to docs/devel/atomics.rst
      docs: fix references to docs/devel/build-system.rst
      docs: fix references to docs/specs/tpm.rst
      docs: fix references to docs/devel/s390-dasd-ipl.rst

Thomas Huth (1):
      block/ssh: Bump minimum libssh version to 0.8.7

 .gitlab-ci.d/buildtest.yml              |  35 ------
 .gitlab-ci.d/containers.yml             |   5 -
 .patchew.yml                            |   6 +-
 MAINTAINERS                             |   4 +-
 accel/kvm/trace-events                  |   2 +-
 accel/tcg/trace-events                  |   2 +-
 audio/trace-events                      |   2 +-
 authz/trace-events                      |   2 +-
 backends/tpm/trace-events               |   2 +-
 backends/trace-events                   |   2 +-
 block/ssh.c                             |  59 ---------
 block/trace-events                      |   2 +-
 chardev/trace-events                    |   2 +-
 configure                               |  59 ++-------
 crypto/cipher-nettle.c.inc              |  91 ++++----------
 crypto/hash-nettle.c                    |  10 +-
 crypto/hmac-nettle.c                    |  12 +-
 crypto/meson.build                      |   6 +-
 crypto/tlscredsx509.c                   |   2 -
 crypto/trace-events                     |   2 +-
 docs/devel/lockcnt.txt                  |   2 +-
 hw/9pfs/trace-events                    |   2 +-
 hw/acpi/tpm.c                           |   2 +-
 hw/acpi/trace-events                    |   2 +-
 hw/adc/trace-events                     |   2 +-
 hw/alpha/trace-events                   |   2 +-
 hw/arm/trace-events                     |   2 +-
 hw/audio/trace-events                   |   2 +-
 hw/block/dataplane/trace-events         |   2 +-
 hw/block/trace-events                   |   2 +-
 hw/char/trace-events                    |   2 +-
 hw/display/trace-events                 |   2 +-
 hw/dma/trace-events                     |   2 +-
 hw/gpio/trace-events                    |   2 +-
 hw/hppa/trace-events                    |   2 +-
 hw/i2c/trace-events                     |   2 +-
 hw/i386/trace-events                    |   2 +-
 hw/i386/xen/trace-events                |   2 +-
 hw/ide/trace-events                     |   2 +-
 hw/input/trace-events                   |   2 +-
 hw/intc/trace-events                    |   2 +-
 hw/isa/trace-events                     |   2 +-
 hw/mem/trace-events                     |   2 +-
 hw/misc/macio/trace-events              |   2 +-
 hw/misc/trace-events                    |   2 +-
 hw/net/trace-events                     |   2 +-
 hw/nvram/trace-events                   |   2 +-
 hw/pci-host/trace-events                |   2 +-
 hw/pci/trace-events                     |   2 +-
 hw/ppc/trace-events                     |   2 +-
 hw/rdma/trace-events                    |   2 +-
 hw/rdma/vmw/trace-events                |   2 +-
 hw/rtc/trace-events                     |   2 +-
 hw/s390x/trace-events                   |   2 +-
 hw/scsi/trace-events                    |   2 +-
 hw/sd/trace-events                      |   2 +-
 hw/sparc/trace-events                   |   2 +-
 hw/sparc64/trace-events                 |   2 +-
 hw/timer/trace-events                   |   2 +-
 hw/tpm/tpm_ppi.c                        |   2 +-
 hw/tpm/trace-events                     |   2 +-
 hw/usb/trace-events                     |   2 +-
 hw/vfio/trace-events                    |   2 +-
 hw/virtio/trace-events                  |   2 +-
 hw/watchdog/trace-events                |   2 +-
 hw/xen/trace-events                     |   2 +-
 include/glib-compat.h                   |  13 +-
 include/qemu/atomic.h                   |   4 +-
 include/qemu/atomic128.h                |   2 +-
 io/trace-events                         |   2 +-
 linux-user/trace-events                 |   2 +-
 migration/trace-events                  |   2 +-
 monitor/trace-events                    |   2 +-
 nbd/trace-events                        |   2 +-
 net/trace-events                        |   2 +-
 pc-bios/s390-ccw/dasd-ipl.c             |   2 +-
 qapi/trace-events                       |   2 +-
 qom/trace-events                        |   2 +-
 scripts/simpletrace.py                  |   2 +-
 scsi/trace-events                       |   2 +-
 softmmu/trace-events                    |   2 +-
 target/arm/trace-events                 |   2 +-
 target/hppa/trace-events                |   2 +-
 target/i386/kvm/trace-events            |   2 +-
 target/i386/trace-events                |   2 +-
 target/mips/trace-events                |   2 +-
 target/ppc/trace-events                 |   2 +-
 target/s390x/trace-events               |   2 +-
 target/sparc/trace-events               |   2 +-
 tcg/README                              |   2 +-
 tests/docker/dockerfiles/centos7.docker |  43 -------
 tests/qapi-schema/meson.build           |   2 +-
 tests/vm/centos                         |  17 ++-
 trace-events                            |   2 +-
 ui/trace-events                         |   2 +-
 util/oslib-win32.c                      | 204 --------------------------------
 util/trace-events                       |   2 +-
 97 files changed, 141 insertions(+), 591 deletions(-)
 delete mode 100644 tests/docker/dockerfiles/centos7.docker


