Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B1B74B26F5
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Feb 2022 14:19:14 +0100 (CET)
Received: from localhost ([::1]:41312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIVpQ-0003FB-VQ
	for lists+qemu-devel@lfdr.de; Fri, 11 Feb 2022 08:19:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nIVCb-0005Nm-SR
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 07:39:06 -0500
Received: from [2607:f8b0:4864:20::633] (port=34561
 helo=mail-pl1-x633.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nIVCV-0008BG-CF
 for qemu-devel@nongnu.org; Fri, 11 Feb 2022 07:39:02 -0500
Received: by mail-pl1-x633.google.com with SMTP id 10so4594454plj.1
 for <qemu-devel@nongnu.org>; Fri, 11 Feb 2022 04:38:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=K0xiEl9+0mZf7txOWGCrYVWJzza6Qg2vfChZx5Q4aw0=;
 b=kTlWAVKyFxcArhCeT6RVAOE07U9CTZja6bg01ifSEjMiuf1Mw0Qmt62FHOZeyNa8qC
 YgCF4yVSl0L1NVT1JJvZh3sGXkF90S9JUKMVTwRu6T/VrR7G8OXAtLertexEdv9WE9Ec
 kSRLK3XdZlQyg39RoP3knqY3nb7jG4Ne3CROLDbxLoj/1pwh07a6fKgNfZpMBnQ6Ynzn
 JCN+P5/i4oQauvCxWjovlDqFin/opiX5VogzFDchLd2ugdZdyRuu+/c+i+SgcCofQnqs
 H3FnDX6YQ0C1qWoeFKuvfiHfXUT70z6E24DIOEYDyTX83m95xi1GeBwLKMNQcVl8ERLs
 SlEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=K0xiEl9+0mZf7txOWGCrYVWJzza6Qg2vfChZx5Q4aw0=;
 b=nmtUbcxmXNage58xOjA+vhKO/KquMb4rLJSoyPj+6OqJAi3/7xBY0kOwulTi+TX1sJ
 TvVLpyUcYG5Mhjlr+bujaz9JW8mQ1TjuIK3IDHn66bgqn+spc/Z6jg1sSWo2sAgzxQcz
 RGhMQQAt0Zly06rAR9sEW/oYlixzXdJFCDeykQ7rpZC7+QLV50rjKWU1Igsr0qq/6ItI
 Uu0pRC8FfIUPoPv8wP380JxGr5KBcBGMyMleDOZBqH0Ma4QHHuMUiWI0AdKBaBzwTwC1
 Ki3LPuX+MtV5D3GDfvYnt3qGND6qPQ76MjIrlr3w6+sk83RUUhFPFKg0o7nblMsb9P9G
 2ptQ==
X-Gm-Message-State: AOAM532jn/5qogvaJ3GvtMdkEUc7DUuFuchXw9tny1dl94eaA3Zklxc0
 xTc+nQReOguRSjL0hpZYwGI=
X-Google-Smtp-Source: ABdhPJwTHNgEcRqVz2GqX6g6cvyPPvuKQjzBGQIVBGqEy0NaPMXgGA/MPQqOkx8ZfAPWm4wNMhQYiw==
X-Received: by 2002:a17:902:6a81:: with SMTP id
 n1mr1292014plk.105.1644583110889; 
 Fri, 11 Feb 2022 04:38:30 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id p1sm29130383pfh.98.2022.02.11.04.38.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Feb 2022 04:38:30 -0800 (PST)
Message-ID: <54ea7876-e1e0-193d-31fc-da2f360c7d7a@amsat.org>
Date: Fri, 11 Feb 2022 13:38:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH 2/9] coverity-scan: Cover common-user/
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Riku Voipio <riku.voipio@iki.fi>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <Laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>
References: <20220209230030.93987-1-f4bug@amsat.org>
 <20220209230030.93987-3-f4bug@amsat.org>
 <CAFEAcA_DYEKgn31ULPVZzR9kQ32FZe+MBdkbC8cRNjy4Oa=7iA@mail.gmail.com>
In-Reply-To: <CAFEAcA_DYEKgn31ULPVZzR9kQ32FZe+MBdkbC8cRNjy4Oa=7iA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::633
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x633.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 11/2/22 12:56, Peter Maydell wrote:
> On Wed, 9 Feb 2022 at 23:12, Philippe Mathieu-Daudé via
> <qemu-devel@nongnu.org> wrote:
>>
>> common-user/ has been added in commit bbf15aaf7c
>> ("common-user: Move safe-syscall.* from linux-user").
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>   scripts/coverity-scan/COMPONENTS.md | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/scripts/coverity-scan/COMPONENTS.md b/scripts/coverity-scan/COMPONENTS.md
>> index 183f26a32c..cea6695ecd 100644
>> --- a/scripts/coverity-scan/COMPONENTS.md
>> +++ b/scripts/coverity-scan/COMPONENTS.md
>> @@ -127,7 +127,7 @@ usb
>>     ~ (/qemu)?(/hw/usb/.*|/include/hw/usb/.*)
>>
>>   user
>> -  ~ (/qemu)?(/linux-user/.*|/bsd-user/.*|/user-exec\.c|/thunk\.c|/include/exec/user/.*)
>> +  ~ (/qemu)?(/common-user/.*|/linux-user/.*|/bsd-user/.*|/user-exec\.c|/thunk\.c|/include/exec/user/.*)
>>
>>   util
>>     ~ (/qemu)?(/util/.*|/include/qemu/.*)
> 
> Note that there is no automatic process by which changes to this
> file get applied to the coverity scan config, so hiding changes
> to it inside a larger patchset increases the chance they get
> overlooked (by Paolo, who gets to do the manual config update)...

Oh OK, I thought this was consumed by a script.

