Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87E30677659
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Jan 2023 09:33:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJsGH-0005u0-TJ; Mon, 23 Jan 2023 03:33:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pJsGG-0005tY-7e
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 03:33:04 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pJsGE-0006oC-G6
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 03:33:03 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 e19-20020a05600c439300b003db1cac0c1fso8513089wmn.5
 for <qemu-devel@nongnu.org>; Mon, 23 Jan 2023 00:33:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gnLcZ9W6nPbBNArLPALx3TAsFHtRVDAFwTrcKscxYOM=;
 b=JbTcLCcqWr/sv/GPT1+PLJtzgoLHfGpf7A2EGfW2mZtCH6JBjC1mF6JOe62A2tMcAg
 JslkMUktTKGYcccuY/vonvIo0wX0W4GVEWQJ3qZ71nm0uY/eUJId6k5V/lXElC+6X33E
 TJ4pc0Bxa/Ap9YEfb/00t7BGoUCYobkSV2yUeLYNSUg/kFRFrgUAqXyxK6CLXsMZQg/v
 keTm9EMip+tkna3OtiB0wgKn9R4CQOP+yOU9I3buNnYNzu8GMogBSHTKfGg+u0jZK4/X
 FKM9OUhCVpXOB6q14hUXTOMPfO5vlf2N36H7tmOl3euK+tEwS3uUfp+EfwO9r8Bom4/j
 xLcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gnLcZ9W6nPbBNArLPALx3TAsFHtRVDAFwTrcKscxYOM=;
 b=65GG5sffj4NRUn+TDQIA6NSsMj+Qy+OoZlfpWoCRQCbtgaRLEHdkll6tH7cC0MMGcz
 RjfvAyOwTtTLDDMD7KtZ8uBRuZWTbFo5KEBAg7ICSD6hAlPTbOMbA4qAlRAM0gPBkkXi
 8rzsvMJz/12aOcsbBeuttfnaIP4X3Ui01X4cZup/AZ6pj1loild5M2mevJUHD/zpemkN
 qubkC1Lkpxc4V2Qe3uQdryyRiZyD9sNWo4L23gvh4ubhtW3QNTGffMAe/1jxqEa4weJc
 4/toS+wYNfoz64XpzTkU5xrq5dX4B4p0O6efV/s+yRrfFXQQu3leXAjYlHBxlDyWKLzm
 TEYw==
X-Gm-Message-State: AFqh2kqlVDNXv/wwtCduEEx9vDoZIjTvACAw7dVZ29n2TUZUu1AWFecn
 HwsadnnRuk5/q26Y+EhJOT7saw==
X-Google-Smtp-Source: AMrXdXu2/sxj6bd4CX1OiLGJATBQajYHLtXXkUOfrMUEn9eUr65+Kj396OOrq1R+9AEazMQ0xmjS9A==
X-Received: by 2002:a05:600c:601c:b0:3d9:ee01:60a4 with SMTP id
 az28-20020a05600c601c00b003d9ee0160a4mr23220077wmb.1.1674462781234; 
 Mon, 23 Jan 2023 00:33:01 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 hg8-20020a05600c538800b003d974076f13sm9909926wmb.3.2023.01.23.00.33.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Jan 2023 00:33:00 -0800 (PST)
Message-ID: <89366a18-cd2c-7d74-8ae1-05f00f9f875b@linaro.org>
Date: Mon, 23 Jan 2023 09:32:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 09/10] tcg/loongarch64: Use tcg_pcrel_diff in
 tcg_out_ldst
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: git@xen0n.name
References: <20230118011123.392823-1-richard.henderson@linaro.org>
 <20230118011123.392823-10-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230118011123.392823-10-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.149,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 18/1/23 02:11, Richard Henderson wrote:
> Take the w^x split into account when computing the
> pc-relative distance to an absolute pointer.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/loongarch64/tcg-target.c.inc | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



