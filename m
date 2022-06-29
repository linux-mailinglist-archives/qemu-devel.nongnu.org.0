Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC50355FD21
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jun 2022 12:29:40 +0200 (CEST)
Received: from localhost ([::1]:39758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6Ux1-00044W-CA
	for lists+qemu-devel@lfdr.de; Wed, 29 Jun 2022 06:29:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1o6Uun-00026M-W3
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 06:27:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34620)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1o6Uui-0005U1-VY
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 06:27:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656498435;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WBDTegV1NcLsYm3iT9zew3Lk6STRKzydFuyy5K6OCz0=;
 b=I5jlj50WiG/J2Fod7UlDbQiIVsMg/5jKIEol0uorfX1oFMFExIanOy986gj3lgrrcwXvUs
 Sg40fs/a9TMt9ubdwRgT4ZbkRuINeTjQ/nAX7TALvByifegttnpXFDkLQ+9ZjouBiUeplZ
 SqKO/kbc9BOtjIgj1nBOvVDr20PSU+4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-261-keTZ4Vy5MmubTREGQzSdhQ-1; Wed, 29 Jun 2022 06:27:14 -0400
X-MC-Unique: keTZ4Vy5MmubTREGQzSdhQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 k16-20020a7bc310000000b0038e6cf00439so8516732wmj.0
 for <qemu-devel@nongnu.org>; Wed, 29 Jun 2022 03:27:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=WBDTegV1NcLsYm3iT9zew3Lk6STRKzydFuyy5K6OCz0=;
 b=OauQ+sTxgD4YpEdfKBRGO6a/f8qa4o3xYnr1OjJ8pL8STfN4W8Knj3jl94JuPbdIti
 3QBS+hyZuVO1F6fohyCCMGW5vCUrrqYHkv3LZdhORoFFb/JWsXAsHjtwoTT5keaOrdrH
 dENNgUxeAC1B3kt5wuc2DmzytFZ6LifmGn7lXBbYNXTt6GqT5YitPViCJ/HD6oEHA7bN
 juRTjJC576/GzNuymzbypDrI06bAxMsbqZw1OhQMgJWmgfWsOJqK4midiq3p+JL9ObKP
 7VBFtb8fP+TEPVl8dg2ujnJhp4rY11RA1PbuynVBMJ6MVIThDXmgMWSKIE7VzUansl6x
 2ESg==
X-Gm-Message-State: AJIora9w7MbRL2HqGXYuXXg2dRvTXFlsoiph5xnL6EjFoa2CcDaw9ute
 KFga5Cmg5MP7b4nsB5KKYKNlk5a1hvuA2HpggJFlwRoLOgueG6QWevG+17pJtXjWwcegYIUGF/9
 SXByyUqOcvF6vReg=
X-Received: by 2002:a05:6000:1ac8:b0:21b:9239:8f28 with SMTP id
 i8-20020a0560001ac800b0021b92398f28mr2345403wry.517.1656498433158; 
 Wed, 29 Jun 2022 03:27:13 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tUVbWc1hU7SY2ogJhogVmcqmC0xhE1SndKH4Vpc/DBlvgGoy449k/QCIX0qTDqOqQV9X0B+Q==
X-Received: by 2002:a05:6000:1ac8:b0:21b:9239:8f28 with SMTP id
 i8-20020a0560001ac800b0021b92398f28mr2345379wry.517.1656498432858; 
 Wed, 29 Jun 2022 03:27:12 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 f19-20020a05600c4e9300b003a047dccfffsm3274435wmq.42.2022.06.29.03.27.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Jun 2022 03:27:12 -0700 (PDT)
Message-ID: <b684d1e6-2d8f-5d08-aae0-b085a722575b@redhat.com>
Date: Wed, 29 Jun 2022 12:27:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH RFC 0/2] arm: enable MTE for QEMU + kvm
Content-Language: en-US
To: Cornelia Huck <cohuck@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>
Cc: Andrew Jones <drjones@redhat.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, kvm@vger.kernel.org
References: <20220512131146.78457-1-cohuck@redhat.com>
 <4bb7b5e4-ceb4-d2d8-e03a-f7059e5158d6@redhat.com> <87a6agsg9t.fsf@redhat.com>
From: Eric Auger <eauger@redhat.com>
In-Reply-To: <87a6agsg9t.fsf@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eauger@redhat.com;
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

Hi Connie,

On 6/13/22 18:02, Cornelia Huck wrote:
> On Fri, Jun 10 2022, Eric Auger <eauger@redhat.com> wrote:
> 
>> Hi Connie,
>>
>> On 5/12/22 15:11, Cornelia Huck wrote:
>>> This series enables MTE for kvm guests, if the kernel supports it.
>>> Lightly tested while running under the simulator (the arm64/mte/
>>> kselftests pass... if you wait patiently :)
>>>
>>> A new cpu property "mte" (defaulting to on if possible) is introduced;
>>> for tcg, you still need to enable mte at the machine as well.
>> isn't the property set to off by default when kvm is enabled (because of
>> the migration blocker).
> 
> Oh, I had changed that around several times, and it seems I ended up
> being confused when I wrote this cover letter... I wonder what the best
> state would be (assuming that I don't manage to implement it soonish,
> but it seems we still would need kernel changes as by the discussion in
> that other patch series.)
Having mte=off by default along with KVM, until the migration gets
supported, looks OK to me. Does it prevent you from having it set to
another value by default with TCG (depending on the virt machine
tag_memory option)?

		tag_memory=on	tag_memory=off
KVM CPU mte=off	invalid		mte=off
KVM CPU mte=on	invalid		mte=on
TCG CPU mte=off	invalid		mte=off
TCG CPU mte=on	mte=on		invalid

default value:
KVM mte = off until migration gets supported
TCG mte = machine.tag_memory

Thanks

Eric

> 
>>
>> Eric
>>>
>>> I've hacked up some very basic qtests; not entirely sure if I'm going
>>> about it the right way.
>>>
>>> Some things to look out for:
>>> - Migration is not (yet) supported. I added a migration blocker if we
>>>   enable mte in the kvm case. AFAIK, there isn't any hardware available
>>>   yet that allows mte + kvm to be used (I think the latest Gravitons
>>>   implement mte, but no bare metal instances seem to be available), so
>>>   that should not have any impact on real world usage.
>>> - I'm not at all sure about the interaction between the virt machine 'mte'
>>>   prop and the cpu 'mte' prop. To keep things working with tcg as before,
>>>   a not-specified mte for the cpu should simply give us a guest without
>>>   mte if it wasn't specified for the machine. However, mte on the cpu
>>>   without mte on the machine should probably generate an error, but I'm not
>>>   sure how to detect that without breaking the silent downgrade to preserve
>>>   existing behaviour.
>>> - As I'm still new to arm, please don't assume that I know what I'm doing :)
>>>
>>>
>>> Cornelia Huck (2):
>>>   arm/kvm: enable MTE if available
>>>   qtests/arm: add some mte tests
>>>
>>>  target/arm/cpu.c               | 18 +++-----
>>>  target/arm/cpu.h               |  4 ++
>>>  target/arm/cpu64.c             | 78 ++++++++++++++++++++++++++++++++++
>>>  target/arm/kvm64.c             |  5 +++
>>>  target/arm/kvm_arm.h           | 12 ++++++
>>>  target/arm/monitor.c           |  1 +
>>>  tests/qtest/arm-cpu-features.c | 31 ++++++++++++++
>>>  7 files changed, 137 insertions(+), 12 deletions(-)
>>>
> 


