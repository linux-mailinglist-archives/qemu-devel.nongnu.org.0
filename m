Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 031B03D3BB7
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 16:16:58 +0200 (CEST)
Received: from localhost ([::1]:37596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6vyz-0003GP-2S
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 10:16:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1m6vxZ-0001qH-3V
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 10:15:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24279)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1m6vxW-0002la-Va
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 10:15:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627049725;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ywdHtteihv+FbG8f6jnwewNjRN3/+cQNlU9BRmF35YQ=;
 b=PbVBiYh8UeVUtVCuQ1CjbSJ+yuh1xB6mf0r8mdXS2eZbsTHAIdYIb0dyRtML+XEvIbpNb3
 aMVCAu/jwd0qiM/olDbsQPHJEgHd2ZXzrzFfrtHRbFssbaz5KMRwrtEM782RjjYlli7EB/
 qtNBbSmTNrWq4CacyN57bmWeXhgY+Qg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-489-hEvKRtvxOnqq7mFDXizXdQ-1; Fri, 23 Jul 2021 10:14:50 -0400
X-MC-Unique: hEvKRtvxOnqq7mFDXizXdQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A40B2C7404;
 Fri, 23 Jul 2021 14:14:48 +0000 (UTC)
Received: from p50.localhost.localdomain.some.host.somewhere.org
 (ovpn-117-22.rdu2.redhat.com [10.10.117.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1B45810016F7;
 Fri, 23 Jul 2021 14:14:46 +0000 (UTC)
References: <20210722154326.1464-1-wangyanan55@huawei.com>
 <20210722154326.1464-2-wangyanan55@huawei.com>
 <874kcm0ywx.fsf@p50.localhost.localdomain>
 <38c23728-e2b4-cbd2-450f-ed4c95c7fba4@huawei.com>
User-agent: mu4e 1.4.15; emacs 27.2
From: Cleber Rosa <crosa@redhat.com>
To: "wangyanan (Y)" <wangyanan55@huawei.com>
Subject: Re: [PATCH for-6.1 v2] machine: Disallow specifying topology
 parameters as zero
In-reply-to: <38c23728-e2b4-cbd2-450f-ed4c95c7fba4@huawei.com>
Date: Fri, 23 Jul 2021 10:14:46 -0400
Message-ID: <87zgudyv55.fsf@p50.localhost.localdomain>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 =?utf-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Pierre Morel <pmorel@linux.ibm.com>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>, Cornelia Huck <cohuck@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 wanghaibin.wang@huawei.com, yuzenghui@huawei.com,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


wangyanan (Y) writes:

> Hi Cleber,
>
> On 2021/7/23 6:25, Cleber Rosa wrote:
>> Yanan Wang writes:
>>
>>> In the SMP configuration, we should either specify a topology
>>> parameter with a reasonable value (equal to or greater than 1)
>>> or just leave it omitted and QEMU will calculate its value.
>>> Configurations which explicitly specify the topology parameters
>>> as zero like "sockets=0" are meaningless, so disallow them.
>>>
>>> However, the commit 1e63fe685804d
>>> (machine: pass QAPI struct to mc->smp_parse) has documented that
>>> '0' has the same semantics as omitting a parameter in the qapi
>>> comment for SMPConfiguration. So this patch fixes the doc and
>>> also adds the corresponding sanity check in the smp parsers.
>>>
>>> Suggested-by: Andrew Jones <drjones@redhat.com>
>>> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
>>> ---
>>>   hw/core/machine.c | 14 ++++++++++++++
>>>   qapi/machine.json |  6 +++---
>>>   qemu-options.hx   | 12 +++++++-----
>>>   3 files changed, 24 insertions(+), 8 deletions(-)
>> Hi Yanan,
>>
>> This looks somewhat similar to this very old patch of mine:
>>
>>     https://mail.gnu.org/archive/html/qemu-devel/2020-10/msg03039.html
>>
>> I'm putting a reference here because I believe the test can be salvaged
>> and slightly adapted for this patch of yours.
>>
>> Let me know if I can help anyhow.
>>
> Thanks for this.
> I was introducing an unit test for the smp parsing in [1], in which all
> possible valid and invalid smp configs were covered, and actually the
> "parameter=0" stuff was also covered. You can have a look, and
> suggestions are welcome. I'm not sure we need two different tests
> for the same part. :)
>

Right, I only saw the other series later.  Nice work there!

- Cleber.


