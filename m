Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 959504DCE8F
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 20:14:20 +0100 (CET)
Received: from localhost ([::1]:38522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUvZj-00043I-NQ
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 15:14:19 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nUvWu-0001Ze-LK
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 15:11:24 -0400
Received: from [2607:f8b0:4864:20::1134] (port=36891
 helo=mail-yw1-x1134.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nUvWt-0004z2-0e
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 15:11:24 -0400
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-2e5757b57caso69338317b3.4
 for <qemu-devel@nongnu.org>; Thu, 17 Mar 2022 12:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tm4Zpz/oRbBP+Eu1M8rwF8lGrnm0ewHe3Xmi06AiHZE=;
 b=oWArKCYOWHFepNsRe1z2CL/Z9WzasP/ncGGGbnQHqj3X4ClFz0OqxUzIXb2BPcjFq0
 cBz/d7UGAmqJ9m08y88m/6XP5W1cCxsR4duZdHyhh3LDCHGMiWjJWSvyS39djhd7FbM2
 MsX8cwZGRB1igemkw7HmhT19zd8jbSfthf2NQluLZQQtwrW5l/9wyE9g8sRM8O/uPk2r
 Hnhkmrim2V9lR2fCPrLomlkOZ3thrJWM2f5RNCB2CsypNnFGVB/gdQVHrdBSEH+axONy
 E43cBfKEqONuBq2qlgBa6M1jXSD99rFQgpp5WP7uyWXOLpmz2wbLac0G0nXjsDq7vqlN
 bqXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tm4Zpz/oRbBP+Eu1M8rwF8lGrnm0ewHe3Xmi06AiHZE=;
 b=63UD4gH4YSesU7TKJbDkTpAF9BRPs3VfebhDSoFP+SWjbnB2f7HazF54woqJQQg1hg
 etQi8VF3Zrih0Eu6GAcje6TgUslT2+Ndz/UcHasr1h96a0pUYPyDpODnwNDXo/+xvuPl
 MOBvDvWkUMmG8cU8L13r/pUyNOshKWgOPWuZGFbEeYZjH34kmiWwZlKUP0JR4d07t8Am
 i1tuj5VGmayzgVRYy/vStxSH7j6y6PX0TePhIT/ZHY+CP0raeAGZp4DJlE97G4Rr9B79
 NpT1sYNflDiE0aZGSXlHucuL1rTM30HqyZNgoEOEtcwO61Vj4tCLQKpebbe8nNH4fg68
 N94g==
X-Gm-Message-State: AOAM532H8qbPJDFD8ANLbbNvTWu891t3+K9/6cYZw+EwTEdyAchzVevc
 5IqU2yht4OS8DCJwyY8P/NVg2xtlU/PVLVytFdDZnA==
X-Google-Smtp-Source: ABdhPJxf6JueJQGErTLtqEgYrydHijKbBcu3dcE2M1uzR1K0Ygw8A80TmWwPBaA94kfCFZDcWQcApSjNobkNaSHrrDk=
X-Received: by 2002:a0d:fc83:0:b0:2e5:b0f4:c125 with SMTP id
 m125-20020a0dfc83000000b002e5b0f4c125mr7423970ywf.347.1647544281929; Thu, 17
 Mar 2022 12:11:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220317050538.924111-1-richard.henderson@linaro.org>
 <20220317050538.924111-45-richard.henderson@linaro.org>
In-Reply-To: <20220317050538.924111-45-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 17 Mar 2022 19:11:10 +0000
Message-ID: <CAFEAcA_63vwGgWdiPozkzSus6vzoSGm0Ndn=QXLUrxzP9NVQFQ@mail.gmail.com>
Subject: Re: [PATCH for-7.1 v6 44/51] target/nios2: Implement EIC interrupt
 processing
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1134
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1134.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: marex@denx.de, amir.gonnen@neuroblade.ai, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 17 Mar 2022 at 05:51, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This is the cpu side of the operation.  Register one irq line,
> called EIC.  Split out the rather different processing to a
> separate function.
>
> Delay initialization of gpio irqs until realize.  We need to
> provide a window after init in which the board can set eic_present.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

> diff --git a/target/nios2/helper.c b/target/nios2/helper.c
> index bf40cff779..00f27165d9 100644
> --- a/target/nios2/helper.c
> +++ b/target/nios2/helper.c
> @@ -57,6 +57,9 @@ static void do_exception(Nios2CPU *cpu, uint32_t exception_addr,
>      uint32_t old_status = env->ctrl[CR_STATUS];
>      uint32_t new_status = old_status;
>
> +    /* With shadow regs, exceptions are always taken into CRS 0. */

Hmm. Table 3-9 agrees with this, saying that CRS is set to 0 for
non-interrupt exceptions, but Table 3-38 disagrees -- it has status.CRS
listed as "No change" for non-interrupt exceptions... 3-9 seems to
be backed up by other text, so let's go with that.

> +    new_status &= ~R_CR_STATUS_CRS_MASK;

We're missing the "copy status.CRS to status.PRS" part of
taking an exception, I think ?

thanks
-- PMM

