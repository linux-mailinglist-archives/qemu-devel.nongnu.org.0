Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF664C38BD
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 23:28:08 +0100 (CET)
Received: from localhost ([::1]:60100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNMal-0005QU-Es
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 17:28:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nNMZW-0004j9-UJ; Thu, 24 Feb 2022 17:26:50 -0500
Received: from [2607:f8b0:4864:20::102e] (port=54265
 helo=mail-pj1-x102e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nNMZU-0001Jl-2U; Thu, 24 Feb 2022 17:26:50 -0500
Received: by mail-pj1-x102e.google.com with SMTP id bx5so3194314pjb.3;
 Thu, 24 Feb 2022 14:26:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=/dPJyWR8LcKeP/06zvKmJ2+ZLd74mSMc4tDaEiqHodg=;
 b=SM+qfrK1uNUiqO8VWPtKk/i5sA1X7X5I4Ex7SI5Wtz6kZeednsmSRBI3m0OYFRqoEp
 lh143zpLPCnlLfGItaPv8jeiYSdTJyEzqENdjRIHnNo5B7V7sHS+fFjRR4opP/u+2AbM
 ZE2Zo7O02LVhkSv4z0vQL2+CrV/KL7PcvvSlTWRGIMA/h9sJQkVfVEEiWdNwUOxqCiT3
 msJlCPfPLE5vG7SG0evXCxxxQHYjvvuRpliCBUNM3QCBN5iOa8xSdM6EPFA8+dh7YNHm
 3phLwZnPpYdMcDcq0nhoqml59eIO0SmvOlUjGbVPAYueAs1H1TC5RHMngHErGltCZ7qf
 SodQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/dPJyWR8LcKeP/06zvKmJ2+ZLd74mSMc4tDaEiqHodg=;
 b=c1G+oN0JhiTlkkgnSV3CCrEAyosTgZLnnbLwTra3r3hChy9UMlfgR0FyAa/XJKCP7K
 GaVoRZfsHmP5poERA72o5laf9RN1BnGF/G53+CxLCubxXSlVSQoRyU1eixQvz9LzCI8O
 bIdLZ7F1PdHs9o0AXHDzb1tJFHxm4Z2lPv4HuIK4EOUxHHuOXUb61TqzwEPn27B9cLWe
 38l2yWxKs1r/W+qdnbMNABZbluZ8Yh383zC71LdDCuQ5j92DDReGEdGwFDyCS0VOJBqb
 8j75cAsIsdl/HKelfdzzcBFY0Cz6hGIeunBBQhJExwfzy7k+uh9iVApx91Ag/F5hG9Ru
 lKmQ==
X-Gm-Message-State: AOAM531lSCimM8nmBpiEfK4Nks1+h8STG8u+W4XPwa5Xo83hxNNi6zsT
 U8zoBWlJjbI48HHKMG7gilo=
X-Google-Smtp-Source: ABdhPJzA30UVltUflbww4aPb381ExdGebVgnR2OHyJntVztoXEZeyquxbhkiygkLT/YI9Jsr9WGAsQ==
X-Received: by 2002:a17:90a:a44:b0:1bc:275c:796e with SMTP id
 o62-20020a17090a0a4400b001bc275c796emr231718pjo.3.1645741606431; 
 Thu, 24 Feb 2022 14:26:46 -0800 (PST)
Received: from [192.168.223.175] (21.red-88-28-25.dynamicip.rima-tde.net.
 [88.28.25.21]) by smtp.gmail.com with ESMTPSA id
 lk9-20020a17090b33c900b001bc7c2dfcdbsm321019pjb.37.2022.02.24.14.26.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Feb 2022 14:26:45 -0800 (PST)
Message-ID: <c34a05c2-e2aa-81b6-dd64-a9f921cc6f8b@gmail.com>
Date: Thu, 24 Feb 2022 23:26:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH] libvhost-user: Fix wrong type of argument to formatting
 function (reported by LGTM)
Content-Language: en-US
To: Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org
References: <20220107154930.505075-1-sw@weilnetz.de>
 <44e29af1-6d6b-5613-d4c3-aec1f133e931@weilnetz.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <44e29af1-6d6b-5613-d4c3-aec1f133e931@weilnetz.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: qemu-trivial@nongnu.org,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24/2/22 22:22, Stefan Weil wrote:
> Am 07.01.22 um 16:49 schrieb Stefan Weil:
> 
>> Signed-off-by: Stefan Weil <sw@weilnetz.de>
>> ---
>>
>> LGTM has some more alerts which need attention:
>> https://lgtm.com/projects/g/qemu/qemu/
>>
>> Regards,
>> Stefan
>>
>>   subprojects/libvhost-user/libvhost-user.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/subprojects/libvhost-user/libvhost-user.c 
>> b/subprojects/libvhost-user/libvhost-user.c
>> index 787f4d2d4f..6eb72c4200 100644
>> --- a/subprojects/libvhost-user/libvhost-user.c
>> +++ b/subprojects/libvhost-user/libvhost-user.c
>> @@ -651,7 +651,7 @@ generate_faults(VuDev *dev) {
>>           if (ioctl(dev->postcopy_ufd, UFFDIO_REGISTER, &reg_struct)) {
>>               vu_panic(dev, "%s: Failed to userfault region %d "
>> -                          "@%p + size:%zx offset: %zx: (ufd=%d)%s\n",
>> +                          "@%" PRIx64 " + size:%zx offset: %zx: 
>> (ufd=%d)%s\n",
>>                        __func__, i,
>>                        dev_region->mmap_addr,
>>                        dev_region->size, dev_region->mmap_offset,
> 
> 
> Up to now I did not see any response to this patch, and it is also still 
> missing in the latest code.
> 
> dev_region->mmap_addr is an uint64_t value, so the current format string 
> "%p" won't work on any platform where pointers are not 64 bit value.
> 
> Stefan
> 
> 
> 

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


