Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B00573FC192
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 05:36:00 +0200 (CEST)
Received: from localhost ([::1]:36924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKuZ5-0006Np-BM
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 23:35:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mKuWC-0004q2-4Y
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 23:33:00 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:44761)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mKuW8-0002GJ-Cl
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 23:32:59 -0400
Received: by mail-pl1-x630.google.com with SMTP id e1so9761014plt.11
 for <qemu-devel@nongnu.org>; Mon, 30 Aug 2021 20:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=aZvw3ReGDmAoafcNZ8nxFiiZhA22Zlbaviv6+WmHibs=;
 b=pCwO0nTQRIAaz8uQh17QRDawmhq8AljlsUFh3EuWRoAD6PIPTNFtHJxSG5Ggfc8Cbn
 ySg0jHMcUvWj1K0nihIC0+k6TQzg73u7le/fxCsKBDvWu2np+yo6iEBWwYKOWzUsbUNp
 bINUob/k74RFx2SWDdykQugjIeDzXloy3qbXC0G6OI6M0tWlIFMU+Cs6k2UxVAQ++xZX
 leXWoaru1/dxZFnRow4eO0nrZYrsYl5BLNXA+tCrSapvaFGnQZBVHygttKd6akk6Vt+W
 UwioVgpMSQXKbQyEOaZd3hT83EduZvRirVwVuuMfhnMEHF7akGOhWIAh1YEDHSO0wKPh
 Q3Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=aZvw3ReGDmAoafcNZ8nxFiiZhA22Zlbaviv6+WmHibs=;
 b=J4sLU0jfH/pYHOZgZlLpPFR9kl1xWa4+LJYXVvpe1tCEBACp8dTPcpuO1RKjvtt4qv
 tOtsQraiEYkrAU21T7xOeoMrxknRuaMJUxVRl2su9XmkJL/IwByL2KOY59BNKERayAgD
 oF9kG1tHega0uUQvRuehO085jZLSDGKQ1Ri+lR0EZ9Jvr5rmSBnnv52+jt30A1QCJsLJ
 to+zZlnqBm47pQxFbCZhEwGl3obtsoDzuwAS3lgiuCVP1J6ELGbAKOiF3sSdgYicR4Ol
 adExxSDWXkTKzNKL6MZhG8vjg56CjL1teO/+YV7CUlgx9wEDhX5FRLcAgz9vgKGNM05h
 Iamg==
X-Gm-Message-State: AOAM533/MO62kc9VtnmAc6l98wNr4G1OlYMI870LfPa/9JEBXFK4bDMh
 LLEbw2qkATMabnZjhWFtl9BPa6YtwYlkXA==
X-Google-Smtp-Source: ABdhPJxWqnnTSd368XPnOO26CUEAK5sGaNuJe/OiKYHs5GRRJ0M1vCfc0gNGZ+8vMvazzgA7zjBjZA==
X-Received: by 2002:a17:902:8489:b0:138:e450:1ec3 with SMTP id
 c9-20020a170902848900b00138e4501ec3mr2601536plo.46.1630380775001; 
 Mon, 30 Aug 2021 20:32:55 -0700 (PDT)
Received: from [192.168.1.11] (174-21-72-39.tukw.qwest.net. [174.21.72.39])
 by smtp.gmail.com with ESMTPSA id v6sm8862908pfu.0.2021.08.30.20.32.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Aug 2021 20:32:54 -0700 (PDT)
Subject: Re: [PATCH 4/8] target/riscv: 128-bit arithmetic and logic
 instructions
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 =?UTF-8?B?RnLDqWTDqXJpYyBQw6l0cm90?=
 <frederic.petrot@univ-grenoble-alpes.fr>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
References: <20210830171638.126325-1-frederic.petrot@univ-grenoble-alpes.fr>
 <20210830171638.126325-4-frederic.petrot@univ-grenoble-alpes.fr>
 <f9094de6-f36a-4da7-d5ef-9fa976ae4c18@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <27159959-b4fd-17b4-3f61-05848f2dbcc5@linaro.org>
Date: Mon, 30 Aug 2021 20:32:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <f9094de6-f36a-4da7-d5ef-9fa976ae4c18@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.932,
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
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Fabien Portas <fabien.portas@grenoble-inp.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/30/21 2:38 PM, Philippe Mathieu-Daudé wrote:
>> +#if defined(TARGET_RISCV128)
>> +        if (is_128bit(ctx)) {
> 
> Maybe this could allow the compiler eventually elide the
> code and avoid superfluous #ifdef'ry:
> 
>             if (TARGET_LONG_BITS >= 128) {

TCG does not support TARGET_LONG_BITS != {32,64}.
This will not work.

But is_128bit() should be sufficient in each opcode, because that itself should evaluate 
to false if unsupported.


r~

