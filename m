Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 336AF606B43
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Oct 2022 00:27:28 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ole0d-0006vO-1m
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 18:27:27 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oldvr-0007VZ-FE
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 18:22:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oldvh-0007G4-5V; Thu, 20 Oct 2022 18:22:21 -0400
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oldvT-0006lH-JN; Thu, 20 Oct 2022 18:22:09 -0400
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-1322fa1cf6fso1331660fac.6; 
 Thu, 20 Oct 2022 15:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=u6gp3xlatvwBrqA3i9yUlk/asMzoPsvapjuNkgfxBMQ=;
 b=aiuwHe1qd43JVsOB9fpxMS7ZbW8TLJMPXn1MRUZEn+M1Pa9VdeEm2K4sPwrbeehXH3
 tIFA+U5fLQc8xDV6uWJ24F9MglPPxE+zIajrq7CJcVbDUMVOChtKY6whodRIR5YjtU9v
 BqwnMgozWugYxIm+14+IAbPCi7Tfrk/wWkHg/4juUUPgb7dFstR/uQtC/2E16U0A+Czn
 /gg93REohZ2ndhuwukIrfcYqMytXKtsVExIeCe38mMzy8erIIrCtGz1afL9VFuiDEMCJ
 eMuRm6MWniqamxTkE71czzBmrfQULhTqz25+X1UiEDGux5tJbMvCmeQR7m4LEmZdmaGH
 bj2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=u6gp3xlatvwBrqA3i9yUlk/asMzoPsvapjuNkgfxBMQ=;
 b=pVVuuPfmiDEpI5WDFLz0I73v5mnngRiHQ4i0CqTeeaFkWPCLPTFTUo09Z4olwphhJx
 wt8hyXi9fo+0HlrXBbDJRpcEtZq2W7Rm8QsS7FDS2hbKHv9gQTZM/SEKM10N8JUM0c8H
 hpMfMXhiTaFfItaQ1j9Sh8GD+UQw7LFu2AXQmn6H+336je4p9iQeIRuT1o4lbHE6IEOi
 Umi5V9nxzWZp+yeFEDNkkNjx9wRhZzwIzxm5niZ54bcVc9erV9osQ5oXBK7UwSGHxLaC
 25hDyHlBz3V782zt1I5JzIeyDCLtOEEIYXecWKR4zk5OTKM3cblaWXy3pkVZta/AmXEY
 Y+VQ==
X-Gm-Message-State: ACrzQf2MpbfF1X9xBHvpVhQI3w1w4kNxedT7V3uNgmD9kJPH7NkOwtTX
 U4yl8tHMpgQhd7GfIPqWKzQ=
X-Google-Smtp-Source: AMsMyM5A4OTsRXk5RhrEaqT0A9gixR3Ui6UxpCRNb88NfEI/YogqwmOVcL3JsLgCVeNA1xHRIlA+ew==
X-Received: by 2002:a05:6870:d190:b0:13a:b71a:c1d2 with SMTP id
 a16-20020a056870d19000b0013ab71ac1d2mr8212187oac.22.1666304508943; 
 Thu, 20 Oct 2022 15:21:48 -0700 (PDT)
Received: from [192.168.10.102] ([179.111.38.2])
 by smtp.gmail.com with ESMTPSA id
 v24-20020a056830141800b006618f1fbb84sm394921otp.80.2022.10.20.15.21.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Oct 2022 15:21:48 -0700 (PDT)
Message-ID: <d5f7504d-be56-125e-5b1d-c06835d5fd54@gmail.com>
Date: Thu, 20 Oct 2022 19:21:44 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v3 00/12] VMX/VSX instructions with gvec
Content-Language: en-US
To: "Lucas Mateus Castro(alqotel)" <lucas.araujo@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Cc: richard.henderson@linaro.org
References: <20221019125040.48028-1-lucas.araujo@eldorado.org.br>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20221019125040.48028-1-lucas.araujo@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::31;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x31.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Thanks for the reviews.


Queued in gitlab.com/danielhb/qemu/tree/ppc-next.


Daniel

On 10/19/22 09:50, Lucas Mateus Castro(alqotel) wrote:
> From: "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>
> 
> Patches missing review: 12
> 
> v2 -> v3:
>      - Used ctpop in i32 and i64 vprtyb
>      - Changed gvec set up in xvtstdc[ds]p
> 
> v1 -> v2:
>      - Implemented instructions with fni4/fni8 and dropped the helper:
>          * VSUBCUW
>          * VADDCUW
>          * VPRTYBW
>          * VPRTYBD
>      - Reworked patch12 to only use gvec implementation with a few
>        immediates.
>      - Used bitsel_ver on patch9
>      - Changed vec variables to tcg_constant_vec when possible
> 
> This patch series moves some instructions from decode legacy to
> decodetree and translate said instructions with gvec. Some cases using
> gvec ended up with a bigger, more complex and slower so those
> instructions were only moved to decodetree.
> 
> In each patch there's a comparison of the execution time before the
> patch being applied and after. Said result is the sum of 10 executions.
> 
> The program used to time the execution worked like this:
> 
> clock_t start = clock();
> for (int i = 0; i < LOOP; i++) {
>      asm (
>           load values in registers, between 2 and 3 instructions
>           ".rept REPT\n\t"
>           "INSTRUCTION registers\n\t"
>           ".endr\n\t"
>           save result from register, 1 instruction
>      );
> }
> clock_t end = clock();
> printf("INSTRUCTION rept=REPT loop=LOOP, time taken: %.12lf\n",
>         ((double)(end - start))/ CLOCKS_PER_SEC);
> 
> Where the column rept in the value used in .rept in the inline assembly
> and loop column is the value used for the for loop. All of those tests
> were executed on a Power9. When comparing the TCGop the data used was
> gathered using '-d op' and '-d op_opt'.
> 
> Lucas Mateus Castro (alqotel) (12):
>    target/ppc: Moved VMLADDUHM to decodetree and use gvec
>    target/ppc: Move VMH[R]ADDSHS instruction to decodetree
>    target/ppc: Move V(ADD|SUB)CUW to decodetree and use gvec
>    target/ppc: Move VNEG[WD] to decodtree and use gvec
>    target/ppc: Move VPRTYB[WDQ] to decodetree and use gvec
>    target/ppc: Move VAVG[SU][BHW] to decodetree and use gvec
>    target/ppc: Move VABSDU[BHW] to decodetree and use gvec
>    target/ppc: Use gvec to decode XV[N]ABS[DS]P/XVNEG[DS]P
>    target/ppc: Use gvec to decode XVCPSGN[SD]P
>    target/ppc: Moved XVTSTDC[DS]P to decodetree
>    target/ppc: Moved XSTSTDC[QDS]P to decodetree
>    target/ppc: Use gvec to decode XVTSTDC[DS]P
> 
>   target/ppc/fpu_helper.c             | 137 +++++-----
>   target/ppc/helper.h                 |  42 ++--
>   target/ppc/insn32.decode            |  50 ++++
>   target/ppc/int_helper.c             | 107 ++------
>   target/ppc/translate.c              |   1 -
>   target/ppc/translate/vmx-impl.c.inc | 352 ++++++++++++++++++++++----
>   target/ppc/translate/vmx-ops.c.inc  |  15 +-
>   target/ppc/translate/vsx-impl.c.inc | 372 +++++++++++++++++++++++-----
>   target/ppc/translate/vsx-ops.c.inc  |  21 --
>   9 files changed, 771 insertions(+), 326 deletions(-)
> 

