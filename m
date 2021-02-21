Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24458320E79
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 00:04:47 +0100 (CET)
Received: from localhost ([::1]:42098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDxmQ-0008Lb-68
	for lists+qemu-devel@lfdr.de; Sun, 21 Feb 2021 18:04:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDxin-0005eZ-QH
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 18:01:01 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:50501)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDxim-0002UP-9S
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 18:01:01 -0500
Received: by mail-wm1-x32f.google.com with SMTP id a132so11897918wmc.0
 for <qemu-devel@nongnu.org>; Sun, 21 Feb 2021 15:00:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5FWG/urwdv1fRBT4ZrY/IBsT6V5Yo2f7C85sD61dDjQ=;
 b=Bzt/nPOHDGRBe75A/Lq/cDpc0PKfdW1KT8JPk94Zdf8z8GtvlJqvLh8edm5y/gm/6e
 hSdjY7typPr90NyZCrO293djMhjFgARly4A3nCAdcF8AuTi2hCQI9dbknFlcdhIpBuh9
 IWNLDCYfzcCN6nnRi0fmU58MzWda2Qk/cNa9xxjtbA3UmOrBSGPP3V3sej4vBaKCsmry
 K0SVxDfX3fNfh1wqpS7Q4tyPNnjhjGCosheS/HkL7j+kSDTG/RJmIPZgcEgo7Z8sn0jg
 AwrJp676iB7EDJO4aAmMshh32uNJF3zolp0LMfOQcIo3Q6DT2kvKeEXuLkzbi1x1g4IH
 F0SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5FWG/urwdv1fRBT4ZrY/IBsT6V5Yo2f7C85sD61dDjQ=;
 b=A1kFvVqcrf0GvvIGKgGV0pMdTI+nL4KKDTH40uAfEqUTcb8Bj7QB95F76GTBl1OEzq
 kv+CM4JBBmF2frbvf0y44CQd6aqWuKeadmeENi6cEjoy/RQAsOTluBxHDAPdIkmtonRB
 EaUWJVdFBK6JU74galeGZn3KGvW3PV3IDq5+soOCQ1/CUXO9aqVfzt3BoG/swGVludn6
 BopJogwqTlxFtPw/JFMupuDj12PE/Zxyha+en5JxXIqHbynwX4+fL5FDLsbSKW+tcC2y
 KAj2NGftajKbN/IMSE/fyJCma4sU14rwFRF0WX6Lc9DV72G3891jKvNrx+TVGs1ptznA
 RmyA==
X-Gm-Message-State: AOAM531dIqFPYaZ1Xb5Yyw9Jin97yi7xJ7zwTCqz7uV4N6EJyYQmYX6X
 nztKewQcxzVQauG8FTMkiOBFaCwNCvU=
X-Google-Smtp-Source: ABdhPJyzwPpuTAsn4Z2sEnqKmWkV17weW2U9jWPN3jOI1IMDXRnHgjg0TLmysK1fZapDkMt5Z0GpsQ==
X-Received: by 2002:a1c:8005:: with SMTP id b5mr17848945wmd.130.1613948458949; 
 Sun, 21 Feb 2021 15:00:58 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id j125sm24242458wmb.44.2021.02.21.15.00.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 21 Feb 2021 15:00:58 -0800 (PST)
Subject: Re: [PATCH v4 01/71] tcg/tci: Use exec/cpu_ldst.h interfaces
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210217202036.1724901-1-richard.henderson@linaro.org>
 <20210217202036.1724901-2-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <a1793c46-500d-89f7-2b85-f5b320be05b8@amsat.org>
Date: Mon, 22 Feb 2021 00:00:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210217202036.1724901-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
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
Cc: sw@weilnetz.de, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/17/21 9:19 PM, Richard Henderson wrote:
> Use the provided cpu_ldst.h interfaces.  This fixes the build vs
> the unconverted uses of g2h(), adds missed memory trace events,
> and correctly recognizes when a SIGSEGV belongs to the guest via
> set_helper_retaddr().
> 
> Fixes: 3e8f1628e864
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/tci.c | 73 +++++++++++++++++++++----------------------------------
>  1 file changed, 28 insertions(+), 45 deletions(-)

Hit that today:

../tcg/tci.c: In function ‘tcg_qemu_tb_exec’:
../tcg/tci.c:379:37: error: passing argument 1 of ‘g2h’ makes pointer
from integer without a cast [-Werror=int-conversion]
  379 | # define qemu_ld_ub      ldub_p(g2h(taddr))
      |                                     ^~~~~
      |                                     |
      |                                     target_ulong {aka unsigned int}
../tcg/tci.c:1034:25: note: in expansion of macro ‘qemu_ld_ub’
 1034 |                 tmp32 = qemu_ld_ub;
      |                         ^~~~~~~~~~
In file included from ../tcg/tci.c:32:
include/exec/cpu_ldst.h:85:35: note: expected ‘CPUState *’ but argument
is of type ‘target_ulong’ {aka ‘unsigned int’}
   85 | static inline void *g2h(CPUState *cs, abi_ptr x)
      |                         ~~~~~~~~~~^~
../tcg/tci.c:379:33: error: too few arguments to function ‘g2h’
  379 | # define qemu_ld_ub      ldub_p(g2h(taddr))
      |                                 ^~~
../tcg/tci.c:1034:25: note: in expansion of macro ‘qemu_ld_ub’
 1034 |                 tmp32 = qemu_ld_ub;
      |                         ^~~~~~~~~~

So:
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

