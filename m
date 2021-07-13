Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A2A93C72CA
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 17:06:51 +0200 (CEST)
Received: from localhost ([::1]:36566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3Jzm-0007fp-CJ
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 11:06:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1m3Ju6-0005Zz-Rt
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 11:00:59 -0400
Received: from relay68.bu.edu ([128.197.228.73]:45013)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1m3Ju3-0002of-Iu
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 11:00:58 -0400
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay68.bu.edu (8.14.3/8.14.3) with ESMTP id 16DF0Oc8001199
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Tue, 13 Jul 2021 11:00:28 -0400
Date: Tue, 13 Jul 2021 11:00:24 -0400
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: Re: [PULL 0/3] Fuzzing Patches
Message-ID: <20210713150024.uglbv5q66zrdl5sn@mozz.bu.edu>
References: <20210713054836.154421-1-alxndr@bu.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210713054836.154421-1-alxndr@bu.edu>
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
Cc: Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 210713 0148, Alexander Bulekov wrote:
> Hello Paolo,
> 
> The following changes since commit 711c0418c8c1ce3a24346f058b001c4c5a2f0f81:
> 
>   Merge remote-tracking branch 'remotes/philmd/tags/mips-20210702' into staging (2021-07-04 14:04:12 +0100)
> 
> are available in the Git repository at:
> 
>   https://gitlab.com/a1xndr/qemu tags/pull-request-2021-07-12
> 
> for you to fetch changes up to 3f4a00e1ec2ee9ab34cfbb8a955c3089256b21c2:
> 
>   fuzz: make object-name matching case-insensitive (2021-07-12 09:56:13 -0400)
> 
> ----------------------------------------------------------------
> Fuzzing PR for 6.1: Bug-fixes and refined timeout mechanism
> 
> ----------------------------------------------------------------
> Alexander Bulekov (3):
>       fuzz: fix sparse memory access in the DMA callback
>       fuzz: adjust timeout to allow for longer inputs
>       fuzz: make object-name matching case-insensitive
> 
>  tests/qtest/fuzz/generic_fuzz.c | 50 +++++++++++++++++++++++++++++++++++++++-----------
>  1 file changed, 39 insertions(+), 11 deletions(-)
> 
> -- 
> 2.28.0
> 

One more Patch was reviewed, so I just sent a v2.

