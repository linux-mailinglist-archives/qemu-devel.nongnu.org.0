Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE0483637CB
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Apr 2021 23:22:33 +0200 (CEST)
Received: from localhost ([::1]:49708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYEsC-0000ZI-SF
	for lists+qemu-devel@lfdr.de; Sun, 18 Apr 2021 17:22:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYEqN-00087o-4t
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 17:20:39 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:35579)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYEqL-0001DL-FI
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 17:20:38 -0400
Received: by mail-wr1-x436.google.com with SMTP id a4so31944627wrr.2
 for <qemu-devel@nongnu.org>; Sun, 18 Apr 2021 14:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ky5FPPrp4cLa42/OCzeBM41rA5ChEk5vSuu+Ti1ItZg=;
 b=mDaFZAmMG4/cbVAkSGCsFbUPZi9xZv4BGHR8yB+gbfbTaM7/+7iBL9P0j9qjghooCC
 kijf/FnuoCXGkoCn12yJCmP6Yj9Me36iN2I6Rn3kpnlZTv8A3vLN6CBcAglGCgbiYgvi
 NBey7NESba+QpEmQdZZViiEIWDFnAXbug6FHIfTFYseE7yZq8qMMS0NYNLk/Wo7gHm+8
 8cmItfVOSAMeUi3gnFV/WRBRp5hWXzG9Otw6WEtzKuIGD9EM2Jk2WGuOScGO98/jIGkI
 HL6DoRWVRrOCTR0LdFzbM79fmsDBXZagSRCJCX+O0WiarbYr6/n37wQfbA+SUd6QI+7M
 0qdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ky5FPPrp4cLa42/OCzeBM41rA5ChEk5vSuu+Ti1ItZg=;
 b=QAWtyegcp13ix8uAp0QKCei0YWR4SJV6GZryAclOmoix4sH5J8AYaNT/RWMT6RUYkJ
 SeLMUMwiSAQKig6cOtMPRwJUfPtG2HQuwU3BfX6a9pcI4GdcNZoPShBZCKRrIgEl2gHD
 N1FEWDGEfItFK2GIWAkj6Nda29oc4sMuJRPXDREjj4TwtDBo9RO5txH/eHGeoPPRcE6p
 ciAT6c0aBmccYnIyYxdWyESc9xEbihceSJ4AxpcUlwpiTwWg44Cu1bsIdqyG9TSLCDnI
 KzV8AGxyVJ4G/iUQcLx6MDZYwbQZplTAeBgrsC8c8dj9y5Qu0T2p5GVyS1nlRzURFsAJ
 t8Zg==
X-Gm-Message-State: AOAM533k63njoSooZRC/0Wq3+Xv740wogd/41G4TZoBkEbC+eW76+LeX
 mPagQsIacsqKqBGwnBpcAcw=
X-Google-Smtp-Source: ABdhPJyihIiDStmqr+T2GP8Itw6Li632aUS4jobB0Vdkz+T+z97oAiHIZBn8yop6Tn5H0vyqTcfTvw==
X-Received: by 2002:a5d:4010:: with SMTP id n16mr10826661wrp.225.1618780836169; 
 Sun, 18 Apr 2021 14:20:36 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id u2sm19749786wmm.5.2021.04.18.14.20.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Apr 2021 14:20:35 -0700 (PDT)
Subject: Re: [PATCH 23/26] target/mips: Move helper.h -> tcg/helper.h.inc
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210418163134.1133100-1-f4bug@amsat.org>
 <20210418163134.1133100-24-f4bug@amsat.org>
 <760f0c29-e334-3cf8-2389-09b1aea3bb37@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <9eac4022-3361-c90b-1e75-7b392740e24b@amsat.org>
Date: Sun, 18 Apr 2021 23:20:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <760f0c29-e334-3cf8-2389-09b1aea3bb37@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/18/21 10:34 PM, Richard Henderson wrote:
> On 4/18/21 9:31 AM, Philippe Mathieu-Daudé wrote:
>> TCG frontend "exec/helper-head.h" expects each target to declare
>> its helpers in 'target/$TARGET/helper.h'. To ease maintenance we
>> rather to have all TCG specific files under our tcg/ sub directory.
>>
>> Move the current 'helper.h' there, and add a one-line 'helper.h'
>> which re-include it.
>>
>> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
>> ---
>>   target/mips/helper.h         | 614 +----------------------------------
>>   target/mips/tcg/helper.h.inc | 613 ++++++++++++++++++++++++++++++++++
>>   2 files changed, 614 insertions(+), 613 deletions(-)
>>   create mode 100644 target/mips/tcg/helper.h.inc
> 
> Eh.  Ok, I guess.
> 
> If we renamed the file tcg-helper.h{,.inc?} globally, would you still
> want it moved into your tcg/ subdirectory?

Not really... I wanted to have anything TCG related under tcg/,
but I can't find any good reason for it (I was thinking about
finer MAINTAINERS granularity, but this doesn't bring much).

I'll drop this patch, no need to change the other targets.

Thanks for the reviews!

Phil.

