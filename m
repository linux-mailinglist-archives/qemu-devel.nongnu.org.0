Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEE3930102F
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 23:43:39 +0100 (CET)
Received: from localhost ([::1]:45802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l359X-0000hd-2C
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 17:43:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l357d-00088D-Ua
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 17:41:41 -0500
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:36924)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l357c-0007HB-52
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 17:41:41 -0500
Received: by mail-ej1-x630.google.com with SMTP id kg20so9421981ejc.4
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 14:41:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=x5M/ZL+l9jKa8Sm0YHkNIpoXVYZZ9yDq3bIfMvF/Mt0=;
 b=A2mxkzBUnP7odKsWC9djFxDAsg1pyViZ8R1ZRPQmcP1LKAt6w9EWJkGYNuyh4l2HN4
 jr2/J/hzxsOCVyi89+4DH3Up0r1ZoeOLkU59jWYznbamZ7LJOnILY+zTjbPNos8lL7L+
 /Gt73p0fcKyGWGl5OtMkFnnJlVaqh3xZSaVndHEforegPwhNHMDcuiH8DnKuG/FDW07A
 rerow4aAGQ9ySnOaaOfSUww+xqGKWG/Kdu9IswcCNoXbpHahpPh26nOuT1GIVt55z7R2
 HjkKxBvTkwGrcuzLOH/2E6EK3Ur0wr3FjgcZAXifJzDiLo823ZiCdcNO2rfGgJUVAW4O
 otMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:from:to:cc:references:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=x5M/ZL+l9jKa8Sm0YHkNIpoXVYZZ9yDq3bIfMvF/Mt0=;
 b=sZ2Cw95854FxoyxhiNMKTriymoppnAH6keSvj9BgkBPwCQyhBwZry2Rs+oamGs8LBD
 xlY793wvOVDh0OfYkOJ5LoN1vDbXDf94OVbhCDJFEt+IOxZgvhPoGc0Wixx/UhD5Y+yB
 XokSYPGv+GcwGtttNJ8edjumyRrgQNl6ktneMJJInvJUIPS0zIZRClpoyChD1HMun5TY
 U1I5NXQuJnngI6bKzo0eK6cVR1DLD4xMfySpnqv4xfC+mA/ZB8vwvaiRZmgvA2OT/846
 5yUuM0g8qK90hv+uGXTAjXdZADfilyzhLHUoCK/CILy8OBsQmIXTBjM+de5BCI0Mzysk
 AjWw==
X-Gm-Message-State: AOAM530oOXYPtNm4a9Y2xH+9/fT1Z0ojP1s2lH0k43UIBqavr2rQUrHX
 dMtu5nT2u+/1sm+inBrhxwc=
X-Google-Smtp-Source: ABdhPJxKzhFO8R3DkOiCw05t2IegcmG12V/FHixL/2/We94pGjyxMWR/5QFqZAyMuhF13H9mwx80uw==
X-Received: by 2002:a17:907:948d:: with SMTP id
 dm13mr61370ejc.545.1611355298715; 
 Fri, 22 Jan 2021 14:41:38 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id dh14sm6168040edb.11.2021.01.22.14.41.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Jan 2021 14:41:38 -0800 (PST)
Subject: Re: [PATCH v7 34/35] Hexagon build infrastructure
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
References: <1611113349-24906-1-git-send-email-tsimpson@quicinc.com>
 <1611113349-24906-35-git-send-email-tsimpson@quicinc.com>
 <0cd4a077-9358-4216-1dd2-d7212f5d082f@amsat.org>
Message-ID: <a7ae2794-c445-f550-dd42-5f6456aa640b@amsat.org>
Date: Fri, 22 Jan 2021 23:41:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <0cd4a077-9358-4216-1dd2-d7212f5d082f@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x630.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.221,
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
Cc: ale@rev.ng, richard.henderson@linaro.org, alex.bennee@linaro.org,
 laurent@vivier.eu, bcain@quicinc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/22/21 11:34 PM, Philippe Mathieu-Daudé wrote:
> On 1/20/21 4:29 AM, Taylor Simpson wrote:
>> Add file to default-configs
>> Add hexagon to meson.build
>> Add hexagon to target/meson.build
>> Add target/hexagon/meson.build
>> Change scripts/qemu-binfmt-conf.sh
>>
>> We can build a hexagon-linux-user target and run programs on the Hexagon
>> scalar core.  With hexagon-linux-clang installed, "make check-tcg" will
>> pass.
>>
>> Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
>> ---
>>  default-configs/targets/hexagon-linux-user.mak |   1 +
>>  meson.build                                    |   1 +
>>  scripts/qemu-binfmt-conf.sh                    |   6 +-
>>  target/hexagon/meson.build                     | 187 +++++++++++++++++++++++++
>>  target/meson.build                             |   1 +
>>  5 files changed, 195 insertions(+), 1 deletion(-)
>>  create mode 100644 default-configs/targets/hexagon-linux-user.mak
>>  create mode 100644 target/hexagon/meson.build
> ...
> 
>> +++ b/target/hexagon/meson.build
>> @@ -0,0 +1,187 @@
>> +##
>> +##  Copyright(c) 2020-2021 Qualcomm Innovation Center, Inc. All Rights Reserved.
>> +##
>> +##  This program is free software; you can redistribute it and/or modify
>> +##  it under the terms of the GNU General Public License as published by
>> +##  the Free Software Foundation; either version 2 of the License, or
>> +##  (at your option) any later version.
>> +##
>> +##  This program is distributed in the hope that it will be useful,
>> +##  but WITHOUT ANY WARRANTY; without even the implied warranty of
>> +##  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> +##  GNU General Public License for more details.
>> +##
>> +##  You should have received a copy of the GNU General Public License
>> +##  along with this program; if not, see <http://www.gnu.org/licenses/>.
>> +##
>> +
>> +hexagon_ss = ss.source_set()
>> +
>> +prog_python = import('python').find_installation('python3')
>> +
>> +hex_common_py = 'hex_common.py'
>> +attribs_def_h = meson.current_source_dir() / 'attribs_def.h'
>> +gen_tcg_h = meson.current_source_dir() / 'gen_tcg.h'
>> +
>> +#
>> +#  Step 1
>> +#  We use a C program to create semantics_generated.pyinc
>> +#
>> +gen_semantics = executable('gen_semantics', 'gen_semantics.c')
>> +
>> +semantics = custom_target(
>> +    'semantics_generated.pyinc',
>> +    output: 'semantics_generated.pyinc',
>> +    input: gen_semantics,
>> +    command: ['@INPUT@', '@OUTPUT@'],
>> +)
>> +hexagon_ss.add(semantics)
> 
> Is something missing here?
> 
> $ make -j8
> [316/1048] Generating semantics_generated.pyinc with a custom command
> FAILED: target/hexagon/semantics_generated.pyinc
> target/hexagon/gen_semantics target/hexagon/semantics_generated.pyinc
> /bin/sh: 1: target/hexagon/gen_semantics: not found
> ninja: build stopped: subcommand failed.
> 
> $ make target/hexagon/semantics_generated.pyinc V=1
> /usr/bin/ninja -v   -j1  target/hexagon/semantics_generated.pyinc | cat
> [1/1] target/hexagon/gen_semantics target/hexagon/semantics_generated.pyinc
> FAILED: target/hexagon/semantics_generated.pyinc
> target/hexagon/gen_semantics target/hexagon/semantics_generated.pyinc
> /bin/sh: 1: target/hexagon/gen_semantics: not found
> ninja: build stopped: subcommand failed.
> make: *** [Makefile:172: run-ninja] Error 1
> 
> OK, I'm cross-compiling, target/hexagon/gen_semantics has been generated
> but with as target, and we want it linked for the host...

So I compiled it manually using:

$ gcc -o target/hexagon/gen_semantics
~/source/qemu/target/hexagon/gen_semantics.c

Then same story:

[14/68] Generating iset.py with a custom command
FAILED: target/hexagon/iset.py
target/hexagon/gen_dectree_import target/hexagon/iset.py
/bin/sh: 1: target/hexagon/gen_dectree_import: not found
ninja: build stopped: subcommand failed.

$ gcc -o target/hexagon/gen_dectree_import
~/source/qemu/target/hexagon/gen_dectree_import.c
target/hexagon/gen_dectree_import.c:24:10: fatal error: qemu/osdep.h: No
such file or directory
 #include "qemu/osdep.h"
          ^~~~~~~~~~~~~~

It is late here, so enough testing for today. TBC ;)

BTW you should test your branch on gitlab-ci, I'm pretty sure
various jobs fail.

Regards,

Phil.

