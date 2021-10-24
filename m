Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC3F4438BFC
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Oct 2021 23:04:11 +0200 (CEST)
Received: from localhost ([::1]:49744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mekf5-0003fn-1N
	for lists+qemu-devel@lfdr.de; Sun, 24 Oct 2021 17:04:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mekdt-000313-Hs
 for qemu-devel@nongnu.org; Sun, 24 Oct 2021 17:02:57 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:44757)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mekds-0006LO-5e
 for qemu-devel@nongnu.org; Sun, 24 Oct 2021 17:02:57 -0400
Received: by mail-pg1-x536.google.com with SMTP id c4so8912822pgv.11
 for <qemu-devel@nongnu.org>; Sun, 24 Oct 2021 14:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=V/D39kXKTINoCoMCKInMyYjiBcarzCvjnCBf80I321Y=;
 b=x+/7IwXkizybvfqP7kgSNp0mIDAKiGVb6RgOVdOgNfoexngLAFZimNQkkucVXmz5P1
 wYeMFOJAICnTcfzvvH1d6ygSqnyqC6Wu4/+QTVeHGDCltHeUoQITy44yMaOz6qe3EQ3C
 MwiD9SkI9g/BBfZUgDwFhr9fWn3haJV43uXZr8Kg8RIXMu/maKxDvCx/sm1QkDUcBtsg
 k88/p+8LNoFCLJQr5ht2pVxY/mHXrFEo7onxbyuQWBqBE4XnOAf+iS/dx43brA0x4Awx
 QYW3DljepR0gjq2WqoNNkkZKl2QI7glkNtrG0j/SXoytZ4MnO5K9i7YSb2O7mjRhZeY8
 W0Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=V/D39kXKTINoCoMCKInMyYjiBcarzCvjnCBf80I321Y=;
 b=SMe0PRxtu0rHq6mGaFGYIT8ulnKCkdpHC2x2IsgbYfIGXhyTqY3eMmzUPyWyiScxiw
 5P+TYSCUBYR3iG/6+CSX4TVhR4INfNgBOaY13ruHTlMiOuFDB4co+QH2Rnj+morXrEGW
 kv6cOu6tyyrFVVIAfg0hlsozW500D+5HksqSTp1cC74Ec36o5GPSLVcrwPTKcMtV0shQ
 t5QuYKL2WLEP6yYLIpkFAk/KBP/qjitvsTLVG/SkGldEtXw7EpCOHurfwbMftfoKezX4
 NsH8DwTU6hvJ/j9oJpQo8zA+9z5x2VoG7WA8hb4EpdzSIT4Yzy2/12wyF6n9YrFUp5Ah
 Ap4g==
X-Gm-Message-State: AOAM533MAktvaQ/NcC+pxiySXz43N0wRbM8AoqbaXHHhTk50FVShPrYp
 S9+QGg85/EzH/P4AZ7aSc1olLw==
X-Google-Smtp-Source: ABdhPJyRUmrlEt4cTFdfC6miYbqsqON4ChPH6HiunOHKWYZX3Zv13sf4ebemm2Z/3ojOTujIXFE9JA==
X-Received: by 2002:a63:a009:: with SMTP id r9mr10454599pge.172.1635109374764; 
 Sun, 24 Oct 2021 14:02:54 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id f21sm17517538pfc.203.2021.10.24.14.02.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Oct 2021 14:02:54 -0700 (PDT)
Subject: Re: [PATCH 28/33] target/mips: Convert MSA COPY_S and INSERT opcodes
 to decodetree
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211023214803.522078-1-f4bug@amsat.org>
 <20211023214803.522078-29-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <72f01fc7-6026-74b5-d3dc-00109d93fea5@linaro.org>
Date: Sun, 24 Oct 2021 14:02:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211023214803.522078-29-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
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

On 10/23/21 2:47 PM, Philippe Mathieu-Daudé wrote:
> Convert the COPY_S (Element Copy to GPR Signed) opcode
> and INSERT (GPR Insert Element) opcode to decodetree.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/mips/tcg/msa.decode      |  2 +
>   target/mips/tcg/msa_translate.c | 92 ++++-----------------------------
>   2 files changed, 12 insertions(+), 82 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

