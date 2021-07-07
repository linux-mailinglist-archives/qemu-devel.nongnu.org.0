Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D7F33BEC6B
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 18:40:46 +0200 (CEST)
Received: from localhost ([::1]:43144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1AbN-0007wX-5c
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 12:40:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1m1AaE-0007ED-Q7
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 12:39:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53721)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1m1AaA-0002my-S0
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 12:39:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625675968;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KcqXPKVXieybsneKgCj7Q9FsWHFQpxdEZUjwGHysgJs=;
 b=e2BefFu6BXl5bWEMvYkE5OTpIF2KaY9IHRwJDKYwzXuuf5dNQs3U7k3smfyyPR7W06VEJp
 FnP48I56NkZCF/qblccqBPFPOq76zTjWaim2Zt8GMexPzFs4FWdKKnTOgYdIZPrSga8DK4
 UmAhsDnsdJk8Ei1FGfKZh7GPpVxg/mQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-301-w5NSRffSNs-zmKnJI2xkQw-1; Wed, 07 Jul 2021 12:39:23 -0400
X-MC-Unique: w5NSRffSNs-zmKnJI2xkQw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 503AD801107;
 Wed,  7 Jul 2021 16:39:22 +0000 (UTC)
Received: from localhost (ovpn-112-160.ams2.redhat.com [10.36.112.160])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C59F360854;
 Wed,  7 Jul 2021 16:39:21 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: "Cho, Yu-Chen" <acho@suse.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org
Subject: Re: [PATCH v7 00/14] s390x cleanup
In-Reply-To: <20210707105324.23400-1-acho@suse.com>
Organization: Red Hat GmbH
References: <20210707105324.23400-1-acho@suse.com>
User-Agent: Notmuch/0.32.1 (https://notmuchmail.org)
Date: Wed, 07 Jul 2021 18:39:20 +0200
Message-ID: <87a6myf58n.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.439,
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
Cc: cfontana@suse.com, acho@suse.com, jose.ziviani@suse.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jul 07 2021, "Cho, Yu-Chen" <acho@suse.com> wrote:

> this is the next version of a cleanup series for s390x.
>
> v6 -> v7:
>
> * "hw/s390x: rename tod-qemu.c to tod-tcg.c" #2
>   - change the comment at the top of the file:
>     "TCG implementation" instead of "QEMU implementation"
>     (Thomas)
>
> * "hw/s390x: only build tod-tcg from the CONFIG_TCG build" #3
>   - swap the order of the patch 03 to 04 (Thomas)
>
> * "hw/s390x: tod: make explicit checks for accelerators when
>   initializing" #4
>   - swap the order of the patch 04 to 03 (Thomas)
>
> * "target/s390x: rename internal.h to s390x-internal.h"
>   - Separate from "target/s390x: start moving TCG-only code to tcg/"
>     (Thomas)
>
> * "target/s390x: start moving TCG-only code to tcg/" #6->#7
>   - remove the part of rename internal.h to s390x-internal.h
>   - remove s390_cpu_*() in s390x-internal.h to next patch
>     (Thomas)
>
> * "target/s390x: move sysemu-only code out to cpu-sysemu.c" #7->#8
>   - add s390_cpu_*() to s390x-internal.h (Thomas)
>
> * "target/s390x: split cpu-dump from helper.c" #8->#9
>   - move s390_cpu_set_psw and s390_cpu_get_psw_mask() to cpu.c
>     (Thomas)
>
> * "target/s390x: make helper.c sysemu-only" #9->#10
>   - fixed typo: s/systemu/sysemu/
>
> * "target/s390x: move kvm files into kvm/" #12->#13
>   - remove the include header change in target/s390x/kvm/kvm.c
>     (Thomas)
>
> v5 -> v6:
>
> * "target/s390x: start moving TCG-only code to tcg/"
>   - keep the old pattern in MAINTAINERS (Cornelia)
>
> * "target/s390x: make helper.c sysemu-only"
>   - fixed typo
>
> v4 -> v5:
> * "target/s390x: start moving TCG-only code to tcg/"
>   - add change to MAINTAINERS file
>
> * "target/s390x: move sysemu-only code out to cpu-sysemu.c"
>   - make use of SysemuCPUOps s390_sysemu_ops to handle
>
> * "target/s390x: split cpu-dump from helper.c"
>   - add description to explain why split cpu-dump from helper.c
>
> * "target/s390x: make helper.c sysemu-only"
>   - mention at the beginning of this file that this is sysemu only
>     (Cornelia)
>
> * "target/s390x: remove kvm-stub.c"
>   - add additional comment to explain the function can be
>     removed (Thomas)
>
> * "target/s390x: move kvm files into kvm/"
>    - add change to MAINTAINERS file
>
> * "target/s390x: split sysemu part of cpu models"
>    - add change to MAINTAINERS file
>
> * "MAINTAINERS: update s390x directories"
>   - removed, squash this in respectively:
>     #6 target/s390x: start moving TCG-only code to tcg/
>     #12 target/s390x: move kvm files into kvm/
>     #13 target/s390x: split sysemu part of cpu models
>
> v3 -> v4: take s390x part from Claudio and modify for the current master
>
> * "target/s390x: meson: add target_user_arch"
>   - new patch, add target_user_arch to avoid the proliferation of #ifdef
> in target code.
>
> v2 -> v3: minor changes
>
> * "hw/s390x: rename tod-qemu.c to tod-tcg.c": move to the front (David)
>
> * "hw/s390x: only build tod-qemu from the CONFIG_TCG build"
>   - move just after, use "tod-tcg" instead
>
> * "hw/s390x: tod: make explicit checks for accelerators when initializing"
>   - removed a line break in commit message
>
> * "target/s390x: start moving TCG-only code to tcg/"
>   - split the rename s390x-internal.h rename part, do it before the move
>
> * "target/s390x: move kvm files into kvm/"
>   - fix broken/missing move of trace events
>
> Cho, Yu-Chen (14):
>   target/s390x: meson: add target_user_arch
>   hw/s390x: rename tod-qemu.c to tod-tcg.c
>   hw/s390x: tod: make explicit checks for accelerators when initializing
>   hw/s390x: only build tod-tcg from the CONFIG_TCG build
>   target/s390x: remove tcg-stub.c
>   target/s390x: rename internal.h to s390x-internal.h
>   target/s390x: start moving TCG-only code to tcg/
>   target/s390x: move sysemu-only code out to cpu-sysemu.c
>   target/s390x: split cpu-dump from helper.c
>   target/s390x: make helper.c sysemu-only
>   target/s390x: use kvm_enabled() to wrap call to kvm_s390_get_hpage_1m
>   target/s390x: remove kvm-stub.c
>   target/s390x: move kvm files into kvm/
>   target/s390x: split sysemu part of cpu models
>
>  MAINTAINERS                                   |   6 +-
>  hw/intc/s390_flic_kvm.c                       |   2 +-
>  hw/s390x/meson.build                          |   4 +-
>  hw/s390x/s390-stattrib-kvm.c                  |   2 +-
>  hw/s390x/tod-kvm.c                            |   2 +-
>  hw/s390x/{tod-qemu.c => tod-tcg.c}            |   4 +-
>  hw/s390x/tod.c                                |   9 +-
>  hw/vfio/ap.c                                  |   2 +-
>  include/hw/s390x/tod.h                        |   2 +-
>  meson.build                                   |   1 +
>  target/s390x/arch_dump.c                      |   2 +-
>  target/s390x/cpu-dump.c                       | 134 ++++++
>  target/s390x/cpu-sysemu.c                     | 309 +++++++++++++
>  target/s390x/cpu.c                            | 332 +++-----------
>  target/s390x/cpu_models.c                     | 421 +----------------
>  target/s390x/cpu_models_sysemu.c              | 426 ++++++++++++++++++
>  target/s390x/cpu_models_user.c                |  20 +
>  target/s390x/diag.c                           |   7 +-
>  target/s390x/gdbstub.c                        |   2 +-
>  target/s390x/helper.c                         | 162 +------
>  target/s390x/interrupt.c                      |   6 +-
>  target/s390x/ioinst.c                         |   2 +-
>  target/s390x/kvm-stub.c                       | 121 -----
>  target/s390x/{ => kvm}/kvm.c                  |   2 +-
>  target/s390x/{ => kvm}/kvm_s390x.h            |   0
>  target/s390x/kvm/meson.build                  |  17 +
>  target/s390x/kvm/trace-events                 |   7 +
>  target/s390x/kvm/trace.h                      |   1 +
>  target/s390x/machine.c                        |   6 +-
>  target/s390x/meson.build                      |  42 +-
>  target/s390x/mmu_helper.c                     |   4 +-
>  target/s390x/{internal.h => s390x-internal.h} |   8 +
>  target/s390x/sigp.c                           |   2 +-
>  target/s390x/tcg-stub.c                       |  30 --
>  target/s390x/{ => tcg}/cc_helper.c            |   2 +-
>  target/s390x/{ => tcg}/crypto_helper.c        |   2 +-
>  target/s390x/{ => tcg}/excp_helper.c          |   2 +-
>  target/s390x/{ => tcg}/fpu_helper.c           |   2 +-
>  target/s390x/{ => tcg}/insn-data.def          |   0
>  target/s390x/{ => tcg}/insn-format.def        |   0
>  target/s390x/{ => tcg}/int_helper.c           |   2 +-
>  target/s390x/{ => tcg}/mem_helper.c           |   2 +-
>  target/s390x/tcg/meson.build                  |  14 +
>  target/s390x/{ => tcg}/misc_helper.c          |   2 +-
>  target/s390x/{ => tcg}/s390-tod.h             |   0
>  target/s390x/{ => tcg}/tcg_s390x.h            |   0
>  target/s390x/{ => tcg}/translate.c            |   2 +-
>  target/s390x/{ => tcg}/translate_vx.c.inc     |   0
>  target/s390x/{ => tcg}/vec.h                  |   0
>  target/s390x/{ => tcg}/vec_fpu_helper.c       |   2 +-
>  target/s390x/{ => tcg}/vec_helper.c           |   2 +-
>  target/s390x/{ => tcg}/vec_int_helper.c       |   0
>  target/s390x/{ => tcg}/vec_string_helper.c    |   2 +-
>  target/s390x/trace-events                     |   8 +-
>  54 files changed, 1058 insertions(+), 1083 deletions(-)
>  rename hw/s390x/{tod-qemu.c => tod-tcg.c} (96%)
>  create mode 100644 target/s390x/cpu-dump.c
>  create mode 100644 target/s390x/cpu-sysemu.c
>  create mode 100644 target/s390x/cpu_models_sysemu.c
>  create mode 100644 target/s390x/cpu_models_user.c
>  delete mode 100644 target/s390x/kvm-stub.c
>  rename target/s390x/{ => kvm}/kvm.c (99%)
>  rename target/s390x/{ => kvm}/kvm_s390x.h (100%)
>  create mode 100644 target/s390x/kvm/meson.build
>  create mode 100644 target/s390x/kvm/trace-events
>  create mode 100644 target/s390x/kvm/trace.h
>  rename target/s390x/{internal.h => s390x-internal.h} (97%)
>  delete mode 100644 target/s390x/tcg-stub.c
>  rename target/s390x/{ => tcg}/cc_helper.c (99%)
>  rename target/s390x/{ => tcg}/crypto_helper.c (98%)
>  rename target/s390x/{ => tcg}/excp_helper.c (99%)
>  rename target/s390x/{ => tcg}/fpu_helper.c (99%)
>  rename target/s390x/{ => tcg}/insn-data.def (100%)
>  rename target/s390x/{ => tcg}/insn-format.def (100%)
>  rename target/s390x/{ => tcg}/int_helper.c (99%)
>  rename target/s390x/{ => tcg}/mem_helper.c (99%)
>  create mode 100644 target/s390x/tcg/meson.build
>  rename target/s390x/{ => tcg}/misc_helper.c (99%)
>  rename target/s390x/{ => tcg}/s390-tod.h (100%)
>  rename target/s390x/{ => tcg}/tcg_s390x.h (100%)
>  rename target/s390x/{ => tcg}/translate.c (99%)
>  rename target/s390x/{ => tcg}/translate_vx.c.inc (100%)
>  rename target/s390x/{ => tcg}/vec.h (100%)
>  rename target/s390x/{ => tcg}/vec_fpu_helper.c (99%)
>  rename target/s390x/{ => tcg}/vec_helper.c (99%)
>  rename target/s390x/{ => tcg}/vec_int_helper.c (100%)
>  rename target/s390x/{ => tcg}/vec_string_helper.c (99%)

Thanks, applied.


