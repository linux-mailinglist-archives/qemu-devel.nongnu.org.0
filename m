Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0288B3B1862
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 13:02:32 +0200 (CEST)
Received: from localhost ([::1]:43640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lw0eK-0008HN-Tf
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 07:02:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lw0bn-0007Ij-Vi
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 06:59:52 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:38527)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lw0bm-0004RE-8m
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 06:59:51 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 p10-20020a05600c430ab02901df57d735f7so3696720wme.3
 for <qemu-devel@nongnu.org>; Wed, 23 Jun 2021 03:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=rGSSn2D+cPN/f7TkV+G3w6c+vyZV/Baf3gBGoI6kQ+s=;
 b=gqhvW1KBBl325S0B3A1D3kdK+IjEhX8njVB4nWDqgQ42UWyf4yOIemJ62zqFBHor77
 rbxwFhye8DyXgzuQZDysOp+WtJ4fpPrRJUr0XXME+iJ7V+QqJ2+7qMa9U7LHleYPNHI/
 q2H7cKJ/maedcvklxF+UG46nOPeaKQRyByzd/vZYCeTqQ5PS50DxfvqwBFvCdjjfWoBR
 CW7Nf8MMXJn/SzoHBkK8tFUaQoO74cdSX3Z/ohJbhQB+Z8UXUqUrCEagLGYjItOPci+A
 8krtjuYmC4DTclW7M11csxWD5stAE7iMN9XxnzMGwe0AcxVhOQ5H+w4/+LMznEps/dnu
 123A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rGSSn2D+cPN/f7TkV+G3w6c+vyZV/Baf3gBGoI6kQ+s=;
 b=GM3OCEotrxlbbGYhr4d9cw0yX+WrbM2XTOHNlnmJ1UzTVGvegVi6qpJ+GEMK7DwuWB
 +rGLyvXKF22GOi04oe2NNpzv8SHHMcTRvV1W+Vmm0KlhgaYxGCzSNBl1Cr52bRoY2xaA
 OMlwUFx/e/iyXGo9GvFDlFN0MWju8srP0CFMCGBRoqry0C+UUnECqQAkcQJMoaj+nqKu
 iaGIVRtKKbNEM4GSb4c9BUk0r4SehSh3HC0tpF0mXc+mGvVOgS3PGRZXfBjQRidz0m7j
 rP4smpyYUOXL2244BU/Ev3xe75j9RGXay7TH8tY7sGmTfFilsudWN0nu2KJQl6ohe3QE
 afOg==
X-Gm-Message-State: AOAM531hN/pXge7o1wCV/EEN8X2NDoxghzF5n+i5uG9QxSILQjj5Hmas
 gIoH4uocyfEznBgIEJLhuXr+sbYrXw5KFg==
X-Google-Smtp-Source: ABdhPJxgssxiJrKM0rTfWybTbuyaD6S8db93awZ8Jnp/Ta8oTpYwe4CRUZAjLWP8YTmQG538qfFHkw==
X-Received: by 2002:a7b:c846:: with SMTP id c6mr9738902wml.182.1624445987489; 
 Wed, 23 Jun 2021 03:59:47 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id y16sm2495973wrp.51.2021.06.23.03.59.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Jun 2021 03:59:46 -0700 (PDT)
Subject: Re: Regarding commit a9bcedd (SD card size has to be power of 2)
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Tom Yan <tom.ty89@gmail.com>
References: <CAGnHSEnpEpnNHtryR=gMTxcGUd0EGW5h5KQeJvkYHp1Fw844fA@mail.gmail.com>
 <YNL+19TnvDzK5NNh@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <eb606b89-5c12-8502-aa64-fafdeeb7bae0@amsat.org>
Date: Wed, 23 Jun 2021 12:59:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YNL+19TnvDzK5NNh@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x330.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org, alistair.francis@wdc.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On 6/23/21 11:28 AM, Daniel P. Berrangé wrote:
> On Mon, Jun 07, 2021 at 04:29:54PM +0800, Tom Yan wrote:
>> Hi philmd (and others),
>>
>> So I just noticed your commit of requiring the size of an emulated SD
>> card to be a power of 2, when I was trying to emulate one for an
>> actual one (well, it's a microSD, but still), as it errored out.
>>
>> You claim that the kernel will consider it to be a firmware bug and
>> "correct" the capacity by rounding it up. Could you provide a concrete
>> reference to the code that does such a thing? I'm not ruling out that
>> some crazy code could have gone upstream because some reviewers might
>> not be doing their job right, but if that really happened, it's a
>> kernel bug/regression and qemu should not do an equally-crazy thing to
>> "fix" it.
> 
> I looked back at the original threads for details, but didn't
> find any aside from this short message saying it broke Linux:
> 
>   https://www.mail-archive.com/qemu-devel@nongnu.org/msg720737.html
> 
> Philippe, do you have more details on the problem hit, or pointer
> to where the power-of-2 restriction is in Linux ?

Sorry for not responding soon enough, too many things.

I wrote patches to address Tom's problem, but couldn't fix all
the cases yet. So far the problem is not Linux but firmwares
announcing pow2 to Linux without checking card layout.

It is hard to make everybody happy, security users and odd firmwares.

I came out with a larger series to be able to classify QEMU API /
devices code as security sensible or not, and use of some unsafe
API to taint some security mode (so far only displaying a warning).
If the security mode is tainted (use of unsafe device, unsafe config,
unsafe feature), then users shouldn't expect safety in the guest.

That way I could have classified the SD card model as unsafe and not
bothered various users by restricting to pow2 card sizes.

>> No offense but what you claimed really sounds absurd and ridiculous.
>> Although I don't have hundreds of SD cards in hand, I owned quite a
>> few at least, like most people do, with capacities ranging from ~2G to
>> ~128G, and I don't even recall seeing a single one that has the
>> capacity being a power of 2. (Just like vendors of HDDs and SSDs, they
>> literally never do that AFAICT, for whatever reasons.)
> 
> Yes, this does feel pretty odd to me too, based on the real physical
> SD cards I've used with Linux non-power-2 sizes.
> 
> Also in general QEMU shouldn't be enforcing restrictions based on
> guest behaviour, it should follow the hardware specs. If the
> hardware spec doesn't mandate power-of-2 sizes, then QEMU shoud
> not require that, even if some guest OS has added an artificial
> restriction of its own.

The comment is misleading, the restriction was to answer CVE vuln.

>> Besides, even if there's a proper reason for the kernel to "fix" the
>> capacity, there's no reason for it to round it up either, because
>> obviously there will never be actual storage for the "virtual blocks".
>> I've never seen such a behavior so far either with the "mmcblk" hosts
>> I've used so far.

Help, reproducible configurations and patches to improve are always
welcomed.

Regards,

Phil.

