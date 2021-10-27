Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD75043CF25
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 18:57:25 +0200 (CEST)
Received: from localhost ([::1]:46440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfmEu-0005FR-VC
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 12:57:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mflBn-0005NH-Az
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 11:50:07 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:41768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mflBl-00056A-7h
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 11:50:07 -0400
Received: by mail-wr1-x432.google.com with SMTP id d3so4917964wrh.8
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 08:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=79D+Clr/QSP4pRzO1Mqc1XiDwGYxfi4+nIPsqJxhsCo=;
 b=SAL715bBMBqN86J4q07rAvKxvvdoHnhIL0FYRedv50AkGfVgcAmzc2wY/zQ4iyYs2u
 ehkKxe23B5g0/auyvRzUNAtJz98FHL5tUH62t+/F01IN5aqvyNZEl6a+oYqEpwR+RlTT
 WT6kiByMSq8Exbs6/3Rvd/NhVgRUydTGz0RzW2uEL7UV6ahoDkrv7dUy6Z0W4iywQb3w
 +3LGUppQ3M+8kDu7u6kFvD4KrWoeVwzHGS7XLQ4oQ/VPpAOMKpa7VgQjrrHjE83BdPzn
 xFABMuEwcQ55brkQSf1eEwNmHmrJyGbx6rd2slfMnRnWqRVuZq74aEJUc90kWysNBpjF
 fIMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=79D+Clr/QSP4pRzO1Mqc1XiDwGYxfi4+nIPsqJxhsCo=;
 b=bCSR5CdY4kc1frm8+jWQcnNs3muyTfTjkzFiSwRbjy/7ax0STV/vIkM+X5MjvSt11E
 ysYOpKqTl0A8xPoRmQq1deLVa9m7aFnyw7qrdchCcp1AeHpq/EFRgEgIsgGNHypkzBGK
 fVWcOMy1JFogkpofu5bA+belpKn36b+c+zP/HbePUsXgUFV/6r8z6ehczGzWAGra3ubp
 MkcvCPm0cxfvNYO3m1naNylkdBqz04WSSXgh6Amad+9BkmL33Pp18BDDlZA71dph+Lev
 S+hSDNanU73mPWmWnkUmvBYwrdub2ifQ4Tr2KFlxRiI8U/IUicHV6gwivUxIyYxkLHwo
 g5Yw==
X-Gm-Message-State: AOAM53011SJ05JW5pC2l+UI/8WZLDcwIULhAs5j9j7BeieNiTf1BOSpO
 foAmGUH45m1OFgfgvspsMl4=
X-Google-Smtp-Source: ABdhPJxKCQ7RuYZuTU2J4uy3enMWzQSHI6MNY9V9ToI6kLMLmH8hC8Fwe+H8oF9RNhu40AD7HlyPIQ==
X-Received: by 2002:a05:6000:2c2:: with SMTP id
 o2mr42059315wry.194.1635349803567; 
 Wed, 27 Oct 2021 08:50:03 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id a134sm164379wmd.9.2021.10.27.08.50.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Oct 2021 08:50:03 -0700 (PDT)
Message-ID: <73e32080-3ac8-b982-71e5-56a52af6cc14@amsat.org>
Date: Wed, 27 Oct 2021 17:50:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 09/11] hw/intc/sh_intc: Turn some defines into an enum
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org
References: <cover.1635342377.git.balaton@eik.bme.hu>
 <21f98d137754b1c58de3cec2c3e4a7df7cc936ce.1635342377.git.balaton@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <21f98d137754b1c58de3cec2c3e4a7df7cc936ce.1635342377.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-2.847,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/27/21 15:46, BALATON Zoltan wrote:
> Turn the INTC_MODE defines into an enum (except the one which is a
> flag) and clean up the function returning these to make it clearer by
> removing nested ifs and superfluous parenthesis.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>  hw/intc/sh_intc.c | 43 +++++++++++++++++++------------------------
>  1 file changed, 19 insertions(+), 24 deletions(-)
> 
> diff --git a/hw/intc/sh_intc.c b/hw/intc/sh_intc.c
> index 0bd27aaf4f..18461ff554 100644
> --- a/hw/intc/sh_intc.c
> +++ b/hw/intc/sh_intc.c
> @@ -100,33 +100,27 @@ int sh_intc_get_pending_vector(struct intc_desc *desc, int imask)
>      abort();
>  }
>  
> -#define INTC_MODE_NONE       0
> -#define INTC_MODE_DUAL_SET   1
> -#define INTC_MODE_DUAL_CLR   2
> -#define INTC_MODE_ENABLE_REG 3
> -#define INTC_MODE_MASK_REG   4
> -#define INTC_MODE_IS_PRIO    8
> -
> -static unsigned int sh_intc_mode(unsigned long address,
> -                                 unsigned long set_reg, unsigned long clr_reg)
> +#define INTC_MODE_IS_PRIO 0x80

Why change 8 -> 0x80 without updating the definition usage?

> +typedef enum {
> +    INTC_MODE_NONE,
> +    INTC_MODE_DUAL_SET,
> +    INTC_MODE_DUAL_CLR,
> +    INTC_MODE_ENABLE_REG,
> +    INTC_MODE_MASK_REG,

If this is defined by the spec, better explicit the enum value,
otherwise if someone add a misplaced field this would change the
definitions.

> +} SHIntCMode;
> +
> +
> +static SHIntCMode sh_intc_mode(unsigned long address, unsigned long set_reg,
> +                               unsigned long clr_reg)
>  {
> -    if ((address != A7ADDR(set_reg)) &&
> -        (address != A7ADDR(clr_reg)))
> +    if (address != A7ADDR(set_reg) && address != A7ADDR(clr_reg)) {
>          return INTC_MODE_NONE;
> -
> -    if (set_reg && clr_reg) {
> -        if (address == A7ADDR(set_reg)) {
> -            return INTC_MODE_DUAL_SET;
> -        } else {
> -            return INTC_MODE_DUAL_CLR;
> -        }
>      }
> -
> -    if (set_reg) {
> -        return INTC_MODE_ENABLE_REG;
> -    } else {
> -        return INTC_MODE_MASK_REG;
> +    if (set_reg && clr_reg) {
> +        return address == A7ADDR(set_reg) ?
> +               INTC_MODE_DUAL_SET : INTC_MODE_DUAL_CLR;
>      }
> +    return set_reg ? INTC_MODE_ENABLE_REG : INTC_MODE_MASK_REG;
>  }
>  
>  static void sh_intc_locate(struct intc_desc *desc,
> @@ -137,7 +131,8 @@ static void sh_intc_locate(struct intc_desc *desc,
>                             unsigned int *width,
>                             unsigned int *modep)
>  {
> -    unsigned int i, mode;
> +    SHIntCMode mode;
> +    unsigned int i;
>  
>      /* this is slow but works for now */
>  
> 


