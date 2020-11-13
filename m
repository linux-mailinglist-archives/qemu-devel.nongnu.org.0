Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 712352B1874
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 10:41:01 +0100 (CET)
Received: from localhost ([::1]:46704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdVZk-00010W-Hi
	for lists+qemu-devel@lfdr.de; Fri, 13 Nov 2020 04:41:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kdVYg-0000an-2q
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 04:39:54 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:44881)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kdVYe-0006vQ-Bi
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 04:39:53 -0500
Received: by mail-wr1-x434.google.com with SMTP id c17so8996743wrc.11
 for <qemu-devel@nongnu.org>; Fri, 13 Nov 2020 01:39:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=l737+8DWYdwzg//7dsOOiaTCGfedQ/0i1b4aCQIFV/s=;
 b=Y5II7gC4ROVFMOMNGzzDeBT0GEqB9ArQUlZyb/qIf35ko1d8lR7JQmLUhJaZJOr4LH
 LoY/nTMX9kZb6jdl64UKYA16lpwK0IzrHwnpwLhl0HafFrC7ZFSp0RSZ3oOJBcSI3hrL
 J5jyv1RbNbGoKHUIe7ooAcnSdUObsChr9JwUjj3vMkeLDewielVCYELk4AVbtZjk4fKt
 8cxTevcyG69bzAejKNPkh7D1fIV0FQ8MbuIg8Mn0OK/HgLkRS7bUUPWso02Q3oatmlbO
 ctIHClINZRV9r/eDKIwS3RzEqtO23TcIrQAAvp4lla2fvpGGeS9/VUgY3ZrYKJ8/3zs+
 CDsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=l737+8DWYdwzg//7dsOOiaTCGfedQ/0i1b4aCQIFV/s=;
 b=M5C+G9nmGG5GZfn26iJr20sLqaQf/5BF+js7QlCOzz3l9OuMMCy+4GiOSW5s+BAOHP
 X3kShBvsbQIeX6wl+1eKzcTjtPsWCcXVBaYzoQpwi5ftSCPDvv+2jxTQRKmi4bqnIDGz
 t9h23BOtJ0rAVuVo2dSKu6pPULB/3gYBJklLuPFnva+PT+EYFTNYIlt1/WqynaBYyUqq
 3NbiYXJR77b50KzcffuuessHUN8vxH73J3rZT2fQRHLuN2P6ijTrL1ob4mvCEt4HFNor
 XrN/IAFg0lGJuenfZ06kMEM8gF4CqKUCzeqngQb2+QSXh7WyWAMgVrasA0JeQ1S4UFLz
 qnJw==
X-Gm-Message-State: AOAM533JBdE7D3eJUnjkaynubMJD5vIVHenIWbCKzTpFPwmerVCF1pRF
 Vbh2yNMINepc6PtoTnskYEo=
X-Google-Smtp-Source: ABdhPJxlO3nBEduJC7PWbsy5hEEIXyPIUG9KSX1tSpMIm60JtgIvewGxOyIhKK8R8vuKQe63S9Yhww==
X-Received: by 2002:adf:de85:: with SMTP id w5mr2350560wrl.90.1605260389736;
 Fri, 13 Nov 2020 01:39:49 -0800 (PST)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id c17sm10215253wro.19.2020.11.13.01.39.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Nov 2020 01:39:48 -0800 (PST)
Subject: Re: [Qemu-devel] [PULL 8/8] target/mips: Preparing for adding MMI
 instructions
To: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>,
 qemu-devel@nongnu.org, Fredrik Noring <noring@nocrew.org>
References: <1551276045-19143-1-git-send-email-aleksandar.markovic@rt-rk.com>
 <1551276045-19143-9-git-send-email-aleksandar.markovic@rt-rk.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <8c3ac05a-91d4-6830-4ede-6574aca8af94@amsat.org>
Date: Fri, 13 Nov 2020 10:39:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <1551276045-19143-9-git-send-email-aleksandar.markovic@rt-rk.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: peter.maydell@linaro.org, amarkovic@wavecomp.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Mateja,

(Cc'ing Fredrik)

On 2/27/19 3:00 PM, Aleksandar Markovic wrote:
> From: Mateja Marjanovic <Mateja.Marjanovic@rt-rk.com>
> 
> Set up MMI code to be compiled only for TARGET_MIPS64. This is
> needed so that GPRs are 64 bit, and combined with MMI registers,
> they will form full 128 bit registers.
> 
> Signed-off-by: Mateja Marjanovic <mateja.marjanovic@rt-rk.com>
> Signed-off-by: Aleksandar Markovic <amarkovic@wavecomp.com>
> Reviewed-by: Aleksandar Rikalo <arikalo@wavecomp.com>
> Message-Id: <1551183797-13570-2-git-send-email-mateja.marjanovic@rt-rk.com>
> ---
>  target/mips/translate.c | 43 +++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 41 insertions(+), 2 deletions(-)
...

>  static void decode_opc_special3(CPUMIPSState *env, DisasContext *ctx)
>  {
>      int rs, rt, rd, sa;
> @@ -28796,10 +28828,11 @@ static void decode_opc(CPUMIPSState *env, DisasContext *ctx)
>          decode_opc_special(env, ctx);
>          break;
>      case OPC_SPECIAL2:
> +#if defined(TARGET_MIPS64)
>          if ((ctx->insn_flags & INSN_R5900) && (ctx->insn_flags & ASE_MMI)) {
>              decode_mmi(env, ctx);

This change is incorrect, you removed support for the
MADD[U] and MULT[U] instructions on TXx9 32-bit targets
(TX79 still works).

> -#if !defined(TARGET_MIPS64)
> -        } else if (ctx->insn_flags & ASE_MXU) {
> +#else
> +        if (ctx->insn_flags & ASE_MXU) {
>              decode_opc_mxu(env, ctx);
>  #endif
...

