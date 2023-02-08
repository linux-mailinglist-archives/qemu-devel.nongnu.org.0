Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A07568ED7F
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 12:07:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPiHJ-00031D-Kb; Wed, 08 Feb 2023 06:06:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPiHG-0002y3-4q
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 06:06:14 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pPiHE-0001pe-FE
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 06:06:13 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 j29-20020a05600c1c1d00b003dc52fed235so1171395wms.1
 for <qemu-devel@nongnu.org>; Wed, 08 Feb 2023 03:06:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+CeF+7MzbrOOXhyQMjyipptBzN2FppJb6yotcIs5AgM=;
 b=rHd/YwMw2HS7OPGbp0waoWE/s6jWaXxIb7H8Zs0/AdEoJ5lJl2adPXScUBm7Ugqzn9
 LyjnwiA+4XpI2r4GJU20nFonIBJLkS7j/6CEN2Qkhg3nXsygLJ4tADhFlfYz3IRyjlD2
 MEJoPGGDWkkpQD3dNno0GvIVHntQTJMfe1YDHCGzWY5XY6wu7/GIfPReTKWAaFLugOYo
 UuuZ23t4dldB6U8OtZoXyoarONzkHxpZOHbO73gq9UOIi/UbnCCdRvn31+3dcNi3FjkS
 RTSnB4ZjuL8gU7OKQvY4qGZiWfsYIQoc784krPORErIlOf6RoZvikoJ4v5oUU6ItRNby
 /1LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+CeF+7MzbrOOXhyQMjyipptBzN2FppJb6yotcIs5AgM=;
 b=AWzm3fm8AVZQeMbxIcQfYvJkxMZRrQcsi6Ya9oP5czUhlnn/0Oo1Xlv3nCX/olLIvu
 2VH6R2TnpdSb4r9fNNv04IvX+qzMvZ7DAZ0GYdIf8bjQz0AoflkuvYG40KqWTIRSXWLo
 a+AGcEWm98VogKa+GSp1xEYKf3DaRLUBqTRPzGsnbZqjl4S6r3NYU35RTGRz7zmH2ivn
 qxglFSS8kjh6ApkklRH14A15oqTqlfPPCHrTRyOtSjI/XWEwIbx0Xx2BF8FW7/Q6dgF5
 fFz8/NwdxuIUGDV0isriSZ4n8XXxv8YZp5SS83t2R/uLBFVSuJ9Eoh8+UFVNBiPQnhr2
 VEjA==
X-Gm-Message-State: AO0yUKWlUC33EwQG2RW1/OyVKSPc3A0aMnJzF1eVnr6nIqWG5zUiy/E1
 kccvE8/Eh4hRXr7YpklUrgMosQ==
X-Google-Smtp-Source: AK7set9hSv5PYX3CBYTPjtNDzj0RcQRpJkkABYuFaBLT83USW+up/4UHKVN+TLq//CFw6s6B6Q6xKA==
X-Received: by 2002:a05:600c:3416:b0:3df:50eb:7ca6 with SMTP id
 y22-20020a05600c341600b003df50eb7ca6mr6324872wmp.15.1675854370980; 
 Wed, 08 Feb 2023 03:06:10 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 m17-20020a05600c3b1100b003df5be8987esm1722845wms.20.2023.02.08.03.06.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Feb 2023 03:06:10 -0800 (PST)
Message-ID: <4cd02c72-ee3b-b6c6-929e-e88bdb3e0472@linaro.org>
Date: Wed, 8 Feb 2023 12:06:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PULL 09/35] readline: Extract readline_add_completion_of() from
 monitor
To: Markus Armbruster <armbru@redhat.com>,
 Dongli Zhang <dongli.zhang@oracle.com>
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org
References: <20230203084549.2622302-1-armbru@redhat.com>
 <20230203084549.2622302-10-armbru@redhat.com>
 <7fbb3bfa-8cb3-73ab-bf03-81585f9024e1@linaro.org>
 <875yccl97z.fsf@pond.sub.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <875yccl97z.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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

On 8/2/23 11:53, Markus Armbruster wrote:
> Philippe Mathieu-Daudé <philmd@linaro.org> writes:
> 
>> On 3/2/23 09:45, Markus Armbruster wrote:
>>> monitor/misc.h has static add_completion_option().  It's useful
>>> elsewhere in the monitor.  Since it's not monitor-specific, move it to
>>> util/readline.c renamed to readline_add_completion_of(), and put it to
>>> use.
>>
>> 52f50b1e9f8fd410d4293a211d549ec61b902728 is the first bad commit
>>
>> This commit broke monitor autocomplete feature.
>>
>> Before:
>>
>> (qemu) <tab>
>> ?                                announce_self
>> balloon                          block_job_cancel
>> block_job_complete               block_job_pause
>> block_job_resume                 block_job_set_speed
>> [...]
>>
>> After:
>>
>> (qemu) <tab>
>> [no autocomplete]
> 
> I'll look into it.  Thanks!

This fixed it:
https://lore.kernel.org/qemu-devel/20230207045241.8843-1-dongli.zhang@oracle.com/


