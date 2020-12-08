Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3360F2D361E
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 23:24:02 +0100 (CET)
Received: from localhost ([::1]:60620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmlOr-0007GZ-6o
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 17:24:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmkr8-0000rN-Qy
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 16:49:11 -0500
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:44546)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmkr5-0006C9-Gq
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 16:49:10 -0500
Received: by mail-oi1-x244.google.com with SMTP id y74so121149oia.11
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 13:49:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=N+xIHqu2+gRNiZKfWeew6jfBHxjpySrralGLj5BRwOw=;
 b=QUzV3ocabQNZmYipeyaTTZjVvE4B49fqvdxF9uSQmarRP546BlrG7CAPFHrpemRzKl
 jn6MQL5GvlyAIHCeO8/s9AY69UP4aqdm0mJXVnrUP3CsBUzjUOlDtjXAkdxVL/iR98M4
 KgiaW+vy9G8fBnyCfovTVU857yR3QqCo9pk2x1DjTSYkHkr1LIX0JRygJozF3YsX7wjJ
 9Z+7KG9YjlUU0KYxAjXylCsgfTmuetinUl6XLNVHtzf2T6cMbHnW2DHmedmPQAo2JwA/
 rCP3/mK6/ImYn9vjNtPypv8jrN+BJEt8b6+4Xnh489Phjb6avXbdVN3xMyV2E/cRzFNS
 guvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=N+xIHqu2+gRNiZKfWeew6jfBHxjpySrralGLj5BRwOw=;
 b=KPZPfODaSfUJ+AFnOuuOt4LqKO4jl0rfVu90llcPoMAB3KOWV9ChufBI3+aenf44GI
 uOLu2oNBQW1jV5rJAVxEh/M5uMV5W+DlBoApSKZqnOnwqDsNqCJI9TlS91joo4i7apZI
 4Gr4MYEZb9I8x+7YFxlnZo9P7cvaGh5oFfCDFu8Ay6SAmAoIwTWEiXdfxh8F9aTrDboR
 q/91l2pd4K0UqGRckRw91IOWYTe0AOfG54/rv5d2y7iUlikrP8qy+xS/WS88nluqoOv1
 G5SWfmZ43te1SV4oZABSVZ2y1SVX6lBIlSptnPlIWxj+PlvStJjEfNXe1XineF4ZByeb
 5pTA==
X-Gm-Message-State: AOAM532N8a6LOySRnO2gaVHIApRSDPxZU17iGIjxHG0CTgPIxSS2h1Pu
 mWMsa5r1ocFqhGXoFfLYpGtDMQ==
X-Google-Smtp-Source: ABdhPJw7DajjHwECgxki4hidw33aMmAf2Yprs7V3t9hpev8RNtNV8+lt3MEsc0RCBZ7mRNqTZzLEDw==
X-Received: by 2002:a05:6808:650:: with SMTP id
 z16mr4351402oih.50.1607464146325; 
 Tue, 08 Dec 2020 13:49:06 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id k3sm52714oor.19.2020.12.08.13.49.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Dec 2020 13:49:05 -0800 (PST)
Subject: Re: [PATCH 03/19] target/mips: Remove unused headers from fpu_helper.c
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201206233949.3783184-1-f4bug@amsat.org>
 <20201206233949.3783184-4-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ebcbe6d1-5142-6a4a-5133-ad81ab2dabbf@linaro.org>
Date: Tue, 8 Dec 2020 15:49:03 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201206233949.3783184-4-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::244;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x244.google.com
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
 Paul Burton <paulburton@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/6/20 5:39 PM, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/fpu_helper.c | 4 ----
>  1 file changed, 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

