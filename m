Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F04F349B28C
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 12:05:32 +0100 (CET)
Received: from localhost ([::1]:48740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCJdk-0001w7-2e
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 06:05:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nCJYA-0007ON-0e
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 05:59:46 -0500
Received: from [2a00:1450:4864:20::32c] (port=52959
 helo=mail-wm1-x32c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nCJY8-0003Ff-3b
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 05:59:45 -0500
Received: by mail-wm1-x32c.google.com with SMTP id v123so25037966wme.2
 for <qemu-devel@nongnu.org>; Tue, 25 Jan 2022 02:59:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=+GCQIcxZI/QTG0Ocn+13ep7pZNWUXmEqCJC5ZU5JDIk=;
 b=T/2+PqhuiUtfSD8rVgptch6BtoW4+7W4Y+BoDD94fAO1wJwAojbcXAeQ8OvQYHloEA
 1NgcRjV3M3GyARN+cafSKswnr3g+Df4Y1fd8+Z5SIDs28js6tdt86XZSSFNoqV66bPvv
 kiBa7VGZR3XCNZJCFcMHuMiq1EEOfBh4JIZ8ZE/0zlSU+6Zi6dHhim2lBl8Kul8PdwZ2
 sMNQkQmdnwrK57jKpnuZzORKcZsqUbvBUGcGRrBAMcT7BgkQOiwDYvebt5W8yCdIOpHd
 ASmH+vAvjmrR7qoISq1ucVvsy7zaG8aO4EDokvocFpBCMcwnSQMgpx045tq/w6Frvuzh
 qc1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=+GCQIcxZI/QTG0Ocn+13ep7pZNWUXmEqCJC5ZU5JDIk=;
 b=pht7kQhRXOo13j/j0FzMw/9NU7fUSe0z2z+Sd2nd4Bowlr8sTQMI5s8jB9D/DMkP8c
 GLEVVUx/TEd4NIAc5MWNgai/63MAAPHCT2y4lEAbsQDnEOKuvZ41sEPapukjU2nTUovh
 duawKJc1pseJVmOR2HaRD8o/AJbaRbXEhR5WHLHYG82qD7NsaQUzOfQTC5u+4I+9FW3O
 dbG/O4zXAjzLKkc3BGShQtDLEaZeI5KYPVkZM2sx6p6wKp33mFhkQ256wqcFrMW2Cbcz
 +6S1rKoI98LhnS4FQSKhgQJun5OMGXb5+BMSzrNidupjW3p+/2wpQOSSK/3NFJheCY6J
 C2Iw==
X-Gm-Message-State: AOAM533wJwueqRKOOZHifOrGg60zR997+5mu0xrt063RIBeoUSLE0207
 GPnZMx/W+gaI+bp3ZoNu0Uc=
X-Google-Smtp-Source: ABdhPJxydha+qvu9M9Qc6Q34xXtYIbjyQPVywEM1BN62zCDmrCuR4Zk6lsr7/OpUXozf2Tonbi/+cA==
X-Received: by 2002:a7b:c042:: with SMTP id u2mr2428199wmc.18.1643108381588;
 Tue, 25 Jan 2022 02:59:41 -0800 (PST)
Received: from [192.168.1.40] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id m12sm791360wrp.61.2022.01.25.02.59.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Jan 2022 02:59:41 -0800 (PST)
Message-ID: <c1dcf128-84e8-a3ce-8b9f-f0a409b34b00@amsat.org>
Date: Tue, 25 Jan 2022 11:59:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v6 0/7] tests: Refresh lcitool submodule & remove libxml2
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, =?UTF-8?Q?C=c3=a9dric_Le_Goate?=
 =?UTF-8?Q?r?= <clg@kaod.org>
Cc: qemu-devel@nongnu.org, Ed Maste <emaste@freebsd.org>,
 Thomas Huth <thuth@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Li-Wen Hsu <lwhsu@freebsd.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Xiang Chen <chenxiang66@hisilicon.com>,
 Jonathan Cameron <Jonathan.Cameron@Huawei.com>,
 Longpeng <longpeng2@huawei.com>, Yifei Jiang <jiangyifei@huawei.com>,
 Alessandro Di Federico <ale@rev.ng>, Vasilev Oleg <vasilev.oleg@huawei.com>,
 Anton Johansson <anjo@rev.ng>, Michael Roth <michael.roth@amd.com>
References: <20220121154134.315047-1-f4bug@amsat.org>
 <87mtjle71g.fsf@linaro.org> <4dc22a36-52da-26fb-bf8e-5e27e91db359@amsat.org>
 <87ee4xdjjp.fsf@linaro.org> <efc5f304-f3d2-ff7b-99a6-673595ff0259@amsat.org>
In-Reply-To: <efc5f304-f3d2-ff7b-99a6-673595ff0259@amsat.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 1/24/22 20:33, Philippe Mathieu-Daudé wrote:
> On 1/24/22 20:16, Alex Bennée wrote:
>>
>> Philippe Mathieu-Daudé <f4bug@amsat.org> writes:
>>
>>> On 1/24/22 11:55, Alex Bennée wrote:
>>>>
>>>> Philippe Mathieu-Daudé <f4bug@amsat.org> writes:
>>>>
>>>>> This is my last respin on this series which is fully reviewed.
>>>>>
>>>> <snip>
>>>>
>>>> Just to note the "b4" application of this broke the From addresses. If
>>>> you see the lore copy:
>>>>
>>>>   https://lore.kernel.org/qemu-devel/20220121154134.315047-1-f4bug@amsat.org/
>>>>
>>>> all your From's are via qemu-devel. Have you changed anything about your
>>>> submission process?
>>>
>>> No. Maybe the list changed something again? Similar problem occurred
>>> 18 months ago IIRC. Not sure what I can do, the domain misses SPF/DKIM:
>>> https://toolbox.googleapps.com/apps/checkmx/check?domain=amsat.org
>>
>> I thought so but others in the archives are fine. I take it you can't ask
>> the owners of amsat.org to expand the SPF setting or use the MX server
>> indicated to send emails?
>>
>> Otherwise it might be worth either getting your own gmail or domain for
>> posting.
> 
> =)
> 
> I'm seeing the same with Mark's email: Mark Cave-Ayland via
> <openbios-bounces@openbios.org> maybe Google is running a global SMTP purge?
> 
> Similar SPF/DKIM errors:
> https://toolbox.googleapps.com/apps/checkmx/check?domain=ilande.co.uk
> 
>>
>>>
>>> If it helps you can get them on my branch macos12:
>>> https://gitlab.com/philmd/qemu/-/compare/5e9d14f2...36d00943e?from_project_id=6939745
>>
>> I nabbed it with my old-school patch handling which still works but
>> doesn't auto collect tags for me ;-)

I'm seeing the same issue with these domains since mid december:

- amd.com
- huawei.com
- hisilicon.com
- ilande.co.uk
- amsat.org
- rev.ng

https://lore.kernel.org/qemu-devel/20220124104450.152481-1-ross.lagerwall@citrix.com/
https://lore.kernel.org/qemu-devel/1643102134-15506-1-git-send-email-chenxiang66@hisilicon.com/
https://lore.kernel.org/qemu-devel/20220124105245.00006aa1@Huawei.com/
https://lore.kernel.org/qemu-devel/20220105185720.0d4fc159@orange/
https://lore.kernel.org/qemu-devel/20211220234146.s7pq5gu6yxhtub3r@amd.com/

