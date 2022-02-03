Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D1C4A8428
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 13:55:55 +0100 (CET)
Received: from localhost ([::1]:59902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFbeU-0005hg-DO
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 07:55:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nFbMw-0002BN-2o
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 07:37:46 -0500
Received: from [2607:f8b0:4864:20::102d] (port=50913
 helo=mail-pj1-x102d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nFbMu-0001F8-63
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 07:37:45 -0500
Received: by mail-pj1-x102d.google.com with SMTP id m7so2338086pjk.0
 for <qemu-devel@nongnu.org>; Thu, 03 Feb 2022 04:37:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=lGvpg3AaFmuWPI5TWMqByEJf47m8kl2LLsuvjty1e6U=;
 b=MIHPdwWTpTNS0OJ0gx7Fbi2rcRnEFwFVdFJ7czo/or0sFC/tILb63uJhvDOuL1QWGY
 QAxmPwzthNONCSVfG7sNgEL1a0Tn9f0MqRCoNa8EzPMDTEG4Uho+SF6HLA0T62m5iBrm
 /y1ZFf2IWliHJFpZvAJgGb2eHZi+bnzOpZ2E/TCxjEz/SSHVyC4TYutNl6fv3E6GE0Zm
 TXMQvoCRer5fNB2wLDWF82Axu1hNb5UUBNu8Xl2HQIWZadxrrc7cLaKm5heSuWpsz1xz
 XWCvFEhVCNPEtizAbT03ELotjqm5ruwuELWcdxotR2WE/B06t8ZSxyXM2yrl7AgQYwb6
 d7Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=lGvpg3AaFmuWPI5TWMqByEJf47m8kl2LLsuvjty1e6U=;
 b=MnaofFv11dpy2kz5A76j312wY9Q/nRRqLpnmAA1uO2vYFL+jqt0gqndYdxppCZcN5D
 su/9asY0VXCuTluyFi0grMCwmFqa1sEibc69ScAIx0e7RqEqjUic43pg0s/QBlKtFSdM
 oWoaJji2a3yNyQtP17vGlsPGdLArqFEWGBT2Romqfz6PxiPCK5R2xa0EyntEiU/IstvF
 28FYj2zYtSX8rdrOHZsVkXSiagWqp+OULl9dXHB+rErM+XXXoUgpZemcvAl5dORATbyq
 JCExjNrwnEe6HNDrlyEu8BZe8VIE1jeF7jd4i6c0eEkx/BvtZseJOgxJ0mVEsWAGcPO7
 +87A==
X-Gm-Message-State: AOAM533cdaP0yDzpOeg4/U3bJVwZgSUDuW3oJMd3IurB+6miZGeylGmC
 +FwFiYCIfgglfhGo+rVquXg=
X-Google-Smtp-Source: ABdhPJySV3RpPamA0icF7I3wf21op9pHLTx4gxvd00m8qUN++VXwv8boYMTJX8yalXjXSbZKC7xLbw==
X-Received: by 2002:a17:90a:bb01:: with SMTP id
 u1mr13481714pjr.148.1643891862316; 
 Thu, 03 Feb 2022 04:37:42 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id mp22sm9722609pjb.28.2022.02.03.04.37.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Feb 2022 04:37:41 -0800 (PST)
Message-ID: <24207fae-bd2f-46f5-7d5c-20add4670b0d@amsat.org>
Date: Thu, 3 Feb 2022 13:37:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [RFC PATCH 11/15] exec/cpu: Make
 address_space_init/reloading_memory_map target agnostic
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
References: <20210517115525.1088693-1-f4bug@amsat.org>
 <20210517115525.1088693-12-f4bug@amsat.org>
 <30a9e423-5d2b-ae00-3f40-2487f3a5b467@linaro.org>
In-Reply-To: <30a9e423-5d2b-ae00-3f40-2487f3a5b467@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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

On 26/5/21 21:01, Richard Henderson wrote:
> On 5/17/21 4:55 AM, Philippe Mathieu-Daudé wrote:
>> cpu_address_space_init() and cpu_reloading_memory_map() don't
>> have to be target specific. Remove this limitation to be able
>> to build softmmu/cpus.c once for all targets.
>>
>> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
>> ---
>>   include/exec/cpu-common.h | 23 +++++++++++++++++++++++
>>   include/exec/exec-all.h   | 25 -------------------------
>>   2 files changed, 23 insertions(+), 25 deletions(-)
> 
> It's not clear to me why the declarations moved file, instead of just 
> droppig the surrounding ifdef.
> 
> If there's a good reason, fine, but the reason belongs in the commit 
> message.

What about:

'''
cpu_address_space_init() and cpu_reloading_memory_map() are
target-agnostic, but are declared in "exec/exec-all.h" which
contains target-specific declarations. Any target-agnostic
source including "exec/exec-all.h" becomes target-specific
and we have to compile it N times for the N targets built.
In order to avoid that, move the declarations to "exec/cpu-common.h"
which only contains target-agnostic declarations.
'''

