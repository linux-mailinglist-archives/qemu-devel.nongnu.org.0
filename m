Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8722E2D767B
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 14:26:47 +0100 (CET)
Received: from localhost ([::1]:56216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kniRa-0007Jq-23
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 08:26:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kniPN-0006jc-3u
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 08:24:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31845)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kniPD-0004cj-FR
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 08:24:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607693058;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e4QC/lnK5H0wMxKVF2TIWHWEXkRHSKCaYfMIKmdKonA=;
 b=bgWONg1jxndnqc0YSJJOBqew9ZC2PZaC7DZeKvOI5ExOrLrxzARSsPoyh4btMQPAewfLYG
 IAmsxk2rS7G0c2w9t68xy5sSNgO9DQ231i9G7ae3jS7unnFdSIaeTTpT7JgGR5s8qilF/V
 XE6JAHcxNibszDHR3qOkshuP47ssnIA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-359-u1wFImvANSiFXpVU5pU_sQ-1; Fri, 11 Dec 2020 08:24:14 -0500
X-MC-Unique: u1wFImvANSiFXpVU5pU_sQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 669FBB8103;
 Fri, 11 Dec 2020 13:24:13 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-112-98.ams2.redhat.com
 [10.36.112.98])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B4D5219C78;
 Fri, 11 Dec 2020 13:24:07 +0000 (UTC)
Subject: Re: [PATCH v14 06/13] iotests: add #310 to test bottom node in COR
 driver
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20201204220758.2879-1-vsementsov@virtuozzo.com>
 <20201204220758.2879-7-vsementsov@virtuozzo.com>
 <4849feaa-631c-0b23-6a65-d48b367961d0@redhat.com>
 <31cc63f1-1e55-22fd-edff-2a815f690f11@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <c124518a-1499-6fbd-c47a-fa279d56d326@redhat.com>
Date: Fri, 11 Dec 2020 14:24:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <31cc63f1-1e55-22fd-edff-2a815f690f11@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: fam@euphon.net, kwolf@redhat.com, qemu-devel@nongnu.org, armbru@redhat.com,
 stefanha@redhat.com, andrey.shinkevich@virtuozzo.com, den@openvz.org,
 jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11.12.20 14:10, Vladimir Sementsov-Ogievskiy wrote:
> 11.12.2020 15:49, Max Reitz wrote:
>> On 04.12.20 23:07, Vladimir Sementsov-Ogievskiy wrote:
>>> From: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
>>>
>>> The test case #310 is similar to #216 by Max Reitz. The difference is
>>> that the test #310 involves a bottom node to the COR filter driver.
>>>
>>> Signed-off-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
>>> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>>> ---
>>>   tests/qemu-iotests/310     | 114 +++++++++++++++++++++++++++++++++++++
>>>   tests/qemu-iotests/310.out |  15 +++++
>>>   tests/qemu-iotests/group   |   1 +
>>>   3 files changed, 130 insertions(+)
>>>   create mode 100755 tests/qemu-iotests/310
>>>   create mode 100644 tests/qemu-iotests/310.out
>>>
>>> diff --git a/tests/qemu-iotests/310 b/tests/qemu-iotests/310
>>> new file mode 100755
>>> index 0000000000..c8b34cd887
>>> --- /dev/null
>>> +++ b/tests/qemu-iotests/310
>>> @@ -0,0 +1,114 @@
>>> +#!/usr/bin/env python3
>>> +#
>>> +# Copy-on-read tests using a COR filter with a bottom node
>>> +#
>>> +# Copyright (C) 2018 Red Hat, Inc.
>>> +# Copyright (c) 2020 Virtuozzo International GmbH
>>> +#
>>> +# This program is free software; you can redistribute it and/or modify
>>> +# it under the terms of the GNU General Public License as published by
>>> +# the Free Software Foundation; either version 2 of the License, or
>>> +# (at your option) any later version.
>>> +#
>>> +# This program is distributed in the hope that it will be useful,
>>> +# but WITHOUT ANY WARRANTY; without even the implied warranty of
>>> +# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>>> +# GNU General Public License for more details.
>>> +#
>>> +# You should have received a copy of the GNU General Public License
>>> +# along with this program.  If not, see <http://www.gnu.org/licenses/>.
>>> +#
>>> +
>>> +import iotests
>>> +from iotests import log, qemu_img, qemu_io_silent
>>> +
>>> +# Need backing file support
>>> +iotests.script_initialize(supported_fmts=['qcow2', 'qcow', 'qed', 
>>> 'vmdk'],
>>> +                          supported_platforms=['linux'])
>>> +
>>> +log('')
>>> +log('=== Copy-on-read across nodes ===')
>>> +log('')
>>> +
>>> +# This test is similar to the 216 one by Max Reitz <mreitz@redhat.com>
>>> +# The difference is that this test case involves a bottom node to the
>>> +# COR filter driver.
>>> +
>>> +with iotests.FilePath('base.img') as base_img_path, \
>>> +     iotests.FilePath('mid.img') as mid_img_path, \
>>> +     iotests.FilePath('top.img') as top_img_path, \
>>> +     iotests.VM() as vm:
>>> +
>>> +    log('--- Setting up images ---')
>>> +    log('')
>>> +
>>> +    assert qemu_img('create', '-f', iotests.imgfmt, base_img_path, 
>>> '64M') == 0
>>> +    assert qemu_io_silent(base_img_path, '-c', 'write -P 1 0M 1M') == 0
>>> +    assert qemu_io_silent(base_img_path, '-c', 'write -P 1 3M 1M') == 0
>>> +    assert qemu_img('create', '-f', iotests.imgfmt, '-b', 
>>> base_img_path,
>>> +                    '-F', iotests.imgfmt, mid_img_path) == 0
>>> +    assert qemu_io_silent(mid_img_path,  '-c', 'write -P 3 2M 1M') == 0
>>> +    assert qemu_io_silent(mid_img_path,  '-c', 'write -P 3 4M 1M') == 0
>>> +    assert qemu_img('create', '-f', iotests.imgfmt, '-b', mid_img_path,
>>> +                    '-F', iotests.imgfmt, top_img_path) == 0
>>> +    assert qemu_io_silent(top_img_path,  '-c', 'write -P 2 1M 1M') == 0
>>> +
>>> +#      0 1 2 3 4
>>> +# top    2
>>> +# mid      3   3
>>> +# base 1     1
>>> +
>>> +    log('Done')
>>> +
>>> +    log('')
>>> +    log('--- Doing COR ---')
>>> +    log('')
>>> +
>>> +    vm.launch()
>>> +
>>> +    log(vm.qmp('blockdev-add',
>>> +               node_name='node0',
>>> +               driver='copy-on-read',
>>> +               bottom='node2',
>>> +               file={
>>> +                   'driver': iotests.imgfmt,
>>> +                   'file': {
>>> +                       'driver': 'file',
>>> +                       'filename': top_img_path
>>> +                   },
>>> +                   'backing': {
>>> +                       'node-name': 'node2',
>>> +                       'driver': iotests.imgfmt,
>>> +                       'file': {
>>> +                           'driver': 'file',
>>> +                           'filename': mid_img_path
>>> +                       },
>>> +                       'backing': {
>>> +                           'driver': iotests.imgfmt,
>>> +                           'file': {
>>> +                               'driver': 'file',
>>> +                               'filename': base_img_path
>>> +                           }
>>> +                       },
>>> +                   }
>>> +               }))
>>> +
>>> +    # Trigger COR
>>> +    log(vm.qmp('human-monitor-command',
>>> +               command_line='qemu-io node0 "read 0 5M"'))
>>> +
>>> +    vm.shutdown()
>>> +
>>> +    log('')
>>> +    log('--- Checking COR result ---')
>>> +    log('')
>>> +
>>> +    assert qemu_io_silent(base_img_path, '-c', 'discard 0 4M') == 0
>>> +    assert qemu_io_silent(mid_img_path, '-c', 'discard 0M 5M') == 0
>>
>> The data discard leaves behind is undefined, so this may not result in 
>> zeroes.  (In fact, the test does fail for me with vmdk, qed, and 
>> qcow.)  'write -z' would work better, although perhaps you 
>> intentionally chose discard to just drop the data from the backing 
>> images.
>>
>> In that case, you could also recreate the middle image, so it’s empty 
>> then – the only problem with that is that it’ll break VMDK because it 
>> stores this reference to its backing image, and if the backing image 
>> is changed, you’ll get EINVAL when falling back to it...
>>
>> (The same goes for overwriting any data in the backing image, though, 
>> be it with discard, write -z, or write -P 0.  So I suppose VMDK just 
>> won’t work with this test.)
>>
> 
> I think the goal is just to be sure the following reads read from the 
> top and check exactly that COR works.
> 
> So we can just use 'write -z'.. Or, we can changed the backing file of 
> top_img to nothing instead. Can qemu-img do it?

Yes, with rebase -u -b ''.  (I think I tested that, and that too didn’t 
work for all formats, though...?)

Max


