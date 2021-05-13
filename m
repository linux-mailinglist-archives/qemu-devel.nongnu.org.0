Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 973DD37F838
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 14:52:07 +0200 (CEST)
Received: from localhost ([::1]:46304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhAow-0004WJ-Nx
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 08:52:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lhAa0-0007l5-FR
 for qemu-devel@nongnu.org; Thu, 13 May 2021 08:36:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30321)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lhAZw-0001fi-Dy
 for qemu-devel@nongnu.org; Thu, 13 May 2021 08:36:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620909394;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uakPKXX1c1qzPvtBNxVbDU7ajLWhCXoA3HsZ1nsmsBQ=;
 b=X9nPnHK1HZQSl1Q7lnDVFndt+6Q9ApaHbBWZQiObpgaBETBRpju901RIgI/57BUy7CQxQA
 phcvGUbCS7o1eYY3kviWorQubidymxLE9+Y3hB34P12LII2H5Rvpe3IlbfgpE6bHoIMBLH
 QgcU+zqjZDlbagjgEsnJbXZBvZDYRJM=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-460-WzYPLImmP8-yhmVdgyBv-w-1; Thu, 13 May 2021 08:36:31 -0400
X-MC-Unique: WzYPLImmP8-yhmVdgyBv-w-1
Received: by mail-ed1-f69.google.com with SMTP id
 i19-20020a05640242d3b0290388cea34ed3so14546625edc.15
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 05:36:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=uakPKXX1c1qzPvtBNxVbDU7ajLWhCXoA3HsZ1nsmsBQ=;
 b=Xl6mZ3qzDFmQPM0PaBuAjWkOFwCKp6Kd1mkvuK3gUU8shQm1Zbys6BQmD6UoU7P+fB
 4oM0G+DLVWSZ+oaTcyIIW07+OeJ1lTmCzwRwNutAg3iO6P9JPMss4LNvctaym0U0oPjm
 wfv4+3gOehh/Z8pGfHVD+yICcHpdfozLuVtMVz0UnHDywSpRMKnS3OHbxsRgwsJRMpzX
 cpU+rHSkIvind+9AptxaUFLJxMH1nzVQaHFUR4xIsUvk6aov/F6X+BHDHVb4koHQEBWV
 4nsEbGQ9SCgO/yQAau1lm9HL3VkFkt4u+VuX4c1mdMC+bbR9Y/aSZF07ku+wvQhHLR6v
 ZT2w==
X-Gm-Message-State: AOAM533zdhoFh1NCKBcOE33HW905GPrxUwPUwrrCtV77SvQiNgurkVoo
 LqfXWWahmniim3KaIzt8uunI/8lP4WxSYLAGL+tt6NmvjiUCHW2YfpJaAd9Tm0tzKeDQfp+kCHk
 of5Vzq06jh+ByIX8=
X-Received: by 2002:a17:907:77d1:: with SMTP id
 kz17mr7105833ejc.353.1620909390015; 
 Thu, 13 May 2021 05:36:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzeEX+kJ0eQKVDk0ZJ9QPYYoZa65OHWalCLYqp7yDUmTIJWk846DUVTaWlHlzY+1MPrHy801Q==
X-Received: by 2002:a17:907:77d1:: with SMTP id
 kz17mr7105814ejc.353.1620909389868; 
 Thu, 13 May 2021 05:36:29 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id h4sm2118693edv.97.2021.05.13.05.36.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 May 2021 05:36:29 -0700 (PDT)
Subject: Re: RFC: Memory region accesses where .valid.min_access_size <
 .impl.min_access_size
To: Peter Maydell <peter.maydell@linaro.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Francisco Iglesias <frasse.iglesias@gmail.com>,
 Andrew Jeffery <andrew@aj.id.au>
References: <20210513124737.00002b2d@Huawei.com>
 <CAFEAcA8a+A2u=sF6L-A1ZK7hSiAd2n24Xf0J6j5LeBFa-RTMFw@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <2d5fdb5f-36d3-c998-ee36-f9d66cea7120@redhat.com>
Date: Thu, 13 May 2021 14:36:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8a+A2u=sF6L-A1ZK7hSiAd2n24Xf0J6j5LeBFa-RTMFw@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
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
Cc: Ben Widawsky <ben.widawsky@intel.com>, David Hildenbrand <david@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Chris Browy <cbrowy@avery-design.com>,
 Linuxarm <linuxarm@huawei.com>, Peter Xu <peterx@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Dan Williams <dan.j.williams@intel.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/13/21 2:23 PM, Peter Maydell wrote:
> On Thu, 13 May 2021 at 12:49, Jonathan Cameron
> <Jonathan.Cameron@huawei.com> wrote:
>> My initial suggestion was to fix this by adding the relatively
>> simple code needed in the driver to implement byte read / write,
>> but Ben pointed at the QEMU docs - docs/devel/memory.rst which
>> says
>> "
>> .impl.min_access_size, .impl.max_access_size define the access sizes
>>    (in bytes) supported by the *implementation*; other access sizes will be
>>    emulated using the ones available. For example a 4-byte write will be
>>    emulated using four 1-byte writes, if .impl.max_access_size = 1.
>> "
>>
>> This isn't true when we have the situation where
>> .valid.min_access_size < .imp.min_access_size
>>
>> So change the docs or try to make this work?

See also this patch from Francisco:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg636935.html

And full unaligned access support from Andrew:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg461247.html

> I don't (yet) have a view on what the in-principle right thing
> should be, but in practice: how many devices do we have which
> set .valid.min_access_size < .imp.min_access_size ? If we want
> to change the semantics we'd need to look at those to see if they
> need to be adjusted (or if they're just currently buggy and would
> be fixed by the change).
> 
> thanks
> -- PMM
> 


