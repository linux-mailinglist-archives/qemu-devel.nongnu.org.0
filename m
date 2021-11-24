Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4D3645B75A
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 10:23:08 +0100 (CET)
Received: from localhost ([::1]:36348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpoUd-0008To-Mc
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 04:23:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mpoTE-0007Ns-5e; Wed, 24 Nov 2021 04:21:40 -0500
Received: from [2607:f8b0:4864:20::936] (port=43579
 helo=mail-ua1-x936.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mpoTC-0004W9-5F; Wed, 24 Nov 2021 04:21:39 -0500
Received: by mail-ua1-x936.google.com with SMTP id j14so3625739uan.10;
 Wed, 24 Nov 2021 01:21:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=cZ3DvjGclI0r4OMOm/tV9FHMFK007Sbtm7RZ4vM5o8k=;
 b=hp+UcqiVl36KGbUpKNm8Wsh+dui0rwQ/g67mP0XFEwHdm2LVWSvxtFAezcT3FTRtpM
 3qdWD9+VU0hcF/lne7soc0tMfeCdFIbABGAAKg8O13GrGGr35gIugq3m48f/tHt2TEXg
 9tMYGr3rdOyoaiz8O+cew/21nFJtyF2Wae2E0y+yfZ8dip61hTPJBFpr3kNop8hZJyyg
 DV6gj11/ZDAbnjAkwz0iSX8wraej0+XqgDJyW00k7co/nXrxh2rRQZcEFgGXR1ltdtl3
 T2o8JeC5ii25AwEyO2kz+JOT+zSCF+YwNZ3fBOZuIXocgpWb01DF09gy2AIFYtn6Lblf
 mFeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=cZ3DvjGclI0r4OMOm/tV9FHMFK007Sbtm7RZ4vM5o8k=;
 b=Ee8qZ89naSPbqEHWjupi2whoL04OntlgHqVBDH4Ia7AbWCt+8UAhFgT6k2U33fbupf
 R1EbGdr1wJlH/AVJXr65plZ7+BH+qXl4ss2QQWM0+lXyV5uYoa5InpWgOGOrne4R7TKf
 P7BbImaVDxPoPQ2mbQDJ9RLrYGrecEUFMhUyxCWWZDhXkABVPTeLVBV/gFku/IHMKS/q
 gH9N8GmNhX3ABTYGlJ+YBUu4eO/ez2ZTZihF76ZHf+JeZL4maQJOR3jzKcFiGdIH9JRP
 DpnJNi+jARyRIQzN4SU5VcMZ5yYp6xuiap2qHGU9EyZrleDBqWtZagwq95vRw3sUghNk
 aABQ==
X-Gm-Message-State: AOAM531seCxWQAaZWT8gFWvzgQaYleYYaHbwNVUbqwyMSwy8K0g9hoAB
 Rj9GT+slZwEq4nCcXMFj97k=
X-Google-Smtp-Source: ABdhPJzYJzMY1JHjUkQvSP8971S+NxAwuKL9dFVZ7GLSR7zyyOiRcHJCbz3FSaKfluxCtiYsk2NCIQ==
X-Received: by 2002:a67:df90:: with SMTP id x16mr20439426vsk.52.1637745695970; 
 Wed, 24 Nov 2021 01:21:35 -0800 (PST)
Received: from [192.168.10.222] ([191.19.215.188])
 by smtp.gmail.com with ESMTPSA id f132sm7736046vkf.18.2021.11.24.01.21.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Nov 2021 01:21:35 -0800 (PST)
Message-ID: <3c073b3c-a8eb-2e6d-7e2d-4808774e2c74@gmail.com>
Date: Wed, 24 Nov 2021 06:21:33 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 0/2] change IVSHMEM endianess to LITTLE_ENDIAN
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-devel@nongnu.org
References: <20211123211932.284043-1-danielhb413@gmail.com>
 <a6b4bfd8-099c-9e7a-0492-6df404167367@kaod.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <a6b4bfd8-099c-9e7a-0492-6df404167367@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::936
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::936;
 envelope-from=danielhb413@gmail.com; helo=mail-ua1-x936.google.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-4.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 11/23/21 20:22, Cédric Le Goater wrote:
> On 11/23/21 22:19, Daniel Henrique Barboza wrote:
>> Hi,
>>
>> This small series fixes an issue reported in Gitlab [1] that
>> affects PowerPC big-endian and little-endian and probably all
>> other big-endians in the wild that might use 'ivshmem'.
>>
>> It's not clear to me who is the maintainer/responsible for this device
>> (MAINTAINERS doesn't seem to have any 'ivhshmem' entries nor someone
>> that looks upon all hw/misc/* files) so I didn't add any CC in that
>> regard. 'qemu-ppc' is being copied for awareness since they are the
>> folks that are most likely being impacted by the bug.
>>
>> [1] https://gitlab.com/qemu-project/qemu/-/issues/168
> 
> Do we want these fixes for 6.2 ?


No, I don't think it's necessary. Changing endianess is something that I'd rather
do in the start of the 7.0 cycle. This bug has been around for years at this
point. It can wait a couple of months.

I'll re-send these with Thomas' Ack and corrections and with a "for-7.0" subject
for extra clarity.


Thanks,


Daniel



> 
> Thanks,
> 
> C.
> 
>>
>> Daniel Henrique Barboza (2):
>>    ivshmem.c: change endianness to LITTLE_ENDIAN
>>    ivshmem-test.c: enable test_ivshmem_server for ppc64 arch
>>
>>   hw/misc/ivshmem.c          | 2 +-
>>   tests/qtest/ivshmem-test.c | 5 +----
>>   2 files changed, 2 insertions(+), 5 deletions(-)
>>
> 

