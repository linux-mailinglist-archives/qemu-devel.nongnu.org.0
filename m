Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 648506D7C07
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Apr 2023 13:56:11 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pk1j8-00061n-BO; Wed, 05 Apr 2023 07:54:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1pk1j5-00060z-8o; Wed, 05 Apr 2023 07:54:55 -0400
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1pk1j3-0002AJ-2t; Wed, 05 Apr 2023 07:54:54 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 9DAFB4000E;
 Wed,  5 Apr 2023 14:54:48 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id D44C0DD;
 Wed,  5 Apr 2023 14:54:47 +0300 (MSK)
Message-ID: <62db7253-9cd7-e095-6b9f-ffcdecfa9bf6@msgid.tls.msk.ru>
Date: Wed, 5 Apr 2023 14:54:47 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
To: QEMU Developers <qemu-devel@nongnu.org>,
 qemu-stable <qemu-stable@nongnu.org>
Cc: Michael Roth <michael.roth@amd.com>
From: Michael Tokarev <mjt@tls.msk.ru>
Subject: QEMU stable 7.2.1
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

So let it be, with a delay of about a week.

Since no one from the qemu team replied to my final-release steps, I'm
making it available on my site instead:

   http://www.corpit.ru/mjt/qemu/qemu-7.2.1.tar.xz
   http://www.corpit.ru/mjt/qemu/qemu-7.2.1.tar.xz.sig - signed with my GPG key
   http://www.corpit.ru/mjt/qemu/qemu-7.2.1.diff - whole difference from 7.2.0.

The tag (v7.2.1) is in the main qemu repository.

The shortlog:

Akihiko Odaki (4):
       vhost-user-gpio: Configure vhost_dev when connecting
       vhost-user-i2c: Back up vqs before cleaning up vhost_dev
       vhost-user-rng: Back up vqs before cleaning up vhost_dev
       hw/timer/hpet: Fix expiration time overflow

Alex Bennée (2):
       target/arm: fix handling of HLT semihosting in system mode
       tests/tcg: fix unused variable in linux-test

Anton Johansson (1):
       block: Handle curl 7.55.0, 7.85.0 version changes

Carlos López (2):
       vhost: avoid a potential use of an uninitialized variable in vhost_svq_poll()
       libvhost-user: check for NULL when allocating a virtqueue element

Chenyi Qiang (2):
       virtio-mem: Fix the bitmap index of the section offset
       virtio-mem: Fix the iterator variable in a vmem->rdl_list loop

David Hildenbrand (2):
       migration/ram: Fix error handling in ram_write_tracking_start()
       migration/ram: Fix populate_read_range()

Dr. David Alan Gilbert (2):
       virtio-rng-pci: fix migration compat for vectors
       virtio-rng-pci: fix transitional migration compat for vectors

Eugenio Pérez (1):
       vdpa: stop all svq on device deletion

Evgeny Iakovlev (1):
       target/arm: allow writes to SCR_EL3.HXEn bit when FEAT_HCX is enabled

Guenter Roeck (1):
       target/sh4: Mask restore of env->flags from tb->flags

Jason Wang (3):
       vhost: fix vq dirty bitmap syncing when vIOMMU is enabled
       intel-iommu: fail MAP notifier without caching mode
       intel-iommu: fail DEVIOTLB_UNMAP without dt mode

Julia Suvorova (1):
       hw/smbios: fix field corruption in type 4 table

Kevin Wolf (1):
       qcow2: Fix theoretical corruption in store_bitmap() error path

Klaus Jensen (2):
       hw/nvme: fix missing endian conversions for doorbell buffers
       hw/nvme: fix missing cq eventidx update

Laszlo Ersek (1):
       acpi: cpuhp: fix guest-visible maximum access size to the legacy reg block

Marc-André Lureau (1):
       build-sys: fix crlf-ending C code

Michael S. Tsirkin (6):
       Revert "x86: do not re-randomize RNG seed on snapshot load"
       Revert "x86: re-initialize RNG seed when selecting kernel"
       Revert "x86: reinitialize RNG seed on system reboot"
       Revert "x86: use typedef for SetupData struct"
       Revert "x86: return modified setup_data only if read as memory, not as file"
       Revert "hw/i386: pass RNG seed via setup_data entry"

Michael Tokarev (1):
       Update version for 7.2.1 release

Paolo Bonzini (4):
       meson: accept relative symlinks in "meson introspect --installed" data
       configure: fix GLIB_VERSION for cross-compilation
       target/i386: fix ADOX followed by ADCX
       block/iscsi: fix double-free on BUSY or similar statuses

Richard Henderson (8):
       target/riscv: Set pc_succ_insn for !rvc illegal insn
       target/arm: Fix sve_probe_page
       target/arm: Fix in_debug path in S1_ptw_translate
       target/arm: Fix physical address resolution for Stage2
       tests/tcg/i386: Introduce and use reg_t consistently
       target/i386: Fix BEXTR instruction
       target/i386: Fix C flag for BLSI, BLSMSK, BLSR
       target/i386: Fix BZHI instruction

Stefan Hajnoczi (1):
       block: fix detect-zeroes= with BDRV_REQ_REGISTERED_BUF

Yajun Wu (1):
       chardev/char-socket: set s->listener = NULL in char_socket_finalize

I want to make another release of 7.2 series.

Thank you all for all the help with this series!

/mjt

