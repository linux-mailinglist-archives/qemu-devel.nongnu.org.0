Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3058D4ABBC8
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 12:41:36 +0100 (CET)
Received: from localhost ([::1]:33566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH2Oj-0004lF-1o
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 06:41:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nH2HX-0000pY-Aw; Mon, 07 Feb 2022 06:34:08 -0500
Received: from [2607:f8b0:4864:20::32e] (port=40610
 helo=mail-ot1-x32e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nH2HV-0001vN-8g; Mon, 07 Feb 2022 06:34:07 -0500
Received: by mail-ot1-x32e.google.com with SMTP id
 x52-20020a05683040b400b0059ea92202daso10632384ott.7; 
 Mon, 07 Feb 2022 03:34:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=EJwnA6WCRuLlTwztcPAce909UPlTPzAfYOtOjXzLois=;
 b=ab2hcldStT/6G3gwbj7Vmw9gEVrpZtelp9ZMb98KEnnodHXCxQ26fu0Lup7zgDuW3V
 9EcmgvSC6s3UfPoVcE20NJcZt2g1rInm8in84fPuw7XwxcIsQ9uwFBivr8m1PcOUVviP
 QoVcl41yGB2sN10eC2Fhw34Xcs1E+w7EFwzFvKmpsJKaShB4anYleFQGKK3wmHW4d82E
 q1Cf1UfWc5KEqHejT+NtOB8nITsQ9dMyQjB+Qm3c6dYG/tTIis5xNvBi4RxMcQcpym3c
 yAwLAiiN16rjCX93reX+yRItSZcLFwWrSBETct8bnUTa+063/S+xonrQHrTf0p8IJJnz
 sLKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=EJwnA6WCRuLlTwztcPAce909UPlTPzAfYOtOjXzLois=;
 b=bLAeiEYbF5t9dEz9S5rZppdfJcREoyh20t0wWDTxU9QGX8hZgbSAK3/nymu/pB6c1D
 4NHDqw4hIo1aBc+DsZFsBmu+nRMYxCARYAPSd1ktg2GRYLT2u1u5p9FbXe7n4B6mEvv+
 xLnjPJzFzXoIoplYBNpq5cEh1Krtp/6t5A7TtlYErx/PzmtSmy//hpSh7ue+wjr0MnCk
 KPOkSeAKCbBuR8Ia3274Fb2mwp3asolhHc+tWb2f2KUkQgcA+6J/fexXs/kECr9vRI4u
 WlvUFeDvN1Ceb4VeQRW6Vlg2Eh0ovudUi+fc9M27VJP/JVpz4dNkuvJZcvQDP9G1E+Cl
 6x6A==
X-Gm-Message-State: AOAM531U4jhVVgnEPMnlmRjv7Uxwq/sIwHTqGW2cCQGr1U3VmwJRsNl9
 2shUDsCS4JNYHOb8IW5+avs=
X-Google-Smtp-Source: ABdhPJwWU3ERvmS5eT8KBMfxE39JMJcOG6MtUHRefMvohJQtoDknrGqXMo/1ImKUYL5wuM7kiNCJmg==
X-Received: by 2002:a9d:6246:: with SMTP id i6mr3859050otk.99.1644233643197;
 Mon, 07 Feb 2022 03:34:03 -0800 (PST)
Received: from [192.168.10.222] ([191.193.0.12])
 by smtp.gmail.com with ESMTPSA id a4sm3651171oaa.42.2022.02.07.03.34.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Feb 2022 03:34:02 -0800 (PST)
Message-ID: <93e3fae4-4e31-12e7-aa58-398ac58e24b3@gmail.com>
Date: Mon, 7 Feb 2022 08:33:59 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFC PATCH] spapr: Add SPAPR_CAP_AIL_MODES for supported AIL
 modes for H_SET_MODE hcall
Content-Language: en-US
To: David Gibson <david@gibson.dropbear.id.au>
References: <20220129065007.103681-1-npiggin@gmail.com>
 <21b0c97c-3963-518c-e910-eb8264fe74a9@gmail.com> <YgB74ak6QGuAd22y@yekko>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <YgB74ak6QGuAd22y@yekko>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::32e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::32e;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x32e.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 2/6/22 22:54, David Gibson wrote:
> On Mon, Jan 31, 2022 at 04:10:34PM -0300, Daniel Henrique Barboza wrote:
>>
>>
>> On 1/29/22 03:50, Nicholas Piggin wrote:
>>> The behaviour of the Address Translation Mode on Interrupt resource is
>>> not consistently supported by all CPU versions or all KVM versions.  In
>>> particular KVM HV only supports mode 0 on POWER7 processors, and does
>>> not support mode 2 on any processors. KVM PR only supports mode 0. TCG
>>> can support all modes (0,2,3).
>>>
>>> This leads to inconsistencies in guest behaviour and could cause
>>> problems migrating guests.
>>>
>>> This was not too noticable for Linux guests for a long time because the
>>> kernel only used mode 0 or 3, and it used to consider AIL to be somewhat
>>> advisory (KVM would not always honor it either) and it kept both sets of
>>> interrupt vectors around.
>>>
>>> Recent Linux guests depend on the AIL mode working as defined by the ISA
>>> to support the SCV facility interrupt. If AIL mode 3 can not be provided,
>>> then Linux must be given an error so it can disable the SCV facility.
>>
>> Is this the scenario where migration failures can occur? I don't understand
>> what are the migration problems you cited that were possible to
>> happen.
> 
> The problem case (well, the main one) is migrating from qemu on a
> recent KVM running with AIL==3 to qemu on an older KVM (or PR) where
> AIL==3 doesn't work properly.
> 
> Theoretically, a qemu running with AIL==2 on TCG to a qemu running on
> KVM is also a problem, though it's not going to arise in practice,
> since AFAIK no guests we care about use AIL==2.
> 
>>> Add the ail-modes capability which is a bitmap of the supported values
>>> for the H_SET_MODE Address Translation Mode on Interrupt resource. Add
>>> a new KVM CAP that exports the same thing, and provide defaults for PR
>>> and HV KVM that predate the cap.
>>
>> Why add a new machine cap in this case? Isn't something that the KVM capability
>> should be able to handle by itself, where we always assume that we should have
>> the best AIL value possible?
> 
> Because the "best AIL possible" might change across a migration.

Well, since there's a possible migration breakage scenario I believe we'll need to
consider adding this new cap then.

Given that Nick is using a sensible default and most users won't be affected by this
cap I think it's ok.


Thanks,


Daniel

> 

