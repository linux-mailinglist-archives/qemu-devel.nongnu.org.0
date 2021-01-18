Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BF782FA441
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 16:13:59 +0100 (CET)
Received: from localhost ([::1]:53988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1WEA-0002KT-61
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 10:13:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l1WDB-0001jx-0Z
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 10:12:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37381)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l1WD8-0008SQ-7K
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 10:12:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610982773;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OjettLIT0srMQXm6M8vqujMH7mAhY+HWU2AczcxjVhs=;
 b=Y3FEXTbCDY7xADfskwER86svBJuBOMKfYfhp4kwV/BZ/Y9Zy6W+jYspD+RaKuGrSEjk1vl
 QG9h1JIvVSpuGXhaKqalypZjdEfLhKCsl7xQGeVak+GSFqqlDKCtxQMuhoxD4QYeNWSzX+
 8mqUhkdFoRiaYT2TYmZ8HDGt0JScCtI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-457-LT9BCj9vPFKexSP63dSzXw-1; Mon, 18 Jan 2021 10:12:51 -0500
X-MC-Unique: LT9BCj9vPFKexSP63dSzXw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 17C758066E5;
 Mon, 18 Jan 2021 15:12:50 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-189.ams2.redhat.com [10.36.112.189])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9BCB410016FA;
 Mon, 18 Jan 2021 15:12:43 +0000 (UTC)
Subject: Re: [PATCH v2 9/9] gitlab-ci: Add alpine to pipeline
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20210118063808.12471-1-jiaxun.yang@flygoat.com>
 <20210118063808.12471-10-jiaxun.yang@flygoat.com>
 <20210118101159.GC1789637@redhat.com>
 <fb7308f2-ecc7-48b8-9388-91fd30691767@www.fastmail.com>
 <307dea8e-148e-6666-c6f1-5cc66a54a7af@redhat.com>
 <20210118145016.GC1799018@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <a9d9fb1d-f356-adb4-3763-a015e0d13320@redhat.com>
Date: Mon, 18 Jan 2021 16:12:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210118145016.GC1799018@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.175,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.194, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Laurent Vivier <lvivier@redhat.com>,
 qemu-block@nongnu.org, Viktor Prutyanov <viktor.prutyanov@phystech.edu>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 BALATON Zoltan via <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, Greg Kurz <groug@kaod.org>,
 Max Reitz <mreitz@redhat.com>, qemu-ppc@nongnu.org, kvm@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18/01/2021 15.50, Daniel P. Berrangé wrote:
> On Mon, Jan 18, 2021 at 03:44:49PM +0100, Thomas Huth wrote:
>> On 18/01/2021 14.37, Jiaxun Yang wrote:
>>>
>>>
>>> On Mon, Jan 18, 2021, at 6:11 PM, Daniel P. Berrangé wrote:
>>>> On Mon, Jan 18, 2021 at 02:38:08PM +0800, Jiaxun Yang wrote:
>>>>> We only run build test and check-acceptance as their are too many
>>>>> failures in checks due to minor string mismatch.
>>>>
>>>> Can you give real examples of what's broken here, as that sounds
>>>> rather suspicious, and I'm not convinced it should be ignored.
>>>
>>> Mostly Input/Output error vs I/O Error.
>>
>> Right, out of curiosity, I also gave it a try:
>>
>>   https://gitlab.com/huth/qemu/-/jobs/969225330
>>
>> Apart from the "I/O Error" vs. "Input/Output Error" difference, there also
>> seems to be a problem with "sed" in some of the tests.
> 
> The "sed" thing sounds like something that ought to be investigated
> from a portability POV rather than ignored.

The weird thing is that we explicitly test for GNU sed in 
tests/check-block.sh and skip the iotests if it's not available... so I'm a 
little bit surprised that the iotests are run here with an apparently 
different version of sed...?

  Thomas


