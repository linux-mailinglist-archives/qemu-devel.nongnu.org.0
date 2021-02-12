Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3960131A067
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 15:14:38 +0100 (CET)
Received: from localhost ([::1]:33540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAZDR-00051z-A3
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 09:14:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lAZ9l-0003My-IO
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 09:10:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41476)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lAZ9i-0005lL-U2
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 09:10:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613139046;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bxglYLiCEcBKahLWGSnt/GwxKa7LQKfVI0Cki6lRxMg=;
 b=M2vppx2DCD1fjlBu8nSzyei4TXHVu06IK5rJe+UZs6AJBoCa1iOdCbaNa2KgNg+V7nz7Xl
 la0Ku8kwsRCm/5o/THS2T4XySqtqyGvdSYLW8mDB2kaA5QNr5xnvE0JKwdvhs3UK+1Y8x/
 NgzDpS9Y/z0IIxHeei/Ntmt5VgESXJc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-601-GIi-DqaFPaWBmYSyfmHgMQ-1; Fri, 12 Feb 2021 09:10:44 -0500
X-MC-Unique: GIi-DqaFPaWBmYSyfmHgMQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EC95210CE784;
 Fri, 12 Feb 2021 14:10:42 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-27.ams2.redhat.com [10.36.112.27])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6E33A6F445;
 Fri, 12 Feb 2021 14:10:41 +0000 (UTC)
Subject: Re: getting the console output for s390 cdrom-test?
To: Peter Maydell <peter.maydell@linaro.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>
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
 <97770e1f-0b18-98fb-5b65-4211ff5465f7@redhat.com>
 <CAFEAcA99R8Fc1+S2SS31KAA8tsGx-BSgP5FaH37fYeE4gJa0Sw@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <64011f66-3911-131a-700c-cac504b4e0cc@redhat.com>
Date: Fri, 12 Feb 2021 15:10:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA99R8Fc1+S2SS31KAA8tsGx-BSgP5FaH37fYeE4gJa0Sw@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
Cc: qemu-s390x <qemu-s390x@nongnu.org>, Eric Farman <farman@linux.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/02/2021 13.05, Peter Maydell wrote:
> On Fri, 12 Feb 2021 at 11:45, Thomas Huth <thuth@redhat.com> wrote:
>> I guess Cornelia simply meant a:
>>
>>   asm volatile("nop":::"memory");
> 
> That will force the compiler not to reorder, but it doesn't
> seem to me that it would really force the memory accesses to
> appear to the other host CPU thread that's running the device
> emulation. So either it's insufficient in the s390 memory model,
> or our s390 emulation isn't being sufficiently rigorous about
> implementing the memory model...

AFAIK s390x has a very strict memory ordering model... so maybe this is a 
problem with emulating a strict CPU on a less strict host CPU, indeed? ... 
CC:-ing Christian and Richard, maybe they have some additional ideas here...

  Thomas


