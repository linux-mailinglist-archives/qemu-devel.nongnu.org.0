Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE1F7286002
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Oct 2020 15:23:04 +0200 (CEST)
Received: from localhost ([::1]:47658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kQ9PL-0004w2-KZ
	for lists+qemu-devel@lfdr.de; Wed, 07 Oct 2020 09:23:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kQ9Ng-00043q-DI
 for qemu-devel@nongnu.org; Wed, 07 Oct 2020 09:21:21 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:45484)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kQ9Nb-00040V-LW
 for qemu-devel@nongnu.org; Wed, 07 Oct 2020 09:21:16 -0400
Received: by mail-wr1-x444.google.com with SMTP id e17so2114995wru.12
 for <qemu-devel@nongnu.org>; Wed, 07 Oct 2020 06:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=lHdBjRKLLVG158E0rLTeGKYZvEl6TCLRvcqvwkQesmo=;
 b=E/20JEzjTMFKTWrrY+oSjT/l9+eQe82yU+hdUS1Nnjo3xDskTgRFKqCaEQYHNQrv72
 za0G+V9SoYMhlZY+glOzcNzB99QvI+WNabynYyp5HgSFYLg3aGCVTMNJcI1ok5GvM9ex
 juplKoQLPr5w1uHNqgYLx85Iw+Yjsp38K9LigeO46ZPd84DlELYF0MKYDPjagnOP7eCT
 PiMx9auBwM/TqSmdKN9JqG85fo2sdjTPHwZy7d1OrmPC2jVXoz94XX2aW/sbSyK/G0ta
 9BnS4+gLNj5Ig/N+Uh1dnmxp/VBE2BnjKTqkAiYyQJR8aVSPHftm9q3E1bgAfZnFn7mF
 B6Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lHdBjRKLLVG158E0rLTeGKYZvEl6TCLRvcqvwkQesmo=;
 b=H0Tmt6+wKBOS8LzQv/wG1UmmS0akCQTIuTpfDjumWYeWaCE5ayYDim0gqsxH36IsEk
 dGpwi7sdl+229A7F5istwtYMJe6yk4NIMU4rX/xgPyXQYy0Rh0xM0Ob6HnMAzwyrqN1U
 WMxYd2GVzkfj9cqrgN8l2BrmPYhTu8geQRqzJ+VMTYUCIx4XKGgFi4UlNPp57obA6wwF
 CDlKfCVoJhbftLhJlXGG1wugrD1TAf/D01Lk6KGA12HvnTZcmzOGhH1+jf8vDHJsEhhx
 wjih6XJ4knBJ4xror3H1tIIXE+4Nsu2+HBIFapljZsK3TdfuDvlL8jmikGmYVPgBM0IJ
 I9NA==
X-Gm-Message-State: AOAM5338B5VZapJ23mz898A/uIK90lW6xjBAF0KAWzidQBql7FqdmcEs
 Qfh7xre4O8n3Btz8ekNfCRI=
X-Google-Smtp-Source: ABdhPJyTviQTGeUb61Gb+fY9valJdXzq1IVCC2Auba1fFZcNK64c5ZGP78ccJsIpvHUnK5XItTQlJg==
X-Received: by 2002:adf:dccc:: with SMTP id x12mr3628387wrm.241.1602076874123; 
 Wed, 07 Oct 2020 06:21:14 -0700 (PDT)
Received: from [192.168.1.36] (106.red-83-59-162.dynamicip.rima-tde.net.
 [83.59.162.106])
 by smtp.gmail.com with ESMTPSA id n6sm3109122wrx.58.2020.10.07.06.21.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Oct 2020 06:21:13 -0700 (PDT)
Subject: Re: [PATCH 0/2] hw/mips: Code simplifications
To: qemu-devel@nongnu.org
References: <20200927163943.614604-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <a2cd81ec-7764-aaea-760e-5701d887e099@amsat.org>
Date: Wed, 7 Oct 2020 15:21:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200927163943.614604-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: Huacai Chen <zltjiangshi@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/27/20 6:39 PM, Philippe Mathieu-Daudé wrote:
> Doing housekeeping on old branches older than 1 year.
> Some patches are still valuable, so post them.
> 
> These patches should not introduce logical change,
> they simply rewrite old style code using more recent
> API/macros.
> 
> Philippe Mathieu-Daudé (2):
>   hw/mips: Simplify loading 64-bit ELF kernels
>   hw/mips: Simplify code using ROUND_UP(INITRD_PAGE_SIZE)
> 
>  include/hw/mips/mips.h | 4 +++-
>  hw/mips/fuloong2e.c    | 3 +--
>  hw/mips/malta.c        | 6 +++---
>  hw/mips/mipssim.c      | 9 ++-------
>  hw/mips/r4k.c          | 9 ++-------
>  5 files changed, 11 insertions(+), 20 deletions(-)

Thanks, applied to mips-hw-next.

