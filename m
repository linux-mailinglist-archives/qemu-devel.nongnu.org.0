Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36FDE5BBABD
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Sep 2022 23:46:01 +0200 (CEST)
Received: from localhost ([::1]:38012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZfdQ-00066S-1h
	for lists+qemu-devel@lfdr.de; Sat, 17 Sep 2022 17:46:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oZfbj-0004Yi-GV; Sat, 17 Sep 2022 17:44:15 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:39711)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oZfbh-0000OE-VT; Sat, 17 Sep 2022 17:44:15 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 bg5-20020a05600c3c8500b003a7b6ae4eb2so2060638wmb.4; 
 Sat, 17 Sep 2022 14:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=fbkgpImrqz8/zFLOXax9hzB8RCnwqZHOgM5QC/7+w98=;
 b=UBefobC/MbfyGxAkBUrQE8sC4+poocsUJc1ChKsINa5csMYdjDevlOAcRSn/uxT3KF
 F3UJXJNT/Qt5LhbPGugcCrulp4eUFo0SnJGWZYZH52F+K0TWCdJ1+vgHfplYhQvq6QiY
 kiIvv42TbbFnUF+Q8Zxr+iqrpYGfQgvsCNrDQxhnfiu9fH6r1YeHZarCAZZotsLtHQEx
 iuQmxz/xSocMUceFkBcNLCrCL+CkrpjTLs1uv4pCcLD6tmDr6Fae3fPt/7+G+Zez8S94
 DclUbZ3MwLbUnGemIicUelkJbqnZ85gLTsEKDRnzy/GQfKmRytGz/EMwhNfwzMrC1FA8
 rRtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=fbkgpImrqz8/zFLOXax9hzB8RCnwqZHOgM5QC/7+w98=;
 b=fhqaKD1fiP40rtiKz3qazo9T+GnN6fam101guRhYE23HYd182VTyFl4mcXABIdlBo4
 8FI3NAAXz0JY7Dy+0DU/4MU8lTH9BhSNKALjsxFiUVvQLgivG4FAjicPKlvjG6ePZZmt
 FN13KNZJugv5wzmCPVG0RURXlIdD8fdO+VG8m8f75x+ZAcI3QrW6abLTAd9AhA4WZcfJ
 Sn4AuO0oog5kKYGad3qDQ5Jn8i4ESYbI5CsV1Q4dLY9vLECVXhbWzJnYjmpdGwgHX4TJ
 039BAI7xju4pJpz1MuL5UurkAEdwfjqHgUqZGG6XLhk9GVuV1w1vuDGEmd3zhP0jPiaA
 cXXQ==
X-Gm-Message-State: ACgBeo07h4F/g2lqpGocPLU+d5LQpK/dSGMQGOYjV7ALXMasVaYOcWwD
 805dyMqL6kDcWty+saGqkWc=
X-Google-Smtp-Source: AA6agR5VfY/jTuoQXBqa9Hk4dTkj1XuZDHlB/0rwn31I4vZkAFs07t1WEXNM/LZpU2t4YltODc2Y9g==
X-Received: by 2002:a05:600c:524b:b0:3b4:8c0c:f3b6 with SMTP id
 fc11-20020a05600c524b00b003b48c0cf3b6mr14997874wmb.50.1663451052360; 
 Sat, 17 Sep 2022 14:44:12 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 h7-20020a5d6887000000b0022ae8b862a7sm3246546wru.35.2022.09.17.14.44.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 17 Sep 2022 14:44:11 -0700 (PDT)
Message-ID: <d4ed9983-586e-ea44-90ad-0fc0f259acfc@amsat.org>
Date: Sat, 17 Sep 2022 23:44:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH v3 1/1] monitor/hmp: print trace as option in help for log
 command
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>,
 Dongli Zhang <dongli.zhang@oracle.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, dgilbert@redhat.com,
 joe.jin@oracle.com
References: <20220831213943.8155-1-dongli.zhang@oracle.com>
 <87h71qrmkh.fsf@pond.sub.org>
In-Reply-To: <87h71qrmkh.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-3.529,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

Hi Markus,

On 2/9/22 14:24, Markus Armbruster wrote:
> Dongli Zhang <dongli.zhang@oracle.com> writes:
> 
>> The below is printed when printing help information in qemu-system-x86_64
>> command line, and when CONFIG_TRACE_LOG is enabled:
>>
>> ----------------------------
>> $ qemu-system-x86_64 -d help
>> ... ...
>> trace:PATTERN   enable trace events
>>
>> Use "-d trace:help" to get a list of trace events.
>> ----------------------------
>>
>> However, the options of "trace:PATTERN" are only printed by
>> "qemu-system-x86_64 -d help", but missing in hmp "help log" command.
>>
>> Fixes: c84ea00dc2 ("log: add "-d trace:PATTERN"")
>> Cc: Joe Jin <joe.jin@oracle.com>
>> Signed-off-by: Dongli Zhang <dongli.zhang@oracle.com>
>> ---
>> Changed since v1:
>> - change format for "none" as well.
>> Changed since v2:
>> - use "log trace:help" in help message.
>> - add more clarification in commit message.
>> - add 'Fixes' tag.
>> ---
>>   monitor/hmp.c | 9 +++++++--
>>   1 file changed, 7 insertions(+), 2 deletions(-)

> Not this patch's fault:
> 
> 1. "-d help" terminates with exit status 1, "-d trace:help" with 0.  The
>     former is wrong.
> 
> 2. HMP "log trace:help" prints to stdout instead of the current monitor.
> 
> 3. Output of HMP "log trace:help" sometimes is truncated for me.
> 
> 4. Output of "log trace:help" and "info trace-events" is unwieldy.
>     Sorted output could be a bit less unwieldy.
> 
> 5. Could "log trace:help" and "info trace-events" share code?

Do you mind opening issue(s) on our GitLab so we don't loose your
analysis buried within the infinite mailing list?

