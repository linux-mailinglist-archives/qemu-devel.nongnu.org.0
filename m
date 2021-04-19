Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A5383649D2
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 20:30:09 +0200 (CEST)
Received: from localhost ([::1]:59522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYYeo-00008O-Im
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 14:30:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lYYau-0006zN-72
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 14:26:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33320)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lYYag-0004Fq-Nd
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 14:25:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618856743;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YkgTRWMsH9tk+lWH64kvtl/PnkiUkROn8049CeHdGFY=;
 b=TWmNeZcrl6AWyzy63HlXdzs3ieubKrAUCFX0cp3+65Oj8xPJr0e3NDM7KEE12AWpH041zO
 Q6jMAkVzAOb8OULay6BqHr4pKbwwQeA5l9XGvFM3lHhbgVAUA7DYy1iMqDAgOdajxynxfv
 mxoZm4Nnl0nmoXtYfe9zh5iFXR+Cqmk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-119-vlFve9DhMFamGas-OLTxzA-1; Mon, 19 Apr 2021 14:25:41 -0400
X-MC-Unique: vlFve9DhMFamGas-OLTxzA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8E3608B5DC3;
 Mon, 19 Apr 2021 18:25:39 +0000 (UTC)
Received: from wainer-laptop.localdomain (ovpn-116-102.gru2.redhat.com
 [10.97.116.102])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B05F810013D7;
 Mon, 19 Apr 2021 18:25:24 +0000 (UTC)
Subject: Re: [PATCH 3/8] tests/acceptance/linux_ssh_mips_malta.py: drop
 identical setUp
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Cleber Rosa <crosa@redhat.com>
References: <20210415215141.1865467-1-crosa@redhat.com>
 <20210415215141.1865467-4-crosa@redhat.com>
 <229a10ef-b912-2191-c670-a2c74a0870a4@amsat.org>
 <20210416154356.GB1914548@amachine.somewhere>
 <15232a34-9cc1-a9cb-3261-ee61d53976d1@amsat.org>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <6bb40cf1-88c4-0ec6-4752-6d9b945c7a70@redhat.com>
Date: Mon, 19 Apr 2021 15:25:21 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <15232a34-9cc1-a9cb-3261-ee61d53976d1@amsat.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wainersm@redhat.com;
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
Cc: Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, qemu-devel@nongnu.org,
 Willian Rampazzo <willianr@redhat.com>, Auger Eric <eric.auger@redhat.com>,
 qemu-s390x@nongnu.org, Willian Rampazzo <wrampazz@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 4/16/21 2:46 PM, Philippe Mathieu-Daudé wrote:
> On 4/16/21 5:43 PM, Cleber Rosa wrote:
>> On Fri, Apr 16, 2021 at 07:26:05AM +0200, Philippe Mathieu-Daudé wrote:
>>> On 4/15/21 11:51 PM, Cleber Rosa wrote:
>>>> These tests' setUp do not do anything beyong what their base class do.
>>>> And while they do decorate the setUp() we can decorate the classes
>>>> instead, so no functionality is lost here.
>>> This is what I did first when adding this test, but it was not working,
>>> so I had to duplicate it to each method. Did something change so now
>>> this is possible?
>>>
>> It did, but quite a while ago:
>>
>>    https://avocado-framework.readthedocs.io/en/87.0/releases/76_0.html#users-test-writers
> OK, the test is older. Do you mind adding a comment?
>
> "Since Avocado 76.0 we can decorate setUp() directly, ..."

Ditto.

Also you may want to adjust VirtiofsSubmountsTest.setUp() in 
tests/acceptance/virtiofs_submounts.py as well.

- Wainer

>
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>
>> It could have been updated much earlier, but, better late than never.
> Sure :)
>
> Thanks,
>
> Phil.
>


