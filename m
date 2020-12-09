Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2265E2D3756
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 01:04:10 +0100 (CET)
Received: from localhost ([::1]:46400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmmxl-0003Nl-4s
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 19:04:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmmvU-0002rI-2F
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 19:01:48 -0500
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:42314)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmmvS-0001GU-D4
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 19:01:47 -0500
Received: by mail-ot1-x344.google.com with SMTP id 11so492049oty.9
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 16:01:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=UGN7ce97iUS7xAaf8PkOshizvLaxeAOhvlK2XGp9GOE=;
 b=crUfvHi76u6O6k4edlAzkgUWdET/mI7l0yOaSGM7IEWQaOdae+DNUokx7Rd560H2js
 z5AGCX30DgosZ6RXKAU7n+LTgGDT+Pg22DcQ5mrbkSW4gRxQ0Rv3QA6zcYTqV1hCPS6U
 t1c5DsZN/0tlOZCVlVgxNrN05F+R04iaMopshYfYp39rbeT7j0uYxyEXSz2UjZRFpQ2x
 zUMUfH5sSy2xudPGt6k61SbcXZKraQIGIVRr723WSvhpAbucjN/nh4jzzMhdx0beEG7P
 lXljI7L85QAnD3YG03/5a5rM9kWcV8u2rn7kK2xhZcGCNIa3MsLes66gI7rlehZUGopM
 JSqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UGN7ce97iUS7xAaf8PkOshizvLaxeAOhvlK2XGp9GOE=;
 b=nwkEmks8xVCfipyqEvgr7TUdlg8IeqjomKO/Izz18PA1OlziZ8fR3ZoWXbkqjHqN1j
 WDARPlmoa32ww79iRUEEpjvxQ+rbm5VE9REci9uC6syDHEi17BZatzeOnG+bhjR03i4C
 2TgZ58n/Cq0dk5Jbz9zHHKtIw4J843oZrX2CaES8c+yVJ5I+yszO7UOAKVeIgfRfTv3w
 eIJlP/zvwCFDWy6Rv42WfmKkpUtCK0voQ68MpKZiZfhbmcRNroBzU8hCt/pja3gj0P04
 tomma8DA+zJVyNyaSZd6tBCDS6IfHScH4eLsFmbKJ2ss4VvKU5EjFzx7heJgZcTXUVAU
 9otw==
X-Gm-Message-State: AOAM53139sEj8KMa8Nwhg0/OYZAKXQJbVUtKVDUUn/IqagQWajCvbp1z
 pMYSC98sVCNn8u81sbHJ4ATjvw==
X-Google-Smtp-Source: ABdhPJx1tD5000NPvzfRDTSmKInCaJQiH6pyx/1il3ephVK6HxuyYDpis062nEqE1/M8Dg73zqVl/g==
X-Received: by 2002:a9d:590c:: with SMTP id t12mr498539oth.308.1607472105139; 
 Tue, 08 Dec 2020 16:01:45 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id p4sm92014oib.24.2020.12.08.16.01.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Dec 2020 16:01:44 -0800 (PST)
Subject: Re: [PATCH 14/17] target/mips: Declare gen_msa/_branch() in
 'translate.h'
From: Richard Henderson <richard.henderson@linaro.org>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201208003702.4088927-1-f4bug@amsat.org>
 <20201208003702.4088927-15-f4bug@amsat.org>
 <45ab33e0-f00e-097a-74fb-4c7c42e29e33@linaro.org>
Message-ID: <b0cf35c4-a086-b704-5710-0f05bf7921bb@linaro.org>
Date: Tue, 8 Dec 2020 18:01:42 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <45ab33e0-f00e-097a-74fb-4c7c42e29e33@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::344;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x344.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, kvm@vger.kernel.org,
 Huacai Chen <chenhuacai@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/8/20 5:56 PM, Richard Henderson wrote:
> On 12/7/20 6:36 PM, Philippe Mathieu-Daudé wrote:
>> Make gen_msa() and gen_msa_branch() public declarations
>> so we can keep calling them once extracted from the big
>> translate.c in the next commit.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>  target/mips/translate.h | 2 ++
>>  target/mips/translate.c | 4 ++--
>>  2 files changed, 4 insertions(+), 2 deletions(-)
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Actually, I think this should be dropped, and two other patches rearranged.


r~



