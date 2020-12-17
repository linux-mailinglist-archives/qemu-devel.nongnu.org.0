Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD4E22DCC61
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 07:13:23 +0100 (CET)
Received: from localhost ([::1]:37380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpmXS-0005nh-Pn
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 01:13:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kpmTw-0004nN-5c
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 01:09:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:34636)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kpmTs-00040E-Er
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 01:09:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608185378;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aI3gapDGg61pFCppaijd8MMCd+NWTdv2Q3oQwb3JZgY=;
 b=VPybbUCNYS/kg3oNj9gvJOf2WmBW3sOEQCcYr1XqNHLIpptCU+6mcfmhdUpngQ9J8WCaxn
 9IQk8vJuc4eamn8nlSVnkFbEQMb1+bOXxYEfP1faa6IzSS3EYqCvYomteHCvxtrL/rjP51
 Nw9Om4hfqEVr+j3WyESYfL4RApPN7n0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-138-kp2CHOX4PMO0fm5MrmvjvA-1; Thu, 17 Dec 2020 01:09:34 -0500
X-MC-Unique: kp2CHOX4PMO0fm5MrmvjvA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5D43F15728;
 Thu, 17 Dec 2020 06:09:33 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-175.ams2.redhat.com [10.36.112.175])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CEE652BFC7;
 Thu, 17 Dec 2020 06:09:31 +0000 (UTC)
Subject: Re: [PULL 00/12] Compile QEMU with -Wimplicit-fallthrough
To: qemu-devel@nongnu.org
References: <160815968521.31764.15770228187712660306@600e7e483b3a>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <45f9acd8-224c-b49f-4d99-64bcc1e07e0b@redhat.com>
Date: Thu, 17 Dec 2020 07:09:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <160815968521.31764.15770228187712660306@600e7e483b3a>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, alex.bennee@linaro.org, kuhn.chenqun@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17/12/2020 00.01, no-reply@patchew.org wrote:
> Patchew URL: https://patchew.org/QEMU/20201216172949.57380-1-thuth@redhat.com/
> 
> 
> 
> Hi,
> 
> This series seems to have some coding style problems. See output below for
> more information:
> 
> Type: series
> Message-id: 20201216172949.57380-1-thuth@redhat.com
> Subject: [PULL 00/12] Compile QEMU with -Wimplicit-fallthrough
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
>  * [new tag]         patchew/20201216172949.57380-1-thuth@redhat.com -> patchew/20201216172949.57380-1-thuth@redhat.com
> Switched to a new branch 'test'
> 7bedbc8 configure: Compile with -Wimplicit-fallthrough=2
> e14bb9d tests/fp: Do not emit implicit-fallthrough warnings in the softfloat tests
> ebd3c45 tcg/optimize: Add fallthrough annotations
> cfe5662 target/sparc/win_helper: silence the compiler warnings
> 8ef9335 target/sparc/translate: silence the compiler warnings
> 4588bf9 accel/tcg/user-exec: silence the compiler warnings
> be2108e hw/intc/arm_gicv3_kvm: silence the compiler warnings
> 7d033d0 target/i386: silence the compiler warnings in gen_shiftd_rm_T1
> 284b00a hw/timer/renesas_tmr: silence the compiler warnings
> c3d2957 hw/rtc/twl92230: Silence warnings about missing fallthrough statements
> 1b1609c target/unicore32/translate: Add missing fallthrough annotations
> 99bc0f0 disas/libvixl: Fix fall-through annotation for GCC >= 7
> 
> === OUTPUT BEGIN ===
> 1/12 Checking commit 99bc0f0e92b7 (disas/libvixl: Fix fall-through annotation for GCC >= 7)
> ERROR: do not use C99 // comments
> #49: FILE: disas/libvixl/vixl/globals.h:111:
> +// Fallthrough annotation for Clang and C++11(201103L).
> 
> ERROR: do not use C99 // comments
> #52: FILE: disas/libvixl/vixl/globals.h:114:
> +// Fallthrough annotation for GCC >= 7.

Well, libvixl is C++ code and the upstream patch used these comments, too,
so this error can be ignored.

> total: 2 errors, 0 warnings, 24 lines checked
> 
> Patch 1/12 has style problems, please review.  If any of these errors
> are false positives report them to the maintainer, see
> CHECKPATCH in MAINTAINERS.
> 
> 2/12 Checking commit 1b1609c7573a (target/unicore32/translate: Add missing fallthrough annotations)
> 3/12 Checking commit c3d2957383b8 (hw/rtc/twl92230: Silence warnings about missing fallthrough statements)
> 4/12 Checking commit 284b00aef566 (hw/timer/renesas_tmr: silence the compiler warnings)
> 5/12 Checking commit 7d033d02b90d (target/i386: silence the compiler warnings in gen_shiftd_rm_T1)
> 6/12 Checking commit be2108e641c9 (hw/intc/arm_gicv3_kvm: silence the compiler warnings)
> 7/12 Checking commit 4588bf97482b (accel/tcg/user-exec: silence the compiler warnings)
> 8/12 Checking commit 8ef9335f2838 (target/sparc/translate: silence the compiler warnings)
> 9/12 Checking commit cfe56623ece8 (target/sparc/win_helper: silence the compiler warnings)
> 10/12 Checking commit ebd3c45fd052 (tcg/optimize: Add fallthrough annotations)
> WARNING: architecture specific defines should be avoided
> #35: FILE: include/qemu/compiler.h:230:
> +#if __has_attribute(fallthrough)

Maybe we should teach checkpatch.pl to allow these in compiler.h?

 Thomas


