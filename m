Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 368F448ED72
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 16:53:03 +0100 (CET)
Received: from localhost ([::1]:54850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8Osv-0007Uj-B3
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 10:53:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n8OcD-0005SR-L9
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 10:35:45 -0500
Received: from [2607:f8b0:4864:20::636] (port=34315
 helo=mail-pl1-x636.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n8Oc7-0000PP-LP
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 10:35:41 -0500
Received: by mail-pl1-x636.google.com with SMTP id a7so10833653plh.1
 for <qemu-devel@nongnu.org>; Fri, 14 Jan 2022 07:35:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=jFvz1mZiSSBKbqDFZi+a0UcyAN07kAMki2j6juPveQc=;
 b=ZL2cGhcICJ+bMMvxGT8JJJS5Pz2IlsFPDbV/H3YxY8Ke8c9EX2MFLAw4vOw4ZPiDkg
 32yTRQgaKkV76XIxMs9Fe7RMUDvp8FYlrqahfqswNfeCIzMTVdvEpQ9RTRPBC/KkKAcY
 derENzm7M1XzzQw9Q+VAdwrsOY+Q6e+K/gb2DE4mlqYsoVtdHBgpvivXxIedw2gJz1jN
 R51Yn1AFXrOVxPMaBwj808I2HjTeayhksKEAWyKseok/e7YoV41umqqZ/+O4OUqBpNnt
 K2w/0OFj0PkZXoV1Sg1BTXoUGRzdzHOvvXFf8PgfJNj5HdvfOAa4KfzmfmntngkkAoRh
 QBwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=jFvz1mZiSSBKbqDFZi+a0UcyAN07kAMki2j6juPveQc=;
 b=T+pekSqat0S7boSyMGK90SpTJtaEwJgBp7JUsseeL3iYZMCwt2oTGn+e5UA7fRv/O9
 flly3kDGP4t86hKRjCdGRdFJN2So0vNDoRiTXlpdId2J+T9DwH23RaDty6gde3q6N16y
 /zaRScADIADkqJ/LfaBwQpdOZUIEfk9tT6C8tXvcD820xs/jUXqF9/xchX6kE2MTV2+Y
 lTRkZmbNZp/IuP+HcbIVUUrujPSP+4HrSBhQ3roTaqs5fWOnAVLtijqd0XaGe4hbBh4a
 qn2bs4g4GkD3E1s4NKy+kFB1cIopNdCEJqWOFYcVB35l/BXzKgcpXfn8i93YR3clG4bj
 6/sA==
X-Gm-Message-State: AOAM530olKTTIHIAf0g26o/RLFQ5tBKDTItYGW7kaz23l5bF41gb2dk2
 7czm3ewmc8gRMefkrqH3jC4=
X-Google-Smtp-Source: ABdhPJyevjDb8E3A9xkyYmvMxQmIFYhLAcpCpARMiBkp91olBqO2UwE6TBm+14KaBU6sTfwaj4e2Cg==
X-Received: by 2002:a17:90a:a105:: with SMTP id
 s5mr11276079pjp.170.1642174538243; 
 Fri, 14 Jan 2022 07:35:38 -0800 (PST)
Received: from ?IPV6:2a01:e34:ec40:49e0:48b5:8fce:b44b:d951?
 ([2a01:e34:ec40:49e0:48b5:8fce:b44b:d951])
 by smtp.gmail.com with ESMTPSA id x2sm4901867pgo.2.2022.01.14.07.35.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Jan 2022 07:35:37 -0800 (PST)
Message-ID: <bf9fa13d-f57f-9e0e-3b18-4ed285640a22@amsat.org>
Date: Fri, 14 Jan 2022 16:35:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.0
Subject: Re: [PATCH v2 2/3] migration: Add canary to VMSTATE_END_OF_LIST
Content-Language: en-US
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>,
 qemu-devel@nongnu.org, peter.maydell@linaro.org, quintela@redhat.com,
 marcandre.lureau@gmail.com
Cc: lsoaresp@redhat.com, peterx@redhat.com
References: <20220113194452.254011-1-dgilbert@redhat.com>
 <20220113194452.254011-3-dgilbert@redhat.com>
 <5995c5df-435e-01cf-150c-8e06098e18c2@amsat.org>
In-Reply-To: <5995c5df-435e-01cf-150c-8e06098e18c2@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::636
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x636.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
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

On 14/1/22 12:32, Philippe Mathieu-Daudé wrote:
> On 13/1/22 20:44, Dr. David Alan Gilbert (git) wrote:
>> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>>
>> We fairly regularly forget VMSTATE_END_OF_LIST markers off descriptions;
>> given that the current check is only for ->name being NULL, sometimes
>> we get unlucky and the code apparently works and no one spots the error.
>>
>> Explicitly add a flag, VMS_END that should be set, and assert it is
>> set during the traversal.
>>
>> Note: This can't go in until we update the copy of vmstate.h in slirp.
> 
> Do we need a libslirp buildsys version check to get this patch merged?

In that case we should use an intermediate function which would
eventually call assert() after checking SLIRP_MAJOR_VERSION/...
values.

> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> 
>> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
>> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
>> ---
>>   include/migration/vmstate.h | 7 ++++++-
>>   migration/savevm.c          | 1 +
>>   migration/vmstate.c         | 2 ++
>>   3 files changed, 9 insertions(+), 1 deletion(-)


