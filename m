Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 737A3370117
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 21:18:49 +0200 (CEST)
Received: from localhost ([::1]:58222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcYf2-0008SB-44
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 15:18:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dan.j.williams@intel.com>)
 id 1lcYbB-0006oY-TL
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 15:14:49 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:42961)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dan.j.williams@intel.com>)
 id 1lcYb8-000538-Id
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 15:14:49 -0400
Received: by mail-ej1-x635.google.com with SMTP id y7so7948402ejj.9
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 12:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SVaZEa6T1OlZEI2ZRCjaeg3vEy1Vw6FSwiGIGLqhRiA=;
 b=hSmPGg1woGCWrtib2vDCyHADvNbcXMWY1N4HZoA/Dc0dDn6CIy7oepwfhpSWXQOPAb
 jQSMM2z7PqF5Aeps791PdAuKxHPLHrTIpO3qkwC1U244YOPo3rtC/fJt0zEp+0kh0/qo
 qQWTPvjSFUOLd9HLmgxmuzOXIi2Fh8ruvZrwf1wcv8p1VGQB8KrwlHx5bDb3uHno2BKp
 u9fcgEP+3lbmp+TXxVTo5ZpyBJ4dQUoDggD/ilqOHSP3jjWVembDw/rdFWmcQYId4h3X
 u2LHIta0hJrnJcZFKFPK/ewDqKJGyV+DZxXUPSAeytK2WJI/dZylwU4jqTJr186rjN2b
 fYuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SVaZEa6T1OlZEI2ZRCjaeg3vEy1Vw6FSwiGIGLqhRiA=;
 b=TphCYL+6uJTnP5KbjqahK3ZCrSH0kIVOuuE5/KEY2P1ino5IG2i1hIVLcClJhcISAV
 uy3dJl61tdeJ/BI2+HnYIUUiFyx2Nq9oCtMUgvYMw3MzYswcmp0n6G1+84m2ngGq6uTw
 xifripWQW6gdPCEIN5XxmL8d3tgQCj8IvLb1uPdHKUs2WEr/RAGiXwGFvEEEesuWP/VA
 EWcIC2CCcw8nRLgVGGvVOKdBM7xbTxeHO5DxQxAzUuEYmTJ9A1/hwtJubFiLK7zx8061
 QrQN/5QblgVpGE6lxiEXSw4w4EXX1i5BRjUZ4UzgJvIPWJlxgJKMsODC00Ez521JVNF/
 zeNQ==
X-Gm-Message-State: AOAM532YcXlWcBzVbGOp294AwK2Df0BTzqOTk+rIfxAoSJs/i8ie/fro
 8oToyJu7mvaWP9qXuE/GUcppR52m34HSN0VRhJSlMw==
X-Google-Smtp-Source: ABdhPJxWhl/4Wl06Jd4YyX/1fomQ8w4q0Aps7EkyT3DYr4nAK1VxEw092nPbBy4Dz9d/BnILBkCFzTz+uUt2sIudWMY=
X-Received: by 2002:a17:907:1183:: with SMTP id
 uz3mr6068141ejb.264.1619810077593; 
 Fri, 30 Apr 2021 12:14:37 -0700 (PDT)
MIME-Version: 1.0
References: <161966810162.652.13723419108625443430.stgit@17be908f7c1c>
In-Reply-To: <161966810162.652.13723419108625443430.stgit@17be908f7c1c>
From: Dan Williams <dan.j.williams@intel.com>
Date: Fri, 30 Apr 2021 12:14:37 -0700
Message-ID: <CAPcyv4gwkyDBG7EZOth-kcZR8Fb+RgGXY=Y9vbuHXAz3PAnLVw@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] nvdimm: Enable sync-dax property for nvdimm
To: Shivaprasad G Bhat <sbhat@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=dan.j.williams@intel.com; helo=mail-ej1-x635.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Qemu Developers <qemu-devel@nongnu.org>,
 linux-nvdimm <linux-nvdimm@lists.01.org>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Markus Armbruster <armbru@redhat.com>, bharata@linux.vnet.ibm.com,
 Haozhong Zhang <haozhong.zhang@intel.com>,
 Eduardo Habkost <ehabkost@redhat.com>, richard.henderson@linaro.org,
 Greg Kurz <groug@kaod.org>, kvm-ppc@vger.kernel.org, qemu-arm@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 kwangwoo.lee@sk.com, David Gibson <david@gibson.dropbear.id.au>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 shameerali.kolothum.thodi@huawei.com, shivaprasadbhat@gmail.com,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Some corrections to terminology confusion below...


On Wed, Apr 28, 2021 at 8:49 PM Shivaprasad G Bhat <sbhat@linux.ibm.com> wrote:
>
> The nvdimm devices are expected to ensure write persistence during power
> failure kind of scenarios.

No, QEMU is not expected to make that guarantee. QEMU is free to lie
to the guest about the persistence guarantees of the guest PMEM
ranges. It's more accurate to say that QEMU nvdimm devices can emulate
persistent memory and optionally pass through host power-fail
persistence guarantees to the guest. The power-fail persistence domain
can be one of "cpu_cache", or "memory_controller" if the persistent
memory region is "synchronous". If the persistent range is not
synchronous, it really isn't "persistent memory"; it's memory mapped
storage that needs I/O commands to flush.

> The libpmem has architecture specific instructions like dcbf on POWER

Which "libpmem" is this? PMDK is a reference library not a PMEM
interface... maybe I'm missing what libpmem has to do with QEMU?

> to flush the cache data to backend nvdimm device during normal writes
> followed by explicit flushes if the backend devices are not synchronous
> DAX capable.
>
> Qemu - virtual nvdimm devices are memory mapped. The dcbf in the guest
> and the subsequent flush doesn't traslate to actual flush to the backend

s/traslate/translate/

> file on the host in case of file backed v-nvdimms. This is addressed by
> virtio-pmem in case of x86_64 by making explicit flushes translating to
> fsync at qemu.

Note that virtio-pmem was a proposal for a specific optimization of
allowing guests to share page cache. The virtio-pmem approach is not
to be confused with actual persistent memory.

> On SPAPR, the issue is addressed by adding a new hcall to
> request for an explicit flush from the guest ndctl driver when the backend

What is an "ndctl" driver? ndctl is userspace tooling, do you mean the
guest pmem driver?

> nvdimm cannot ensure write persistence with dcbf alone. So, the approach
> here is to convey when the hcall flush is required in a device tree
> property. The guest makes the hcall when the property is found, instead
> of relying on dcbf.
>
> A new device property sync-dax is added to the nvdimm device. When the
> sync-dax is 'writeback'(default for PPC), device property
> "hcall-flush-required" is set, and the guest makes hcall H_SCM_FLUSH
> requesting for an explicit flush.

I'm not sure "sync-dax" is a suitable name for the property of the
guest persistent memory. There is no requirement that the
memory-backend file for a guest be a dax-capable file. It's also
implementation specific what hypercall needs to be invoked for a given
occurrence of "sync-dax". What does that map to on non-PPC platforms
for example? It seems to me that an "nvdimm" device presents the
synchronous usage model and a whole other device type implements an
async-hypercall setup that the guest happens to service with its
nvdimm stack, but it's not an "nvdimm" anymore at that point.

> sync-dax is "unsafe" on all other platforms(x86, ARM) and old pseries machines
> prior to 5.2 on PPC. sync-dax="writeback" on ARM and x86_64 is prevented
> now as the flush semantics are unimplemented.

"sync-dax" has no meaning on its own, I think this needs an explicit
mechanism to convey both the "not-sync" property *and* the callback
method, it shouldn't be inferred by arch type.

> When the backend file is actually synchronous DAX capable and no explicit
> flushes are required, the sync-dax mode 'direct' is to be used.
>
> The below demonstration shows the map_sync behavior with sync-dax writeback &
> direct.
> (https://github.com/avocado-framework-tests/avocado-misc-tests/blob/master/memory/ndctl.py.data/map_sync.c)
>
> The pmem0 is from nvdimm with With sync-dax=direct, and pmem1 is from
> nvdimm with syn-dax=writeback, mounted as
> /dev/pmem0 on /mnt1 type xfs (rw,relatime,attr2,dax=always,inode64,logbufs=8,logbsize=32k,noquota)
> /dev/pmem1 on /mnt2 type xfs (rw,relatime,attr2,dax=always,inode64,logbufs=8,logbsize=32k,noquota)
>
> [root@atest-guest ~]# ./mapsync /mnt1/newfile ----> When sync-dax=unsafe/direct
> [root@atest-guest ~]# ./mapsync /mnt2/newfile ----> when sync-dax=writeback
> Failed to mmap  with Operation not supported
>
> The first patch does the header file cleanup necessary for the
> subsequent ones. Second patch implements the hcall, adds the necessary
> vmstate properties to spapr machine structure for carrying the hcall
> status during save-restore. The nature of the hcall being asynchronus,
> the patch uses aio utilities to offload the flush. The third patch adds
> the 'sync-dax' device property and enables the device tree property
> for the guest to utilise the hcall.
>
> The kernel changes to exploit this hcall is at
> https://github.com/linuxppc/linux/commit/75b7c05ebf9026.patch
>
> ---
> v3 - https://lists.gnu.org/archive/html/qemu-devel/2021-03/msg07916.html
> Changes from v3:
>       - Fixed the forward declaration coding guideline violations in 1st patch.
>       - Removed the code waiting for the flushes to complete during migration,
>         instead restart the flush worker on destination qemu in post load.
>       - Got rid of the randomization of the flush tokens, using simple
>         counter.
>       - Got rid of the redundant flush state lock, relying on the BQL now.
>       - Handling the memory-backend-ram usage
>       - Changed the sync-dax symantics from on/off to 'unsafe','writeback' and 'direct'.
>         Added prevention code using 'writeback' on arm and x86_64.
>       - Fixed all the miscellaneous comments.
>
> v2 - https://lists.gnu.org/archive/html/qemu-devel/2020-11/msg07031.html
> Changes from v2:
>       - Using the thread pool based approach as suggested
>       - Moved the async hcall handling code to spapr_nvdimm.c along
>         with some simplifications
>       - Added vmstate to preserve the hcall status during save-restore
>         along with pre_save handler code to complete all ongoning flushes.
>       - Added hw_compat magic for sync-dax 'on' on previous machines.
>       - Miscellanious minor fixes.
>
> v1 - https://lists.gnu.org/archive/html/qemu-devel/2020-11/msg06330.html
> Changes from v1
>       - Fixed a missed-out unlock
>       - using QLIST_FOREACH instead of QLIST_FOREACH_SAFE while generating token
>
> Shivaprasad G Bhat (3):
>       spapr: nvdimm: Forward declare and move the definitions
>       spapr: nvdimm: Implement H_SCM_FLUSH hcall
>       nvdimm: Enable sync-dax device property for nvdimm
>
>
>  hw/arm/virt.c                 |   28 ++++
>  hw/i386/pc.c                  |   28 ++++
>  hw/mem/nvdimm.c               |   52 +++++++
>  hw/ppc/spapr.c                |   16 ++
>  hw/ppc/spapr_nvdimm.c         |  285 +++++++++++++++++++++++++++++++++++++++++
>  include/hw/mem/nvdimm.h       |   11 ++
>  include/hw/ppc/spapr.h        |   11 +-
>  include/hw/ppc/spapr_nvdimm.h |   27 ++--
>  qapi/common.json              |   20 +++
>  9 files changed, 455 insertions(+), 23 deletions(-)
>
> --
> Signature
> _______________________________________________
> Linux-nvdimm mailing list -- linux-nvdimm@lists.01.org
> To unsubscribe send an email to linux-nvdimm-leave@lists.01.org

