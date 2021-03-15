Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 234BC33C97E
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 23:45:17 +0100 (CET)
Received: from localhost ([::1]:60004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLvxc-0003iF-5u
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 18:45:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lLvwS-0003H4-Si
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 18:44:04 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:51139)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lLvwR-0007QA-3A
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 18:44:04 -0400
Received: by mail-wm1-x32e.google.com with SMTP id g25so9024938wmh.0
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 15:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=no9OjpTG1g4p4lsYgtKm24tmYkx6YWnUZH/z4t7HBOM=;
 b=qJydv0/CTtkbN0jX2jCBmnCo/1WbyvqeJu5N1nO8cKjTA8SLBlVv3ZJbUtkuBfoJ4H
 pIQ/vaK9GH8UVAJQ4wkonSESF/jutZPd5Lk9U1NTs+5x6UFF8V6FnAwvB5PDMGwQ6ZHJ
 2XzAbAQz2QuNbt3poKh5UxX5euqctFmA9A0v4m7QbV0Gj1H+oHZhKQSZXI6cSWy/b/Fi
 Hdnb5EWgd5QxUJw5AK6P4ukYFDz8EmtpcIrngIDImYN6RtQBmr02s5n9n9SYkAXuls/E
 VKt7Ey6rmd0jCI1bAq5aeaoAe6e0nBVIb5a2o9otqzcq/A+skGUQc9sTZnXlbkk4Ip8T
 wl8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=no9OjpTG1g4p4lsYgtKm24tmYkx6YWnUZH/z4t7HBOM=;
 b=Ue5DrP7ZPpOAvjj1e+D0qvtdrsLAOHGzKpndyXYWvgJST7w6cy4kXMA5UQjaAxHOzV
 ejv9oghj9AdgXIJGhOB6aYpTh3R1SdxxV9/S7pKh3xzapw4K3W+HFgfdO3+bEDVT0UfW
 4NT5656MbzmUbFZwXBQdqZxFonOjngFDDxGkokgafjPnhUvbrknPssR/+Cs6/0OmqMl7
 b2ZJ7wZJux9id4LvnOHQO1zYgo1iBjSZUpdPMlEPs/g7aFng3dCn8+VmvRnmOg/IPne9
 3/a2yLLEucD5OF/5LbflDnZ0fTCuotEXraDG5CMjGDUKaNSTrW1phAirGQdpFF8Op/G8
 ZPMA==
X-Gm-Message-State: AOAM533vsMTGPpze8cQhbJUJpirS9sgHw3bWd5saR3QCVbQY9iTBV8yz
 1h7G13trCoD5xRQJvqoGjpY=
X-Google-Smtp-Source: ABdhPJxw9EFPouaOtbvwoHpkwplvrr4vo3xr1lcseQusUWYlCdUEq832RYK6lk0AdpW86BVV1hIbaw==
X-Received: by 2002:a05:600c:b57:: with SMTP id
 k23mr1661652wmr.145.1615848241824; 
 Mon, 15 Mar 2021 15:44:01 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id j9sm1073187wmi.24.2021.03.15.15.44.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Mar 2021 15:44:00 -0700 (PDT)
Subject: Re: [PULL 18/27] target/mips: Extract MXU code to new mxu_translate.c
 file
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210313194829.2193621-1-f4bug@amsat.org>
 <20210313194829.2193621-19-f4bug@amsat.org>
 <CAFEAcA-LtcZCUo1Vu2fVCJRqR99117ewFTZAePuYc-wrTGe2XA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <0fc23e4c-77d6-2528-b424-9998c9d8abbb@amsat.org>
Date: Mon, 15 Mar 2021 23:43:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-LtcZCUo1Vu2fVCJRqR99117ewFTZAePuYc-wrTGe2XA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/15/21 10:33 PM, Peter Maydell wrote:
> On Sat, 13 Mar 2021 at 19:58, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>
>> Extract 1600+ lines from the big translate.c into a new file.
>>
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> 
> This code motion caused Coverity to rescan this code, and
> it thinks there's a problem in this function (CID 1450831).
> It looks to me like it might be right...

Oops, our mails crossed :)

I wonder if this is a simple rescan or if target/mips/translate.c
is too big and Coverity bails out on it by timeout (this is what
Coccinelle does). Now the extracted code could finally get processed.

>> +/*
>> + *  D16MAX
>> + *    Update XRa with the 16-bit-wise maximums of signed integers
>> + *    contained in XRb and XRc.
>> + *
>> + *  D16MIN
>> + *    Update XRa with the 16-bit-wise minimums of signed integers
>> + *    contained in XRb and XRc.
>> + */
>> +static void gen_mxu_D16MAX_D16MIN(DisasContext *ctx)
>> +{
>> +    uint32_t pad, opc, XRc, XRb, XRa;
>> +
>> +    pad = extract32(ctx->opcode, 21, 5);
>> +    opc = extract32(ctx->opcode, 18, 3);
>> +    XRc = extract32(ctx->opcode, 14, 4);
>> +    XRb = extract32(ctx->opcode, 10, 4);
>> +    XRa = extract32(ctx->opcode,  6, 4);
>> +
>> +    if (unlikely(pad != 0)) {
>> +        /* opcode padding incorrect -> do nothing */
>> +    } else if (unlikely(XRc == 0)) {
>> +        /* destination is zero register -> do nothing */
>> +    } else if (unlikely((XRb == 0) && (XRa == 0))) {
>> +        /* both operands zero registers -> just set destination to zero */
>> +        tcg_gen_movi_i32(mxu_gpr[XRc - 1], 0);
>> +    } else if (unlikely((XRb == 0) || (XRa == 0))) {
> 
> In this block of code either XRb or XRa is zero...
> 
>> +        /* exactly one operand is zero register - find which one is not...*/
>> +        uint32_t XRx = XRb ? XRb : XRc;
>> +        /* ...and do half-word-wise max/min with one operand 0 */
>> +        TCGv_i32 t0 = tcg_temp_new();
>> +        TCGv_i32 t1 = tcg_const_i32(0);
>> +
>> +        /* the left half-word first */
>> +        tcg_gen_andi_i32(t0, mxu_gpr[XRx - 1], 0xFFFF0000);
>> +        if (opc == OPC_MXU_D16MAX) {
>> +            tcg_gen_smax_i32(mxu_gpr[XRa - 1], t0, t1);
>> +        } else {
>> +            tcg_gen_smin_i32(mxu_gpr[XRa - 1], t0, t1);
>> +        }
> 
> but in these smax/smin calls we're clearly assuming that
> XRa is not zero.
> 
> There seems to be some confusion over which registers are
> the inputs and which is the output. The top-level function
> comment says XRa is the input and XRb/XRc the inputs.
> But the "destination is zero register" comment is against
> a check on XRc, and the "both operands zero" comment is
> against a check on XRa and XRb, as is the "one operand
> is zero" comment...
> 
>> +/*
>> + *  Q8MAX
>> + *    Update XRa with the 8-bit-wise maximums of signed integers
>> + *    contained in XRb and XRc.
>> + *
>> + *  Q8MIN
>> + *    Update XRa with the 8-bit-wise minimums of signed integers
>> + *    contained in XRb and XRc.
>> + */
>> +static void gen_mxu_Q8MAX_Q8MIN(DisasContext *ctx)
>> +{
>> +    uint32_t pad, opc, XRc, XRb, XRa;
>> +
>> +    pad = extract32(ctx->opcode, 21, 5);
>> +    opc = extract32(ctx->opcode, 18, 3);
>> +    XRc = extract32(ctx->opcode, 14, 4);
>> +    XRb = extract32(ctx->opcode, 10, 4);
>> +    XRa = extract32(ctx->opcode,  6, 4);
>> +
>> +    if (unlikely(pad != 0)) {
>> +        /* opcode padding incorrect -> do nothing */
>> +    } else if (unlikely(XRa == 0)) {
>> +        /* destination is zero register -> do nothing */
>> +    } else if (unlikely((XRb == 0) && (XRc == 0))) {
>> +        /* both operands zero registers -> just set destination to zero */
>> +        tcg_gen_movi_i32(mxu_gpr[XRa - 1], 0);
>> +    } else if (unlikely((XRb == 0) || (XRc == 0))) {
>> +        /* exactly one operand is zero register - make it be the first...*/
>> +        uint32_t XRx = XRb ? XRb : XRc;
> 
> Contrast this function, where the code and the comments are
> all in agreement that XRa is destination and XRb/XRc inputs.

Yes, from the spec XRa is the destination register, XRb/XRc are
the compared inputs. Unfortunately I couldn't sort the function
body code so I ended rewriting it.

Regards,

Phil.


