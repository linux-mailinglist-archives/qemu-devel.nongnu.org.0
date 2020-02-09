Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A120E156C02
	for <lists+qemu-devel@lfdr.de>; Sun,  9 Feb 2020 19:18:48 +0100 (CET)
Received: from localhost ([::1]:53514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j0rAN-00050e-3N
	for lists+qemu-devel@lfdr.de; Sun, 09 Feb 2020 13:18:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47100)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j0r9f-0004Z8-5U
 for qemu-devel@nongnu.org; Sun, 09 Feb 2020 13:18:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j0r9d-00013f-W5
 for qemu-devel@nongnu.org; Sun, 09 Feb 2020 13:18:02 -0500
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:46921)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j0r9d-00013B-PT
 for qemu-devel@nongnu.org; Sun, 09 Feb 2020 13:18:01 -0500
Received: by mail-pl1-x641.google.com with SMTP id y8so1853714pll.13
 for <qemu-devel@nongnu.org>; Sun, 09 Feb 2020 10:18:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=xiMp2kPJLlo2ICmBN9YcEFNNAC17Lrtxh9yl+SAceYM=;
 b=OJGLLI+TBV8jN4Df6Dadt5xFW7aOcFxLnD1mSLgKUwJhTiKiz5kc3TaSHaqkZpvGXL
 o71tj4iadclVjGgVyYofAdxRyIFQ0SKWTvaKnH/eaen4Y53//c+dpaWlQnP8gs6d3ciO
 kjYa+uJ5F1qkQEgAkShkM1b8mS7MNkqHAj6zKjq6AbMS6BzZIe9v6xU4vnMtDvoH3UBH
 t/EjiD3I3ElVUPmTiUrGaaDIW59iu62tlGyMQ0jRD6CL1/1qdui2Gi2yxPS0VxeSJP5r
 fglOeEgntn249SfF/NY9civ+xlZ2eg/oSdG3ncygwO0VRfiv28C3NTWNkrInVB5WDEMc
 PxdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xiMp2kPJLlo2ICmBN9YcEFNNAC17Lrtxh9yl+SAceYM=;
 b=ArIKu7eAEWPOOxCnKsYG3f4FCJV9SCtVLTtfl+cBSavDW6ywWIYxK2NDM4Tx3GrAkq
 RmEaBr/0wqagyUD/8/fga4rFiThn3CIQG9Hb5HzSAWbAzDlw9t9MqnvbhUS6sdrKwNzF
 jFQykLVnEdRE5aM+d9AIhVpctAffOjVGPIYcJr9ijwxCka0Em9H0cItPCmsiQCtLhkgp
 8Y9R+ytoXL7qlrStb5jhPfP50q2lj3oII2tmQMI1tRv/aJOWC36Ko2hbynk1fMILn0E9
 k9s4W6C3FDaGUEykumX56MeD1XCP1e0grcL9D3kQFVB9o84Yyg4JJAWdRKRAkrPbVHLZ
 FS4w==
X-Gm-Message-State: APjAAAXX5bW4TrQX7SuAhSIkULLOFrfkWHJygPkasXNeeumKMsUd2gAh
 Oi6fYDIj+oy93GHHEbJJci8sCw==
X-Google-Smtp-Source: APXvYqxxjj6ATffHqliOvjesMAsvaqYg2wHDy4QNLvxExd2sxAz+LvbiJGn+25HzePBVJ4byDzWDIw==
X-Received: by 2002:a17:90b:1256:: with SMTP id
 gx22mr16369760pjb.94.1581272280374; 
 Sun, 09 Feb 2020 10:18:00 -0800 (PST)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 h10sm9463729pfo.181.2020.02.09.10.17.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Feb 2020 10:17:59 -0800 (PST)
Subject: Re: [PATCH] Add support for a helper with 7 arguments
To: Taylor Simpson <tsimpson@quicinc.com>, Richard Henderson
 <rth@twiddle.net>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <1580942510-2820-1-git-send-email-tsimpson@quicinc.com>
 <b308434a-1ee8-4fb5-0e60-4dfdd047c959@linaro.org>
 <BYAPR02MB4886E14CC87B1169B2F6BE2BDE1C0@BYAPR02MB4886.namprd02.prod.outlook.com>
 <a01b3358-a598-9d01-f3c8-d9a84fb7dd28@twiddle.net>
 <SN6PR02MB4895FE0821C3927B41636AB0DE1E0@SN6PR02MB4895.namprd02.prod.outlook.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <fc6876dc-1a15-152c-5585-4ab06deb60fc@linaro.org>
Date: Sun, 9 Feb 2020 10:17:56 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <SN6PR02MB4895FE0821C3927B41636AB0DE1E0@SN6PR02MB4895.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::641
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
Cc: Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/8/20 5:08 AM, Taylor Simpson wrote:
>> {
>>   r6 = memb(r1)
>>   r7 = memb(r2)
>> }
>>
>> qemu_ld   t0, r1, MO_UB, mmu_idx
>> qemu_ld   t1, r2, MO_UB, mmu_idx
>> mov       r6, t0
>> mov       r7, t1
>>
> 
> Here is the TCG we generate currently.
>  movi_i32 tmp0,$0x0
>  add_i32 loc2,r1,tmp0
>  qemu_ld_i32 loc3,loc2,sb,0
>  mov_i32 new_value,loc3
>  movi_i32 tmp0,$0x0
>  add_i32 loc2,r2,tmp0
>  qemu_ld_i32 loc3,loc2,sb,0
>  mov_i32 new_value,loc3
>  mov_i32 r6,new_value
>  mov_i32 r7,new_value
> I could work on eliminating the add of zero and the extra copies.  Is TCG
> able to optimize these before emitting the host code?
We can optimize them.

However, you should prefer to use tcg_gen_addi_* over tcg_gen_add_* (etc) when
you know that one operand is constant.  This will optimize away the add zero
immediately as opposed to allocating memory and walking the data structures to
eliminate it later.

Why are you using a local temporary for EA?  That should be dead immediately
after this slot is complete.

What's with two temporaries both named "new_value"?

>> For a conditional load in slot 0, we can load directly into the final
>> destination register and skip the temporary.
> 
> In general, there will be lots of checks we would need to perform before
> concluding that an instruction can write directly into the destination.  For
> example, we have to make sure no other instruction later in the packet reads
> r7.

Which is of course all trivial for slot 0, being last.


r~

