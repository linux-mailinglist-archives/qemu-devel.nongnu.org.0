Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC2A37F8D6
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 15:34:26 +0200 (CEST)
Received: from localhost ([::1]:47710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhBTt-00034x-Ip
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 09:34:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lhBSR-0001fX-ER
 for qemu-devel@nongnu.org; Thu, 13 May 2021 09:32:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52273)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lhBSO-0001rV-4k
 for qemu-devel@nongnu.org; Thu, 13 May 2021 09:32:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620912770;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/hMZPQrTmMGgSjJyLWujUh7OW4QgFPdEWFDFvd9u0YE=;
 b=bAvmx30s5DDeMlDSFD9nk+yeK5O5+rqFCU/vxx+6lafcAF9pDYQlynB3pJ6E3CMykqxVQG
 xRelDJmnjogCOpuX18JEhicM2WJDjQGpIkQB4x5saTR0Tli/7aVJe7fLxaarCxk5BhDUHd
 NTt5tR7V/M2cF+W36Fu0CiKuJimvwKk=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-133-gndMIwX_OWmqdOgYKAURfg-1; Thu, 13 May 2021 09:32:47 -0400
X-MC-Unique: gndMIwX_OWmqdOgYKAURfg-1
Received: by mail-ed1-f72.google.com with SMTP id
 z12-20020aa7d40c0000b0290388179cc8bfso14580765edq.21
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 06:32:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/hMZPQrTmMGgSjJyLWujUh7OW4QgFPdEWFDFvd9u0YE=;
 b=OjVMAjS+VVw58jHIZ3PEXI53K0wzzcOJ4FPuJVw859Fsrmkb9hatSV1Euek5CaJy5W
 DgquXGi8DmUmYbxL3BcYSu9/utN2U/IpzIcj/l9hDX1PUEq9nnm0jD4a8OTy7VyVGGfC
 KuVKhsahDzUMn0c4gOQsubdwb7qVO7Jru8VIXeIKUaG0RGLjTXisYDQVjfTp4cgCCNpQ
 rB//ES1Gm6oeXxq6vLEmWsEqsJD04k2X6Ugdj/jeZGDqURXzuzeUtW2Vl6poZSm8uEqB
 4oI9KjUWpHrDk7R8SwPUNjwVP9TyY5wLsrDUIMZ+EvcdBKVlBgOj+aXQG/FMPW2pbuDo
 MaOQ==
X-Gm-Message-State: AOAM531Rdcp6weKrwdlZbpE4KUinXNr0bPCNjqOizL+H1ZmO3n3Bce2R
 xM7ZOH9HbXIFyJjis+y6tSS/+Wjk+OFi2N532k71/WzBTDg4aSgCYyuJMqhh5qXgH3SReYdugp/
 Exb0xmIdF42TKBhs=
X-Received: by 2002:aa7:cad4:: with SMTP id l20mr20063472edt.382.1620912766663; 
 Thu, 13 May 2021 06:32:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxELDFfs6tBaftarhXbGgCM5TEF6ufAU/8YsNPi2CwUTePqsSN4vLlB9QGBRlbgVPUGT61SKg==
X-Received: by 2002:aa7:cad4:: with SMTP id l20mr20063442edt.382.1620912766387; 
 Thu, 13 May 2021 06:32:46 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id dq10sm1875168ejc.85.2021.05.13.06.32.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 May 2021 06:32:45 -0700 (PDT)
Subject: Re: RFC: Memory region accesses where .valid.min_access_size <
 .impl.min_access_size
To: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
References: <20210513124737.00002b2d@Huawei.com>
 <CAFEAcA8a+A2u=sF6L-A1ZK7hSiAd2n24Xf0J6j5LeBFa-RTMFw@mail.gmail.com>
 <2d5fdb5f-36d3-c998-ee36-f9d66cea7120@redhat.com>
 <20210513140018.00004560@Huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <a71cf47e-6db8-bcf1-16f1-e972f81d1740@redhat.com>
Date: Thu, 13 May 2021 15:32:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210513140018.00004560@Huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Ben Widawsky <ben.widawsky@intel.com>, David Hildenbrand <david@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>,
 Francisco Iglesias <frasse.iglesias@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Chris Browy <cbrowy@avery-design.com>,
 Linuxarm <linuxarm@huawei.com>, Peter Xu <peterx@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Dan Williams <dan.j.williams@intel.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/13/21 3:00 PM, Jonathan Cameron wrote:
> On Thu, 13 May 2021 14:36:27 +0200
> Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
> 
>> On 5/13/21 2:23 PM, Peter Maydell wrote:
>>> On Thu, 13 May 2021 at 12:49, Jonathan Cameron
>>> <Jonathan.Cameron@huawei.com> wrote:  
>>>> My initial suggestion was to fix this by adding the relatively
>>>> simple code needed in the driver to implement byte read / write,
>>>> but Ben pointed at the QEMU docs - docs/devel/memory.rst which
>>>> says
>>>> "
>>>> .impl.min_access_size, .impl.max_access_size define the access sizes
>>>>    (in bytes) supported by the *implementation*; other access sizes will be
>>>>    emulated using the ones available. For example a 4-byte write will be
>>>>    emulated using four 1-byte writes, if .impl.max_access_size = 1.
>>>> "
>>>>
>>>> This isn't true when we have the situation where
>>>> .valid.min_access_size < .imp.min_access_size
>>>>
>>>> So change the docs or try to make this work?  
>>
>> See also this patch from Francisco:
>> https://www.mail-archive.com/qemu-devel@nongnu.org/msg636935.html
>>
>> And full unaligned access support from Andrew:
>> https://www.mail-archive.com/qemu-devel@nongnu.org/msg461247.html
> 
> Thanks - that's very similar to what I was carrying, but I think it
> only covers the read case.  That's backed up by the comment:
> /* XXX: Can't do this hack for writes */

You might use the "MMIO test device" to write your tests, see:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg730716.html
https://www.mail-archive.com/qemu-devel@nongnu.org/msg730720.html

I have a branch tagged v2, need to rebase it and post...

>>> I don't (yet) have a view on what the in-principle right thing
>>> should be, but in practice: how many devices do we have which
>>> set .valid.min_access_size < .imp.min_access_size ? If we want
>>> to change the semantics we'd need to look at those to see if they
>>> need to be adjusted (or if they're just currently buggy and would
>>> be fixed by the change).
> 
> I'm only aware of this one CXL emulated device (+ the proposed code in
> the ADC in the above patch set).  For the CXL device, working around
> this limitation is straight forward if that's the right option
> + updating the docs to slightly reduced chances of this being hit in
> the future.
> 
> Thanks,
> 
> Jonathan


