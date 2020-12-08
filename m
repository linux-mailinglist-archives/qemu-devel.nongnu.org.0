Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF442D35A8
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 22:58:51 +0100 (CET)
Received: from localhost ([::1]:39038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kml0U-0002Qj-Py
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 16:58:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmksP-0002V7-Aj
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 16:50:29 -0500
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:45518)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmksN-0006dm-R4
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 16:50:29 -0500
Received: by mail-oi1-x243.google.com with SMTP id f132so118704oib.12
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 13:50:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=JIS+VXsBgC4TwCzlxil8mGdtzezBpwNHWJyQ+8w+FHk=;
 b=pO/2FibH9VxoUophmQ0wZn8j87QToucv3RkGz3dIGNnx1siV4QmlDnVQfcb2/jLrQw
 BTx+kdSv4kO+eicdoi4TD4+NNlkJRFdXBbZ3x3Hm3hSh2ynW0KaGojNyBdalR3RbmUoy
 /mK6W19EsKYS5kubxhmlD8WEbj2rOLGWVBI2uAU4Ln4DI6DpmN0CYmValchHefUCyT4o
 5z/x7e+f5lz5iQmchBfKmbc1RhwOgkarv+M/lpBDQyB4mEeEcQ9MLmjPI9l8cWTjf+XM
 FAb6xIIiDFFZT2I+kxI1MyL/IC/RHn1yJcPa83Smn9iSPXj57QEQKaEBqoGFalPHzfX2
 uTXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JIS+VXsBgC4TwCzlxil8mGdtzezBpwNHWJyQ+8w+FHk=;
 b=gTgVBWOphC/nj/5M7vkIE34jg+2KFA5e7M0eXenCX3X51XqMFQjbMkS6/drwDFSfvF
 iEbX4SZ0Mwl52b4pk4RszxesgngASHLORESC8hqVyyZMj0oDC2ZOEVVnMOckL2h+VL3/
 kItLhYXT9/F6XBYWO5neiqL7ioBLcwaYRVClw5+IYMvfdt4WUt0BPe8EmrtWM2uyb9XC
 FPj3czo5p1KXzVR4MkDyHkzZ0acPBKenNhIhXI5s3Ej5JI4rG51/RqiI2BGJ8V7YivIs
 MYl7i8Ul6Ux1OvzlstYfb3h19p4LvdRbCVIn5wnopbB+Mj+9l/zaZ29/GhJQkjppbSUW
 nldw==
X-Gm-Message-State: AOAM530g+o0LLyL8zgD5ogrHFpw8DmM64MHQVlEaifc5xCaUepFzh6FY
 71id6uce0HpfwejfvJEP4prtyQ==
X-Google-Smtp-Source: ABdhPJzYvUk13sr+NQgFSTQCd7djbXjhnXR7QHyvrL2LjQwCynXNpAYjee8lDAmFi4B/+dMZmOlk8g==
X-Received: by 2002:aca:2418:: with SMTP id n24mr3381356oic.62.1607464226043; 
 Tue, 08 Dec 2020 13:50:26 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id z10sm60770oom.3.2020.12.08.13.50.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Dec 2020 13:50:25 -0800 (PST)
Subject: Re: [PATCH 05/19] target/mips: Remove unused headers from op_helper.c
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201206233949.3783184-1-f4bug@amsat.org>
 <20201206233949.3783184-6-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <85f5485b-7202-0e07-e547-3587ab08bbfa@linaro.org>
Date: Tue, 8 Dec 2020 15:50:22 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201206233949.3783184-6-f4bug@amsat.org>
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
 Paul Burton <paulburton@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/6/20 5:39 PM, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/op_helper.c | 4 ----
>  1 file changed, 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

