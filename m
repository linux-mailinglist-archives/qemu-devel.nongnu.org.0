Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F541EE5C3
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Jun 2020 15:50:13 +0200 (CEST)
Received: from localhost ([::1]:57360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jgqG5-0003jo-1F
	for lists+qemu-devel@lfdr.de; Thu, 04 Jun 2020 09:50:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jgqFJ-0002uc-CG
 for qemu-devel@nongnu.org; Thu, 04 Jun 2020 09:49:25 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:27609
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jgqFI-0008PM-BI
 for qemu-devel@nongnu.org; Thu, 04 Jun 2020 09:49:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591278562;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=GCuGFBletd3kYcazWN7Iq9CavMhcRMptPsSvboCkhLo=;
 b=buC0Y7cFsm6/RWyqEGnWG2t0bSM8aLXfFgUZJV8iAJrSoP3iTJvjnfmdxjMs7Uj/sM64FB
 p43jUqcSrDcu1Qayzbp1+FPJ9KXk/HPEEehzqAqPIKB7Xmt3q6lW8IAdNUYKxzHntrh/Ne
 QKukZoBfOWXUNMMOKjdwcN7OLKabM+Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-217-beu_06mwNLyjY1Na84iYlA-1; Thu, 04 Jun 2020 09:49:19 -0400
X-MC-Unique: beu_06mwNLyjY1Na84iYlA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D1B10107ACCA;
 Thu,  4 Jun 2020 13:49:18 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-105.ams2.redhat.com [10.36.112.105])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 95A5F5D9CD;
 Thu,  4 Jun 2020 13:49:14 +0000 (UTC)
Subject: Re: [PATCH v6 4/4] new qTest case to test the vhost-user-blk-server
From: Thomas Huth <thuth@redhat.com>
To: Coiby Xu <coiby.xu@gmail.com>, qemu-devel@nongnu.org
References: <20200530171441.660814-1-coiby.xu@gmail.com>
 <20200530171441.660814-5-coiby.xu@gmail.com>
 <e28c954b-3125-223a-441b-c713a7a6e644@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <697a22d3-0987-4ebf-9fe0-b6c341f48cc6@redhat.com>
Date: Thu, 4 Jun 2020 15:49:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <e28c954b-3125-223a-441b-c713a7a6e644@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/04 01:31:23
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: kwolf@redhat.com, bharatlkmlkvm@gmail.com, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04/06/2020 15.42, Thomas Huth wrote:
> On 30/05/2020 19.14, Coiby Xu wrote:
>> This test case has the same tests as tests/virtio-blk-test.c except for
>> tests have block_resize. Since vhost-user server can only server one
>> client one time, two instances of qemu-storage-daemon are launched
>> for the hotplug test.
>>
>> In order to not block scripts/tap-driver.pl, vhost-user-blk-server will
>> send "quit" command to qemu-storage-daemon's QMP monitor. So a function
>> is added to libqtest.c to establish socket connection with socket
>> server.
>>
>> Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
>> ---
>>  tests/Makefile.include              |   3 +-
>>  tests/qtest/Makefile.include        |   2 +
>>  tests/qtest/libqos/vhost-user-blk.c | 126 +++++
>>  tests/qtest/libqos/vhost-user-blk.h |  44 ++
>>  tests/qtest/libqtest.c              |  44 +-
>>  tests/qtest/libqtest.h              |  38 ++
>>  tests/qtest/vhost-user-blk-test.c   | 741 ++++++++++++++++++++++++++++
>>  7 files changed, 966 insertions(+), 32 deletions(-)
>>  create mode 100644 tests/qtest/libqos/vhost-user-blk.c
>>  create mode 100644 tests/qtest/libqos/vhost-user-blk.h
>>  create mode 100644 tests/qtest/vhost-user-blk-test.c
> [...]
>>  qos-test-obj-y += tests/qtest/virtio-scsi-test.o
>> diff --git a/tests/qtest/libqos/vhost-user-blk.c b/tests/qtest/libqos/vhost-user-blk.c
>> new file mode 100644
>> index 0000000000..ec46b7ddb4
>> --- /dev/null
>> +++ b/tests/qtest/libqos/vhost-user-blk.c
>> @@ -0,0 +1,126 @@
>> +/*
>> + * libqos driver framework
>> + *
>> + * Copyright (c) 2018 Emanuele Giuseppe Esposito <e.emanuelegiuseppe@gmail.com>
> 
> Don't you want to add a remark here for you, too?
> 
>> + * This library is free software; you can redistribute it and/or
>> + * modify it under the terms of the GNU Lesser General Public
>> + * License version 2 as published by the Free Software Foundation.
> 
> Could you please change "version 2" into "verion 2.1" ? There never was
> a "version 2" of the LGPL, only version 2.1 (or 3.x).

I meant, there never was a version 2 of the "Lesser GPL". Version 2.0 of
the license was still called "Library GPL" instead.

 Thomas


