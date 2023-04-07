Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B2906DB1B7
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Apr 2023 19:37:11 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkpzw-0002eA-Kx; Fri, 07 Apr 2023 13:35:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mgalaxy@akamai.com>)
 id 1pkpzu-0002Zq-9q
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 13:35:38 -0400
Received: from mx0b-00190b01.pphosted.com ([2620:100:9005:57f::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mgalaxy@akamai.com>)
 id 1pkpzq-0003ka-JR
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 13:35:37 -0400
Received: from pps.filterd (m0122330.ppops.net [127.0.0.1])
 by mx0b-00190b01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 337C6cWi028217; Fri, 7 Apr 2023 18:35:29 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=akamai.com;
 h=message-id : date :
 mime-version : subject : to : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=jan2016.eng;
 bh=W/cmAC74OtzU8HA1UNn1mI4ScGdAiutshC9wh8k+izk=;
 b=Im4OMzYpoeROGQSzFFSiFJ3vLsuxNJVgJmfNoGEuEYR7XkF5PYhrD2DruTqcDaEXDR7O
 elzRSoFmwlNPgB9qpAJDuepUpVJUdUMroaCro3MC2ahW4xjg5NvpDrHOXnuqewBCthYK
 M94s45pyowYhht0i13ob4R87eAlLLUaewliOcqqtKXrhshi89XSj2M6VOQbmq3VHNzWz
 25JHHz7sl6UtnckLQ85o0xeMsfwfBY4fB8p1GfBTqenB8ZTWf0PQdZGhdp5JyCEr0T8B
 vJDkYMY/K+p37SgAViqPzQoBGcMJ5ySM2yzS+fCDHJe3RDPR5mm+h7neCKFDVWq4gVzv EQ== 
Received: from prod-mail-ppoint5 (prod-mail-ppoint5.akamai.com [184.51.33.60]
 (may be forged))
 by mx0b-00190b01.pphosted.com (PPS) with ESMTPS id 3pscq73cmc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Apr 2023 18:35:29 +0100
Received: from pps.filterd (prod-mail-ppoint5.akamai.com [127.0.0.1])
 by prod-mail-ppoint5.akamai.com (8.17.1.19/8.17.1.19) with ESMTP id
 337Ea3eD026452; Fri, 7 Apr 2023 10:35:28 -0700
Received: from prod-mail-relay11.akamai.com ([172.27.118.250])
 by prod-mail-ppoint5.akamai.com (PPS) with ESMTP id 3pqwfkbd7b-1;
 Fri, 07 Apr 2023 10:35:28 -0700
Received: from [172.19.69.105] (dfw-lpsukzs4.dfw02.corp.akamai.com
 [172.19.69.105])
 by prod-mail-relay11.akamai.com (Postfix) with ESMTP id 34BA530E12;
 Fri,  7 Apr 2023 17:35:28 +0000 (GMT)
Message-ID: <e7ca7637-0bd6-d52c-c260-8d7e37cc1753@akamai.com>
Date: Fri, 7 Apr 2023 12:35:28 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH V9 00/46] Live Update
Content-Language: en-US
To: Steven Sistare <steven.sistare@oracle.com>, qemu-devel@nongnu.org
References: <1658851843-236870-1-git-send-email-steven.sistare@oracle.com>
 <53075574-9e73-f773-ccb1-cca42a719801@oracle.com>
From: Michael Galaxy <mgalaxy@akamai.com>
In-Reply-To: <53075574-9e73-f773-ccb1-cca42a719801@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-07_11,2023-04-06_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 bulkscore=0
 mlxlogscore=999 mlxscore=0 spamscore=0 suspectscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304070157
X-Proofpoint-ORIG-GUID: FkQ0QyV-JpGOgHIoagHby41TeBGvXLxJ
X-Proofpoint-GUID: FkQ0QyV-JpGOgHIoagHby41TeBGvXLxJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-07_11,2023-04-06_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 lowpriorityscore=0
 phishscore=0 mlxlogscore=999 bulkscore=0 malwarescore=0 adultscore=0
 impostorscore=0 spamscore=0 mlxscore=0 suspectscore=0 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2304070157
Received-SPF: pass client-ip=2620:100:9005:57f::1;
 envelope-from=mgalaxy@akamai.com; helo=mx0b-00190b01.pphosted.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.03, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hey Steven,

Have you done any "back-to-back" live update testing before?

I am still doing extensive testing on this myself. I am running into a 
bug that I have not yet diagnosed.

It involves the following:

1. Perform a live update (I'm using kexec + PMEM-based live updates). => 
VM comes back just fine. All is well.
2. Using the *same* QEMU instance: Try to perform another live update 
agaig,
this results in the following error:

monitor> migrate_incoming file:qemu.sav
qemu-system-x86_64: check_section_footer: Read section footer failed: -5
qemu-system-x86_64: load of migration failed: Invalid argument

I'm going to start diving into the code soon, but just thought I would 
ask first.

- Michael

On 12/7/22 09:48, Steven Sistare wrote:

> This series desperately needs review in its intersection with live migration.
> The code in other areas has been reviewed and revised multiple times -- thank you!
>
> David, Juan, can you spare some time to review this?  I have done my best to order
> the patches logically (see the labelled groups in this email), and to provide
> complete and clear cover letter and commit messages. Can I do anything to facilitate,
> like doing a code walk through via zoom?
>
> And of course, I welcome anyone's feedback.
>
> Here is the original posting.
>
> https://urldefense.com/v3/__https://lore.kernel.org/qemu-devel/1658851843-236870-1-git-send-email-steven.sistare@oracle.com/__;!!GjvTz_vk!U6U0yYHuO4GRyGQUNpn0TQdwlC2QjJfgYC0yE249AuONq8-5rs48pZ6l0K-LOSRHMA9cU2op2U8GC9hU3EAFRUVu$
>
> - Steve
>
> On 7/26/2022 12:09 PM, Steve Sistare wrote:
>> This version of the live update patch series integrates live update into the
>> live migration framework.  The new interfaces are:
>>    * mode (migration parameter)
>>    * cpr-exec-args (migration parameter)
>>    * file (migration URI)
>>    * migrate-mode-enable (command-line argument)
>>    * only-cpr-capable (command-line argument)
>>
>> Provide the cpr-exec and cpr-reboot migration modes for live update.  These
>> save and restore VM state, with minimal guest pause time, so that qemu may be
>> updated to a new version in between.  The caller sets the mode parameter
>> before invoking the migrate or migrate-incoming commands.
>>
>> In cpr-reboot mode, the migrate command saves state to a file, allowing
>> one to quit qemu, reboot to an updated kernel, start an updated version of
>> qemu, and resume via the migrate-incoming command.  The caller must specify
>> a migration URI that writes to and reads from a file.  Unlike normal mode,
>> the use of certain local storage options does not block the migration, but
>> the caller must not modify guest block devices between the quit and restart.
>> The guest RAM memory-backend must be shared, and the @x-ignore-shared
>> migration capability must be set, to avoid saving it to the file.  Guest RAM
>> must be non-volatile across reboot, which can be achieved by backing it with
>> a dax device, or /dev/shm PKRAM as proposed in
>> https://urldefense.com/v3/__https://lore.kernel.org/lkml/1617140178-8773-1-git-send-email-anthony.yznaga@oracle.com__;!!GjvTz_vk!U6U0yYHuO4GRyGQUNpn0TQdwlC2QjJfgYC0yE249AuONq8-5rs48pZ6l0K-LOSRHMA9cU2op2U8GC9hU3AKRJQux$
>> but this is not enforced.  The restarted qemu arguments must match those used
>> to initially start qemu, plus the -incoming option.
>>
>> The reboot mode supports vfio devices if the caller first suspends the guest,
>> such as by issuing guest-suspend-ram to the qemu guest agent.  The guest
>> drivers' suspend methods flush outstanding requests and re-initialize the
>> devices, and thus there is no device state to save and restore.  After
>> issuing migrate-incoming, the caller must issue a system_wakeup command to
>> resume.
>>
>> In cpr-exec mode, the migrate command saves state to a file and directly
>> exec's a new version of qemu on the same host, replacing the original process
>> while retaining its PID.  The caller must specify a migration URI that writes
>> to and reads from a file, and resumes execution via the migrate-incoming
>> command.  Arguments for the new qemu process are taken from the cpr-exec-args
>> migration parameter, and must include the -incoming option.
>>
>> Guest RAM must be backed by a memory backend with share=on, but cannot be
>> memory-backend-ram.  The memory is re-mmap'd in the updated process, so guest
>> ram is efficiently preserved in place, albeit with new virtual addresses.
>> In addition, the '-migrate-mode-enable cpr-exec' option is required.  This
>> causes secondary guest ram blocks (those not specified on the command line)
>> to be allocated by mmap'ing a memfd.  The memfds are kept open across exec,
>> their values are saved in special cpr state which is retrieved after exec,
>> and they are re-mmap'd.  Since guest RAM is not copied, and storage blocks
>> are not migrated, the caller must disable all capabilities related to page
>> and block copy.  The implementation ignores all related parameters.
>>
>> The exec mode supports vfio devices by preserving the vfio container, group,
>> device, and event descriptors across the qemu re-exec, and by updating DMA
>> mapping virtual addresses using VFIO_DMA_UNMAP_FLAG_VADDR and
>> VFIO_DMA_MAP_FLAG_VADDR as defined in
>>    https://urldefense.com/v3/__https://lore.kernel.org/kvm/1611939252-7240-1-git-send-email-steven.sistare@oracle.com__;!!GjvTz_vk!U6U0yYHuO4GRyGQUNpn0TQdwlC2QjJfgYC0yE249AuONq8-5rs48pZ6l0K-LOSRHMA9cU2op2U8GC9hU3IK0BrTn$
>> and integrated in Linux kernel 5.12.
>>
>> Here is an example of updating qemu from v7.0.50 to v7.0.51 using exec mode.
>> The software update is performed while the guest is running to minimize
>> downtime.
>>
>> window 1                                        | window 2
>>                                                  |
>> # qemu-system-$arch ...                         |
>>    -migrate-mode-enable cpr-exec                 |
>> QEMU 7.0.50 monitor - type 'help' ...           |
>> (qemu) info status                              |
>> VM status: running                              |
>>                                                  | # yum update qemu
>> (qemu) migrate_set_parameter mode cpr-exec      |
>> (qemu) migrate_set_parameter cpr-exec-args      |
>>    qemu-system-$arch ... -incoming defer         |
>> (qemu) migrate -d file:/tmp/qemu.sav            |
>> QEMU 7.0.51 monitor - type 'help' ...           |
>> (qemu) info status                              |
>> VM status: paused (inmigrate)                   |
>> (qemu) migrate_incoming file:/tmp/qemu.sav      |
>> (qemu) info status                              |
>> VM status: running                              |
>>
>>
>> Here is an example of updating the host kernel using reboot mode.
>>
>> window 1                                        | window 2
>>                                                  |
>> # qemu-system-$arch ... mem-path=/dev/dax0.0    |
>>    -migrate-mode-enable cpr-reboot               |
>> QEMU 7.0.50 monitor - type 'help' ...           |
>> (qemu) info status                              |
>> VM status: running                              |
>>                                                  | # yum update kernel-uek
>> (qemu) migrate_set_parameter mode cpr-reboot    |
>> (qemu) migrate -d file:/tmp/qemu.sav            |
>> (qemu) quit                                     |
>>                                                  |
>> # systemctl kexec                               |
>> kexec_core: Starting new kernel                 |
>> ...                                             |
>>                                                  |
>> # qemu-system-$arch mem-path=/dev/dax0.0 ...    |
>>    -incoming defer                               |
>> QEMU 7.0.51 monitor - type 'help' ...           |
>> (qemu) info status                              |
>> VM status: paused (inmigrate)                   |
>> (qemu) migrate_incoming file:/tmp/qemu.sav      |
>> (qemu) info status                              |
>> VM status: running                              |
>>
>> Changes from V8 to V9:
>>    vfio:
>>      - free all cpr state during unwind in vfio_connect_container
>>      - change cpr_resave_fd to return void, and avoid new unwind cases
>>      - delete incorrect .unmigratable=1 in vmstate handlers
>>      - add route batching in vfio_claim_vectors
>>      - simplified vfio intx cpr code
>>      - fix commit message for 'recover from unmap-all-vaddr failure'
>>      - verify suspended runstate for cpr-reboot mode
>>    Other:
>>      - delete cpr-save, cpr-exec, cpr-load
>>      - delete ram block vmstate handlers that were added in V8
>>      - rename cpr-enable option to migrate-mode-enable
>>      - add file URI for migration
>>      - add mode and cpr-exec-args migration parameters
>>      - add per-mode migration blockers
>>      - add mode checks in migration notifiers
>>      - fix suspended runstate during migration
>>      - replace RAM_ANON flag with RAM_NAMED_FILE
>>      - support memory-backend-epc
>>
>> Steve Sistare (44):
>>    migration: fix populate_vfio_info                  ---  reboot mode  ---
>>    memory: RAM_NAMED_FILE flag
>>    migration: file URI
>>    migration: mode parameter
>>    migration: migrate-enable-mode option
>>    migration: simplify blockers
>>    migration: per-mode blockers
>>    cpr: relax some blockers
>>    cpr: reboot mode
>>
>>    qdev-properties: strList                           ---  exec mode ---
>>    qapi: strList_from_string
>>    qapi: QAPI_LIST_LENGTH
>>    qapi: strv_from_strList
>>    qapi: strList unit tests
>>    migration: cpr-exec-args parameter
>>    migration: simplify notifiers
>>    migration: check mode in notifiers
>>    memory: flat section iterator
>>    oslib: qemu_clear_cloexec
>>    vl: helper to request re-exec
>>    cpr: preserve extra state
>>    cpr: exec mode
>>    cpr: add exec-mode blockers
>>    cpr: ram block blockers
>>    cpr: only-cpr-capable
>>    cpr: Mismatched GPAs fix
>>    hostmem-memfd: cpr support
>>    hostmem-epc: cpr support
>>
>>    pci: export msix_is_pending                       --- vfio for exec ---
>>    vfio-pci: refactor for cpr
>>    vfio-pci: cpr part 1 (fd and dma)
>>    vfio-pci: cpr part 2 (msi)
>>    vfio-pci: cpr part 3 (intx)
>>    vfio-pci: recover from unmap-all-vaddr failure
>>
>>    chardev: cpr framework                            --- misc for exec ---
>>    chardev: cpr for simple devices
>>    chardev: cpr for pty
>>    python/machine: QEMUMachine full_args
>>    python/machine: QEMUMachine reopen_qmp_connection
>>    tests/avocado: add cpr regression test
>>
>>    vl: start on wakeup request                       --- vfio for reboot ---
>>    migration: fix suspended runstate
>>    migration: notifier error reporting
>>    vfio: allow cpr-reboot migration if suspended
>>
>> Mark Kanda, Steve Sistare (2):
>>    vhost: reset vhost devices for cpr
>>    chardev: cpr for sockets
>>
>>   MAINTAINERS                         |  14 ++
>>   accel/xen/xen-all.c                 |   3 +
>>   backends/hostmem-epc.c              |  18 +-
>>   backends/hostmem-file.c             |   1 +
>>   backends/hostmem-memfd.c            |  22 ++-
>>   backends/tpm/tpm_emulator.c         |  11 +-
>>   block/parallels.c                   |   7 +-
>>   block/qcow.c                        |   7 +-
>>   block/vdi.c                         |   7 +-
>>   block/vhdx.c                        |   7 +-
>>   block/vmdk.c                        |   7 +-
>>   block/vpc.c                         |   7 +-
>>   block/vvfat.c                       |   7 +-
>>   chardev/char-mux.c                  |   1 +
>>   chardev/char-null.c                 |   1 +
>>   chardev/char-pty.c                  |  16 +-
>>   chardev/char-serial.c               |   1 +
>>   chardev/char-socket.c               |  48 +++++
>>   chardev/char-stdio.c                |  31 +++
>>   chardev/char.c                      |  49 ++++-
>>   dump/dump.c                         |   4 +-
>>   gdbstub.c                           |   1 +
>>   hmp-commands.hx                     |   2 +-
>>   hw/9pfs/9p.c                        |  11 +-
>>   hw/core/qdev-properties-system.c    |  12 ++
>>   hw/core/qdev-properties.c           |  44 +++++
>>   hw/display/virtio-gpu-base.c        |   8 +-
>>   hw/intc/arm_gic_kvm.c               |   3 +-
>>   hw/intc/arm_gicv3_its_kvm.c         |   3 +-
>>   hw/intc/arm_gicv3_kvm.c             |   3 +-
>>   hw/misc/ivshmem.c                   |   8 +-
>>   hw/net/virtio-net.c                 |  10 +-
>>   hw/pci/msix.c                       |   2 +-
>>   hw/pci/pci.c                        |  12 ++
>>   hw/ppc/pef.c                        |   2 +-
>>   hw/ppc/spapr.c                      |   2 +-
>>   hw/ppc/spapr_events.c               |   2 +-
>>   hw/ppc/spapr_rtas.c                 |   2 +-
>>   hw/remote/proxy.c                   |   7 +-
>>   hw/s390x/s390-virtio-ccw.c          |   9 +-
>>   hw/scsi/vhost-scsi.c                |   9 +-
>>   hw/vfio/common.c                    | 235 +++++++++++++++++++----
>>   hw/vfio/cpr.c                       | 177 ++++++++++++++++++
>>   hw/vfio/meson.build                 |   1 +
>>   hw/vfio/migration.c                 |  23 +--
>>   hw/vfio/pci.c                       | 336 ++++++++++++++++++++++++++++-----
>>   hw/vfio/trace-events                |   1 +
>>   hw/virtio/vhost-vdpa.c              |   6 +-
>>   hw/virtio/vhost.c                   |  32 +++-
>>   include/chardev/char-socket.h       |   1 +
>>   include/chardev/char.h              |   5 +
>>   include/exec/memory.h               |  48 +++++
>>   include/exec/ram_addr.h             |   1 +
>>   include/exec/ramblock.h             |   1 +
>>   include/hw/pci/msix.h               |   1 +
>>   include/hw/qdev-properties-system.h |   4 +
>>   include/hw/qdev-properties.h        |   3 +
>>   include/hw/vfio/vfio-common.h       |  12 ++
>>   include/hw/virtio/vhost.h           |   1 +
>>   include/migration/blocker.h         |  69 ++++++-
>>   include/migration/cpr-state.h       |  30 +++
>>   include/migration/cpr.h             |  20 ++
>>   include/migration/misc.h            |  13 +-
>>   include/migration/vmstate.h         |   2 +
>>   include/qapi/util.h                 |  28 +++
>>   include/qemu/osdep.h                |   9 +
>>   include/sysemu/runstate.h           |   2 +
>>   migration/cpr-state.c               | 362 ++++++++++++++++++++++++++++++++++++
>>   migration/cpr.c                     |  85 +++++++++
>>   migration/file.c                    |  62 ++++++
>>   migration/file.h                    |  14 ++
>>   migration/meson.build               |   3 +
>>   migration/migration.c               | 268 +++++++++++++++++++++++---
>>   migration/ram.c                     |  24 ++-
>>   migration/target.c                  |   1 +
>>   migration/trace-events              |  12 ++
>>   monitor/hmp-cmds.c                  |  59 +++---
>>   monitor/hmp.c                       |   3 +
>>   monitor/qmp.c                       |   4 +
>>   python/qemu/machine/machine.py      |  14 ++
>>   qapi/char.json                      |   7 +-
>>   qapi/migration.json                 |  68 ++++++-
>>   qapi/qapi-util.c                    |  37 ++++
>>   qemu-options.hx                     |  50 ++++-
>>   replay/replay.c                     |   4 +
>>   softmmu/memory.c                    |  31 ++-
>>   softmmu/physmem.c                   | 100 +++++++++-
>>   softmmu/runstate.c                  |  42 ++++-
>>   softmmu/vl.c                        |  10 +
>>   stubs/cpr-state.c                   |  26 +++
>>   stubs/meson.build                   |   2 +
>>   stubs/migr-blocker.c                |   9 +-
>>   stubs/migration.c                   |  33 ++++
>>   target/i386/kvm/kvm.c               |   8 +-
>>   target/i386/nvmm/nvmm-all.c         |   4 +-
>>   target/i386/sev.c                   |   2 +-
>>   target/i386/whpx/whpx-all.c         |   3 +-
>>   tests/avocado/cpr.py                | 176 ++++++++++++++++++
>>   tests/unit/meson.build              |   1 +
>>   tests/unit/test-strlist.c           |  81 ++++++++
>>   trace-events                        |   1 +
>>   ui/spice-core.c                     |   5 +-
>>   ui/vdagent.c                        |   5 +-
>>   util/oslib-posix.c                  |   9 +
>>   util/oslib-win32.c                  |   4 +
>>   105 files changed, 2781 insertions(+), 330 deletions(-)
>>   create mode 100644 hw/vfio/cpr.c
>>   create mode 100644 include/migration/cpr-state.h
>>   create mode 100644 include/migration/cpr.h
>>   create mode 100644 migration/cpr-state.c
>>   create mode 100644 migration/cpr.c
>>   create mode 100644 migration/file.c
>>   create mode 100644 migration/file.h
>>   create mode 100644 stubs/cpr-state.c
>>   create mode 100644 stubs/migration.c
>>   create mode 100644 tests/avocado/cpr.py
>>   create mode 100644 tests/unit/test-strlist.c
>>

