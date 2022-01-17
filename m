Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C53A49111C
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 21:44:31 +0100 (CET)
Received: from localhost ([::1]:35106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9Yre-0005F9-3K
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 15:44:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n9Ypl-0003xL-Nu; Mon, 17 Jan 2022 15:42:33 -0500
Received: from [2607:f8b0:4864:20::1035] (port=44637
 helo=mail-pj1-x1035.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n9Ype-0006j5-JL; Mon, 17 Jan 2022 15:42:29 -0500
Received: by mail-pj1-x1035.google.com with SMTP id
 l6-20020a17090a4d4600b001b44bb75a8bso811481pjh.3; 
 Mon, 17 Jan 2022 12:42:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/kPUvwAFvMNsCCQ4O2hlMAklvsBHQ0VDsRiUWvV478g=;
 b=Qzs69NTb0bnWKdIEOpINsxOrR+FnxH53GsJ/itu3/G0joC6u0dO9rETH57E6f+3w4f
 Ge6zBuoJQ+86VS1L9Q3sVZKtnMmNjYuGYka75vjElLqoR+kDoJ3LPZPGZj5e2+46ULzX
 qTq1lQcqWNDwWmboeKQicSy1f4LFtejO+3EwFHM7PT5PwhcXtnQaIP95ddgqvNMNWPpk
 Vu1XcLKTqKj5dyG2whKLG1Bd6+v+CD4wON9Xocw1pNYdSMuuInU958QFJh+OQLXjI4Dw
 3M6pNO7n9fDqv8sZ08s28X9E6/gs8p00gBidvkQMGEgEPXkNjD0lFJzOVyEv9EVmqoSI
 iZhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/kPUvwAFvMNsCCQ4O2hlMAklvsBHQ0VDsRiUWvV478g=;
 b=5hdPx9c5CTtQDBt7pn+o8WxVt4Aho4yr0GQ2WjUpZPqX2703A0+PtI8dNe68W8yKj9
 9SjtqzW37ZhAgFI9zgTv8N88xPmfW3ijEfbgiowYDJ62gX6rtVkTqDNUdpe+09VLSVji
 RFw6IpsxpnrgDhMmc6CfN1k+y6jVVwqdBCr3zXu3En/NjRBYaaMN+LCFjb0DS2hWfyJf
 RC35g/2afGawMI/udirfdAAZx0adgG5DB6wj73T7c+Oi83ZMUuat+FLkGx8DG3C5xB+a
 Fh3gk+6optKrafuX18lpGqzy632g42IYnSla7cDVpfOVJB5zBYDg/CzpzdZjAl51P8IC
 6sPA==
X-Gm-Message-State: AOAM5332dnWSnOVrdyQcrh/qaJKdjk7GKkc6G5W1VicbSqMV1dY4PbK6
 W3gRzgrU4S7m+kZ+Nux9BsQ=
X-Google-Smtp-Source: ABdhPJzTRLBprAQ6L6E4ei1A83AvqI4Yu0buA5W6KsPgkYzXDGAw643FXLeUjJHCo84ZAvd4Ai8OYw==
X-Received: by 2002:a17:903:110d:b0:149:a908:16a2 with SMTP id
 n13-20020a170903110d00b00149a90816a2mr23909194plh.77.1642452143825; 
 Mon, 17 Jan 2022 12:42:23 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id 65sm14651557pfw.70.2022.01.17.12.42.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jan 2022 12:42:23 -0800 (PST)
Message-ID: <dadd3528-4cf1-9249-f741-74a6e2fbdfee@amsat.org>
Date: Mon, 17 Jan 2022 21:42:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.0
Subject: Re: [PATCH RESEND] tests/avocado: ppc: Add smoke tests for MPC7400
 and MPC7450 families
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>,
 Fabiano Rosas <farosas@linux.ibm.com>, qemu-devel@nongnu.org
Cc: mark.cave-ayland@ilande.co.uk, qemu-ppc@nongnu.org, clg@kaod.org
References: <20220117144757.782441-1-farosas@linux.ibm.com>
 <e83875f1-70bd-2a5b-ba4e-39baa4cc3c6e@gmail.com>
In-Reply-To: <e83875f1-70bd-2a5b-ba4e-39baa4cc3c6e@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1035
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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

On 17/1/22 21:08, Daniel Henrique Barboza wrote:
> On 1/17/22 11:47, Fabiano Rosas wrote:
>> These tests ensure that our emulation for these cpus is not completely
>> broken and we can at least run OpenBIOS on them.
>>
>> $ make check-avocado AVOCADO_TESTS=../tests/avocado/ppc_74xx.py
>>
>> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
>> Reviewed-by: Willian Rampazzo <willianr@redhat.com>
>> ---
>> ---
>>   tests/avocado/ppc_74xx.py | 123 ++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 123 insertions(+)
>>   create mode 100644 tests/avocado/ppc_74xx.py
>>
>> diff --git a/tests/avocado/ppc_74xx.py b/tests/avocado/ppc_74xx.py
>> new file mode 100644
>> index 0000000000..556a9a7da9
>> --- /dev/null
>> +++ b/tests/avocado/ppc_74xx.py
>> @@ -0,0 +1,123 @@
>> +# Smoke tests for 74xx cpus (aka G4).
>> +#
>> +# Copyright (c) 2021, IBM Corp.
> 
> 
> Not sure if the copyright year must be changed to 2022 (the year that 
> this is going to
> be published) or 2021 (the year that it was developed). GNU docs isn't 
> clear about
> it. Our COPYING file is also not clear about whether we should put the 
> code creation
> or code publishing year in this header.
> 
> I don't mind leaving it as 2021. I'm just curious about what is the 
> semantics involved
> here.

I think I read once "the date it was first published on the list", but
I am not sure and certainly IANAL ;)

