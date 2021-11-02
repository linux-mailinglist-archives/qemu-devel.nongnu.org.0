Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A043B442E89
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 13:54:55 +0100 (CET)
Received: from localhost ([::1]:52850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhtJW-000374-C7
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 08:54:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mht2A-0007qi-Dy
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 08:36:58 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:39765)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mht28-000336-GN
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 08:36:57 -0400
Received: by mail-wr1-x42b.google.com with SMTP id d27so15104297wrb.6
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 05:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Q/XJQis/pXFtokI6z4pAKNn1LL3SVho7cK/FvkNFRuo=;
 b=MYFgJ5dgBzqnZEKi4WFp+Av0nmjC7+tek9BUq7NA/waa4jgei07KzplcEY+hO7e7QA
 YNXf8NpBd0qrsvI7HYN7pVSFeEol2ke56Y6ZU4tS7m8iPvhiFD+2s7K2+GJrRUkiZCJv
 K7bU782E0C4ElVWiUF060fwJT/EZHimPwwojb26Xa6SLBgB4iqaXMtdaOj6xH4Z+wsu6
 KwFbIwMSqGwQn8fTFN72XPIsEPC7TlFAZBfyTE2KMH65nKYoAwR2HmG++f5UpeYrCpTC
 719azQVaLoLSqfMHhUOx/XOjkYQsPBQJU3bgkkdtkHimAEqbXFtuISKdN55VtEFtG9uS
 0/fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Q/XJQis/pXFtokI6z4pAKNn1LL3SVho7cK/FvkNFRuo=;
 b=cEDhPVJ/T5ZyM8OU4vFO3uy7prwfk3o08ldTJ6oYFT9mg7uaUuSSkV4K+b0tPUAQEm
 WyG/+VoB7nb02wAy2O9VKuNyY0BjLnbTwotbi1gZooMZhwjmKncTQg95c0CjsW8lJSQb
 1i0nBNNvSVG60TRxJhC15O7LY3mJvyFph9tZPZCI9BzkhIVILjewtvgkwI5zfBzqNWGL
 /Qtbp31RBES6XQzC337JVeBdwSyyWseZB3cMflfBQXMWwtnhoW9dp4DyjtsqWS4kHoI8
 tNSXKk7oCJYGqac6NMdfcszLuUZ5nZX4sen+n6+8P8TkySyN/8FM4P2d5JDTMxonOWKb
 1Imw==
X-Gm-Message-State: AOAM532axVhq4jNJkQE8bh6VxKHzF4YZvYdnUohDtWR+yrcyehfx8Y78
 xrGzosleJu7+UHhJ3K8/zE94U5JVaow=
X-Google-Smtp-Source: ABdhPJxNbH43N1YuD7yLhIocyw4nXkOOAnRTCKAqqNk9CVBDUjs7SQjBTVVbY4ot5Dbp9SpAQTN/Xw==
X-Received: by 2002:adf:8293:: with SMTP id 19mr25444222wrc.167.1635856613517; 
 Tue, 02 Nov 2021 05:36:53 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id w1sm2378866wmc.19.2021.11.02.05.36.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Nov 2021 05:36:53 -0700 (PDT)
Message-ID: <c5edc554-9392-0416-dc4b-919dba5e7999@amsat.org>
Date: Tue, 2 Nov 2021 13:36:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v3 00/32] target/mips: Fully convert MSA opcodes to
 decodetree
Content-Language: en-US
To: qemu-devel@nongnu.org
References: <20211028210843.2120802-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211028210843.2120802-1-f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-2.549,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/28/21 23:08, Philippe Mathieu-Daudé wrote:

> This series converts 2000+ lines of switch() code to decodetree
> description, so this hard-to-review/modify switch is auto generated
> by the decodetree script. This is a big win for maintenance (and
> indeed the convertion revealed 2 bugs).

> Philippe Mathieu-Daudé (32):
>   target/mips: Fix MSA MADDV.B opcode
>   target/mips: Fix MSA MSUBV.B opcode
>   tests/tcg/mips: Run MSA opcodes tests on user-mode emulation

All patches except #3 (the user-mode tests) queued to mips-next.

>   target/mips: Use dup_const() to simplify
>   target/mips: Have check_msa_access() return a boolean
>   target/mips: Use enum definitions from CPUMIPSMSADataFormat enum
>   target/mips: Rename sa16 -> sa, bz_df -> bz -> bz_v
>   target/mips: Convert MSA LDI opcode to decodetree
>   target/mips: Convert MSA I5 instruction format to decodetree
>   target/mips: Convert MSA BIT instruction format to decodetree
>   target/mips: Convert MSA SHF opcode to decodetree
>   target/mips: Convert MSA I8 instruction format to decodetree
>   target/mips: Convert MSA load/store instruction format to decodetree
>   target/mips: Convert MSA 2RF instruction format to decodetree
>   target/mips: Convert MSA FILL opcode to decodetree
>   target/mips: Convert MSA 2R instruction format to decodetree
>   target/mips: Convert MSA VEC instruction format to decodetree
>   target/mips: Convert MSA 3RF instruction format to decodetree
>     (DF_HALF)
>   target/mips: Convert MSA 3RF instruction format to decodetree
>     (DF_WORD)
>   target/mips: Convert MSA 3R instruction format to decodetree (part
>     1/4)
>   target/mips: Convert MSA 3R instruction format to decodetree (part
>     2/4)
>   target/mips: Convert MSA 3R instruction format to decodetree (part
>     3/4)
>   target/mips: Convert MSA 3R instruction format to decodetree (part
>     4/4)
>   target/mips: Convert MSA ELM instruction format to decodetree
>   target/mips: Convert MSA COPY_U opcode to decodetree
>   target/mips: Convert MSA COPY_S and INSERT opcodes to decodetree
>   target/mips: Convert MSA MOVE.V opcode to decodetree
>   target/mips: Convert CFCMSA opcode to decodetree
>   target/mips: Convert CTCMSA opcode to decodetree
>   target/mips: Remove generic MSA opcode
>   target/mips: Remove one MSA unnecessary decodetree overlap group
>   target/mips: Adjust style in msa_translate_init()

