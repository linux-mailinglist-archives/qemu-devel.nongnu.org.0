Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA3FF5694C9
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 23:56:35 +0200 (CEST)
Received: from localhost ([::1]:36608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9D0c-0000KZ-7B
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 17:56:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1o9C1L-0005eS-6c
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 16:53:15 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:46910)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1o9C1J-00020v-QE
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 16:53:14 -0400
Received: by mail-pg1-x52b.google.com with SMTP id s27so14894299pga.13
 for <qemu-devel@nongnu.org>; Wed, 06 Jul 2022 13:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=9U3AwEw60zDK3qwCGPAxWVpi0BLVvAoRCjJ0YFjt0WY=;
 b=FZsZSqj9c8xMGdH6YiALoVThccn0FjxhmZ/oXiOvRGDCjZ3xEtLOn9LRCtSv4NoJ6R
 Lle4lkkSyiQh4h8iN3Y1jCSBHLT9LKYuP7hoiwblzl+cduo+W5luSFoybSCgtW5HK39U
 VyRm/ln/Po83FlySLdq6B9FDfp/+qymqXMIctdxC/LX5SFEu+53s/xsUfhw/cT7Vdszo
 0Bped0INDYpvLUbKrQh4j8+Qf/NOPgypZ9wls7LtGtIQ9GYLvDReVyqup+LaifiCqFuP
 w7jH8Yk8QQlKcCD5noAnP2h9TBLsEbZ/jZwDPRGEnA83lB1cwuKUi167t4aY2ZIIpK+d
 WZ1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=9U3AwEw60zDK3qwCGPAxWVpi0BLVvAoRCjJ0YFjt0WY=;
 b=yoIabicd0AlwTLRL2wKpX1fW9H57rWxkWX4DVX9nBEG82qFoY1/BRzjbTZ2Pl8YNz7
 Tpv6W7t6vReqa2f9k0UvjIETE8aAjZ36i8ivq2PvQk/x5L0paYhZx68mGk7SlowWM7Aq
 a9/EZx+pDIDgsrbdnDDRr8udPhFN7s3F9dbJy1nH3BgLkpQT/E771016piSd/nUXGWbg
 RlOVjnmx1CRnSFRCSFG/AXRqLwvVCrAAtGc7jCwe1phqOHhe+NLejtzE1hXrNbqsaLCU
 L3x/FOvpt8yJEZGiPT/PBK2kmk62MZZGBciC1N5yAMgXusiXWatdtkndjV5wP0MC467g
 1Lbg==
X-Gm-Message-State: AJIora9rpwozbtXM+8T4EVeisSvcYgwBfAhsjiscq5DBXRh3sdey+67n
 jyaeYbY096q/nhy85SttWzA=
X-Google-Smtp-Source: AGRyM1sn4xxPSzfXua1OjxSDPh9d1aASkwTHFXMrEwEtvoq5YHEulUwFeCQiLLPhCAGX4M2KrsJO3w==
X-Received: by 2002:a63:c53:0:b0:412:6f28:7a87 with SMTP id
 19-20020a630c53000000b004126f287a87mr10233655pgm.136.1657140791416; 
 Wed, 06 Jul 2022 13:53:11 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 m22-20020a62a216000000b005289753448fsm3812434pff.123.2022.07.06.13.53.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Jul 2022 13:53:10 -0700 (PDT)
Message-ID: <48ad37ed-4228-6cba-9c9a-a9bc39a66dbe@amsat.org>
Date: Wed, 6 Jul 2022 22:53:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [PATCH v3 4/4] target/mips: introduce Cavium Octeon CPU model
Content-Language: en-US
To: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>, qemu-devel@nongnu.org
Cc: jiaxun.yang@flygoat.com, aurelien@aurel32.net, aleksandar.rikalo@syrmia.com
References: <165572671617.167724.12940170194930233873.stgit@pasha-ThinkPad-X280>
 <165572673785.167724.7604881144978983510.stgit@pasha-ThinkPad-X280>
 <36303c3f-14ee-478b-855f-0dddbfb26f3f@ispras.ru>
In-Reply-To: <36303c3f-14ee-478b-855f-0dddbfb26f3f@ispras.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 4/7/22 12:59, Pavel Dovgalyuk wrote:
> ping
> 
> This is the only non-reviewed patch in the series.

I've been looking for doc/datasheets but no luck (except the Linux 
kernel comments).

What kind of testing are you doing?

> On 20.06.2022 15:05, Pavel Dovgalyuk wrote:
>> This patch adds Cavium Octeon 68XX vCPU which provides
>> Octeon-specific instructions.
>>
>> Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
>>
>> -- 
>> v3 changes:
>>   - split the patch to instruction set introduction and new vCPU
>>     (suggested by Philippe Mathieu-Daudé)
>> v2 changes:
>>   - vCPU name changed to Octeon68XX (suggested by Richard Henderson)
>> ---
>>   target/mips/cpu-defs.c.inc |   28 ++++++++++++++++++++++++++++
>>   1 file changed, 28 insertions(+)

