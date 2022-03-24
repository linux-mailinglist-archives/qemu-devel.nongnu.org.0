Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 651B64E6140
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Mar 2022 10:45:06 +0100 (CET)
Received: from localhost ([::1]:35198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXK1h-00049B-F2
	for lists+qemu-devel@lfdr.de; Thu, 24 Mar 2022 05:45:05 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nXJz9-0003MH-7q
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 05:42:27 -0400
Received: from [2a00:1450:4864:20::534] (port=38520
 helo=mail-ed1-x534.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nXJz7-0006W8-IV
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 05:42:26 -0400
Received: by mail-ed1-x534.google.com with SMTP id c62so4939422edf.5
 for <qemu-devel@nongnu.org>; Thu, 24 Mar 2022 02:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=7K3n+MtpHtpOh1vCgCv2tr1pqpPsLxMrrZesM0v8hvE=;
 b=VLWswZR2RXmt6Eo5+NiDw98T2Fw7d6eb2y/YijS7POjRvRWZjUxaVlxEscgyT95Efr
 JrpYSsTw0Kvd7KzMexnyEKFeqRHv9JyawM6MWyabvaJupbSAMOleDEScT4XPUPkSBzUr
 IJOqwDBXdwzusQOkWUPz7lWh6rfOkJkZspHdfw+Fn/w8KyzmaUglJQQnJPxL5jkd1h3Z
 cyUXQH30duzBNj9wxi1vykCDDol5IoJE1a/Fn6Y4Pv6OGxwHEu5WoOqRgp0VOdyqSVRp
 fzoh5WKFR6VGmoNflocvICROk4HD4jIQrsR+R88xdnIUHS3USxbCqnsOtl/UDW6pVDtm
 xwAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=7K3n+MtpHtpOh1vCgCv2tr1pqpPsLxMrrZesM0v8hvE=;
 b=T9swhnrJ3YktOtC3GKZteWx5tEIyd+G1rwgHZMTNcDKTV/Q9F5Ym7UQ84c27/pfRgu
 zi6usXt+dmqjykngVZE5CBop+BWJTExC4Rx4IPRSykT1QGvF4D1x2x6+rj33LRhelNtv
 ++uUqeRy+hEAjmEwdEkgVAEmD8oR4nd3AFecps//EtZWXYaTvX/iJNszR8RLOeplHZWM
 gtoZZ8OezI+hA6cTKSZk+uhkSj09HNG7C2WYUyqNZQJdcRyBDmvrs0slsyWZ8BJn66Ci
 eJgdp2LouvZsrYmkIrgPeiGMObvH/kj5GeKxXzCFf20hSYZDACp1eWI3hg19OJrPB0pu
 LdRg==
X-Gm-Message-State: AOAM533U1sQhKAR57NRdP3zBp4Hi7pQwW3l5+5q0ubidl+Vp3VOVAa97
 plDs64dTdQrFx59y9LG3JxA=
X-Google-Smtp-Source: ABdhPJx6HRpXS6OMoOUbBAlUZ7SDvQlfCWOL/d/M3ir9tKDZluY7a04aH7XRZ80+3djfbNnEw7S7tw==
X-Received: by 2002:a05:6402:5243:b0:419:52a1:a743 with SMTP id
 t3-20020a056402524300b0041952a1a743mr5541079edd.269.1648114944051; 
 Thu, 24 Mar 2022 02:42:24 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:1c09:f536:3de6:228c?
 ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.googlemail.com with ESMTPSA id
 bx5-20020a0564020b4500b00418fca53406sm1146450edb.27.2022.03.24.02.42.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Mar 2022 02:42:23 -0700 (PDT)
Message-ID: <e0a39a1e-abef-722b-eed7-8bb79e7c151d@redhat.com>
Date: Thu, 24 Mar 2022 10:42:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] target/i386: introduce CPU property to work around
 Windows reset bug
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Vadim Rozenfeld <vrozenfe@redhat.com>
References: <20220324082346.72180-1-pbonzini@redhat.com>
 <Yjw2KG4y8fK5Dw4F@redhat.com> <Yjw2yvN1OHkmBb2X@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <Yjw2yvN1OHkmBb2X@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::534
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x534.google.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/24/22 10:15, Daniel P. Berrangé wrote:
> On Thu, Mar 24, 2022 at 09:13:12AM +0000, Daniel P. Berrangé wrote:
>> On Thu, Mar 24, 2022 at 09:23:46AM +0100, Paolo Bonzini wrote:
>>> Some versions of Windows hang on reboot if their TSC value is greater
>>> than 2^54.  The calibration of the Hyper-V reference time overflows
>>> and fails; as a result the processors' clock sources are out of sync.
>>> As a workaround, reset the TSC to a small value.  Do not do this
>>> unconditionally and require a special property to be set.
>>
>> What's the problem with doing it unconditionally ?
>>
>> Requiring this special niche property means that it'll have to be
>> enabled by management apps. Most will never learn it exists, and
>> of those that do, many will take years to get this enabled and
>> into usage by users, and many won't even bother.
>>
>> IMHO, this is the kind of situation where we need the fix to be
>> enabled by default, or we might as well not bother.
> 
> Sigh, hit send too soon. I see the property is actually turned
> on in the defaults below, so effectively it will always be on
> unconditionally as no one will bother to add support for turning
> it off.

Well, I have a patch to turn it on/off in Libvirt and I also planned to 
leave it off by default in RHEL patch updates (I'm not tying it to the 
machine type because it's not a guest ABI change).

I am myself conflicted on whether to leave it on or off in QEMU.  For 
example you could use the TSC to measure how long the VM has been up, 
but this patch makes that not work anymore.  Considering that the bug 
requires literally 2-3 months of VM uptime to manifest itself, it might 
be better to set up the property in libosinfo and only for Windows guests.

Also, since it is a bug in Windows, it will hopefully be fixed sooner or 
later.

Paolo

