Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F66146867F
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Dec 2021 18:16:28 +0100 (CET)
Received: from localhost ([::1]:39442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mtYeB-0005TW-0P
	for lists+qemu-devel@lfdr.de; Sat, 04 Dec 2021 12:16:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mtYcS-00045R-1L
 for qemu-devel@nongnu.org; Sat, 04 Dec 2021 12:14:40 -0500
Received: from [2a00:1450:4864:20::32a] (port=44822
 helo=mail-wm1-x32a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mtYcQ-0006cG-59
 for qemu-devel@nongnu.org; Sat, 04 Dec 2021 12:14:39 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 p27-20020a05600c1d9b00b0033bf8532855so4595355wms.3
 for <qemu-devel@nongnu.org>; Sat, 04 Dec 2021 09:14:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=bOmlxXa7Fhw58yXZh9qPLoJ3McHCYHVBLniiT4Zje7U=;
 b=Gk+VfW2Hl+1GTK9wn1SkJZLDr9jxMgwYmOCefxKce5g5K4OuQM4v4469ZpFt+D6gt8
 UP4gSpxHTUPT9WuKAR99sc8Q+XlZB/ZEP0c5fdewDY9pTZi6TwwsbJ0ATL7Vpji00zTZ
 xDzdLP1Wc+IujLAQ3+xLllhpCDd/LCKq9UgnFF9yl0auCJ22Ty7e26IljfsopplYgrzN
 zTDrL5i4P0FBeuQFxNm60h4yT3YSEydhV9nzo16F3B4hy/7EmhSq4PvXrp5M+Pl2ZasG
 nNfcB6wwDz71sreH1iUMfv5M+KwRY6ajxJ2ADi007ENS9GotB/05eiFTgmqNR8nRn5Z1
 Xh6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=bOmlxXa7Fhw58yXZh9qPLoJ3McHCYHVBLniiT4Zje7U=;
 b=pECXk7+GRqA8GoIRpFuIsN1qdl9wqswfIWbtb/Nd9TBR2gk1hc3IKOrhWPrNmuOXVD
 IJhl46Wk6Ap08/hPFD+TSiZFcxaGD5UFqMkGJB1XzWaTgkhvRJiwlyhnN3ezCscVeorv
 F+zrLawTnGg5mxLI+sfTkCDDsne4Zgp7K4PrrS7C8gZu2gxwmQnJhl/qvV/GigKD37G2
 CN977lFJJ1R4uMrYfC0d9/ewfaLKXbdGcuQ07JBg3g6ixlzLndUB36w5mBNwy8GLKYtb
 1X7VcjrtMOaKI3a0t4YjDjdSTXuL4vsZwUl8FdM7Figw74OCzRU2ItiG0utmTs2zORls
 OHuA==
X-Gm-Message-State: AOAM533Oq//Kv8tDVNn/wVfmGrVpxU/Z10a25rtOQFjByyc2a4rIHi6i
 Xqikz8hosdF9qZt0Zm+EFYs=
X-Google-Smtp-Source: ABdhPJxGvfQUA+j3+4A0N+olYO6KB9j2fmqCD2ai/gJmrdm3+o1zOBqQspOJKD6C7GMc6nvRtR79jw==
X-Received: by 2002:a05:600c:35cb:: with SMTP id
 r11mr24984511wmq.190.1638638075243; 
 Sat, 04 Dec 2021 09:14:35 -0800 (PST)
Received: from [192.168.43.238] (168.red-176-83-218.dynamicip.rima-tde.net.
 [176.83.218.168])
 by smtp.gmail.com with ESMTPSA id r7sm5944358wrq.29.2021.12.04.09.14.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 04 Dec 2021 09:14:33 -0800 (PST)
Message-ID: <f4ce9bcd-3b96-0547-8863-428caebd9c80@amsat.org>
Date: Sat, 4 Dec 2021 18:05:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v13 20/26] linux-user: Add LoongArch elf support
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <1638610165-15036-1-git-send-email-gaosong@loongson.cn>
 <1638610165-15036-21-git-send-email-gaosong@loongson.cn>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <1638610165-15036-21-git-send-email-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-1.011,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Xiaojuan Yang <yangxiaojuan@loongson.cn>, richard.henderson@linaro.org,
 laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/4/21 10:29, Song Gao wrote:
> Signed-off-by: Song Gao <gaosong@loongson.cn>
> Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/elf.h                       |  2 ++
>  linux-user/elfload.c                | 58 +++++++++++++++++++++++++++++++++++++
>  linux-user/loongarch64/target_elf.h | 12 ++++++++
>  3 files changed, 72 insertions(+)
>  create mode 100644 linux-user/loongarch64/target_elf.h

> +/* See linux kernel: arch/loongarch/include/asm/reg.h.  */
> +enum {
> +    TARGET_EF_R0 = 0,
> +    TARGET_EF_CSR_ERA = TARGET_EF_R0 + 32,
> +    TARGET_EF_CSR_BADVADDR = TARGET_EF_R0 + 33,
> +};
> +
> +/* See linux kernel: arch/loongarch/kernel/process.c:loongarch_dump_regs64. */
> +static void elf_core_copy_regs(target_elf_gregset_t *regs,
> +                               const CPULoongArchState *env)
> +{
> +    int i;
> +
> +    for (i = 0; i < TARGET_EF_R0; i++) {
> +        (*regs)[i] = 0;
> +    }

Dead code... Removing it:

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> +    (*regs)[TARGET_EF_R0] = 0;
> +
> +    for (i = 1; i < ARRAY_SIZE(env->gpr); i++) {
> +        (*regs)[TARGET_EF_R0 + i] = tswapreg(env->gpr[i]);
> +    }
> +
> +    (*regs)[TARGET_EF_CSR_ERA] = tswapreg(env->pc);
> +    (*regs)[TARGET_EF_CSR_BADVADDR] = tswapreg(env->badaddr);
> +}

