Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C1F15A0503
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Aug 2022 02:14:30 +0200 (CEST)
Received: from localhost ([::1]:46240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oR0Vx-0000vZ-5x
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 20:14:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oR0UQ-0007r0-CQ
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 20:12:54 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:37495)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oR0UO-0005Yd-Em
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 20:12:53 -0400
Received: by mail-pf1-x42c.google.com with SMTP id x15so17177912pfp.4
 for <qemu-devel@nongnu.org>; Wed, 24 Aug 2022 17:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=8T9FA9Qaf5mx385CQPypr9D3SNmB30jY+acztVOMh9A=;
 b=z0ks+D9GI1M0DZgneMHfpPGLEp6SbkSwZ4fictRIUhoeZX173UtYj9sNRy/A+CERiX
 OJylRd9/w0P16+IPi/c+vHE8SQG/imZynVen0aEcB0jslkzgl7pz/vVJ7MfkcsdVFGwQ
 YnmaGE+L4LsnoZbebwAeMF9SKXABqtCZgSbNfbjNSzdTRsqHtj0NEEN9NFza1ET+D4kO
 OMgVc3Nq0uyb8Qf4goXMZi/V/ZlbdIBF2C/X68X69BG1hwaIYNVJ7QWF4CXHT/pERsVM
 BZ0jaZqV8qt/bO/YoGS9jdxtI0+zM+AC1hRPmzMB+Z3x39wrg4MmIsJ6VB87+Bml5hQp
 j9UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=8T9FA9Qaf5mx385CQPypr9D3SNmB30jY+acztVOMh9A=;
 b=CznQmhch7RDwLpF+ENLZjEXr/fsrTkNOl/c1odVil3KbmstX5hl/efVwhYbAmNcEJn
 aM8jFfpgvuSD5Z1p9BnFg1taD/PphxhS2eLWbpHtMch0h1SYXENIdy95pXHjdnMBav9s
 AsHmbbNI5IT0Jjms6aYFNZxpEJ6i2bFbwSGsCfT7/W288FSFyKV/RHx9brrg55M+eJZ/
 299MB7XXARNqomYcglRcV1Ot9fxuMFj64HKJweoQPW5nqWnvoPf+/0F/NWCu4c7PcpG5
 WOWyxs5uD7I/V1cQR5T1yt2m8kq6F5kNor4yhDfenY0KRNyXHnrjze41/ieOuBXBsgc6
 S86w==
X-Gm-Message-State: ACgBeo1EBzP8ukQTRayEaQkukltJPgvFCC3kwQKewEuESaAKB2QT0UtH
 RXgWOxxLFJrsLxDdNL+8fVslBA==
X-Google-Smtp-Source: AA6agR4wGuSRudmBHj5Jharks+tYEKRFEUN6eZxpTVmqauMets8C4jx62BDGjHtLDp3ar0xmHubX/Q==
X-Received: by 2002:a05:6a00:2387:b0:52f:17a0:628c with SMTP id
 f7-20020a056a00238700b0052f17a0628cmr1206517pfc.17.1661386370809; 
 Wed, 24 Aug 2022 17:12:50 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:944b:63b7:13bc:4d26?
 ([2602:47:d49d:ec01:944b:63b7:13bc:4d26])
 by smtp.gmail.com with ESMTPSA id
 w185-20020a6230c2000000b0052ac12e7596sm13538814pfw.114.2022.08.24.17.12.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Aug 2022 17:12:50 -0700 (PDT)
Message-ID: <a6d65d8c-d864-0479-8d82-1fe24f03016f@linaro.org>
Date: Wed, 24 Aug 2022 17:12:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 03/17] target/i386: add core of new i386 decoder
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: paul@nowt.org
References: <20220824173123.232018-1-pbonzini@redhat.com>
 <20220824173123.232018-4-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220824173123.232018-4-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 8/24/22 10:31, Paolo Bonzini wrote:
> +static X86OpEntry A4_00_F7[16][8] = {

const.  Especially for the big tables, but really for anything static that you can get 
away with.

> +static void decode_threebyte_38(DisasContext *s, CPUX86State *env, X86OpEntry *entry, uint8_t *b)
> +{
> +    *b = x86_ldub_code(env, s);
> +    if (!(*b & 8)) {
> +        *entry = A4_00_F7[*b >> 4][*b & 7];
> +    } else {
> +        *entry = A4_08_FF[*b >> 4][*b & 7];
> +    }
> +}

I'm not keen on the split table.
Surely it would be just as readable as

static const X86OpEntry onebyte[256] = {
     /*
      * Table A-2: One-byte Opcode Map: 00H — F7H
      */
     [0x00] = X86_OP_ENTRY2(ADD, E,b, G,b),

     [0x01] = X86_OP_ENTRY2(ADD, E,v, G,v),

     ...
     [0x10] = X86_OP_ENTRY2(ADC, E,b, G,b),
     [0x11] = X86_OP_ENTRY2(ADC, E,v, G,v),
     ...

     /*
      * Table A-2: One-byte Opcode Map: 08H - FFH
      */
     [0x08] = X86_OP_ENTRY2(OR, E,b, G,b),

     [0x09] = X86_OP_ENTRY2(OR, E,v, G,v),

     ...
     [0x0F] = { .decode = decode_twobyte, .is_decode = true },
     ...

};

> +static MemOp decode_op_size(DisasContext *s, X86OpSize size)
> +{
> +    switch (size) {
> +    case X86_SIZE_b:  /* byte */
> +        return MO_8;
> +
> +    case X86_SIZE_c:  /* 16/32-bit, based on operand size */
> +        return s->dflag == MO_64 ? MO_32 : s->dflag;

Should be 8/16.

> +static void decode_op(DisasContext *s, CPUX86State *env, X86DecodedInsn *decode,
> +                      X86DecodedOp *op, X86OpType type, int b)
> +{
> +    int modrm;
> +
> +    switch (type) {
> +    case X86_TYPE_A:  /* Implicit */
> +    case X86_TYPE_F:  /* EFLAGS/RFLAGS */
> +        break;
> +
> +    case X86_TYPE_B:  /* VEX.vvvv selects a GPR */
> +        op->alu_op_type = X86_ALU_GPR;
> +        op->n = s->vex_v;
> +        break;

Validate vex prefix present, or is it intended to happen elsewhere?

> +
> +    case X86_TYPE_C:  /* REG in the modrm byte selects a control register */) | REX_R(s);

Cut error, before ).


r~

