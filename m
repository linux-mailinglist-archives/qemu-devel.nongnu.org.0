Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E583B8F08
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 10:44:03 +0200 (CEST)
Received: from localhost ([::1]:41206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lysIk-0007Hh-Th
	for lists+qemu-devel@lfdr.de; Thu, 01 Jul 2021 04:44:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lysHn-0006DP-B0
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 04:43:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33790)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lysHk-00056p-Qa
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 04:43:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625128979;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JvF1RL8ffh9pBeduMdATThSfPTcOqMOintANQypk+M0=;
 b=ZJw+MReRUNt8sSxHfVpetUQ/m8gmeUrE2ivii3lnp/MnJSql8dPMOc09FqJ8BSlziX7X39
 HwVJSQq7GoH2oaJ0tYBR+fZ2+7EHuB+xq+4mYqRr4HbPxUKLfx+OCudYYwn0Pc0OVfFDyz
 7vNAYBMGggp13M4oJmGq83He54NpqWU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-201-G_8ycK-aOfeYSwk3HyMxEw-1; Thu, 01 Jul 2021 04:42:58 -0400
X-MC-Unique: G_8ycK-aOfeYSwk3HyMxEw-1
Received: by mail-wm1-f72.google.com with SMTP id
 y14-20020a1c7d0e0000b02901edd7784928so4248836wmc.2
 for <qemu-devel@nongnu.org>; Thu, 01 Jul 2021 01:42:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JvF1RL8ffh9pBeduMdATThSfPTcOqMOintANQypk+M0=;
 b=Zfb2kJrrRNSKvb3wpv7GMD6jOMc4Fk5AART61+X62Aw/SxHP0D5D1DEhb+nYMcQiwW
 knC4lycl/eDzTowOv+SjO96vUL/iPCBvZI1fm/fU7w0pnotbDMf9xVoPFJkXRregyTJi
 LoGbzNZrwkImWyYK7e9akjbdFfgtOEI3jQ/LEULbRi1mLWuvVL90/HZtcegWoJ0IT6NZ
 1d4lz5BFoEVFujUXl1L+tngnmxL7PmUac/cmS9hnPwuFf34JW4xyv7/FmJjVPSgZYj46
 HgpMGXqXsNcpXTpaRRGl5A74sZ8jY3g/qfga2F04DoF8kiNNPtTBfa+2Bp25s5V5VPh/
 Kgdg==
X-Gm-Message-State: AOAM533w/PHaPpK1c4vVeTZDzNj0+9a9i5xHOtSAaGIO4IlHkNiwxs8N
 IUo7q69L1dFhYyY1E7Bdj3+v19qyVNBA1oolEPMcYLu3tp0FSN9c/cEddD8NtJ7HcZfmLGgPpQg
 LiS93inuF3NwMRp4=
X-Received: by 2002:a05:600c:5106:: with SMTP id
 o6mr8534470wms.162.1625128977680; 
 Thu, 01 Jul 2021 01:42:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxHH7BBTE4tvD4wFKGYzhcE9HC/jYA+o06KsHQ4x/GVQ7LAzVRm4mfGdanlMlBwOZo7tj/vlw==
X-Received: by 2002:a05:600c:5106:: with SMTP id
 o6mr8534448wms.162.1625128977383; 
 Thu, 01 Jul 2021 01:42:57 -0700 (PDT)
Received: from thuth.remote.csb (pd9575bc6.dip0.t-ipconnect.de.
 [217.87.91.198])
 by smtp.gmail.com with ESMTPSA id a9sm24018642wrv.37.2021.07.01.01.42.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Jul 2021 01:42:57 -0700 (PDT)
Subject: Re: [PATCH 1/1] s390x/cpumodel: add 3931 and 3932
To: David Hildenbrand <david@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>
References: <20210622201923.150205-1-borntraeger@de.ibm.com>
 <20210622201923.150205-2-borntraeger@de.ibm.com>
 <b584eb80-ceac-9188-11a2-c4a86388ac1e@redhat.com>
 <7cd6fb75-521b-e970-4f25-b23722765bf9@de.ibm.com> <8735szl66j.fsf@redhat.com>
 <e448f4ee-76cf-c380-2a23-7e746a728a9d@de.ibm.com>
 <1b3e7bc9-4bf1-a3fb-086a-f30780e020b4@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <b9f02b4b-a94e-a714-7f1e-cddc30dcb792@redhat.com>
Date: Thu, 1 Jul 2021 10:42:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1b3e7bc9-4bf1-a3fb-086a-f30780e020b4@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Halil Pasic <pasic@linux.ibm.com>, qemu-s390x <qemu-s390x@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Janosch Frank <frankja@linux.ibm.com>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01/07/2021 09.45, David Hildenbrand wrote:
> On 30.06.21 17:56, Christian Borntraeger wrote:
>>
>>
>> On 30.06.21 17:32, Cornelia Huck wrote:
>>> On Wed, Jun 30 2021, Christian Borntraeger <borntraeger@de.ibm.com> wrote:
>>>
>>>> On 30.06.21 15:32, David Hildenbrand wrote:
>>>>> On 22.06.21 22:19, Christian Borntraeger wrote:
>>>>>> This defines 5 new facilities and the new 3931 and 3932 machines.
>>>>>> As before the name is not yet known and we do use gen16a and gen16b.
>>>>>> The new features are part of the full model.
>>>>>>
>>>>>> The default model is still empty (same as z15) and will be added
>>>>>> in a separate patch at a later point in time.
>>>>>>
>>>>>> Also add the dependencies of new facilities and as a fix for z15 add
>>>>>> a dependency from S390_FEAT_VECTOR_PACKED_DECIMAL_ENH to
>>>>>> S390_VECTOR_PACKED_DECIMAL.
>>>>>>
>>>>>> Signed-off-by: Christian Borntraeger <borntraeger@de.ibm.com>
>>>>>> ---
>>>>>>     target/s390x/cpu_features_def.h.inc |  5 +++++
>>>>>>     target/s390x/cpu_models.c           |  6 ++++++
>>>>>>     target/s390x/gen-features.c         | 14 ++++++++++++++
>>>>>>     3 files changed, 25 insertions(+)
>>>>>>
>>>>>> diff --git a/target/s390x/cpu_features_def.h.inc 
>>>>>> b/target/s390x/cpu_features_def.h.inc
>>>>>> index 7db3449e0434..c71caee74411 100644
>>>>>> --- a/target/s390x/cpu_features_def.h.inc
>>>>>> +++ b/target/s390x/cpu_features_def.h.inc
>>>>>> @@ -109,6 +109,11 @@ DEF_FEAT(VECTOR_PACKED_DECIMAL_ENH, "vxpdeh", 
>>>>>> STFL, 152, "Vector-Packed-Decimal-
>>>>>>     DEF_FEAT(MSA_EXT_9, "msa9-base", STFL, 155, 
>>>>>> "Message-security-assist-extension-9 facility (excluding subfunctions)")
>>>>>>     DEF_FEAT(ETOKEN, "etoken", STFL, 156, "Etoken facility")
>>>>>>     DEF_FEAT(UNPACK, "unpack", STFL, 161, "Unpack facility")
>>>>>> +DEF_FEAT(NNPA, "nnpa", STFL, 165, "NNPA facility")
>>>>>> +DEF_FEAT(VECTOR_PACKED_DECIMAL_ENH2, "vxpdeh2", STFL, 192, 
>>>>>> "Vector-Packed-Decimal-Enhancement facility 2")
>>>>>> +DEF_FEAT(BEAR, "bear", STFL, 193, "BEAR-enhancement facility")
>>>>>
>>>>> Usually we use "eh" for enhancement. Which would result in "beareh" or 
>>>>> alternatively "beh". But maybe the "enhancement" part is not actually 
>>>>> an enhancement, but instead this facility is more like the etoken or 
>>>>> unpack facility ...
>>>>
>>>> There was no bear facility (I think it was part of PER3).
>>>> beareh or beh would be fine with me.
>>>>
>>>>>
>>>>>> +DEF_FEAT(RDP, "rdp", STFL, 194, "Reset-DAT-protection facility")
>>>>>> +DEF_FEAT(ACTIVITY, "activity", STFL, 196, 
>>>>>> "Processor-Activity-Instrumentation facility")
>>>>>
>>>>> Would "pai" be a more appropriate feature name?
>>>>
>>>> pai would be ok for me as well.
>>>>
>>>> Conny, do you want to replace "activity" with "pai" and "bear" with 
>>>> "beareh" in your tree?
>>>
>>> I can certainly edit this to a naming everyone agrees with (no strong
>>> opinions from my side).
>>
>> Lets pick "pai" and the choose among "beareh" and "beh"
>>
> 
> I'd just go for "beareh" in case we ever have another b...enhancement 
> feature. But no strong opinion.

+1 for beareh
... the chance for confusion with other TLAs is to big otherwise.

  Thomas


