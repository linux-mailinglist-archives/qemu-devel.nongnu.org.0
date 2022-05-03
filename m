Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31624518F13
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 22:39:48 +0200 (CEST)
Received: from localhost ([::1]:37760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlzJD-0002b3-2x
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 16:39:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jmaloy@redhat.com>) id 1nlyXX-0004a6-J6
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:50:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jmaloy@redhat.com>) id 1nlyXS-0004eZ-CW
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:50:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651607415;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QGN5zf7pLYbMBi55Jh5QgS/wTUq9KZ23nT2lWG1VSSU=;
 b=Z1NZyA+pj6xglIz/mtYHc1KV2ZBW0WkEuSJwyR5cfUqYGj55Ym0dQwQeu5UxXEe9hLnyLN
 eyH3L1jByng+BO+0+OF0omBa38sLVaxfNNk2WVZpercHMnijehHvNlkKWFWFHGay5fgN77
 KOLH7a4XWQ+zTOeGnRk+CNSPrTcLD6Y=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-618-ckMXQVMLNayAx5GhwxO5CQ-1; Tue, 03 May 2022 12:21:14 -0400
X-MC-Unique: ckMXQVMLNayAx5GhwxO5CQ-1
Received: by mail-qt1-f198.google.com with SMTP id
 a24-20020ac81098000000b002e1e06a72aeso13853074qtj.6
 for <qemu-devel@nongnu.org>; Tue, 03 May 2022 09:21:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=QGN5zf7pLYbMBi55Jh5QgS/wTUq9KZ23nT2lWG1VSSU=;
 b=sLhG/q2AXyshDq7dgEVuNClF/dK0vSkvBSjN5S1Mdvq1iZ5WQvvCLohwWZHzRDvFl8
 En1OX0UhGbstnu5BoQ9yDNVu/HhuquJYzTqjvwkRLFngXp/t/KMNoRGTRlV6RCwx9j3F
 62lAJz2bGqffQys0nVOkkJGiJDOyci+tOCmU4HqOikEqibblasfghHzLeL8QE7DNDYow
 bEtsQgge0kvDI3Ke6TI37WuwuI1TTrXWic4BzvTAqCmn4iI6NRrPgTcaICiqkK/4KVJD
 p9EJJrC61iYlxROhHUQoVjdq3/3Vfz24hy2XPQMGs/kv3PmJLPaRskG6wlceE4L3O21c
 jhtw==
X-Gm-Message-State: AOAM531K08SxctuSJVYULJHGQn3iTxyEHoZ+yoO/TvhjG2M/Gs/BJPlC
 jZoAxN3lJBXCZ3Eh/J6w9AkRz2a/c27QvQzAsyKjB3OfAFyeQs5S91NmQRr5/ZzHrlRsT8/5l4v
 SaTKGJKlsMv8Q1uI=
X-Received: by 2002:a05:622a:5cb:b0:2f3:a081:e470 with SMTP id
 d11-20020a05622a05cb00b002f3a081e470mr12221659qtb.58.1651594873827; 
 Tue, 03 May 2022 09:21:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJynXRK4UHxXoHYdAR17S4RqoXYFDqRCXnu2e+t8ZCIc8E2FFkzjkTdydS2knUvhU3jvdYMpdg==
X-Received: by 2002:a05:622a:5cb:b0:2f3:a081:e470 with SMTP id
 d11-20020a05622a05cb00b002f3a081e470mr12221622qtb.58.1651594873529; 
 Tue, 03 May 2022 09:21:13 -0700 (PDT)
Received: from [10.0.0.97] ([24.225.241.171]) by smtp.gmail.com with ESMTPSA id
 c85-20020ae9ed58000000b006a006c884f0sm839588qkg.106.2022.05.03.09.21.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 May 2022 09:21:12 -0700 (PDT)
Message-ID: <12ce1d68-c52a-83dd-861b-2f0e5af7b3a7@redhat.com>
Date: Tue, 3 May 2022 12:21:11 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH-for-6.2 0/2] hw/block/fdc: Fix CVE-2021-3507
Content-Language: en-US
To: Kevin Wolf <kwolf@redhat.com>, John Snow <jsnow@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Laurent Vivier <lvivier@redhat.com>, Prasad J Pandit
 <pjp@fedoraproject.org>, Qemu-block <qemu-block@nongnu.org>,
 Darren Kenny <darren.kenny@oracle.com>, Alexander Bulekov <alxndr@bu.edu>,
 Hanna Reitz <hreitz@redhat.com>, =?UTF-8?Q?Herv=c3=a9_Poussineau?=
 <hpoussin@reactos.org>, Paolo Bonzini <pbonzini@redhat.com>
References: <20211118115733.4038610-1-philmd@redhat.com>
 <7153eadf-3c43-b62c-aaa1-919abf0634ca@redhat.com>
 <1c5dfae3-1c3c-bd2f-d2b5-06dbe75c04c8@redhat.com>
 <4df33af0-0a28-2e20-1909-25baf87d0565@redhat.com>
 <01a68a16-fa01-e7f3-4248-fdec6595cf74@redhat.com>
 <38386efc-1e83-63d4-703d-10c7650e7829@redhat.com>
 <0656151f-a76d-bdd2-cdc9-ea0d1543b0f9@redhat.com>
 <CAFn=p-bwpT7MRhC5xVcsDHnfGfFzKDeu_H5+DZ4irvLUQaOP_A@mail.gmail.com>
 <YnD881acilymQYhE@redhat.com>
From: Jon Maloy <jmaloy@redhat.com>
In-Reply-To: <YnD881acilymQYhE@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jmaloy@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 5/3/22 05:59, Kevin Wolf wrote:
> Am 23.03.2022 um 03:25 hat John Snow geschrieben:
>> On Fri, Mar 18, 2022 at 2:50 PM Thomas Huth <thuth@redhat.com> wrote:
>>> On 10/03/2022 18.53, Jon Maloy wrote:
>>>> On 3/10/22 12:14, Thomas Huth wrote:
>>>>> On 06/02/2022 20.19, Jon Maloy wrote:
>>>>>> Trying again with correct email address.
>>>>>> ///jon
>>>>>>
>>>>>> On 2/6/22 14:15, Jon Maloy wrote:
>>>>>>>
>>>>>>> On 1/27/22 15:14, Jon Maloy wrote:
>>>>>>>> On 11/18/21 06:57, Philippe Mathieu-Daudé wrote:
>>>>>>>>> Trivial fix for CVE-2021-3507.
>>>>>>>>>
>>>>>>>>> Philippe Mathieu-Daudé (2):
>>>>>>>>>     hw/block/fdc: Prevent end-of-track overrun (CVE-2021-3507)
>>>>>>>>>     tests/qtest/fdc-test: Add a regression test for CVE-2021-3507
>>>>>>>>>
>>>>>>>>>    hw/block/fdc.c         |  8 ++++++++
>>>>>>>>>    tests/qtest/fdc-test.c | 20 ++++++++++++++++++++
>>>>>>>>>    2 files changed, 28 insertions(+)
>>>>>>>>>
>>>>>>>> Series
>>>>>>>> Acked-by: Jon Maloy <jmaloy@redhat.com>
>>>>>>> Philippe,
>>>>>>> I hear from other sources that you earlier have qualified this one as
>>>>>>> "incomplete".
>>>>>>> I am of course aware that this one, just like my own patch, is just a
>>>>>>> mitigation and not a complete correction of the erroneous calculation.
>>>>>>> Or did you have anything else in mind?
>>>>> Any news on this one? It would be nice to get the CVE fixed for 7.0 ?
>>>>>
>>>>>   Thomas
>>>>>
>>>> The ball is currently with John Snow, as I understand it.
>>>> The concern is that this fix may not take the driver back to a consistent
>>>> state, so that we may have other problems later.
>>>> Maybe Philippe can chip in with a comment here?
>>> John, Philippe, any ideas how to move this forward?
>>>
>>>    Thomas
>>>
>> The ball is indeed in my court. I need to audit this properly and get
>> the patch re-applied, and get tests passing.
>>
>> As a personal favor: Could you please ping me on IRC tomorrow about
>> this? (Well, later today, for you.)
> Going through old patches... Is this one still open?
>
> Kevin
>
Yes, it is.

///jon


