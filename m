Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F6A13C3F2D
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Jul 2021 22:28:48 +0200 (CEST)
Received: from localhost ([::1]:58414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2g4F-00054H-6X
	for lists+qemu-devel@lfdr.de; Sun, 11 Jul 2021 16:28:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m2g36-0003QS-QI
 for qemu-devel@nongnu.org; Sun, 11 Jul 2021 16:27:36 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:54124)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m2g35-0002kz-D4
 for qemu-devel@nongnu.org; Sun, 11 Jul 2021 16:27:36 -0400
Received: by mail-wm1-x334.google.com with SMTP id w13so9931256wmc.3
 for <qemu-devel@nongnu.org>; Sun, 11 Jul 2021 13:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Jct87Mywy6zXJ/XbE2eGX2B4jViwfKOPPWpHKF1vKng=;
 b=FWPxLvNPOoSLQ83Y9s9sY9M96BV6ZvSuwmebIdawSYaxQwb82jlYT2O2m8ISnBnys0
 Xu/yJs3wJNW9ANuYVLhBIcfdNhpXhDo0CFeo7aqS+00dUOK3KRW1ykfqNVNHl2ZnhaFL
 vBFnWpHK+h4d/2m/g4FUJmsKqB1lltPuvM1fe+dFsW9EFLu/b8HlT/9wPZYevGYs9cy0
 5eN1ShKpax+buNJ0zKQKjrA33GwTgN+vGjUNDP26pooLg33xa/604RW1+Z6zYbTJQDN3
 FyRGqCdg7FGVU6a9EnxgOlsnTdFHj7OMeU1SLHgyt0uz0+Sc4DsRiXk9k8pFdC6l/7hX
 VzxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Jct87Mywy6zXJ/XbE2eGX2B4jViwfKOPPWpHKF1vKng=;
 b=l/iAeWhOWcmUJ2hGpC1+d3H4st0GRYLMNjwdJuPHrTqdmieF9KPpQbiYNK4RHEOUxI
 mCRQCPbgBVarobE9NXylWo9OYhXpDjaNb3mX++0e6L3AXPgaFOLT4DWz26aI1HCQBANf
 keUbWD3D0KasWdDc/saeDC+fS/jpvGwDZ7nhpEju34stk8Uru/zlc5wb8yHzaSGtI/4o
 A1Odd0XQPKzqpboHPTV935kpYaBe/NsRUXcPGSdCBnNPuGBoVcrv5ZY/pTfE7mkzLLt8
 Z1hGZUPaFYDoBSvcZIF5brXtmS1gviTzI3TOLkVBlT4iAvNgxfZI48wErrQ+y2/J7+Pz
 fY1g==
X-Gm-Message-State: AOAM533F7FDGxUefhV00PfJtx50nWu3fspSm3nUMk/ej9kCMUGa9IT+b
 oIhfXpT+V420bt4cWIRPQao=
X-Google-Smtp-Source: ABdhPJyoT+xFp0t0fFLXH5AxGA7nBJ2FNm0UVFED9PI/sTu2yN/bvhOeUaq/b0eZS4STXW9YCq8C0g==
X-Received: by 2002:a1c:b403:: with SMTP id d3mr51339581wmf.79.1626035254097; 
 Sun, 11 Jul 2021 13:27:34 -0700 (PDT)
Received: from [192.168.1.24] (abayonne-654-1-142-116.w86-222.abo.wanadoo.fr.
 [86.222.93.116])
 by smtp.gmail.com with ESMTPSA id v9sm650140wml.36.2021.07.11.13.27.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 11 Jul 2021 13:27:33 -0700 (PDT)
Subject: Re: [PATCH v3 0/5] target/mips: Reintroduce the R5900 CPU
To: qemu-devel@nongnu.org
References: <20210312162434.1869129-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <d3563d0c-2a8a-3bba-0a68-4b5f23f0eb02@amsat.org>
Date: Sun, 11 Jul 2021 22:27:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210312162434.1869129-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.631,
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
Cc: Fredrik Noring <noring@nocrew.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 "Maciej W . Rozycki" <macro@orcam.me.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/12/21 5:24 PM, Philippe Mathieu-Daudé wrote:
> I'm running out of time to address Richard's comments on the new
> opcodes, so let's KISS and only fix RDHWR (after adding LQ/SQ).
> 
> Missing review: 3 & 5
> - target/mips/tx79: Move RDHWR usermode kludge to trans_SQ()
> - tests/tcg/mips: Test user mode DMULT for the R5900
> 
> Based-on: mips-next
> Supersedes: <20210309145653.743937-1-f4bug@amsat.org>
> 
> Fredrik Noring (1):
>   tests/tcg/mips: Test user mode DMULT for the R5900
> 
> Philippe Mathieu-Daudé (4):
>   target/mips/tx79: Introduce LQ opcode (Load Quadword)
>   target/mips/tx79: Introduce SQ opcode (Store Quadword)
>   target/mips/tx79: Move RDHWR usermode kludge to trans_SQ()
>   target/mips: Reintroduce the R5900 CPU

Patches 1 & 2 queued to mips-next.

