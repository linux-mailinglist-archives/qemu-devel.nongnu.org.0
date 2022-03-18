Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DD7F4DE164
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 19:52:31 +0100 (CET)
Received: from localhost ([::1]:53084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVHi9-0007Ud-PB
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 14:52:29 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nVHgN-0005oj-4s
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 14:50:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33308)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nVHgK-0005qA-Aq
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 14:50:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647629435;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=snxCuBP7ov3HzGcCVWDs0TksZba20EVxw7Y+w17FS8U=;
 b=fi/eA4X3GBdEWVMN6eHB/kJo768q6WYg0uG3MrvdwEsvAkBdy+BGxFKCt3nQWYjNAstXHA
 R57krMS+6rCypOTNT0oFEgI8jUPso4FVrXd7jNYfp54MsSmMKnRDIchTrFENbOcoil+NzC
 9P6RSt1JdLEtupIqUFp1Bp/k7pbq2l8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-195-V5sSy9krMaGC6an_iMMeXQ-1; Fri, 18 Mar 2022 14:50:34 -0400
X-MC-Unique: V5sSy9krMaGC6an_iMMeXQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 c126-20020a1c3584000000b00380dee8a62cso3381576wma.8
 for <qemu-devel@nongnu.org>; Fri, 18 Mar 2022 11:50:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=snxCuBP7ov3HzGcCVWDs0TksZba20EVxw7Y+w17FS8U=;
 b=flYYPRNBAYZH8rQA34bX2zO1SQqZelpIH5KeC+r6Pll4AtuEiRpDdZ1oZOkWQXAOjg
 0+1vWNkUVqF1pfzMgxmFRgpN0FvL1GZ2TWhM2ZN9uxs+1c/3t6k1Ym0uCOgAD8+kCs9H
 3Rn3tgadV+a2YoMN7lN8cQV+wFVIGJIaOlP2hhRvNBuYhSxI6Cfoga7Pr8MKNRZepSVL
 hwqdKB6W4+UvDVtQXi8jjwSU5AYX2x73eeCZXku3tO2VOIxlATxtA9ip+BG5yJZYg8XJ
 F9S6v4rXaFu+xC8gO3JPgc0Yos94N9kJC6PgBzaulZP38qxtnkkvjj0XcYiB/kF1IZLD
 ypSA==
X-Gm-Message-State: AOAM530GOZrjBuQzy66Xo9LCSBp9uq+VQ56p0GyX84G0maoxqF8Qy/9L
 VNbXLWrfO8RSHApZmqgrhyCDhlFIW1E5VYrw8DeL8te+eJEHQsiE7+PGgZjegVxOlKYShHJmzpS
 hgwlixWbZX97l3Gw9e9cYqHUnTnttLdW4uctFIxinPi7u/UR/QAjZVeNiu4tYdbo=
X-Received: by 2002:adf:fbc6:0:b0:203:8dff:f49e with SMTP id
 d6-20020adffbc6000000b002038dfff49emr8902208wrs.72.1647629432793; 
 Fri, 18 Mar 2022 11:50:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxhtXC4AQXEZV23RgpcMIqVOUZdSKWaM0Rtaq6EmfWtAWgtffAzIT4t+2M4a3AgXsWe3y6z4Q==
X-Received: by 2002:adf:fbc6:0:b0:203:8dff:f49e with SMTP id
 d6-20020adffbc6000000b002038dfff49emr8902176wrs.72.1647629432399; 
 Fri, 18 Mar 2022 11:50:32 -0700 (PDT)
Received: from [192.168.8.104] (tmo-098-218.customers.d1-online.com.
 [80.187.98.218]) by smtp.gmail.com with ESMTPSA id
 z18-20020adfec92000000b00203f04ed4a8sm3471085wrn.13.2022.03.18.11.50.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Mar 2022 11:50:31 -0700 (PDT)
Message-ID: <0656151f-a76d-bdd2-cdc9-ea0d1543b0f9@redhat.com>
Date: Fri, 18 Mar 2022 19:50:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH-for-6.2 0/2] hw/block/fdc: Fix CVE-2021-3507
To: qemu-devel@nongnu.org, f4bug@amsat.org, John Snow <jsnow@redhat.com>
References: <20211118115733.4038610-1-philmd@redhat.com>
 <7153eadf-3c43-b62c-aaa1-919abf0634ca@redhat.com>
 <1c5dfae3-1c3c-bd2f-d2b5-06dbe75c04c8@redhat.com>
 <4df33af0-0a28-2e20-1909-25baf87d0565@redhat.com>
 <01a68a16-fa01-e7f3-4248-fdec6595cf74@redhat.com>
 <38386efc-1e83-63d4-703d-10c7650e7829@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <38386efc-1e83-63d4-703d-10c7650e7829@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Prasad J Pandit <pjp@fedoraproject.org>, qemu-block@nongnu.org,
 Darren Kenny <darren.kenny@oracle.com>, Jon Maloy <jmaloy@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/03/2022 18.53, Jon Maloy wrote:
> 
> On 3/10/22 12:14, Thomas Huth wrote:
>> On 06/02/2022 20.19, Jon Maloy wrote:
>>> Trying again with correct email address.
>>> ///jon
>>>
>>> On 2/6/22 14:15, Jon Maloy wrote:
>>>>
>>>>
>>>> On 1/27/22 15:14, Jon Maloy wrote:
>>>>>
>>>>> On 11/18/21 06:57, Philippe Mathieu-Daudé wrote:
>>>>>> Trivial fix for CVE-2021-3507.
>>>>>>
>>>>>> Philippe Mathieu-Daudé (2):
>>>>>>    hw/block/fdc: Prevent end-of-track overrun (CVE-2021-3507)
>>>>>>    tests/qtest/fdc-test: Add a regression test for CVE-2021-3507
>>>>>>
>>>>>>   hw/block/fdc.c         |  8 ++++++++
>>>>>>   tests/qtest/fdc-test.c | 20 ++++++++++++++++++++
>>>>>>   2 files changed, 28 insertions(+)
>>>>>>
>>>>> Series
>>>>> Acked-by: Jon Maloy <jmaloy@redhat.com>
>>>>
>>>> Philippe,
>>>> I hear from other sources that you earlier have qualified this one as 
>>>> "incomplete".
>>>> I am of course aware that this one, just like my own patch, is just a 
>>>> mitigation and not a complete correction of the erroneous calculation.
>>>> Or did you have anything else in mind?
>>
>> Any news on this one? It would be nice to get the CVE fixed for 7.0 ?
>>
>>  Thomas
>>
> The ball is currently with John Snow, as I understand it.
> The concern is that this fix may not take the driver back to a consistent 
> state, so that we may have other problems later.
> Maybe Philippe can chip in with a comment here?

John, Philippe, any ideas how to move this forward?

  Thomas


