Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 351E13271D2
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Feb 2021 11:01:14 +0100 (CET)
Received: from localhost ([::1]:53282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGIsy-0000Hq-KF
	for lists+qemu-devel@lfdr.de; Sun, 28 Feb 2021 05:01:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lGIr2-0008D5-9m
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 04:59:15 -0500
Received: from mx2.suse.de ([195.135.220.15]:52206)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lGIqw-0006d6-It
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 04:59:11 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 98826AB8C;
 Sun, 28 Feb 2021 09:59:04 +0000 (UTC)
Subject: Re: [PATCH 0/2] Fix mips jazz vs constant TCGCPUOps
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210227232519.222663-1-richard.henderson@linaro.org>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <b0f5face-9eb3-a9f5-0f13-ca9cda99e5ad@suse.de>
Date: Sun, 28 Feb 2021 10:59:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20210227232519.222663-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.35,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/28/21 12:25 AM, Richard Henderson wrote:
> We can implement the jazz behaviour with a flag on MIPSCPUClass,
> rather than by adjusting the do_transaction_failed callback.
> 
> 
> r~
> 

Reviewed-by: Claudio Fontana <cfontana@suse.de>

> 
> Richard Henderson (2):
>   target/mips: Fold jazz behaviour into mips_cpu_do_transaction_failed
>   hw/core: Constify TCGCPUOps
> 
>  include/hw/core/cpu.h           |  2 +-
>  target/mips/cpu-qom.h           |  3 +++
>  hw/mips/jazz.c                  | 35 +++------------------------------
>  target/alpha/cpu.c              |  2 +-
>  target/arm/cpu.c                |  2 +-
>  target/arm/cpu_tcg.c            |  2 +-
>  target/avr/cpu.c                |  2 +-
>  target/cris/cpu.c               |  4 ++--
>  target/hexagon/cpu.c            |  2 +-
>  target/hppa/cpu.c               |  2 +-
>  target/i386/tcg/tcg-cpu.c       |  2 +-
>  target/lm32/cpu.c               |  2 +-
>  target/m68k/cpu.c               |  2 +-
>  target/microblaze/cpu.c         |  2 +-
>  target/mips/cpu.c               |  2 +-
>  target/mips/op_helper.c         |  3 ++-
>  target/moxie/cpu.c              |  2 +-
>  target/nios2/cpu.c              |  2 +-
>  target/openrisc/cpu.c           |  2 +-
>  target/riscv/cpu.c              |  2 +-
>  target/rx/cpu.c                 |  2 +-
>  target/s390x/cpu.c              |  2 +-
>  target/sh4/cpu.c                |  2 +-
>  target/sparc/cpu.c              |  2 +-
>  target/tilegx/cpu.c             |  2 +-
>  target/tricore/cpu.c            |  2 +-
>  target/unicore32/cpu.c          |  2 +-
>  target/xtensa/cpu.c             |  2 +-
>  target/ppc/translate_init.c.inc |  2 +-
>  29 files changed, 35 insertions(+), 60 deletions(-)
> 


