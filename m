Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD2D2E0E58
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Dec 2020 19:46:12 +0100 (CET)
Received: from localhost ([::1]:46518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krmfj-0007GI-4d
	for lists+qemu-devel@lfdr.de; Tue, 22 Dec 2020 13:46:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1krmbn-0004Y1-TE
 for qemu-devel@nongnu.org; Tue, 22 Dec 2020 13:42:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51573)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1krmbj-0001tT-QX
 for qemu-devel@nongnu.org; Tue, 22 Dec 2020 13:42:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608662522;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vHpMx2Tmn2p+8fwxuNVV9TdK19UK3/OI7GEAeBsSXuk=;
 b=MLQ3m8CB1MAWPM7mSvQ/g7fNO+HlWR7sSltu85ggtToaTIUp5Jd0q9XQrJStKf0yMkvHdP
 vnLLJBaToxk+Iyx/eFp1jfCCTPa3O/f7tIFNW0yPV+en6LvV6tkjd6iN2oiA3PZQ6Zk0ma
 u0Cq+TlfImFaAXqabaMOqICy6aHL0bA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-283-5UqmchdLNVOuIZXkIQoR4Q-1; Tue, 22 Dec 2020 13:41:58 -0500
X-MC-Unique: 5UqmchdLNVOuIZXkIQoR4Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E9B771005513;
 Tue, 22 Dec 2020 18:41:54 +0000 (UTC)
Received: from wainer-laptop.localdomain (ovpn-114-123.rdu2.redhat.com
 [10.10.114.123])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 52E715D9CC;
 Tue, 22 Dec 2020 18:41:48 +0000 (UTC)
Subject: Re: [PATCH 0/9] Alpine Linux build fix and CI pipeline
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-devel@nongnu.org
References: <160851280526.21294.6201442635975331015@600e7e483b3a>
 <1389d6d1-33fe-46cc-b03c-f2a40e03853b@www.fastmail.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <431a4029-afdf-9a31-ba9a-ebfeef24faaa@redhat.com>
Date: Tue, 22 Dec 2020 15:41:46 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <1389d6d1-33fe-46cc-b03c-f2a40e03853b@www.fastmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.521, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, fam@euphon.net, thuth@redhat.com, kvm@vger.kernel.org,
 viktor.prutyanov@phystech.edu, lvivier@redhat.com, philmd@redhat.com,
 alistair@alistair23.me, groug@kaod.org, mreitz@redhat.com, qemu-ppc@nongnu.org,
 pbonzini@redhat.com, qemu-block@nongnu.org, alex.bennee@linaro.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On 12/21/20 5:25 AM, Jiaxun Yang wrote:
>
> On Mon, Dec 21, 2020, at 9:06 AM, no-reply@patchew.org wrote:
>> Patchew URL:
>> https://patchew.org/QEMU/20201221005318.11866-1-jiaxun.yang@flygoat.com/
>>
>>
>>
>> Hi,
>>
>> This series seems to have some coding style problems. See output below for
>> more information:
>>
>> Type: series
>> Message-id: 20201221005318.11866-1-jiaxun.yang@flygoat.com
>> Subject: [PATCH 0/9] Alpine Linux build fix and CI pipeline
>>
>> === TEST SCRIPT BEGIN ===
>> #!/bin/bash
>> git rev-parse base > /dev/null || exit 0
>> git config --local diff.renamelimit 0
>> git config --local diff.renames True
>> git config --local diff.algorithm histogram
>> ./scripts/checkpatch.pl --mailback base..
>> === TEST SCRIPT END ===
>>
>> Updating 3c8cf5a9c21ff8782164d1def7f44bd888713384
>>  From https://github.com/patchew-project/qemu
>>   * [new tag]
>> patchew/20201221005318.11866-1-jiaxun.yang@flygoat.com ->
>> patchew/20201221005318.11866-1-jiaxun.yang@flygoat.com
>> Switched to a new branch 'test'
>> 10095a9 gitlab-ci: Add alpine to pipeline
>> a177af3 tests: Rename PAGE_SIZE definitions
>> 5fcb0ed accel/kvm: avoid using predefined PAGE_SIZE
>> e7febdf hw/block/nand: Rename PAGE_SIZE to NAND_PAGE_SIZE
>> ba307d5 elf2dmp: Rename PAGE_SIZE to ELF2DMP_PAGE_SIZE
>> 0ccf92b libvhost-user: Include poll.h instead of sys/poll.h
>> 41a10db configure/meson: Only check sys/signal.h on non-Linux
>> 0bcd2f2 configure: Add sys/timex.h to probe clk_adjtime
>> a16c7ff tests/docker: Add dockerfile for Alpine Linux
>>
>> === OUTPUT BEGIN ===
>> 1/9 Checking commit a16c7ff7d859 (tests/docker: Add dockerfile for Alpine Linux)
>> WARNING: added, moved or deleted file(s), does MAINTAINERS need updating?
>> #20:
>> new file mode 100644
>>
>> total: 0 errors, 1 warnings, 56 lines checked
>>
>> Patch 1/9 has style problems, please review.  If any of these errors
>> are false positives report them to the maintainer, see
>> CHECKPATCH in MAINTAINERS.
>> 2/9 Checking commit 0bcd2f2eae84 (configure: Add sys/timex.h to probe
>> clk_adjtime)
>> 3/9 Checking commit 41a10dbdc8da (configure/meson: Only check
>> sys/signal.h on non-Linux)
>> 4/9 Checking commit 0ccf92b8ec37 (libvhost-user: Include poll.h instead
>> of sys/poll.h)
>> 5/9 Checking commit ba307d5a51aa (elf2dmp: Rename PAGE_SIZE to
>> ELF2DMP_PAGE_SIZE)
>> WARNING: line over 80 characters
>> #69: FILE: contrib/elf2dmp/main.c:284:
>> +        h.PhysicalMemoryBlock.NumberOfPages += ps->block[i].size /
>> ELF2DMP_PAGE_SIZE;
>>
>> WARNING: line over 80 characters
>> #79: FILE: contrib/elf2dmp/main.c:291:
>> +    h.RequiredDumpSpace += h.PhysicalMemoryBlock.NumberOfPages <<
>> ELF2DMP_PAGE_BITS;
>>
>> total: 0 errors, 2 warnings, 70 lines checked
>>
>> Patch 5/9 has style problems, please review.  If any of these errors
>> are false positives report them to the maintainer, see
>> CHECKPATCH in MAINTAINERS.
>> 6/9 Checking commit e7febdf0b056 (hw/block/nand: Rename PAGE_SIZE to
>> NAND_PAGE_SIZE)
>> ERROR: code indent should never use tabs
>> #26: FILE: hw/block/nand.c:117:
>> +# define PAGE_START(page)^I(PAGE(page) * (NAND_PAGE_SIZE + OOB_SIZE))$
>>
>> ERROR: code indent should never use tabs
>> #46: FILE: hw/block/nand.c:134:
>> +# define NAND_PAGE_SIZE^I^I2048$
>>
>> WARNING: line over 80 characters
>> #65: FILE: hw/block/nand.c:684:
>> +        mem_and(iobuf + (soff | off), s->io, MIN(s->iolen,
>> NAND_PAGE_SIZE - off));
>>
>> WARNING: line over 80 characters
>> #70: FILE: hw/block/nand.c:687:
>> +            mem_and(s->storage + (page << OOB_SHIFT), s->io +
>> NAND_PAGE_SIZE - off,
>>
>> total: 2 errors, 2 warnings, 120 lines checked
>>
>> Patch 6/9 has style problems, please review.  If any of these errors
>> are false positives report them to the maintainer, see
>> CHECKPATCH in MAINTAINERS.
>>
>> 7/9 Checking commit 5fcb0ed1331a (accel/kvm: avoid using predefined PAGE_SIZE)
>> 8/9 Checking commit a177af33938d (tests: Rename PAGE_SIZE definitions)
>> 9/9 Checking commit 10095a92643d (gitlab-ci: Add alpine to pipeline)
>> === OUTPUT END ===
>>
>> Test command exited with code: 1
> All pre-existing errors.

Apparently some style errors were introduced by the patches 05 and 06.

- Wainer

>
>>
>> The full log is available at
>> http://patchew.org/logs/20201221005318.11866-1-jiaxun.yang@flygoat.com/testing.checkpatch/?type=message.
>> ---
>> Email generated automatically by Patchew [https://patchew.org/].
>> Please send your feedback to patchew-devel@redhat.com


