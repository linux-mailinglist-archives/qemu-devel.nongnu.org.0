Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96025546812
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 16:10:36 +0200 (CEST)
Received: from localhost ([::1]:45210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzfLP-0001A2-Nb
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 10:10:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nzfK4-0007oD-Nj
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 10:09:12 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:37735)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nzfK1-0006F1-KO
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 10:09:12 -0400
Received: by mail-pl1-x632.google.com with SMTP id t2so22868698pld.4
 for <qemu-devel@nongnu.org>; Fri, 10 Jun 2022 07:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=5SVETgwxi2q9x/TBbRQ0K3cD6+rTN/mzFU1fWfj9O98=;
 b=ZTezguAsPzuGyOU6Q5C0l40L5uNUPu3LDtpxn9+WdBe4PwhaPmWYDAVFPs5BTRAfg7
 2midlwpE/UmtX/oXUzyIZqKIkbvxvWXNJdf/sd+b3lC5UvXKoiDWwUls/zIt2XweIb/P
 fQHh2dQUTC5q82z1LFttSrlXtcbUfzFqQoyNKERxdREcqVn+HyDr5Yab8eYMHE7N4c/f
 MalQdJUUadsYun4RRJko1wtbRsXUpn3/qVyPvTCSPMnd15RRM2KpCE8VgwrW0fVyv8M+
 812yUWgzPcyrfwuBq7gSNgb8W3+hz/vAv96puEonzu8nmZdTnn0woCRkW+QBIX+mLPez
 IrlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=5SVETgwxi2q9x/TBbRQ0K3cD6+rTN/mzFU1fWfj9O98=;
 b=EAFHP53C/5jmxF3bTbgk04/KLciX8DAZl3I+kh2gfWKg08Bc/GOXZv78thHkP48Y7X
 YDUyEUkzKc0b55Z4gN4C0SsuaS9omORI3YIeYXK/tJ4p9M+TZeSDVTmUbGtdmt9SJOCj
 Xrj2d5ijjPkad+Qsj/aTCUwdc1AUgis4RNI825k9MbQWproSIdgnsfnke3vMuKoxHLMS
 G30mhPvJ0KM9sJ7N/w+/mtv/Cq2k3SJGLiWGa8UafGT9ptm2A2ncGGVEB3WKClxfaI1v
 wSwP3WsViM6sg2ckZJGPdk++FiaAPucvZiNs+0GxCIRf59cvDUYlB7sRhG814ga2CLZP
 3VaA==
X-Gm-Message-State: AOAM532mIdTtSjoh9UPqCfDXx9HBT+a9WOtlprK3EbeS4uY61LfphUd1
 1q021TlaqeFYhAiYQyTtYAQ=
X-Google-Smtp-Source: ABdhPJyF2UlNg939IkVZLk0C6cIgbXUqdPje7sLegqBw8RsUZRAqJd7oMSPLcNyxA2JAvK7pW0oN7Q==
X-Received: by 2002:a17:90a:e642:b0:1e3:524e:4cb with SMTP id
 ep2-20020a17090ae64200b001e3524e04cbmr9048334pjb.114.1654870148163; 
 Fri, 10 Jun 2022 07:09:08 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 a1-20020a056a001d0100b00518950bfc82sm19451437pfx.10.2022.06.10.07.09.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jun 2022 07:09:07 -0700 (PDT)
Message-ID: <066e1d3e-d35a-662a-21bf-bbd362636cc0@amsat.org>
Date: Fri, 10 Jun 2022 16:09:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [PATCH 7/7] target/mips: Undeprecate nanoMips ISA support in QEMU
Content-Language: en-US
To: Stefan Pejic <stefan.pejic@syrmia.com>, qemu-devel@nongnu.org,
 Vince Del Vecchio <Vince.DelVecchio@mediatek.com>
Cc: ot_stefan.pejic@mediatek.com, ot_dragan.mladjenovic@mediatek.com,
 Richard Henderson <richard.henderson@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Jiaxun Yang <jiaxun.yang@flygoat.com>
References: <20220504110403.613168-1-stefan.pejic@syrmia.com>
 <20220504110403.613168-8-stefan.pejic@syrmia.com>
 <10b8d473-c299-8070-e8d4-3d41b67af467@amsat.org>
In-Reply-To: <10b8d473-c299-8070-e8d4-3d41b67af467@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x632.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

Cc'ing Vince.

On 31/5/22 15:14, Philippe Mathieu-Daudé wrote:
> Hi Stefan,
> 
> On 4/5/22 13:04, Stefan Pejic wrote:
>> nanoMips ISA support in QEMU is actively used by MediaTek and is
>> planned to be maintained and potentially extended by MediaTek in
>> future.
>>
>> Un-orphan nanoMips ISA support in QEMU by setting a mainainer from
>> MediaTek and remove deprecation notes from documentation as well.
>>
>> Signed-off-by: Stefan Pejic <stefan.pejic@syrmia.com>
>> ---
>>   MAINTAINERS               |  3 ++-
>>   docs/about/deprecated.rst | 26 --------------------------
>>   2 files changed, 2 insertions(+), 27 deletions(-)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 294c88ace9..f1e0dee8a2 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -240,7 +240,8 @@ F: docs/system/cpu-models-mips.rst.inc
>>   F: tests/tcg/mips/
>>   MIPS TCG CPUs (nanoMIPS ISA)
>> -S: Orphan
>> +M: Stefan Pejic <stefan.pejic@syrmia.com>
>> +S: Maintained
>>   F: disas/nanomips.*
>>   F: target/mips/tcg/*nanomips*
>> diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
>> index 896e5a97ab..4b0868886f 100644
>> --- a/docs/about/deprecated.rst
>> +++ b/docs/about/deprecated.rst
>> @@ -276,13 +276,6 @@ System emulator CPUS
>>   ``Icelake-Client`` CPU Models are deprecated. Use ``Icelake-Server`` 
>> CPU
>>   Models instead.
>> -MIPS ``I7200`` CPU Model (since 5.2)
>> -''''''''''''''''''''''''''''''''''''
>> -
>> -The ``I7200`` guest CPU relies on the nanoMIPS ISA, which is deprecated
>> -(the ISA has never been upstreamed to a compiler toolchain). Therefore
>> -this CPU is also deprecated.
>> -
>>   QEMU API (QAPI) events
>>   ----------------------
>> @@ -382,16 +375,6 @@ The above, converted to the current supported 
>> format::
>>     json:{"file.driver":"rbd", "file.pool":"rbd", "file.image":"name"}
>> -linux-user mode CPUs
>> ---------------------
>> -
>> -MIPS ``I7200`` CPU (since 5.2)
>> -''''''''''''''''''''''''''''''
>> -
>> -The ``I7200`` guest CPU relies on the nanoMIPS ISA, which is deprecated
>> -(the ISA has never been upstreamed to a compiler toolchain). Therefore
>> -this CPU is also deprecated.
> 
> Thanks for contributing all these fixes! I'm glad to see this code used
> and soon maintained again. Last time I tried to run a user-mode binary
> it wasn't loading due to incomplete nanoMIPS ABI support. What kind of
> tests are you running? Would it be possible to contributing them, to 
> avoid code bitrotting?
> 
> Thanks,
> 
> Phil.


