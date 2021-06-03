Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9D4839A64D
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 18:54:26 +0200 (CEST)
Received: from localhost ([::1]:46142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loqbx-0002dJ-T5
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 12:54:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1loqM3-0006Er-9e
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 12:37:59 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:43653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1loqM1-0006Fd-OS
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 12:37:59 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 l10-20020a17090a150ab0290162974722f2so4221487pja.2
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 09:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=skFqzzu43yKiHGPWqLzS2TIi1Y0w+zX5/VlAyY+6EXc=;
 b=BCmy/++QjU9JhQM0SDIOVEuoW8XAFZ0fq8/7V6Kih7rrj/0X24kLlnwpp6d61mUQ89
 bypxpHQKRPKWo29lzMlinBgvjR5Q1t6D0bBwO/oJ/6oLgBtejgZlMEIY+uRaHbje+ioD
 XPsTtafrxZ7+dsdCr/abcnEy9njdgOXnBX07er7iAUCTWTv0XyThODCjePulIY+mVkU7
 lyzaoE4KWP6M45nDIZEpV+fGQQs+rOg29WORN7/Dx2tDFLle8Aev2CYfG5Tq33ffNgnc
 bROnxm+SfDNWKer85Ko6rc11ZffkLAPyXOdPBx7Gs4MIb2XjIRJKOEiwkIOX/p7QfP4/
 f3aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=skFqzzu43yKiHGPWqLzS2TIi1Y0w+zX5/VlAyY+6EXc=;
 b=Oh0FiHzkPrvuneY5qyvX1bWVlrg7hXFmt9kWvmjWIdQ6ptqRq72TFMOOa6/oQWV2Dg
 UNhf5+XkXHBdFNAJzgWsh4WdkumQ7CkTbeU5fnNnyV1YFRsNc2jMxGDFQYpHazdHvkK9
 UEoxts++cF6u0sSbj8oqocoyjlWkH2CUanoT1eTxhTltatiYd3+Bo0aHlvYeT1e+nNYj
 m8xUKQnxV0VSwsnxnpJ6wzM4EfqX3nGc8W++wBu8CburvHdV3u9O72ksYhlfoe+gP4Fl
 CQchLdvYsdMeO57BUdFKgpJxCBXJGzDxiYTP+xbApziPovRlapoMOnNjounKce8AnqjI
 asPQ==
X-Gm-Message-State: AOAM531smmsCT2kmjQ7RBgr+8IpRmzSzL3DQBRlhOnYnWq6E7JlILYwy
 77QgUEQcFpKlI5k+DdtEXedtKQ==
X-Google-Smtp-Source: ABdhPJwq3B0Iu+uaelrt65SbJzqOxsvl+Wn/TZgGxG+ZhKDUKpKruu5lwcoh8eOSSKYbOdfqeWysAw==
X-Received: by 2002:a17:90a:bd82:: with SMTP id z2mr72646pjr.87.1622738276245; 
 Thu, 03 Jun 2021 09:37:56 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 x13sm3153420pja.3.2021.06.03.09.37.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Jun 2021 09:37:55 -0700 (PDT)
Subject: Re: [PATCH 5/6] target/microblaze: Replace magic values by proper
 definitions
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210603090310.2749892-1-f4bug@amsat.org>
 <20210603090310.2749892-6-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6381fbde-6033-10b3-6ff9-759536e5e0e3@linaro.org>
Date: Thu, 3 Jun 2021 09:37:54 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210603090310.2749892-6-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.603,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/3/21 2:03 AM, Philippe Mathieu-Daudé wrote:
> +        if (access_type == MMU_INST_FETCH) {
> +            env->esr |= ESR_EC_INSN_STORAGE;
> +        } else {
> +           env->esr |= ESR_EC_DATA_STORAGE;
> +        }

indentation is off.

r~

