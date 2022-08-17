Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42483596F55
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Aug 2022 15:19:10 +0200 (CEST)
Received: from localhost ([::1]:49576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOIwu-0007nk-DS
	for lists+qemu-devel@lfdr.de; Wed, 17 Aug 2022 09:19:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oOItl-00054o-EA
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 09:15:54 -0400
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c]:42673)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oOItj-0002wz-Ku
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 09:15:53 -0400
Received: by mail-oi1-x22c.google.com with SMTP id p132so15335305oif.9
 for <qemu-devel@nongnu.org>; Wed, 17 Aug 2022 06:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=Eo54v4tCR8tYaHwypVmPwY+HSyPFwxFTMgke3kLjZbk=;
 b=RL5mXxi4waIkpEGDuY8QCSMPYKUo3H5k3nya11g02WdKNeFJ34zWtvDJpGYlAuIRBj
 wT3uDQWZBmbzBxsF5yxy1SVmr7dkySIC7+PAcLO57ESYhuKEw27D6lFKm1GXcts38cGQ
 hUMA9fKRnVMNkGvdY0D5EebQg96B1+XN01bV2PQAycT3tzNSc32sOfHni0R/UY6cG6z1
 GeHJzWQA5HnE2Y7Uk7OrnUnRrCAKYz3b9Nmiy1CGiVXsWUM1hUnBN/SK/pvjH07eVAMA
 C85vX3tTZDx8deE4q4o1clevCUNbT2M72aZ7tUZ5S0Q7Knqxm/1B8iBwp6MCstwQ7tlI
 HP+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=Eo54v4tCR8tYaHwypVmPwY+HSyPFwxFTMgke3kLjZbk=;
 b=4bFx2ezyp0jb72HdTEMKyRPmVnHnz0uj19SuJN4UTDWBgGOdjiekrQWS9xzzELFXru
 NWy7R3GsYhfysM6J3xbTcarZO1wUEghqzO+bys76F8L5FUfCo5a1fcArbHsnA7ebowGP
 XI8YUlyJ1Wqkn2Fc8jMEVGi/oWHezQVsIUCAGy91tcukYCcEKiaXGQpknflLZ67EbLRl
 wzM2d7vvZQdsI90bRxHp80UTatIgRZ3u4XhSzqusQbhuuINsvZDlFn/G0jSBFgOLbjSc
 EAci1rCPU7MklwiaRl/ORPChBy1LlhrkRV6tPxxSxW+g/mEDSqKAO853gyZSYT1iaB6R
 wcng==
X-Gm-Message-State: ACgBeo1JJziWaIuJmGhwqhN19C7gkOz8QLI9/VOp/wJysy++YUnsH0SZ
 LPTuJ6t7XHqQpehYvavQ8mIJqg==
X-Google-Smtp-Source: AA6agR5ZV+t/8pP8dgXIyFwFXOFY215DWh/uPRF2R4la0FMKmx6NXnKz/QHANK0K+AUAX0Eiq9wR5Q==
X-Received: by 2002:a05:6808:643:b0:343:1207:b0b7 with SMTP id
 z3-20020a056808064300b003431207b0b7mr1407426oih.97.1660742150001; 
 Wed, 17 Aug 2022 06:15:50 -0700 (PDT)
Received: from ?IPV6:2605:ef80:80f2:9412:75e8:df77:dd33:d368?
 ([2605:ef80:80f2:9412:75e8:df77:dd33:d368])
 by smtp.gmail.com with ESMTPSA id
 w5-20020a4ab6c5000000b00435785e7b49sm2991577ooo.19.2022.08.17.06.15.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Aug 2022 06:15:49 -0700 (PDT)
Message-ID: <cc2cab12-2dda-25db-5696-fe13971db467@linaro.org>
Date: Wed, 17 Aug 2022 08:15:46 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH for-7.2 14/21] accel/tcg: Hoist get_page_addr_code out of
 tb_lookup
Content-Language: en-US
To: Ilya Leoshkevich <iii@linux.ibm.com>, qemu-devel@nongnu.org
Cc: laurent@vivier.eu, alex.bennee@linaro.org
References: <20220812180806.2128593-1-richard.henderson@linaro.org>
 <20220812180806.2128593-15-richard.henderson@linaro.org>
 <15f8efa3aae897569383305155315d03ee5b70e3.camel@linux.ibm.com>
 <a67bc498-5155-cc40-9640-81db22b2b37a@linaro.org>
 <0727c2600d0c16caf43689a9c3abf5ca2017f28f.camel@linux.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <0727c2600d0c16caf43689a9c3abf5ca2017f28f.camel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22c;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 8/17/22 06:08, Ilya Leoshkevich wrote:
> @@ -2243,6 +2250,13 @@ void page_set_flags(target_ulong start,
> target_ulong end, int flags)
>               (flags & PAGE_WRITE) &&
>               p->first_tb) {
>               tb_invalidate_phys_page(addr, 0);
> +        } else {
> +            TranslationBlock *tb;
> +            int n;
> +
> +            PAGE_FOR_EACH_TB(p, tb, n) {
> +                cpu_tb_jmp_cache_remove(tb);
> +            }
>           }

Here you would use tb_jmp_cache_clear_page(), which should be moved out of cputlb.c.


r~



