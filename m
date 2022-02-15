Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CE684B7430
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 18:51:52 +0100 (CET)
Received: from localhost ([::1]:55330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nK1zS-0003JH-Jd
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 12:51:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nK1tB-0008BB-6V
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 12:45:21 -0500
Received: from beetle.greensocs.com ([5.135.226.135]:44686)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nK1t8-0006SN-AF
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 12:45:20 -0500
Received: from [192.168.13.13] (unknown [195.68.53.70])
 by beetle.greensocs.com (Postfix) with ESMTPSA id 13A612077C;
 Tue, 15 Feb 2022 17:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1644947115;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Yi6l3cGD21KiZnAtKfCFq3893L9Q5pYs+DUjAUTC8H0=;
 b=0K8W/DCPcsNA4WSZ/LvnBKal2BrbHlNjmNCqo38Fn+J6D/VozKZ/XsRI9DzmhB1xNbm6MT
 nsALYJqq1CzGw5HU51X3rWAg2nDdHFlZjLYHaG3kkshMas2wqAdq9XQ3cINTTKqRe2RKs6
 oMblWoWISUIIQl2g+QlYDYvyT2/e9rs=
Message-ID: <7700bff5-ccc9-0286-118e-a12efe1cdb72@greensocs.com>
Date: Tue, 15 Feb 2022 18:45:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v2 00/14] target: Use ArchCPU & CPUArchState as abstract
 interface to target CPU
Content-Language: en-US-large
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20220214183144.27402-1-f4bug@amsat.org>
From: Damien Hedde <damien.hedde@greensocs.com>
In-Reply-To: <20220214183144.27402-1-f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=damien.hedde@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Taylor Simpson <tsimpson@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Philippe,

What's the idea behind these 2 types: ArchCPU and CPUArchState ?
I don't understand why we'll need them.

Thanks,
Damien

On 2/14/22 19:31, Philippe Mathieu-Daudé via wrote:
> Missing review: 10, 13, 14
> 
> Since v1:
> - Include Hexagon OBJECT_DECLARE_TYPE() patch
> - Add missing includes to Hexagon
> - Introduce OBJECT_DECLARE_CPU_TYPE() macro
> - Use OBJECT_DECLARE_CPU_TYPE()
> 
> Kind of respin of the "exec: Move translation declarations to
> 'translate-all.h'" series, but without modifying translate-all.h :)
> (same same but different).
> 
> Based-on: <20220207082756.82600-1-f4bug@amsat.org>
> "exec: Remove 'qemu/log.h' from 'exec-all.h'"
> 
> Philippe Mathieu-Daudé (13):
>    meson: Display libfdt as disabled when system emulation is disabled
>    hw/m68k/mcf: Add missing 'exec/hwaddr.h' header
>    hw/tricore: Remove unused and incorrect header
>    exec/cpu_ldst: Include 'cpu.h' to get target_ulong definition
>    cpu: Add missing 'exec/exec-all.h' and 'qemu/accel.h' headers
>    target/i386/cpu: Ensure accelerators set CPU addressble physical bits
>    target/i386/tcg/sysemu: Include missing 'exec/exec-all.h' header
>    target: Include missing 'cpu.h'
>    target/hexagon: Add missing 'hw/core/cpu.h' include
>    target: Use forward declared type instead of structure type
>    target: Use CPUArchState as interface to target-specific CPU state
>    target: Introduce and use OBJECT_DECLARE_CPU_TYPE() macro
>    target: Use ArchCPU as interface to target CPU
> 
> Taylor Simpson (1):
>    Hexagon (target/hexagon) convert to OBJECT_DECLARE_TYPE
> 
>   cpu.c                                |  2 ++
>   include/exec/cpu_ldst.h              |  1 +
>   include/exec/poison.h                |  2 --
>   include/hw/core/cpu.h                | 20 +++++++++++++++++++-
>   include/hw/m68k/mcf.h                |  1 +
>   include/hw/tricore/triboard.h        |  1 -
>   include/qemu/typedefs.h              |  2 ++
>   meson.build                          |  4 +++-
>   target/alpha/cpu-qom.h               |  3 +--
>   target/alpha/cpu.h                   | 11 +++--------
>   target/arm/cpu-qom.h                 |  3 +--
>   target/arm/cpu.h                     |  7 ++-----
>   target/arm/hvf_arm.h                 |  2 +-
>   target/avr/cpu-qom.h                 |  3 +--
>   target/avr/cpu.h                     | 13 ++++---------
>   target/cris/cpu-qom.h                |  3 +--
>   target/cris/cpu.h                    |  7 ++-----
>   target/hexagon/cpu.h                 | 23 ++++++++---------------
>   target/hppa/cpu-qom.h                |  3 +--
>   target/hppa/cpu.h                    | 12 +++---------
>   target/i386/cpu-qom.h                |  3 +--
>   target/i386/cpu.c                    |  1 +
>   target/i386/cpu.h                    |  7 ++-----
>   target/i386/tcg/sysemu/excp_helper.c |  1 +
>   target/i386/tcg/sysemu/misc_helper.c |  1 +
>   target/m68k/cpu-qom.h                |  3 +--
>   target/m68k/cpu.h                    |  7 ++-----
>   target/microblaze/cpu-qom.h          |  3 +--
>   target/microblaze/cpu.h              |  9 +++------
>   target/microblaze/mmu.h              |  2 ++
>   target/mips/cpu-qom.h                |  3 +--
>   target/mips/cpu.h                    | 10 +++-------
>   target/mips/internal.h               | 15 ++++++++-------
>   target/nios2/cpu.h                   |  9 ++++-----
>   target/nios2/mmu.h                   |  2 ++
>   target/openrisc/cpu.h                | 17 +++++------------
>   target/ppc/cpu-qom.h                 |  5 ++---
>   target/ppc/cpu.h                     |  7 ++-----
>   target/riscv/cpu.h                   | 11 ++++-------
>   target/riscv/pmp.h                   |  2 ++
>   target/rx/cpu-qom.h                  |  5 +----
>   target/rx/cpu.h                      |  6 ++----
>   target/s390x/cpu-qom.h               |  7 +++----
>   target/s390x/cpu.h                   |  7 ++-----
>   target/sh4/cpu-qom.h                 |  3 +--
>   target/sh4/cpu.h                     |  7 ++-----
>   target/sparc/cpu-qom.h               |  3 +--
>   target/sparc/cpu.h                   |  9 +++------
>   target/tricore/cpu-qom.h             |  3 +--
>   target/tricore/cpu.h                 | 10 +++-------
>   target/xtensa/cpu-qom.h              |  3 +--
>   target/xtensa/cpu.h                  | 13 +++++--------
>   52 files changed, 129 insertions(+), 188 deletions(-)
> 

