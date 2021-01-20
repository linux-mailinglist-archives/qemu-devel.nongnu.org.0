Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C5242FD79F
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 18:59:32 +0100 (CET)
Received: from localhost ([::1]:45528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2HlQ-0006w4-Te
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 12:59:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1l2HV2-0006Rp-KO
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 12:42:35 -0500
Received: from relay68.bu.edu ([128.197.228.73]:37864)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1l2HV0-0003aw-P2
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 12:42:32 -0500
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay68.bu.edu (8.14.3/8.14.3) with ESMTP id 10KHfhJ1010023
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Wed, 20 Jan 2021 12:41:46 -0500
Date: Wed, 20 Jan 2021 12:41:43 -0500
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: Re: [PULL 0/7] 2021-01-20 fuzzing patches
Message-ID: <20210120174143.j4n7vswyjtm2up4l@mozz.bu.edu>
References: <20210120173536.265601-1-alxndr@bu.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210120173536.265601-1-alxndr@bu.edu>
Received-SPF: pass client-ip=128.197.228.73; envelope-from=alxndr@bu.edu;
 helo=relay68.bu.edu
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, HK_RANDOM_ENVFROM=0.001,
 HK_RANDOM_FROM=0.998, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Nack

On 210120 1235, Alexander Bulekov wrote:
> Hi Peter,
> 
> The following changes since commit 48202c712412c803ddb56365c7bca322aa4e7506:
> 
>   Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-20210119-1' into staging (2021-01-19 15:47:23 +0000)
> 
> are available in the Git repository at:
> 
>   https://gitlab.com/a1xndr/qemu.git tags/pull-request-2021-01-20
> 
> for you to fetch changes up to fae446ae7b6f746377186b3e19fd3f732a8b4325:
> 
>   fuzz: add virtio-9p configurations for fuzzing (2021-01-20 12:30:26 -0500)
> 
> ----------------------------------------------------------------
> * Add fuzzer configs for virtio-9p
> * Add fuzzer configs for PATA/SATA ide-hd and atapi devices
> * Remove a DMA callback check that was limitting the fuzzer
> * Improve debug info and documentation
> 
> ----------------------------------------------------------------
> Alexander Bulekov (7):
>       fuzz: ignore address_space_map is_write flag
>       fuzz: refine the ide/ahci fuzzer configs
>       docs/fuzz: fix pre-meson path
>       fuzz: log the arguments used to initialize QEMU
>       fuzz: enable dynamic args for generic-fuzz configs
>       docs/fuzz: add some information about OSS-Fuzz
>       fuzz: add virtio-9p configurations for fuzzing
> 
>  docs/devel/fuzzing.rst                  | 31 ++++++++++++++++++++++++++++---
>  include/exec/memory.h                   |  8 +++-----
>  include/exec/memory_ldst_cached.h.inc   |  6 +++---
>  memory_ldst.c.inc                       |  8 ++++----
>  softmmu/memory.c                        |  5 ++---
>  softmmu/physmem.c                       |  4 ++--
>  tests/qtest/fuzz/fuzz.c                 | 11 ++++++++++-
>  tests/qtest/fuzz/generic_fuzz.c         | 19 ++++++++++++-------
>  tests/qtest/fuzz/generic_fuzz_configs.h | 41 ++++++++++++++++++++++++++++++++++++++++-
>  9 files changed, 104 insertions(+), 29 deletions(-)
> 
> Alexander Bulekov (7):
>   fuzz: ignore address_space_map is_write flag
>   fuzz: refine the ide/ahci fuzzer configs
>   docs/fuzz: fix pre-meson path
>   fuzz: log the arguments used to initialize QEMU
>   fuzz: enable dynamic args for generic-fuzz configs
>   docs/fuzz: add some information about OSS-Fuzz
>   fuzz: add virtio-9p configurations for fuzzing
> 
>  docs/devel/fuzzing.rst                  | 31 +++++++++++++++++--
>  include/exec/memory.h                   |  8 ++---
>  include/exec/memory_ldst_cached.h.inc   |  6 ++--
>  memory_ldst.c.inc                       |  8 ++---
>  softmmu/memory.c                        |  5 ++-
>  softmmu/physmem.c                       |  4 +--
>  tests/qtest/fuzz/fuzz.c                 | 11 ++++++-
>  tests/qtest/fuzz/generic_fuzz.c         | 19 +++++++-----
>  tests/qtest/fuzz/generic_fuzz_configs.h | 41 ++++++++++++++++++++++++-
>  9 files changed, 104 insertions(+), 29 deletions(-)
> 
> -- 
> 2.28.0
> 

