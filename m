Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5E2E31431E
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 23:40:54 +0100 (CET)
Received: from localhost ([::1]:40014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9FDB-00041r-Pf
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 17:40:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l9Axo-0001u1-Bg
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 13:08:47 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:42923)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l9Axm-0007pu-HW
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 13:08:43 -0500
Received: by mail-wr1-x435.google.com with SMTP id r21so2097523wrr.9
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 10:08:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=91V4Y3RCSwDlqG/bV1SaR3sCYfKVTv9SGaWM3De55E0=;
 b=vNGjj4M1LSFsobAPJaoVvG6fOgg6b0+m65Ab6PBCGWKXowfun7lRLL5Mc6psqf+a6D
 EEN0EvLqnmgIG5NUGIaNbHgNovk7DRLb+mKenSB0q3rR/229mtasBEjUBkpW1+iaU8BC
 kSMbZabP1zeV9iF0cQ+EyboJtAETVCkxKtvqE6GfIWkf87jQmnfG9WrGcwSeJ1vx6YwL
 UeJFPiJ5F2Y76HOljrhac1EYBuskobj/DpS8iTUBqXrkNdPUwZmKLtYJxyma8ZXSbrHt
 gOHNQ+/xhctUDr70tRkS8jBR2pJfsWkvnCSteoliao4TJeh3kEP+E+0AxLcRCrROZmx+
 cxcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=91V4Y3RCSwDlqG/bV1SaR3sCYfKVTv9SGaWM3De55E0=;
 b=Wwk9ipuKy1sXcJL4B3du9H63MbH5Nw+GFH0/de++UYDYVmoZAXLdQ+MWkgAax7KS1r
 UkekCdrM4pVdO6+JCm8HAOUKNoPHe/685k7zqWTPa0Zoxs+nNj1nkFHIB9qAbJNy2u5O
 iApUXFQI+l7M2t96OwlVo69Q9Z5WcMvMfyWe6nL/wCnHjerMuZQ61zgDlRwArWgoqPqA
 6OC9z3eeqnRsNyKTfKSjM5yYptKINB2GO1Bz+FAYkZXj7BjWRfBjXolUNq9yl/zOR1Ru
 cx/DqhcnBnpbkhk2uBNpAIlvGaS1egoq4p0ciQnLqRJzjfuRyXZVDk+UnuHFOiw0ZFmv
 zOAw==
X-Gm-Message-State: AOAM533PeJYJWks/N2Jm43ZQCsjts0xr07DRFFL6+ptx+lQzfxnDG/oL
 ROZ4eWPt0TpZXik5uFHcAHo=
X-Google-Smtp-Source: ABdhPJzTYMrEmFhA1QgbYTLnbbQYCKoxmCSWE8kdidMW2kwjCAUTcZdMBLD6SHZ0x6JoOkzuA2Dt0g==
X-Received: by 2002:adf:f1c5:: with SMTP id z5mr21257202wro.391.1612807721037; 
 Mon, 08 Feb 2021 10:08:41 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id b19sm21290069wmj.22.2021.02.08.10.08.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Feb 2021 10:08:40 -0800 (PST)
Subject: Re: [PATCH 0/3] fix build failures from incorrectly skipped container
 build jobs
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Yonggang Luo <luoyonggang@gmail.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, Stefan Weil <sw@weilnetz.de>
References: <20210208163339.1159514-1-berrange@redhat.com>
 <20210208172256.GM1141037@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <cb8195b9-c8fc-9900-346a-fce0aba9eb83@amsat.org>
Date: Mon, 8 Feb 2021 19:08:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210208172256.GM1141037@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.265,
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/8/21 6:22 PM, Daniel P. Berrangé wrote:
> On Mon, Feb 08, 2021 at 04:33:36PM +0000, Daniel P. Berrangé wrote:
>> This series fixes a problem with our gitlab CI rules that cause
>> container builds to be skipped. See the commit description in the
>> first patch for the details on this problem.
>>
>> The overall result of this series though is a small increase in overall
>> pipeline time.
>>
>> Previously
>>
>>  - When container jobs are skipped: approx 1hr 5 mins
>>  - When container jobs are run, cached by docker: approx 1hr 15 mins
>>  - When container jobs are run, not cached by docker: approx 1hr 30 mins
>>
>> With this series applied the first scenario no longer exists, so
>> all piplines are either 1hr 15 or 1hr 30 depending on whether the
>> container phase is skipped.
> 
> I mean to say the biggest problem I see is the cross-win64-system
> job. This consumes 1 hour 5 minutes all on its own. It is at least
> 15 minutes longer that every other job AFAICT. So no matter how
> well we parallelize stuff, 1 hr 5 is a hard lower limit on pipeline
> duration right now.
> 
> We might want to consider how to split the win64 job or cut down
> what it does in some way ?

When the win64 build was added (on Debian), it was to mostly to cover
the WHPX. Later we moved mingw jobs to Fedora. I just checked and
WHPX is no more built, and nobody complained, so it is not relevant
anymore.

I don't mind much what you do with the Gitlab win64 job, as this config
is better covered on Cirrus. I'd like to keep the win32 job because it
has been useful to catch 32-bit issues.

Regards,

Phil.

