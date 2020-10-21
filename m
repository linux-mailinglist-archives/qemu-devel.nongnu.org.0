Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 807BD295164
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Oct 2020 19:17:01 +0200 (CEST)
Received: from localhost ([::1]:34830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kVHjQ-0000M4-Gt
	for lists+qemu-devel@lfdr.de; Wed, 21 Oct 2020 13:17:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1kVHgr-0006yd-NF
 for qemu-devel@nongnu.org; Wed, 21 Oct 2020 13:14:21 -0400
Received: from relay64.bu.edu ([128.197.228.104]:48811)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1kVHgp-000384-Qw
 for qemu-devel@nongnu.org; Wed, 21 Oct 2020 13:14:21 -0400
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay64.bu.edu (8.14.3/8.14.3) with ESMTP id 09LHDtag007111
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Wed, 21 Oct 2020 13:13:59 -0400
Date: Wed, 21 Oct 2020 13:13:55 -0400
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: Re: [Fwd] Issue 26558 in oss-fuzz: qemu: Fuzzing build failure
Message-ID: <20201021171355.cn3aucjku74hrzoo@mozz.bu.edu>
References: <20201021140246.jaukysfzbyjinurm@mozz.bu.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201021140246.jaukysfzbyjinurm@mozz.bu.edu>
Received-SPF: pass client-ip=128.197.228.104; envelope-from=alxndr@bu.edu;
 helo=relay64.bu.edu
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/21 13:14:18
X-ACL-Warn: Detected OS   = Linux 2.6.x
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, HK_RANDOM_ENVFROM=0.001,
 HK_RANDOM_FROM=0.454, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: darren.kenny@oracle.com, bsd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 201021 1002, Alexander Bulekov wrote:
> oops.. looks like we need to install ninja on the oss-fuzz build docker.
> I'll send a PR to oss-fuzz.
> 
> -Alex

PR: https://github.com/google/oss-fuzz/pull/4557

> 
> ----- Forwarded message from ClusterFuzz-External via monorail <monorail+v2.382749006@chromium.org> -----
> 
> Date: Wed, 21 Oct 2020 03:16:20 -0700
> From: ClusterFuzz-External via monorail <monorail+v2.382749006@chromium.org>
> To: alxndr@bu.edu
> Subject: Issue 26558 in oss-fuzz: qemu: Fuzzing build failure
> 
> Status: New
> Owner: ----
> CC: b...@redhat.com, stefa...@redhat.com, alx...@bu.edu, pbonz...@redhat.com, darre...@oracle.com 
> Labels: Proj-qemu
> Type: Build-Failure
> 
> New issue 26558 by ClusterFuzz-External: qemu: Fuzzing build failure
> https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=26558
> 
> The last 2 builds for qemu have been failing.
> Build log: https://oss-fuzz-build-logs.storage.googleapis.com/log-fd076577-292c-45f5-8c56-b5993850d2bb.txt
> Build type: fuzzing
> 
> To reproduce locally, please see: https://google.github.io/oss-fuzz/advanced-topics/reproducing#reproducing-build-failures
> 
> This bug tracker is not being monitored by OSS-Fuzz team. If you have any questions, please create an issue at https://github.com/google/oss-fuzz/issues/new.
> 
> **This bug will be automatically closed within a day once it is fixed.**
> 
> -- 
> You received this message because:
>   1. You were specifically CC'd on the issue
> 
> You may adjust your notification preferences at:
> https://bugs.chromium.org/hosting/settings
> 
> Reply to this email to add a comment.
> 
> ----- End forwarded message -----

