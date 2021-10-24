Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72734438C0C
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Oct 2021 23:19:11 +0200 (CEST)
Received: from localhost ([::1]:35236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mekta-000550-JX
	for lists+qemu-devel@lfdr.de; Sun, 24 Oct 2021 17:19:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mekrZ-0003Dl-7o
 for qemu-devel@nongnu.org; Sun, 24 Oct 2021 17:17:05 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:51877)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mekrX-0004l5-Of
 for qemu-devel@nongnu.org; Sun, 24 Oct 2021 17:17:04 -0400
Received: by mail-pj1-x1029.google.com with SMTP id u12so2701669pjy.1
 for <qemu-devel@nongnu.org>; Sun, 24 Oct 2021 14:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=9UySbLP9oa0Vr69AG/mXspXmlmQqsujyNuja+hkxnCk=;
 b=E/fztLcxPClPBW7WCOoU2gCXlwjnyk0r4KtePHaH5sIok2NKfzWwVIRFzvmHEYamJ9
 ARVPUeBVBv5xUJel1qiHvY+vXjpameE61y+RZSZ0wpSpiHGrli6kfQhaSlC9V+n6de2d
 JuNcuJcYa1DsnwYapwUJ1z9gXz0GD295RH6wNdFzGYXWRAqHVh9mcPjju+d+nynvRapd
 pubi9v/4oNWZHEYD2HLqPUedvOdlkQU0rn2bEHunX4jX2bos2EmjehybVBU2zItzLcm9
 +hNsjcO3X1RX5tDp6hXkgMqcxk75tXKg3YLC2iJ9PHpycBfK56rMv8/cf61PtD9eo+tq
 /0rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9UySbLP9oa0Vr69AG/mXspXmlmQqsujyNuja+hkxnCk=;
 b=KbcsZ6RxOP+cZU0UWb9QMcx4hjGfZQ4aRlWXrj0+pW0NGOYcY9lbIfSmm2CMjEkITy
 tgSG2vjpd3fAiiorFD8cnkCXJlr8tHBhqiRlimx4R3AZwOWEvzFL/ohADQiE6DTt7HoC
 MRHNYLoCFFaxdlB8FH3pt29l3zyZ6r8yQR+4sFfPQsoeTOqqtC/JjgwI1AfPYSEnSVtO
 TSVEzUuIo5jTQvbA3ansiZkiLkt6JWnGPe6qZHGhdXl/XgQokbfD7rSdJAh4AVovo29M
 B3/7oMmZRVGRUd3Nwas/3hcllAwO7TRie5FVxF/L762N2natcQR8hIz2NGaqdeSy7R+Q
 R4kw==
X-Gm-Message-State: AOAM530FF1Hs7tRYOyLdnU8bpS3FQUm4ey93KhQcozPF9Bdr2nTsnww+
 +YDoMx45J90QK86Aq5xZ3qIuJA==
X-Google-Smtp-Source: ABdhPJwD13cxEPIUXatfd5RtvBUWa5RFdRRBQGbKsdP4NLKxpG4/mPz0dJGpWBGYfKkeHE7maoX6Rg==
X-Received: by 2002:a17:90a:598d:: with SMTP id
 l13mr16337003pji.8.1635110221990; 
 Sun, 24 Oct 2021 14:17:01 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id ob5sm17080355pjb.30.2021.10.24.14.17.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Oct 2021 14:17:01 -0700 (PDT)
Subject: Re: [PATCH 32/33] target/mips: Remove one MSA unnecessary decodetree
 overlap group
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211023214803.522078-1-f4bug@amsat.org>
 <20211023214803.522078-33-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9bc78da4-9e30-f0b9-176c-f15b78b4eecf@linaro.org>
Date: Sun, 24 Oct 2021 14:17:00 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211023214803.522078-33-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.33,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Luis Pires <luis.pires@eldorado.org.br>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/23/21 2:48 PM, Philippe Mathieu-Daudé wrote:
> Only the MSA generic opcode was overlapping with the other
> instructions. Since the previous commit removed it, we can
> now remove the overlap group. The decodetree script forces
> us to re-indent the opcodes.
> 
> Diff trivial to review using `git-diff --ignore-all-space`.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/mips/tcg/msa.decode | 398 ++++++++++++++++++-------------------
>   1 file changed, 198 insertions(+), 200 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

