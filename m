Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD762D1DBF
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 23:52:33 +0100 (CET)
Received: from localhost ([::1]:37190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmPMu-0002s8-4h
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 17:52:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kmPJa-0001Fw-0N
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 17:49:06 -0500
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641]:42223)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kmPJY-0006LM-Ho
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 17:49:05 -0500
Received: by mail-ej1-x641.google.com with SMTP id d17so21866225ejy.9
 for <qemu-devel@nongnu.org>; Mon, 07 Dec 2020 14:49:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=SzOO9HVfm1ejZvu9vr4/OYALgIUm2SYL80Vg/0vE8XI=;
 b=DhJUJJsDS03Vjoaxe9GzZ0mE1GU1bPO4pBfwo7DznmZjqR/1u7+nLLBmVUOlzoceqO
 J/7ihjnZrSmufZXOZC+PnGzr3gGx4MknS4DDwwSCahBj8YyOzlHz+zgHXUeB0/+7mjL1
 dxVj4tJ5yLk9pHJMSgWENv9UkL19w1Hb0tQZO5mH6uE6dGgCIVK6PE04M8lc/PvqNrzH
 Q5hzBWpC/dSnM3z7Joj90E1ourGwMsynnxOfEvs6MRih5Slb0DsqNUvZl5YYpslKpdK6
 NjHs/acT8SlGph7E6qVtUcUYKg/A7ckBd2okbeLRFctg+31DWFbmobQlihoWCScP5bTE
 DNCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SzOO9HVfm1ejZvu9vr4/OYALgIUm2SYL80Vg/0vE8XI=;
 b=LVB9yCd96+O8zRyDj8/7OCeGRNlXB6U+OzqJXe2h/cvPGMsj+eMklV4aUiXBXE6L3i
 DLKnAgLzjycgNFyteplqSQF06xqzMGTR71h2BkIUFwapHQODCeKNuelVjyT+Uy5okEXV
 xXYZapHQnwC66HqXKjS8XPYwy5VOAmTKZuvK71G4uNCm2Hm/F3sdRVi8HDWIlt0jr+M6
 8Wx1EqrTD2kVZ8fM1LxaOrNuZJmY4pG4jHgFXDpBJ/+ZWa4lZJwphz/4FJGMAYoOLpQm
 fhiOGrEJhMFAIeyoL1sanZZ2AvK1LXXB1bg4I8i80bDJc0UmNXHc9b2EWMlRhAcNIfha
 1agg==
X-Gm-Message-State: AOAM533zq9oSgZxelszpP5hr35SKZE0Nq/uB63VsqYnVj5x2CRiSwvsl
 7SfxLRTbDC1GtwvAkL6ixbU=
X-Google-Smtp-Source: ABdhPJxCmfOp5xF6i9V4EEcTz/7yLWVWDfnj2+PX++5VqmkslSOcHfWGpzi0pz0+9HjeTxd4cthqhw==
X-Received: by 2002:a17:907:2070:: with SMTP id
 qp16mr20715787ejb.503.1607381342670; 
 Mon, 07 Dec 2020 14:49:02 -0800 (PST)
Received: from [192.168.1.36] (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id c14sm15020227edy.56.2020.12.07.14.49.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Dec 2020 14:49:02 -0800 (PST)
Subject: Re: [PATCH 0/5] mips: Sanitize Multi-Threading ASE
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-devel@nongnu.org
References: <20201204222622.2743175-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <63253e5c-2e1a-d029-4e7b-3582745dbbf4@amsat.org>
Date: Mon, 7 Dec 2020 23:49:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201204222622.2743175-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::641;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x641.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/4/20 11:26 PM, Philippe Mathieu-Daudé wrote:
> Reviewing the MIPS code, ASE after ASE.
> Time for MT ASE.
> 
> - Introduce/use ase_mt_available() helper to check
>   if MT ASE is present
> - Avoid setting MT specific registers if MT ASE is absent
> 
> Philippe Mathieu-Daudé (5):
>   target/mips: Remove mips_def_t unused argument from mvp_init()
>   target/mips: Introduce ase_mt_available() helper
>   target/mips: Do not initialize MT registers if MT ASE absent
>   hw/mips/malta: Do not initialize MT registers if MT ASE absent
>   hw/mips/malta: Rewrite CP0_MVPConf0 access using deposit()
> 
>  target/mips/cpu.h                |  7 +++++++
>  hw/mips/cps.c                    |  3 +--
>  hw/mips/malta.c                  | 10 ++++++++--
>  target/mips/cp0_helper.c         |  2 +-
>  target/mips/cpu.c                |  2 +-
>  target/mips/helper.c             |  2 +-
>  target/mips/translate.c          |  4 ++--
>  target/mips/translate_init.c.inc |  6 +++++-
>  8 files changed, 26 insertions(+), 10 deletions(-)

Thanks, applied to mips-next.


