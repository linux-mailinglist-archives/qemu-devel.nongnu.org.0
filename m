Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A844E2ACF5E
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 07:03:24 +0100 (CET)
Received: from localhost ([::1]:34934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcMkV-0003H4-Bz
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 01:03:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lihaotian9@huawei.com>)
 id 1kcMjU-0002o8-MV
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 01:02:20 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:2134)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lihaotian9@huawei.com>)
 id 1kcMjQ-0006hP-PK
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 01:02:20 -0500
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4CVch53q2Zz745d;
 Tue, 10 Nov 2020 14:01:57 +0800 (CST)
Received: from [10.174.178.136] (10.174.178.136) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.487.0; Tue, 10 Nov 2020 14:01:54 +0800
Subject: Re: [PATCH 0/2] virtiofsd: fix some accessing NULL pointer problem
To: <qemu-devel@nongnu.org>
References: <160497112183.32285.8464514877214048442@b92d57cec08d>
From: Haotian Li <lihaotian9@huawei.com>
Message-ID: <faaeb432-fcf8-1083-0db0-98e61e971992@huawei.com>
Date: Tue, 10 Nov 2020 14:01:54 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.1.0
MIME-Version: 1.0
In-Reply-To: <160497112183.32285.8464514877214048442@b92d57cec08d>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.178.136]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.35; envelope-from=lihaotian9@huawei.com;
 helo=szxga07-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/10 01:02:06
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: virtio-fs@redhat.com, linfeilong@huawei.com, liuzhiqiang26@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,
Thanks for your suggestion. We will fix the coding style
problems and resend new patches.

> Patchew URL: https://patchew.org/QEMU/eeb2fd1d-a53d-eae6-4727-7f1a6b20ac9e@huawei.com/
> 
> 
> 
> Hi,
> 
> This series seems to have some coding style problems. See output below for
> more information:
> 
> Message-id: eeb2fd1d-a53d-eae6-4727-7f1a6b20ac9e@huawei.com
> Subject: [PATCH 0/2] virtiofsd: fix some accessing NULL pointer problem
> Type: series
> 
> === TEST SCRIPT BEGIN ===
> #!/bin/bash
> git rev-parse base > /dev/null || exit 0
> git config --local diff.renamelimit 0
> git config --local diff.renames True
> git config --local diff.algorithm histogram
> ./scripts/checkpatch.pl --mailback base..
> === TEST SCRIPT END ===
> 
> Updating 3c8cf5a9c21ff8782164d1def7f44bd888713384
> From https://github.com/patchew-project/qemu
>  - [tag update]      patchew/20201028185722.2783532-1-keithp@keithp.com -> patchew/20201028185722.2783532-1-keithp@keithp.com
>  * [new tag]         patchew/eeb2fd1d-a53d-eae6-4727-7f1a6b20ac9e@huawei.com -> patchew/eeb2fd1d-a53d-eae6-4727-7f1a6b20ac9e@huawei.com
> Switched to a new branch 'test'
> c91e972 virtiofsd: check whether lo_map_reserve returns NULL in main func
> 387bda7 tools/virtiofsd/buffer.c: check whether buf is NULL in fuse_bufvec_advance func
> 
> === OUTPUT BEGIN ===
> 1/2 Checking commit 387bda78be64 (tools/virtiofsd/buffer.c: check whether buf is NULL in fuse_bufvec_advance func)
> ERROR: braces {} are necessary for all arms of this statement
> #23: FILE: tools/virtiofsd/buffer.c:249:
> +    if (!buf)
> [...]
> 
> total: 1 errors, 0 warnings, 9 lines checked
> 
> Patch 1/2 has style problems, please review.  If any of these errors
> are false positives report them to the maintainer, see
> CHECKPATCH in MAINTAINERS.
> 
> 2/2 Checking commit c91e9722f323 (virtiofsd: check whether lo_map_reserve returns NULL in main func)
> ERROR: braces {} are necessary for all arms of this statement
> #34: FILE: tools/virtiofsd/passthrough_ll.c:3457:
> +    if (!reserve_elem)
> [...]
> 
> ERROR: braces {} are necessary for all arms of this statement
> #38: FILE: tools/virtiofsd/passthrough_ll.c:3461:
> +    if (!root_elem)
> [...]
> 
> total: 2 errors, 0 warnings, 21 lines checked
> 
> Patch 2/2 has style problems, please review.  If any of these errors
> are false positives report them to the maintainer, see
> CHECKPATCH in MAINTAINERS.
> 
> === OUTPUT END ===
> 
> Test command exited with code: 1
> 
> 
> The full log is available at
> http://patchew.org/logs/eeb2fd1d-a53d-eae6-4727-7f1a6b20ac9e@huawei.com/testing.checkpatch/?type=message.
> ---
> Email generated automatically by Patchew [https://patchew.org/].
> Please send your feedback to patchew-devel@redhat.com
> 

