Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61D6F36843C
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 17:55:19 +0200 (CEST)
Received: from localhost ([::1]:34068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZbfi-0005KO-Dx
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 11:55:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lZbdm-0004Jw-NV
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 11:53:19 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:43769)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lZbdj-0003Xc-2R
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 11:53:18 -0400
Received: by mail-pf1-x430.google.com with SMTP id p67so27049283pfp.10
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 08:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=0ki9sL9BDIQwC6tcsZmEi7wQ2TxrOXe1duizcTexNfA=;
 b=y+JLMd+FpZO6Rdi1PgAutsG1OZKbJyiZnW7wfnEkH+aIJd4H+TgaUiGK20Vc42QXrz
 mtJjPylcUPEAMLvEoCLHUNQFeBv1tKDjQt6LdsWYJ3RoGp0mwJWYPEZRJoH8c1+CqdAi
 CLmXMQIac4XS8M5nzOGJKd8BWLNCN8YMcW+tLtH/c5jme7wfACdP2btfP8PFxMnHBSdd
 Qqt1fTv2xzvULu+yBBiIxrIk7dfbnqmpQuTV72OUuFJa6KRNAkFD+3UWk/AWsiu3GdoS
 HgxS4KbmIyderE3dOo8QKIuQrCYBESo906czrsornAFGed3QIqcHfUeIv6uvv2SouB3t
 z5kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0ki9sL9BDIQwC6tcsZmEi7wQ2TxrOXe1duizcTexNfA=;
 b=jn5RVoy/Xw1L2F8QmtvXIrbzR4tQQAhzm0KyssjzeKQSO13iIQhkIP0+9/GBE2NLpc
 GdLIwDCASGuqQMdZRt6LnLto7ZkWyFilPH7qYfFlAVgokCj7ZVvbM4mN47gUkA+zKujF
 Jy3ep67dP0r+qF8h8jAOVf0yUpPNxUlQ1nOlT3wZS2yi08H3wxqfaH+kDUBVYdQJQ2I0
 g+Cz3JiThJry1glYY/6pJ8NcaxARt5VSjIH/jffYdoeaZYDK1fqq7hdgQP50ZnckWzfl
 iypQASDOnIlKNXxHX7+6WOoaLuXiR+GSsz6wyETCYB33lhMSUIaHsUK8U3U481NPHVvR
 hKww==
X-Gm-Message-State: AOAM533oPgAk1agMuu30l+12VaW941dfD9S4+oVGHjgJ/jo06t0bm3FZ
 ePdmTJ4t7YQ9CD+D6BSYXiYfvA==
X-Google-Smtp-Source: ABdhPJx4M408kOg7yTvwDmlTa/2T/QPgIMPpy1ZlsnU+rSSzumYBYwc3rB6BSNU3tMbbYfODGj6qHA==
X-Received: by 2002:a63:5112:: with SMTP id f18mr4107773pgb.379.1619106792091; 
 Thu, 22 Apr 2021 08:53:12 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id y189sm2332994pfy.8.2021.04.22.08.53.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Apr 2021 08:53:11 -0700 (PDT)
Subject: Re: [PATCH] target/mips: Remove spurious LOG_UNIMP of MTHC0 opcode
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210422081055.2349216-1-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ff4ae6b0-7208-e64b-4315-b626ec06b1a9@linaro.org>
Date: Thu, 22 Apr 2021 08:53:10 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210422081055.2349216-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/22/21 1:10 AM, Philippe Mathieu-Daudé wrote:
> When running with '-d unimp' all MTHC0 opcode executed
> are logged as unimplemented... Add the proper 'return'
> statement missed from commit 5204ea79ea7.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/mips/translate.c | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

