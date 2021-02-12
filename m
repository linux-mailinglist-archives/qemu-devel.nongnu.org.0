Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE510319D84
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 12:47:31 +0100 (CET)
Received: from localhost ([::1]:47114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAWv4-0001A9-VO
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 06:47:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lAWsk-00004y-Kx
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 06:45:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21282)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lAWsg-0000Ls-Gp
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 06:45:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613130301;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hOL/6ydtL7u+GYpGM8c92Wqs0QI2nkshpfKxsy5RXkA=;
 b=U5OsjWT8zzHdGQFq/mMapRDPZoOIgM4JqiqbbhqGtqD0nfOiIGLdTfvIxDdgUAXlNqSUv1
 k7vsF5gNv8BhEO1d9S7s7uSiHENudFRApZeWMijxO5dHCZJA8cYSEgQTrcZcaO6iJ7+PhT
 7Ats6DLeyy9PdL4+KlFH5Xn4904anm0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-537-p-m49s1dM3OtC_SBpOCoCQ-1; Fri, 12 Feb 2021 06:44:59 -0500
X-MC-Unique: p-m49s1dM3OtC_SBpOCoCQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3004E835E20;
 Fri, 12 Feb 2021 11:44:58 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-27.ams2.redhat.com [10.36.112.27])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E72E060C5A;
 Fri, 12 Feb 2021 11:44:56 +0000 (UTC)
Subject: Re: getting the console output for s390 cdrom-test?
To: Peter Maydell <peter.maydell@linaro.org>, Cornelia Huck <cohuck@redhat.com>
References: <CAFEAcA8=vG-2Vzrdark8VC5NANe5Fb3qGTpSFk8X94KvXszTbA@mail.gmail.com>
 <c98d4f43-5a29-afcc-fe7d-a3d92063df3a@redhat.com>
 <CAFEAcA8q1ewJ4F-pijt81Qc_rO0xNpy6jJY2DrW0ggTzg27aEQ@mail.gmail.com>
 <5213f033-19dc-bc40-bfd7-10b8c676539b@redhat.com>
 <CAFEAcA-va8hY3tHrhK_UV0bniF=VhietM2Y8ovZt57wWkg8f_w@mail.gmail.com>
 <CAFEAcA_JLx6NAd_YPzKy6iXWqP_c1jkW42bscK+Q=zKN4xAbzQ@mail.gmail.com>
 <20210209181009.7f2cb328.cohuck@redhat.com>
 <CAFEAcA_u7eKMyKKLf1sdMOgW7OPRt9hXiv5aDkfyfJcOfM6XFA@mail.gmail.com>
 <20210209182400.4fe15232.cohuck@redhat.com>
 <CAFEAcA99CxOv9UnzS7sehHhB5mi9P5CtchopqhwyAv=are1y7A@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <97770e1f-0b18-98fb-5b65-4211ff5465f7@redhat.com>
Date: Fri, 12 Feb 2021 12:44:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA99CxOv9UnzS7sehHhB5mi9P5CtchopqhwyAv=are1y7A@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.119, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: qemu-s390x <qemu-s390x@nongnu.org>, Eric Farman <farman@linux.ibm.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 09/02/2021 19.25, Peter Maydell wrote:
> On Tue, 9 Feb 2021 at 17:24, Cornelia Huck <cohuck@redhat.com> wrote:
>>
>> On Tue, 9 Feb 2021 17:17:19 +0000
>> Peter Maydell <peter.maydell@linaro.org> wrote:
>>
>>> On Tue, 9 Feb 2021 at 17:10, Cornelia Huck <cohuck@redhat.com> wrote:
>>>>
>>>> On Tue, 9 Feb 2021 14:58:53 +0000
>>>> Peter Maydell <peter.maydell@linaro.org> wrote:
>>>>> This change significantly reduces the frequency with which I see
>>>>> the hang; but it doesn't get rid of it altogether. Also I couldn't
>>>>> really figure out from the virtio spec exactly where barriers
>>>>> were required: I think I would need to read the whole thing in
>>>>> more detail rather than trying to fish out the information by
>>>>> just reading small pieces of it.
>>>>
>>>> The Linux virtio-ccw code uses 'weak barriers', i.e. the heavy bcr15
>>>> should not be needed. We might well miss other (lightweight) barriers
>>>> in other parts of the code part, though.
>>>
>>> Is that the version the Linux kernel has as
>>>    /* Fast-BCR without checkpoint synchronization */
>>>    #define __ASM_BARRIER "bcr 14,0\n"
>>>
>>> ?
>>
>> No, just a simple memory barrier in most places (bcr15 and bcr14 do
>> serialization).
> 
> OK; if you let me know how that's written for s390 I can give
> it a test...

I guess Cornelia simply meant a:

  asm volatile("nop":::"memory");

Anyway, I've now succeeded in getting my hands on an aarch64 host and tried 
to reproduce the issue, but even after running it in a loop like this:

  for ((x=0;x<200;x++)) ; do \
   QTEST_QEMU_BINARY=./qemu-system-s390x tests/qtest/cdrom-test \
   || break ; \
  done

... I was not able to reproduce the issue. What kind of host distro are you 
using there? Could the exact host CPU type matter here, too? (I was running 
my code on an HPE Apollo system, with Fedora 33, gcc 10.2)

  Thomas


