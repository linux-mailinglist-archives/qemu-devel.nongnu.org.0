Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9BC040C10C
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 09:55:43 +0200 (CEST)
Received: from localhost ([::1]:33420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQPle-0007h1-CP
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 03:55:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mQPkE-0006Hz-Sm; Wed, 15 Sep 2021 03:54:14 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:34340)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mQPkD-0004By-9N; Wed, 15 Sep 2021 03:54:14 -0400
Received: by mail-wr1-x433.google.com with SMTP id m9so2396755wrb.1;
 Wed, 15 Sep 2021 00:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=vx8JTPJYtY6Mca/XV3Eh8bS53+HeXB1NJ0H3fvBKpDY=;
 b=dB8uBBz2S9oBcXOZ0xAmae4vEloJ4ROIntlBtPgP1OOClIB8ISQoBbMrUlS3mfdsyt
 BC1kPMKlXTrbhpZuqkjnDcAXo6GOV/WOa3nJaWqj1GWdW2gKV5fcOkYBdwwa9LaiaU+Z
 lriyGGLzToC1yV/RC5dWrELPFw3PTMDYjkvDX/ru+uHq+DAXVsLYJsL1Fa9nr0JMF5gO
 SYQjXjho8EYDpD/bwd3tb56HHPRoexRM5H4rSrC1t2igy96F3CmVQdaMdJ9JgbuUO2Po
 Qeq/te6TXgP0NX6ByH7B8GlrzBpeYVCCUeOqyDyeDBr3r6fl+FNQqpSJTh2yd2sIwYw0
 qyKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vx8JTPJYtY6Mca/XV3Eh8bS53+HeXB1NJ0H3fvBKpDY=;
 b=JVqaGsZeGpI+kH/wylg8FcI9FETMUvLH4oD721N3Nz8M6imS6SJ9eS6+jFxM5vCWeH
 ZIAno6U/U8OFgB2j0ahWPq6SgZQ5KWBTb1Nt8/ZGa1M9DOtfPxXsJSQ5cptdobi8FlQo
 0ENffAZ9qHQ1vOVCIpgApJDdLvGjDocuKqD/QVfV4bgvJO+nqzh4sWjmLdewBmOp2Ndn
 rxrpMd57jYlSAHOEbPWRjk42bRhjrFqq0HeMWZ86J6DfNfvqejOUHqjvjpYUcmtOmxUd
 ziR9zh/spu9403oluO8KEvl4iNGgpJis8CvKmSdTbzCyCD4CsDecTtZzjhbQJI1YEQkk
 D29g==
X-Gm-Message-State: AOAM530PMN7CNYLOnVAAmz3fENt8Q2DJp7FQ1dtScBAN/F/HZWoOGyqa
 o8L/85h8o7gz3QrmdpZyg1k=
X-Google-Smtp-Source: ABdhPJw4oXX0bym24JWjWrAVOfp/yDtp7fvDaM9uz2SIGd/bRaaVmTFNpjsvfgMdH+YG8QJRRvDTzQ==
X-Received: by 2002:a5d:4b42:: with SMTP id w2mr3226256wrs.273.1631692451150; 
 Wed, 15 Sep 2021 00:54:11 -0700 (PDT)
Received: from [192.168.1.36] (14.red-83-35-25.dynamicip.rima-tde.net.
 [83.35.25.14])
 by smtp.gmail.com with ESMTPSA id x21sm3554956wmc.14.2021.09.15.00.54.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Sep 2021 00:54:10 -0700 (PDT)
Subject: Re: Deprecate 32-bit hosts? (was: Re: [PULL 14/14] hw/arm/aspeed: Add
 Fuji machine type)
To: Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Joel Stanley <joel@jms.id.au>
References: <20210913161304.3805652-1-clg@kaod.org>
 <20210913161304.3805652-15-clg@kaod.org>
 <88c26520-6b87-e7a2-ac78-c1c92477c814@kaod.org>
 <BBC4A4E0-651C-41DB-81DE-1F6D86AABAB1@fb.com>
 <CACPK8Xdey9_x-ZN1JbgFyTrW59EapH4xcqYbyNQxyQ5t0uWPvw@mail.gmail.com>
 <CAFEAcA8ntPE3GkTNU8bSBhCWzk_jdH4QR1kDgwo6deQ+T1iOKw@mail.gmail.com>
 <1949e204-1bce-f15b-553b-1b42b41e3e08@linaro.org>
 <ee5d379f-a792-aae1-370a-b5f21582ae58@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <5dca12d8-8f8c-2c5e-3913-fd0627fdd7df@amsat.org>
Date: Wed, 15 Sep 2021 09:54:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <ee5d379f-a792-aae1-370a-b5f21582ae58@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.969,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Andrew Jeffery <andrew@aj.id.au>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Peter Delevoryas <pdel@fb.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/15/21 9:42 AM, Thomas Huth wrote:
> On 14/09/2021 17.22, Richard Henderson wrote:
>> On 9/14/21 5:26 AM, Peter Maydell wrote:
>>> (2) RAM blocks should have a length that fits inside a
>>>      signed 32-bit type on 32-bit hosts (at least I assume this
>>>      is where the 2047MB limit is coming from; in theory this ought
>>>      to be improveable but auditing the code for mishandling of
>>>      RAMblock sizes to ensure we weren't accidentally stuffing
>>>      their size into a signed 'long' somewhere would be kind
>>>      of painful)
>>
>> Recalling that the win64 abi model is p64, i.e. 'long' is still 32-bit
>> while pointers are 64-bit, how close do we think we are to this being
>> fixed already?
>>
>>> Even if we did fix (2) we'd need to compromise on (3)
>>> sometimes still -- if a board has 4GB of RAM that's
>>> not going to fit in 32 bits regardless. But we would be
>>> able to let boards with 2GB have 2GB.
>>
>> I'm not opposed to deprecating 32-bit hosts...  ;-)
> 
> I think we should consider this again, indeed. Plain 32-bit CPUs are
> quite seldom these days, aren't they? And I think we urgently need to
> decrease the amount of things that we have to test and maintain in our
> CI and developer branches... So is there still a really really
> compelling reason to keep 32-bit host support alive?
> Could we maybe also decrease the amount of targets, i.e. merge
> qemu-system-x86_64 and qemu-system-i386, merge qemu-system-ppc64 and
> qemu-system-ppc, etc. where it makes sense (i.e. where one of the
> binaries is a superset of the other)?

Not directly related, but orthogonal to this, now than Richard got his
memory API series addressing endian issues merged, I'm slowly (in my
free time) trying to unify dual-endian machines. For user-emulation
it is a bit tricker so I'll look at it once sysemu is working. This
won't reduce the testing time, but the build time.

