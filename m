Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A25FD311F43
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Feb 2021 19:02:55 +0100 (CET)
Received: from localhost ([::1]:49244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8Rv4-0002bb-Os
	for lists+qemu-devel@lfdr.de; Sat, 06 Feb 2021 13:02:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l8RtX-00028B-HF
 for qemu-devel@nongnu.org; Sat, 06 Feb 2021 13:01:19 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:44946)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l8RtU-0006HU-NC
 for qemu-devel@nongnu.org; Sat, 06 Feb 2021 13:01:18 -0500
Received: by mail-wr1-x434.google.com with SMTP id d16so11640226wro.11
 for <qemu-devel@nongnu.org>; Sat, 06 Feb 2021 10:01:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=SZ5sPVaYobbfGWZTtn6UicBv3Zl4erUeKkMMWgyW/mI=;
 b=Zsls3r8M8ut/aj0qW759wC1gxMMjx02yXnLJfaZhDBLM3BLOBEX8S2fibmWlQJ5N/Z
 3Pfg6PQK5gunGfZsS4FIpK+j4ISxk4WXnzXILXNszMxwCaPhrqEtWn0ZucbATNUsxCd4
 bzGStYjSj+tSsEfj5V3xfC3wYccqQkzjQ9Utkx1hsk1gg/5+B5r1bL6hzwL1NDxunxJO
 QPKsBdAXhVKdI0v3LBWjustFZ+pINtZAokOenftM0FoP9dv+IjsTGnH5UL4lKiL8GhtV
 5fPyFidCbN7m/VIIs/MMJgJa6TX0dGC7xPxRTEe55NGz2LQtx0zSTn/lH1mO3wtIzldy
 56EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SZ5sPVaYobbfGWZTtn6UicBv3Zl4erUeKkMMWgyW/mI=;
 b=SI0ybHYPXPkUwRW2Vz7xTkNqngpZK92xEyUw1cm6PKAU44y2hudXWqJCAm5FUmCCxn
 zT6Q/a7A3QHtxgnXsMHp4x3hBhgYP9bc8nYxWaZmXA0q5GvhG1ARZhgQxCu3k1d+/cxd
 VrnS/e9rHbH0fuTVUememULlq5qYICnRnt+zmAZ0/vZ34A1SDcxWsQI93VxlaQCZ5Of4
 1xS4LkxIOtCknlBCzQKwzayaQB8GUmkYpi9/8p3sCFQSSuJLST/S1cyNS2v1P7O1cqpd
 g6daWj1HaZEdnC2cDbJUSzy7SYSxprgBiCs1qKnY39UOmamGWaI59mQ11mE7K+naSGPT
 u5JA==
X-Gm-Message-State: AOAM531pz0FMvp9n6awPq6poYTXLPsG3GNyXoWZL7GhaVnX5nmyygEse
 FGvsP4qKo/qtrQbGTC0zP4I=
X-Google-Smtp-Source: ABdhPJxZPhmzt4mvHNhAdWo9Z8mzDB6TJVhAOTtHEFFrLrs+StFdt0F4l0H7kafVACYgIhC2uA4bvw==
X-Received: by 2002:adf:ee92:: with SMTP id b18mr11206967wro.21.1612634474471; 
 Sat, 06 Feb 2021 10:01:14 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id n10sm17108354wro.39.2021.02.06.10.01.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 06 Feb 2021 10:01:13 -0800 (PST)
Subject: Re: [PULL 04/31] build-system: clean up TCG/TCI configury
To: Paolo Bonzini <pbonzini@redhat.com>, Helge Deller <deller@gmx.de>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
References: <20210123143128.1167797-1-pbonzini@redhat.com>
 <20210123143128.1167797-5-pbonzini@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <90002196-f2db-4ee8-a788-dca667bc63ef@amsat.org>
Date: Sat, 6 Feb 2021 19:01:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210123143128.1167797-5-pbonzini@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.105,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Stefan Weil <sw@weilnetz.de>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/23/21 3:31 PM, Paolo Bonzini wrote:
> Make CONFIG_TCG_INTERPRETER a Meson option, and enable TCI (though with
> a warning) if the host CPU is unsupported, making it more similar to
> other --enable-* options.
> 
> Remove TCG-specific include paths from !CONFIG_TCG builds.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  configure         | 11 +++--------
>  disas/meson.build |  2 --
>  meson.build       | 46 +++++++++++++++++++++++++---------------------
>  meson_options.txt |  2 ++
>  4 files changed, 30 insertions(+), 31 deletions(-)

I spent 2h bisecting until:

23a77b2d18b84e410478e88f11c54911f7a649fc is the first bad commit
commit 23a77b2d18b84e410478e88f11c54911f7a649fc
Author: Paolo Bonzini <pbonzini@redhat.com>
Date:   Mon Dec 14 12:01:45 2020 +0100

    build-system: clean up TCG/TCI configury

    Make CONFIG_TCG_INTERPRETER a Meson option, and enable TCI (though with
    a warning) if the host CPU is unsupported, making it more similar to
    other --enable-* options.

    Remove TCG-specific include paths from !CONFIG_TCG builds.

    Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

to realize I need to re-bisect from here now including:

commit c6fbea47664466e526e40300568324ef77e5f2cc
Author: Richard Henderson <richard.henderson@linaro.org>
Date:   Sun Jan 24 11:10:55 2021 -1000

    configure: Fix --enable-tcg-interpreter

    The configure option was backward, and we failed to
    pass the value on to meson.

    Fixes: 23a77b2d18b ("build-system: clean up TCG/TCI configury")
    Tested-by: Stefan Weil <sw@weilnetz.de>
    Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
    Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
    Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
    Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
    Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Sigh.

