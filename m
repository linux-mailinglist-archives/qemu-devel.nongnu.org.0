Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED6AF62DDE2
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Nov 2022 15:23:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovfnU-0006Kl-7m; Thu, 17 Nov 2022 09:23:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ovfnP-0006D4-V7; Thu, 17 Nov 2022 09:23:16 -0500
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ovfnK-0002R5-Nm; Thu, 17 Nov 2022 09:23:15 -0500
Received: by mail-ot1-x329.google.com with SMTP id
 46-20020a9d0631000000b00666823da25fso1149534otn.0; 
 Thu, 17 Nov 2022 06:23:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BGMtqOPXmkSSTnmVQo2VvLSDQVZJdVgAz5qLYAh8Ytw=;
 b=ZbhdqCKlgzQu69LLNIZm3YGonYq62qOgyehqAQLpMJcf8FGj36t1PuwtjnLIrSmb9H
 2s3NJnpTOrVp1Et9GtQM8D0e9f9NkjUWmW9rI094S9TgyPzJvKSD72te4Iw7kCjkln4t
 bf3KeMXEIP08/pDGbk1ECeS/LWLNfyIVY1atJhsnIwqinf0lgSqsYJI/a7ary4aCgCts
 q40Sd07xq7NHhyxUGXlnKwa0+392P9WL5EQMFxfKhjFpPTtHTb3D15hijhrJACRLr7Ci
 rcVZCMqBd2LvNSVL5z5Br3m1qHMA53npXickx+cTUWUJQnuaDIYLAxKv8JAP5MZFV/WA
 T9hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BGMtqOPXmkSSTnmVQo2VvLSDQVZJdVgAz5qLYAh8Ytw=;
 b=k0yrrmGyWlBTH8e+cmyeoujx/TgO0y6qvGglrbyXIXxH7afQd4bSIoyh3B0DjXHTEr
 ZkZXiRFw3qXRPXk7jQelC79fRRfytfLcGNWiXTZVGePtSmgcbFm1kMR57loU6bDNOwrS
 bgp3QF8aM2VvnEEion1BiSMgwv+ysTCnDt1neGm2debHozteUZPYH0qCyvJyuWnOpF4P
 LXRdjiTEnQ5QqpBgL+6QMeVNiDllp1jyx5LUtUawB5Y22DeTl4lhDMJlDcoQAixh0LYW
 zO+FdGmdH33m2QQubRqIgHl2wlzh2/Fj3areFNdOOlrFGPpjOUrTa92PvxxSmeAK7XCy
 VLzA==
X-Gm-Message-State: ANoB5pk9Jys1M66kH03MJctKhfCfLN0mGuAra8wmSH79f0DeQY2pAkac
 acoDNPyiLVoE9jzGgeZr7eQ=
X-Google-Smtp-Source: AA0mqf7G/Dfhu5smBluKAvSR4Z2Zx6tC/CjnzrIcNdHlnp2GKzfcHaRAcIjDgXlS6xgfscnAYP3Gog==
X-Received: by 2002:a05:6830:6112:b0:661:b9c5:b4ae with SMTP id
 ca18-20020a056830611200b00661b9c5b4aemr1501692otb.171.1668694988677; 
 Thu, 17 Nov 2022 06:23:08 -0800 (PST)
Received: from [192.168.10.102] ([177.139.31.146])
 by smtp.gmail.com with ESMTPSA id
 d9-20020a4ad349000000b0049f3bdd791esm357773oos.26.2022.11.17.06.23.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Nov 2022 06:23:08 -0800 (PST)
Message-ID: <7ce75e50-42f1-0df5-6d92-dc0ce6d94b39@gmail.com>
Date: Thu, 17 Nov 2022 11:23:03 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH] target/ppc: Fix build warnings when building with
 'disable-tcg'
Content-Language: en-US
To: Vaibhav Jain <vaibhav@linux.ibm.com>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: david@gibson.dropbear.id.au, clg@kaod.org, groug@kaod.org,
 Kowshik Jois B S <kowsjois@linux.ibm.com>
References: <20221116131743.658708-1-vaibhav@linux.ibm.com>
 <9b92deef-e0ef-101d-8f7e-2b4634bde6de@gmail.com>
 <87k03tx40z.fsf@vajain21.in.ibm.com>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <87k03tx40z.fsf@vajain21.in.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::329;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x329.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



On 11/17/22 07:35, Vaibhav Jain wrote:
> 
> Hi Daniel,
> 
> Thanks for quick turnaround on this,
> 
> Minor correction to the commit tags below:
> 
> Daniel Henrique Barboza <danielhb413@gmail.com> writes:
> 
>> Queued in gitlab.com/danielhb/qemu/tree/ppc-next with the following tags:
>>
>>
>>       Reported-by: Kowshik Jois B S <kowsjois@linux.ibm.com>
>>       Fixes: 61bd1d2942 ("target/ppc: Convert to tcg_ops restore_state_to_opc")
>>       Fixes: 670f1da374 ("target/ppc: Implement hashst and hashchk")
>>       Resolves: https://gitlab.com/qemu-project/qemu/-/issues/377
> This should be
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1319

Ops! Fixed in tree.


Daniel

> 
>>       Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
>>       Reviewed-by: Greg Kurz <groug@kaod.org>
>>       Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>       Tested-by: Kowshik Jois B S <kowsjois@linux.vnet.ibm.com>
>>
> 

