Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D682D440592
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Oct 2021 00:47:07 +0200 (CEST)
Received: from localhost ([::1]:45894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgaeQ-0000vr-VT
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 18:47:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgad3-00086k-Qr
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 18:45:41 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:46796)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgad1-0007dX-86
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 18:45:41 -0400
Received: by mail-wr1-x42c.google.com with SMTP id k7so18930449wrd.13
 for <qemu-devel@nongnu.org>; Fri, 29 Oct 2021 15:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=qLqjbmPPnA2vCaybDrOs+LOm0BVyoeVJvJoITdpD6ok=;
 b=IDT0HQJB8ybs6xitLe/3w/u80SmQ9j9ANqvWsnLjEX9tmNrEOMREUsF5yn311pms8C
 7gf1Xd1NdeadSTONuNlowmi2+KgTm4E4I2++C5jyGFdolE9I8Ytw7II+El6DzziBMNmj
 fPz0QUbzCCLnanrkR6sKFeIe89GmAcTpTaPdXf1s2uK5Cmn9Bqm1wcc0vS38T4KLbNtc
 M33uf0Ntt9LGSF1nsime+iEcnC2D3irrbC3m9NvDr1ArnB50DJu8Rvx8sISLUWJsOHAj
 /eTb6+0INYBzDFqwQNNAQbmrJZ2kFE/AgOqXbRVomM2wLg3SNNTXOwVqKgWts3VRXsth
 /MpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=qLqjbmPPnA2vCaybDrOs+LOm0BVyoeVJvJoITdpD6ok=;
 b=ts7aFy1U9fzF53JSBNVaI1fJUD2jIwOCzrn8MRcD+CeJm7fXpcOHectzy0O5jKYypy
 dY+F8YD2cVkBQxC/OyzakwVYI9Ao9tLEk2yD8LgsmwIizgSfXGi7e3rpwH35jfKbx3KD
 VjYzcJkisGA2mzGntAtR6eywF0Sn0+eUGt8qJDwmvFYy26K8R0fQRFcZ8QB+3oZ05qIl
 lnz1bfVvLlmO0Gc672SxaVhuZG01pbuhkROw/jZhf+zWz5FeJh7n3CRHpGkKeSyqvVak
 7vh8CZEZc0p7NMLpIvTz/9pwRe+4Q0G2a384b2fSit2obNdo4MhbFZfjXskM1uzQMxZU
 bkOQ==
X-Gm-Message-State: AOAM530TyjbxXHW7xySdpr0VTh9R/cQpOTQtvKcCm+hWk2wLgoFPkzKW
 Q7XP9kTWsN96LAbhADybY7g=
X-Google-Smtp-Source: ABdhPJxikjalmAAka3HqnKoD/RBh5U08XynuAKhldeKbGn64U7AKKBsi4tVZ4xL0mSLjau9O+qFSAw==
X-Received: by 2002:a5d:64ef:: with SMTP id g15mr8963828wri.118.1635547537754; 
 Fri, 29 Oct 2021 15:45:37 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id r11sm6536034wrt.42.2021.10.29.15.45.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Oct 2021 15:45:37 -0700 (PDT)
Message-ID: <8ca6ad2d-c04c-b299-437c-1724c79c8551@amsat.org>
Date: Sat, 30 Oct 2021 00:45:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v6 22/30] hw/intc/sh_intc: Inline and drop
 sh_intc_source() function
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org
References: <cover.1635541329.git.balaton@eik.bme.hu>
 <a98d1f7f94e91a42796b7d91e9153a7eaa3d1c44.1635541329.git.balaton@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <a98d1f7f94e91a42796b7d91e9153a7eaa3d1c44.1635541329.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-2.512,
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

On 10/29/21 23:02, BALATON Zoltan wrote:
> This function is very simple and provides no advantage. Call sites
> become simpler without it so just write it in line and drop the
> separate function.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>  hw/intc/sh_intc.c        | 54 ++++++++++++++++------------------------
>  hw/sh4/sh7750.c          |  4 +--
>  include/hw/sh4/sh_intc.h |  2 +-
>  3 files changed, 25 insertions(+), 35 deletions(-)

>  static void sh_intc_register_source(struct intc_desc *desc,
>                                      intc_enum source,
>                                      struct intc_group *groups,
>                                      int nr_groups)
>  {
>      unsigned int i, k;
> -    struct intc_source *s;
> +    intc_enum id;
>  

Maybe:

       assert(source != UNUSED);

>      if (desc->mask_regs) {
>          for (i = 0; i < desc->nr_mask_regs; i++) {
>              struct intc_mask_reg *mr = &desc->mask_regs[i];
>  
>              for (k = 0; k < ARRAY_SIZE(mr->enum_ids); k++) {
> -                if (mr->enum_ids[k] != source) {
> -                    continue;
> -                }
> -                s = sh_intc_source(desc, mr->enum_ids[k]);
> -                if (s) {
> -                    s->enable_max++;
> +                id = mr->enum_ids[k];
> +                if (id && id == source) {

Then you can drop the 'id' checks.

> +                    desc->sources[id].enable_max++;
>                  }
>              }
>          }

