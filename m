Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D82124729E5
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 11:26:58 +0100 (CET)
Received: from localhost ([::1]:37618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwiXp-0007CV-ET
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 05:26:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mwiUv-00053T-BI
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 05:23:57 -0500
Received: from [2a00:1450:4864:20::331] (port=46822
 helo=mail-wm1-x331.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mwiUt-0005Zg-PX
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 05:23:57 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 c6-20020a05600c0ac600b0033c3aedd30aso11224663wmr.5
 for <qemu-devel@nongnu.org>; Mon, 13 Dec 2021 02:23:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:references:in-reply-to
 :content-transfer-encoding;
 bh=vN44KKytHq403COCTKZjoru4K/u9wUXKaJ+OQzgs9MM=;
 b=UvEL/IGXxwz9xO3zCYvUkBsidr0hQaJery8YSgH8HPKMwGoMkJyYMCdS69rPOhDvos
 gY8vIlGo9nfjvXy3T2h8WOS76ysJJHuhbN/DhBAI1lo8spb6ufCh3hW65cNiRY6Nl1ZZ
 GoUXWTbb9kRKFHBdg4je2SfU8+dCpJFi3E326qoU7UyZ4nHuvtVFV6jH9hRuW6EVtdQC
 WvNqKr6DrJk5trVZmQ91a3OTKKWiuBp7cH90Hxih+IXQ9xPAmooj6ABNAanueZK5Y33T
 Lj4DWnSWlIKNdpMfLTChzI6Il08Y1Ccsg30di0FiUXL0xb77Aqnn3BKolq990EGHIe+N
 sROw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:from:to:references:in-reply-to
 :content-transfer-encoding;
 bh=vN44KKytHq403COCTKZjoru4K/u9wUXKaJ+OQzgs9MM=;
 b=mpe/m31PtrWpCrxb3J2f5PjD//Z6S3xB6M9RZiRfbr0APMavXXDE5oWwCZwE+KEaj5
 YNCkcFmQVgrvLf4xLiwoOpo5jOWq6d+bDsKy+RBtoC8UqHGNwKtGD41ZIKbBj6MjVi/K
 azqY7Rdjpsp5XOBoVecui0IztnxQ+MQy09znPFsUDitFXMJGJ9u6Axi5CxKA+9Wl5vMU
 LkpQhnXczf7zXzUGKHdDo2BsJtuvA/VeIP5b5n4B651EOhPSW33OfXQ5UOJ6wQXwQS6H
 JRFPfhTTzG53YGq2682huMc+kQneHKTkaOKNp/VE1kgwSkjW3Ct4ZUiwBJYPAK+rLmSM
 5Nzg==
X-Gm-Message-State: AOAM531hEQKldU5IXI8mWpD9DZA0tIhVOovs/TjT6zftqY/vdpEVgHjD
 uOIAaMJYtuC1vz85vfOmEg3++KCsFt2Azg==
X-Google-Smtp-Source: ABdhPJzN9uIdIoEdkpODrO2IldPCPmgJkC79byYnpOiu7ZM+1HQPKRu26XU8VHNNOvzuXrzL+r73tg==
X-Received: by 2002:a7b:c1d5:: with SMTP id a21mr36507031wmj.14.1639391034490; 
 Mon, 13 Dec 2021 02:23:54 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id f8sm7469359wmf.2.2021.12.13.02.23.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Dec 2021 02:23:54 -0800 (PST)
Message-ID: <81f4fd87-a177-420b-d69d-45faa0eddb48@amsat.org>
Date: Mon, 13 Dec 2021 11:23:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] MIPS - fix cycle counter timing calculations
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: Simon Burge <simonb@NetBSD.org>, qemu-devel@nongnu.org
References: <20211116072606.BE9C8A1856@thoreau.thistledown.com.au>
 <b32b56b9-acda-66ae-6b81-e45cac403bd8@amsat.org>
In-Reply-To: <b32b56b9-acda-66ae-6b81-e45cac403bd8@amsat.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::331
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-4.093,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 12/13/21 11:10, Philippe Mathieu-Daudé wrote:
> On 11/16/21 08:26, Simon Burge wrote:
>> The cp0_count_ns value is calculated from the CP0_COUNT_RATE_DEFAULT
>> constant in target/mips/cpu.c.  The cycle counter resolution is defined
>> per-CPU in target/mips/cpu-defs.c.inc; use this value for calculating
>> cp0_count_ns.  Fixings timing problems on guest OSs for the 20Kc CPU
>> which has a CCRes of 1.
>> ---
>>  target/mips/cpu.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
> Good catch. Too bad you didn't Cc'ed the maintainers, this patch
> would have been in the 6.2 release.
> 
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> 
> Queued to mips-next.

Oops, missing your Signed-off-by tag, see:
https://www.qemu.org/docs/master/devel/submitting-a-patch.html#patch-emails-must-include-a-signed-off-by-line

Do you mind re-sending with your S-o-b? Meanwhile, patch dropped.

Thanks,

Phil.

