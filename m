Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6525B3B027C
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 13:12:02 +0200 (CEST)
Received: from localhost ([::1]:50820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lveK1-0004oK-GZ
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 07:12:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lveIv-00042p-AH
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 07:10:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53142)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lveIt-0006Gn-Cq
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 07:10:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624360250;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gqHLWJ0fmKRvF7olvWMSEPWYRRBeycvzA3YxtpgDpQA=;
 b=DrlBOSy0SROLfoL3FW8D7Xst9YRQjrxIlg6KJdoyz/9UslGxcr9/s6v1C/MQUUYCYEeVKh
 tmKerdzrYUHwyU3gTLwdWe+DipPnLQHqQNEGFrjNXkGEohzD3bXYMm3+O7q6m2PdgSqnxV
 wdhE4RiUdaepgLUPU7s4bvNk8vxbucc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-519-E2BVzAyfNWS0nZ81nt414g-1; Tue, 22 Jun 2021 07:10:48 -0400
X-MC-Unique: E2BVzAyfNWS0nZ81nt414g-1
Received: by mail-wm1-f71.google.com with SMTP id
 j38-20020a05600c1c26b02901dbf7d18ff8so600131wms.8
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 04:10:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gqHLWJ0fmKRvF7olvWMSEPWYRRBeycvzA3YxtpgDpQA=;
 b=efA6MGD6GCnN+FXop3Z42NG+xqqlOrowH834g6c3v/toQS0AeW6/9aqFbkCTxnIenz
 GCG2JDKCcQ1KXaVBccmM9cF5hM7LJBaA7avteIEK2Iq2/pZCpyZh6LdE/85osyNw8PRo
 STLp9CfnYC7PZ5OKxJPhMMsWd12iEkpQtMEfhCjlC7WiZQjsABRu+1jYW0Ort1ENY5bc
 mYzyAbiygEooWUksfPatuqeW5stD9P3OANaOnZR8NdEy8XqytPyXd8q2CyjNN423ge/M
 kmyXg1xHtbcy1TF8XP6WT+7jvUXsprCD+Zrfu6YRSoPRrwmC6h2PwmEdahus+bzTEUkl
 kgUw==
X-Gm-Message-State: AOAM532iyvOD0B4VUovTBxE0OLvE3uwcDYYwaViby3OuAbx47dbIG2Ry
 I1ArXMm0Z4NFCPh5vt+fiCXTXF7+FeJ1GRWfRx69Mr7jUGeTbQvGz+QwhdRCepiDsAZa4XomhS+
 sP6YwICwreQM4J5Y=
X-Received: by 2002:a05:600c:35cb:: with SMTP id
 r11mr3787988wmq.187.1624360246958; 
 Tue, 22 Jun 2021 04:10:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzRrkLlUHbO1o0AH9/b4AbGs8+l/5g6m66vv07QwSsWnGMeZp8lIwHFfJdLd5u+gqGRHVjHDQ==
X-Received: by 2002:a05:600c:35cb:: with SMTP id
 r11mr3787952wmq.187.1624360246747; 
 Tue, 22 Jun 2021 04:10:46 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id n18sm2103348wmq.41.2021.06.22.04.10.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Jun 2021 04:10:45 -0700 (PDT)
Subject: Re: [PATCH v2 1/2] sev/i386: Introduce sev_add_kernel_loader_hashes
 for measured linux boot
To: Dov Murik <dovmurik@linux.ibm.com>, qemu-devel@nongnu.org
References: <20210621190553.1763020-1-dovmurik@linux.ibm.com>
 <20210621190553.1763020-2-dovmurik@linux.ibm.com>
 <89258a7b-fe24-4930-5af7-278b68d1f07c@redhat.com>
 <25b381ad-cdca-60dc-6fb1-1d97ea626843@linux.ibm.com>
 <d983dbc4-1d6b-c51e-aa1f-3d736ac0d154@redhat.com>
 <c54bcaf2-e8df-79fc-3bca-de0212db6333@linux.ibm.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <aeea91bb-e6e2-304f-65b4-5b749faf147a@redhat.com>
Date: Tue, 22 Jun 2021 13:10:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <c54bcaf2-e8df-79fc-3bca-de0212db6333@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.223,
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>, Ashish Kalra <ashish.kalra@amd.com>,
 Brijesh Singh <brijesh.singh@amd.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Connor Kuehl <ckuehl@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>, Jim Cadden <jcadden@ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/22/21 12:26 PM, Dov Murik wrote:
> 
> 
> On 22/06/2021 12:49, Philippe Mathieu-Daudé wrote:
>> On 6/22/21 11:44 AM, Dov Murik wrote:
>>> On 21/06/2021 23:32, Philippe Mathieu-Daudé wrote:
>>
> 
> ...
> 
>>
>>>>> +    if (!pc_system_ovmf_table_find(SEV_HASH_TABLE_RV_GUID, &data, NULL)) {
>>>>
>>>> If we never use the data_len argument, can we simplify the prototype?
>>>
>>> The current uses for the OVMF reset vector GUIDed table is for simple
>>> structs with known length (secret injection page address, SEV-ES reset
>>> address, SEV table of hashes address).  But keeping the length there
>>> allows adding variable-sized entries such as strings/blobs.
>>
>> OK. Good opportunity to document the prototype declaration ;)
> 
> Yep. I'll send as a separate standalone patch.

Sure.

> P.S.
> In a previous version you mentioned you ran into issues with a qemu
> build with SEV disabled.  I tried that by modifying
> default-configs/devices/i386-softmmu.mak and uncommenting CONFIG_SEV=n
> there.  Is there a friendlier way to create such a build?

Unfortunately not yet in mainstream (distributions tune their builds,
often disabling all recent features, and enable them on a case by case
basis once it is well tested).

Thankfully Alex posted a series to add the possibility:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg817710.html

> 
> I'm currently building with:
> 
>     cd build
>     ../configure --target-list=x86_64-softmmu
>     make
> 
> 
> Thanks,
> -Dov
> 


