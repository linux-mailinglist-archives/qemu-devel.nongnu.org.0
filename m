Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69438449DC2
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 22:13:55 +0100 (CET)
Received: from localhost ([::1]:58196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkBxi-0006HE-0j
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 16:13:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mkBwW-0005RK-KF; Mon, 08 Nov 2021 16:12:40 -0500
Received: from [2607:f8b0:4864:20::32b] (port=46913
 helo=mail-ot1-x32b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mkBwU-0002oi-HI; Mon, 08 Nov 2021 16:12:40 -0500
Received: by mail-ot1-x32b.google.com with SMTP id
 b5-20020a9d60c5000000b0055c6349ff22so16877533otk.13; 
 Mon, 08 Nov 2021 13:12:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:from:subject:to:cc
 :references:content-language:in-reply-to:content-transfer-encoding;
 bh=w917kkh3OmHMwcol0PHb3MDb8HLhMOm2OVUCxqKn9NY=;
 b=p1GluH5EV4m3gS7qjfR3ZzJoKdMZCFqU5GTLxacj7BAWElM2ggJiAsT7u6l06nusam
 NISxgsKVa9fMm7/FqoHgB9nUtOPE3L96SPMeZMK5gkXYPIdOY5nIpH0skk97mVx735QF
 EjGr6TT+eyphbEqh7Hf62bT4Gh8nQb4q0JuwTqQ7ckJ+3er+iKR1SB0kjmLvRRgddTix
 CU3SHqrhgVjJNxnE+3LcOxQRlPCrnEptg2awBMH9P9haVjAUMou+glq9mg4RlAJ5Hw0Q
 UZBayzCxt01Ng80k/RY1NrdMy0zKMNuaPoYWOrTIcrIjFBp7YdPhIythlSdF22ekd/Wx
 D+2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:from
 :subject:to:cc:references:content-language:in-reply-to
 :content-transfer-encoding;
 bh=w917kkh3OmHMwcol0PHb3MDb8HLhMOm2OVUCxqKn9NY=;
 b=ESl3I2DLIi9nst9glE0vioDMfaAfbu4HpGW6tunYkwtZETtVC0v4dzmFrP106bsHL7
 lLN7MLgr/SvBrASyFo850xGh9NMBTmyQC1iMYPzxpBB3+Imtc2Uj5Il3wpVKw6cSBSjX
 Ushs6YiA2XqcIq3dSAmoM7xfiRIonAi2Bo9HB78OdCvMqruSAZzlYc+pMXHdjhWhv19M
 gmqK2+C7Ussqjf3in30462/5J+VSo1vIYod5Ymt6FZViKCqa2hl/dR+wzpDZprclAlRe
 or94GBNEU/ax7s5ffhriaSnnPHHeazH2Pb4hDMnBFLOh1e7WlquZS8LSE0vJEcLokZCe
 bPeA==
X-Gm-Message-State: AOAM5339xyegcCSWM79jBNM4E5+z3u7kpkvWoZerq+W7Z1FCESKo9t8B
 HWQrl/U0xGQGt0TxXds7s4O/CMemqrQ=
X-Google-Smtp-Source: ABdhPJwBkG/j91U6CmtCyRAGk5Jpy5msM0Nsh3UpOyBRrhdxqBlzcKoX2sCwkuz6sxOSQG6JwG3MYA==
X-Received: by 2002:a05:6830:2453:: with SMTP id
 x19mr1707184otr.32.1636405956331; 
 Mon, 08 Nov 2021 13:12:36 -0800 (PST)
Received: from [192.168.10.222] ([189.79.219.109])
 by smtp.gmail.com with ESMTPSA id l9sm1935292oom.4.2021.11.08.13.12.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Nov 2021 13:12:36 -0800 (PST)
Message-ID: <bbd1825d-a5f5-cf65-005f-587783145e24@gmail.com>
Date: Mon, 8 Nov 2021 18:12:33 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
From: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH] spapr_numa.c: FORM2 table handle nodes with no distance
 info
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>, qemu-ppc@nongnu.org
References: <20211105135137.1584840-1-npiggin@gmail.com>
 <555804ca-e59e-6dfb-c133-0087b7c0ffd0@gmail.com>
 <87bl2v1dka.fsf@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <87bl2v1dka.fsf@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::32b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::32b;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x32b.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-3.06,
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
Cc: qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 11/8/21 01:22, Aneesh Kumar K.V wrote:
> Daniel Henrique Barboza <danielhb413@gmail.com> writes:
> 
>> On 11/5/21 10:51, Nicholas Piggin wrote:
>>> A configuration that specifies multiple nodes without distance info
>>> results in the non-local points in the FORM2 matrix having a distance of
>>> 0. This causes Linux to complain "Invalid distance value range" because
>>> a node distance is smaller than the local distance.
>>>
>>> Fix this by building a simple local / remote fallback for points where
>>> distance information is missing.
>>
>> Thanks for looking this up. I checked the output of this same scenario with
>> a FORM1 guest and 4 distance-less NUMA nodes. This is what I got:
>>
>> [root@localhost ~]# numactl -H
>> available: 4 nodes (0-3)
>> (...)
>> node distances:
>> node   0   1   2   3
>>     0:  10  160  160  160
>>     1:  160  10  160  160
>>     2:  160  160  10  160
>>     3:  160  160  160  10
>> [root@localhost ~]#
>>
>>
>> With this patch we're getting '20' instead of '160' because you're using
>> NUMA_DISTANCE_DEFAULT, while FORM1 will default this case to the maximum
>> NUMA distance the kernel allows for that affinity (160).
> 
> where is that enforced? Do we know why FORM1 picked 160?


It's the kernel algorithm that determines FORM1 distance. It doubles the
distance value of the previous level. It starts with the LOCAL_DISTANCE (10)
for the first NUMA level, second level is 10*2, and so on for all 4
reference-points (10, 20, 40, 80). If no match is found in the 4th level,
it doubles once more, giving us 160.

What is happening here is that the absence of a distance (distance == 0)
is being handled by FORM1 code in QEMU in a way that the associativity domains
will cause this kernel behavior I described above.

I'll check it out later and see if that's easily fixable.

> 
>>
>> I do not have strong feelings about changing this behavior between FORM1 and
>> FORM2. I tested the same scenario with a x86_64 guest and they also uses '20'
>> in this case as well, so far as QEMU goes using NUMA_DISTANCE_DEFAULT is
>> consistent.
>>
> 
> for FORM2 I would suggest 20 is the right value and it is also
> consistent with other architectures.
> 
>> Aneesh is already in CC, so I believe he'll let us know if there's something
>> we're missing and we need to preserve the '160' distance in FORM2 for this
>> case as well.
>>
>> For now:
>>
>>
>>>
>>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>>> ---
>>
>>
>> Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
>>
>>
>>
>>>    hw/ppc/spapr_numa.c | 22 +++++++++++++++++-----
>>>    1 file changed, 17 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/hw/ppc/spapr_numa.c b/hw/ppc/spapr_numa.c
>>> index 5822938448..56ab2a5fb6 100644
>>> --- a/hw/ppc/spapr_numa.c
>>> +++ b/hw/ppc/spapr_numa.c
>>> @@ -546,12 +546,24 @@ static void spapr_numa_FORM2_write_rtas_tables(SpaprMachineState *spapr,
>>>                 * NUMA nodes, but QEMU adds the default NUMA node without
>>>                 * adding the numa_info to retrieve distance info from.
>>>                 */
>>> -            if (src == dst) {
>>> -                distance_table[i++] = NUMA_DISTANCE_MIN;
>>> -                continue;
> 
> We always initialized the local distance to be NUMA_DISTANCE_MIN
> irrespective of what is specified via Qemu command line before? If so
> then the above change will break that?

No. I added this piece of code above because QEMU can auto-generate a single
NUMA node if the user added no NUMA nodes in the command line. This
auto-generated NUMA node didn't have the local_distance for itself set. That's
the only case where I was setting distance = 10. The remaining entries
were being written as-is. And now we need Nick's patch as well because
I missed other instances of absent distances hehe

I don't believe that we're breaking anything with this patch because we're
checking for distance = 0 first, and QEMU doesn't allow any distance < 10 to
be set:

-numa dist,src=0,dst=1,val=3
qemu-system-x86_64: -numa dist,src=0,dst=1,val=3: NUMA distance (3) is invalid, it shouldn't be less than 10


This means that we're not overwriting any user setting by accident.

> 
>>> +            distance_table[i] = numa_info[src].distance[dst];
>>> +            if (distance_table[i] == 0) {
> 
> we know distance_table[i] is == 0 here and ..
> 
>>> +                /*
>>> +                 * In case QEMU adds a default NUMA single node when the user
>>> +                 * did not add any, or where the user did not supply distances,
>>> +                 * the value will be 0 here. Populate the table with a fallback
>>> +                 * simple local / remote distance.
>>> +                 */
>>> +                if (src == dst) {
>>> +                    distance_table[i] = NUMA_DISTANCE_MIN;
>>> +                } else {
>>> +                    distance_table[i] = numa_info[src].distance[dst];
>>> +                    if (distance_table[i] < NUMA_DISTANCE_MIN) {
> 
> 
> considering we reached here after checking distance_table[i] == 0 do we
> need to do the above two lines?

You're right. I believe we can make it work with

                 if (src == dst) {
                     distance_table[i] = NUMA_DISTANCE_MIN;
                 } else {
                     distance_table[i] = NUMA_DISTANCE_DEFAULT;
                 }


Nick, care to re-send?



Thanks,



Daniel

> 
>>> +                        distance_table[i] = NUMA_DISTANCE_DEFAULT;
>>> +                    }
>>> +                }
>>>                }
>>> -
>>> -            distance_table[i++] = numa_info[src].distance[dst];
>>> +            i++;
>>>            }
>>>        }
> 
> 

