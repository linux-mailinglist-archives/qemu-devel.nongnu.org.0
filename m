Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4631E51FE59
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 15:33:03 +0200 (CEST)
Received: from localhost ([::1]:60634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1no3VW-0000uk-Cl
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 09:33:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1no2wB-0001Vt-4w
 for qemu-devel@nongnu.org; Mon, 09 May 2022 08:56:31 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:33433)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1no2w9-0003bY-G0
 for qemu-devel@nongnu.org; Mon, 09 May 2022 08:56:30 -0400
Received: by mail-pl1-x632.google.com with SMTP id d17so13769002plg.0
 for <qemu-devel@nongnu.org>; Mon, 09 May 2022 05:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=PSAlay8HJw+TYz73sy3dxeG+9gVdXtWeOy1OQiFJad4=;
 b=Rukidx0DXkDj8UCdcOz67QXEX/nt8E/FwsegOGA//IZXyF5aCmCt7RYRmVjl8P45rz
 ZO6NO8QcOJEnt3q2HH7IZnnS0QlsScOc8pPqAuXG3WlV8quEpZZAoVm7WjxMnUjzmKzh
 18PFvOy0KNy7cY++234jxXPGR7C4eujwIlX0rda7s491dHjjFlO2VZ21KsYLjvAKBxjF
 bLKdwrPsfX3VhJnXSLTeA87LNqT5am1HmbQRN2YJiaLikLZrTGp3JCd82aa0nEQOIhty
 3mF5RCsXnLcVor4YhV+Cn//2pgc0ltCSRtlRzHq31IjUezJB5yL024pEMwA1jdzqK7n3
 ffGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=PSAlay8HJw+TYz73sy3dxeG+9gVdXtWeOy1OQiFJad4=;
 b=2zpD/u2hXXCi9fUbCndUm1zaGag025bD9YwFLeuCHH6x7spK9apK91T+TxhRj84Amn
 3EpsrbF8iLFGUKeras/7cN/jtsxn2ak058CtewMbEAYVFe89IeEYFGoS/+bAP7UxYk44
 /NMKp6MA7zVn1U7YX5BVM4VF3Q8DfqeUi4jdTFpcZDd6IcR7//5fXibWdPeCRbQpP98y
 WJEZhnmA6ioUB+BcwiL20MVh4Uk2H5djSNEDsQn+OLUbMCka38TJseca0cuuO/p3eT4w
 4L7c0VsPcU9KeugTLLzqoIe2Jrgu2kUGSnTrizi000KhH4oCb6g/o0PyjdVoZ007bTX4
 rtEQ==
X-Gm-Message-State: AOAM533leLcBCvBxVErmR3j2/wsn/+RnNmVWX1bEy1lSHm/vif48g2xe
 CrjBtkEdZggwQSEGB+sU/VnZGgGZnNA=
X-Google-Smtp-Source: ABdhPJxOO/iLzXDu7QyRevpHZI0NW2lw3SgWNJCly2d4UJutf1KtyV8WHyc0osnaaxyoR/BnTcS8eQ==
X-Received: by 2002:a17:902:b7cb:b0:15c:6650:a58a with SMTP id
 v11-20020a170902b7cb00b0015c6650a58amr16356982plz.63.1652100988086; 
 Mon, 09 May 2022 05:56:28 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 m19-20020a17090a7f9300b001cd60246575sm12601469pjl.17.2022.05.09.05.56.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 May 2022 05:56:27 -0700 (PDT)
Message-ID: <b25bbee3-ed76-b11b-71d6-3d69f7fbf156@amsat.org>
Date: Mon, 9 May 2022 14:24:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH 3/7] target/mips: Fix emulation of nanoMips BPOSGE32C
 instruction
Content-Language: en-US
To: Stefan Pejic <stefan.pejic@syrmia.com>, qemu-devel@nongnu.org
Cc: ot_stefan.pejic@mediatek.com, ot_dragan.mladjenovic@mediatek.com,
 Dragan Mladjenovic <dragan.mladjenovic@syrmia.com>
References: <20220504110403.613168-1-stefan.pejic@syrmia.com>
 <20220504110403.613168-4-stefan.pejic@syrmia.com>
In-Reply-To: <20220504110403.613168-4-stefan.pejic@syrmia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x632.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 4/5/22 13:03, Stefan Pejic wrote:
> From: Dragan Mladjenovic <dragan.mladjenovic@syrmia.com>
> 
> There are currently two problems related to the emulation of the
> instruction BPOSGE32C.
> 
> The nanoMips instruction BPOSGE32C belongs to DSP R3 instructions
> (actually, as of now, it is the only instruction of DSP R3). The
> presence of DSP R3 instructions in QEMU is indicated by the flag
> MIPS_HFLAG_DSP_R3 (0x20000000). This flag is currently being properly
> set in CPUMIPSState's hflags (for example, for I7200 nanoMips CPU).
> However, it is not propagated to DisasContext's hflags, since the flag
> MIPS_HFLAG_DSP_R3 is not set in MIPS_HFLAG_TMASK (while similar flags
> MIPS_HFLAG_DSP_R2 and MIPS_HFLAG_DSP are set in this mask, and there
> is no problem in functioning check_dsp_r2(), check_dsp()). This means
> the function check_dsp_r3() currently does not work properly, and the
> emulation of BPOSGE32C can not work properly as well.
> 
> Change MIPS_HFLAG_TMASK from 0x1F5807FF to 0x3F5807FF (logical OR
> with 0x20000000) to fix this.
> 
> Additionally, check_cp1_enabled() is currently incorrectly called
> while emulating BPOSGE32C. BPOSGE32C is in the same pool (P.BR1) as
> FPU branch instruction BC1EQZC and BC1NEZC, but it not a part of FPU
> (CP1) instructions, and check_cp1_enabled() should not be involved
> while emulating BPOSGE32C.
> 
> Rearrange invocations of check_cp1_enabled() within P.BR1 pool
> handling to affect only BC1EQZC and BC1NEZC emulation, and not
> BPOSGE32C emulation.
> 
> Signed-off-by: Dragan Mladjenovic <dragan.mladjenovic@syrmia.com>
> Signed-off-by: Stefan Pejic <stefan.pejic@syrmia.com>
> ---
>   target/mips/cpu.h                        | 2 +-
>   target/mips/tcg/nanomips_translate.c.inc | 3 ++-
>   2 files changed, 3 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

