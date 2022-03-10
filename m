Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18DCE4D50F7
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 18:55:27 +0100 (CET)
Received: from localhost ([::1]:46964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSN0Y-0004pU-6C
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 12:55:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jmaloy@redhat.com>) id 1nSMya-0003D3-OQ
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 12:53:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52754)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jmaloy@redhat.com>) id 1nSMyZ-0000Qr-7m
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 12:53:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646934802;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FPWqp0JKJRox7vGQlh6WYABIvEj94ECUA04bBWItKCM=;
 b=HX5WvN6C+IrTtK+hSNaSPEP8UkNz5jd6+ZvUwwdCV6fvT7G7FSqvaCPILjSZL3bpiuxe75
 1MV9EVcyIsIJUe6wG2WmSx/O9m8C8Go83r2CI97ahpdQhzEvbaTao+KudXxZLAyjTQr3HG
 FLb1XwfLnhEqMCLEL4EmCjBS/iOnXDM=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-17-pL6ZEQlBMyaufh8-0LWlKg-1; Thu, 10 Mar 2022 12:53:21 -0500
X-MC-Unique: pL6ZEQlBMyaufh8-0LWlKg-1
Received: by mail-qk1-f197.google.com with SMTP id
 f11-20020a05620a20cb00b0067b3fedce10so4362908qka.15
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 09:53:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=FPWqp0JKJRox7vGQlh6WYABIvEj94ECUA04bBWItKCM=;
 b=dQvGNaoBboblBXlQi4eyaMAHMwQ0JskUU1yzHWLa3SVKgghOQB485491yh5ICyiSLH
 AYGEQkh67lpqvsxkw/54Bcsl0FicLT+POT44Vz0USfDBUH51Bv5eA78f3nGhWCCITi0l
 ZUDGX+p/g0zMRiI93Q7VJ8EbWvfj4srYhVGoybDVOUu4NdnMG/QIPSg4/dvPcIiapILB
 ED/5bGR4LM+bk0B4PsaY/p0HjYaSd7RstLXiJ+jdRKWC5DBkcpPkJ7Ur4q2tZy1/O2kQ
 NIvT3k+EfH1kk/hy5uZmqX3IP3EThlNZNBnsE8jQTeKEEPblWPX9ayL+WqFCFLpSBqDo
 WVlA==
X-Gm-Message-State: AOAM530vVpwQktt2E6O9q7HdL9YNYVGE5/nck/pBv83Eioczxlk4IaoC
 Z4atiZ2ysxwmuY8ueKsWfkBaMlV+aqlsh9LbhJNh1s+/zmkb+t4CeYYgmDTE9mJGL+qYiCxQ0mw
 fIfxSuEJB5JCgXPA=
X-Received: by 2002:a05:622a:1452:b0:2e1:a12b:ef6 with SMTP id
 v18-20020a05622a145200b002e1a12b0ef6mr4896944qtx.579.1646934800687; 
 Thu, 10 Mar 2022 09:53:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJynKFKyYYZqiTCcYpsBYqHTF83kz2IRsdKH4q1TqYVysu5MxlnQ2tZBM/5TELNkPePBrpegXg==
X-Received: by 2002:a05:622a:1452:b0:2e1:a12b:ef6 with SMTP id
 v18-20020a05622a145200b002e1a12b0ef6mr4896925qtx.579.1646934800421; 
 Thu, 10 Mar 2022 09:53:20 -0800 (PST)
Received: from [10.0.0.97] ([24.225.241.171]) by smtp.gmail.com with ESMTPSA id
 l126-20020a37bb84000000b0067b3c2bcc0dsm2640861qkf.1.2022.03.10.09.53.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Mar 2022 09:53:19 -0800 (PST)
Message-ID: <38386efc-1e83-63d4-703d-10c7650e7829@redhat.com>
Date: Thu, 10 Mar 2022 12:53:18 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH-for-6.2 0/2] hw/block/fdc: Fix CVE-2021-3507
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org, f4bug@amsat.org
References: <20211118115733.4038610-1-philmd@redhat.com>
 <7153eadf-3c43-b62c-aaa1-919abf0634ca@redhat.com>
 <1c5dfae3-1c3c-bd2f-d2b5-06dbe75c04c8@redhat.com>
 <4df33af0-0a28-2e20-1909-25baf87d0565@redhat.com>
 <01a68a16-fa01-e7f3-4248-fdec6595cf74@redhat.com>
From: Jon Maloy <jmaloy@redhat.com>
In-Reply-To: <01a68a16-fa01-e7f3-4248-fdec6595cf74@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jmaloy@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jmaloy@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
 Darren Kenny <darren.kenny@oracle.com>, Alexander Bulekov <alxndr@bu.edu>,
 Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 3/10/22 12:14, Thomas Huth wrote:
> On 06/02/2022 20.19, Jon Maloy wrote:
>> Trying again with correct email address.
>> ///jon
>>
>> On 2/6/22 14:15, Jon Maloy wrote:
>>>
>>>
>>> On 1/27/22 15:14, Jon Maloy wrote:
>>>>
>>>> On 11/18/21 06:57, Philippe Mathieu-Daudé wrote:
>>>>> Trivial fix for CVE-2021-3507.
>>>>>
>>>>> Philippe Mathieu-Daudé (2):
>>>>>    hw/block/fdc: Prevent end-of-track overrun (CVE-2021-3507)
>>>>>    tests/qtest/fdc-test: Add a regression test for CVE-2021-3507
>>>>>
>>>>>   hw/block/fdc.c         |  8 ++++++++
>>>>>   tests/qtest/fdc-test.c | 20 ++++++++++++++++++++
>>>>>   2 files changed, 28 insertions(+)
>>>>>
>>>> Series
>>>> Acked-by: Jon Maloy <jmaloy@redhat.com>
>>>
>>> Philippe,
>>> I hear from other sources that you earlier have qualified this one 
>>> as "incomplete".
>>> I am of course aware that this one, just like my own patch, is just 
>>> a mitigation and not a complete correction of the erroneous 
>>> calculation.
>>> Or did you have anything else in mind?
>
> Any news on this one? It would be nice to get the CVE fixed for 7.0 ?
>
>  Thomas
>
The ball is currently with John Snow, as I understand it.
The concern is that this fix may not take the driver back to a 
consistent state, so that we may have other problems later.
Maybe Philippe can chip in with a comment here?

///jon


