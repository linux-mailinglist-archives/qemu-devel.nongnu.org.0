Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E496431AAA
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 15:21:42 +0200 (CEST)
Received: from localhost ([::1]:46428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcSaC-0008Rc-WE
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 09:21:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mcSDz-0002Xj-9u
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 08:58:43 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:41584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mcSDu-0000tY-W0
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 08:58:40 -0400
Received: by mail-wr1-x42d.google.com with SMTP id t2so41300326wrb.8
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 05:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=UUVyxjkbuLqUKGxUTaNNR5lkgKqUeq2Gn5ZHYZui5pM=;
 b=mbWM3HdGNGsxLN5/dLcjP82Pk/t2lPBsXhPGh0zur9lS9LUBifRYIX9UqdnAdLxzFi
 LV1eem3YOLYtujWnPNP+2BHaQXH+wfmi5az/I5FhVMExJPcHTZqn9+ea82/xB+Q7ilKi
 koRQIOD/8ha5iR0U4TyYcI7cPHiw1k3XuThhmMHMjxbH7N0q6ajWZOxpBQ6wFI8IaXUX
 8LAvx7K5dQDx8/dHnfdrxT3IliMdWrlUIzShInP+gRh8/2XAHybOdl6lAuxmvuJEtug7
 AMgPScVY+8YoCKDQIHhFzUNOkU/9ZapH20nLm/X7TsWLqujkqJIkATnGf8Vq/KFO29ge
 VCYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=UUVyxjkbuLqUKGxUTaNNR5lkgKqUeq2Gn5ZHYZui5pM=;
 b=WBn+1F9CCH0hqkBUDrDr2IyABelzgGFYRll6tR53RVYzSZUalfjg6/G5Mss/a9xvwM
 CxplgRUh8qtmRH4XgdJRCgOon5jQ2ol8Vyf4Ta3EBZWMCx84w6tJ8uG7540QGrmBnZ13
 QmSYe8uRizBZUgo/VveYCbxxOJllJxuDSX26ThU5HifD/2JW660ss5qf8KZYDtp7CWkK
 qLTIzcTG2xTcdeTypsC9nJYfTOBGmtPaxRU2iDOSEaN2hc0ODYqXk4EkK92JYCU+08Q+
 Ayty1troi31wnoBP+0m2nGykGAaqDULaDfqnK1IEvWygMvEXlWidZG0U1TRolFj1+Gvo
 LgpQ==
X-Gm-Message-State: AOAM5324T1/l3w8G038BwupNWCQShS8U9wavMm7FWdGrm60iQ6aSe8Mh
 xlFvtu71E2CAjm6o7XWJg0g=
X-Google-Smtp-Source: ABdhPJypTXjaDIBM8IjeOVo53guti0gmA7SJsUGD2U6sTDrYqqsD1NOaBkaoW/qB3oxuwhM/Cmmk8g==
X-Received: by 2002:adf:a454:: with SMTP id e20mr35450163wra.310.1634561917553; 
 Mon, 18 Oct 2021 05:58:37 -0700 (PDT)
Received: from [192.168.1.36] (213.red-81-36-146.dynamicip.rima-tde.net.
 [81.36.146.213])
 by smtp.gmail.com with ESMTPSA id a127sm17334230wme.40.2021.10.18.05.58.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Oct 2021 05:58:37 -0700 (PDT)
Message-ID: <64e4c1f4-ad2f-a4ba-ca76-8b1dafe8071a@amsat.org>
Date: Mon, 18 Oct 2021 14:58:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v7 03/21] target/loongarch: Add main translation routines
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <1634561247-25499-1-git-send-email-gaosong@loongson.cn>
 <1634561247-25499-4-git-send-email-gaosong@loongson.cn>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <1634561247-25499-4-git-send-email-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, richard.henderson@linaro.org,
 laurent@vivier.eu, peterx@redhat.com, f4bug@amsat.org,
 yangxiaojuan@loongson.cn, alistair.francis@wdc.com, maobibo@loongson.cn,
 pbonzini@redhat.com, bmeng.cn@gmail.com, alex.bennee@linaro.org,
 chenhuacai@loongson.cn
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/18/21 14:47, Song Gao wrote:
> This patch add main translation routines and
> basic functions for translation.
> 
> Signed-off-by: Song Gao <gaosong@loongson.cn>
> Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/loongarch/helper.h    |   9 +++
>  target/loongarch/internals.h |   1 -
>  target/loongarch/op_helper.c |  22 ++++++
>  target/loongarch/translate.c | 160 +++++++++++++++++++++++++++++++++++++++++++
>  target/loongarch/translate.h |  27 ++++++++
>  5 files changed, 218 insertions(+), 1 deletion(-)
>  create mode 100644 target/loongarch/helper.h
>  create mode 100644 target/loongarch/op_helper.c
>  create mode 100644 target/loongarch/translate.c
>  create mode 100644 target/loongarch/translate.h

> diff --git a/target/loongarch/internals.h b/target/loongarch/internals.h
> index cfb08df..1052cb6 100644
> --- a/target/loongarch/internals.h
> +++ b/target/loongarch/internals.h
> @@ -9,7 +9,6 @@
>  #ifndef LOONGARCH_INTERNALS_H
>  #define LOONGARCH_INTERNALS_H
>  
> -
>  void loongarch_translate_init(void);
>  
>  void loongarch_cpu_dump_state(CPUState *cpu, FILE *f, int flags);

Remnant from previous patch ;) Not a big deal.

