Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A998D584913
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jul 2022 02:30:16 +0200 (CEST)
Received: from localhost ([::1]:56008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oHDtP-0004Rs-8G
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 20:30:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oHDrL-0002nC-MS
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 20:28:09 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:41867)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oHDrJ-0004Zw-RM
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 20:28:07 -0400
Received: by mail-pf1-x435.google.com with SMTP id w205so3282029pfc.8
 for <qemu-devel@nongnu.org>; Thu, 28 Jul 2022 17:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ZwgS4h4pQDCY6Y9UtPOlhTNRJHn2MJnuVU4d6BUtn1o=;
 b=mQQkZseHyirjsHQi8y0NFNieGey85xRBf62MXvotuh5QqnpRh8HL27QzHSjzaxsBOR
 HaZOw8pU2WrChtPgZ0cdVvOLrppvzPomtz89yKCoS61qPPNON2pyDB1Anb/uNLolbWFH
 Sq3M5BL0nnQuf6R4hFsGEZhUMpK0hTRBW33/3TMiGXG87EJ3xAZbicS84MqgTeTuKFII
 hGSPQ7rDki31lV1MeW7PUk4DjQoAd7fSr2+CCaWfE2m4FE67MgccSCC/Ha2SI0Q+dQqg
 LDeyjkUVfacb/Zzniqfv/joqU2roZwHb1gUquTPE/a50nQ6KQxyPUb3rGnBnEBCLh+C1
 kS/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ZwgS4h4pQDCY6Y9UtPOlhTNRJHn2MJnuVU4d6BUtn1o=;
 b=hJpd0ZDu6ykDh6Ah6NkBI1ZMSfTeFGGOy9GnYCFLnSeyB+P0NRVQRsbfRiBnEDPLHb
 S1KyfUw2JzoFRTYn0LmqqCirfw7H18lEbfzMWv0//UP1wkZ+utp1SIxPsEl3vCfGXAI+
 hS7FHLn08Lf/j4uT/e4MTeFlOpqTLmLM5tVCMAoaw70/zlkiTf+ZvQ0iVljxbdAQpMuD
 NuaH+hC16Ts0iCJkvIlre8z+lSLJU7YOgg+iE0aMbj1OrgmXKRdJapCI+dZdLvX5nT0B
 ifB87x53yGckp+X7Zb8eOwKj+n2xwi/4V2yz/l/9k2zuFHf5DURby6cXczCMHfec3ke0
 geaw==
X-Gm-Message-State: AJIora/1K0Gusw2NrruvCDCYCDgA6vcZPMeKnONuHPwt9G+1pS05FCfr
 rPUXONsCAyjz6XjYdMRjDvd33A==
X-Google-Smtp-Source: AGRyM1vtmxv8JUTJVRYP7ZYso95GhpCwK99FdJd84LzQ4PDaoZ6LHa4NuV15aJln9hLOC+C3bBlTsA==
X-Received: by 2002:a05:6a00:22c7:b0:52b:af2:903f with SMTP id
 f7-20020a056a0022c700b0052b0af2903fmr981330pfj.3.1659054483635; 
 Thu, 28 Jul 2022 17:28:03 -0700 (PDT)
Received: from ?IPV6:2602:ae:1549:801:d1a3:8e57:d847:7607?
 ([2602:ae:1549:801:d1a3:8e57:d847:7607])
 by smtp.gmail.com with ESMTPSA id
 n28-20020aa7985c000000b0052bcb042c53sm963029pfq.42.2022.07.28.17.28.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Jul 2022 17:28:02 -0700 (PDT)
Message-ID: <fae4a641-80bb-d0c8-62aa-e988e87b4845@linaro.org>
Date: Thu, 28 Jul 2022 17:28:00 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PULL 0/3] ppc queue
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, peter.maydell@linaro.org
References: <20220728165519.2101401-1-danielhb413@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220728165519.2101401-1-danielhb413@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
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

On 7/28/22 09:55, Daniel Henrique Barboza wrote:
> The following changes since commit 3e4abe2c92964aadd35344a635b0f32cb487fd5c:
> 
>    Merge tag 'pull-block-2022-07-27' of https://gitlab.com/vsementsov/qemu into staging (2022-07-27 20:10:15 -0700)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/danielhb/qemu.git pull-ppc-20220728
> 
> for you to fetch changes up to 0c9717ff35d2fe46fa9cb91566fe2afbed9f4f2a:
> 
>    target/ppc: Implement new wait variants (2022-07-28 13:30:41 -0300)
> 
> ----------------------------------------------------------------
> ppc patch queue for 2022-07-28:
> 
> Short queue with 2 Coverity fixes and one fix of the
> 'wait' insns that is causing hangs if the guest kernel uses
> the most up to date wait opcode.
> 
> - target/ppc:
>    - implement new wait variants to fix guest hang when using the new opcode
> - ppc440_uc: initialize length passed to cpu_physical_memory_map()
> - spapr_nvdimm: check if spapr_drc_index() returns NULL

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~


> 
> ----------------------------------------------------------------
> Daniel Henrique Barboza (1):
>        hw/ppc: check if spapr_drc_index() returns NULL in spapr_nvdimm.c
> 
> Nicholas Piggin (1):
>        target/ppc: Implement new wait variants
> 
> Peter Maydell (1):
>        hw/ppc/ppc440_uc: Initialize length passed to cpu_physical_memory_map()
> 
>   hw/ppc/ppc440_uc.c     |  5 ++-
>   hw/ppc/spapr_nvdimm.c  | 18 +++++++---
>   target/ppc/internal.h  |  3 ++
>   target/ppc/translate.c | 96 +++++++++++++++++++++++++++++++++++++++++++++-----
>   4 files changed, 109 insertions(+), 13 deletions(-)


