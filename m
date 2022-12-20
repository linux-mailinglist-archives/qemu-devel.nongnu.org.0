Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B7E3651762
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 01:52:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7Qrh-0006UA-KG; Mon, 19 Dec 2022 19:52:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p7Qrf-0006U1-D0
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 19:52:15 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p7Qrd-0003yh-L4
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 19:52:14 -0500
Received: by mail-pl1-x636.google.com with SMTP id d15so10707306pls.6
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 16:52:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=N7ML961/8MjHwybrARKKRYLasuLF/vMTefc/Ih3n9bc=;
 b=vxNGEMKYvh/e3XTE1NoXCJEfC0TwgWX4U9I/nKp8JR1Z7jGhD23jVi3/IGOv9ar7Wj
 4fiGtctcgpXqtPkAUH0RdqLsl9c5I6P550qHE4MgPaXKwb3AxxKT6n+lzt8brmDUqRVS
 ebnaE9Ri66YKFCgoD0HT30UMJAaxfWZuzyKj+AauzeUAdtF23/12VxkGagAtMIa16vx+
 wPoMzQQh6wW3BPezYdtPReDjNK6lDgYw1gwNSXhCyPHiQbu0UZ4qrGlyfFMFTeIGq/wT
 0GZrYI61jU/FuS8/37FsrIGFuQC9tx+pmVnOLIoREVPe62+kbE5HhkpYEKAK7oBddqfU
 xrVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=N7ML961/8MjHwybrARKKRYLasuLF/vMTefc/Ih3n9bc=;
 b=c9EGN65hN5rZNdRJQXyFwoVGBEvPR+ggGeFwXQKRO/F/U+U2TUh+OkoNVerFHYjLqc
 PNEoVCd1W8qUrBZr5kzPhQWHHfOVJtm2fSf/ivOSf/PHqbmCotnh/IKYM+wJvAMuc5/l
 JpS74kYDcFpJUQvye2gGpxz4o45d30vmjEiyDyFt9HxdeF0Vg9qv4yLO8bqm/hfFZHVz
 00fwvM0Ks1Lt6hNHUACfpfKf/btK9+zjQVwddSxxq/6otZO3g4yFgb9WrfJtaaF59B0t
 68DvWzX4lU0IPliCTLyf5vLyBQjVf1WbZPs+lGTF2ubv8bTxLGQeCOsMh8/q5EZIc9eV
 OT+g==
X-Gm-Message-State: ANoB5pnz7Vl6vvzFPNaOHG6bdT6qOOyp/bxlt1US9t2HOF7EuD+iETkW
 JfgkXVVt18649XQh0ZjjldIL3w==
X-Google-Smtp-Source: AA0mqf4EU93Z9FI8Jkgvr8l2x6+pZKl91M57FfX/vcXU7UkFgTm4BoSEYjURbnL5Nd0DWVfc/KFJLA==
X-Received: by 2002:a17:90a:6506:b0:214:222:6ed3 with SMTP id
 i6-20020a17090a650600b0021402226ed3mr48241703pjj.43.1671497531855; 
 Mon, 19 Dec 2022 16:52:11 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:b343:d344:137b:e318?
 ([2602:47:d48c:8101:b343:d344:137b:e318])
 by smtp.gmail.com with ESMTPSA id
 s14-20020a17090a760e00b0021984d697fbsm9874886pjk.20.2022.12.19.16.52.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Dec 2022 16:52:11 -0800 (PST)
Message-ID: <42cd6a94-5729-7b98-b6ab-5fe2061e4b1b@linaro.org>
Date: Mon, 19 Dec 2022 16:52:09 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH-for-8.0 4/7] hw/mips/gt64xxx_pci: Add a
 'cpu-little-endian' qdev property
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jiaxun Yang
 <jiaxun.yang@flygoat.com>, Bernhard Beschow <shentey@gmail.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20221209151533.69516-1-philmd@linaro.org>
 <20221209151533.69516-5-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221209151533.69516-5-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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

On 12/9/22 07:15, Philippe Mathieu-Daudé wrote:
> +static Property gt64120_properties[] = {
> +    DEFINE_PROP_BIT("cpu-little-endian", GT64120State,
> +                    features, FEAT_CPU_LE, !TARGET_BIG_ENDIAN),

Unless you're really planning on more feature bits, DEFINE_PROP_BOOL would be better.


r~

