Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB7992DAE95
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 15:11:55 +0100 (CET)
Received: from localhost ([::1]:35738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpB3S-0007zA-RT
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 09:11:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpAzR-0003uh-EQ
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 09:07:45 -0500
Received: from mail-oo1-xc41.google.com ([2607:f8b0:4864:20::c41]:42691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpAzP-0005Ta-Pg
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 09:07:45 -0500
Received: by mail-oo1-xc41.google.com with SMTP id x203so4850932ooa.9
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 06:07:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=u7ecJ/OaL9vDMLfBCx/xo1qgzc6LeG3GlbWoP5APu40=;
 b=mGzhSUQLfPYi5ludRDAJfzrd3F80RRkT4Br46z3UgoP0tMDMnO7AZIdbT4qUyRXbUq
 Qnu/978eqSLKsZZEx0ofvds8oZzFMgduXwxBJpZWKnszKxqcfDu91Iaa09sgtSzK5Zma
 vmrojHRFlr2yVF3Ow+TX9NfL0Xmykmu6Zzsm/k5jJ3Av/x3SAykY3LBIi7ktnLF726Bx
 5qoS9QktzpESvQB9WYEFip9BSoBUf11ltKAGTKtkDrPv47oKAJxXaUKlJNyTkVwm4FaW
 xBl+szbtfqpzmBXmDCPRE4ULcEjqHObbbcoCmQZXoxJTjwzBexMW/1BZidZ3muIJproH
 6MuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=u7ecJ/OaL9vDMLfBCx/xo1qgzc6LeG3GlbWoP5APu40=;
 b=MMN1MuLxrU6M9eMsB9oWrstz/U67kaX3s8N+gsYZAJC6jMXpNbVnsMIdUHhOY4sNoB
 udm4SSx91j+AA9az2in0fale4BnL+UH5uMBc4RwgvMKWUj/8HtXsyEeVWYY9vJayXgts
 MdjbVxin4PzgdUXo/fqOlIj6Vl/GIwG4PWEXTaYq7c6bNy9pkIpXpCebH1YUY4qAZqWU
 kaIIVJooLWI6lX54gvlZEPJ63u/7D6l7CUWEy0hvVyWOPVYeaHh/dLPxPCtXlu7hBpF+
 TpcddS/f9A0aFwtbjK36mvErspbzyfQZQJpPR6xa7MLynAbXsg6tsLmpGUVbPol6MAhU
 C8ew==
X-Gm-Message-State: AOAM530dlNO7jtA46OQgz1OHjQJS4H/zO0flqSRs6Q8O3oApOVXZlF37
 4k9NtEg+MXpy1TrdJP1Rks1B8Q==
X-Google-Smtp-Source: ABdhPJzqDolymJzOA9ZqD1WZ3tPEa0n1hmB2njhH3GVWa/FSengIEnahfoWKMlzOnISUMzCWVjFbZg==
X-Received: by 2002:a4a:aac4:: with SMTP id e4mr22491184oon.2.1608041261240;
 Tue, 15 Dec 2020 06:07:41 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id o17sm429076otp.30.2020.12.15.06.07.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Dec 2020 06:07:40 -0800 (PST)
Subject: Re: [PATCH v2 09/16] target/mips: Rename translate_init.c as
 cpu-defs.c
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201214183739.500368-1-f4bug@amsat.org>
 <20201214183739.500368-10-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <70289ed3-5350-58e0-2c54-3da61c201d22@linaro.org>
Date: Tue, 15 Dec 2020 08:07:38 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201214183739.500368-10-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c41;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc41.google.com
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
 Huacai Chen <chenhuacai@kernel.org>, Laurent Vivier <laurent@vivier.eu>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/14/20 12:37 PM, Philippe Mathieu-Daudé wrote:
> This file is not TCG specific, contains CPU definitions
> and is consumed by cpu.c. Rename it as such.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/cpu.c                                    | 2 +-
>  target/mips/{translate_init.c.inc => cpu-defs.c.inc} | 0
>  2 files changed, 1 insertion(+), 1 deletion(-)
>  rename target/mips/{translate_init.c.inc => cpu-defs.c.inc} (100%)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


