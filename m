Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AA61400F01
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Sep 2021 12:11:39 +0200 (CEST)
Received: from localhost ([::1]:38942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMp7i-0000vk-Dv
	for lists+qemu-devel@lfdr.de; Sun, 05 Sep 2021 06:11:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMp4f-0007Ql-I2
 for qemu-devel@nongnu.org; Sun, 05 Sep 2021 06:08:30 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:41778)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMp4e-0008DV-6V
 for qemu-devel@nongnu.org; Sun, 05 Sep 2021 06:08:29 -0400
Received: by mail-wr1-x42e.google.com with SMTP id u9so5159223wrg.8
 for <qemu-devel@nongnu.org>; Sun, 05 Sep 2021 03:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=tup7/c1R2EZYksYtfylq9V1w0tED5T1ADiiOD8ibT4I=;
 b=Qn5wbjwST0zrIbRhTQWrOXQk5XeENJPKgkFrtC87syJJJeZgmy1z8lCPXFZmj70qtk
 FEQSYP0VovqaaMI0p7yyaQA+1LJTtu8r6j/YXivol2YlbWr3ozVmmV0BVgMHTeCDxJ0p
 rueYCK0Kj6nfTOmZ7DxFw/G00Z4z3WSZ0sugrifddwe+H2eyWJku3owO/+JbCLVYzFmy
 C0CuMegMT45fKOHFDbBfUoZK8lhxjGbIpiaYzyAzQ27D0OzR4NAFjGc5d8208WoZdeT4
 AYvHIuPhUsY5TF/FGNb1pB6Jgx12Hi856RYbuKYt0IHeTDiSc8bJucQf1N0kIk8uuGH4
 SgIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tup7/c1R2EZYksYtfylq9V1w0tED5T1ADiiOD8ibT4I=;
 b=fz7rd2a6bIeBwsZEgMZ7sJycACDhKp3dRrHvqpdNuRiarevpS2XuWOmhdhhh5i+GBK
 EyRNFQaFEphEJH09Jak8Lv9kmVFGM9P6uw9B6fGVCFzjIWBRvEn1kLrFoOL6skGv1cre
 MWvnYs3vvUWwNaxvGtm5+kSbOVNsqoaKDMfo8wMnTmKqG2MhwceTPyA+F46swKoPEWkh
 cpwzj6PPuPQ9u/ahFdyAbXA4+rSJSy0iUojJIp4INwauEzZSit+gXylXo5hV0xFP5ufd
 xpuHy0/74fkJRymzha3NChDuQAATllAgWcUYLvPArU4GJXx29Q8hklWHwYvLEvF7p5hT
 NCaw==
X-Gm-Message-State: AOAM530A18aQVixFNiEn7/dJaDjgOBvhuih0BFrKJyS4HFhM0MNz1uNW
 vfcSfBxPFJPka6Jc/uJcnFq/0g==
X-Google-Smtp-Source: ABdhPJza+6yJcUfRwDvxtBjjaRRs84DulB8cDrhGj1qDEvxwEhex88k927jNsFS1hbJglkKamMWDiw==
X-Received: by 2002:a5d:6b8a:: with SMTP id n10mr7695136wrx.276.1630836506621; 
 Sun, 05 Sep 2021 03:08:26 -0700 (PDT)
Received: from [192.168.8.105] (206.red-2-143-78.dynamicip.rima-tde.net.
 [2.143.78.206])
 by smtp.gmail.com with ESMTPSA id n4sm4561346wra.37.2021.09.05.03.08.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Sep 2021 03:08:26 -0700 (PDT)
Subject: Re: [PATCH v4 21/21] scripts: add loongarch64 binfmt config
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <1630586467-22463-1-git-send-email-gaosong@loongson.cn>
 <1630586467-22463-22-git-send-email-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9bde0e87-cb30-adbe-3a7e-46fd779dc664@linaro.org>
Date: Sun, 5 Sep 2021 12:08:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1630586467-22463-22-git-send-email-gaosong@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.832,
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
Cc: peter.maydell@linaro.org, yangxiaojuan@loongson.cn, david@redhat.com,
 bin.meng@windriver.com, mark.cave-ayland@ilande.co.uk,
 aleksandar.rikalo@syrmia.com, jcmvbkbc@gmail.com, tsimpson@quicinc.com,
 alistair.francis@wdc.com, edgar.iglesias@gmail.com, chenhuacai@gmail.com,
 philmd@redhat.com, atar4qemu@gmail.com, thuth@redhat.com, ehabkost@redhat.com,
 groug@kaod.org, maobibo@loongson.cn, mrolnik@gmail.com, shorne@gmail.com,
 alex.bennee@linaro.org, david@gibson.dropbear.id.au,
 kbastian@mail.uni-paderborn.de, crwulff@gmail.com, laurent@vivier.eu,
 palmer@dabbelt.com, pbonzini@redhat.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/2/21 2:41 PM, Song Gao wrote:
> Signed-off-by: Song Gao<gaosong@loongson.cn>
> Signed-off-by: XiaoJuan Yang<yangxiaojuan@loongson.cn>
> ---
>   scripts/qemu-binfmt-conf.sh | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

