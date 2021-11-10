Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C88C544C185
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 13:47:26 +0100 (CET)
Received: from localhost ([::1]:43264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkn0f-0001aE-M0
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 07:47:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mkmug-0006pk-B7; Wed, 10 Nov 2021 07:41:14 -0500
Received: from [2607:f8b0:4864:20::c2c] (port=42745
 helo=mail-oo1-xc2c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mkmue-0001t2-LF; Wed, 10 Nov 2021 07:41:14 -0500
Received: by mail-oo1-xc2c.google.com with SMTP id
 x1-20020a4aea01000000b002c296d82604so732798ood.9; 
 Wed, 10 Nov 2021 04:41:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=dy4w2WWIoafyvpC5Lrt7r9xR5OYpz42WszUyq167l6Q=;
 b=n8SlFheXgGffmdB8SAiT0rr1KH9YmxnqqFdI1MngLVJ6V7SfvbHk6c8Pt15ZW8MEZV
 Oq0CYIQTbsWaBAfBF1Us1M5tcsHgMAmXDuu9Kk6J67Upt83/L/3bwjJ9AHMT4h7J9I+C
 6qE54EQKU9KmP3JByXKhHwpCWlCumyUhTziZPu1M4acCD1AG+ts1hhU94MFPIZeUCS+Z
 mBu1rPIPaEuDIMzBTB8yYnkp4gCpfZkosDdqhV/1ZUPuVBzM3bGs76oju9rdPbRU7cAB
 XWJAE5YcWo4Sc/vxNcnhTVZKFOhGSozU4LEJA2IdwaCLpujOxvXXQgsqdoa7F3Was3uA
 vVRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=dy4w2WWIoafyvpC5Lrt7r9xR5OYpz42WszUyq167l6Q=;
 b=x9m0HTWDNT5/z7aitw0m+F60lnMsd4KmV73RCF7GcUXE2SWLmnZhGr8LCXXoHQ7e9r
 IkYne3CjP1wU9CSADsCD5hj4H/YMOydNm6wi2Pn8GPw3acIkJoryaWzfzTXv3oUDzsdg
 DYofGf7c6LAWsaNPNhi7LaeOWXFvX6+/ublJT28Yz6A6rClhRtZqF54+/bmGOBnH11Av
 Y3EO5won1a8gM/qQwIxQT6ZMGY5eTXdIMvN+beEQTz3xIp+SDhr5ye6etHecvykoxRei
 LI4kw4+7K00jqwJbRMqK+r7plxZzVSGSjgzZaZqxF9X6IdVf7yan/6pB3xJKClNOSZSe
 IZvQ==
X-Gm-Message-State: AOAM533s9L6GuhJzxO4yyON9waARRiZ2YV4FoP4emJNzrUOqOwncNr8u
 YOBmk/5zGUQm+h/AE+mxcdI=
X-Google-Smtp-Source: ABdhPJwaq98wTTa8eRC+W/Jm1aYI8HaMvxzVQNMi1CTzViKi6OsuoZmM7lGRzVkQqL4nCl5/WmL3yQ==
X-Received: by 2002:a4a:6342:: with SMTP id r2mr2052312oof.54.1636548070481;
 Wed, 10 Nov 2021 04:41:10 -0800 (PST)
Received: from [192.168.10.222] ([189.79.219.109])
 by smtp.gmail.com with ESMTPSA id y1sm3650858otu.58.2021.11.10.04.41.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Nov 2021 04:41:10 -0800 (PST)
Message-ID: <d0f4e167-a0fa-c62f-6a19-201e0a40a116@gmail.com>
Date: Wed, 10 Nov 2021 09:41:06 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] spapr_numa.c: fix FORM1 distance-less nodes
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211109183553.1844689-1-danielhb413@gmail.com>
 <490a7d19-9e16-b77e-2114-032d7c5091d6@linaro.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <490a7d19-9e16-b77e-2114-032d7c5091d6@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::c2c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2c;
 envelope-from=danielhb413@gmail.com; helo=mail-oo1-xc2c.google.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-1.678,
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
Cc: "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>, qemu-ppc@nongnu.org,
 clg@kaod.org, Nicholas Piggin <npiggin@gmail.com>, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 11/10/21 06:58, Richard Henderson wrote:
> On 11/9/21 7:35 PM, Daniel Henrique Barboza wrote:
>> Commit 71e6fae3a99 fixed an issue with FORM2 affinity guests with NUMA
>> nodes in which the distance info is absent in
>> machine_state->numa_state->nodes. This happens when QEMU adds a default
>> NUMA node and when the user adds NUMA nodes without specifying the
>> distances.
>>
>> During the discussions of the forementioned patch [1] it was found that
>> FORM1 guests were behaving in a strange way in the same scenario, with
>> the kernel seeing the distances between the nodes as '160', as we can
>> see in this example with 4 NUMA nodes without distance information:
>>
>> $ numactl -H
>> available: 4 nodes (0-3)
>> (...)
>> node distances:
>> node   0   1   2   3
>>    0:  10  160  160  160
>>    1:  160  10  160  160
>>    2:  160  160  10  160
>>    3:  160  160  160  10
>>
>> Turns out that we have the same problem with FORM1 guests - we are
>> calculating associativity domain using zeroed values. And as it also
>> turns out, the solution from 71e6fae3a99 applies for FORM1 as well.
>>
>> This patch creates a wrapper called 'get_numa_distance' that contains
>> the logic used in FORM2 to define node distances when this information
>> is absent. This helper is then used in all places where we need to read
>> distance information from machine_state->numa_state->nodes. That way
>> we'll guarantee that the NUMA node distance is always being curated
>> before being used.
>>
>> After this patch, the FORM1 guest mentioned above will have the
>> following topology:
>>
>> $ numactl -H
>> available: 4 nodes (0-3)
>> (...)
>> node distances:
>> node   0   1   2   3
>>    0:  10  20  20  20
>>    1:  20  10  20  20
>>    2:  20  20  10  20
>>    3:  20  20  20  10
>>
>> This is compatible with what FORM2 guests and other archs do in this
>> case.
>>
>> [1] https://lists.gnu.org/archive/html/qemu-devel/2021-11/msg01960.html
>>
>> CC: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>> CC: Nicholas Piggin <npiggin@gmail.com>
>> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>> ---
>>   hw/ppc/spapr_numa.c | 62 ++++++++++++++++++++++-----------------------
>>   1 file changed, 31 insertions(+), 31 deletions(-)
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Thanks!

I forgot to add the "Fixes:" tag at the end of the commit msg though, so I
ended up sending a v2 adding it. Your r-b is kept in the v2.


Daniel


> 
> 
> r~

