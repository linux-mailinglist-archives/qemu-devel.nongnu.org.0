Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7955C2C272B
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 14:29:22 +0100 (CET)
Received: from localhost ([::1]:41022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khYNl-00076S-Iy
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 08:29:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crobinso@redhat.com>)
 id 1khYK0-0005IW-6L
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 08:25:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46119)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <crobinso@redhat.com>)
 id 1khYJw-00081w-FD
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 08:25:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606224323;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KigJEyuYHDCLdA0tURPZRqa0sbPKwYVYz53MrTMbkDs=;
 b=GZxDECpZlzRM/KI8Wag7rS9Ymk/06mbaQGolxcSc88Q0ayp63yhfhbkDxabjmAyNlpeZ5Q
 /l3EkYE1couoxsiyhuhW6o5xZa8hGURbG3F/j3OPo72Lv3W9iMrmD6plb86UzB28LFOEdb
 874czRyvvTKU2mbgM1dSTweAUyUu8kc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-133-ZIKU0HVqNgyT5pq7oU6q7Q-1; Tue, 24 Nov 2020 08:25:20 -0500
X-MC-Unique: ZIKU0HVqNgyT5pq7oU6q7Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A543D108E1A1;
 Tue, 24 Nov 2020 13:25:18 +0000 (UTC)
Received: from [10.10.114.132] (ovpn-114-132.rdu2.redhat.com [10.10.114.132])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1F45C60C4D;
 Tue, 24 Nov 2020 13:25:18 +0000 (UTC)
Subject: Re: virtio-9p-test.c:300:v9fs_req_recv: assertion failed (hdr.id ==
 id): (7 == 73)
To: Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org
References: <fad8a69d-9c21-ac25-028d-646a64ccecc5@redhat.com>
 <20201123141734.0c03f21a@bahia.lan> <7836238.thhSn8XZEd@silver>
 <13275468.fAp1jBoSgB@silver>
From: Cole Robinson <crobinso@redhat.com>
Message-ID: <163aa0fa-f8d2-84e8-7a01-1befa4f4731a@redhat.com>
Date: Tue, 24 Nov 2020 08:25:17 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <13275468.fAp1jBoSgB@silver>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crobinso@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=crobinso@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Greg Kurz <groug@kaod.org>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/23/20 2:45 PM, Christian Schoenebeck wrote:
> On Montag, 23. November 2020 14:48:15 CET Christian Schoenebeck wrote:
>> On Montag, 23. November 2020 14:17:34 CET Greg Kurz wrote:
>>> Fixed maintainer's address: s/oss@crudebyte.com/qemu_oss@crudebyte.com
>>>
>>> On Sat, 21 Nov 2020 17:03:14 -0500
>>>
>>> Cole Robinson <crobinso@redhat.com> wrote:
>>>> Hi, I'm consistently seeing this assertion running the qemu-5.2.0  test
>>>> suite. rc0, rc1, rc2 have been consistently affected, it reproduces
>>>> consistently in parts of Fedora's build system. Here's an example build
>>>> log for rc2 x86 against Fedora 32
>>>>
>>>> https://download.copr.fedorainfracloud.org/results/@kubevirt/qemu-5.2.0-> > > 0.
>>>> 6.rc2/fedora-32-x86_64/01781514-qemu/builder-live.log.gz
>>>>
>>>> The full test error:
>>>>
>>>> ...
>>>> PASS 26 qtest-arm/qos-test
>>>> /arm/virt/virtio-mmio/virtio-bus/virtio-9p-device/virtio-9p/virtio-9p-te
>>>> st
>>>> s/synth/readdir/split_128 PASS 27 qtest-arm/qos-test
>>>> /arm/virt/virtio-mmio/virtio-bus/virtio-9p-device/virtio-9p/virtio-9p-te
>>>> st
>>>> s/local/config
>>>
>>> Ok so the next test is supposed to be:
>>>
>>> /arm/virt/virtio-mmio/virtio-bus/virtio-9p-device/virtio-9p/virtio-9p-test
>>> s/ local/create_dir
>>>
>>> This was added recently. This configures the virtio-9p device in QEMU
>>> to serve a real test directory from the host. This test directory is
>>> created under the current directory of the test process. The purpose
>>> of the test is then to ask the 9p server to create a directory within
>>> the test directory.
>>>
>>>> Received response 7 (RLERROR) instead of 73 (RMKDIR)
>>>> ERROR qtest-arm/qos-test - Bail out!
>>>> ERROR:../tests/qtest/virtio-9p-test.c:300:v9fs_req_recv: assertion
>>>> failed (hdr.id == id): (7 == 73)
>>>> Rlerror has errno 95 (Operation not supported)
>>>
>>> So this basically means that QEMU got ENOTSUP/EOPNOTSUPP when calling
>>> mkdir() into the test directory... not sure what could cause that. I'd
>>> need more details on the filesystem setup for the build.
>>>
>>> Anyway, we already experienced some breakage in upstream CI because of
>>> the same family of tests that do real access to the host filesystem.
>>> Since they're being introduced in QEMU 5.2, I'll try to see if I can
>>> disable them to be run by default for RC3.
>>>
>>> Cheers,
>>>
>>> --
>>> Greg
>>>
>>>> **
>>>> ERROR:../tests/qtest/virtio-9p-test.c:300:v9fs_req_recv: assertion
>>>> failed (hdr.id == id): (7 == 73)
>>>> make: *** [Makefile.mtest:1257: run-test-155] Error 1
>>>> error: Bad exit status from /var/tmp/rpm-tmp.EG4Dav (%check)
>>>>
>>>>
>>>> Thanks,
>>>> Cole
>>
>> Yeah, looks like the mkdir() call which is supposed to create the 9p test
>> directory, is failing there for some reason. The question is how to find
>> that out (effectively) without having access to an affected system.
>>
>> It's now too late for 5.2, but I think for 6.0 it would make sense
>> introducing a dedicated 9p option loglevel=..., so we can tell people to
>> enable this to capture the precise source location where an error ocurred.
>> That would mean spreading a huge bunch of macros all over the 9p code base,
>> but it would definitely help a lot understanding the root cause of reported
>> issues in an efficient way.
>>
>> Best regards,
>> Christian Schoenebeck
> 
> Cole, does the affected host system probably not have xattrs enabled on its 
> file system?
> 

Hmm I'm not sure, I will try to investigate.

google tells me David Gilbert also hit this too earlier:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg754556.html

Maybe he remembers details of his setup, CC'd

- Cole


