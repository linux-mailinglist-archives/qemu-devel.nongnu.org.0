Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F21DB5457BD
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 01:02:54 +0200 (CEST)
Received: from localhost ([::1]:49456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzRAz-0006gN-JJ
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 19:02:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nzR7F-0005eY-Vh
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 18:59:03 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:40769)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nzR7E-0006ak-B2
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 18:59:01 -0400
Received: by mail-pg1-x52d.google.com with SMTP id f65so12965815pgc.7
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 15:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=OUk6EXX/Zs7xZIPdALEzfp1X2IAIBxIjbyPqS7rOwJQ=;
 b=b53rAlY6510RkXlKsQgId2LP7O/uvQAH39PHfDGe5tajTM9OUnEdwqiHrILMM7ivQ9
 3N/xVhRzVtshQQwLUnH3lDFQT9FPZtC174EDH39RDgb53W9m2tgYosvcGOMIecroquQk
 iZ6Mh5YfTDTozud4Z80y6vx6OqYnlymA6bVf2kKwuCg6d0CAHdeFajk00EhPItkJVf/G
 dsa2r0xbYJnLtS+BW3MCIorthTUSkW29HDULM8Sx88gIyOMk5QGS83rYkMmUO9qRsjOP
 oY9BSEyoDw2BjbaFVMdJSg65LkTpSanEtZzeF2xZbh7umUZBcA7NJetdFEuqkJNpQcAQ
 bC+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=OUk6EXX/Zs7xZIPdALEzfp1X2IAIBxIjbyPqS7rOwJQ=;
 b=tBdP1xJ+igDjuaXhQtR4a4qwXe9PIB8Cs8cHa8O45P2c5b3Rm5tKGIdWjmShmmjyGB
 5Gmpk3GE1aRb7XZRKGcFHRQvqMZXJH0mpnSKbF6LvtNz13ddFmp5vzrA75zN3nM4BUhZ
 4lbjXB7aI73PtcBqtbFS9T5AIX9aLkKAzfyHoadUxhc7lsOqIUJnEI+EHqClTRJFYO2R
 v7hVpwrFkbmU/TQ2EmXW4EkNnR3M3Gw2QPGdn59a7Q0Sd9gE/oJrVnvldlm9kNqQQKIk
 0H0qgmslMdL2MLZng2f978hV6KK1rObov19ntiAqTO7YNfo5BmrCkTnmVDo8YLx1JEJU
 ntRw==
X-Gm-Message-State: AOAM5324Dg/WKod6HbdMbg/w7gMOO7cPb6I1PpDsa3XOlMHExuIwnua8
 QAT5JQKC5VLh9Sf8OLSdrOe7qA==
X-Google-Smtp-Source: ABdhPJzHypXbFSVcZ90iIeC3xQbSshVRypM69WoF1OiPda/XoSohFpIPq1GX7eSphEgrX4/nzQ1Icw==
X-Received: by 2002:a65:6bd3:0:b0:3fd:63c3:a84b with SMTP id
 e19-20020a656bd3000000b003fd63c3a84bmr25254780pgw.572.1654815538596; 
 Thu, 09 Jun 2022 15:58:58 -0700 (PDT)
Received: from ?IPV6:2602:ae:1547:e101:839f:476f:678:38a?
 ([2602:ae:1547:e101:839f:476f:678:38a])
 by smtp.gmail.com with ESMTPSA id
 s11-20020a170902a50b00b001661f9ada6dsm17125335plq.143.2022.06.09.15.58.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jun 2022 15:58:57 -0700 (PDT)
Message-ID: <7404df97-1116-2c13-4c86-f327cda96eb7@linaro.org>
Date: Thu, 9 Jun 2022 15:58:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 41/71] target/arm: Add infrastructure for disas_sme
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20220607203306.657998-1-richard.henderson@linaro.org>
 <20220607203306.657998-42-richard.henderson@linaro.org>
 <CAFEAcA9jEYarLY_srx8bo5EUhW5+-pP_3pcbv+H4MomYve25ZQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA9jEYarLY_srx8bo5EUhW5+-pP_3pcbv+H4MomYve25ZQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 6/9/22 08:35, Peter Maydell wrote:
>> +        if (!disas_sme(s, insn)) {
>> +            unallocated_encoding(s);
>> +        }
>> +        break;
> 
> I still think we should check bit 31 here.

We don't do anything similar over in a32, where we've done the full conversion:

         if (disas_a32_uncond(s, insn) ||

             disas_vfp_uncond(s, insn) ||

             disas_neon_dp(s, insn) ||

             disas_neon_ls(s, insn) ||

             disas_neon_shared(s, insn)) {

             return;

         }


and there's nothing else within major opcode 0 to conflict.

But if you insist, ok.


r~

