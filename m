Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C273A394C3F
	for <lists+qemu-devel@lfdr.de>; Sat, 29 May 2021 14:43:22 +0200 (CEST)
Received: from localhost ([::1]:50030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmyJF-0006Kt-Ln
	for lists+qemu-devel@lfdr.de; Sat, 29 May 2021 08:43:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lmyHl-0005ev-BZ
 for qemu-devel@nongnu.org; Sat, 29 May 2021 08:41:49 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:46063)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lmyHi-0002dn-Rb
 for qemu-devel@nongnu.org; Sat, 29 May 2021 08:41:48 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 s5-20020a7bc0c50000b0290147d0c21c51so3814548wmh.4
 for <qemu-devel@nongnu.org>; Sat, 29 May 2021 05:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=UXBFkkMWFRzhIXLWMrh3Xq6K/LdmmdYnhnW8voCEKpg=;
 b=uF5GQbVLPZ6c92iOgYaTO3bTULY+TgOVIrq/LVjwO395UaS1vuOB/XtcRhX4/a7JXC
 IUTcYRI0NK0RHa456SXt0HLwibx1UD3TRYKmgu+zbonAOH8D0rsjcMuSzwNP7BZFY8sm
 +BlOMD/9CUEGyP3ZNaMx6UAMwSM4Dibn1+r/6MJK3Dfjqi1Vj7z2rDC1tHAaB6sHKhKt
 eA4hM1Q5/xWLQcJ7P4HW6opJxHhGTECV6hFezHAqFPUIeLGl83kLtWvKlcfMjKdN4cRb
 JSwH/psw+oGjRna52K3GEnUnIhbri/UUoNnKdE1MQ2q5w0jxmCS+cz6ZSoOBqmV0yWAC
 z6eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UXBFkkMWFRzhIXLWMrh3Xq6K/LdmmdYnhnW8voCEKpg=;
 b=XEuUj8LDFwjs5DlUt40VntgYrFt9XfoL1lrqseDzP57mn5+ZoVBNK/zMXeq/CCsHaO
 5quiYgBdOPc/S4mrfB9ttmC8BbgesXUooaghfAWtN1GLNPBP21f5OVNr0nfjCX54cXVl
 Kc/LdJCO7ocHqVfIvDfM89ptEjb3WEyrUvzpzCO/qocf5Lqr1H4SRv+3XJp8S6LTxdBo
 7uGmrTqGGI5pYWXYIdfZdlq9PIrnr0qx5u6pJWlBCsl6D5iRzn+EWtnli8O5/NQ7XPqm
 LXmX866Biaao92hFdtW5pi7Hf1Y84cukvSc6MiLcqgujXB3JQZa99PDG8+LaZRX/3ldq
 twgg==
X-Gm-Message-State: AOAM530DHQLO9enRdk0WaiwB5gPJDfLkLF1b+LtJDJu1LTma6CNmEXZ/
 30OEh/M1OB59qBk3o8z1kR8=
X-Google-Smtp-Source: ABdhPJxgOxtJIhcnD+eWB5L9CGXCiXeVaL8cPec8+4CQzgFCXOmqwdXkaupiy7IYysiDkKCQWDJQ/w==
X-Received: by 2002:a7b:c114:: with SMTP id w20mr18528987wmi.45.1622292104417; 
 Sat, 29 May 2021 05:41:44 -0700 (PDT)
Received: from [192.168.1.36] (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id v15sm17253260wmj.39.2021.05.29.05.41.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 29 May 2021 05:41:43 -0700 (PDT)
Subject: Re: [Qemu-devel] [PATCH v4 0/3] tests: Reorganize MIPS TCG
 directories and files
To: Aleksandar Rikalo <Aleksandar.Rikalo@syrmia.com>,
 Aleksandar Markovic <aleksandar.markovic@rt-rk.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Vince Del Vecchio <Vince.DelVecchio@mediatek.com>
References: <1548343154-8774-1-git-send-email-aleksandar.markovic@rt-rk.com>
 <DM5PR22MB16585EFE36FC0584D37F3724D29A0@DM5PR22MB1658.namprd22.prod.outlook.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <e5ca03fc-c412-9ad1-0d45-ee36dff9e4ca@amsat.org>
Date: Sat, 29 May 2021 14:41:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <DM5PR22MB16585EFE36FC0584D37F3724D29A0@DM5PR22MB1658.namprd22.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Petar Jovanovic <petar.jovanovic@syrmia.com>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 "aurelien@aurel32.net" <aurelien@aurel32.net>,
 Filip Vidojevic <Filip.Vidojevic@syrmia.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Aleksandar Rikalo,

On 1/24/19 4:37 PM, Aleksandar Rikalo wrote:
>> From: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
>> Sent: Thursday, January 24, 2019 4:19 PM
>> To: qemu-devel@nongnu.org
>> Cc: aurelien@aurel32.net; Aleksandar Markovic; Aleksandar Rikalo
>> Subject: [PATCH v4 0/3] tests: Reorganize MIPS TCG directories and files
>>
>> From: Aleksandar Markovic <amarkovic@wavecomp.com>
>>
>> Reorganize MIPS TCG directories and files.
>>
>> Directories for DSP tests in system mode are deleted. They
>> introduce more complexity in test structure compared to the
>> value they add. Still, these tests may be moved somewhere
>> else, let's say in a new acceptance test that will boot
>> "mips64r2" virtual machine.
>>
>> All remaining test will are user mode tests, which will
>> simplify maintenance of mips tcg tests overall.
>>
>> The file movement is done using "git mv" command, so "git
>> blame" will still display the original information, regardless
>> of the new names and locations of involved files. Also, the
>> command "git config diff.renames true" was used to keep the
>> size of movement patches reasonable.
>>
>> v3->v4:
>>   - DSP ASE system mode tests given up
>>   - Makefiles provided for tests that remain
>>
>> v2->v3:
>>   - corrected missing "v2" that caused wrong message linking
>>     (the version is now "v3", of course)
>>
>> v1->v2:
>>   - used "git config diff.renames true" before sending
>>   - rebased to the latest code (included newly added r5900 tests)
>>
>>
>> Aleksandar Markovic (3):
>>   tests: tcg: mips: Move source files to new locations
>>   tests: tcg: mips: Add two new Makefiles
>>   tests: tcg: mips: Remove old directories
> 
> I too think that this will simplify the test dirs structure and
> maintenance. I cannot wait to see these directories populated with
> new tests for various MIPS ISAs and ASEs.
> 
> For all patches in this series:
> 
> Reviewed-by: Aleksandar Rikalo <arikalo@wavecomp.com>

Apparently this series was a bit too enthusiastic and removed
many tests (MIPS64 DSP r1 and r2 for example) which then got
never reintroduced. What is your plan regarding the "new
tests" you mentioned?

Thanks,

Phil.

