Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BABF2C26BE
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 14:05:43 +0100 (CET)
Received: from localhost ([::1]:43846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khY0s-0003kh-HX
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 08:05:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1khXvf-0007Uu-Ou
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 08:00:20 -0500
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235]:35472)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1khXvc-0007GL-Nf
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 08:00:19 -0500
Received: by mail-lj1-x235.google.com with SMTP id r18so7124686ljc.2
 for <qemu-devel@nongnu.org>; Tue, 24 Nov 2020 05:00:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=trYMOyrNje9jTZ9widsc4j5e7wvzlBx0xBYRijPE5Ic=;
 b=yhM7Q9Mmb/0l/EkJtVBLh9qS0BgANr02m24LyevaKUAFT91o4NBM27vOzU3gtmoIHF
 uLBO2M3eDp+y0T0Hty5iKwYx3+vKLK0XHQsRZz/QZZEzQBJSrLSZKSjJKCHaKtbunCdA
 J3MXf79UUHwoNH6vTNg5v+PRKMBVvB7uGO0jvtNZ06Kn9goZ2/dDfV267/z2jxjoC9pm
 uh9k66Cdt1dGmqE0KfWZcvffbAEdhAdbsITqOooWG4sVD1spViOWNSfG8hiy1d87QXYo
 PWaW0yVz4f9J7JHKh0olhs3XgtIAcW/ZhGKpGFvYqoHSrr8o/wGaZPoBUMCATPvffBUV
 M0bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=trYMOyrNje9jTZ9widsc4j5e7wvzlBx0xBYRijPE5Ic=;
 b=gXxxHsSUXNZDY39ZYD9GPNEoH2OlSPgN4WRS3Y4T55oaeazQHP0PfEU4Y+nPZczSB5
 eDmZKlHBKJJuVGvMbTzCGdztxf1L9cHAMXM84hcgWx6hU57eLCHffI/OjejRNzV8efAH
 ijPqrjlzWzgqVVoxkWlMED4CTXRed0kzf5usMqOzVWcr9mg8l4TTLXQ+pHEqxQflb4Sq
 g3+misZ3ZjfvmCVKuZtdqSUGqHkjxaI/78Jt3yK/A32BcQZDFNvYTaF4TeZt7vhB2KzR
 yOQe2zmxlI4Ik9ipkr91G1mxnu95A1KP+cfnOQdxV7Jti7HzQIs2SnqvSvvF1QsMejQG
 aXSg==
X-Gm-Message-State: AOAM532tTpBOxj2NunhZQe76piDR4UI9O0sG+unDBtfQqrfQ+bdINsa1
 lUCDHUrWHwOIMHOFvP/v5fH1HjvqpXjhRzdr
X-Google-Smtp-Source: ABdhPJw3OKco1hiQ04NX1pERXaiyJ30/gdVP+vVwGCKe2wTYGfYyyo9aH5TEGxdKBK0CNc8G+HjeMQ==
X-Received: by 2002:a2e:9f08:: with SMTP id u8mr1655582ljk.352.1606222814531; 
 Tue, 24 Nov 2020 05:00:14 -0800 (PST)
Received: from puchatek.local (89-67-26-161.dynamic.chello.pl. [89.67.26.161])
 by smtp.gmail.com with ESMTPSA id
 m21sm317239ljh.82.2020.11.24.05.00.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Nov 2020 05:00:13 -0800 (PST)
Subject: Re: [PATCH] sbsa-ref: allow to use Cortex-A53/57/72 cpus
To: Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org
References: <20201120141705.246690-1-marcin.juszkiewicz@linaro.org>
 <e79639f0-041e-d190-c895-0e1f24d64102@linaro.org>
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
Message-ID: <6ae25fdc-0204-9000-57a8-04136ebe70f6@linaro.org>
Date: Tue, 24 Nov 2020 14:00:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <e79639f0-041e-d190-c895-0e1f24d64102@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::235;
 envelope-from=marcin.juszkiewicz@linaro.org; helo=mail-lj1-x235.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Leif Lindholm <leif@nuviainc.com>,
 qemu-devel@nongnu.org, =?UTF-8?Q?Rados=c5=82aw_Biernacki?= <rad@semihalf.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

W dniu 21.11.2020 o 18:09, Richard Henderson pisze:
>> +static const char *valid_cpus[] = {
> const char * const

I copied it from hw/arm/virt.c file.

> Otherwise,
> Reviewed-by: Richard Henderson<richard.henderson@linaro.org>

Thanks. Fixed patch sent in separate mail.

