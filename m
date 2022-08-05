Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C7D58AE8C
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 18:59:11 +0200 (CEST)
Received: from localhost ([::1]:48354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oK0fH-0004iE-1k
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 12:59:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oK0dn-00038Q-Jy
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 12:57:39 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:38549)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oK0dl-0007DW-03
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 12:57:39 -0400
Received: by mail-pg1-x52e.google.com with SMTP id r22so735829pgm.5
 for <qemu-devel@nongnu.org>; Fri, 05 Aug 2022 09:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=0r17JOHzCuvkrCKpz40EhicuPDkr2U1WuxkKtdkLTB4=;
 b=Eu0MpU7QUXzriscwneNjIRMuii2xsbbO8tQv5HWAOZi1rmLFEiQyP7KLCVbuMy7eD7
 kpMVGQiYJ8fkayuNdK+b8D90AWGycOxAzGJ4Vi7QXFwJ9VW/wmBegMC5cE90kLsHcK+2
 3SBbNmJaLbOUSWmoxocJXFZiVbJ354yodcluOg0X7DpYv69RSC23RsyHr4+qxlqd7Wif
 WOutQ8nSmDiOkG9lkJjqC6xXqtsZriT7jMpla/YB7PH49z0+H3a8V+0ZwJepxfVrBCM1
 CKwLyNH/XESvDebIEQO5+AOdvooXdxl1au+TJNcfcHVH1EDwm+4Z1O0KqhdpjAIrctmC
 NJ1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=0r17JOHzCuvkrCKpz40EhicuPDkr2U1WuxkKtdkLTB4=;
 b=aBJtAF6NoBDLjwGdcSobs/rk6ibPJvwBUoUClWhyTTmH2vjNjcAwp1LLsH4/S8chWq
 e8Uxq3hiK7olPWDsu+IFOCtzQWVOcEbEwFZin6i8fq54MbIyOCwo92Il6fbhlKHtuwgr
 u69zkXSPPwDNQNVQx5x5gYJf18nBSyLfuvGlm0qBeigUynpq2pihx3IjrSrQmPinKyMP
 lJ5ZyTvX8+5hSQpkPkX9BOlOEUZ8UjHLrWm0OBmFiQKs5i5aXroSEmltxfPN7Yjxs/Ox
 D/b0KVNVpoL0Dl0EVCCx7cuJ4DbjYkz8nph+l5HyCoXAXk195Mox6ci92RxI6slwOmN6
 0EbA==
X-Gm-Message-State: ACgBeo0TmL2UEVH17icepZdN5SZmED9xYf1eITymE1KYcmuF6iwl1IsX
 D74AIgPKvfpFYtV+cCXWLtMXAQ==
X-Google-Smtp-Source: AA6agR7CP7icWKmdZLQOt/lROgNl5S1DYT+BYyH7GBTcLK4sfIWYxyUPatxuos+LrUmzy35mU9puxQ==
X-Received: by 2002:a63:fe52:0:b0:41d:2966:48d0 with SMTP id
 x18-20020a63fe52000000b0041d296648d0mr787629pgj.151.1659718655392; 
 Fri, 05 Aug 2022 09:57:35 -0700 (PDT)
Received: from ?IPV6:2602:ae:154e:e201:abf8:e436:f4c:9089?
 ([2602:ae:154e:e201:abf8:e436:f4c:9089])
 by smtp.gmail.com with ESMTPSA id
 a6-20020a170902ecc600b0016d5a356b31sm3309117plh.116.2022.08.05.09.57.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Aug 2022 09:57:35 -0700 (PDT)
Message-ID: <1c7b471e-6e50-069f-4107-b638e1211adb@linaro.org>
Date: Fri, 5 Aug 2022 09:57:33 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] hw/loongarch: remove acpi-build.c unused variable
 'aml_len'
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, yangxiaojuan@loongson.cn
References: <20220721040046.3985609-1-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220721040046.3985609-1-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
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

On 7/20/22 21:00, Song Gao wrote:
> @@ -413,7 +413,6 @@ static void acpi_build(AcpiBuildTables *tables, MachineState *machine)
>       AcpiFadtData fadt_data;
>       unsigned facs, rsdt, fadt, dsdt;
>       uint8_t *u;
> -    size_t aml_len = 0;
...
> @@ -451,7 +444,6 @@ static void acpi_build(AcpiBuildTables *tables, MachineState *machine)
>       fadt_data.xdsdt_tbl_offset = &dsdt;
>       build_fadt(tables_blob, tables->linker, &fadt_data,
>                  lams->oem_id, lams->oem_table_id);
> -    aml_len += tables_blob->len - fadt;

This in turn removes the last use of fadt.


r~

