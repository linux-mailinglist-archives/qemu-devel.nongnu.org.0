Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABAC1438C0D
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Oct 2021 23:21:28 +0200 (CEST)
Received: from localhost ([::1]:37954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mekvn-0006tp-Oo
	for lists+qemu-devel@lfdr.de; Sun, 24 Oct 2021 17:21:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1meksk-0004Hb-GR
 for qemu-devel@nongnu.org; Sun, 24 Oct 2021 17:18:18 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:36526)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1meksi-0005Uu-OY
 for qemu-devel@nongnu.org; Sun, 24 Oct 2021 17:18:18 -0400
Received: by mail-pl1-x62d.google.com with SMTP id f4so3805833plt.3
 for <qemu-devel@nongnu.org>; Sun, 24 Oct 2021 14:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=JvjzYcbVv9F0lnB7vMEPLgDw/hUcU0fbGES75uuAoEk=;
 b=t4l+lFn5CQB6V172jsdLwvc4VkBXGhDTZPipEZ+k+kSY/yStuTASdLFH2RksVHZy0U
 bxsSpuMYmhJABtlvGZHv0I7qdcye7ONWUKzENdCbwUroXFgrAQPEs/Z0eVIAQyKuJ53i
 WA0n0nM6P0fK2BgV5SHMaLdJqrTtuXsNHbqhvakaG7VUm4VEzccOV77s1RbRyBdDVjWs
 ecrgW403kWfECrYG1PTY4EP03eTo+B3iqiXHA2TgBjMPy+lX/nttT6e1L9pJXd6aV0iY
 +X0qLtu7hA/dCtUPUu6amJqfKjc3HWPevRjRDQyx8PARjyf7Oki9GOU50KZXsU5fGOxK
 XrDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JvjzYcbVv9F0lnB7vMEPLgDw/hUcU0fbGES75uuAoEk=;
 b=3NU6RIeggHk4Fl3ZZZ80tzd1TvGPvjFi5olC+C5e5rN4jiMHqvlR5tk+dacz/t4hy8
 k168diaIq/s/SD3q3vn0k51PhAntZf/5lsSgfFDEwWjQHdneKtHkDXFAXhwnt74HTMjD
 V8cP8cudd12Bk4SW4onIB9pYe++9YdZ6pc7V3x+li/GWntnpYm24M0j72u15fR8X69E0
 O12LwpckVZK/0tMmujnz0ePB1+15+T6KCMKYp658N1Mf/8H6rv4a5GRrJ5ubPGEfkQfh
 CJTTJTiOlmOEpUbWhYctMfl0pZskPLx/NG9+H8xiji45E+IIJxKnSz5JFFb1tOaYXDWA
 NmhA==
X-Gm-Message-State: AOAM533sz+3zpXPxbZYpBEvmXKVIaDzBIMxwrptS1XhR59vN5TuxtPX1
 StTMOqpXmCpA7b1nfWjMsZOdWep4t7JVdw==
X-Google-Smtp-Source: ABdhPJwkoXq3mmjmMupXds/k0wh/9jB3xuZUoWMQI9hACs0pJNslu5/R0VU8/Jr0ioFOE5Au+eHkCA==
X-Received: by 2002:a17:90b:1c90:: with SMTP id
 oo16mr15662187pjb.199.1635110295073; 
 Sun, 24 Oct 2021 14:18:15 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id z2sm13635500pfe.119.2021.10.24.14.18.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Oct 2021 14:18:14 -0700 (PDT)
Subject: Re: [PATCH 33/33] target/mips: Adjust style in msa_translate_init()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211023214803.522078-1-f4bug@amsat.org>
 <20211023214803.522078-34-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b8b493d0-38a1-a8d3-5712-7ef23d8920bb@linaro.org>
Date: Sun, 24 Oct 2021 14:18:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211023214803.522078-34-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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
> While the first 'off' variable assignment is unused, it helps
> to better understand the code logic. Move the assignation where
> it would have been used so it is easier to compare the MSA
> registers based on FPU ones versus the MSA specific registers.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/mips/tcg/msa_translate.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

