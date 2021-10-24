Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 504E9438B4C
	for <lists+qemu-devel@lfdr.de>; Sun, 24 Oct 2021 20:13:31 +0200 (CEST)
Received: from localhost ([::1]:60432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mehzt-0000TC-VK
	for lists+qemu-devel@lfdr.de; Sun, 24 Oct 2021 14:13:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mehwV-0006QM-G4
 for qemu-devel@nongnu.org; Sun, 24 Oct 2021 14:09:59 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:43730)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mehwS-00017v-Rp
 for qemu-devel@nongnu.org; Sun, 24 Oct 2021 14:09:58 -0400
Received: by mail-pg1-x530.google.com with SMTP id r2so8637235pgl.10
 for <qemu-devel@nongnu.org>; Sun, 24 Oct 2021 11:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=17Wv1soxl/phsIo71E18KCgqa06VPsYqkFHjUmEoINw=;
 b=QNwVRuS0ZsOkMyMCZhWCAhkF1fIKUDfSaudgTLstG+t5s9sNRAKTVUpQwyeH8n6Uek
 N6WKVDSmbz+reSnpiuF1HqzGjT2gyey38f7W0nEKt5b1kQRmDeXZfchz+Qa+SALW1wHY
 0awtVu88JJkb4GUjRAR0Sp55SXyJir7zMkU2MwxxV+6s/xfCoP2OJ5U5k84u6RzM3rId
 66+wjzlxZSk+C19OqN6UWfK8eC+HaIlt7ITC8pMATUnFzcgpgV5IAEdHPON1YgLrSh7G
 5w0sMmEPEwKY7PmfBKixf0oxVJ4Tx2ET5MwTJq5u+enahYiOszol7mtreQ6XXoP8afrA
 5EJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=17Wv1soxl/phsIo71E18KCgqa06VPsYqkFHjUmEoINw=;
 b=A7KMHs9ZY5ZsOEh3Y1NVmd07n31a0IkrIG0yKfIPJYcYvkCLhU0UQYj66c6WSyiKt9
 jRBmzfkEi9yxeRsIdWieTVnxcePcz/j/nrO8gSBRaSqEHU+PekFCf8/QVnhtaWJ8AqO1
 m60rXeuKq++1tNovRK+CNdkAx3mxgVpm/cpqRVEF09tom+3paJPckjI2MoPQBQug3vWB
 83DIdf8o4RQ25EYVHpo4+nD17wiQEUt9LTfhxbrOwpJvSWDvxihglrurfFwz83/CPujj
 QdfxUgeixqcP4EVuWkwGaoZ+faXfltHRsmEBig+UnZet217kuM3duNWY26HQ1rD/aS1s
 64Wg==
X-Gm-Message-State: AOAM532eGmd3wXop9PHuBqyIkkmoNoNSw2taUIAtfDdB8gmHVXhA3Rxt
 SFKtezgsZ1y2cl1Ak/4UPM+Trw==
X-Google-Smtp-Source: ABdhPJwNsBV0MJy/r1Q04XBXowBuWnFdcxidmQqsNfbRDa9oNAcPI+m/D9pq7C0Ca04TxzAZkqeLCA==
X-Received: by 2002:a63:e516:: with SMTP id r22mr10129901pgh.197.1635098995026; 
 Sun, 24 Oct 2021 11:09:55 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id t11sm2357151pgi.73.2021.10.24.11.09.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Oct 2021 11:09:54 -0700 (PDT)
Subject: Re: [PATCH 24/33] target/mips: Convert MSA 3R instruction format to
 decodetree (part 3/4)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211023214803.522078-1-f4bug@amsat.org>
 <20211023214803.522078-25-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <635cf4b5-a9cf-11d7-bc20-00ea7e6381b2@linaro.org>
Date: Sun, 24 Oct 2021 11:09:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211023214803.522078-25-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
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
> Convert BINSL (Vector Bit Insert Left) and BINSR (Vector Bit
> Insert Right) opcodes to decodetree.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/mips/tcg/msa.decode      |  3 +++
>   target/mips/tcg/msa_translate.c | 37 +++------------------------------
>   2 files changed, 6 insertions(+), 34 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

