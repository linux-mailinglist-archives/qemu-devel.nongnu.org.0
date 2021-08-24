Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B8EE3F5B2A
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 11:37:48 +0200 (CEST)
Received: from localhost ([::1]:41626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mISsN-0001Zz-BY
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 05:37:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhengchuan@huawei.com>)
 id 1mISrL-0000o6-RA
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 05:36:43 -0400
Received: from szxga08-in.huawei.com ([45.249.212.255]:2294)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhengchuan@huawei.com>)
 id 1mISrE-00035D-6a
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 05:36:43 -0400
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4Gv3rV33wZz1Cb5Y;
 Tue, 24 Aug 2021 17:35:54 +0800 (CST)
Received: from dggpeml500005.china.huawei.com (7.185.36.59) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 24 Aug 2021 17:36:26 +0800
Received: from [10.174.186.51] (10.174.186.51) by
 dggpeml500005.china.huawei.com (7.185.36.59) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 24 Aug 2021 17:36:25 +0800
Subject: Re: [PATCH V6 00/27] Live Update
To: Steven Sistare <steven.sistare@oracle.com>, <qemu-devel@nongnu.org>
References: <1628286241-217457-1-git-send-email-steven.sistare@oracle.com>
 <6d048286-eef4-0f6a-58da-7fc7369dccf7@huawei.com>
 <5e5821eb-ce92-f429-0ec8-985e714a171a@oracle.com>
From: Zheng Chuan <zhengchuan@huawei.com>
Message-ID: <83231acb-bbb5-f590-d58b-e664880c41f8@huawei.com>
Date: Tue, 24 Aug 2021 17:36:25 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <5e5821eb-ce92-f429-0ec8-985e714a171a@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.186.51]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpeml500005.china.huawei.com (7.185.36.59)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.255;
 envelope-from=zhengchuan@huawei.com; helo=szxga08-in.huawei.com
X-Spam_score_int: -61
X-Spam_score: -6.2
X-Spam_bar: ------
X-Spam_report: (-6.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.023,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>, "Michael
 S. Tsirkin" <mst@redhat.com>, Jason Zeng <jason.zeng@linux.intel.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi, Steve.

I think I have found the problem, it is because the rom_reset() during the cpr_exec will write dtb into the mach-virt.ram which cause the memory corruption.
Also I found in x86 the memoryregion of acpi also changed during rom_rest. Maybe we should keep it consistent and skip the rom_reset() like migration does.
Here is the patch drafted(Also fix the cpr state missing saving problem):

diff --git a/hw/core/loader.c b/hw/core/loader.c
index 5b34869a5417..1dcf0be1492f 100644
--- a/hw/core/loader.c
+++ b/hw/core/loader.c
@@ -50,6 +50,7 @@
 #include "hw/hw.h"
 #include "disas/disas.h"
 #include "migration/vmstate.h"
+#include "migration/cpr.h"
 #include "monitor/monitor.h"
 #include "sysemu/reset.h"
 #include "sysemu/sysemu.h"
@@ -1128,7 +1129,7 @@ static void rom_reset(void *unused)
          * the data in during the next incoming migration in all cases.  Note
          * that some of those RAMs can actually be modified by the guest.
          */
-        if (runstate_check(RUN_STATE_INMIGRATE)) {
+        if (runstate_check(RUN_STATE_INMIGRATE) || cpr_is_active()) {
             if (rom->data && rom->isrom) {
                 /*
                  * Free it so that a rom_reset after migration doesn't
diff --git a/include/migration/cpr.h b/include/migration/cpr.h
index e9b987f54319..0b7d7e9f6bf0 100644
--- a/include/migration/cpr.h
+++ b/include/migration/cpr.h
@@ -20,9 +20,11 @@ void cpr_save_fd(const char *name, int id, int fd);
 void cpr_delete_fd(const char *name, int id);
 int cpr_find_fd(const char *name, int id);
 int cpr_walk_fd(cpr_walk_fd_cb cb, void *handle);
-int cpr_state_save(Error **errp);
+int cpr_state_save(CprMode mode, Error **errp);
 int cpr_state_load(Error **errp);
 CprMode cpr_state_mode(void);
+void cpr_state_clear(void);
+bool cpr_is_active(void);
 void cpr_state_print(void);

 int cpr_vfio_save(Error **errp);
diff --git a/migration/cpr-state.c b/migration/cpr-state.c
index 003b449bbcf8..4ac08539d932 100644
--- a/migration/cpr-state.c
+++ b/migration/cpr-state.c
@@ -19,7 +19,7 @@ typedef struct CprState {
     CprNameList fds;            /* list of CprFd */
 } CprState;

-static CprState cpr_state;
+static CprState cpr_state = { .mode = CPR_MODE_NONE };

 /*************************************************************************/
 /* Generic list of names. */
@@ -149,7 +149,7 @@ static const VMStateDescription vmstate_cpr_state = {
     }
 };

-int cpr_state_save(Error **errp)
+int cpr_state_save(CprMode mode, Error **errp)
 {
     int ret, mfd;
     QEMUFile *f;
@@ -163,9 +163,11 @@ int cpr_state_save(Error **errp)
     qemu_clear_cloexec(mfd);
     f = qemu_fd_open(mfd, true, CPR_STATE_NAME);

+    cpr_state.mode = mode;
     ret = vmstate_save_state(f, &vmstate_cpr_state, &cpr_state, 0);
     if (ret) {
         error_setg(errp, "vmstate_save_state error %d", ret);
+        cpr_state.mode = CPR_MODE_NONE;
         return ret;
     }

@@ -205,6 +207,16 @@ CprMode cpr_state_mode(void)
     return cpr_state.mode;
 }

+void cpr_state_clear(void)
+{
+    cpr_state.mode = CPR_MODE_NONE;
+}
+
+bool cpr_is_active(void)
+{
+    return cpr_state.mode != CPR_MODE_NONE;
+}
+
 void cpr_state_print(void)
 {
     CprName *elem;
diff --git a/migration/cpr.c b/migration/cpr.c
index d14bc5ad2678..97b2293c01e8 100644
--- a/migration/cpr.c
+++ b/migration/cpr.c
@@ -115,7 +115,7 @@ void qmp_cpr_exec(strList *args, Error **errp)
         return;
     }
     cpr_walk_fd(preserve_fd, 0);
-    if (cpr_state_save(errp)) {
+    if (cpr_state_save(cpr_active_mode, errp)) {
         return;
     }
     vhost_dev_reset_all();
@@ -173,4 +173,5 @@ void qmp_cpr_load(const char *filename, Error **errp)

 out:
     cpr_active_mode = CPR_MODE_NONE;
+    cpr_state_clear();
 }


On 2021/8/24 5:36, Steven Sistare wrote:
> Hi Zheng, testing aarch64 is on our todo list. We will run this case and try to 
> reproduce the failure.  Thanks for the report.
> 
> - Steve
> 
> On 8/21/2021 4:54 AM, Zheng Chuan wrote:
>> Hi, steve
>>
>> It seems the VM will stuck after cpr-load on AArch64 environment？
>>
>> My AArch64 environment and test steps:
>> 1. linux kernel: 5.14-rc6
>> 2. QEMU version: v6.1.0-rc2 (patch your patchset), and configure with `../configure --target-list=aarch64-softmmu --disable-werror --enable-kvm` 4. Steps to live update:
>> # ./build/aarch64-softmmu/qemu-system-aarch64 -machine virt,accel=kvm,gic-version=3,memfd-alloc=on -nodefaults -cpu host -m 2G -smp 1 -drive file=/usr/share/edk2/aarch64/QEMU_EFI-pflash.raw,if=pflash,format=raw,readonly=on
>> -drive file=<path/to/vm.qcow2>,format=qcow2,if=none,id=drive_image1
>> -device virtio-blk-pci,id=image1,drive=drive_image1 -vnc :10 -device
>> virtio-gpu,id=video0 -device piix3-usb-uhci,id=usb -device
>> usb-tablet,id=input0,bus=usb.0,port=1 -device
>> usb-kbd,id=input1,bus=usb.0,port=2 -monitor stdio
>> (qemu) cpr-save /tmp/qemu.save restart
>> (qemu) cpr-exec ./build/aarch64-softmmu/qemu-system-aarch64 -machine virt,accel=kvm,gic-version=3,memfd-alloc=on -nodefaults -cpu host -m 2G -smp 1 -drive file=/usr/share/edk2/aarch64/QEMU_EFI-pflash.raw,if=pflash,format=raw,readonly=on
>> -drive file=<path/to/vm.qcow2>,format=qcow2,if=none,id=drive_image1
>> -device virtio-blk-pci,id=image1,drive=drive_image1 -vnc :10 -device
>> virtio-gpu,id=video0 -device piix3-usb-uhci,id=usb -device
>> usb-tablet,id=input0,bus=usb.0,port=1 -device
>> usb-kbd,id=input1,bus=usb.0,port=2 -monitor stdio -S
>> (qemu) QEMU 6.0.92 monitor - type 'help' for more information
>> (qemu) cpr-load /tmp/qemu.save
>>
>> Does I miss something?
>>
>> On 2021/8/7 5:43, Steve Sistare wrote:
>>> Provide the cpr-save, cpr-exec, and cpr-load commands for live update.
>>> These save and restore VM state, with minimal guest pause time, so that
>>> qemu may be updated to a new version in between.
>>>
>>> cpr-save stops the VM and saves vmstate to an ordinary file.  It supports
>>> any type of guest image and block device, but the caller must not modify
>>> guest block devices between cpr-save and cpr-load.  It supports two modes:
>>> reboot and restart.
>>>
>>> In reboot mode, the caller invokes cpr-save and then terminates qemu.
>>> The caller may then update the host kernel and system software and reboot.
>>> The caller resumes the guest by running qemu with the same arguments as the
>>> original process and invoking cpr-load.  To use this mode, guest ram must be
>>> mapped to a persistent shared memory file such as /dev/dax0.0, or /dev/shm
>>> PKRAM as proposed in https://lore.kernel.org/lkml/1617140178-8773-1-git-send-email-anthony.yznaga@oracle.com.
>>>
>>> The reboot mode supports vfio devices if the caller first suspends the
>>> guest, such as by issuing guest-suspend-ram to the qemu guest agent.  The
>>> guest drivers' suspend methods flush outstanding requests and re-initialize
>>> the devices, and thus there is no device state to save and restore.
>>>
>>> Restart mode preserves the guest VM across a restart of the qemu process.
>>> After cpr-save, the caller passes qemu command-line arguments to cpr-exec,
>>> which directly exec's the new qemu binary.  The arguments must include -S
>>> so new qemu starts in a paused state and waits for the cpr-load command.
>>> The restart mode supports vfio devices by preserving the vfio container,
>>> group, device, and event descriptors across the qemu re-exec, and by
>>> updating DMA mapping virtual addresses using VFIO_DMA_UNMAP_FLAG_VADDR and
>>> VFIO_DMA_MAP_FLAG_VADDR as defined in https://lore.kernel.org/kvm/1611939252-7240-1-git-send-email-steven.sistare@oracle.com/
>>> and integrated in Linux kernel 5.12.
>>>
>>> To use the restart mode, qemu must be started with the memfd-alloc option,
>>> which allocates guest ram using memfd_create.  The memfd's are saved to
>>> the environment and kept open across exec, after which they are found from
>>> the environment and re-mmap'd.  Hence guest ram is preserved in place,
>>> albeit with new virtual addresses in the qemu process.
>>>
>>> The caller resumes the guest by invoking cpr-load, which loads state from
>>> the file. If the VM was running at cpr-save time, then VM execution resumes.
>>> If the VM was suspended at cpr-save time (reboot mode), then the caller must
>>> issue a system_wakeup command to resume.
>>>
>>> The first patches add reboot mode:
>>>   - memory: qemu_check_ram_volatile
>>>   - migration: fix populate_vfio_info
>>>   - migration: qemu file wrappers
>>>   - migration: simplify savevm
>>>   - vl: start on wakeup request
>>>   - cpr: reboot mode
>>>   - cpr: reboot HMP interfaces
>>>
>>> The next patches add restart mode:
>>>   - memory: flat section iterator
>>>   - oslib: qemu_clear_cloexec
>>>   - machine: memfd-alloc option
>>>   - qapi: list utility functions
>>>   - vl: helper to request re-exec
>>>   - cpr: preserve extra state
>>>   - cpr: restart mode
>>>   - cpr: restart HMP interfaces
>>>   - hostmem-memfd: cpr for memory-backend-memfd
>>>
>>> The next patches add vfio support for restart mode:
>>>   - pci: export functions for cpr
>>>   - vfio-pci: refactor for cpr
>>>   - vfio-pci: cpr part 1 (fd and dma)
>>>   - vfio-pci: cpr part 2 (msi)
>>>   - vfio-pci: cpr part 3 (intx)
>>>
>>> The next patches preserve various descriptor-based backend devices across
>>> cprexec:
>>>   - vhost: reset vhost devices for cpr
>>>   - chardev: cpr framework
>>>   - chardev: cpr for simple devices
>>>   - chardev: cpr for pty
>>>   - chardev: cpr for sockets
>>>   - cpr: only-cpr-capable option
>>>
>>> Here is an example of updating qemu from v4.2.0 to v4.2.1 using
>>> restart mode.  The software update is performed while the guest is
>>> running to minimize downtime.
>>>
>>> window 1                                        | window 2
>>>                                                 |
>>> # qemu-system-x86_64 ...                        |
>>> QEMU 4.2.0 monitor - type 'help' ...            |
>>> (qemu) info status                              |
>>> VM status: running                              |
>>>                                                 | # yum update qemu
>>> (qemu) cpr-save /tmp/qemu.sav restart           |
>>> (qemu) cpr-exec qemu-system-x86_64 -S ...       |
>>> QEMU 4.2.1 monitor - type 'help' ...            |
>>> (qemu) info status                              |
>>> VM status: paused (prelaunch)                   |
>>> (qemu) cpr-load /tmp/qemu.sav                   |
>>> (qemu) info status                              |
>>> VM status: running                              |
>>>
>>>
>>> Here is an example of updating the host kernel using reboot mode.
>>>
>>> window 1                                        | window 2
>>>                                                 |
>>> # qemu-system-x86_64 ...mem-path=/dev/dax0.0 ...|
>>> QEMU 4.2.1 monitor - type 'help' ...            |
>>> (qemu) info status                              |
>>> VM status: running                              |
>>>                                                 | # yum update kernel-uek
>>> (qemu) cpr-save /tmp/qemu.sav restart           |
>>> (qemu) quit                                     |
>>>                                                 |
>>> # systemctl kexec                               |
>>> kexec_core: Starting new kernel                 |
>>> ...                                             |
>>>                                                 |
>>> # qemu-system-x86_64 -S mem-path=/dev/dax0.0 ...|
>>> QEMU 4.2.1 monitor - type 'help' ...            |
>>> (qemu) info status                              |
>>> VM status: paused (prelaunch)                   |
>>> (qemu) cpr-load /tmp/qemu.sav                   |
>>> (qemu) info status                              |
>>> VM status: running                              |
>>>
>>> Changes from V1 to V2:
>>>   - revert vmstate infrastructure changes
>>>   - refactor cpr functions into new files
>>>   - delete MADV_DOEXEC and use memfd + VFIO_DMA_UNMAP_FLAG_SUSPEND to
>>>     preserve memory.
>>>   - add framework to filter chardev's that support cpr
>>>   - save and restore vfio eventfd's
>>>   - modify cprinfo QMP interface
>>>   - incorporate misc review feedback
>>>   - remove unrelated and unneeded patches
>>>   - refactor all patches into a shorter and easier to review series
>>>
>>> Changes from V2 to V3:
>>>   - rebase to qemu 6.0.0
>>>   - use final definition of vfio ioctls (VFIO_DMA_UNMAP_FLAG_VADDR etc)
>>>   - change memfd-alloc to a machine option
>>>   - Use qio_channel_socket_new_fd instead of adding qio_channel_socket_new_fd
>>>   - close monitor socket during cpr
>>>   - fix a few unreported bugs
>>>   - support memory-backend-memfd
>>>
>>> Changes from V3 to V4:
>>>   - split reboot mode into separate patches
>>>   - add cprexec command
>>>   - delete QEMU_START_FREEZE, argv_main, and /usr/bin/qemu-exec
>>>   - add more checks for vfio and cpr compatibility, and recover after errors
>>>   - save vfio pci config in vmstate
>>>   - rename {setenv,getenv}_event_fd to {save,load}_event_fd
>>>   - use qemu_strtol
>>>   - change 6.0 references to 6.1
>>>   - use strerror(), use EXIT_FAILURE, remove period from error messages
>>>   - distribute MAINTAINERS additions to each patch
>>>
>>> Changes from V4 to V5:
>>>   - rebase to master
>>>
>>> Changes from V5 to V6:
>>>   vfio:
>>>   - delete redundant bus_master_enable_region in vfio_pci_post_load
>>>   - delete unmap.size warning
>>>   - fix phys_config memory leak
>>>   - add INTX support
>>>   - add vfio_named_notifier_init() helper
>>>   Other:
>>>   - 6.1 -> 6.2
>>>   - rename file -> filename in qapi
>>>   - delete cprinfo.  qapi introspection serves the same purpose.
>>>   - rename cprsave, cprexec, cprload -> cpr-save, cpr-exec, cpr-load
>>>   - improve documentation in qapi/cpr.json
>>>   - rename qemu_ram_volatile -> qemu_ram_check_volatile, and use
>>>     qemu_ram_foreach_block
>>>   - rename handle -> opaque
>>>   - use ERRP_GUARD
>>>   - use g_autoptr and g_autofree, and glib allocation functions
>>>   - conform to error conventions for bool and int function return values
>>>     and function names.
>>>   - remove word "error" in error messages
>>>   - rename as_flat_walk and its callback, and add comments.
>>>   - rename qemu_clr_cloexec -> qemu_clear_cloexec
>>>   - rename close-on-cpr -> reopen-on-cpr
>>>   - add strList utility functions
>>>   - factor out start on wakeup request to a separate patch
>>>   - deleted unnecessary layer (cprsave etc) and squashed QMP patches
>>>   - conditionally compile for CONFIG_VFIO
>>>
>>> Steve Sistare (24):
>>>   memory: qemu_check_ram_volatile
>>>   migration: fix populate_vfio_info
>>>   migration: qemu file wrappers
>>>   migration: simplify savevm
>>>   vl: start on wakeup request
>>>   cpr: reboot mode
>>>   memory: flat section iterator
>>>   oslib: qemu_clear_cloexec
>>>   machine: memfd-alloc option
>>>   qapi: list utility functions
>>>   vl: helper to request re-exec
>>>   cpr: preserve extra state
>>>   cpr: restart mode
>>>   cpr: restart HMP interfaces
>>>   hostmem-memfd: cpr for memory-backend-memfd
>>>   pci: export functions for cpr
>>>   vfio-pci: refactor for cpr
>>>   vfio-pci: cpr part 1 (fd and dma)
>>>   vfio-pci: cpr part 2 (msi)
>>>   vfio-pci: cpr part 3 (intx)
>>>   chardev: cpr framework
>>>   chardev: cpr for simple devices
>>>   chardev: cpr for pty
>>>   cpr: only-cpr-capable option
>>>
>>> Mark Kanda, Steve Sistare (3):
>>>   cpr: reboot HMP interfaces
>>>   vhost: reset vhost devices for cpr
>>>   chardev: cpr for sockets
>>>
>>>  MAINTAINERS                   |  12 ++
>>>  backends/hostmem-memfd.c      |  21 +--
>>>  chardev/char-mux.c            |   1 +
>>>  chardev/char-null.c           |   1 +
>>>  chardev/char-pty.c            |  14 +-
>>>  chardev/char-serial.c         |   1 +
>>>  chardev/char-socket.c         |  36 +++++
>>>  chardev/char-stdio.c          |   8 ++
>>>  chardev/char.c                |  43 +++++-
>>>  gdbstub.c                     |   1 +
>>>  hmp-commands.hx               |  50 +++++++
>>>  hw/core/machine.c             |  19 +++
>>>  hw/pci/msix.c                 |  20 ++-
>>>  hw/pci/pci.c                  |   7 +-
>>>  hw/vfio/common.c              |  79 +++++++++--
>>>  hw/vfio/cpr.c                 | 160 ++++++++++++++++++++++
>>>  hw/vfio/meson.build           |   1 +
>>>  hw/vfio/pci.c                 | 301 +++++++++++++++++++++++++++++++++++++++---
>>>  hw/vfio/trace-events          |   1 +
>>>  hw/virtio/vhost.c             |  11 ++
>>>  include/chardev/char.h        |   6 +
>>>  include/exec/memory.h         |  39 ++++++
>>>  include/hw/boards.h           |   1 +
>>>  include/hw/pci/msix.h         |   5 +
>>>  include/hw/pci/pci.h          |   2 +
>>>  include/hw/vfio/vfio-common.h |   8 ++
>>>  include/hw/virtio/vhost.h     |   1 +
>>>  include/migration/cpr.h       |  31 +++++
>>>  include/monitor/hmp.h         |   3 +
>>>  include/qapi/util.h           |  28 ++++
>>>  include/qemu/osdep.h          |   1 +
>>>  include/sysemu/runstate.h     |   2 +
>>>  include/sysemu/sysemu.h       |   1 +
>>>  linux-headers/linux/vfio.h    |   6 +
>>>  migration/cpr-state.c         | 215 ++++++++++++++++++++++++++++++
>>>  migration/cpr.c               | 176 ++++++++++++++++++++++++
>>>  migration/meson.build         |   2 +
>>>  migration/migration.c         |   5 +
>>>  migration/qemu-file-channel.c |  36 +++++
>>>  migration/qemu-file-channel.h |   6 +
>>>  migration/savevm.c            |  21 +--
>>>  migration/target.c            |  24 +++-
>>>  migration/trace-events        |   5 +
>>>  monitor/hmp-cmds.c            |  68 ++++++----
>>>  monitor/hmp.c                 |   3 +
>>>  monitor/qmp.c                 |   3 +
>>>  qapi/char.json                |   7 +-
>>>  qapi/cpr.json                 |  76 +++++++++++
>>>  qapi/meson.build              |   1 +
>>>  qapi/qapi-schema.json         |   1 +
>>>  qapi/qapi-util.c              |  37 ++++++
>>>  qemu-options.hx               |  40 +++++-
>>>  softmmu/globals.c             |   1 +
>>>  softmmu/memory.c              |  46 +++++++
>>>  softmmu/physmem.c             |  55 ++++++--
>>>  softmmu/runstate.c            |  38 +++++-
>>>  softmmu/vl.c                  |  18 ++-
>>>  stubs/cpr-state.c             |  15 +++
>>>  stubs/cpr.c                   |   3 +
>>>  stubs/meson.build             |   2 +
>>>  trace-events                  |   1 +
>>>  util/oslib-posix.c            |   9 ++
>>>  util/oslib-win32.c            |   4 +
>>>  util/qemu-config.c            |   4 +
>>>  64 files changed, 1732 insertions(+), 111 deletions(-)
>>>  create mode 100644 hw/vfio/cpr.c
>>>  create mode 100644 include/migration/cpr.h
>>>  create mode 100644 migration/cpr-state.c
>>>  create mode 100644 migration/cpr.c
>>>  create mode 100644 qapi/cpr.json
>>>  create mode 100644 stubs/cpr-state.c
>>>  create mode 100644 stubs/cpr.c
>>>
>>
> .
> 

-- 
Regards.
Chuan

