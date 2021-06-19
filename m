Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD023ADB2B
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 19:45:45 +0200 (CEST)
Received: from localhost ([::1]:50004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luf2O-0000Qk-Hs
	for lists+qemu-devel@lfdr.de; Sat, 19 Jun 2021 13:45:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1luezR-0005lB-QG
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 13:42:41 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:40814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1luezQ-00057u-4S
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 13:42:41 -0400
Received: by mail-wr1-x430.google.com with SMTP id y7so14462357wrh.7
 for <qemu-devel@nongnu.org>; Sat, 19 Jun 2021 10:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Nbb2xmVu2n7S7VB5JWaqGbkR+UDbSO2tyYQeJZOLVng=;
 b=Tdsi147TPEbfyJzvRBljE5fvSqWIrMUIQhLpK5nT1O/GSJnOMxkKRdmYE74zW+lTw1
 VyZKGWGWiEJ5r3meloeMBQx3sr7mpicCHMIA+B61ixN8WvUPJO00u2K+Tet4gz9X2Bop
 TU3peAFyqlKPEUOudzHiPUkxvO8Nx3JYT2SmPv60iHJg57FNZFI268XIwVqpDZwywxKN
 X6KHeyx2iZrMmz88lYJMEYbdCYdd3wJJk/AAQ7ucNGld6l6BTWfC1B3zIwyehpXI7gbJ
 KWsnIM4rM/zgRERkCdWQXdX2NgoWbX0BrtdRAxBIUSCDiSqLGtl46LDze8grbCVnVs9S
 zj6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Nbb2xmVu2n7S7VB5JWaqGbkR+UDbSO2tyYQeJZOLVng=;
 b=r/LoQ1tPbxyhv1652QWtcMHH5iRfUn4bT9tsCoiHUbXwksZh/ILgUbZQqWy2Ox4+qt
 bsnlkfTIiYmm0GuLdBNKrdCrcoIqLqOIIYKdD8yz7m4bQZ9VdPakn8xXClx6kCeCzhm2
 55Sx1aFs/EwK5ELl2zdl6QP39jq5hkuqYRMjH6/X6dDONZXtk2wQHkXZAVWiUv3le4Ey
 T6RMBHVAvoiV646p9Bzkvrb2cA9zpiNSSuNaE0BSyF/04vJqEkDi/bQ9Lz7ssVsFbr56
 27+4mWxShxswj8DTrWaSazsu4SFw6K7Rok1WxDlCtjPa6U35NtRQRNSEvIOSsxOXCK2j
 yHbw==
X-Gm-Message-State: AOAM5305m2kiB0zbqKr8JsL2NnT9GKiBksDt+jop5DBsS+SxKaYURV/7
 oTWIOzPjQVlJB4GS7R+m63NKb6+QviPTIw==
X-Google-Smtp-Source: ABdhPJy4Kyv9Y67ROchpo67qTg6A4nyD++FWJZM3TnyB6hLng1puUylWkeMyP/paeJDmd1NgZkY8Xw==
X-Received: by 2002:a5d:4f8f:: with SMTP id d15mr18380455wru.85.1624124557909; 
 Sat, 19 Jun 2021 10:42:37 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id q11sm12370598wrx.80.2021.06.19.10.42.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 19 Jun 2021 10:42:37 -0700 (PDT)
Subject: Re: [PATCH v7 00/27] TCI fixes and cleanups
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210601150106.12761-1-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <e019e72b-997c-175a-4b03-7d35ddbfe246@amsat.org>
Date: Sat, 19 Jun 2021 19:42:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210601150106.12761-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.202,
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

On 6/1/21 5:00 PM, Richard Henderson wrote:
> Richard Henderson (27):
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
>   Revert "tcg/tci: Use exec/cpu_ldst.h interfaces"
>   tcg/tci: Remove the qemu_ld/st_type macros
>   tcg/tci: Use {set,clear}_helper_retaddr
>   tests/tcg: Increase timeout for TCI

Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

