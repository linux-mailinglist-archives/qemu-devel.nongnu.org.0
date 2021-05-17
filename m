Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B3AB3828DA
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 11:54:32 +0200 (CEST)
Received: from localhost ([::1]:32878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liZxH-0002hF-1n
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 05:54:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1liZvv-0001fr-Ci
 for qemu-devel@nongnu.org; Mon, 17 May 2021 05:53:07 -0400
Received: from mx2.suse.de ([195.135.220.15]:39458)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1liZvt-0002bx-N2
 for qemu-devel@nongnu.org; Mon, 17 May 2021 05:53:07 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E6A79B188;
 Mon, 17 May 2021 09:53:03 +0000 (UTC)
To: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
From: Claudio Fontana <cfontana@suse.de>
Subject: latest GOOD state of series i386 cleanup, arm cleanup, s390 cleanup
Message-ID: <466cf154-cabf-2e8f-021f-a82cf7b88b31@suse.de>
Date: Mon, 17 May 2021 11:53:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Liang Yan <lyan@suse.com>, qemu-devel <qemu-devel@nongnu.org>,
 Al Cho <ACho@suse.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello all,

due to my inactivity for a few weeks coupled likely with the upstream processes around qemu-6.0 now the series:

1) i386 cleanup
2) arm cleanup and experimental kvm-only build
3) s390 cleanup

have become stale and hard to rebase on latest master.
This effect is compounded by the fact that lots of broken tests in master have been added.

In the interest of not losing work,
I provide here the latest known good state of these series:

For the i386 cleanup:
https://gitlab.com/hw-claudio/qemu/-/pipelines/293603386

Tests started breaking horribly since about 1/2 weeks.
The latest version of the cleanup is reachable here:

https://github.com/qemu/qemu.git branch "i386_cleanup_9"

In my understanding, Paolo has now picked up this one.

For the ARM cleanup and experimental kvm-only build:

https://gitlab.com/hw-claudio/qemu/-/pipelines/293603376

https://github.com/qemu/qemu.git branch "arm_cleanup_v15"

Again here tests started misbehaving in the same timeframe.

The state of ARM cleanup is still experimental, maybe Liang or Philippe you can adopt this one?

For the s390x cleanup:

https://gitlab.com/hw-claudio/qemu/-/pipelines/293603379

https://github.com/qemu/qemu.git branch "s390_cleanup_v1"

Al, can you take this one to the finish line?

Thanks,

Claudio
-- 
Claudio Fontana
Engineering Manager Virtualization, SUSE Labs Core

SUSE Software Solutions Italy Srl

