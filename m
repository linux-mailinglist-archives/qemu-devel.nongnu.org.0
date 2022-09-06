Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDB065AED66
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 16:34:37 +0200 (CEST)
Received: from localhost ([::1]:44964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVZeu-00012Q-Nj
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 10:34:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oVZYw-0003cg-9K; Tue, 06 Sep 2022 10:28:26 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:53768)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oVZYu-00038H-O6; Tue, 06 Sep 2022 10:28:25 -0400
Received: by mail-pj1-x1036.google.com with SMTP id q3so11467732pjg.3;
 Tue, 06 Sep 2022 07:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=MlM7VL0pyFAHRQv3VYLkyukiwI6TtP1z0ohO290kAtI=;
 b=pAmxJgPaERo6GJiAz4pvZ66pMe3/2UFBNALlKwkphIGjHQETLyR+ivIdFbo0BnR7nV
 dGWdvQS/iZZSuXuC6ZaWqAxd86DupetsIhSkVo6wVyXbGFa7RerG6kMCT2aCdWwiNMY9
 VVAt43uxoLgdjfWGGbuf4J8c4LBK4U+kLipMHCQNj4eBT/97Iy3fivpSWH2iV0N5DpS0
 96ilQ/JiVYAPtYqgFvZkstgAA+LNuk7xJIMjerEhb27dcvi82hlv2KCnlfPWMIZWEObt
 8nFn2AktYgIGfZMIfPVkEQY4WiW/ti3dRqGx+NvGHB5K000miPfxYCvVRIn2RQQljbzo
 e96g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=MlM7VL0pyFAHRQv3VYLkyukiwI6TtP1z0ohO290kAtI=;
 b=4d1sDKXzDWb/pGX4IzXhKV0oPUChE5yMYp1lg+7C81lMyHYfgi8hPOMBLcgI0REqG0
 IhUePX7Z5Ub+xuCnqqyYVVABssBJfFjC/hitkYnXEEy2RcsXUxNdAKsVwzVqqkvyq2O2
 +cM34SIyeMVBkytBnHe0vJQ6hAuodBjHzKjQPEDMlljo6xWITYZuAGonsGgbEZr90kbg
 OnAR/c5+QGnUs/CYVc/cKevUZRduvMdBsiVnDNSoUlzuVFlsnf2u3aF5QQQeNNH2SAHZ
 9+NVkt4T+CVtuNhdDoe+oXKRsIbxFctw5L1LtPm2VwSK/ugu8tm4R/GTyZcSPPUiKpUt
 1G5Q==
X-Gm-Message-State: ACgBeo1SIACAQkcea4+e44Odaq9nyANzyvjtVz7PPwmmKw98KlPPnyiV
 JUWLP3Ow2DN7bHTqJOHfSFPt77RJjb8=
X-Google-Smtp-Source: AA6agR57Y/6h2dRJoXGkosWQTcfWfusPQ8rrudtgA/KE6JRwI0M083wK2zUIN7QoNifmUktPMBcAeg==
X-Received: by 2002:a17:902:ec87:b0:176:d549:2f28 with SMTP id
 x7-20020a170902ec8700b00176d5492f28mr2583408plg.12.1662474502805; 
 Tue, 06 Sep 2022 07:28:22 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 a6-20020a1709027e4600b00176da1aae5asm1215698pln.70.2022.09.06.07.28.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Sep 2022 07:28:22 -0700 (PDT)
Message-ID: <52f24a19-a370-fa99-81e0-f2957597f979@amsat.org>
Date: Tue, 6 Sep 2022 16:28:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH v1 07/26] target/s390x: Remove pc argument to
 pc_to_link_into
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org
References: <20220906101747.344559-1-richard.henderson@linaro.org>
 <20220906101747.344559-8-richard.henderson@linaro.org>
In-Reply-To: <20220906101747.344559-8-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.752,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 6/9/22 12:17, Richard Henderson wrote:
> All callers pass s->pc_tmp.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/s390x/tcg/translate.c | 10 ++++++----
>   1 file changed, 6 insertions(+), 4 deletions(-)
> 

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


