Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30CE04C11FD
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 12:55:35 +0100 (CET)
Received: from localhost ([::1]:39588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMqF3-0007Rs-P8
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 06:55:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nMqCL-0004Db-3k
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 06:52:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56713)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nMqCJ-0006D1-DL
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 06:52:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645617162;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B9IxGyewtU845laq7yX+S/Wdvm1PcHWbbzfg92R/ISM=;
 b=QqPzTIsAWRPedmEKWKyjM2vmSofXoKum/a/4f2YjAqgqe9s07m7ZpwK232NT71MJmTABDr
 JCkf8iOicPbN/n92tbagHdHb3kgk6rs/tQpNcYTPth7EJC8relpUS5eAQmJtX8vnrbuPCJ
 MMiX4PvkCHrEPK3aweUOX1l8A2OyUvM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-590-NlxET-MeOwKkUo53DdfHOg-1; Wed, 23 Feb 2022 06:52:41 -0500
X-MC-Unique: NlxET-MeOwKkUo53DdfHOg-1
Received: by mail-wm1-f70.google.com with SMTP id
 f189-20020a1c38c6000000b0037d1bee4847so1011126wma.9
 for <qemu-devel@nongnu.org>; Wed, 23 Feb 2022 03:52:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=B9IxGyewtU845laq7yX+S/Wdvm1PcHWbbzfg92R/ISM=;
 b=YZ2v3EZj7+OKHiTSBndhaxy9wYn+K2NMi12mUj3gauxefXGG178t9QfWViVDxCD/3U
 Kw19rwxlf7AutNzWvqbd7Jm7LPkmoQpyQW7tCyPqVxSMGw5JK+pJQp1RuukGwUnwvBXU
 EWeL1dcDcLE68zs6SMsxcxY+t/VyjVYs1UCLuIi9lBQYgvLUVVWRwB9jcUX9ZdnVTgHt
 o2/7Mi9mvKNO+OoJA42zbGVbYRdLtvFTlt2zYzhrDzZCswSPeKX/wJr+wvShkKe/YFSM
 i27ggP1YIgi3lF0mWWC8iqYa+qaiZWv5qJMJK2nt8NR+NhRx6TyKXAg488T5oH0xeWFp
 8hMA==
X-Gm-Message-State: AOAM533aYlxDy/L3AHvyRGPphZ+4JQ/lZD6jr4jZ+NkHdcu1gNZlUjxi
 s4kJ/jegA/Is8AlPqKioh2JQSw6/yj7//2RtXlSGjcvJcGBba9QOqw5nlixQM0hA0iZsk12E+z4
 6ScT1oI4I2o+8M04=
X-Received: by 2002:a05:6000:508:b0:1e4:a027:d147 with SMTP id
 a8-20020a056000050800b001e4a027d147mr23800007wrf.315.1645617160508; 
 Wed, 23 Feb 2022 03:52:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzshoWGWkh3BFQGG/MdQtU5wRutW80Ixi1YVoEy7z62jslQVts1LU2EceQC7/fzSrWGSLX2UA==
X-Received: by 2002:a05:6000:508:b0:1e4:a027:d147 with SMTP id
 a8-20020a056000050800b001e4a027d147mr23799988wrf.315.1645617160250; 
 Wed, 23 Feb 2022 03:52:40 -0800 (PST)
Received: from [10.33.192.232] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id p7sm33096618wrr.95.2022.02.23.03.52.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Feb 2022 03:52:39 -0800 (PST)
Message-ID: <f417898f-7350-2ec1-66af-f72fc21139d1@redhat.com>
Date: Wed, 23 Feb 2022 12:52:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v6 4/4] tests/tcg/s390x: changed to using .insn for tests
 requiring z15
To: David Hildenbrand <david@redhat.com>, David Miller
 <dmiller423@gmail.com>, qemu-s390x@nongnu.org, qemu-devel@nongnu.org
References: <20220217231728.13932-1-dmiller423@gmail.com>
 <20220217231728.13932-5-dmiller423@gmail.com>
 <e0b1e009-6684-6a4a-a8f3-1fd6048a89ad@redhat.com>
 <12e026c0-1c27-db38-2404-85d572ae2bd9@redhat.com>
 <14eaf7fe-78f7-438e-1502-c646965c024d@redhat.com>
 <e84a64d4-4095-5158-d974-5bbc3e8bead1@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <e84a64d4-4095-5158-d974-5bbc3e8bead1@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: pasic@linux.ibm.com, borntraeger@linux.ibm.com, farman@linux.ibm.com,
 cohuck@redhat.com, richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23/02/2022 12.51, David Hildenbrand wrote:
> On 23.02.22 12:49, Thomas Huth wrote:
>> On 23/02/2022 11.54, David Hildenbrand wrote:
>>> On 23.02.22 11:44, Thomas Huth wrote:
>>>> On 18/02/2022 00.17, David Miller wrote:
>>>>> Signed-off-by: David Miller <dmiller423@gmail.com>
>>>>> ---
>>>>>     tests/tcg/s390x/mie3-compl.c | 21 +++++++++++----------
>>>>>     tests/tcg/s390x/mie3-mvcrl.c |  2 +-
>>>>>     tests/tcg/s390x/mie3-sel.c   |  6 +++---
>>>>>     3 files changed, 15 insertions(+), 14 deletions(-)
>> ...
>>>>
>>>> Reviewed-by: Thomas Huth <thuth@redhat.com>
>>>>
>>>> ... maybe best to squash this into the previous patch, though (I can do that
>>>> when picking up the patch if you agree - no need to resend for this).
>>>>
>>>
>>> Do we need this with my debian11 container change?
>>
>> I just tried without, but this breaks on s390x hosts with older compilers,
>> where the TCG tests are run without a container:
>>
>> https://app.travis-ci.com/github/huth/qemu/jobs/560854945#L12875
>>
>> Since Ubuntu 20.04 is still a supported s390x build system for QEMU, I
>> assume it's best if we squash the .insn patch?
> 
> But then, the "-march=z15 -m64" in the previous patch is also unsafe.

Yes, that change has to be dropped, too.

  Thomas


