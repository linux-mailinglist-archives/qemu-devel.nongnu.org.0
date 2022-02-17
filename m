Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4F324B9B5D
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 09:45:36 +0100 (CET)
Received: from localhost ([::1]:35054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKcPv-0007fJ-PC
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 03:45:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nKbfK-0004rn-6w
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 02:57:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46476)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nKbfH-0005ke-Sc
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 02:57:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645084643;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Pomcwhq8aBGTfn27Zm94HaEssyJxCN7jVbXTio5OgcA=;
 b=i+mfDzmpaeyYmIR7n5gh/LM1gnCsmm8mhps3qDnu69Uuo60SFCZSxxUv3MKdWfhxQHOVDT
 3WE7GVk/PORvuca/59mYbdtDFS6+A1PxaUbQcTFpeHSw6bc9XKNzuS3cOODGo5qIC+ZNHc
 NWVkCS8CmA4iqNEsC9MpKqhywEtVv9Q=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-322-vmQHcwEYMey3jLoHQT_79Q-1; Thu, 17 Feb 2022 02:57:21 -0500
X-MC-Unique: vmQHcwEYMey3jLoHQT_79Q-1
Received: by mail-wm1-f70.google.com with SMTP id
 ay41-20020a05600c1e2900b0037c5168b3c4so3864532wmb.7
 for <qemu-devel@nongnu.org>; Wed, 16 Feb 2022 23:57:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Pomcwhq8aBGTfn27Zm94HaEssyJxCN7jVbXTio5OgcA=;
 b=iYHVxGb7aI7lMOAQLb8+/E4a/BTuqES/Yv/idS4M9P+ucxlM2pBKTSoCp4wtgvewNx
 HCJjwD1AS1vBhwnPcytJG4o0akYNCrQrQXLC3jHGG9EPDXiTqBVkVccddRmRNTNC0GWf
 19/VJRG5MBzXm2X9JT/9wI4g2A9iubNuBMisfm80OdLKa2/kDV73Dx6vgPxncFQD0WZd
 VV7QAVst7W6LFn88WCb9wR+ARCTd5QWLN1mNlj5ttudtUJYpcwFr16Cv8h9rg+TmA2QP
 xx08jDHNBUpHuMfktDwd5IxfX0EZwaoycbfan1vfEU9LdXDgQ/+nwfkxLaC/qN09DtB9
 R+9w==
X-Gm-Message-State: AOAM5331Bh+osm9hEoAbNRxyy3k1q86Hj3b4EjUYjfL7Vi+Ah8O3sAW5
 k5URDjP/nB961odQ77D5PuO9+YaCbi8FzBWfGa3yyP5cH1daYe84ilPZtwwqyJXUWo0siNPBPpl
 5139n27dy/MrHgx0=
X-Received: by 2002:a05:600c:4f54:b0:37b:fe6a:ea9c with SMTP id
 m20-20020a05600c4f5400b0037bfe6aea9cmr1494465wmq.169.1645084640838; 
 Wed, 16 Feb 2022 23:57:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxcUaRg1nweMpqU2guGd4eDcOeB7AmBCoorIfYWcXXsAAT+UzfQSqxGCMfbi0r9ah1Weq5BOg==
X-Received: by 2002:a05:600c:4f54:b0:37b:fe6a:ea9c with SMTP id
 m20-20020a05600c4f5400b0037bfe6aea9cmr1494446wmq.169.1645084640592; 
 Wed, 16 Feb 2022 23:57:20 -0800 (PST)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id v5sm17909913wrr.7.2022.02.16.23.57.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Feb 2022 23:57:20 -0800 (PST)
Message-ID: <f5ea8b34-2d50-c0d7-4ec0-ff0921dbcbd4@redhat.com>
Date: Thu, 17 Feb 2022 08:57:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 3/3] x86: Switch to q35 as the default machine type
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20220215162537.605030-1-dgilbert@redhat.com>
 <20220215162537.605030-4-dgilbert@redhat.com> <YgvtLmoJcv+ZSW1S@redhat.com>
 <20220216105808.77kqhmsagz3ej74h@sirius.home.kraxel.org>
 <YgzZhHKSAFYTYFDc@work-vm> <db583712-cd6e-d67d-ad98-989a9867499a@redhat.com>
 <Yg03HB5KHGYWyI0J@work-vm>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <Yg03HB5KHGYWyI0J@work-vm>
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
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
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
Cc: eduardo@habkost.net, Laurent Vivier <lvivier@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>, mst@redhat.com,
 quintela@redhat.com, qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16/02/2022 18.40, Dr. David Alan Gilbert wrote:
> * Thomas Huth (thuth@redhat.com) wrote:
>> On 16/02/2022 12.01, Dr. David Alan Gilbert wrote:
>>> * Gerd Hoffmann (kraxel@redhat.com) wrote:
>>>>     Hi,
>>>>> Given the semantic differences from 'i440fx', changing the default
>>>>> machine type has effects that are equivalent to breaking command
>>>>> line syntax compatibility, which is something we've always tried
>>>>> to avoid.
>>>>
>>>> And if we are fine breaking backward compatibility I'd rather *not* pick
>>>> a default, effectively making -M $something mandatory, similar to arm.
>>>
>>> Oh, that's probably easy to do;  what are other peoples thoughts on
>>> that?
>>
>> I agree with Gerd. Getting rid of a default machine on x86 is likely better
>> than silently changing it to q35. But I'd maybe say that this should go
>> through the deprecation process first?
> 
> So just adding something like the following under 'System emulator
> machines':
> 
> x86 default machine type
> ------------------------
> 
> x86 currently defaults to the very old ```pc``` machine type

I'd scrath the "very old" above since you repeat it below...

> which is based on the very old ```i440f``` chipset.  This default
> will be removed and the user will be required to specify a machine
> type explicitly using -M; users are encouraged to switch to the
> not quite as old ```q35``` machine types.

... but otherwise this sounds good to me.

> (This option is going to take a lot more work switching all the
> test cases over; in my world here I'd only changed the tests that broke
> on q35, now everything is going to need to specify a type).

We've got a bunch of targets now already that do not have a default machine 
type yet (aarch64/arm, avr, rx, tricore), and some where the default machine 
type does not make too much sense for testing anyway (e.g. m68k) ... so it 
would maybe be good to have a global qtest_get_default_machine() function in 
the qtest framework anyway instead of re-encoding this in each and every 
test case.

Anyway, if we agree that the default machine type of x86 should go through 
the deprecation process, we've got plenty of time to fix this up in the 
tests, no need to rush this now before 7.0.

Other heretic question: Should we maybe get rid of the default machine type 
for *all* targets? ... so that we do not continue to run into this issue 
again and again and again...

  Thomas


