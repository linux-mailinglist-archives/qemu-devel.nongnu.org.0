Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 449EC3AA378
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 20:48:15 +0200 (CEST)
Received: from localhost ([::1]:39638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltaaE-0003LC-9F
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 14:48:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ltaSv-0001Fy-Ix
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 14:40:41 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:44684)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ltaSq-0002wo-4v
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 14:40:41 -0400
Received: by mail-pf1-x430.google.com with SMTP id u18so2891644pfk.11
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 11:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ARnL0PW8TCH/ZG6xb5AyyXDtjLpXNuJfQVScRNQPLXM=;
 b=DH+1gVvpnONO2+0VdvjXRe6nWD3vJJIDNje1gLpi8E/m4njt+VZ/lTSwHKG216LQda
 hW+lx2OeVndkhjRuZm2+9vGAFBzPzeJ8g4+VQTB1zMenqMc6vNSJv89g2+HTbSZFIhow
 jDr3ql97H/wcgMTBHlGmv2lWlNvW6GF00+Hd+MAHy8/Gk5O8BCqdvQhbcwsj2v+9Nz4A
 k+9uR7G3iryjPcKUowfuNEmIY9JoAx+47MwEaMkNYW8P26FeuBbhne30o8yX4urWjwx4
 +wY6mPnm93vgFh7bST/730CvsKuO0PyLCH0FYWmJLG6zyzdCxJzmVfnAfoQukudyGkgD
 4LVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ARnL0PW8TCH/ZG6xb5AyyXDtjLpXNuJfQVScRNQPLXM=;
 b=JukUzJQn90foQv8z8sadNEvktJkzlAbFLJA8j2i/O8HZgnZA+F4VzNbBfcL4kI1eEN
 lvKomn7H9S4VIuLOWQ36u12CisXda1Lpla0seePq3ORkUaSrQAMyWpLfkUSIl7Cdca4f
 bz2lK1Tq7T+BDUJa0UfVquPJeKNKMVpp0kc0DwVoDkteczWrS6R17NJMImmh/x1M1Pau
 +5VUcX7EQ62LsHKHb9zYlMP8kFO6BTp94b7K6ZacahM3GCxAn6YyTMmlxST77gHFA1yO
 SDN8YkgxgZ/LPweqHdA0jX+n2IzVUaOamKc/sJOk9G35haBz98Jkez87kOsD5rP+oKy3
 bpTw==
X-Gm-Message-State: AOAM533Vdu7x3N2MgROhweuCw4ClSTe9eczo8yfeYfxlIHfP05KJjOG8
 OlHLDQvsSfciTKwLCVuv/TnQOQ==
X-Google-Smtp-Source: ABdhPJzJfPAbikazbctDe9xruHT9ntJ/dOrHh91n2n/EPlOe9KD318XI6w7KFRVstJTbX6UICjzEqw==
X-Received: by 2002:a63:64a:: with SMTP id 71mr1002006pgg.360.1623868834346;
 Wed, 16 Jun 2021 11:40:34 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 a23sm2696587pff.43.2021.06.16.11.40.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jun 2021 11:40:33 -0700 (PDT)
Subject: Re: [PATCH v3 05/13] hw/i2c/ppc4xx_i2c: Add reference to datasheet
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210616161418.2514095-1-f4bug@amsat.org>
 <20210616161418.2514095-6-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <94a02a64-d8f7-d77c-797c-0d797ac7fe10@linaro.org>
Date: Wed, 16 Jun 2021 11:40:32 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210616161418.2514095-6-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.17,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Corey Minyard <cminyard@mvista.com>,
 "Signed-off-by : Frederic Konrad" <frederic.konrad@adacore.com>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/16/21 9:14 AM, Philippe Mathieu-Daudé wrote:
> It took me a while to find this model datasheet, since it is
> an OCR scan. Add a reference to save other developers time.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   hw/i2c/ppc4xx_i2c.c | 2 ++
>   1 file changed, 2 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

