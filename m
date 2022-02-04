Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF0B4A95A0
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 09:52:43 +0100 (CET)
Received: from localhost ([::1]:40748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFuKg-0000pp-6j
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 03:52:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nFtOH-0003wQ-Ix
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 02:52:21 -0500
Received: from [2607:f8b0:4864:20::631] (port=37765
 helo=mail-pl1-x631.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nFtO5-00080B-Lb
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 02:52:21 -0500
Received: by mail-pl1-x631.google.com with SMTP id j16so4468158plx.4
 for <qemu-devel@nongnu.org>; Thu, 03 Feb 2022 23:51:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=xlRTmuNYjo0cLa1IasSU8GrBx+h05c3UqmTknsbAtVo=;
 b=oB3FTPail2+TaMy/XtALK1eh+FgX+3waCi8pyCLGzqB8NeKOxilqVSmM/989gCjwN1
 n2lX1rSSQsqITeRzBokbULHNOVxIcAq6BuJBKBdAMVinJ3SC39pq2QmWRonjYWASVXPT
 byr6BbpxoJd7fo7N4Mh1WFcvSl5A2hPVE1Ell/L8E6g60QJFEi03MJj9ZVXyVZrOgLnU
 61y8Uol5Ir40RMFpPG7CzYy0moM6du1kVhtc1xeLOF85yNZ5Zi5a9dGs53iBfl4Yqm1B
 CmXxfrfsu4AGwPNdFb3ZecJmPNqKR/bCSzf1hO8zrJjI1vTM5wUz0RFKUN1icRsCIBQF
 1QUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=xlRTmuNYjo0cLa1IasSU8GrBx+h05c3UqmTknsbAtVo=;
 b=VCgADE8RnCctBx6VszIItQ7MUErQoBFH1OtT7oe/jUuMrMMK7bU2uaAWqDsEll6nrE
 QmKWjFLpgyZn+HtHhUZ3QFielaEYGj5rp6Gn/RcVkcNrANFC2GbfmErZic1QUHMF8FKD
 fY1NJ3Zj0NNV4VcXX/UR4rVnItvsdQbIDTylv4JzKlIGmN78qWoDcx4dPT+/smur8JCM
 RVS0GofPDBbFEWpN+zygT9JcKU4vCYGuLTM7Li+OhF6WZNjPLoaPuVWNZU+j+pz6Xw4L
 YSPGa7Ey0YClExwRluD0VX8xdpewHl0+b4IqOUaXXwCChO9kVsIQNaEuuBHnVNDZnzmE
 qzDA==
X-Gm-Message-State: AOAM530wUXnFlC1Xgt1R9WOb4U21iwpoeKaJb5kwqw93oyDNdBqVh5hx
 +9GyfDD2XZicGC28PZ5QfMw=
X-Google-Smtp-Source: ABdhPJzKm277E+g+wE5BrWUZyWpfhRXH0hFlk31Q3jyh2UnWgCa9MU5o7EHnPSEZ4i4hdgmsgGZDPg==
X-Received: by 2002:a17:903:22ce:: with SMTP id
 y14mr1787525plg.37.1643961104150; 
 Thu, 03 Feb 2022 23:51:44 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id m1sm1556387pfk.202.2022.02.03.23.51.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Feb 2022 23:51:43 -0800 (PST)
Message-ID: <bf89f8c1-5f22-4941-0266-5f58b1ff93c9@amsat.org>
Date: Fri, 4 Feb 2022 08:51:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH v2 02/21] accel/meson: Only build hw virtualization with
 system emulation
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20220203191814.45023-1-f4bug@amsat.org>
 <20220203191814.45023-3-f4bug@amsat.org>
 <f94843c9-c8f0-d78d-5e6e-a289d8bcb6a8@redhat.com>
In-Reply-To: <f94843c9-c8f0-d78d-5e6e-a289d8bcb6a8@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::631
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x631.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On 4/2/22 08:37, Thomas Huth wrote:
> On 03/02/2022 20.17, Philippe Mathieu-Daudé wrote:
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>   accel/meson.build | 12 +++++++-----
>>   1 file changed, 7 insertions(+), 5 deletions(-)
>>
>> diff --git a/accel/meson.build b/accel/meson.build
>> index dfd808d2c8..b9a963cf80 100644
>> --- a/accel/meson.build
>> +++ b/accel/meson.build
>> @@ -2,12 +2,14 @@ specific_ss.add(files('accel-common.c'))
>>   softmmu_ss.add(files('accel-softmmu.c'))
>>   user_ss.add(files('accel-user.c'))
>> -subdir('hvf')
>> -subdir('qtest')
>> -subdir('kvm')
>>   subdir('tcg')
>> -subdir('xen')
>> -subdir('stubs')
>> +if have_system
>> +  subdir('hvf')
>> +  subdir('qtest')
>> +  subdir('kvm')
>> +  subdir('xen')
>> +  subdir('stubs')
> 
> Doesn't this render your first patch useless?

No, we don't want to build non-TCG stubs in user-mode ;)

>> +endif
>>   dummy_ss = ss.source_set()
>>   dummy_ss.add(files(
> 
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> 


