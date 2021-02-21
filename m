Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F6B7320E12
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Feb 2021 22:58:03 +0100 (CET)
Received: from localhost ([::1]:57284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDwjq-0008Db-EB
	for lists+qemu-devel@lfdr.de; Sun, 21 Feb 2021 16:58:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDwiF-0007Wj-4f; Sun, 21 Feb 2021 16:56:23 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:55411)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDwiD-0007je-N1; Sun, 21 Feb 2021 16:56:22 -0500
Received: by mail-wm1-x335.google.com with SMTP id i9so1840554wml.5;
 Sun, 21 Feb 2021 13:56:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6QWHvr2iqsz9KocNCKNjpJfn/5xu+/1hFoFwsMeN1Sw=;
 b=VgoZVXiXba8Z9SCwO4P/OE3tr0/+1KGrpXq0SgznSS0llckz4tr6yjOJrKnk8NT5CZ
 er0n9RufBSieVCPdAQAn50fRXcX7+QJRR/I/I6lfAoL0HPHS5Qc+BPO29V/SzWk4yywa
 ozz/LGY1gV7M9bSEcnAHk9M2ysk4FJ3bSVEIIPAox7C1Gd3aXMFPgNIF4qzHH7yI3aqN
 y6MUr7yY975pzL7yUIsJVPzU5yQDoqorJDCCMoj7vMFzHO5LnbSyTLgPcWE7gbX70xfP
 NDtOzooZPXAAqe5JdIRnhH+qEMs3zpiBRxVUGboXeL2Qkg0l1ocyhU3AVy5qjxlO2LxP
 vjBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6QWHvr2iqsz9KocNCKNjpJfn/5xu+/1hFoFwsMeN1Sw=;
 b=kmvoriixcamrQ0/osH30tBfUJtFBeaacF0k2eoNGgKNFpBYujZdGbn7/XEuG+1FJcs
 fkO8Fkl8Yx6wogL0Q1Z0i3SOXXgJfpWhdjjY6lFsEY7x0EtgKyyCPFYeG9YXl1yntE6C
 gD5Om4KBwzWOKeTBELltSdiDSRc1JWFt6QQyWLPzzxKVImiU5q1oWCPQoBZ6yyKqXJrm
 6Wmlwz/l4hnHHyLv05dVx6QXfASQscJsR0Vfhd7n+o9W6D+1oPYpBW44t0csgU85gVL4
 ZXg4EuUyzLxayaKoPk/h3NG5X1yGgnTVizcQlXQmTaxhckWBZYkYnIzFFxerlLh6ReZx
 3C9Q==
X-Gm-Message-State: AOAM532Gh++CsbeVQOR/g//7pmeBtLOwE2s4wl2wZGy6n4gl7TYKVky9
 G37nfUAUmBw6DpnokRJvJW4=
X-Google-Smtp-Source: ABdhPJxRBM/VIXp+1jWBsv7U3/wrITgCMY3y56mkOzunr05sGl2t30JzmJWnz7eTpM87q6jI3fvr2A==
X-Received: by 2002:a1c:6a17:: with SMTP id f23mr6300445wmc.73.1613944580046; 
 Sun, 21 Feb 2021 13:56:20 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id v66sm24189804wme.33.2021.02.21.13.56.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 21 Feb 2021 13:56:19 -0800 (PST)
Subject: Re: [PATCH v2 4/8] hw/char: Introduce SH_SCI Kconfig entry
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210221200249.2536247-1-f4bug@amsat.org>
 <20210221200249.2536247-5-f4bug@amsat.org>
 <CAFEAcA9=KJKSKEdRae5q4xN6oAB6mt8R_C5H8nCFGLHY0jsp6w@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <282f87fd-edf9-0029-3072-ef2d47691076@amsat.org>
Date: Sun, 21 Feb 2021 22:56:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9=KJKSKEdRae5q4xN6oAB6mt8R_C5H8nCFGLHY0jsp6w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x335.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Qemu-block <qemu-block@nongnu.org>, Magnus Damm <magnus.damm@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/21/21 9:45 PM, Peter Maydell wrote:
> On Sun, 21 Feb 2021 at 20:03, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>
>> We want to be able to use the 'SH4' config for architecture
>> specific features. Add more fine-grained selection by adding
>> a CONFIG_SH_SCI selector for the SH4 serial controller.
>>
>> Add the missing MAINTAINERS entries.
>>
>> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>  MAINTAINERS         | 2 ++
>>  hw/char/Kconfig     | 3 +++
>>  hw/char/meson.build | 2 +-
>>  hw/sh4/Kconfig      | 1 +
>>  4 files changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index da10756abf7..34587d90637 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -1387,6 +1387,7 @@ R2D
>>  M: Yoshinori Sato <ysato@users.sourceforge.jp>
>>  R: Magnus Damm <magnus.damm@gmail.com>
>>  S: Odd Fixes
>> +F: hw/char/sh_serial.c
>>  F: hw/sh4/r2d.c
>>  F: hw/intc/sh_intc.c
>>  F: include/hw/sh4/sh_intc.h
>> @@ -1395,6 +1396,7 @@ Shix
>>  M: Yoshinori Sato <ysato@users.sourceforge.jp>
>>  R: Magnus Damm <magnus.damm@gmail.com>
>>  S: Odd Fixes
>> +F: hw/char/sh_serial.c
>>  F: hw/sh4/shix.c
>>  F: hw/intc/sh_intc.c
>>  F: include/hw/sh4/sh_intc.h
> 
> I didn't realise you could list a file twice in MAINTAINERS,
> but we I guess we already do for sh_intc.c.

In this case this isn't very useful because both machines
have the same set of maintainers, otherwise it is when a
same (device) section is used by machines maintained by
different persons.

> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Thanks for reviewing this series!

Phil.

