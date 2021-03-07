Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E0632FF85
	for <lists+qemu-devel@lfdr.de>; Sun,  7 Mar 2021 08:40:18 +0100 (CET)
Received: from localhost ([::1]:58086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIo1R-0005ks-UK
	for lists+qemu-devel@lfdr.de; Sun, 07 Mar 2021 02:40:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lInzd-0005JP-9N
 for qemu-devel@nongnu.org; Sun, 07 Mar 2021 02:38:25 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:34429)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lInza-0004Hj-N4
 for qemu-devel@nongnu.org; Sun, 07 Mar 2021 02:38:25 -0500
Received: by mail-pl1-x62c.google.com with SMTP id ba1so3431419plb.1
 for <qemu-devel@nongnu.org>; Sat, 06 Mar 2021 23:38:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=rMFcCnZ/wM9/3wt1hACGx89HJdd9LDXvEezUkcsbrAc=;
 b=zqFJ+jzpGcHCZAyRnVif4Qhk9IHiwQPuwpg9NX0D8r46wgqoXaRjMmWqoKX3UQwANA
 i3UATJJ3OZ+h1rIJaNm6nL+AgUPiNwYVD+v3gOyguUjqVFxEb670mTFsaK0KHSjyw1Z+
 xRmczmgPFCPyotjBfxBE8hUW6wlQtHXlIAZzWJYKPfh5g4PeKeOhqyQLgT0P2oHgtFGU
 aHqZQKGwKnzeaHutejSRdL3vGAyeYyF8rFtJXs10CXcn3eIwjxZ+u9dRFKRe0zyTD8Jv
 hWIHkksbTY/cTF/bx0ABQzfAiTFe14rMjderf2P5w/elL4mUmwx+VB1iqbasYG66TAIl
 WBXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rMFcCnZ/wM9/3wt1hACGx89HJdd9LDXvEezUkcsbrAc=;
 b=VMq+Glax/6V5/oluDKH5YRdqOqPtP6F2oSw3UzmefT4qBr//5JhI01GvlsRsxH+5eB
 +8zz7bMEBUuOEdV7XT39z6yIqGs/w/BJOc51sAWtYcVmeBeb0qAb9OaS3R1Pejkerx1b
 YMZ/tH7oAvHI34vul9j1J66jNMrziA0ri+UiVSS/LgMvh/ROgnn8OUCxUarv4Yk2bir3
 qHsNpGFs6wdfcRQ37c2G/vqOzNEtVu440ugQEZ/PdN/fLXUj/YLCMyXx1yYRgyDW0dhe
 iZ/w9D5n3EYzqb+ZKmAvryXLElPRWKuuGHZMsQlslrdUYZg61/JgeJv30w3fL/LPR4QY
 bQGw==
X-Gm-Message-State: AOAM531pFQ+wFxogXQjWm3jUlJ6eg03AkOOOsYYkRLbvNYCBogveQ1je
 w2abENcUPTZDC2yFrKMLlMbwkBwwCnfuOg==
X-Google-Smtp-Source: ABdhPJzIwL2pzBw5DN2vrXw/yrtYS/pcxTCXiMGnS070GG+fSLLC7a6HoxuPmk8AfuuLRf1uDh8mgg==
X-Received: by 2002:a17:902:b402:b029:e3:e880:9748 with SMTP id
 x2-20020a170902b402b02900e3e8809748mr15993241plr.72.1615102701344; 
 Sat, 06 Mar 2021 23:38:21 -0800 (PST)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id j3sm6432140pgk.24.2021.03.06.23.38.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 06 Mar 2021 23:38:20 -0800 (PST)
Subject: Re: [PATCH v3 0/5] m68k: add Virtual M68k Machine
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20210304220104.2574112-1-laurent@vivier.eu>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <bc305dc1-0d6b-9744-52f6-469a0e8409f5@linaro.org>
Date: Sat, 6 Mar 2021 23:38:18 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210304220104.2574112-1-laurent@vivier.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/4/21 2:00 PM, Laurent Vivier wrote:
> Laurent Vivier (5):
>    char: add goldfish-tty
>    intc: add goldfish-pic
>    m68k: add an interrupt controller
>    m68k: add a system controller
>    m68k: add Virtual M68k Machine

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

