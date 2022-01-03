Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE0014836AA
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Jan 2022 19:16:41 +0100 (CET)
Received: from localhost ([::1]:40026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4Rsu-0006Ka-HW
	for lists+qemu-devel@lfdr.de; Mon, 03 Jan 2022 13:16:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n4Rqi-0004Sa-Oo; Mon, 03 Jan 2022 13:14:24 -0500
Received: from [2607:f8b0:4864:20::833] (port=44822
 helo=mail-qt1-x833.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1n4Rqh-00010f-38; Mon, 03 Jan 2022 13:14:24 -0500
Received: by mail-qt1-x833.google.com with SMTP id a1so31178207qtx.11;
 Mon, 03 Jan 2022 10:14:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=zWpbIeTf7weYxkG107pxAfmXIC6OBeE7HJPCh12uj8A=;
 b=n7PxjN5CkmxU9wu68fUfaz+keFtJaFruLPndDWLsdnHGmH7OxwptYVU8yO7AGF5nyB
 cVzRS0W2fxLMyBhUKQuUkerXkLOtteSy7hkYIrL31bchhmlhecNq3hDcIyJI/Jmm3fZE
 J56JfsjAQTMeipONOEj0C5JaqTN/IurI0lXkAHnFAhCNAeeZGWffyV73SwlXq3GySouf
 6nVId+OiBTM81XwWLHHhfQEdJQPUP57FDwdpcVmVqZWhmMOamatVqM9hTsf8uliAzDYK
 K/MrocI4IDm4WR0RfVuihcAa159fC2qJs0A5V3vviUR2az/pkWj5oralLG/Hpp1W2KY+
 qkbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=zWpbIeTf7weYxkG107pxAfmXIC6OBeE7HJPCh12uj8A=;
 b=L85FkAdcObCmF8dXR2JYDJ9vjAm3OpdyRqgzlEDD00gpY2lAHSUakiuH6QBGP3QXNQ
 PwbUgBPOhzxtTImWXnPlqgbC3AjbtDd0w3zUgLoer+IFsSIjdsmm3YSiQVwkCR+lacjX
 N+0XyIb688RM0cBIeXwhduiJZmeXV/YW5s1P75OXgoOWykYfaTe9YqIGZ6nWF3+lOvRu
 PUUghNkvC6VVJU+0CN8RjP/YNygpf1ooVZE8bcBvvSahB8TLsTUgDcv63L1v2H3x2HO5
 S4AtywDfJ/w1UolUarMmffieczOsVUGDBziwJmrM+goMPrOTDyPGW7KBAFwC601l/+4s
 E/+w==
X-Gm-Message-State: AOAM530v112GGUZOKcpW8JXk0SL+RzBtOjmO1vEZbWaChXl1MySb9XyM
 nLRKdmacVem5LLR6YryArgQ=
X-Google-Smtp-Source: ABdhPJyUTl+XJ/idSEcAKSva1G9GQnzaCMjJyrzguqkBqz/Xi4PGCLuxmN3vnHd3WeWZvpjSgjudMg==
X-Received: by 2002:a05:622a:2ce:: with SMTP id
 a14mr40891442qtx.445.1641233661914; 
 Mon, 03 Jan 2022 10:14:21 -0800 (PST)
Received: from ?IPV6:2804:431:c7c7:f4d8:aa07:335f:99e0:a6e7?
 ([2804:431:c7c7:f4d8:aa07:335f:99e0:a6e7])
 by smtp.gmail.com with ESMTPSA id h19sm31398910qth.63.2022.01.03.10.14.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Jan 2022 10:14:21 -0800 (PST)
Message-ID: <29118dc3-2afc-3d4f-595b-22e4b820efef@gmail.com>
Date: Mon, 3 Jan 2022 15:14:19 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2 0/5] Re-write PPC64 PMU instruction count using TCG Ops
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-devel@nongnu.org
References: <20211223201812.846495-1-danielhb413@gmail.com>
 <319c406d-0b4b-12aa-0057-ed967c232648@kaod.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <319c406d-0b4b-12aa-0057-ed967c232648@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::833
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::833;
 envelope-from=danielhb413@gmail.com; helo=mail-qt1-x833.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FROM=0.001, NICE_REPLY_A=-3.354, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: richard.henderson@linaro.org, qemu-ppc@nongnu.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 1/3/22 03:46, Cédric Le Goater wrote:
> On 12/23/21 21:18, Daniel Henrique Barboza wrote:
>> Hi,
>>
>> In this version the tedious repetition was taken away from the
>> code by using a helper that increments the PMCs based on specified
>> conditions.
>>
>> As far as Avocado test goes, the performance is the same as the previous
>> version. All PMU-EBB kernel selftests are also passing. Basically we have
>> the same benefits from v1 but 150+ lines shorter.
>>
>> changes from v1:
>> - former patches 2-6: removed
>> - new patch 2:
>>    * added inc_spr_if_cond() helper
>> - new patch 3:
>>    * add insn count for PMCs 1-4
>> - patch 4 (former 7):
>>    * use a loop to reduce code repetition when checking for counter
>> overflows
>> - v1 link: https://lists.gnu.org/archive/html/qemu-devel/2021-12/msg03871.html
> 
> I understand that you are going to rebase on top of Richard's patchset.
> and so this series is now obsolete ?

Yes it is. I'll post a new version of Richard's patchset shortly.


Daniel

> 
> Thanks,
> 
> C.
> 

