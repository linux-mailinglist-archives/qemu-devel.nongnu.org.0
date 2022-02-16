Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E7C74B9308
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 22:14:54 +0100 (CET)
Received: from localhost ([::1]:42170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKRdU-000518-OI
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 16:14:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nKRcH-0003J7-Aw
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 16:13:37 -0500
Received: from [2607:f8b0:4864:20::102a] (port=54816
 helo=mail-pj1-x102a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nKRc7-0004KL-8m
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 16:13:29 -0500
Received: by mail-pj1-x102a.google.com with SMTP id b8so3625573pjb.4
 for <qemu-devel@nongnu.org>; Wed, 16 Feb 2022 13:13:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=xuQeJht++CUtJxWRwHJRjxr17AQYDKZHX9npJz3gBRY=;
 b=X+hmItwAhDk0Pe9prnu283GML4nEWCVhHl/YJl8NAN7ZouebL8M4MZRKzG7s9Q/VGX
 MqbK8AyTXdGGLd8YYD6aDZewZwOzFcuPzXocLTluEBpTSAsuDQMfFcBX/MidVcHw6AW6
 pNwdv7Pi4h3qBAnoOV4WZ9OE5SWI0BQgtdp1J7lILFM1AbcxnokzffhjEu+Y/AVqAtMu
 LPIb5oBrZD4727IclQGcfEsltb821Fr/KHKHBD+71vD1zu2RZq+KGVYmwl2WY4gSvbc+
 zYnigUO0IXy4QC6+BnpA65RTnRL0/bAE5TfE91rfGo7n1dHeYYZZL2klWRiuAjnb8wfX
 y+wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=xuQeJht++CUtJxWRwHJRjxr17AQYDKZHX9npJz3gBRY=;
 b=wPNUQ/eLQp2Ag1nNwE1OpUGmuyATkPHhJycnm4CFF93VvBK25elTUS7J7fCJcO7SoW
 Q6GLCnYByhm+ca+wMIaqOAY4cmZ94lez/6GqQcftwpG/zWb3z3qyjISm67oQwQFJ4ziU
 OofpedrYYsvGBUAhyU8YlenmmzRwYOi4qeY5YpcjPhotm0n82q+0ofcja+7mG55RrGDf
 7CqzkG5jvcyK+CKmZgxO70GDDc1ltXjuCknW1bv9FjCdhSg7TEq2KBSKbLZ3QY7Xhw+7
 SsNsucHMmOwHkpp/BFyL22HWSt+gRDGsyMFN6CxpPiVfTxjyzXr2vrrMO/i+93FhdlLQ
 xE3w==
X-Gm-Message-State: AOAM531W5Yi0Cs1hWzDw19Ngp0PVIK6906AueKnkaLNrRrpXqZVmRtOI
 fMnbm8JIaVQAzpGBOxXlxR/kpA==
X-Google-Smtp-Source: ABdhPJyfTDF4fHmYyuJiwlCLMVpKo8ifTTeUWfaUEP2PhCY5ZzOCDId+bEremmD/f/B7iMQmq/n+0w==
X-Received: by 2002:a17:90a:d18a:b0:1b9:c192:23d9 with SMTP id
 fu10-20020a17090ad18a00b001b9c19223d9mr3898796pjb.55.1645046005721; 
 Wed, 16 Feb 2022 13:13:25 -0800 (PST)
Received: from ?IPV6:2001:8003:3669:700:d582:3903:1efa:60e3?
 ([2001:8003:3669:700:d582:3903:1efa:60e3])
 by smtp.gmail.com with ESMTPSA id lx5sm4388pjb.37.2022.02.16.13.13.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Feb 2022 13:13:25 -0800 (PST)
Message-ID: <6786d609-493a-5ff8-aa75-fcaba0259b2b@linaro.org>
Date: Thu, 17 Feb 2022 08:13:20 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] tcg: Add 'signed' bit to typecodes
Content-Language: en-US
To: Keith Packard <keithp@keithp.com>, qemu-devel@nongnu.org
References: <20220216063945.1986257-1-keithp@keithp.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220216063945.1986257-1-keithp@keithp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.978, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/16/22 17:39, Keith Packard wrote:
> Commit 7319d83a (tcg: Combine dh_is_64bit and dh_is_signed to
> dh_typecode) converted the tcg type system to a 3-bit field from two
> separate 1-bit fields. This subtly lost the 'signed' information from
> the types as it uses the dh_alias macro to reduce the types down to
> basic machine types. However, the dh_alias macro also discards sign
> information, aliasing 's32' to 'i32'.

The signed information is still there, merged with the typecode:

#define dh_typecode_void 0
#define dh_typecode_noreturn 0
#define dh_typecode_i32 2
#define dh_typecode_s32 3
#define dh_typecode_i64 4
#define dh_typecode_s64 5
#define dh_typecode_ptr 6

Note that is_signed is bit 0.

But I can see that dh_alias_s32 hides it -- definitely a bug there.



r~

