Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EF052F9BD4
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 10:22:56 +0100 (CET)
Received: from localhost ([::1]:38492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1QkR-0002AT-E5
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 04:22:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1l1QiR-0000gI-Vo
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 04:20:52 -0500
Received: from mx2.suse.de ([195.135.220.15]:54946)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1l1QiO-0004uv-61
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 04:20:51 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D2C8CACF5;
 Mon, 18 Jan 2021 09:20:46 +0000 (UTC)
Subject: Re: [PATCH 0/6] accel: Restrict TCG-specific code
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210117164813.4101761-1-f4bug@amsat.org>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <d50b5fcd-a5d6-76f3-f7f2-201234694e5f@suse.de>
Date: Mon, 18 Jan 2021 10:20:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20210117164813.4101761-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.252,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Riku Voipio <riku.voipio@iki.fi>,
 Eduardo Habkost <ehabkost@redhat.com>, Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/17/21 5:48 PM, Philippe Mathieu-Daudé wrote:
> Hi,
> 
> I've prepared some patches to have KVM-only builds.
> Some patches are generic - well kind of, instead they are
> TCG specific =) - so I'm sending them as a separate series.
> 
> Please review,
> 
> Phil.

I am wondering the best way to combine with:

[PATCH v12 00/22] i386 cleanup PART 2
https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg02427.html

In particular:

[PATCH v12 12/22] physmem: make watchpoint checking code TCG-only
[PATCH v12 13/22] cpu: move adjust_watchpoint_address to tcg_ops
[PATCH v12 14/22] cpu: move debug_check_watchpoint to tcg_ops

Thanks!

Claudio


> 
> Philippe Mathieu-Daudé (6):
>   accel/tcg: Make cpu_gen_init() static
>   accel/tcg: Restrict tb_flush_jmp_cache() from other accelerators
>   accel/tcg: Restrict tb_gen_code() from other accelerators
>   accel/tcg: Declare missing cpu_loop_exit*() stubs
>   accel/tcg: Restrict cpu_io_recompile() from other accelerators
>   softmmu: Restrict watchpoint handlers to TCG accelerator
> 
>  accel/tcg/internal.h      | 23 +++++++++++++++++++++++
>  include/exec/exec-all.h   | 11 -----------
>  include/hw/core/cpu.h     |  4 ++--
>  accel/stubs/tcg-stub.c    | 10 ++++++++++
>  accel/tcg/cpu-exec.c      |  1 +
>  accel/tcg/cputlb.c        |  1 +
>  accel/tcg/translate-all.c |  3 ++-
>  accel/tcg/user-exec.c     |  1 +
>  softmmu/physmem.c         |  4 ++++
>  9 files changed, 44 insertions(+), 14 deletions(-)
>  create mode 100644 accel/tcg/internal.h
> 


