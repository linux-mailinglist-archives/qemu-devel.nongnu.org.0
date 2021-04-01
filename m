Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E99C351307
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 12:06:59 +0200 (CEST)
Received: from localhost ([::1]:33266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRuE6-0004jA-99
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 06:06:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lRuCZ-0003lH-FP
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 06:05:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lRuCO-0006dB-Hp
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 06:05:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617271509;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EumhMr2Z1cj6bbKn3Ux4C/IVqHUOWe/BqwSAmQewuso=;
 b=A44uT/QPWXe8wg8V5cC0yjrTYVqnZqsKbb4obQRmOjPOYrIbTjlIH6RzWMf32TKdfPAacL
 /13FvmPV5huPYSz+6fEgqJTVduUkcbQu4YvISjIBdKRKDZhlcEXN01drfmfpjsNuLXwAt0
 54JIwzmvYZ+bdlV81lzS+B/QdDMfdmQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-67-vP2h2L99MK6TbZmtlmsosw-1; Thu, 01 Apr 2021 06:05:07 -0400
X-MC-Unique: vP2h2L99MK6TbZmtlmsosw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5171A107ACCA;
 Thu,  1 Apr 2021 10:05:06 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-114-60.ams2.redhat.com
 [10.36.114.60])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2C9865C1BB;
 Thu,  1 Apr 2021 10:05:04 +0000 (UTC)
Subject: Re: [PATCH] iotests: Test mirror-top filter permissions
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210331122815.51491-1-mreitz@redhat.com>
 <263c7339-2ac7-c34a-eb71-67148f075e25@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <8332323c-bd34-ad2d-71fe-9e8cde42e224@redhat.com>
Date: Thu, 1 Apr 2021 12:05:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <263c7339-2ac7-c34a-eb71-67148f075e25@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01.04.21 10:32, Vladimir Sementsov-Ogievskiy wrote:
> 31.03.2021 15:28, Max Reitz wrote:
>> Add a test accompanying commit 53431b9086b2832ca1aeff0c55e186e9ed79bd11
>> ("block/mirror: Fix mirror_top's permissions").
>>
>> Signed-off-by: Max Reitz <mreitz@redhat.com>
>> ---
>>   tests/qemu-iotests/tests/mirror-top-perms     | 121 ++++++++++++++++++
>>   tests/qemu-iotests/tests/mirror-top-perms.out |   5 +
>>   2 files changed, 126 insertions(+)
>>   create mode 100755 tests/qemu-iotests/tests/mirror-top-perms
>>   create mode 100644 tests/qemu-iotests/tests/mirror-top-perms.out
>>
>> diff --git a/tests/qemu-iotests/tests/mirror-top-perms 
>> b/tests/qemu-iotests/tests/mirror-top-perms
>> new file mode 100755
>> index 0000000000..451a0666f8
>> --- /dev/null
>> +++ b/tests/qemu-iotests/tests/mirror-top-perms
>> @@ -0,0 +1,121 @@
>> +#!/usr/bin/env python3
>> +# group: rw
>> +#
>> +# Test permissions taken by the mirror-top filter
>> +#
>> +# Copyright (C) 2021 Red Hat, Inc.
>> +#
>> +# This program is free software; you can redistribute it and/or modify
>> +# it under the terms of the GNU General Public License as published by
>> +# the Free Software Foundation; either version 2 of the License, or
>> +# (at your option) any later version.
>> +#
>> +# This program is distributed in the hope that it will be useful,
>> +# but WITHOUT ANY WARRANTY; without even the implied warranty of
>> +# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> +# GNU General Public License for more details.
>> +#
>> +# You should have received a copy of the GNU General Public License
>> +# along with this program.  If not, see <http://www.gnu.org/licenses/>.
>> +#
>> +
>> +import os
>> +import iotests
>> +from iotests import qemu_img
>> +
>> +# Import qemu after iotests.py has amended sys.path
>> +# pylint: disable=wrong-import-order
>> +import qemu
>> +
>> +
>> +image_size = 1 * 1024 * 1024
>> +source = os.path.join(iotests.test_dir, 'source.img')
>> +
>> +
>> +class TestMirrorTopPerms(iotests.QMPTestCase):
>> +    def setUp(self):
>> +        assert qemu_img('create', '-f', iotests.imgfmt, source,
>> +                        str(image_size)) == 0
>> +        self.vm = iotests.VM()
>> +        self.vm.add_drive(source)
>> +        
>> self.vm.add_blockdev(f'null-co,node-name=null,size={image_size}')
>> +        self.vm.launch()
>> +
>> +        # Will be created by the test function itself
>> +        self.vm_b = None
>> +
>> +    def tearDown(self):
>> +        try:
>> +            self.vm.shutdown()
>> +        except qemu.machine.AbnormalShutdown:
>> +            pass
>> +
>> +        if self.vm_b is not None:
>> +            self.vm_b.shutdown()
>> +
>> +        os.remove(source)
>> +
>> +    def test_cancel(self):
>> +        """
>> +        Before commit 53431b9086b28, mirror-top used to not take any
>> +        permissions but WRITE and share all permissions.  Because it
>> +        is inserted between the source's original parents and the
>> +        source, there generally was no parent that would have taken or
>> +        unshared any permissions on the source, which means that an
>> +        external process could access the image unhindered by locks.
>> +        (Unless there was a parent above the protocol node that would
>> +        take its own locks, e.g. a format driver.)
>> +        This is bad enough, but if the mirror job is then cancelled,
>> +        the mirroring VM tries to take back the image, restores the
>> +        original permissions taken and unshared, and assumes this must
>> +        just work.  But it will not, and so the VM aborts.
>> +
>> +        Commit 53431b9086b28 made mirror keep the original permissions
>> +        and so no other process can "steal" the image.
>> +
>> +        (Note that you cannot really do the same with the target image
>> +        and then completing the job, because the mirror job always
>> +        took/unshared the correct permissions on the target.  For
>> +        example, it does not share READ_CONSISTENT, which makes it
>> +        difficult to let some other qemu process open the image.)
>> +        """
>> +
>> +        result = self.vm.qmp('blockdev-mirror',
>> +                             job_id='mirror',
>> +                             device='drive0',
>> +                             target='null',
>> +                             sync='full')
>> +        self.assert_qmp(result, 'return', {})
>> +
>> +        self.vm.event_wait('BLOCK_JOB_READY')
>> +
>> +        # We want this to fail because the image cannot be locked.
>> +        # If it does not fail, continue still and see what happens.
> 
> This comment is about vm_b.launch(), not about creating vm object. 
> Probably better to move it down

I kind of meant this as a general comment on what this VM is for.  I 
think I kind of like any comment here, and I don’t see a practical 
advantage in having this comment above the try-except, because the whole 
“launch VM, see it fail” block is kind of one monolithic concept.

>> +        self.vm_b = iotests.VM(path_suffix='b')
>> +        # Must use -blockdev -device so we can use share-rw.
>> +        # (And we need share-rw=on because mirror-top was always
>> +        # forced to take the WRITE permission so it can write to the
>> +        # source image.)
>> +        
>> self.vm_b.add_blockdev(f'file,node-name=drive0,filename={source}')
>> +        self.vm_b.add_device('virtio-blk,drive=drive0,share-rw=on')
>> +        try:
>> +            self.vm_b.launch()
>> +            print('ERROR: VM B launched successfully, this should not 
>> have '
>> +                  'happened')
> 
> probably iotests.log() is better here.

No, because logging is disabled, and so it wouldn’t be visible.  I’d 
need to enable logging, which would make the test quite different overall.

Max

>> +        except qemu.qmp.QMPConnectError:
>> +            assert 'Is another process using the image' in 
>> self.vm_b.get_log()
>> +
>> +        result = self.vm.qmp('block-job-cancel',
>> +                             device='mirror')
>> +        self.assert_qmp(result, 'return', {})
>> +
>> +        self.vm.event_wait('BLOCK_JOB_COMPLETED')
>> +
>> +
>> +if __name__ == '__main__':
>> +    # No metadata format driver supported, because they would for
>> +    # example always unshare the WRITE permission.  The raw driver
>> +    # just passes through the permissions from the guest device, and
>> +    # those are the permissions that we want to test.
>> +    iotests.main(supported_fmts=['raw'],
>> +                 supported_protocols=['file'])
>> diff --git a/tests/qemu-iotests/tests/mirror-top-perms.out 
>> b/tests/qemu-iotests/tests/mirror-top-perms.out
>> new file mode 100644
>> index 0000000000..ae1213e6f8
>> --- /dev/null
>> +++ b/tests/qemu-iotests/tests/mirror-top-perms.out
>> @@ -0,0 +1,5 @@
>> +.
>> +----------------------------------------------------------------------
>> +Ran 1 tests
>> +
>> +OK
>>
> 
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> 


