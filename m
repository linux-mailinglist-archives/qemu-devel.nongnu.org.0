Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C17AC3027B3
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 17:23:46 +0100 (CET)
Received: from localhost ([::1]:50862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l44eX-0008JE-Je
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 11:23:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l44c2-0006Sp-IL
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 11:21:14 -0500
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:39788)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l44bx-0007Jk-1u
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 11:21:10 -0500
Received: by mail-ed1-x52f.google.com with SMTP id b21so16080485edy.6
 for <qemu-devel@nongnu.org>; Mon, 25 Jan 2021 08:21:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=xU+6cgqAgNJX7nvbGkeOMVZeAcN5pW/RbLzgUvrgmiU=;
 b=cLzJHp6rj3dFjFoEICo3xLD5h/M1OoSX4YMVGt0NpNQxCxEFJawVq7s137V4o2TyPd
 1gsV5nv4No7LYVPtjOoSJRZkro5m5t8anWm3pBcharZFOmOJPzx9xy6dAlEH/nQtBLTg
 sceDp6o174O/n6wT0Yb24otMik8/H9FAN1+p5ufOH/5ufKAvjDY+oSpt+w4/PqJOiIig
 peevoRxO+DFrdcQk9ETksflT5p7NqNBECn7RG5SF+BKX0rkigDBuVjuwD2XZmh/niHIK
 74ApzJjamZgPdPVAbHLGC9JtZY8gN4gK1TQ/7qW942FsSdzK8v6ByM4q1AMCiFuv4LRV
 eRSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xU+6cgqAgNJX7nvbGkeOMVZeAcN5pW/RbLzgUvrgmiU=;
 b=Nr1DRysHIKXKXrx1Dd1No7GHnJwKLyJkRKkdnQf4XqBCrRWU0AVkq604uQnai/Jmnb
 hAcY2CRE0RvX6fQQzc9an4FWR2RkdzKOKVaQFmy9SSx8QUblp8O1Y+DVA/sEjvzHO8xh
 KbfACRM2INbpJikgxepVZ6N5rx82xa7JOlwxJNU4LFHnnOfuKCgB6tt9IwrJ9d8sOhQX
 +HDIzol5UA1xaG50lCay+O8C7Xjths5i1gZ10sRAa2rGE83vOgzlpwd2VTymT9AyP4RJ
 qONu1aWQW7zvsQP1zqb3+JDRAq3iUZkOEmBFeiXU/nOyfTHTtNOoyhjHeLA07D6LQnKo
 IkbQ==
X-Gm-Message-State: AOAM532UNECdLirqeHUztKnT2Ec1UdQvOtttj+tOcH02Yu+LoLOPugL/
 PxPn7ITpqtu9m5EzS7mJusQ=
X-Google-Smtp-Source: ABdhPJwBHk4Tj+yuKHH4wImLfNbhCWmp/hQd3FPqqXPjW7UN7qm+TA30z1OWNt1adwRDRJblF/E3dw==
X-Received: by 2002:a05:6402:1914:: with SMTP id
 e20mr1115098edz.89.1611591663369; 
 Mon, 25 Jan 2021 08:21:03 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id j27sm3599344ejb.102.2021.01.25.08.21.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Jan 2021 08:21:02 -0800 (PST)
Subject: Re: [PATCH v7 12/35] Hexagon (target/hexagon) instruction attributes
To: Taylor Simpson <tsimpson@quicinc.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <1611113349-24906-1-git-send-email-tsimpson@quicinc.com>
 <1611113349-24906-13-git-send-email-tsimpson@quicinc.com>
 <11960eff-406b-158c-7fae-61b2e0550268@amsat.org>
 <BYAPR02MB48867F2DC90D2A81897C387FDEA09@BYAPR02MB4886.namprd02.prod.outlook.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <55f89e45-c479-e02b-27c6-f2e6a7fb85ed@amsat.org>
Date: Mon, 25 Jan 2021 17:21:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <BYAPR02MB48867F2DC90D2A81897C387FDEA09@BYAPR02MB4886.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: "ale@rev.ng" <ale@rev.ng>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "alex.bennee@linaro.org" <alex.bennee@linaro.org>,
 "laurent@vivier.eu" <laurent@vivier.eu>, Brian Cain <bcain@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/22/21 11:01 PM, Taylor Simpson wrote:
>> -----Original Message-----
>> From: Philippe Mathieu-Daudé <philippe.mathieu.daude@gmail.com> On
>> Behalf Of Philippe Mathieu-Daudé
>> Sent: Friday, January 22, 2021 11:54 AM
>> To: Taylor Simpson <tsimpson@quicinc.com>; qemu-devel@nongnu.org
>> Cc: richard.henderson@linaro.org; alex.bennee@linaro.org;
>> laurent@vivier.eu; ale@rev.ng; Brian Cain <bcain@quicinc.com>
>> Subject: Re: [PATCH v7 12/35] Hexagon (target/hexagon) instruction
>> attributes
>>
>> On 1/20/21 4:28 AM, Taylor Simpson wrote:
>>> Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
>>> ---
>>>  target/hexagon/attribs.h     | 30 ++++++++++++++
>>>  target/hexagon/attribs_def.h | 95
>> ++++++++++++++++++++++++++++++++++++++++++++
>>>  2 files changed, 125 insertions(+)
>>>  create mode 100644 target/hexagon/attribs.h
>>>  create mode 100644 target/hexagon/attribs_def.h
>>>
>>> diff --git a/target/hexagon/attribs.h b/target/hexagon/attribs.h
>>> new file mode 100644
>>> index 0000000..e88e5eb
>>> --- /dev/null
>>> +++ b/target/hexagon/attribs.h
>>> @@ -0,0 +1,30 @@
>>> +
>>> +enum {
>>> +#define DEF_ATTRIB(NAME, ...) A_##NAME,
>>> +#include "attribs_def.h"
>>
>> Per QEMU conventions, this file has to be named "attribs_def.h.inc".
> 
> Didn't know that.  Which files should end in .inc?

Oh you are right, it is not documented in CODING_STYLE.rst.

You can see the rationale in commits:139c1837db7 and 0979ed017f0:

  meson: rename included C source files to .c.inc

  With Makefiles that have automatically generated dependencies, you
  generated includes are set as dependencies of the Makefile, so that they
  are built before everything else and they are available when first
  building the .c files.

  Alternatively you can use a fine-grained dependency, e.g.

          target/arm/translate.o: target/arm/decode-neon-shared.inc.c

  With Meson you have only one choice and it is a third option, namely
  "build at the beginning of the corresponding target"; the way you
  express it is to list the includes in the sources of that target.

  The problem is that Meson decides if something is a source vs. a
  generated include by looking at the extension: '.c', '.cc', '.m', '.C'
  are sources, while everything else is considered an include---including
  '.inc.c'.

  Use '.c.inc' to avoid this, as it is consistent with our other convention
  of using '.rst.inc' for included reStructuredText files.  The editorconfig
  file is adjusted.

> 
>>
>> Otherwise:
>> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> 
> Thanks!!
> 
> 

