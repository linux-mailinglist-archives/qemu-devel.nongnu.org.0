Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F12E3643DA5
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Dec 2022 08:31:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2SPx-0000ai-8R; Tue, 06 Dec 2022 02:31:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p2SPq-0000Yr-SW
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 02:31:00 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p2SPp-0005Ag-9A
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 02:30:58 -0500
Received: by mail-wr1-x42c.google.com with SMTP id h10so12655134wrx.3
 for <qemu-devel@nongnu.org>; Mon, 05 Dec 2022 23:30:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=InGK9R4ZfRqY/cfCXbL9StrUjEuMHMFj7f31SeqR3dg=;
 b=zEoQP/ff9UmFOEA1qcymChxj/hRW5L0tKyWS770FVNT+EwedNjAH4r5BAResOFjw0e
 CuyUkwOW/M4SLS1vgvSXGdWxGI27Q6QJSNCBLBX/u8zGgMsIKd4jAJ/WD6iVSNiNVqb1
 w5D4CmFDVqsjSyQd/kuqcgkHhXuEdMfqqVswJ3/ZUb8J1Sibea5j35VcsM8SQfR0MekM
 krFIIDaAHcmcM6kYmyxSpM64srlmt1lMxXer1C0HCPTn02tdbnpBTTvTRlvn8Yp5hVMs
 lVJCxKMzIivKL+sRAqqTx1IqzSEjt9pmLSn5Uwb3uWbkFfCf0cTPn4sRXgXrAfIAOGbd
 K7mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=InGK9R4ZfRqY/cfCXbL9StrUjEuMHMFj7f31SeqR3dg=;
 b=7B7vgCCmRLSkLOW/cN9RU/CMD2qlXMFy1Oti66raA0+uJ8CWcegBzrWnOM4YWajS4D
 Dd425gu1TCEDP+klWce1Xfm4cAQLOeGaZ6XwNoQhUxj+2Eft3Fx8JPehqK2N6+EEJcLV
 5WgXtL6ptRWX8tSdvQ20OfAz8Q5dqH9OXKOitcTpPW6Jp83Wjvt3EN4ix24v/GlKZP8R
 KwWucoNt9cUBrL+PF7PvhaU1rKdoETYzt1kAwSZnTc+Te8tDUzD38wfash9QfMT0ajso
 OMJeupaLKQc1ZdRH0jdyhBRlaVumWj8ga78SKRIHwmsPLsaIosIZTLuNN0s+ZQabFAFj
 QBfA==
X-Gm-Message-State: ANoB5pnFAjwz/Ph4pEZxD6XqH8jH6/V4ZbEWINKb9gr+H7kYN5kJCO7R
 4PzpUnOg/qqvwwFhW7EV1w/2p17UbbuP2XaR/cM=
X-Google-Smtp-Source: AA0mqf7KH4U2uhvjXhjUDLgV97bnXv+7urMFw8kj2cs+zerBXKUolYF1Up9sd3OAbARtOr/XbMEIgg==
X-Received: by 2002:adf:f949:0:b0:236:704f:29f4 with SMTP id
 q9-20020adff949000000b00236704f29f4mr52780106wrr.11.1670311855590; 
 Mon, 05 Dec 2022 23:30:55 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 l11-20020a1ced0b000000b003b3307fb98fsm19272130wmh.24.2022.12.05.23.30.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Dec 2022 23:30:55 -0800 (PST)
Message-ID: <2ba4196b-c954-124b-644a-a63091b254bd@linaro.org>
Date: Tue, 6 Dec 2022 08:30:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH 7/8] tcg/loongarch64: Use tcg_pcrel_diff in tcg_out_ldst
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20221206044051.322543-1-richard.henderson@linaro.org>
 <20221206044051.322543-8-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221206044051.322543-8-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.265,
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

On 6/12/22 05:40, Richard Henderson wrote:
> Take the w^x split into account when computing the
> pc-relative distance to an absolute pointer.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/loongarch64/tcg-target.c.inc | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
> index 2044897e36..47465b8c20 100644
> --- a/tcg/loongarch64/tcg-target.c.inc
> +++ b/tcg/loongarch64/tcg-target.c.inc
> @@ -701,7 +701,7 @@ static void tcg_out_ldst(TCGContext *s, LoongArchInsn opc, TCGReg data,
>       intptr_t imm12 = sextreg(offset, 0, 12);
>   
>       if (offset != imm12) {
> -        intptr_t diff = offset - (uintptr_t)s->code_ptr;
> +        intptr_t diff = tcg_pcrel_diff(s, (void *)offset);

Nitpicking? const void *.

>   
>           if (addr == TCG_REG_ZERO && diff == (int32_t)diff) {
>               imm12 = sextreg(diff, 0, 12);


