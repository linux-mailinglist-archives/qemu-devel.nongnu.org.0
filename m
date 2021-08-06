Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A1873E30AE
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 23:10:34 +0200 (CEST)
Received: from localhost ([::1]:52866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mC76v-0005GR-5s
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 17:10:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mC75t-0003tr-Fp
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 17:09:29 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:37831)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mC75s-0002BP-2c
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 17:09:29 -0400
Received: by mail-wr1-x42a.google.com with SMTP id d8so12645334wrm.4
 for <qemu-devel@nongnu.org>; Fri, 06 Aug 2021 14:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ZVq6P7e+I8GtOWeSizQeinrRKOoCLLzM+pREwKrKbds=;
 b=ji7+9pbMxKqr+7lELi2HQcRwMViUGpKoXpdTOBvXDdVK/5nm+HrgfCXGhgZaMD+SIR
 YKB0TUECZEMoX9BHp4zne5OuCxsa4F0SXGxpN6RcTt7PerfSUkYHydl0MLgYtCptysKS
 GcFKfCnuRtoN8uFeMYWBg0Admm2AoQVE6J8f2uIB+MtbrJNi+lC6DmP64diQDx1CSbaf
 IGrbWlPDVOzQR4x7ISEba7Zpb9w/NYYj/BZcm6OUrL/KZRbioiurO9USFY0xbHWw4+M9
 M+JqQOwnKSfis+Spp+p892EqzjFi/hZx9923y4NG8W6iTAcIcmz3wPnXF2CSc0MApOfG
 UaxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZVq6P7e+I8GtOWeSizQeinrRKOoCLLzM+pREwKrKbds=;
 b=KzGiOQ9I/dM6B9vMa0w2rcT1Q6np4EIyabCgNeF4nVgOMpfVO2ogduKtQN1TOb/S0+
 V1VV4V/MIah1OQ3/PzCBHi0k2UeEP2vLcmXcnOZRlqd6bdMz4pVo54e0otEfZ9u+Th+Z
 gVEiVSxqnTMbA4a7N5DLnWThhaJTHNY5LDCaGIcXQLqTPT8y9Gw/pLun2ZmTx+82U39K
 SxKHODkNAAWFdP9v27/d38ngg0lgAwvaPxYhmSrDRt6WiWv9bjLO+EXgyrK7xotBE0R/
 adqQJnDphJzVPCxtEOSzWLDKn+jUAhc1Hb/DfYpZc9Yeed0ZA1FYLarTt2yJRJYwztls
 nd0g==
X-Gm-Message-State: AOAM532eG1McX5vW4zPVebzFSO62mrSx7wEOUN7qYZ/dB1enTFem+SPY
 BVMGSRR6fQayyHgOovMgkhI=
X-Google-Smtp-Source: ABdhPJwrtf4qYu1sO4GgI7aFYB8gZww7tcmJb53ZfHRZL01w/KmiSm7/aK964acBkvANYBf/Nm4hNA==
X-Received: by 2002:adf:f707:: with SMTP id r7mr12372409wrp.175.1628284166766; 
 Fri, 06 Aug 2021 14:09:26 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id m64sm11481793wmm.41.2021.08.06.14.09.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Aug 2021 14:09:26 -0700 (PDT)
Subject: Re: [PATCH] target/mips: Remove JR opcode unused arguments
To: qemu-devel@nongnu.org
References: <20210730225507.2642827-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <97f3de74-212e-72bd-ec07-3ae9e8312a8c@amsat.org>
Date: Fri, 6 Aug 2021 23:09:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210730225507.2642827-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-2.619,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/31/21 12:55 AM, Philippe Mathieu-Daudé wrote:
> JR opcode (Jump Register) only takes 1 argument, $rs.
> JALR (Jump And Link Register) takes 3: $rs, $rd and $hint.
> 
> Commit 6af0bf9c7c3 added their processing into decode_opc() as:
> 
>     case 0x08 ... 0x09: /* Jumps */
>         gen_compute_branch(ctx, op1 | EXT_SPECIAL, rs, rd, sa);
> 
> having both opcodes handled in the same function: gen_compute_branch.
> 
> Per JR encoding, both $rd and $hint ('sa') are decoded as zero.
> 
> Later this code got extracted to decode_opc_special(),
> commit 7a387fffce5 used definitions instead of magic values:
> 
>     case OPC_JR ... OPC_JALR:
>         gen_compute_branch(ctx, op1, rs, rd, sa);
> 
> Finally commit 0aefa33318b moved OPC_JR out of decode_opc_special,
> to a new 'decode_opc_special_legacy' function:
> 
>   @@ -15851,6 +15851,9 @@ static void decode_opc_special_legacy(CPUMIPSState *env, DisasContext *ctx)
>   +    case OPC_JR:
>   +        gen_compute_branch(ctx, op1, 4, rs, rd, sa);
>   +        break;
> 
>   @@ -15933,7 +15936,7 @@ static void decode_opc_special(CPUMIPSState *env, DisasContext *ctx)
>   -    case OPC_JR ... OPC_JALR:
>   +    case OPC_JALR:
>            gen_compute_branch(ctx, op1, 4, rs, rd, sa);
>            break;
> 
> Since JR is now handled individually, it is pointless to decode
> and pass it unused arguments. Replace them by simple zero value
> to avoid confusion with this opcode.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/tcg/translate.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Thanks, applied to mips-next.

