Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE69C2F090B
	for <lists+qemu-devel@lfdr.de>; Sun, 10 Jan 2021 19:33:07 +0100 (CET)
Received: from localhost ([::1]:57262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyfWU-0006jj-I8
	for lists+qemu-devel@lfdr.de; Sun, 10 Jan 2021 13:33:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kyfV2-0006Hv-4W
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 13:31:36 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:37980)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kyfUx-0008Kq-KR
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 13:31:35 -0500
Received: by mail-pl1-x62e.google.com with SMTP id 4so8316334plk.5
 for <qemu-devel@nongnu.org>; Sun, 10 Jan 2021 10:31:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=zO6dcZPOxHPbFbpThbflMtNgqfTRdsVIvmotWRlEgZE=;
 b=nP9UPXgNGFjkQeWfN8XQFByQqp6sC3hKQu8B9KpFW1U7rgPRn3rPv9T66VKHCFqmMn
 1ITeSsBliAO0aJ0Snb4wetp3lMICPXDxVLt6gqRokP/AfAboHLXnQa6kENx3hSOEk1HD
 /ZJrAk1vtze9myE84RZlC5odJBShwKWEVlzX4X/jGwW3vkzw4KsX505bbG1kVkFUt/Ai
 RQohJysOn1ofhP3x8FFpMBsA/5SSsaPX7bAqlZlG1l2sM8Xy1ZOO4HUTtW3zLF112Wvz
 oW57dmCr9rBUNlC7dmodl858SXYB+huXlW+VG/mkb010LEYvB0yo11qHlgSx2Q2CrFRM
 LxRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zO6dcZPOxHPbFbpThbflMtNgqfTRdsVIvmotWRlEgZE=;
 b=UxNE3qstQtyh86Ku3mNUPKrOE4CZG40HtBZ4B5XtgpcQjUhU91TG5EdROYN/Dtex4+
 u+DYhXeSuujYkwxEF39llVX6YuIVDACrKEUgQA/GsdTJeo7PRiEvvu/PW67iOmRLJyuz
 llmTLqdtbDKad4aHKY6N7/HnHA++rzdj73erKtaB7m/xrLDRYrP5Odv1XwEzv6Lr99cK
 tIYbxStc64SuZLm9fysfq0p7RZeiSEyn5fAw8ByittjFv/aCZCDMaWN8PLsbjLZY5MTi
 Cj7ISdf7hsYnc0daI9YDXw5Rx1XPXAnvTF+n7VbXXKsNaBWN41bWjBmrgAsCie5U6b3Z
 Y3NA==
X-Gm-Message-State: AOAM531xvF/bBw9f0Tn41LNLr0wKlOpgdLK+2r2/PlZZuM970GNHYoDr
 RisrCiy3wIx5BRpPMRVtTyRheA==
X-Google-Smtp-Source: ABdhPJytP07MvvwC4v7r9up8M+L3skZH/SzFwqbTrSjV0m6GyuDiY/Ci4dnoxACBtcEipvRaLeBa1g==
X-Received: by 2002:a17:902:aa84:b029:da:f114:6022 with SMTP id
 d4-20020a170902aa84b02900daf1146022mr16083152plr.46.1610303490082; 
 Sun, 10 Jan 2021 10:31:30 -0800 (PST)
Received: from [10.25.18.117] (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id k9sm14771845pjj.8.2021.01.10.10.31.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 10 Jan 2021 10:31:29 -0800 (PST)
Subject: Re: [PATCH] target/i386: Use X86Seg enum for segment registers
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210109233427.749748-1-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2f72248d-7c86-9fa0-bd33-9bc6c75d4464@linaro.org>
Date: Sun, 10 Jan 2021 08:31:25 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210109233427.749748-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.012,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/9/21 1:34 PM, Philippe Mathieu-Daudé wrote:
> Use the dedicated X86Seg enum type for segment registers.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/i386/cpu.h            | 4 ++--
>  target/i386/gdbstub.c        | 2 +-
>  target/i386/tcg/seg_helper.c | 8 ++++----
>  target/i386/tcg/translate.c  | 6 +++---
>  4 files changed, 10 insertions(+), 10 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

