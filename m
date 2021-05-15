Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8744B381826
	for <lists+qemu-devel@lfdr.de>; Sat, 15 May 2021 13:06:58 +0200 (CEST)
Received: from localhost ([::1]:54534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhs8H-0001vH-Lg
	for lists+qemu-devel@lfdr.de; Sat, 15 May 2021 07:06:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lhs3V-0003jm-WD
 for qemu-devel@nongnu.org; Sat, 15 May 2021 07:02:03 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:33687)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lhs3U-0000xS-Ek
 for qemu-devel@nongnu.org; Sat, 15 May 2021 07:02:01 -0400
Received: by mail-wr1-x431.google.com with SMTP id n2so1667120wrm.0
 for <qemu-devel@nongnu.org>; Sat, 15 May 2021 04:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=fyEUX+aRqjxAWaxLXlW2hFq4sRVvQHbRpYEeXvMJsh4=;
 b=LPxbmhzzsh6W4Tz9qaRPKTkaO0clQdGJE8OmGSlmSlebNaMMLcP2XiE2PB6a2/Wy9E
 4Qis5przEswXMJfmTJpOGK35cpOcX7rUKdUWAIqKQJhAFQu1WES2NoSSW3ImwqLXhQnY
 hQPIEtkiyF7E3MJs9EuYpXAGeEWGUdew8aNu0pwnVIkXrZMhWbIKox332nJQt5YWpQ6K
 yP2ejabMJt8XQdBOptzFaN8UEajMiTr6Gup08vT/wLBwBJLdN4Gs6BHk7ASu3d/7bQ8L
 97Re/HqYsuwrdtxzej4+FGVaP4wc39EEEcIFUWvWBD2fm0phLbTEpw2mkWu3yYoBLrN1
 m92Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fyEUX+aRqjxAWaxLXlW2hFq4sRVvQHbRpYEeXvMJsh4=;
 b=cZL/jlWokgagZ1iCMv0XSvuMkoPXz6oMbxYNGsE3+PHqCwISccAlhkqPDgn3Jp2B7m
 3flAu0mgmzM80Iu2kQAk7ZzoR0MUe17awmNUH/v8T+UUEl1N1MyyJlsNgzpxmS8X6kj7
 IKO6a+d4SjM/d+fHPtBnsGQuJFmmSRwvS69E4qqACQBV/V64+lsML0euQo2PlQO52hm7
 YorWR1tYOarPDeqBMBtSoH6H9EIADDkZRwC5T5KEL3KeT1jbkv1td8+S4aY/pttgTg/f
 fJ27z12C5TxyJm5NiSvTjUMogZKrAJqvKbukNR5DxMFcuqIIg9hNBApPKDLp/YGo+GMA
 8UXQ==
X-Gm-Message-State: AOAM531zRWyNjOjN15cyOjxoNSm+K7R4KaAghd2awPksn8gzbBNuyN3M
 fNWYw2QeFDp+FLiEeUcDaezGVHFnr5OMMg==
X-Google-Smtp-Source: ABdhPJwPEB2MQ0zIkfFrikv0eMryjXDmG2eJtfDZt0pdCpRfsPYljhqzJa2gMAUXDUmrSmGRZ31y1g==
X-Received: by 2002:adf:ce09:: with SMTP id p9mr18692735wrn.114.1621076518525; 
 Sat, 15 May 2021 04:01:58 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id t8sm7601076wmb.2.2021.05.15.04.01.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 15 May 2021 04:01:58 -0700 (PDT)
Subject: Re: [PATCH v6 00/26] TCI fixes and cleanups
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210502235727.1979457-1-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <e6500e9b-e715-0016-440f-574e15c37a65@amsat.org>
Date: Sat, 15 May 2021 13:01:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210502235727.1979457-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/3/21 1:57 AM, Richard Henderson wrote:
> Richard Henderson (26):
>   tcg: Combine dh_is_64bit and dh_is_signed to dh_typecode
>   tcg: Add tcg_call_flags
>   accel/tcg/plugin-gen: Drop inline markers
>   plugins: Drop tcg_flags from struct qemu_plugin_dyn_cb
>   accel/tcg: Add tcg call flags to plugins helpers
>   tcg: Store the TCGHelperInfo in the TCGOp for call
>   tcg: Add tcg_call_func
>   tcg: Build ffi data structures for helpers
>   tcg/tci: Improve tcg_target_call_clobber_regs
>   tcg/tci: Move call-return regs to end of tcg_target_reg_alloc_order
>   tcg/tci: Use ffi for calls
>   tcg/tci: Reserve r13 for a temporary
>   tcg/tci: Emit setcond before brcond
>   tcg/tci: Remove tci_write_reg
>   tcg/tci: Change encoding to uint32_t units
>   tcg/tci: Implement goto_ptr
>   tcg/tci: Implement movcond
>   tcg/tci: Implement andc, orc, eqv, nand, nor
>   tcg/tci: Implement extract, sextract
>   tcg/tci: Implement clz, ctz, ctpop
>   tcg/tci: Implement mulu2, muls2
>   tcg/tci: Implement add2, sub2
>   tcg/tci: Split out tci_qemu_ld, tci_qemu_st

Patches 1 to 23:
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
(using parisc host).

