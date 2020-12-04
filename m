Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C54AE2CF276
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Dec 2020 17:58:37 +0100 (CET)
Received: from localhost ([::1]:37890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1klEPk-0002lr-QC
	for lists+qemu-devel@lfdr.de; Fri, 04 Dec 2020 11:58:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1klEMx-0007EI-0E
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 11:55:43 -0500
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:44658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1klEMv-0002Cc-7M
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 11:55:42 -0500
Received: by mail-oi1-x243.google.com with SMTP id y74so6805567oia.11
 for <qemu-devel@nongnu.org>; Fri, 04 Dec 2020 08:55:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=oVQ8Jyij3kwsUSz347eZLqyy7mOWb110oe/eMlr98uE=;
 b=tTfy1CQ5SaUdqr+ddvk86+k3Ffp0BuJSM8Dz2DoAUGIo9hFES2jhPu/2QX17w6at9M
 nuN9hiPm2P/NFkxhh1Jj93rZ5UGkNun/Gqy/M4Z75SsAuA/HNuG+XUcfHuiZYpSV6f4s
 PMSzk/YIQWld3kcej8SYIWS3FE6+XytmeCv+S6254prp8pWom6Mzoi8sXrDzroNrLf8+
 yf9erVL3RMGiBPVNp6Xn5VWAHMz2G4I2STSmKOX1hnQOHaDXFHk3prTLmRGw5OaWQUKo
 NkBm44dtmbzyvT7ZxfFiwq5opJDADzV01ugHHqhUEmElooiD13O3nCjAykKwq6aVjgbq
 Gu0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=oVQ8Jyij3kwsUSz347eZLqyy7mOWb110oe/eMlr98uE=;
 b=CU9ycwWbJlDYgaq/PpnCEIptJT0H+I2Q3/N5JZQioqOsYFNqRW5jmCTOMi2FVz52JM
 33Tt7pZZt/AQugVHjyHWlGmOSHFIbRHq8TocktRN3KejP9Qoga4BjIYbnECq/+rDoUPC
 lm8tiFhYqmjvoTbd4gk2eWL4SpNOrqOIzNaGGML9Gh8AsAmGIagjZ5YW/dIUfJwok0Dk
 vXz/BCmFHgpCJkVX3o3QMEDpgVLQtolErlxjZ+KjwL7+UumS7Maf73aZy6XRPgiY5tkX
 FOQH26rstxj7BvylM6qXu7kksMbeJgZ07Z9xI/MaH/KLDILHI26RoJJgBXfDSGgvTqYq
 QneA==
X-Gm-Message-State: AOAM531FqkGW4jNZEogtVtI9tii6N8B/oyEcMU1tDEGwaWnSpBYiPI4b
 b+fOCWSWQ6PCznFHnWLD73pQKdL3TlSoM1Xi
X-Google-Smtp-Source: ABdhPJyzvqk46X2qIGncv4g+/pu4QXgdfdzaYNMEhkVBj/wJpZ/FACiTkQhbSHWkDLL3ShUnKl6zdQ==
X-Received: by 2002:aca:6287:: with SMTP id w129mr3744994oib.82.1607099472937; 
 Fri, 04 Dec 2020 08:31:12 -0800 (PST)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id n3sm726000oif.42.2020.12.04.08.31.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Dec 2020 08:31:12 -0800 (PST)
Subject: Re: [PATCH 8/9] target/mips: Remove CPUMIPSState* argument from
 gen_msa*() methods
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201202184415.1434484-1-f4bug@amsat.org>
 <20201202184415.1434484-9-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ed037c91-4dd1-8171-fbe0-32717af0ce97@linaro.org>
Date: Fri, 4 Dec 2020 10:31:09 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201202184415.1434484-9-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::243;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x243.google.com
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
 Paolo Bonzini <pbonzini@redhat.com>, Huacai Chen <chenhc@lemote.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/2/20 12:44 PM, Philippe Mathieu-Daudé wrote:
> The gen_msa*() methods don't use the "CPUMIPSState *env"
> argument. Remove it to simplify.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/translate.c | 57 ++++++++++++++++++++---------------------
>  1 file changed, 28 insertions(+), 29 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

