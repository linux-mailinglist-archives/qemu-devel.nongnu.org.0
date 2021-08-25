Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1088C3F7692
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 15:53:35 +0200 (CEST)
Received: from localhost ([::1]:59050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mItLS-0007Q1-5y
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 09:53:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1mItKI-00064b-5y
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 09:52:22 -0400
Received: from relay64.bu.edu ([128.197.228.104]:58357)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1mItKG-000468-Be
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 09:52:21 -0400
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay64.bu.edu (8.14.3/8.14.3) with ESMTP id 17PDpopl023126
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Wed, 25 Aug 2021 09:51:53 -0400
Date: Wed, 25 Aug 2021 09:51:50 -0400
From: Alexander Bulekov <alxndr@bu.edu>
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL SUBSYSTEM v2 0/8] Fuzzing Patches for 2021-08-25
Message-ID: <20210825135150.bpifgnom5quoinuq@mozz.bu.edu>
References: <20210825134232.45074-1-alxndr@bu.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210825134232.45074-1-alxndr@bu.edu>
Received-SPF: pass client-ip=128.197.228.104; envelope-from=alxndr@bu.edu;
 helo=relay64.bu.edu
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, HK_RANDOM_ENVFROM=0.89,
 HK_RANDOM_FROM=0.999, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Sorry, Peter - I forgot to indicate that this is a SUBSYSTEM PR.
-Alex

On 210825 0942, Alexander Bulekov wrote:
> Hi Paolo,
> 
> (Resending, since I didn't send the original PR cover-letter to
> qemu-devel)
> 
> The following changes since commit d42685765653ec155fdf60910662f8830bdb2cef:
> 
>   Open 6.2 development tree (2021-08-25 10:25:12 +0100)
> 
> are available in the Git repository at:
> 
>   https://gitlab.com/a1xndr/qemu/ fuzz-pull-2021-08-25
> 
> for you to fetch changes up to 1818b05bf41665731c9c82da8ea910a44b5142f4:
> 
>   MAINTAINERS: add fuzzing reviewer (2021-08-25 09:30:34 -0400)
> 
> (This supercedes <20210713150037.9297-1-alxndr@bu.edu>)
> 
> Thank you
> 
> ----------------------------------------------------------------
> Fuzzing Patches for 2021-08-25
>  * Add Darren and Qiuhao as reviewers
>  * Make coverage-instrumentation and timeouts more granular
>  * Fix a problem with impossible writes in the DMA callback, leading to
>    false-positives
>  * Attempt to fix oss-fuzz coverage builds, by dealing with a
>    signal-related problem
> 
> ----------------------------------------------------------------
> Alexander Bulekov (6):
>       fuzz: fix sparse memory access in the DMA callback
>       fuzz: adjust timeout to allow for longer inputs
>       fuzz: make object-name matching case-insensitive
>       fuzz: add an instrumentation filter
>       fuzz: use ITIMER_REAL for timeouts
>       fuzz: unblock SIGALRM so the timeout works
> 
> Darren Kenny (1):
>       MAINTAINERS: Add myself as a reviewer for Device Fuzzing
> 
> Qiuhao Li (1):
>       MAINTAINERS: add fuzzing reviewer
> 
>  MAINTAINERS                                      |  2 ++
>  configure                                        | 28 ++++++++++++++++++++++------
>  scripts/oss-fuzz/instrumentation-filter-template | 15 +++++++++++++++
>  tests/qtest/fuzz/generic_fuzz.c                  | 55 ++++++++++++++++++++++++++++++++++++++++++++-----------
>  4 files changed, 83 insertions(+), 17 deletions(-)
>  create mode 100644 scripts/oss-fuzz/instrumentation-filter-template
> 
> Alexander Bulekov (6):
>   fuzz: fix sparse memory access in the DMA callback
>   fuzz: adjust timeout to allow for longer inputs
>   fuzz: make object-name matching case-insensitive
>   fuzz: add an instrumentation filter
>   fuzz: use ITIMER_REAL for timeouts
>   fuzz: unblock SIGALRM so the timeout works
> 
> Darren Kenny (1):
>   MAINTAINERS: Add myself as a reviewer for Device Fuzzing
> 
> Qiuhao Li (1):
>   MAINTAINERS: add fuzzing reviewer
> 
>  MAINTAINERS                                   |  2 +
>  configure                                     | 28 ++++++++--
>  .../oss-fuzz/instrumentation-filter-template  | 15 +++++
>  tests/qtest/fuzz/generic_fuzz.c               | 55 +++++++++++++++----
>  4 files changed, 83 insertions(+), 17 deletions(-)
>  create mode 100644 scripts/oss-fuzz/instrumentation-filter-template
> 
> -- 
> 2.30.2
> 

